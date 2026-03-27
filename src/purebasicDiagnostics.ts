import * as path from "node:path";
import * as vscode from "vscode";
import { analyzePureBasicSource, type PureBasicDiagnosticRuleOptions, type PureBasicDiagnosticFinding } from "./purebasicDiagnosticsEngine";
import { analyzePureBasicProjectContext, type PureBasicProjectDiagnosticRuleOptions } from "./purebasicProjectDiagnostics";
import { collectCandidateUris } from "./purebasicWorkspaceContext";
import { loadPureBasicKnownSymbols } from "./purebasicHelpIndex";

export class PureBasicDiagnosticsController implements vscode.Disposable {
  private readonly output: vscode.OutputChannel;
  private readonly collection: vscode.DiagnosticCollection;
  private readonly knownBuiltinSymbols: string[];

  public constructor(extensionPath: string, output: vscode.OutputChannel) {
    this.output = output;
    this.collection = vscode.languages.createDiagnosticCollection("purebasic");
    this.knownBuiltinSymbols = loadPureBasicKnownSymbols(extensionPath);
  }

  public register(context: vscode.ExtensionContext): void {
    context.subscriptions.push(
      this.collection,
      vscode.workspace.onDidOpenTextDocument((document) => void this.refreshDocument(document)),
      vscode.workspace.onDidChangeTextDocument((event) => void this.refreshDocument(event.document)),
      vscode.workspace.onDidCloseTextDocument((document) => this.collection.delete(document.uri)),
      vscode.workspace.onDidChangeConfiguration((event) => this.handleConfigurationChange(event)),
      this,
    );

    for (const document of vscode.workspace.textDocuments) {
      void this.refreshDocument(document);
    }
  }

  public dispose(): void {
    this.collection.dispose();
  }

  private handleConfigurationChange(event: vscode.ConfigurationChangeEvent): void {
    if (!event.affectsConfiguration("purebasic")) {
      return;
    }

    this.log("PureBasic diagnostics configuration changed. Refreshing open documents.");
    for (const document of vscode.workspace.textDocuments) {
      void this.refreshDocument(document);
    }
  }

  private async refreshDocument(document: vscode.TextDocument): Promise<void> {
    if (!isPureBasicSourceDocument(document)) {
      this.collection.delete(document.uri);
      return;
    }

    const config = vscode.workspace.getConfiguration("purebasic");
    if (!config.get<boolean>("diagnostics.enabled", true)) {
      this.collection.delete(document.uri);
      return;
    }

    const findings = analyzePureBasicSource(document.getText(), this.getRuleOptions(config));
    const projectFindings = await this.getProjectAwareFindings(document, config);
    const allFindings = [...findings, ...projectFindings];
    const diagnostics = allFindings.map((finding) => createDiagnostic(document, finding));
    this.collection.set(document.uri, diagnostics);
  }

  private getRuleOptions(config: vscode.WorkspaceConfiguration): PureBasicDiagnosticRuleOptions {
    return {
      requireEnableExplicit: config.get<boolean>("diagnostics.requireEnableExplicit", true),
      consoleExecutableFormatHint: config.get<boolean>("diagnostics.consoleExecutableFormatHint", true),
      preferXIncludeFile: config.get<boolean>("diagnostics.preferXIncludeFile", true),
    };
  }

  private getProjectRuleOptions(config: vscode.WorkspaceConfiguration): PureBasicProjectDiagnosticRuleOptions {
    return {
      missingIncludeFile: config.get<boolean>("diagnostics.missingIncludeFile", true),
      unresolvedUseModule: config.get<boolean>("diagnostics.unresolvedUseModule", true),
      unresolvedQualifiedSymbol: config.get<boolean>("diagnostics.unresolvedQualifiedSymbol", true),
      unresolvedProcedureCall: config.get<boolean>("diagnostics.unresolvedProcedureCall", true),
    };
  }

  private async getProjectAwareFindings(
    document: vscode.TextDocument,
    config: vscode.WorkspaceConfiguration,
  ): Promise<PureBasicDiagnosticFinding[]> {
    const options = this.getProjectRuleOptions(config);
    if (!options.missingIncludeFile && !options.unresolvedUseModule && !options.unresolvedQualifiedSymbol && !options.unresolvedProcedureCall) {
      return [];
    }

    const candidateUris = await collectCandidateUris(document, 120);
    const relatedSources = await Promise.all(
      candidateUris.map(async (uri) => {
        const candidate = uri.fsPath === document.uri.fsPath ? document : await vscode.workspace.openTextDocument(uri);
        return {
          filePath: candidate.fileName,
          source: candidate.getText(),
        };
      }),
    );

    return analyzePureBasicProjectContext(
      {
        filePath: document.fileName,
        source: document.getText(),
      },
      relatedSources,
      options,
      this.knownBuiltinSymbols,
    );
  }

  private log(message: string): void {
    this.output.appendLine(`[${new Date().toLocaleTimeString()}] ${message}`);
  }
}

function isPureBasicSourceDocument(document: vscode.TextDocument): boolean {
  if (document.uri.scheme !== "file") {
    return false;
  }

  if (document.languageId === "purebasic") {
    return path.extname(document.fileName).toLowerCase() !== ".pbp";
  }

  const extension = path.extname(document.fileName).toLowerCase();
  return extension === ".pb" || extension === ".pbi";
}

function createDiagnostic(document: vscode.TextDocument, finding: PureBasicDiagnosticFinding): vscode.Diagnostic {
  const line = Math.min(finding.line, Math.max(document.lineCount - 1, 0));
  const lineText = document.lineAt(line).text;
  const startCharacter = clampCharacter(finding.startCharacter, lineText.length);
  const requestedEnd = lineText.length === 0 ? 0 : Math.max(finding.endCharacter, startCharacter + 1);
  const endCharacter = clampCharacter(requestedEnd, lineText.length);
  const range = new vscode.Range(line, startCharacter, line, Math.max(startCharacter, endCharacter));
  const diagnostic = new vscode.Diagnostic(range, finding.message, toVsCodeSeverity(finding.severity));
  diagnostic.source = "PureBasic Toolkit";
  diagnostic.code = finding.code;
  return diagnostic;
}

function clampCharacter(value: number, lineLength: number): number {
  return Math.max(0, Math.min(value, lineLength));
}

function toVsCodeSeverity(severity: PureBasicDiagnosticFinding["severity"]): vscode.DiagnosticSeverity {
  switch (severity) {
    case "warning":
      return vscode.DiagnosticSeverity.Warning;
    case "hint":
      return vscode.DiagnosticSeverity.Hint;
    case "information":
    default:
      return vscode.DiagnosticSeverity.Information;
  }
}
