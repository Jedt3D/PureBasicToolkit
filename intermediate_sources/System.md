# System.pb - Intermediate Description

## Purpose
Displays system information including username, computer name, CPU count, and total physical memory using PureBasic's System library.

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None (standard GUI app)

## Structure
- Single MessageRequester call displaying system info from various functions

## Key Libraries/Functions
- UserName() - returns current username
- ComputerName() - returns computer name
- CountCPUs() - returns number of CPUs/cores
- MemoryStatus() - returns memory information
- #PB_System_TotalPhysical - constant for total physical memory
- Str() - integer to string conversion

## Input/Output
- No input
- Output: MessageRequester showing system information

## Logic Flow
1. Gather system info (username, computer name, CPU count, memory)
2. Format memory in MB (divide by 1024*1024)
3. Display all info in a single MessageRequester

## Cross-Platform Notes
Works on all platforms

## Important Notes
- Memory is reported in bytes by MemoryStatus(), converted to MB for display
