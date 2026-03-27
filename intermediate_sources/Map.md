# Map.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's Map (hash table / dictionary) data structure, including adding elements, iterating with ResetMap/NextMapElement, iterating with ForEach, finding specific elements by key, and checking map size.

## Application Type
GUI (uses Debug output only, no console)

## Compiler Flags
None required (standard GUI/Debug mode)

## Structure
- Defines a Structure `BasicStructure` with three fields: byte, word, long
- Creates a NewMap of that structure type
- Populates with 4 keyed elements
- Demonstrates 3 ways to access map data:
  1. ResetMap + While NextMapElement loop
  2. ForEach loop
  3. Direct FindMapElement lookup

## Key Libraries/Functions
- NewMap, MapSize(), ResetMap(), NextMapElement(), ForEach/Next, FindMapElement()
- Structure definition

## Input/Output
- No external input
- Output via Debug statements

## Logic Flow
1. Define structure with byte, word, long fields
2. Create map of that structure
3. Add 4 elements with string keys "item1" through "item4"
4. Display map size
5. Iterate all elements using ResetMap/While loop
6. Iterate all elements using ForEach loop
7. Find and display specific element "item3"

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Map keys are strings
- Must use parentheses after map name for element access
- ResetMap resets internal pointer before iteration
