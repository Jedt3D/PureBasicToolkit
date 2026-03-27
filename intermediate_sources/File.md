# File.pb - Intermediate Description

## Purpose
Demonstrates basic file I/O: creating a file, writing strings, reading back, and displaying content.

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None

## Structure
- No procedures or structures
- Linear flow

## Key Libraries/Functions
- File: CreateFile, CloseFile, ReadFile, WriteString, WriteStringN, ReadString
- String: Trim
- Requester: MessageRequester

## Input/Output
- Creates and reads PureBasicTestFile.txt
- Output: MessageRequesters

## Logic Flow
1. Show welcome message
2. Create file and write strings (with and without newline)
3. Close file
4. Read file and display first line
5. Close file

## Cross-Platform Notes
- File created in current directory
- Uses Chr(13) for newline in message (reference; will use #LF$)

## Important Notes
- WriteStringN adds newline, WriteString does not
- Trim() removes leading/trailing whitespace from read string
- Error handling for both create and read failures
