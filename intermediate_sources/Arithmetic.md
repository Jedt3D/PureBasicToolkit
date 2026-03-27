# Arithmetic.pb - Intermediate Description

## Purpose
Demonstrates basic PureBasic variable types (byte, word, long, float), binary/hex literals, arithmetic operations, structures, and linked lists.

## Application Type
GUI (uses Debug output only)

## Compiler Flags
None (standard GUI app, uses Debug)

## Structure
- Structure: BasicStructure (Field1.b, Field2.w, Field3.l)
- Linked list: TestList of BasicStructure
- No procedures

## Key Libraries/Functions
- Core: Define variables with types (.b, .w, .l, .f)
- LinkedList: NewList, AddElement, ForEach
- Debug output

## Input/Output
- No file I/O
- Output: Debug window showing linked list field values

## Logic Flow
1. Declare typed variables (byte, word, long, float)
2. Demonstrate binary and hex literals
3. Perform arithmetic
4. Define a structure
5. Create a linked list of structures
6. Add elements and iterate with ForEach
7. Debug output

## Cross-Platform Notes
- Fully cross-platform

## Important Notes
- Must use EnableExplicit
- Variables need type declarations
