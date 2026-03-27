# FileSystem.pb - Intermediate Description

## Purpose
Demonstrates a simple file system browser GUI that lists directory contents including files and subdirectories.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Main window with a StringGadget for path input, a Button to trigger listing, and a ListViewGadget for results
- Event loop processes button clicks to examine and list directory contents

## Key Libraries/Functions
- OpenWindow(), StringGadget(), ButtonGadget(), ListViewGadget()
- ExamineDirectory(), NextDirectoryEntry(), DirectoryEntryName(), DirectoryEntryType(), FinishDirectory()
- GetHomeDirectory(), GetGadgetText(), ClearGadgetItems(), AddGadgetItem()
- WaitWindowEvent(), MessageRequester()

## Input/Output
- Input: User enters a directory path in the string gadget
- Output: Lists all files and directories in the ListViewGadget, prefixing directories with "[DIR]"

## Logic Flow
1. Open a window with string gadget (default: home directory), button, and list view
2. Wait for events in an event loop
3. When button is clicked, clear list and examine the directory from the string gadget
4. Loop through directory entries, add each to list view (mark directories with [DIR] prefix)
5. If directory cannot be examined, show error requester
6. Continue until window close event

## Cross-Platform Notes
- GetHomeDirectory() is cross-platform
- Uses "*.*" as wildcard pattern for ExamineDirectory

## Important Notes
- Uses numbered gadgets (not #PB_Any)
- Simple event loop pattern with WaitWindowEvent()
