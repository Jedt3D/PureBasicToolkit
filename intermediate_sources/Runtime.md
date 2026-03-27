# Runtime.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's Runtime feature, which allows accessing procedures, variables, and other elements at runtime by name (as strings). This is useful for dynamic access patterns like those used by the Dialog library.

## Application Type
GUI (uses Debug output and MessageRequester implicitly through Debug window)

## Compiler Flags
None (standard GUI app)

## Structure
- One Runtime Procedure: `RuntimeProcedure()` - a simple procedure marked with `Runtime` keyword
- One Runtime Variable: `RuntimeVariable.i` - an integer variable exposed at runtime
- Uses `GetRuntimeInteger()` and `SetRuntimeInteger()` to access/modify values by name

## Key Libraries/Functions
- Runtime keyword (procedure and variable declaration)
- GetRuntimeInteger() - retrieve runtime value by name string
- SetRuntimeInteger() - set runtime value by name string
- Debug - output display

## Input/Output
- No user input
- Output via Debug window showing runtime procedure address and variable values

## Logic Flow
1. Declare a Runtime procedure
2. Display the procedure's address using GetRuntimeInteger with the procedure name
3. Set a runtime variable to 128
4. Display the variable value via GetRuntimeInteger
5. Modify the variable via SetRuntimeInteger to 256
6. Display the changed variable value directly

## Cross-Platform Notes
No platform-specific code

## Important Notes
- The Runtime keyword must precede both procedure declarations and variable exposure
- This example is primarily useful in the IDE debugger context (uses Debug)
