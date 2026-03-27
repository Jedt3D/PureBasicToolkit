# ImagePlugin_GIF.pb - Intermediate Description

## Purpose
Animated GIF viewer that loads a GIF file and plays its frames using a timer and CanvasGadget.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Enables GIF decoder
- Loads GIF image file
- Creates window and CanvasGadget
- Uses window timer for frame animation
- Each frame can have different delay

## Key Libraries/Functions
- UseGIFImageDecoder()
- LoadImage(), ImageWidth(), ImageHeight(), ImageID()
- SetImageFrame(), GetImageFrameDelay(), ImageFrameCount()
- OpenWindow(), CanvasGadget(), CanvasOutput()
- AddWindowTimer(), RemoveWindowTimer()
- StartDrawing(), DrawImage(), StopDrawing()
- DesktopUnscaledX(), DesktopUnscaledY()
- WaitWindowEvent(), #PB_Event_Timer

## Input/Output
- Input: GIF file from PureBasic examples directory
- Output: Animated GIF display in window

## Logic Flow
1. Enable GIF decoder
2. Load GIF image from PureBasic examples
3. Open window sized to image dimensions
4. Create CanvasGadget
5. Add initial timer with 1ms delay to show first frame
6. Event loop: on timer event, set current frame, adjust timer to frame's delay
7. Draw current frame on canvas
8. Increment frame counter, loop back to 0 when past last frame
9. Continue until window close

## Cross-Platform Notes
- Uses #PB_Compiler_Home for GIF file path
- DesktopUnscaledX/Y for DPI handling

## Important Notes
- Each GIF frame has its own delay value from GetImageFrameDelay()
- Timer is removed and re-added with new delay for each frame
- Frame counter wraps using ImageFrameCount()
