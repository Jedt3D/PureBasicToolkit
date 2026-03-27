# Date.pb - Intermediate Description

## Purpose
Demonstrates date/time functions: getting current date and time, formatting them as strings.

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None

## Structure
- No procedures or structures
- Two variables, one MessageRequester

## Key Libraries/Functions
- Date: Date(), FormatDate()
- Requester: MessageRequester

## Input/Output
- No file I/O
- Output: MessageRequester showing formatted date and time

## Logic Flow
1. Format current date as yyyy/mm/dd
2. Format current time as hh:ii:ss
3. Display both in a MessageRequester

## Cross-Platform Notes
- Fully cross-platform

## Important Notes
- FormatDate uses PureBasic format tokens (%yyyy, %mm, %dd, %hh, %ii, %ss)
