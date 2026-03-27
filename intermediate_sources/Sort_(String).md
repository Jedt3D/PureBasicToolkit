# Sort_(String).pb - Intermediate Description

## Purpose
Demonstrates sorting a string array using PureBasic's SortArray() with case-insensitive sorting. Reads strings from a DataSection, displays them, sorts, and displays the sorted result.

## Application Type
GUI (uses Debug output and MessageRequester)

## Compiler Flags
None (standard GUI app)

## Structure
- Constant #NbElements = 8 (9 strings, 0-8)
- String array populated from DataSection using Read.s
- SortArray() with ascending + case-insensitive flags
- DataSection with 9 test strings

## Key Libraries/Functions
- Dim - array declaration (.s type)
- Read.s - reads data from DataSection
- SortArray() - sorts with #PB_Sort_Ascending | #PB_Sort_NoCase
- Debug - output display
- MessageRequester() - completion notice
- DataSection / Data.s - embedded string data

## Input/Output
- No external input
- Debug output showing before/after sort
- MessageRequester completion dialog

## Logic Flow
1. Define element count constant
2. Dimension string array
3. Read strings from DataSection into array
4. Display unsorted strings
5. Sort array ascending, case-insensitive
6. Display sorted strings
7. Show completion message
8. End program

## Cross-Platform Notes
No platform-specific code

## Important Notes
- DataSection must have exactly #NbElements+1 entries
