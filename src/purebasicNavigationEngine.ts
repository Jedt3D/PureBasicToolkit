export interface PureBasicNavigationParseResult {
  symbols: PureBasicNavigationSymbol[];
  definitions: PureBasicDefinitionEntry[];
  includePaths: string[];
}

export interface PureBasicNavigationSymbol {
  kind: PureBasicNavigationSymbolKind;
  name: string;
  detail?: string;
  startLine: number;
  endLine: number;
  selectionStartCharacter: number;
  selectionEndCharacter: number;
  children: PureBasicNavigationSymbol[];
}

export interface PureBasicDefinitionEntry {
  kind: PureBasicNavigationDefinitionKind;
  name: string;
  moduleName?: string;
  line: number;
  startCharacter: number;
  endCharacter: number;
}

export interface PureBasicLookupQuery {
  fullText: string;
  symbolName: string;
  moduleName?: string;
  target: "qualifiedSymbol" | "module" | "symbol";
}

type ContainerKind =
  | "procedure"
  | "module"
  | "declareModule"
  | "structure"
  | "enumeration"
  | "macro"
  | "interface";

export type PureBasicNavigationSymbolKind =
  | "procedure"
  | "module"
  | "declareModule"
  | "structure"
  | "enumeration"
  | "macro"
  | "interface"
  | "declare";

export type PureBasicNavigationDefinitionKind =
  | "procedure"
  | "declare"
  | "module"
  | "declareModule"
  | "structure"
  | "enumeration"
  | "macro"
  | "interface";

interface SymbolStartMatch {
  kind: ContainerKind;
  name: string;
  detail?: string;
  selectionStartCharacter: number;
  selectionEndCharacter: number;
}

interface StackEntry {
  kind: ContainerKind;
  symbol: PureBasicNavigationSymbol;
}

const QUALIFIED_SYMBOL_PATTERN = /[A-Za-z_][A-Za-z0-9_]*(?:::[A-Za-z_][A-Za-z0-9_]*)?/g;
const INCLUDE_PATTERN = /\b(?:XIncludeFile|IncludeFile)\b\s+"([^"]+)"/i;
const DECLARE_PATTERN = /^\s*Declare(?:C|CDLL|DLL)?(?:\.[A-Za-z]+)?\s+([A-Za-z_][A-Za-z0-9_]*)\s*(\([^)]*\))?/i;
const PROCEDURE_PATTERN = /^\s*Procedure(?:C|CDLL|DLL)?(?:\.[A-Za-z]+)?\s+([A-Za-z_][A-Za-z0-9_]*)\s*(\([^)]*\))?/i;
const MODULE_PATTERN = /^\s*Module\s+([A-Za-z_][A-Za-z0-9_]*)\b/i;
const DECLARE_MODULE_PATTERN = /^\s*DeclareModule\s+([A-Za-z_][A-Za-z0-9_]*)\b/i;
const STRUCTURE_PATTERN = /^\s*(Structure(?:Union)?)\s+([A-Za-z_][A-Za-z0-9_]*)\b/i;
const ENUMERATION_PATTERN = /^\s*(Enumeration(?:Binary)?)\b(?:\s+([A-Za-z_][A-Za-z0-9_]*))?/i;
const MACRO_PATTERN = /^\s*Macro\s+([A-Za-z_][A-Za-z0-9_]*)\b/i;
const INTERFACE_PATTERN = /^\s*Interface\s+([A-Za-z_][A-Za-z0-9_]*)\b/i;

export function parsePureBasicNavigation(source: string): PureBasicNavigationParseResult {
  const lines = source.split(/\r?\n/u);
  const roots: PureBasicNavigationSymbol[] = [];
  const definitions: PureBasicDefinitionEntry[] = [];
  const includePaths: string[] = [];
  const stack: StackEntry[] = [];

  for (let index = 0; index < lines.length; index += 1) {
    const rawLine = lines[index];
    const line = stripInlineComment(rawLine);
    const trimmed = line.trim();

    if (!trimmed) {
      continue;
    }

    const endKind = matchEndKind(trimmed);
    if (endKind) {
      closeNearestContainer(stack, endKind, index);
      continue;
    }

    const includeMatch = INCLUDE_PATTERN.exec(line);
    if (includeMatch) {
      includePaths.push(includeMatch[1]);
    }

    const container = matchContainerStart(line);
    if (container) {
      const symbol: PureBasicNavigationSymbol = {
        kind: container.kind,
        name: container.name,
        detail: container.detail,
        startLine: index,
        endLine: index,
        selectionStartCharacter: container.selectionStartCharacter,
        selectionEndCharacter: container.selectionEndCharacter,
        children: [],
      };

      addSymbol(roots, stack, symbol);
      stack.push({ kind: container.kind, symbol });

      definitions.push({
        kind: container.kind,
        name: container.name,
        moduleName: container.kind === "procedure" ? getActiveModuleName(stack) : undefined,
        line: index,
        startCharacter: container.selectionStartCharacter,
        endCharacter: container.selectionEndCharacter,
      });
      continue;
    }

    const declare = DECLARE_PATTERN.exec(line);
    if (declare) {
      const name = declare[1];
      const startCharacter = declare.index + line.slice(declare.index).indexOf(name);
      const detail = declare[2]?.trim();
      const declareSymbol: PureBasicNavigationSymbol = {
        kind: "declare",
        name,
        detail,
        startLine: index,
        endLine: index,
        selectionStartCharacter: startCharacter,
        selectionEndCharacter: startCharacter + name.length,
        children: [],
      };

      if (isInsideDeclareModule(stack)) {
        addSymbol(roots, stack, declareSymbol);
      }

      definitions.push({
        kind: "declare",
        name,
        moduleName: getActiveModuleName(stack),
        line: index,
        startCharacter,
        endCharacter: startCharacter + name.length,
      });
      continue;
    }
  }

  const lastLine = Math.max(lines.length - 1, 0);
  while (stack.length > 0) {
    const entry = stack.pop();
    if (entry) {
      entry.symbol.endLine = Math.max(entry.symbol.endLine, lastLine);
    }
  }

  return {
    symbols: roots,
    definitions,
    includePaths: Array.from(new Set(includePaths)),
  };
}

export function getLookupQuery(lineText: string, character: number): PureBasicLookupQuery | undefined {
  for (const match of lineText.matchAll(QUALIFIED_SYMBOL_PATTERN)) {
    const text = match[0];
    const startCharacter = match.index ?? 0;
    const endCharacter = startCharacter + text.length;

    if (character >= startCharacter && character <= endCharacter) {
      if (text.includes("::")) {
        const [moduleName, symbolName] = text.split("::");
        const boundary = startCharacter + moduleName.length;
        return {
          fullText: text,
          symbolName: character <= boundary ? moduleName : symbolName,
          moduleName: character <= boundary ? undefined : moduleName,
          target: character <= boundary ? "module" : "qualifiedSymbol",
        };
      }

      return {
        fullText: text,
        symbolName: text,
        target: "symbol",
      };
    }
  }

  return undefined;
}

export function findBestDefinitionMatch(
  definitions: PureBasicDefinitionEntry[],
  query: PureBasicLookupQuery,
): PureBasicDefinitionEntry | undefined {
  const normalizedSymbol = normalizeName(query.symbolName);
  const normalizedModule = query.moduleName ? normalizeName(query.moduleName) : undefined;

  const exactMatches = definitions.filter((entry) => {
    if (normalizeName(entry.name) !== normalizedSymbol) {
      return false;
    }

    if (query.target === "module") {
      return entry.kind === "module" || entry.kind === "declareModule";
    }

    if (!normalizedModule) {
      return true;
    }

    return normalizeName(entry.moduleName ?? "") === normalizedModule;
  });

  if (exactMatches.length > 0) {
    return [...exactMatches].sort(compareDefinitionEntries)[0];
  }

  if (query.target === "qualifiedSymbol" && normalizedModule) {
    const moduleOnly = definitions.filter(
      (entry) => normalizeName(entry.name) === normalizedModule && (entry.kind === "module" || entry.kind === "declareModule"),
    );
    if (moduleOnly.length > 0) {
      return [...moduleOnly].sort(compareDefinitionEntries)[0];
    }
  }

  return undefined;
}

function addSymbol(
  roots: PureBasicNavigationSymbol[],
  stack: StackEntry[],
  symbol: PureBasicNavigationSymbol,
): void {
  const parent = stack[stack.length - 1];
  if (parent) {
    parent.symbol.children.push(symbol);
    parent.symbol.endLine = Math.max(parent.symbol.endLine, symbol.endLine);
  } else {
    roots.push(symbol);
  }
}

function closeNearestContainer(stack: StackEntry[], endKind: ContainerKind, line: number): void {
  for (let index = stack.length - 1; index >= 0; index -= 1) {
    if (stack[index].kind === endKind) {
      const entry = stack.splice(index, 1)[0];
      entry.symbol.endLine = Math.max(entry.symbol.endLine, line);
      return;
    }
  }
}

function isInsideDeclareModule(stack: StackEntry[]): boolean {
  return stack.some((entry) => entry.kind === "declareModule");
}

function getActiveModuleName(stack: StackEntry[]): string | undefined {
  for (let index = stack.length - 1; index >= 0; index -= 1) {
    const kind = stack[index].kind;
    if (kind === "module" || kind === "declareModule") {
      return stack[index].symbol.name;
    }
  }

  return undefined;
}

function matchContainerStart(line: string): SymbolStartMatch | undefined {
  const procedure = PROCEDURE_PATTERN.exec(line);
  if (procedure) {
    const name = procedure[1];
    const startCharacter = procedure.index + line.slice(procedure.index).indexOf(name);
    return {
      kind: "procedure",
      name,
      detail: procedure[2]?.trim(),
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  const declareModule = DECLARE_MODULE_PATTERN.exec(line);
  if (declareModule) {
    const name = declareModule[1];
    const startCharacter = declareModule.index + line.slice(declareModule.index).indexOf(name);
    return {
      kind: "declareModule",
      name,
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  const module = MODULE_PATTERN.exec(line);
  if (module) {
    const name = module[1];
    const startCharacter = module.index + line.slice(module.index).indexOf(name);
    return {
      kind: "module",
      name,
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  const structure = STRUCTURE_PATTERN.exec(line);
  if (structure) {
    const name = structure[2];
    const startCharacter = structure.index + line.slice(structure.index).lastIndexOf(name);
    return {
      kind: "structure",
      name,
      detail: structure[1],
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  const enumeration = ENUMERATION_PATTERN.exec(line);
  if (enumeration) {
    const name = enumeration[2] ?? enumeration[1];
    const startCharacter = enumeration.index + line.slice(enumeration.index).lastIndexOf(name);
    return {
      kind: "enumeration",
      name,
      detail: enumeration[1],
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  const macro = MACRO_PATTERN.exec(line);
  if (macro) {
    const name = macro[1];
    const startCharacter = macro.index + line.slice(macro.index).indexOf(name);
    return {
      kind: "macro",
      name,
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  const iface = INTERFACE_PATTERN.exec(line);
  if (iface) {
    const name = iface[1];
    const startCharacter = iface.index + line.slice(iface.index).indexOf(name);
    return {
      kind: "interface",
      name,
      selectionStartCharacter: startCharacter,
      selectionEndCharacter: startCharacter + name.length,
    };
  }

  return undefined;
}

function matchEndKind(trimmedLine: string): ContainerKind | undefined {
  if (/^EndProcedure\b/i.test(trimmedLine)) {
    return "procedure";
  }

  if (/^EndDeclareModule\b/i.test(trimmedLine)) {
    return "declareModule";
  }

  if (/^EndModule\b/i.test(trimmedLine)) {
    return "module";
  }

  if (/^EndStructure(?:Union)?\b/i.test(trimmedLine)) {
    return "structure";
  }

  if (/^EndEnumeration\b/i.test(trimmedLine)) {
    return "enumeration";
  }

  if (/^EndMacro\b/i.test(trimmedLine)) {
    return "macro";
  }

  if (/^EndInterface\b/i.test(trimmedLine)) {
    return "interface";
  }

  return undefined;
}

function compareDefinitionEntries(left: PureBasicDefinitionEntry, right: PureBasicDefinitionEntry): number {
  return rankDefinition(left) - rankDefinition(right) || left.line - right.line;
}

function rankDefinition(entry: PureBasicDefinitionEntry): number {
  switch (entry.kind) {
    case "procedure":
    case "module":
      return 0;
    case "declare":
    case "declareModule":
      return 1;
    case "structure":
    case "enumeration":
    case "macro":
    case "interface":
      return 2;
  }
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
