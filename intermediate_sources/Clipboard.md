# Clipboard.pb - Intermediate Description

## Purpose
Demonstrates clipboard operations: setting and getting text, and pasting an image to the clipboard.

## Application Type
GUI (uses MessageRequester, OpenFileRequester)

## Compiler Flags
None

## Structure
- No procedures or structures
- Linear flow

## Key Libraries/Functions
- Clipboard: SetClipboardText, GetClipboardText, SetClipboardImage
- Image: LoadImage
- Requester: MessageRequester, OpenFileRequester

## Input/Output
- Optional file input: loads a BMP image via file requester
- Output: clipboard operations and message dialogs

## Logic Flow
1. Set clipboard text to a sample string
2. Display clipboard text content
3. Open file requester to load a BMP image
4. If loaded, paste image to clipboard
5. Show success message

## Cross-Platform Notes
- BMP format for image load
- Clipboard operations work cross-platform

## Important Notes
- Simple linear program
- Uses Chr(10) for newline in message
