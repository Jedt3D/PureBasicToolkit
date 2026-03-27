# Prototype.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's Prototype feature for defining function pointer types. Shows three usage patterns: prototypes in structures (OOP-like method dispatch), prototypes as procedure parameters (callbacks), and legacy function pointer calling.

## Application Type
GUI (uses Debug output)

## Compiler Flags
None required

## Structure
### Pattern 1: Prototype in Structure
- Defines a prototype for a function returning double, taking two doubles
- Creates a structure with a field of that prototype type
- Implements the procedure and a constructor that sets the function pointer
- Calls the method through the structure

### Pattern 2: Prototype as Parameter
- Defines a prototype for a function returning string
- Creates two test procedures matching the prototype
- Passes procedure addresses to a runner procedure typed with the prototype

### Pattern 3: Legacy Method
- Uses CallFunctionFast with raw procedure pointer

## Key Libraries/Functions
- Prototype keyword
- Structure with prototype fields
- AllocateStructure(), FreeStructure()
- Procedure addresses with @ProcedureName()
- CallFunctionFast() for legacy function pointer calling
- PeekS() to read string from pointer

## Input/Output
- No external input
- Output via Debug

## Logic Flow
1. Define Prototype.d for adding two doubles
2. Define Structure with prototype field
3. Implement add procedure and constructor
4. Call method through structure pointer
5. Define Prototype.s for string-returning functions
6. Implement two test procedures
7. Define runner procedure taking prototype parameter
8. Call runner with both test procedures
9. Legacy: use CallFunctionFast with raw pointer

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Prototype.d means the prototype returns a double
- Prototype.s means the prototype returns a string
- @ProcedureName() gets the address of a procedure
- Structure fields with prototype type act like method pointers
