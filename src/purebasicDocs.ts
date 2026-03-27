import * as fs from "node:fs";
import * as path from "node:path";
import * as vscode from "vscode";

interface PureBasicDocIndexEntry {
  title: string;
  relativeUrl: string;
}

interface PureBasicDocPage {
  title: string;
  relativeUrl: string;
  filePath: string;
  syntax?: string;
  description?: string;
}

export class PureBasicDocsController implements vscode.Disposable {
  private readonly helpRoot: string;
  private readonly indexPath: string;
  private readonly output: vscode.OutputChannel;
  private index = new Map<string, PureBasicDocIndexEntry[]>();
  private pages = new Map<string, PureBasicDocPage>();
  private loaded = false;

  public constructor(extensionPath: string, output: vscode.OutputChannel) {
    this.helpRoot = path.join(extensionPath, "purebasic_help");
    this.indexPath = path.join(this.helpRoot, "index.xml");
    this.output = output;
  }

  public register(context: vscode.ExtensionContext): void {
    context.subscriptions.push(
      vscode.commands.registerCommand("purebasic.openDocsForSymbol", (symbol?: string) => this.openDocsForSymbol(symbol)),
      vscode.languages.registerHoverProvider({ language: "purebasic" }, {
        provideHover: async (document, position) => this.provideHover(document, position),
      }),
      this,
    );
  }

  public dispose(): void {}

  private async openDocsForSymbol(initialSymbol?: string): Promise<void> {
    const resolvedSymbol = initialSymbol?.trim() || getActiveSymbol();
    let doc = resolvedSymbol ? await this.findDoc(resolvedSymbol) : undefined;

    if (!doc) {
      const query = await vscode.window.showInputBox({
        prompt: "Open local PureBasic documentation",
        placeHolder: "Enter a PureBasic command, keyword, or constant",
        value: resolvedSymbol ?? "",
      });

      if (!query) {
        return;
      }

      doc = await this.pickDoc(query);
      if (!doc) {
        void vscode.window.showWarningMessage(`No local PureBasic help entry found for "${query}".`);
        return;
      }
    }

    await vscode.env.openExternal(vscode.Uri.file(doc.filePath));
    this.log(`Opened local docs for ${doc.title}: ${doc.relativeUrl}`);
  }

  private async provideHover(document: vscode.TextDocument, position: vscode.Position): Promise<vscode.Hover | undefined> {
    const symbol = getSymbolAtPosition(document, position);
    if (!symbol) {
      return undefined;
    }

    const doc = await this.findDoc(symbol);
    if (!doc) {
      return undefined;
    }

    const markdown = new vscode.MarkdownString(undefined, true);
    markdown.isTrusted = true;
    markdown.appendMarkdown(`**${escapeMarkdown(doc.title)}**`);

    if (doc.syntax) {
      markdown.appendCodeblock(doc.syntax, "purebasic");
    }

    if (doc.description) {
      markdown.appendMarkdown(`\n${escapeMarkdown(doc.description)}`);
    }

    const commandArgs = encodeURIComponent(JSON.stringify([doc.title]));
    markdown.appendMarkdown(`\n\n[Open full local docs](command:purebasic.openDocsForSymbol?${commandArgs})`);

    return new vscode.Hover(markdown);
  }

  private async pickDoc(query: string): Promise<PureBasicDocPage | undefined> {
    await this.ensureLoaded();

    const directMatch = await this.findDoc(query);
    if (directMatch) {
      return directMatch;
    }

    const normalizedQuery = normalizeSymbol(query);
    const matches = Array.from(this.index.values())
      .flat()
      .filter((entry, index, all) => {
        const isDuplicate = all.findIndex((candidate) => candidate.title === entry.title && candidate.relativeUrl === entry.relativeUrl) !== index;
        return !isDuplicate && normalizeSymbol(entry.title).includes(normalizedQuery);
      })
      .slice(0, 30);

    if (matches.length === 0) {
      return undefined;
    }

    const picked = await vscode.window.showQuickPick(
      matches.map((entry) => ({
        label: entry.title,
        description: entry.relativeUrl,
      })),
      {
        placeHolder: "Select a PureBasic help page",
        matchOnDescription: true,
      },
    );

    if (!picked) {
      return undefined;
    }

    return this.loadDocPage({ title: picked.label, relativeUrl: picked.description ?? "" });
  }

  private async findDoc(symbol: string): Promise<PureBasicDocPage | undefined> {
    await this.ensureLoaded();

    const key = normalizeSymbol(symbol);
    const entries = this.index.get(key);
    if (!entries || entries.length === 0) {
      return undefined;
    }

    const bestEntry = pickBestEntry(entries);
    return this.loadDocPage(bestEntry);
  }

  private async ensureLoaded(): Promise<void> {
    if (this.loaded) {
      return;
    }

    if (!fs.existsSync(this.indexPath)) {
      this.log(`PureBasic help index not found: ${this.indexPath}`);
      this.loaded = true;
      return;
    }

    const xml = fs.readFileSync(this.indexPath, "utf8");
    const matches = xml.matchAll(/<entry\s+title="([^"]+)"\s+url="([^"]+)"\s*\/>/g);

    for (const match of matches) {
      const title = decodeEntities(match[1] ?? "").trim();
      const relativeUrl = decodeEntities(match[2] ?? "").trim();
      if (!title || !relativeUrl) {
        continue;
      }

      const key = normalizeSymbol(title);
      const bucket = this.index.get(key) ?? [];
      bucket.push({ title, relativeUrl });
      this.index.set(key, bucket);
    }

    this.loaded = true;
    this.log(`Loaded ${this.index.size} PureBasic help entries from ${this.indexPath}`);
  }

  private loadDocPage(entry: PureBasicDocIndexEntry): PureBasicDocPage | undefined {
    const cached = this.pages.get(entry.relativeUrl);
    if (cached) {
      return cached;
    }

    const filePath = path.join(this.helpRoot, ...entry.relativeUrl.split("/"));
    if (!fs.existsSync(filePath)) {
      this.log(`Help page missing for ${entry.title}: ${filePath}`);
      return undefined;
    }

    const html = fs.readFileSync(filePath, "utf8");
    const page: PureBasicDocPage = {
      title: decodeEntities(extractTagContent(html, "title") ?? entry.title).trim() || entry.title,
      relativeUrl: entry.relativeUrl,
      filePath,
      syntax: collapseWhitespace(stripHtml(extractBetween(html, '<p><b>Syntax</b></p><blockquote>', "</blockquote>"))),
      description: collapseWhitespace(stripHtml(extractBetween(html, "<b>Description</b><br><blockquote>", "</blockquote>"))),
    };

    this.pages.set(entry.relativeUrl, page);
    return page;
  }

  private log(message: string): void {
    this.output.appendLine(`[${new Date().toLocaleTimeString()}] ${message}`);
  }
}

function getActiveSymbol(): string | undefined {
  const editor = vscode.window.activeTextEditor;
  if (!editor) {
    return undefined;
  }

  const selection = editor.selection;
  if (!selection.isEmpty) {
    return normalizeSymbol(editor.document.getText(selection));
  }

  return getSymbolAtPosition(editor.document, selection.active);
}

function getSymbolAtPosition(document: vscode.TextDocument, position: vscode.Position): string | undefined {
  const line = document.lineAt(position.line).text;
  const regex = /#?[A-Za-z_][A-Za-z0-9_]*(?:\(\))?/g;

  for (const match of line.matchAll(regex)) {
    const symbol = match[0];
    const start = match.index ?? 0;
    const end = start + symbol.length;

    if (position.character >= start && position.character <= end) {
      return normalizeSymbol(symbol);
    }
  }

  return undefined;
}

function normalizeSymbol(value: string): string {
  return value
    .trim()
    .replace(/\(\)$/u, "")
    .replace(/\$$/u, "")
    .toLowerCase();
}

function pickBestEntry(entries: PureBasicDocIndexEntry[]): PureBasicDocIndexEntry {
  return [...entries].sort((left, right) => rankEntry(left) - rankEntry(right))[0];
}

function rankEntry(entry: PureBasicDocIndexEntry): number {
  if (!entry.relativeUrl.startsWith("reference/")) {
    return 0;
  }

  if (entry.relativeUrl.includes("commandindex") || entry.relativeUrl.includes("pbconstants")) {
    return 2;
  }

  return 1;
}

function extractBetween(source: string, startMarker: string, endMarker: string): string | undefined {
  const start = source.indexOf(startMarker);
  if (start < 0) {
    return undefined;
  }

  const end = source.indexOf(endMarker, start + startMarker.length);
  if (end < 0) {
    return undefined;
  }

  return source.slice(start + startMarker.length, end);
}

function extractTagContent(source: string, tagName: string): string | undefined {
  const pattern = new RegExp(`<${tagName}>([\\s\\S]*?)</${tagName}>`, "i");
  const match = pattern.exec(source);
  return match?.[1];
}

function stripHtml(source: string | undefined): string {
  if (!source) {
    return "";
  }

  return decodeEntities(source)
    .replace(/<style[\s\S]*?<\/style>/giu, " ")
    .replace(/<pre[\s\S]*?>([\s\S]*?)<\/pre>/giu, " $1 ")
    .replace(/<br\s*\/?>/giu, " ")
    .replace(/<[^>]+>/gu, " ");
}

function decodeEntities(source: string): string {
  let value = source;
  const replacements: Record<string, string> = {
    "&amp;": "&",
    "&lt;": "<",
    "&gt;": ">",
    "&quot;": "\"",
    "&#39;": "'",
    "&nbsp;": " ",
  };

  while (true) {
    const next = value.replace(/&(amp|lt|gt|quot|#39|nbsp);/gu, (match) => replacements[match] ?? match);
    if (next === value) {
      return value;
    }

    value = next;
  }
}

function collapseWhitespace(source: string): string | undefined {
  const normalized = source.replace(/\s+/gu, " ").trim();
  return normalized || undefined;
}

function escapeMarkdown(value: string): string {
  return value.replace(/[\\`*_{}[\]()#+\-.!|>]/gu, "\\$&");
}
