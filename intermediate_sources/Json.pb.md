# Json.pb - Intermediate Description

## Purpose
Demonstrates JSON creation from scratch and parsing from a string, using PureBasic's JSON library.

## Application Type
GUI (Debug output only)

## Compiler Flags
None (default GUI mode, Debug output)

## Structure
- Part 1: Create JSON object with person data (name, age, values array)
- Part 2: Parse JSON array string and extract values into a list

## Key Libraries/Functions
- CreateJSON(), JSONValue(), SetJSONObject(), SetJSONArray()
- AddJSONMember(), AddJSONElement()
- SetJSONString(), SetJSONInteger()
- ComposeJSON(), #PB_JSON_PrettyPrint
- ParseJSON(), ExtractJSONList()
- NewList, ForEach

## Input/Output
- Input: Hardcoded JSON string for parsing
- Output: Debug output of composed JSON (compact and pretty-printed) and extracted values

## Logic Flow
1. Create JSON #0: build person object with FirstName, LastName, Age, Values array
2. Output compact and pretty-printed formats via ComposeJSON
3. Parse JSON #1: parse array string "[1, 3, 5, 7, null, 23, 25, 27]"
4. Extract values into a linked list using ExtractJSONList
5. Display extracted values via Debug

## Cross-Platform Notes
- JSON library is platform-independent

## Important Notes
- Uses enumerated JSON constants (#JSON_Create, #JSON_Parse)
- Random() used for generating array values
- ExtractJSONList handles null values (becomes 0)
