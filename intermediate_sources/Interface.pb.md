# Interface.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's Interface system for object-oriented programming with virtual tables, showing two examples: a simple Foo object and a Rectangle object.

## Application Type
GUI (Debug output only)

## Compiler Flags
None (default GUI mode, Debug output)

## Structure
### Example 1 - Foo Object:
- Structure Foo with vt pointer and intFoo field
- Interface IFoo with Get, Set, Free methods
- Virtual table in DataSection
- Constructor New_Foo(), methods Foo_SetFoo/GetFoo/Free

### Example 2 - Rectangle Object:
- Interface NewRectangle with Perimeter, Surface, Length, Width, Destroy
- Structure Rectangle with DSVT pointer, Length, Width fields
- Constructor RectangleInit(), methods for perimeter/surface/length/width/destroy
- Virtual table in DataSection

## Key Libraries/Functions
- Interface, Structure, DataSection, Data.i
- AllocateMemory(), FreeMemory(), SizeOf()
- ProcedureReturn, @() for procedure addresses
- Protected for local variables

## Input/Output
- Input: None
- Output: Debug output showing object method results

## Logic Flow
1. Example 1: Define Foo structure, methods, interface, virtual table
2. Create Foo instance, set value to 123, get and debug, free
3. Example 2: Define Rectangle interface, structure, methods
4. Create virtual table in DataSection
5. Create Rectangle(20,10), print perimeter and surface
6. Modify length and width, print new values
7. Destroy object

## Cross-Platform Notes
- Interface/virtual table pattern is platform-independent
- Pointer sizes handled by .i type

## Important Notes
- First member of structure must be pointer to virtual table
- Interface hides the *this pointer from caller
- @ProcedureName() gets procedure address for virtual table
- Uses AllocateStructure for nested structure allocation
