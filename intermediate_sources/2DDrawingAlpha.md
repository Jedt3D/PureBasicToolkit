# 2DDrawingAlpha.pb - Intermediate Description

## Purpose
Demonstrates alpha channel drawing capabilities: transparent circles, semi-transparent text, gradient fills, and various drawing modes (Default, AlphaBlend, AlphaClip, AlphaChannel, AllChannels).

## Application Type
GUI

## Compiler Flags
None (standard GUI app)

## Structure
- No procedures
- Main flow: create alpha image with various effects, create display image with checkerboard background, overlay alpha image

## Key Libraries/Functions
- Window: OpenWindow, WaitWindowEvent
- Image: CreateImage, ImageID, ImageGadget, CatchImage (with embedded data)
- 2DDrawing: RGBA, DrawAlphaImage, DrawImage, DrawText, Circle, Box, Line, FillArea
- Drawing modes: #PB_2DDrawing_AlphaChannel, #PB_2DDrawing_AlphaBlend, #PB_2DDrawing_AlphaClip, #PB_2DDrawing_AllChannels, #PB_2DDrawing_Gradient, #PB_2DDrawing_Transparent, #PB_2DDrawing_Outlined
- Gradient: LinearGradient, ConicalGradient, GradientColor, ResetGradientColors
- Font: LoadFont, DrawingFont, FontID, TextWidth, TextHeight

## Input/Output
- Reference uses embedded PNG binary data in DataSection
- Output: GUI window showing alpha channel effects

## Logic Flow
1. Open 800x600 window
2. Load font and catch embedded test image
3. Create 32-bit alpha image, draw transparent circles, alpha text, gradient effects
4. Create 24-bit display image with checkerboard pattern background
5. Overlay alpha image onto display image
6. Show in ImageGadget
7. Event loop until close

## Cross-Platform Notes
- Uses DesktopScaledX/Y for DPI awareness
- UsePNGImageDecoder needed for the embedded PNG

## Important Notes
- Reference has large embedded binary DataSection for a test PNG image
- Generated version will create a simple test image programmatically instead
- Multiple Step values in For loops (Step -20, Step 4, Step #box_size*2) - all are compile-time constants which is fine
