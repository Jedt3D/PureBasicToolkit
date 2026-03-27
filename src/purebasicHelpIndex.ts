import * as fs from "node:fs";
import * as path from "node:path";

export function loadPureBasicKnownSymbols(extensionPath: string): string[] {
  const helpIndexPath = path.join(extensionPath, "purebasic_help", "index.xml");
  if (!fs.existsSync(helpIndexPath)) {
    return [];
  }

  const xml = fs.readFileSync(helpIndexPath, "utf8");
  const knownSymbols = new Map<string, string>();
  const matches = xml.matchAll(/<entry\s+title="([^"]+)"\s+url="([^"]+)"\s*\/>/g);

  for (const match of matches) {
    const title = decodeEntities(match[1] ?? "").trim();
    if (!title) {
      continue;
    }

    const normalized = normalizePureBasicSymbol(title);
    if (!knownSymbols.has(normalized)) {
      knownSymbols.set(normalized, title);
    }
  }

  return Array.from(knownSymbols.values());
}

export function normalizePureBasicSymbol(value: string): string {
  return value
    .trim()
    .replace(/\(\)$/u, "")
    .replace(/\$$/u, "")
    .toLowerCase();
}

function decodeEntities(value: string): string {
  return value
    .replace(/&quot;/gu, "\"")
    .replace(/&amp;/gu, "&")
    .replace(/&lt;/gu, "<")
    .replace(/&gt;/gu, ">");
}
