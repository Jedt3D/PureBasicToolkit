# PureBasic Toolkit - Codex Guide

This document provides the Codex-first workflow and PureBasic rules for this repository.

## Repo Overview

This workspace now contains both the extension product and the PureBasic sample corpus it is built against. The major content groups are:

- Top-level hand-written examples: `helloworld.pb`, `console.pb`, `fileio.pb`
- `reference_sources/` and `reference_3d_game_engine/`: upstream reference examples
- `intermediate_sources/` and `intermediate_3d_game_engine_sources/`: natural-language descriptions used during generation
- `generated_sources/` and `generated_3d_game_engine_sources/`: regenerated PureBasic source files validated with `pbcompiler`
- `archived/`: historical tooling, migration notes, and stale scaffolding moved off the main workspace path
- extension product files at the repo root: `package.json`, `src/`, `syntaxes/`, `snippets/`, `.github/workflows/`

## Preferred Codex Workflow

Use repo scripts instead of legacy slash-command docs:

- Compile: `scripts/pbc.sh <file.pb>`
- Syntax check: `scripts/pbc.sh --check <file.pb>`
- Compile and run: `scripts/run.sh <file.pb>`
- Repo-wide checks and audits: `make help`

Compiler path preference:

1. `PUREBASIC_COMPILER` if set
2. `/Applications/PureBasic.app/Contents/Resources/compilers/pbcompiler`
3. `pbcompiler` on `PATH`

### Compilation Modes
- Console apps: `-cl` flag (default for examples)
- GUI apps: No flag (default)
- Dynamic libraries: `-dl` flag (`.dylib` on macOS, `.dll` on Windows)

### Compiler Options
- `-z` — Enable optimizer (recommended)
- `-l` — Enable line numbering for error handling
- `-q` — Quiet mode (display only errors)
- `-f` — Put launched process to front (macOS GUI apps only)

## Code Style Guidelines

### File Structure
- Comment header at top describing file purpose
- `EnableExplicit` at top to enforce variable declaration
- Organize all code into procedures
- Call main procedure at end of file
- Prefer `XIncludeFile` over `IncludeFile` for shared `.pbi` files
- Blank lines separate logical sections

### Comments
- Use semicolon `;` for single-line comments
- Use blank comment lines to separate code sections
- Document procedure purposes with comment blocks
- Example: `; PureBasic Example: Console Application`

### Naming Conventions
- Procedures: PascalCase (`CreateMainWindow`, `Factorial`)
- Variables: camelCase with type suffix (`window.i`, `result.q`, `name.s`)
- Constants: `#` prefix (`#PB_Any`, `#TESTDLL`)
- Arrays: PascalCase with type suffix (`Dim numbers.q(10)`)

### Data Types
- `.i` - Integer (32-bit) - Default for counts, IDs
- `.q` - Quad (64-bit) - Large numbers, factorial results
- `.s` - String - Text data
- `.f`/`.d` - Float/Double - Floating-point calculations
- `.b` - Byte - Small integers
- `.l` - Long - Platform-dependent size

### Variable Declaration
- Use `Define` for variable initialization: `Define.i counter, result`
- Use `Protected` for local procedure variables
- Always specify type suffix: `Protected window.i, event.i`
- Arrays: `Dim array.type(size)` or `Protected Dim array.type(size)`

### Procedures
```purebasic
Procedure.returnType ProcedureName(param1.type, param2.type)
  Protected localVar.type
  ; Code
  ProcedureReturn value
EndProcedure
```
- Use `Procedure.i` for integer returns
- Use `ProcedureDLL` for library procedures
- Use `Protected` for local variables
- Always `ProcedureReturn` at the end

### Control Structures
- **If/EndIf**: Always use `EndIf` (not `End If`)
- **For/Next**: Include loop variable after `Next` for clarity: `Next i`
- **ForEver**: Use `Repeat/ForEver` for main event loops
- **Select/Case**: Include `EndSelect`
- **While/Wend**: Always use `Wend` (not `EndWhile`)

### Error Handling
- Check return values: `If file` for file ops, `If window = 0` for window creation
- Return `#True` or `#False` for success/failure
- Use `MessageRequester()` for GUI error dialogs
- Use `End` to exit on critical errors

### File Operations
- Use `CreateFile(#PB_Any, path)` for writing
- Use `ReadFile(#PB_Any, path)` for reading
- Always check `FileSize(filename) >= 0` before reading
- Always close files with `CloseFile(fileID)`
- Use `While Not Eof(file)` to read line by line

### Console Output
- `PrintN(text)` - Print with newline
- `Print(text)` - Print without newline
- `Input()` - Read user input
- `Str(value)` - Convert number to string
- `StrF(value, decimals)` - Convert float to string with decimals

### String Operations
- `+` for concatenation
- `Len(string)` - Length
- `Left/Right(string, count)` - Substrings
- `Mid(string, position, count)` - Extract from middle
- `FindString(string, substring)` - Search for substring

### Memory Management
- `*pointer = AllocateMemory(size)` - Allocate memory
- `FreeMemory(*pointer)` - Always free allocated memory
- Use `*` prefix for pointer variables
- Do not add native suffixes like `.i` to pointer variables unless the pointer is typed to a structure

### Cross-Platform Code
```purebasic
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  ; Windows-specific code
CompilerElseIf #PB_Compiler_OS = #PB_OS_MacOS
  ; macOS-specific code
CompilerElseIf #PB_Compiler_OS = #PB_OS_Linux
  ; Linux-specific code
CompilerEndIf
```

### Event Loop Pattern (GUI Applications)
```purebasic
Repeat
  event = WaitWindowEvent()
  
  Select event
    Case #PB_Event_Gadget
      Select EventGadget()
        Case 1
          ; Handle gadget click
      EndSelect
      
    Case #PB_Event_CloseWindow
      If EventWindow() = window
        Break
      EndIf
  EndSelect
  
ForEver
```

## Project-Specific Notes

### Compiler Settings
- Target: macOS ARM64 (Apple Silicon)
- Compiler: PureBasic 6.30 with C Backend
- Default executable format: Detect from source shape; most top-level examples are console except `helloworld.pb`
- If running examples directly inside the PureBasic IDE, most book examples need `Compiler > Compiler Options > Executable Format = Console`

### File Organization
- `helloworld.pb` - Basic GUI application example
- `console.pb` - Console I/O and algorithm examples
- `fileio.pb` - File I/O operations examples
- `reference_sources/` - Syntax-checked reference corpus (macOS has 3 expected platform-specific failures)
- `generated_sources/` - Generated 2D/general-purpose corpus
- `reference_3d_game_engine/` - Syntax-checked 3D reference corpus
- `generated_3d_game_engine_sources/` - Generated 3D corpus
- `intermediate_*` - Generation descriptions, not build targets

### Codex Notes
- `.codex/commands/` contains quick command references for Codex-oriented repo usage
- Prefer the scripts in `scripts/` as the source of truth over tool-specific wrappers
- The extension currently exposes `check`, `compile`, and `run` commands through the repo scripts, plus offline docs, project-aware diagnostics, and lightweight local navigation
- Review generated trees with syntax checks before making style or behavior claims

### Common Gotchas
- Array indexing is 0-based by default
- Strings are passed by reference
- Always check return values for file operations
- GUI apps don't show console output - use `-cl` flag
- `FileSize(filename) >= 0` is the safe existence check pattern
- Avoid combining string suffix styles (`name$` and `.s`) on the same variable
- Use forward slashes `/` in file paths for cross-platform compatibility
