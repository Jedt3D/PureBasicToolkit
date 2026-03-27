# Printer.pb - Intermediate Description

## Purpose
Demonstrates printing: opening a printer dialog, starting a print job, drawing text in different fonts, drawing an image, and drawing a colored box on the printed page.

## Application Type
GUI (PrintRequester and printing functions)

## Compiler Flags
None required (GUI application)

## Structure
- Opens printer dialog
- Starts a print job
- Loads fonts for drawing
- Uses StartDrawing with PrinterOutput
- Draws text, image, and colored box
- Stops drawing and printing

## Key Libraries/Functions
- PrintRequester()
- StartPrinting(), StopPrinting()
- StartDrawing(), StopDrawing(), PrinterOutput()
- LoadFont(), DrawingFont(), FontID()
- BackColor(), FrontColor(), DrawText()
- LoadImage(), DrawImage(), ImageID()
- Box()
- RGB()

## Input/Output
- Input: user selects printer via dialog
- Output: printed page with text, image, and box

## Logic Flow
1. Show printer selection dialog
2. Start print job with title
3. Load two fonts (small and large)
4. Start drawing on printer output
5. Set white background, black foreground
6. Draw text with small font
7. Draw text with large font
8. Load and draw an image
9. Draw a red box
10. Stop drawing and stop printing

## Cross-Platform Notes
- PrintRequester and printer output may behave differently across platforms
- Font rendering on printer uses printer DPI

## Important Notes
- PrintRequester() returns nonzero if user selected a printer
- StartPrinting() begins a new page
- PrinterOutput() provides the drawing context
- Uses #PB_Compiler_Home for example data path
