# Font.pb - Intermediate Description

## Purpose
Demonstrates loading and using different fonts for 2D drawing on an image displayed in a window.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Loads two fonts (Courier and Arial) at different sizes
- Creates an image, draws text using those fonts with different colors
- Displays the image in an ImageGadget within a window

## Key Libraries/Functions
- LoadFont(), FontID()
- OpenWindow(), CreateImage(), ImageOutput(), ImageGadget(), ImageID()
- StartDrawing(), StopDrawing(), Box(), DrawingMode(), DrawingFont(), DrawText()
- DesktopScaledX(), DesktopScaledY(), ImageWidth(), ImageHeight()
- RGB()

## Input/Output
- Input: None
- Output: Window displaying an image with two lines of text in different fonts/colors

## Logic Flow
1. Load Courier font (size 15) and Arial font (size 24)
2. Open a window
3. Create an image with DPI-scaled dimensions
4. Start drawing on the image
5. Fill white background
6. Set transparent text background mode
7. Draw text with Courier font in red
8. Draw text with Arial font in black
9. Stop drawing
10. Display image in an ImageGadget
11. Wait for close event

## Cross-Platform Notes
- Uses DesktopScaledX/Y for DPI awareness
- Font names "Courier" and "Arial" should be available on most systems

## Important Notes
- DrawingMode(1) = transparent text background (equivalent to #PB_2DDrawing_Transparent)
