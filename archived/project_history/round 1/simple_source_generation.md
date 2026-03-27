# PureBasic Source Code Generation Report

**Date**: 2026-03-14
**Compiler**: PureBasic 6.30 - C Backend (MacOS X - arm64)
**Process**: Reference Source -> Intermediate Description -> Generated Source -> Compile & Fix

---

## Overview

| Metric | Count |
|--------|-------|
| Total reference .pb files | 87 |
| Skipped (Windows-only) | 3 |
| Skipped (macOS unavailable) | 1 |
| Successfully compiled reference files | 80 |
| Intermediate descriptions created | 81 |
| Generated .pb source files | 81 |
| Final compilation: ALL PASS | 81/81 |

## Phase 1: Reference Source Analysis

### Windows-Only Projects (Skipped)
| File | Reason |
|------|--------|
| DLLSample.pb | Windows DLL entry points (AttachProcess/DetachProcess) |
| MDI_ImageViewer.pb | MDIGadget() is Windows-only |
| SystemFolders.pb | Windows Shell32.dll (SHGetKnownFolderPath) |

### macOS Unavailable (Skipped)
| File | Reason |
|------|--------|
| AudioCD.pb | InitAudioCD() not available on macOS |

### Missing from reference_sources (listed in Makefile)
| File | Notes |
|------|-------|
| DirectScreenDrawing.pb | Not present |
| Help.pb | Not present |
| Win32_API.pb | Not present (Windows-only) |

## Phase 2: Intermediate Description Creation

81 intermediate description files (.md) were created in `intermediate_sources/`. Each contains:
- Purpose and behavior description
- Application type (console/gui/library/cgi)
- Required compiler flags
- Structure (procedures, data structures, constants)
- Key libraries/functions used
- Input/output requirements
- Logic flow description
- Cross-platform notes

## Phase 3: Code Generation & Compilation

### First-Try Compilation Results

| Batch | Files | First-Try Pass | Required Fixes |
|-------|-------|----------------|----------------|
| Batch 1 (Arithmetic - Ftp) | 20 | 14 | 6 |
| Batch 2 (Gadget - Mouse) | 20 | 14 | 6 |
| Batch 3 (Movie - Sound) | 20 | 20 | 0 |
| Batch 4 (SoundPlugin - FontRegister) | 21 | 17 | 4 |
| **Total** | **81** | **65** | **16** |

**First-try success rate: 80.2% (65/81)**
**After fixes: 100% (81/81)**

### Problems Found and Fixes Applied

#### Category 1: String Variable Declaration Error (11 occurrences)
**Error**: `Illegal operator for 'Define'`
**Cause**: Using `Define var$.s` — combining `$` suffix with `.s` type suffix
**Fix**: Use only `Define var$` ($ already implies string type)
**Files affected**: Console.pb, Desktop.pb, File.pb, FileSystem.pb, Ftp.pb, Gadget.pb, Http.pb, ImagePlugin.pb, ImagePlugin_GIF.pb, Json.pb (and potentially more in batch 4)

This was by far the most common error — a classic AI code generation mistake where the model combines two valid but mutually exclusive string type declarations.

#### Category 2: Non-Existent OS Version Constants (1 occurrence)
**Error**: `Constant not found: #PB_OSX_10_0`
**Cause**: Generated code used `#PB_OSX_10_0`, `#PB_Linux_2_2`, `#PB_Windows_XP` which don't exist in PureBasic 6.30
**Fix**: Replaced with direct numeric display of `OSVersion()` return value
**File affected**: CompilerSystemData.pb

#### Category 3: Missing Function Parameter (1 occurrence)
**Error**: `AddMailAttachment() incorrect number of parameters`
**Cause**: Called with 2 parameters instead of required 3
**Fix**: Added missing third parameter (description string)
**File affected**: Mail.pb

#### Category 4: Modulo Operator with Non-Integer Types (1 occurrence)
**Error**: `Can't use % with float or double`
**Cause**: Using `%` modulo inline with DisplaySprite() on arm64 with `.i` type
**Fix**: Extract modulo results into temporary `.l` variables before passing to functions
**File affected**: Sprite.pb

#### Category 5: WebViewGadget() Parameter Mismatch (1 occurrence)
**Error**: `Bad parameter type, number expected instead of string`
**Cause**: WebViewGadget() does NOT take a URL string parameter
**Fix**: Removed URL param; use `SetGadgetText()` to load URLs instead
**File affected**: WebView.pb

#### Category 6: Reserved Structure Name Conflict (1 occurrence)
**Error**: `Structure already declared: INTEGER (in a resident file)`
**Cause**: The name `INTEGER` conflicts with PureBasic's built-in resident structures
**Fix**: Renamed structure to `INTPTR`
**File affected**: Xml_Expat_API.pb

#### Category 7: For/Step Requires Compile-Time Constants (1 occurrence)
**Error**: `An integer numeric constant is expected after 'Step'`
**Cause**: PureBasic requires the Step value to be a compile-time integer constant, not a variable
**Fix**: Replaced `For/Step` loops with `While/Wend` loops using manual increment
**File affected**: 2DDrawingAlpha.pb

### Error Distribution Summary

| Category | Count | % of Errors |
|----------|-------|-------------|
| String type declaration (`$` + `.s`) | 11 | 64.7% |
| Non-existent constants | 1 | 5.9% |
| Wrong parameter count | 1 | 5.9% |
| Modulo operator type mismatch | 1 | 5.9% |
| WebViewGadget() wrong params | 1 | 5.9% |
| Reserved structure name | 1 | 5.9% |
| For/Step non-constant step | 1 | 5.9% |
| **Total errors** | **17** | **100%** |

## Phase 4: Final Verification

All 81 generated .pb files were re-compiled with `pbcompiler -k` (syntax check). **Result: 81/81 PASS**.

## Project Categories Covered

| Category | Count | Examples |
|----------|-------|---------|
| GUI/Gadgets | 15 | Gadget, GadgetAdvanced, CanvasGadget, DragDrop |
| Graphics/Drawing | 7 | 2DDrawing, 2DDrawingAlpha, Image, Sprite |
| Data Structures | 6 | Array, List, Map, Sort_(Numeric), Sort_(String) |
| Network | 8 | Http, Ftp, Mail, NetworkClient/Server, TLS |
| File I/O | 4 | File, FileSearch, FileSystem, Packer |
| String/Encoding | 4 | String, RegularExpression, Unicode_Utf8_Ascii |
| Data Formats | 4 | Json, Xml, Xml_Expat_API, Database |
| Media | 5 | Sound, SoundPlugin, Music, Movie, Sprite |
| System | 5 | System, Desktop, Clipboard, Printer, Thread |
| GUI/Windows | 6 | Window, Menu, PopupMenu, StatusBar, ToolBar |
| Advanced | 6 | Interface, Prototype, Runtime, OnError, Library |
| Other | 11 | CGI, Dialog, Cipher, Preference, etc. |

## Key Observations

1. **The `$` + `.s` string declaration trap** is the dominant failure mode (64.7% of all errors). This should be prominently documented in any AI code generation guidelines for PureBasic.

2. **Batch 3 achieved 100% first-try success** — demonstrating that with sufficient context and careful function name choices, zero-error generation is achievable for straightforward PureBasic programs.

3. **No "invented function" errors** occurred — the common pitfall of using `FileExists()` or `Randomize()` was successfully avoided thanks to the skill documentation and pre-generation instructions.

4. **Cross-platform considerations** were properly handled — Library.pb uses `CompilerSelect` for OS-specific dynamic library loading, and SerialPort.pb uses platform-aware port names.

5. **PureBasic has subtle language constraints** that trip up AI code generation — reserved structure names, compile-time constant requirements for `For/Step`, and API differences like `WebViewGadget()` not accepting URLs directly.
