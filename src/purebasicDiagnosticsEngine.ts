export type PureBasicDiagnosticSeverity = "warning" | "information" | "hint";

export interface PureBasicDiagnosticRuleOptions {
  requireEnableExplicit: boolean;
  consoleExecutableFormatHint: boolean;
  preferXIncludeFile: boolean;
}

export interface PureBasicDiagnosticFinding {
  code: string;
  message: string;
  severity: PureBasicDiagnosticSeverity;
  line: number;
  startCharacter: number;
  endCharacter: number;
}

const DEFAULT_RULE_OPTIONS: PureBasicDiagnosticRuleOptions = {
  requireEnableExplicit: true,
  consoleExecutableFormatHint: true,
  preferXIncludeFile: true,
};

const CONSOLE_API_PATTERN = /\b(OpenConsole|CloseConsole|PrintN?|Input|Inkey|ConsoleTitle|ConsoleColor|ClearConsole|ReadConsoleData|ReadConsoleKey|ConsoleCursor[XY]?)\b/i;
const INCLUDE_FILE_PATTERN = /\bIncludeFile\b\s+"[^"]+\.pbi"/i;

export function analyzePureBasicSource(
  source: string,
  options: Partial<PureBasicDiagnosticRuleOptions> = {},
): PureBasicDiagnosticFinding[] {
  const resolvedOptions: PureBasicDiagnosticRuleOptions = {
    ...DEFAULT_RULE_OPTIONS,
    ...options,
  };
  const findings: PureBasicDiagnosticFinding[] = [];
  const lines = source.split(/\r?\n/u);

  if (resolvedOptions.requireEnableExplicit) {
    const hasEnableExplicit = lines.some((line) => /^\s*EnableExplicit\b/i.test(stripInlineComment(line)));
    if (!hasEnableExplicit) {
      const fallbackLine = findFirstMeaningfulLine(lines);
      findings.push({
        code: "missing-enableexplicit",
        message: "EnableExplicit is not enabled. PureBasic Toolkit recommends EnableExplicit for safer variable handling.",
        severity: "information",
        line: fallbackLine,
        startCharacter: 0,
        endCharacter: Math.max(lines[fallbackLine]?.length ?? 0, 1),
      });
    }
  }

  if (resolvedOptions.consoleExecutableFormatHint) {
    const consoleMatch = findFirstMatch(lines, CONSOLE_API_PATTERN);
    if (consoleMatch) {
      findings.push({
        code: "console-executable-format",
        message: "Console APIs detected. In the PureBasic IDE, use Compiler > Compiler Options > Executable Format = Console.",
        severity: "hint",
        line: consoleMatch.line,
        startCharacter: consoleMatch.startCharacter,
        endCharacter: consoleMatch.endCharacter,
      });
    }
  }

  if (resolvedOptions.preferXIncludeFile) {
    for (const match of findAllMatches(lines, INCLUDE_FILE_PATTERN)) {
      findings.push({
        code: "prefer-xincludefile",
        message: "Prefer XIncludeFile for shared .pbi files so includes resolve more safely across larger projects.",
        severity: "information",
        line: match.line,
        startCharacter: match.startCharacter,
        endCharacter: match.endCharacter,
      });
    }
  }

  return findings;
}

function findFirstMeaningfulLine(lines: string[]): number {
  const index = lines.findIndex((line) => stripInlineComment(line).trim().length > 0);
  return index >= 0 ? index : 0;
}

function findFirstMatch(lines: string[], pattern: RegExp): MatchLocation | undefined {
  for (let index = 0; index < lines.length; index += 1) {
    const code = stripInlineComment(lines[index]);
    const match = pattern.exec(code);
    if (match) {
      return {
        line: index,
        startCharacter: match.index ?? 0,
        endCharacter: (match.index ?? 0) + match[0].length,
      };
    }
  }

  return undefined;
}

function findAllMatches(lines: string[], pattern: RegExp): MatchLocation[] {
  const matches: MatchLocation[] = [];

  for (let index = 0; index < lines.length; index += 1) {
    const code = stripInlineComment(lines[index]);
    const match = pattern.exec(code);
    if (match) {
      matches.push({
        line: index,
        startCharacter: match.index ?? 0,
        endCharacter: (match.index ?? 0) + match[0].length,
      });
    }
  }

  return matches;
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

interface MatchLocation {
  line: number;
  startCharacter: number;
  endCharacter: number;
}
