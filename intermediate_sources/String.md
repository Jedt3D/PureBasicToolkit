# String.pb - Intermediate Description

## Purpose
Demonstrates basic string manipulation functions in PureBasic: Left(), Mid(), Val(), Str().

## Application Type
GUI (uses MessageRequester for output)

## Compiler Flags
None (standard GUI app)

## Structure
- Simple string operations on a test string
- Val() to convert string to numeric value
- MessageRequester to display combined result

## Key Libraries/Functions
- Left() - extracts left portion of string
- Mid() - extracts middle portion of string
- Val() - converts string to integer
- Str() - converts integer to string
- MessageRequester() - displays result

## Input/Output
- No input
- Output: MessageRequester showing manipulated string results

## Logic Flow
1. Set test string "Test"
2. Extract first character with Left()
3. Extract character at position 3 with Mid()
4. Convert "-121212" to integer with Val()
5. Display combined result via MessageRequester

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CRITICAL: Do NOT use `var$.s` - use only `var$` or `var.s`
