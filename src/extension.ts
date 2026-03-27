import * as vscode from "vscode";
import { PureBasicDocsController } from "./purebasicDocs";
import { PureBasicCommandController } from "./purebasicCommands";
import { PureBasicDiagnosticsController } from "./purebasicDiagnostics";
import { PureBasicNavigationController } from "./purebasicNavigation";

export function activate(context: vscode.ExtensionContext): void {
  const output = vscode.window.createOutputChannel("PureBasic Toolkit");
  output.appendLine("PureBasic Toolkit activated.");
  const commands = new PureBasicCommandController(output);
  const docs = new PureBasicDocsController(context.extensionPath, output);
  const diagnostics = new PureBasicDiagnosticsController(context.extensionPath, output);
  const navigation = new PureBasicNavigationController(output);

  context.subscriptions.push(output);
  commands.register(context);
  docs.register(context);
  diagnostics.register(context);
  navigation.register(context);
}

export function deactivate(): void {}
