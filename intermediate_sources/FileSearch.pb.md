# FileSearch.pb - Intermediate Description

## Purpose
Demonstrates recursive file searching through directories using a linked list to collect results.

## Application Type
GUI (uses Debug output only, no console)

## Compiler Flags
None (default GUI mode, Debug output)

## Structure
- `FileSearch()` procedure: Recursively searches directories for files matching an extension mask
- Uses a linked list of strings to accumulate found file paths
- Main code calls FileSearch on the temporary directory looking for .txt files

## Key Libraries/Functions
- ExamineDirectory(), NextDirectoryEntry(), DirectoryEntryName(), DirectoryEntryType(), FinishDirectory()
- GetExtensionPart(), GetTemporaryDirectory()
- NewList, AddElement(), ForEach
- #PB_Any, #PB_DirectoryEntry_Directory, #PS$

## Input/Output
- Input: A directory path and optional file extension mask
- Output: Debug window listing all matching file paths

## Logic Flow
1. Define FileSearch procedure that takes a list, directory, and optional mask
2. Ensure directory ends with path separator
3. Open directory with ExamineDirectory using #PB_Any
4. Loop through entries, skip "." and ".."
5. If entry is a directory, recurse into it
6. If entry is a file and matches mask (or no mask), add to list
7. Finish directory examination
8. Main code creates list, calls FileSearch, then prints results via Debug

## Cross-Platform Notes
- Uses #PS$ for platform-independent path separator
- GetTemporaryDirectory() works cross-platform

## Important Notes
- Uses Protected for local variables in procedure
- Recursive procedure design
- The mask parameter filters by file extension only
