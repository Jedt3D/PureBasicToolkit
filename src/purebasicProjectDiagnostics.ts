import * as path from "node:path";
import * as fs from "node:fs";
import { parsePureBasicNavigation, type PureBasicDefinitionEntry } from "./purebasicNavigationEngine";
import { type PureBasicDiagnosticFinding } from "./purebasicDiagnosticsEngine";

export interface PureBasicProjectDiagnosticRuleOptions {
  missingIncludeFile: boolean;
  unresolvedUseModule: boolean;
  unresolvedQualifiedSymbol: boolean;
  unresolvedProcedureCall: boolean;
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
  knownBuiltinSymbols: Iterable<string> = [],
): PureBasicDiagnosticFinding[] {
  const findings: PureBasicDiagnosticFinding[] = [];
  const currentLines = current.source.split(/\r?\n/u);
  const definitions = relatedSources.flatMap((source) => parsePureBasicNavigation(source.source).definitions);
  const builtinList = Array.from(knownBuiltinSymbols);
  const builtinSet = new Set(builtinList.map((symbol) => normalizeName(symbol)));

  if (options.missingIncludeFile) {
    findings.push(...findMissingIncludeDiagnostics(current.filePath, currentLines));
  }

  if (options.unresolvedUseModule) {
    findings.push(...findUnresolvedUseModuleDiagnostics(currentLines, definitions));
  }

  if (options.unresolvedQualifiedSymbol) {
    findings.push(...findUnresolvedQualifiedSymbolDiagnostics(currentLines, definitions));
  }

  if (options.unresolvedProcedureCall) {
    findings.push(...findUnresolvedProcedureCallDiagnostics(currentLines, definitions, builtinSet, builtinList));
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

function findUnresolvedProcedureCallDiagnostics(
  lines: string[],
  definitions: PureBasicDefinitionEntry[],
  builtinSymbols: Set<string>,
  builtinList: string[],
): PureBasicDiagnosticFinding[] {
  const findings: PureBasicDiagnosticFinding[] = [];
  const definedNames = new Set(definitions.map((definition) => normalizeName(definition.name)));

  for (let lineIndex = 0; lineIndex < lines.length; lineIndex += 1) {
    const line = stripInlineComment(lines[lineIndex]);
    const seenNames = new Set<string>();

    for (const match of line.matchAll(/\b([A-Za-z_][A-Za-z0-9_]*)\s*\(/g)) {
      const name = match[1];
      const normalized = normalizeName(name);
      const startCharacter = match.index ?? 0;

      if (startCharacter >= 2 && line.slice(startCharacter - 2, startCharacter) === "::") {
        continue;
      }

      if (seenNames.has(normalized) || shouldIgnoreCallName(normalized)) {
        continue;
      }

      seenNames.add(normalized);

      if (definedNames.has(normalized) || builtinSymbols.has(normalized)) {
        continue;
      }

      const suggestion = findClosestBuiltinSymbol(normalized, builtinList);
      const suggestionText = suggestion ? ` Did you mean "${suggestion}"?` : "";
      findings.push({
        code: "unresolved-procedure-call",
        message: `Could not resolve call to ${name}.${suggestionText} Check spelling, missing includes, or local declarations.`,
        severity: "warning",
        line: lineIndex,
        startCharacter,
        endCharacter: startCharacter + name.length,
      });
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

function shouldIgnoreCallName(name: string): boolean {
  return NON_CALL_KEYWORDS.has(name);
}

function findClosestBuiltinSymbol(name: string, builtinList: string[]): string | undefined {
  let bestMatch: string | undefined;
  let bestDistance = Number.POSITIVE_INFINITY;

  for (const candidate of builtinList) {
    const normalizedCandidate = normalizeName(candidate);
    if (Math.abs(normalizedCandidate.length - name.length) > 3 || normalizedCandidate[0] !== name[0]) {
      continue;
    }

    const distance = levenshteinDistance(name, normalizedCandidate);
    if (distance < bestDistance) {
      bestDistance = distance;
      bestMatch = candidate;
    }
  }

  if (bestDistance <= 2) {
    return bestMatch;
  }

  return undefined;
}

function levenshteinDistance(left: string, right: string): number {
  const previous = Array.from({ length: right.length + 1 }, (_, index) => index);
  const current = new Array(right.length + 1).fill(0);

  for (let leftIndex = 1; leftIndex <= left.length; leftIndex += 1) {
    current[0] = leftIndex;

    for (let rightIndex = 1; rightIndex <= right.length; rightIndex += 1) {
      const substitutionCost = left[leftIndex - 1] === right[rightIndex - 1] ? 0 : 1;
      current[rightIndex] = Math.min(
        current[rightIndex - 1] + 1,
        previous[rightIndex] + 1,
        previous[rightIndex - 1] + substitutionCost,
      );
    }

    for (let index = 0; index < previous.length; index += 1) {
      previous[index] = current[index];
    }
  }

  return previous[right.length];
}

const NON_CALL_KEYWORDS = new Set([
  "if",
  "elseif",
  "while",
  "until",
  "for",
  "foreach",
  "select",
  "case",
  "default",
  "procedure",
  "procedurec",
  "proceduredll",
  "procedurecdll",
  "declare",
  "declarec",
  "declaredll",
  "declarecdll",
  "macro",
  "debug",
]);

function resolveIncludeFsPath(baseFilePath: string, includePath: string): string {
  return path.resolve(path.dirname(baseFilePath), includePath);
}
