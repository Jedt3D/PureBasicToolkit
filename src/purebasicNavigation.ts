import * as vscode from "vscode";
import {
  findBestDefinitionMatch,
  getLookupQuery,
  parsePureBasicNavigation,
  type PureBasicDefinitionEntry,
  type PureBasicNavigationSymbol,
  type PureBasicNavigationSymbolKind,
} from "./purebasicNavigationEngine";
import {
  collectCandidateUris as collectWorkspaceCandidateUris,
  collectWorkspacePureBasicUris,
} from "./purebasicWorkspaceContext";
import { normalizeWorkspaceSymbolQuery, scoreWorkspaceDefinition } from "./purebasicWorkspaceSymbols";

export class PureBasicNavigationController implements vscode.Disposable {
  private readonly output: vscode.OutputChannel;

  public constructor(output: vscode.OutputChannel) {
    this.output = output;
  }

  public register(context: vscode.ExtensionContext): void {
    context.subscriptions.push(
      vscode.languages.registerDocumentSymbolProvider({ language: "purebasic" }, {
        provideDocumentSymbols: (document) => this.provideDocumentSymbols(document),
      }),
      vscode.languages.registerDefinitionProvider({ language: "purebasic" }, {
        provideDefinition: (document, position) => this.provideDefinition(document, position),
      }),
      vscode.languages.registerWorkspaceSymbolProvider({
        provideWorkspaceSymbols: (query) => this.provideWorkspaceSymbols(query),
      }),
      this,
    );
  }

  public dispose(): void {}

  private provideDocumentSymbols(document: vscode.TextDocument): vscode.DocumentSymbol[] {
    const parsed = parsePureBasicNavigation(document.getText());
    return parsed.symbols.map((symbol) => toDocumentSymbol(document, symbol));
  }

  private async provideDefinition(
    document: vscode.TextDocument,
    position: vscode.Position,
  ): Promise<vscode.Definition | undefined> {
    const query = getLookupQuery(document.lineAt(position.line).text, position.character);
    if (!query) {
      return undefined;
    }

    const searched = new Set<string>();

    const candidateUris = await collectCandidateUris(document);
    for (const uri of candidateUris) {
      searched.add(uri.fsPath);
      const candidate = await vscode.workspace.openTextDocument(uri);
      const parsed = parsePureBasicNavigation(candidate.getText());
      const match = findBestDefinitionMatch(parsed.definitions, query);
      if (match) {
        return createLocation(candidate.uri, match);
      }
    }

    const workspaceUris = await collectWorkspacePureBasicUris(500);
    for (const uri of workspaceUris) {
      if (searched.has(uri.fsPath)) {
        continue;
      }

      const candidate = await vscode.workspace.openTextDocument(uri);
      const parsed = parsePureBasicNavigation(candidate.getText());
      const match = findBestDefinitionMatch(parsed.definitions, query);
      if (match) {
        return createLocation(candidate.uri, match);
      }
    }

    return undefined;
  }

  private async provideWorkspaceSymbols(query: string): Promise<vscode.SymbolInformation[]> {
    const normalizedQuery = normalizeWorkspaceSymbolQuery(query);
    if (!normalizedQuery) {
      return [];
    }

    const uris = await collectWorkspacePureBasicUris(500);
    const matches: WorkspaceSymbolMatch[] = [];

    for (const uri of uris) {
      const document = await vscode.workspace.openTextDocument(uri);
      const parsed = parsePureBasicNavigation(document.getText());

      for (const definition of parsed.definitions) {
        const score = scoreWorkspaceDefinition(definition, normalizedQuery);
        if (score === 0) {
          continue;
        }

        matches.push({ uri, definition, score });
      }
    }

    matches.sort(compareWorkspaceSymbolMatches);
    return matches.slice(0, 100).map((match) => createWorkspaceSymbol(match));
  }
}

async function collectCandidateUris(document: vscode.TextDocument): Promise<vscode.Uri[]> {
  return await collectWorkspaceCandidateUris(document, 200);
}

function createLocation(uri: vscode.Uri, definition: PureBasicDefinitionEntry): vscode.Location {
  return new vscode.Location(
    uri,
    new vscode.Range(definition.line, definition.startCharacter, definition.line, definition.endCharacter),
  );
}

function toDocumentSymbol(document: vscode.TextDocument, symbol: PureBasicNavigationSymbol): vscode.DocumentSymbol {
  const startLine = clampLine(symbol.startLine, document.lineCount);
  const endLine = clampLine(symbol.endLine, document.lineCount);
  const startText = document.lineAt(startLine).text;
  const endText = document.lineAt(endLine).text;

  const range = new vscode.Range(
    startLine,
    0,
    endLine,
    endLine === startLine ? endText.length : Math.max(endText.length, 0),
  );
  const selectionRange = new vscode.Range(
    startLine,
    Math.min(symbol.selectionStartCharacter, startText.length),
    startLine,
    Math.min(symbol.selectionEndCharacter, startText.length),
  );
  const documentSymbol = new vscode.DocumentSymbol(
    symbol.name,
    symbol.detail ?? "",
    toSymbolKind(symbol.kind),
    range,
    selectionRange,
  );

  documentSymbol.children = symbol.children.map((child) => toDocumentSymbol(document, child));
  return documentSymbol;
}

function createWorkspaceSymbol(match: WorkspaceSymbolMatch): vscode.SymbolInformation {
  const location = createLocation(match.uri, match.definition);
  const containerName = match.definition.moduleName ?? pathBasenameWithoutExtension(match.uri);
  return new vscode.SymbolInformation(
    match.definition.name,
    toSymbolKind(match.definition.kind),
    containerName,
    location,
  );
}

function toSymbolKind(kind: PureBasicNavigationSymbolKind): vscode.SymbolKind {
  switch (kind) {
    case "module":
    case "declareModule":
      return vscode.SymbolKind.Module;
    case "structure":
      return vscode.SymbolKind.Struct;
    case "enumeration":
      return vscode.SymbolKind.Enum;
    case "interface":
      return vscode.SymbolKind.Interface;
    case "macro":
      return vscode.SymbolKind.Function;
    case "declare":
      return vscode.SymbolKind.Method;
    case "procedure":
    default:
      return vscode.SymbolKind.Function;
  }
}

function clampLine(line: number, lineCount: number): number {
  return Math.max(0, Math.min(line, Math.max(lineCount - 1, 0)));
}

function compareWorkspaceSymbolMatches(left: WorkspaceSymbolMatch, right: WorkspaceSymbolMatch): number {
  if (left.score !== right.score) {
    return right.score - left.score;
  }

  const leftQualified = `${left.definition.moduleName ?? ""}::${left.definition.name}`.toLowerCase();
  const rightQualified = `${right.definition.moduleName ?? ""}::${right.definition.name}`.toLowerCase();
  const byName = leftQualified.localeCompare(rightQualified);
  if (byName !== 0) {
    return byName;
  }

  return left.uri.fsPath.localeCompare(right.uri.fsPath);
}

function pathBasenameWithoutExtension(uri: vscode.Uri): string {
  const segments = uri.path.split("/");
  const fileName = segments[segments.length - 1] ?? uri.fsPath;
  return fileName.replace(/\.[^.]+$/, "");
}

interface WorkspaceSymbolMatch {
  uri: vscode.Uri;
  definition: PureBasicDefinitionEntry;
  score: number;
}
