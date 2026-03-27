# Desktop.pb - Intermediate Description

## Purpose
Demonstrates desktop examination: enumerating all desktops and displaying their properties (size, depth, frequency, name).

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None

## Structure
- No procedures or structures
- Loop through desktops

## Key Libraries/Functions
- Desktop: ExamineDesktops, DesktopWidth, DesktopHeight, DesktopDepth, DesktopFrequency, DesktopName
- Requester: MessageRequester

## Input/Output
- No file I/O
- Output: MessageRequesters showing desktop properties

## Logic Flow
1. Examine desktops
2. Show count
3. Loop through each desktop
4. Build info string with size, depth, frequency, name
5. Display in MessageRequester

## Cross-Platform Notes
- Multi-monitor support varies by platform
- Frequency may be 0 (default)

## Important Notes
- Desktop index is 0-based
- Uses Str() for number to string conversion
