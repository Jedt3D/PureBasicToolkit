# CanvasGadget.pb - Intermediate Description

## Purpose
A mini paint program using CanvasGadget: brush, line, box, circle, fill tools with color picker, load/save JPEG support.

## Application Type
GUI

## Compiler Flags
None

## Structure
- Enumerations for images and gadgets
- Global variables: CurrentColor, CurrentMode, StartX, StartY
- Procedure DrawAction(x, y, EventType) - performs drawing based on mode
- No structures

## Key Libraries/Functions
- Window: OpenWindow, WaitWindowEvent
- Gadgets: CanvasGadget, ButtonGadget, ButtonImageGadget, SetGadgetState, SetGadgetAttribute
- Drawing: Circle, LineXY, Box, Ellipse, FillArea, DrawImage
- Image: CreateImage, LoadImage, SaveImage, FreeImage, ImageID
- Requester: ColorRequester, OpenFileRequester, SaveFileRequester, MessageRequester
- Image plugins: UseJPEGImageDecoder, UseJPEGImageEncoder

## Input/Output
- Optional file I/O for loading/saving JPEG images
- Output: GUI paint application

## Logic Flow
1. Create images for color swatch and content backup
2. Open window with canvas and tool buttons
3. Event loop handling canvas drawing events and button clicks
4. Drawing modes: brush, line, box, circle, fill
5. Color picker via ColorRequester
6. Load/save via file requesters

## Cross-Platform Notes
- Uses DesktopScaledX/Y for DPI
- JPEG format for save/load

## Important Notes
- Content backup image used for rubber-banding (line, box, circle)
- #PB_Canvas_ClipMouse clips mouse to canvas
- Toggle buttons for tool selection
- FileSize used for overwrite check
