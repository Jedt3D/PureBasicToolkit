# PureBasic Toolkit

![PureBasic Toolkit banner](media/banner.png)

PureBasic editor support for VS Code, developed from a clean-start scaffold in this repository and grounded in the official PureBasic help and example corpus.

## What Ships in 0.2.1

- PureBasic file recognition for `.pb`, `.pbi`, and `.pbp`
- donor-based syntax highlighting tuned against real PureBasic sources
- curated snippets and starter templates for console and window applications
- `PureBasic: Check Syntax Current File`
- `PureBasic: Compile Current File`
- `PureBasic: Run Current File`
- repo-owned scripts for reliable local PureBasic compile and run workflows

## Preview

![PureBasic Toolkit demo](media/purebasic-toolkit-demo.gif)

### Screenshots

![PureBasic syntax highlighting overview](media/screenshot-overview.png)

![PureBasic snippet suggestions](media/screenshot-snippets.png)

![PureBasic command palette actions](media/screenshot-commands.png)

## Quick Start

1. Install the packaged `.vsix` or run the extension in an Extension Development Host.
2. Open a `.pb`, `.pbi`, or `.pbp` file.
3. Use the Command Palette and run:
   - `PureBasic: Check Syntax Current File`
   - `PureBasic: Compile Current File`
   - `PureBasic: Run Current File`

## Current Status

The project now has a working Phase 2 baseline.

This repo already contains:

- official PureBasic help and example references
- generated and normalized PureBasic source corpora for validation work
- local utility scripts for PureBasic compile and run workflows
- a phased product plan in `development_plan.md`
- baseline GitHub Actions workflows for CI and tagged releases
- donor-based syntax highlighting and a stronger snippet pack for PureBasic editing

The extension product path is now being built at the repo root.

## Important Note for Book Examples

Most examples in this book are console applications.

If you run them from the PureBasic IDE, you must go to:

- `Compiler` menu
- `Compiler Options`
- first tab: `Executable Format`
- set it to `Console`

If that setting is left as a GUI executable, console examples can fail with messages such as "No console is currently opened", even when the code itself is correct.

## Command Support

The extension currently runs build actions through the repo scripts:

- `scripts/pbc.sh`
- `scripts/run.sh`

That means Phase 2 commands work best when the current file lives inside this repository or another workspace that provides the same scripts.

Current command behavior:

- `Check Syntax` works on `.pb` and `.pbi`
- `Compile` currently requires an active `.pb` file
- `Run` currently requires an active `.pb` file
- build and run requests are intentionally serialized so `pbcompiler` does not collide with another in-flight task

## Planned Next Layers

- offline documentation lookup
- lightweight PureBasic-aware diagnostics
- packaging, CI, tags, and GitHub Releases

## Development Workflow

Use short, focused cycles:

1. create a branch from `main`
2. implement one phase or sub-phase
3. build and test locally
4. update Markdown docs
5. open a PR
6. merge cleanly
7. tag and release when that cycle is meant to ship

Recommended branch naming:

- `codex/phase-0-scaffold`
- `codex/phase-1-grammar-snippets`
- `codex/phase-2-build-run`

## Local Development

Install dependencies:

```bash
npm install
```

Build the extension:

```bash
npm run build
```

Create a `.vsix` package:

```bash
npm run package:vsix
```

Current packaged artifact:

- `purebasic-toolkit-0.2.1.vsix`

Current release prep notes:

- `docs/releases/v0.2.1.md`

## Source Material

The extension should use these local sources as authorities:

- `purebasic_help`
- `reference_sources`
- `reference_3d_game_engine`

Older local extension experiments are useful as donor material, but not as the new foundation:

- `/Users/worajedt/PureBasicProjects/pure_extensions/purebasic-x10`
- `/Users/worajedt/PureBasicProjects/pure_extensions/purebasic-lsp`
- `/Users/worajedt/PureBasicProjects/pure_extensions/purebasic-mcp-server`
