import * as fs from "node:fs";
import * as path from "node:path";
import * as vscode from "vscode";

type PureBasicAction = "check" | "compile" | "run";

const TASK_TYPE = "purebasic-script";

interface CommandContext {
  document: vscode.TextDocument;
  projectRoot: string;
  scriptPath: string;
  workspaceFolder?: vscode.WorkspaceFolder;
}

export class PureBasicCommandController implements vscode.Disposable {
  private readonly output: vscode.OutputChannel;
  private busy = false;

  public constructor(output: vscode.OutputChannel) {
    this.output = output;
  }

  public register(context: vscode.ExtensionContext): void {
    context.subscriptions.push(
      vscode.commands.registerCommand("purebasic.checkSyntax", () => this.run("check")),
      vscode.commands.registerCommand("purebasic.compile", () => this.run("compile")),
      vscode.commands.registerCommand("purebasic.run", () => this.run("run")),
      this,
    );
  }

  public dispose(): void {}

  private async run(action: PureBasicAction): Promise<void> {
    if (this.busy) {
      void vscode.window.showWarningMessage(
        "A PureBasic build or run task is already active. Wait for it to finish before starting another one.",
      );
      return;
    }

    const context = await this.getCommandContext(action);
    if (!context) {
      return;
    }

    if (context.document.isDirty) {
      const saved = await context.document.save();
      if (!saved) {
        void vscode.window.showInformationMessage("Save the current PureBasic file before running this command.");
        return;
      }
    }

    const task = this.createTask(action, context);
    const label = task.name;

    this.busy = true;
    this.log(`${label} started for ${context.document.fileName}`);

    try {
      const exitCode = await this.executeTask(task);
      if (exitCode === 0) {
        this.log(`${label} finished successfully.`);
        void vscode.window.showInformationMessage(`${label} finished successfully.`);
      } else if (exitCode === undefined) {
        this.log(`${label} finished without an exit code.`);
        void vscode.window.showWarningMessage(`${label} finished without an exit code.`);
      } else {
        this.log(`${label} failed with exit code ${exitCode}.`);
        void vscode.window.showErrorMessage(`${label} failed. Check the "Task - ${label}" terminal for details.`);
      }
    } catch (error) {
      const message = error instanceof Error ? error.message : String(error);
      this.log(`${label} failed to start: ${message}`);
      void vscode.window.showErrorMessage(`Could not start ${label}: ${message}`);
    } finally {
      this.busy = false;
    }
  }

  private async getCommandContext(action: PureBasicAction): Promise<CommandContext | undefined> {
    const editor = vscode.window.activeTextEditor;
    if (!editor || editor.document.uri.scheme !== "file") {
      void vscode.window.showErrorMessage("Open a saved PureBasic file before using PureBasic commands.");
      return undefined;
    }

    const document = editor.document;
    const fileName = document.fileName;
    const extension = path.extname(fileName).toLowerCase();

    if (document.languageId !== "purebasic" && ![".pb", ".pbi", ".pbp"].includes(extension)) {
      void vscode.window.showErrorMessage("The active file is not a PureBasic source file.");
      return undefined;
    }

    if (extension === ".pbp") {
      void vscode.window.showErrorMessage("PureBasic project metadata files (.pbp) are not runnable build targets.");
      return undefined;
    }

    if (action !== "check" && extension !== ".pb") {
      void vscode.window.showErrorMessage("Compile and Run commands currently require an active .pb file.");
      return undefined;
    }

    const projectRoot = findProjectRoot(fileName);
    if (!projectRoot) {
      void vscode.window.showErrorMessage(
        "Could not find a project root containing scripts/pbc.sh and scripts/run.sh. Open a file from the PureBasicExtension repo.",
      );
      return undefined;
    }

    const scriptPath = path.join(projectRoot, "scripts", action === "run" ? "run.sh" : "pbc.sh");
    if (!fs.existsSync(scriptPath)) {
      void vscode.window.showErrorMessage(`Required script not found: ${scriptPath}`);
      return undefined;
    }

    return {
      document,
      projectRoot,
      scriptPath,
      workspaceFolder: vscode.workspace.getWorkspaceFolder(document.uri),
    };
  }

  private createTask(action: PureBasicAction, context: CommandContext): vscode.Task {
    const fileDirectory = path.dirname(context.document.fileName);
    const args = [context.scriptPath];

    if (action === "check") {
      args.push("--check");
    }

    args.push(context.document.fileName);

    const execution = new vscode.ShellExecution("bash", args, {
      cwd: fileDirectory,
    });

    const task = new vscode.Task(
      {
        type: TASK_TYPE,
        action,
        file: context.document.fileName,
      },
      context.workspaceFolder ?? vscode.TaskScope.Global,
      taskLabel(action, context.document.fileName),
      "PureBasic",
      execution,
    );

    task.presentationOptions = {
      clear: true,
      echo: true,
      focus: action === "run",
      panel: vscode.TaskPanelKind.Dedicated,
      reveal: vscode.TaskRevealKind.Always,
      showReuseMessage: false,
    };

    if (action === "check" || action === "compile") {
      task.group = vscode.TaskGroup.Build;
    }

    return task;
  }

  private async executeTask(task: vscode.Task): Promise<number | undefined> {
    const execution = await vscode.tasks.executeTask(task);

    return await new Promise<number | undefined>((resolve) => {
      const processDisposable = vscode.tasks.onDidEndTaskProcess((event) => {
        if (event.execution === execution) {
          processDisposable.dispose();
          resolve(event.exitCode);
        }
      });
    });
  }

  private log(message: string): void {
    this.output.appendLine(`[${new Date().toLocaleTimeString()}] ${message}`);
    this.output.show(true);
  }
}

function findProjectRoot(fileName: string): string | undefined {
  let current = path.dirname(fileName);

  while (true) {
    const pbcScript = path.join(current, "scripts", "pbc.sh");
    const runScript = path.join(current, "scripts", "run.sh");

    if (fs.existsSync(pbcScript) && fs.existsSync(runScript)) {
      return current;
    }

    const parent = path.dirname(current);
    if (parent === current) {
      return undefined;
    }

    current = parent;
  }
}

function taskLabel(action: PureBasicAction, fileName: string): string {
  const baseName = path.basename(fileName);

  switch (action) {
    case "check":
      return `PureBasic Check: ${baseName}`;
    case "compile":
      return `PureBasic Compile: ${baseName}`;
    case "run":
      return `PureBasic Run: ${baseName}`;
  }
}
