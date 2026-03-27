# DPI_LoadImage.pb - Intermediate Description

## Purpose
Demonstrates DPI-aware image loading by creating a helper procedure that loads and resizes an image according to desktop scaling.

## Application Type
GUI

## Compiler Flags
None

## Structure
- Procedure LoadImageDPI(Image, File.s) - loads and resizes image for DPI
- No structures

## Key Libraries/Functions
- Image: LoadImage, ResizeImage, ImageWidth, ImageHeight, ImageID
- Desktop: DesktopScaledX, DesktopScaledY
- Window: OpenWindow, WaitWindowEvent
- Gadget: ButtonImageGadget

## Input/Output
- Input: loads PureBasic.bmp from compiler home examples
- Output: GUI window with DPI-scaled button image

## Logic Flow
1. Define LoadImageDPI procedure that loads and scales image
2. Open window
3. Load image using LoadImageDPI with compiler home path
4. Create ButtonImageGadget with loaded image
5. Event loop

## Cross-Platform Notes
- DPI scaling is important on high-DPI displays (Retina, etc.)
- Uses #PB_Compiler_Home for portable path

## Important Notes
- Handles both #PB_Any and numbered image IDs
- Uses DesktopScaledX/Y for proper DPI scaling
