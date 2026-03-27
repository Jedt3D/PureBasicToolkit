import * as path from "node:path";
import * as fs from "node:fs";
import { parsePureBasicNavigation, type PureBasicDefinitionEntry } from "./purebasicNavigationEngine";
import { type PureBasicDiagnosticFinding } from "./purebasicDiagnosticsEngine";

export interface PureBasicProjectDiagnosticRuleOptions {
  missingIncludeFile: boolean;
  unresolvedUseModule: boolean;
  unresolvedQualifiedSymbol: boolean;
}

export interface PureBasicProjectContextSource {
  filePath: string;
  source: string;
}

const USE_MODULE_PATTERN = /^\s*UseModule\s+([A-Za-z_][A-Za-z0-9_]*)\b/i;
const INCLUDE_PATTERN = /\b(?:XIncludeFile|IncludeFile)\b\s+"([^"]+)"/i;
const QUALIFIED_SYMBOL_PATTERN = /\b([A-Za-z_][A-Za-z0-9_]*)::([A-Za-z_][A-Za-z0-9_]*)\b/g;

export function analyzePureBasicProjectContext(
  current: PureBasicProjectContextSource,
  relatedSources: PureBasicProjectContextSource[],
  options: PureBasicProjectDiagnosticRuleOptions,
): PureBasicDiagnosticFinding[] {
  const findings: PureBasicDiagnosticFinding[] = [];
  const currentLines = current.source.split(/\r?\n/u);
  const definitions = relatedSources.flatMap((source) => parsePureBasicNavigation(source.source).definitions);

  if (options.missingIncludeFile) {
    findings.push(...findMissingIncludeDiagnostics(current.filePath, currentLines));
  }

  if (options.unresolvedUseModule) {
    findings.push(...findUnresolvedUseModuleDiagnostics(currentLines, definitions));
  }

  if (options.unresolvedQualifiedSymbol) {
    findings.push(...findUnresolvedQualifiedSymbolDiagnostics(currentLines, definitions));
  }

  return findings;
}

function findMissingIncludeDiagnostics(filePath: string, lines: string[]): PureBasicDiagnosticFinding[] {
  const findings: PureBasicDiagnosticFinding[] = [];

  for (let lineIndex = 0; lineIndex < lines.length; lineIndex += 1) {
    const line = stripInlineComment(lines[lineIndex]);
    const match = INCLUDE_PATTERN.exec(line);
    if (!match) {
      continue;
    }

    const includePath = match[1];
    const resolved = resolveIncludeFsPath(filePath, includePath);
    if (!fs.existsSync(resolved)) {
      const startCharacter = (match.index ?? 0) + line.slice(match.index ?? 0).indexOf(includePath);
      findings.push({
        code: "missing-include-file",
        message: `Included file not found: ${includePath}`,
        severity: "warning",
        line: lineIndex,
        startCharacter,
        endCharacter: startCharacter + includePath.length,
      });
    }
  }

  return findings;
}

function findUnresolvedUseModuleDiagnostics(
  lines: string[],
  definitions: PureBasicDefinitionEntry[],
): PureBasicDiagnosticFinding[] {
  const findings: PureBasicDiagnosticFinding[] = [];

  for (let lineIndex = 0; lineIndex < lines.length; lineIndex += 1) {
    const line = stripInlineComment(lines[lineIndex]);
    const match = USE_MODULE_PATTERN.exec(line);
    if (!match) {
      continue;
    }

    const moduleName = match[1];
    const resolved = definitions.some(
      (definition) =>
        normalizeName(definition.name) === normalizeName(moduleName) &&
        (definition.kind === "module" || definition.kind === "declareModule"),
    );

    if (!resolved) {
      const startCharacter = (match.index ?? 0) + line.slice(match.index ?? 0).indexOf(moduleName);
      findings.push({
        code: "unresolved-usemodule",
        message: `UseModule target "${moduleName}" was not found in the current file, linked includes, or workspace scan.`,
        severity: "warning",
        line: lineIndex,
        startCharacter,
        endCharacter: startCharacter + moduleName.length,
      });
    }
  }

  return findings;
}

function findUnresolvedQualifiedSymbolDiagnostics(
  lines: string[],
  definitions: PureBasicDefinitionEntry[],
): PureBasicDiagnosticFinding[] {
  const findings: PureBasicDiagnosticFinding[] = [];

  for (let lineIndex = 0; lineIndex < lines.length; lineIndex += 1) {
    const line = stripInlineComment(lines[lineIndex]);
    for (const match of line.matchAll(QUALIFIED_SYMBOL_PATTERN)) {
      const moduleName = match[1];
      const symbolName = match[2];
      const resolved = definitions.some(
        (definition) =>
          normalizeName(definition.name) === normalizeName(symbolName) &&
          normalizeName(definition.moduleName ?? "") === normalizeName(moduleName),
      );

      if (!resolved) {
        const startCharacter = (match.index ?? 0) + moduleName.length + 2;
        findings.push({
          code: "unresolved-qualified-symbol",
          message: `Could not resolve ${moduleName}::${symbolName} in the current file, linked includes, or workspace scan.`,
          severity: "warning",
          line: lineIndex,
          startCharacter,
          endCharacter: startCharacter + symbolName.length,
        });
      }
    }
  }

  return findings;
}

function stripInlineComment(line: string): string {
  let inString = false;

  for (let index = 0; index < line.length; index += 1) {
    const character = line[index];
    if (character === "\"") {
      inString = !inString;
      continue;
    }

    if (!inString && character === ";") {
      return line.slice(0, index);
    }
  }

  return line;
}

function normalizeName(value: string): string {
  return value.trim().toLowerCase();
}

function resolveIncludeFsPath(baseFilePath: string, includePath: string): string {
  return path.resolve(path.dirname(baseFilePath), includePath);
}
