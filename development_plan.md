# PureBasic Toolkit Development Plan

Current shipped baseline: `0.3.0` with initial Phase 3 offline docs lookup, hover docs, Phase 2 command support, branding assets, packaging, and GitHub workflow scaffolding.

## Goal

Build a high-quality PureBasic editor extension from this repository using a clean-start product structure, while reusing the best ideas and assets from earlier local attempts.

This repo should become the canonical home for:

- the extension source code
- the PureBasic reference corpus that drives quality
- the release workflow
- the documentation for contributors and future maintenance

## Product Direction

The extension should ship in layers. We do not need to start with a full language server. The first target is a strong editor MVP with reliable compile and run workflows, then we add richer language intelligence, docs, diagnostics, and release automation.

The best local donor sources are:

- `purebasic-x10`
  - best starting point for syntax highlighting and lightweight editor features
- `purebasic-lsp`
  - best starting point for command surface and snippet breadth
- `purebasic-mcp-server`
  - best starting point for future offline docs and search architecture

The official sources in this repo remain the authority:

- `purebasic_help`
- `reference_sources`
- `reference_3d_game_engine`

## Working Principles

- Keep the new extension code clean and small at the start.
- Reuse proven assets, but do not import older projects wholesale.
- Treat official PureBasic docs and examples as the source of truth.
- Ship in short cycles with a branch, PR, merge, tag, and release rhythm.
- Keep generated or archived history out of the product path unless it directly supports the extension.
- A phase is only considered strong when code, docs, packaging, and CI are all aligned.

## Repository Shape Target

The repo should gradually converge toward this structure:

```text
.
├── src/
├── syntaxes/
├── snippets/
├── media/
├── scripts/
├── .github/
│   └── workflows/
├── package.json
├── tsconfig.json
├── README.md
├── CHANGELOG.md
├── development_plan.md
├── AGENTS.md
├── language-configuration.json
├── purebasic_help/
├── reference_sources/
├── reference_3d_game_engine/
└── archived/
```

The extension product files should live at the repo root. The PureBasic corpora stay in place as support material, test material, and future doc/index sources.

## Release Automation

The preferred release rhythm is:

1. merge the release PR into `main`
2. use the manual GitHub Actions `Release` workflow on `main`
3. provide the intended version number
4. let the workflow validate `package.json`, validate `CHANGELOG.md`, create the tag, build the `.vsix`, and publish the GitHub Release

Avoid automatic tag creation on every merge. Version tags should remain an explicit release decision.

## Phases

## Phase 0 - Foundation and Product Skeleton

### Objective

Create a clean extension workspace in this repo without dragging in old project complexity.

### Features

- VS Code extension scaffold
- TypeScript build setup
- basic package metadata
- extension activation on PureBasic files
- initial contributor docs

### TODO

- create `package.json`
- create `tsconfig.json`
- create `src/extension.ts`
- create `README.md`
- create `CHANGELOG.md`
- create `language-configuration.json`
- add `syntaxes/` and `snippets/` folders
- add npm scripts for build, package, and test placeholders
- define the first version target, likely `0.1.0`

### Reuse Plan

- use `purebasic-x10` and `purebasic-lsp` as references only
- do not copy old workflow files blindly
- align compile and run behavior to this repo's `scripts/pbc.sh` and `scripts/run.sh`

### Exit Criteria

- extension can build locally
- extension activates in VS Code
- repo has a clean product scaffold

## Phase 1 - Language MVP

### Objective

Deliver a useful editing experience quickly.

### Features

- PureBasic language registration
- syntax highlighting
- bracket/comment configuration
- starter snippets

### TODO

- import and normalize the best grammar from `purebasic-x10`
- review and fix weak grammar rules before shipping
- import the richer snippet set from `purebasic-lsp`
- rewrite snippets to match our style guidance
- verify syntax highlighting on:
  - `helloworld.pb`
  - `console.pb`
  - `fileio.pb`
  - a sample from `generated_sources`
  - a sample from `generated_3d_game_engine_sources`

### Feature Notes

- snippets should prefer `EnableExplicit`
- snippets for standalone examples should prefer `Main()`
- UI-oriented snippets should avoid magic IDs where possible

### Exit Criteria

- highlighting is usable across real PureBasic files
- snippet set covers common control flow, procedures, structures, modules, file I/O, and GUI patterns
- extension feels useful even before build integration

## Phase 2 - Compile, Check, and Run Workflow

### Objective

Make the extension operational for real coding work.

### Features

- `PureBasic: Syntax Check Current File`
- `PureBasic: Compile Current File`
- `PureBasic: Run Current File`
- compiler path configuration
- terminal or task integration

### TODO

- create command handlers in `src/commands/`
- wire commands to `scripts/pbc.sh`
- wire run behavior to `scripts/run.sh`
- detect console vs GUI vs library targets where possible
- show clear error output in the editor or terminal
- support macOS first, then keep the code structured for Windows/Linux later
- add basic task definitions if they improve workflow

### Feature Notes

- this repo's scripts should be the execution authority
- do not duplicate PureBasic CLI logic in multiple places
- if direct compiler execution is later needed, keep one shared execution layer

### Exit Criteria

- active `.pb` file can be checked, compiled, and run from the extension
- errors are understandable
- the workflow is stable enough for day-to-day use

## Phase 3 - Offline Docs and Lightweight Language Intelligence

### Objective

Make the extension smart without committing to a full LSP too early.

### Features

- hover docs for known commands
- open docs for symbol under cursor
- simple document symbols
- simple definitions for local procedures and modules
- local docs lookup from the official corpus

### TODO

- evaluate reuse of the `purebasic-x10` docs loader
- build a local docs index from `purebasic_help`
- add hover provider for commands and constants
- add `PureBasic: Open Documentation for Symbol`
- add outline/document symbol support
- add safe, lightweight definition support for local code navigation

### Feature Notes

- use local docs first
- online fallback should be optional, not the primary workflow
- keep implementation simple unless a full LSP becomes clearly necessary

### Exit Criteria

- common PureBasic commands show useful hover info
- local code navigation works for basic cases
- docs lookup is fast and reliable offline

## Phase 4 - Diagnostics and Project Awareness

### Objective

Turn repo knowledge and PureBasic pitfalls into helpful editor guidance.

### Features

- common mistake diagnostics
- warning hints for PureBasic-specific gotchas
- possible include awareness
- possible project-level settings

### TODO

- encode the highest-value rules from the current `$purebasic` skill
- surface warnings for:
  - missing `EnableExplicit`
  - likely wrong compile mode
  - suspicious `IncludeFile` vs `XIncludeFile`
  - invented APIs or common naming traps where practical
  - obvious scope and type mistakes if we can detect them safely
- decide whether these diagnostics stay lightweight or justify a future LSP/server layer

### Exit Criteria

- diagnostics provide real signal without spamming users
- the extension starts to reflect PureBasic-specific expertise, not just generic editor behavior

## Phase 5 - Release Hardening and Distribution

### Objective

Make the extension shippable and repeatable.

### Features

- packaged `.vsix`
- versioning discipline
- release notes
- GitHub Actions CI
- GitHub tag and release automation

### TODO

- add packaging script
- add `vsce` or equivalent packaging workflow
- define version bump rules
- create CI workflows for pull requests and `main`
- create release workflow for tags
- generate release artifacts
- attach `.vsix` to GitHub Releases
- verify installation from packaged artifact

### Exit Criteria

- a tagged release produces a `.vsix`
- GitHub release includes notes and assets
- install-from-release works cleanly

## Phase 6 - Optional Advanced Track

### Objective

Only after the previous phases are solid, decide whether a heavier architecture is worth it.

### Possible Features

- full LSP server
- rename and refactor support
- test integration
- richer workspace indexing
- MCP-backed docs or search workflows

### Decision Rule

Do not start this phase by default. Enter it only when the lightweight extension has hit real limits.

## Versioning Plan

Suggested milestone versions:

- `0.1.0`
  - scaffold, syntax highlighting, snippets
- `0.2.0`
  - compile, syntax check, run
- `0.3.0`
  - offline docs and lightweight language intelligence
- `0.4.0`
  - diagnostics and quality-of-life improvements
- `0.5.0`
  - release automation and repeatable packaging
- `1.0.0`
  - stable, documented, releasable extension with strong end-to-end workflow

## Cycle-Based Git Workflow

Each development cycle should follow the same discipline.

### Branching

- keep `main` always releasable
- create one focused branch per cycle
- branch naming:
  - `codex/phase-0-scaffold`
  - `codex/phase-1-grammar-snippets`
  - `codex/phase-2-build-run`
  - `codex/phase-3-offline-docs`
- avoid mixing multiple unrelated concerns in one branch

### Commits

- commit in small logical slices
- prefer Conventional Commit style
- examples:
  - `feat: add PureBasic extension scaffold`
  - `feat: import initial PureBasic grammar`
  - `fix: correct broken grammar operator rule`
  - `docs: add release checklist`
  - `ci: add pull request build workflow`

### Pull Requests

Every branch should land through a PR, even if you are the only active developer right now.

PR checklist:

- scope is clear and narrow
- extension still builds
- changed behavior is tested manually
- docs are updated for the feature
- version impact is considered
- CI passes

### Merge Strategy

- prefer squash merge for feature branches
- keep `main` history readable
- use the PR title or a cleaned-up squash message as the final commit message

### Tags and Releases

- tag only from `main`
- use semantic version tags like `v0.2.0`
- create a GitHub Release from the tag
- attach the `.vsix`
- include concise release notes with:
  - new features
  - fixes
  - upgrade notes
  - known limitations

## Definition of a Strong Phase

A phase is strong only when all of these are true:

- feature scope for that phase is complete
- local build is green
- relevant manual testing is complete
- docs are updated
- version bump is applied if the phase changes the shipped product
- packaged `.vsix` is generated successfully
- CI passes
- PR is merged cleanly
- tag and release are created when the phase is meant to ship

## Documentation Policy Per Strong Phase

When a strong phase finishes, update the active Markdown docs in the repo so the written story matches the shipped product.

Minimum docs to review each time:

- `README.md`
- `CHANGELOG.md`
- `development_plan.md`
- `AGENTS.md`
- any feature-specific docs added during the phase

If a document is no longer authoritative, archive it or remove it instead of letting it drift.

## CI and Release Automation Plan

## Pull Request CI

Create a workflow such as `.github/workflows/ci.yml` that runs on pull requests and on pushes to `main`.

Suggested jobs:

- install Node dependencies
- build the extension
- run tests if present
- package the extension in validation mode
- optionally run repo checks that still matter to extension quality

Good first CI checks:

- `npm ci`
- `npm run build`
- `npm run package`

Later checks:

- grammar validation
- snippet validation
- smoke test against sample `.pb` files

## Release Workflow

Create a workflow such as `.github/workflows/release.yml` that runs on version tags.

Suggested release behavior:

- trigger on `v*.*.*`
- install dependencies
- build the extension
- package `.vsix`
- create GitHub Release
- upload `.vsix` as a release asset

Optional later additions:

- publish to VS Code Marketplace
- publish to Open VSX

## Near-Term Execution Order

This is the recommended order from today:

1. Phase 0
   - create the extension scaffold in this repo
2. Phase 1
   - import and normalize grammar and snippets
3. Phase 2
   - wire syntax check, compile, and run to repo scripts
4. Phase 3
   - add offline docs and lightweight hover support
5. Phase 5 baseline
   - add CI and packaging earlier than usual so later phases are easier to ship

## Immediate Next TODO

- create the new extension scaffold at the repo root
- import grammar from `purebasic-x10`
- import and normalize snippets from `purebasic-lsp`
- add the three core commands
- create `README.md` and `CHANGELOG.md`
- add GitHub Actions for build and package validation

## Success Criteria

We should consider this project on track when:

- the repo contains a real installable extension
- the extension is useful for actual PureBasic work
- releases are repeatable and tagged
- docs stay current
- the next cycle can be planned from the repo itself without re-reading old side projects
