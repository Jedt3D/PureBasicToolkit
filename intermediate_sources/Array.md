# Array.pb - Intermediate Description

## Purpose
Demonstrates arrays: basic arrays, structured arrays, multi-dimensional arrays, filling them with data, and copying arrays.

## Application Type
GUI (uses Debug output only)

## Compiler Flags
None

## Structure
- Structure: BasicStructure (Field1.b, Field2.w, Field3.l)
- Structure: ComplexStructure (Field.b, Basic.BasicStructure)
- Arrays: BasicArray, StructuredArray, StructuredMultiArray
- No procedures

## Key Libraries/Functions
- Array: Dim, CopyArray, ArraySize
- Debug output

## Input/Output
- No file I/O
- Output: Debug showing copied array size

## Logic Flow
1. Define structures
2. Dim arrays of various types and dimensions
3. Fill arrays with For loops
4. Copy array using CopyArray
5. Debug the copied array size

## Cross-Platform Notes
- Fully cross-platform

## Important Notes
- Must use EnableExplicit
- CopyArray copies including size
