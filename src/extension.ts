import * as vscode from "vscode";
import { PureBasicCommandController } from "./purebasicCommands";

export function activate(context: vscode.ExtensionContext): void {
  const output = vscode.window.createOutputChannel("PureBasic Toolkit");
  output.appendLine("PureBasic Toolkit activated.");
  const commands = new PureBasicCommandController(output);

  context.subscriptions.push(output);
  commands.register(context);
}

export function deactivate(): void {}
