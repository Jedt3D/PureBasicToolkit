# List.pb - Intermediate Description

## Purpose
Demonstrates linked lists with simple and complex nested structures, including pointer-based structure composition.

## Application Type
GUI (Debug output only)

## Compiler Flags
None (default GUI mode, Debug output)

## Structure
### BasicStructure:
- Field1.i, Field2.w, Field3.l

### ComplexStructure:
- Field1.i
- *Basic.BasicStructure (pointer to BasicStructure)
- Basic2.BasicStructure (embedded BasicStructure)
- *Next.ComplexStructure (pointer to another ComplexStructure)

## Key Libraries/Functions
- NewList, AddElement(), ResetList(), NextElement()
- ForEach, SelectElement(), ListSize()
- AllocateStructure(), FreeStructure()
- Structure definitions with pointers and embedded structures

## Input/Output
- Input: None (programmatic data)
- Output: Debug output showing structure field values

## Logic Flow
1. Define BasicStructure and ComplexStructure
2. Create two linked lists
3. Add 4 elements to BasicStructure list with Field2 values 1-4
4. Display list size, iterate with ResetList/NextElement, iterate with ForEach
5. SelectElement to jump to 3rd element
6. Add ComplexStructure elements with allocated sub-structures
7. Set fields in pointer-based and embedded sub-structures
8. Create chain via Next pointers with AllocateStructure
9. Debug all nested field values

## Cross-Platform Notes
- Linked list and structure operations are platform-independent

## Important Notes
- Pointer fields (*Basic) accessed without * prefix when reading fields
- AllocateStructure() used for dynamically allocated structure instances
- Demonstrates both embedded and pointer-referenced sub-structures
- Shows two iteration methods: ResetList+NextElement and ForEach
