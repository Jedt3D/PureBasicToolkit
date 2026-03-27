# 2DDrawing.pb - Intermediate Description

## Purpose
Demonstrates 2D drawing capabilities: creating an offscreen image with shapes (circle, box, lines) and text, then displaying it in a window via an ImageGadget.

## Application Type
GUI

## Compiler Flags
None (standard GUI app)

## Structure
- No procedures or structures
- Main flow: open window, create image, draw shapes and text, display image, event loop

## Key Libraries/Functions
- Window: OpenWindow, WaitWindowEvent
- Image: CreateImage, ImageID, ImageGadget
- 2DDrawing: StartDrawing, StopDrawing, ImageOutput, Circle, Box, LineXY, FrontColor, BackColor, DrawText, DrawingMode
- Desktop: DesktopScaledX, DesktopScaledY (for DPI awareness)

## Input/Output
- No file I/O
- Output: GUI window with drawn image

## Logic Flow
1. Open a window (300x200)
2. Create an offscreen image (DPI-scaled)
3. Start drawing on the image
4. Draw a blue circle, a green box, red lines, and white text
5. Stop drawing
6. Display the image using ImageGadget
7. Event loop until window close

## Cross-Platform Notes
- Uses DesktopScaledX/Y for DPI awareness across platforms

## Important Notes
- Uses #PB_2DDrawing_Transparent drawing mode for text
- Variables used without EnableExplicit in reference; generated version must use EnableExplicit
