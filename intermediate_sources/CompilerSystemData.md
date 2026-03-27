# CompilerSystemData.pb - Intermediate Description

## Purpose
Displays compiler constants, file system directories, and system information using Debug output.

## Application Type
GUI (uses Debug output only)

## Compiler Flags
None

## Structure
- No procedures or structures
- Linear flow with Debug statements
- Select/Case for OSVersion constants

## Key Libraries/Functions
- Compiler constants: #PB_Compiler_OS, #PB_Compiler_Processor, #PB_Compiler_ExecutableFormat, etc.
- FileSystem: GetCurrentDirectory, GetHomeDirectory, GetTemporaryDirectory, GetUserDirectory
- System: CPUName, ComputerName, CountCPUs, DoubleClickTime, ElapsedMilliseconds, MemoryStatus, OSVersion, UserName
- Date: FormatDate

## Input/Output
- No file I/O
- Output: Debug window with system information

## Logic Flow
1. Display compiler constants (OS, processor, format)
2. Display compiler metadata (date, file, version, etc.)
3. Display file system directories
4. Display system information (CPU, memory, OS version)
5. OS version detection via Select/Case with platform-specific constants

## Cross-Platform Notes
- OS-specific constants for Windows, Linux, macOS
- Memory status constants vary by platform

## Important Notes
- Must use verified #PB_ constants only
- OSVersion constants are platform-specific (Windows, Linux, macOS each have their own)
- All the OS version constants used in the reference are valid PureBasic constants
