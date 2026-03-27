# Unicode_Utf8_Ascii.pb - Intermediate Description

## Purpose
Demonstrates conversions between Unicode, UTF-8, and ASCII string encodings in PureBasic. Shows how strings are stored internally and how to convert between formats using PeekS, PokeS, Ascii(), and UTF8() functions.

## Application Type
GUI (uses Debug and ShowMemoryViewer, CallDebugger for interactive debugging)

## Compiler Flags
None (standard GUI app)

## Structure
- Demonstrates Unicode string storage (default format)
- Unicode -> ASCII conversion using Ascii()
- Unicode -> UTF-8 conversion using UTF8()
- ASCII -> Unicode using PeekS with #PB_Ascii flag
- UTF-8 -> Unicode using PeekS with #PB_UTF8 flag
- ToAscii() helper procedure - stores ASCII in a unicode variable
- FromAscii() helper procedure - converts back from ASCII-in-unicode

## Key Libraries/Functions
- StringByteLength() - returns byte length of string
- PeekS() - reads string from memory with encoding flag
- PokeS() - writes string to memory with encoding flag
- Ascii() - converts string to ASCII memory buffer
- UTF8() - converts string to UTF-8 memory buffer
- ShowMemoryViewer() - displays memory contents (IDE debugger)
- CallDebugger - pauses execution for inspection
- MemorySize() - returns size of allocated memory block
- SizeOf() - returns size of a pointer

## Input/Output
- No user input
- Output: Debug window and ShowMemoryViewer displays

## Logic Flow
1. Show unicode string storage and byte representation
2. Convert unicode to ASCII, display with PeekS
3. Convert unicode to UTF-8, display with PeekS
4. Convert ASCII back to unicode using PeekS with #PB_Ascii
5. Convert UTF-8 back to unicode using PeekS with #PB_UTF8
6. Demonstrate ToAscii/FromAscii helper procedures
7. Uses CallDebugger between sections for step-through

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Since PB 5.50, all strings are unicode by default
- Uses accented characters to demonstrate multi-byte encoding differences
