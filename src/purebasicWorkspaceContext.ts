import * as fs from "node:fs";
import * as path from "node:path";
import * as vscode from "vscode";
import { parsePureBasicNavigation } from "./purebasicNavigationEngine";

export async function collectCandidateUris(
  document: vscode.TextDocument,
  workspaceLimit = 200,
): Promise<vscode.Uri[]> {
  const discovered = new Map<string, vscode.Uri>();
  const queue: vscode.Uri[] = [document.uri];
  const workspaceFolder = vscode.workspace.getWorkspaceFolder(document.uri);

  while (queue.length > 0 && discovered.size < 50) {
    const uri = queue.shift();
    if (!uri || discovered.has(uri.fsPath)) {
      continue;
    }

    discovered.set(uri.fsPath, uri);

    const parsed = parsePureBasicNavigation((await vscode.workspace.openTextDocument(uri)).getText());
    for (const includePath of parsed.includePaths) {
      const resolved = resolveIncludeUri(uri, includePath);
      if (resolved && !discovered.has(resolved.fsPath)) {
        queue.push(resolved);
      }
    }
  }

  if (workspaceFolder) {
    const files = await vscode.workspace.findFiles(
      new vscode.RelativePattern(workspaceFolder, "**/*.{pb,pbi}"),
      "**/node_modules/**",
      workspaceLimit,
    );

    for (const uri of files) {
      if (!discovered.has(uri.fsPath)) {
        discovered.set(uri.fsPath, uri);
      }
    }
  }

  return [document.uri, ...Array.from(discovered.values()).filter((uri) => uri.fsPath !== document.uri.fsPath)];
}

export function resolveIncludeFsPath(baseFilePath: string, includePath: string): string {
  return path.resolve(path.dirname(baseFilePath), includePath);
}

export function resolveIncludeUri(baseUri: vscode.Uri, includePath: string): vscode.Uri | undefined {
  const resolved = resolveIncludeFsPath(baseUri.fsPath, includePath);
  if (!fs.existsSync(resolved)) {
    return undefined;
  }

  return vscode.Uri.file(resolved);
}
