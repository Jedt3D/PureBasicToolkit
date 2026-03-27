# String Guess UTF8.pb - Intermediate Description

## Purpose
Demonstrates how to detect whether a raw memory buffer contains a valid UTF-8 encoded string. Implements a byte-level UTF-8 validator that checks multi-byte sequence patterns.

## Application Type
GUI (uses Debug for output)

## Compiler Flags
None (standard GUI app)

## Structure
- Procedure `seems_utf8(*StrMem, iLen.i)` - UTF-8 detection function
  - Walks through each byte of the buffer
  - Checks for valid UTF-8 multi-byte sequence headers (110xxxxx, 1110xxxx, etc.)
  - Validates continuation bytes (10xxxxxx pattern)
  - Returns #True if valid UTF-8 multi-byte sequences found, #False otherwise
- Test code with various string encodings (Unicode, ASCII, UTF-8)

## Key Libraries/Functions
- PeekA() - reads a single byte from memory
- AllocateMemory() - allocates memory buffer
- PokeS() - writes string to memory in specified encoding
- Ascii() - converts string to ASCII buffer
- UTF8() - converts string to UTF-8 buffer
- #PB_UTF8, #PB_Ascii - encoding constants

## Input/Output
- No user input
- Debug output showing #True/#False for various encoding tests

## Logic Flow
1. Define seems_utf8 procedure that analyzes byte patterns
2. For each byte, determine expected continuation bytes based on leading bits
3. Verify continuation bytes match 10xxxxxx pattern
4. Test with various encodings:
   - Unicode string pointer -> returns #False
   - UTF-8 encoded buffer -> returns #True
   - ASCII encoded buffer -> returns #False
   - Pure ASCII content in UTF-8 -> returns #False (indistinguishable)

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CRITICAL: Do NOT use `var$.s` pattern - use either `var$` or `var.s`
- Pure ASCII content cannot be distinguished from UTF-8 (returns #False)
