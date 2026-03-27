# Changelog

All notable changes to this project should be recorded here.

The format is based on Keep a Changelog and the project follows Semantic Versioning.

## [Unreleased]

## [0.3.0] - 2026-03-27

### Added

- `PureBasic: Open Documentation for Symbol`
- hover docs for recognized PureBasic commands and indexed help topics
- packaged offline `purebasic_help` pages so local documentation works without network access

### Changed

- bumped the extension to its first Phase 3 slice
- expanded the extension package to include the local PureBasic help corpus
- updated the README for the new offline docs workflow

## [0.2.1] - 2026-03-27

### Added

- a branded media pack with `media/banner.png`, three showcase screenshots, and `media/purebasic-toolkit-demo.gif`

### Changed

- renamed the extension from `PureBasic Extension` to `PureBasic Toolkit`
- added packaged branding support through `media/icon.png` and the README banner
- polished the Marketplace-facing README ordering and release copy around the new product name
- aligned extension metadata with the MIT license already present in the repository
- updated repository metadata to point at the `Jedt3D/PureBasicToolkit` GitHub repository
- updated the packaged `.vsix` artifact name and related metadata to match the new product name

## [0.2.0] - 2026-03-27

### Added

- `PureBasic: Check Syntax Current File`
- `PureBasic: Compile Current File`
- `PureBasic: Run Current File`
- task-based execution layer that runs the repo scripts from the active file context

### Changed

- bumped the extension to a Phase 2 workflow baseline
- documented that Phase 2 commands currently depend on the repo script layer
- guarded build and run requests so only one PureBasic task runs at a time

## [0.1.1] - 2026-03-27

### Changed

- replaced the placeholder TextMate grammar with a donor-based PureBasic grammar derived from `purebasic-x10`
- expanded the snippet pack using curated patterns from `purebasic-lsp`
- normalized the snippet style around `EnableExplicit`, `Main()`, and named UI identifiers where appropriate
- kept the packaged `.vsix` bundle trimmed to runtime extension assets only
- added explicit documentation that most book examples must be run with `Compiler Options > Executable Format = Console` in the PureBasic IDE

## [0.1.0] - 2026-03-27

### Added

- initial VS Code extension scaffold at the repo root
- TypeScript build configuration
- language registration for PureBasic files
- placeholder grammar and starter snippets
- packaging baseline with `.vscodeignore`
- baseline GitHub Actions workflows for CI and tagged releases
