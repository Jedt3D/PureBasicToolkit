import * as vscode from "vscode";
import {
  findBestDefinitionMatch,
  getLookupQuery,
  parsePureBasicNavigation,
  type PureBasicDefinitionEntry,
  type PureBasicNavigationParseResult,
  type PureBasicNavigationSymbol,
  type PureBasicNavigationSymbolKind,
} from "./purebasicNavigationEngine";
import { collectCandidateUris as collectWorkspaceCandidateUris } from "./purebasicWorkspaceContext";

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

    const candidateUris = await collectCandidateUris(document);
    for (const uri of candidateUris) {
      const candidate = await vscode.workspace.openTextDocument(uri);
      const parsed = parsePureBasicNavigation(candidate.getText());
      const match = findBestDefinitionMatch(parsed.definitions, query);
      if (match) {
        return createLocation(candidate.uri, match);
      }
    }

    return undefined;
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
