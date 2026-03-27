# Image.pb - Intermediate Description

## Purpose
Demonstrates image creation, drawing, copying, resizing, and grabbing portions of images.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Creates an image with gradient drawing
- Copies and resizes the image
- Grabs a portion of the original image
- Displays all three images in a window

## Key Libraries/Functions
- OpenWindow(), CreateImage(), ImageOutput(), ImageGadget(), ImageID()
- StartDrawing(), StopDrawing(), FrontColor(), Line(), DrawingMode(), DrawText()
- CopyImage(), ResizeImage(), GrabImage()
- ImageWidth(), ImageHeight(), RGB()

## Input/Output
- Input: None
- Output: Window showing original image, resized copy, and grabbed portion

## Logic Flow
1. Open window
2. Create 255x255 image
3. Draw gradient lines from black to pink
4. Set transparent drawing mode, draw white text
5. Stop drawing
6. CopyImage to create image 1, resize to 100x100
7. GrabImage to create image 2 from a specific region
8. Display all three images in ImageGadgets
9. Wait for close event

## Cross-Platform Notes
- 2D drawing works cross-platform
- RGB color values are platform-independent

## Important Notes
- Uses FrontColor() and Line() for gradient effect
- DrawingMode(#PB_2DDrawing_Transparent) for text background
- Demonstrates CopyImage, ResizeImage, GrabImage workflows
