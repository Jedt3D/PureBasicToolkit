import { type PureBasicDefinitionEntry } from "./purebasicNavigationEngine";

export function normalizeWorkspaceSymbolQuery(query: string): string {
  return query.trim().toLowerCase();
}

export function scoreWorkspaceDefinition(definition: PureBasicDefinitionEntry, normalizedQuery: string): number {
  const directName = definition.name.toLowerCase();
  const qualifiedName = definition.moduleName
    ? `${definition.moduleName.toLowerCase()}::${directName}`
    : directName;

  let bestScore = 0;

  for (const candidate of [directName, qualifiedName, definition.moduleName?.toLowerCase()]) {
    if (!candidate) {
      continue;
    }

    if (candidate === normalizedQuery) {
      bestScore = Math.max(bestScore, 400);
      continue;
    }

    if (candidate.startsWith(normalizedQuery)) {
      bestScore = Math.max(bestScore, 300);
      continue;
    }

    if (candidate.includes(normalizedQuery)) {
      bestScore = Math.max(bestScore, 200);
    }
  }

  if (definition.kind === "procedure") {
    bestScore += 20;
  } else if (definition.kind === "module" || definition.kind === "declareModule") {
    bestScore += 10;
  }

  return bestScore;
}
