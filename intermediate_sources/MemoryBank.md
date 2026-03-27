# MemoryBank.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's memory management functions: allocating memory, copying strings to memory buffers, reallocating memory to a larger size, and reading back data.

## Application Type
GUI (uses Debug output, no console)

## Compiler Flags
None required

## Structure
- Allocates a memory buffer
- Uses CopyMemoryString to write text into the buffer
- Reallocates to a larger buffer
- Reads back the string using PeekS
- Frees memory

## Key Libraries/Functions
- AllocateMemory(), ReAllocateMemory(), FreeMemory()
- CopyMemoryString(), PeekS()
- Debug

## Input/Output
- No external input
- Output via Debug statements

## Logic Flow
1. Allocate 1000 bytes of memory
2. Set a pointer to the buffer start
3. Copy "Hello " to buffer using CopyMemoryString with pointer reference
4. Append "World" using CopyMemoryString (continues from last position)
5. Reallocate buffer to 2000 bytes
6. If reallocation succeeds, display old content and free the larger buffer
7. If reallocation fails, free the original buffer

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CopyMemoryString with @*Pointer sets the initial write position
- Subsequent CopyMemoryString calls without position continue from last write
- ReAllocateMemory preserves existing content
- Always check ReAllocateMemory return value as it may fail
