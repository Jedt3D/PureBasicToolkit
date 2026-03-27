# FontRegister.pb - Intermediate Description

## Purpose
Demonstrates registering a custom font file and using it to display all ASCII characters in a ListIconGadget. The original embeds font data via DataSection; this simplified version uses a system font file.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Opens a window with a ListIconGadget with 8 columns for character ranges
- Attempts to find a system font file and register it with RegisterFontFile()
- If registration succeeds, loads the font and populates the grid with character codes and glyphs
- Simplified version: uses platform detection to find a suitable system monospace font file

## Key Libraries/Functions
- OpenWindow(), ListIconGadget(), AddGadgetColumn(), AddGadgetItem()
- RegisterFontFile(), LoadFont(), SetGadgetFont(), FontID()
- FileSize() for checking font file existence
- CompilerIf for platform detection

## Input/Output
- Input: None (uses system font)
- Output: Window showing a grid of ASCII character codes and their glyphs

## Logic Flow
1. Determine a platform-specific system font file path
2. Open window with ListIconGadget and 8 columns
3. Check if font file exists using FileSize()
4. Register the font file with RegisterFontFile()
5. Load the registered font
6. Set gadget font
7. Loop 0 to 31, adding items showing character codes and glyphs across 8 columns
8. Wait for close event

## Cross-Platform Notes
- macOS: use a font from /System/Library/Fonts/ or /Library/Fonts/
- Windows: use a font from C:\Windows\Fonts\
- Linux: use a font from /usr/share/fonts/

## Important Notes
- SIMPLIFIED version: does not embed binary font data
- Uses RegisterFontFile() which is the key API being demonstrated
- Must use a real font file path that exists on the target system
