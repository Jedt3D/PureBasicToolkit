# Library.pb - Intermediate Description

## Purpose
Demonstrates loading and calling functions from shared libraries (DLLs on Windows, .so on Linux, .dylib on macOS).

## Application Type
GUI (Debug output / MessageBox on Windows)

## Compiler Flags
None (default GUI mode)

## Structure
- Uses CompilerSelect to handle platform-specific library loading
- Windows: loads USER32.DLL and calls MessageBoxW
- Linux: loads libc.so, calls malloc/free
- macOS: loads libc.dylib, calls malloc/free

## Key Libraries/Functions
- OpenLibrary(), GetFunction(), CloseLibrary()
- CallFunctionFast(), CallCFunctionFast(), CallCFunction()
- CompilerSelect, CompilerCase, CompilerEndSelect
- #PB_Compiler_OS, #PB_OS_Windows, #PB_OS_Linux, #PB_OS_MacOS

## Input/Output
- Input: None
- Output: Windows: MessageBox dialog; Linux/macOS: Debug output for buffer allocation

## Logic Flow
1. CompilerSelect on #PB_Compiler_OS
2. Windows: Open USER32.DLL, get MessageBoxW, call it with title and body
3. Linux: Open libc.so, get malloc, allocate 128 bytes, free it
4. macOS: Open libc.dylib, get malloc, allocate 128 bytes, free it
5. Close library in all cases

## Cross-Platform Notes
- Different library names per platform
- CallFunctionFast for stdcall (Windows), CallCFunctionFast for cdecl (Linux/macOS)
- Uses @"string" for inline string pointers on Windows

## Important Notes
- CallFunctionFast vs CallCFunctionFast: different calling conventions
- Must use GetFunction to get function pointer before calling
- Library handle must be closed with CloseLibrary
