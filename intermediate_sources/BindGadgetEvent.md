# BindGadgetEvent.pb - Intermediate Description

## Purpose
Demonstrates BindGadgetEvent by creating a custom TrackBar using a CanvasGadget with gradient drawing and mouse interaction.

## Application Type
GUI

## Compiler Flags
None

## Structure
- Procedure RepaintCanvas(x) - draws trackbar at position x
- Procedure OnLeftClick() - handles left click on canvas
- Procedure OnMouseMove() - handles mouse drag on canvas

## Key Libraries/Functions
- Window: OpenWindow, WaitWindowEvent
- Gadget: CanvasGadget, GetGadgetAttribute, GadgetWidth
- Event binding: BindGadgetEvent with specific event types
- Drawing: gradient, Box, LinearGradient, FrontColor, BackColor
- Desktop: DesktopScaledX

## Input/Output
- No file I/O
- Output: GUI window with custom trackbar

## Logic Flow
1. Open small window with CanvasGadget
2. Paint initial trackbar at position 50
3. Bind left click and mouse move events
4. On click: repaint canvas at click position
5. On mouse move with left button: repaint canvas at mouse position
6. Event loop

## Cross-Platform Notes
- Uses DesktopScaledX for DPI-aware coordinates

## Important Notes
- Uses #PB_2DDrawing_Gradient mode for visual effect
- Mouse position clamped to gadget bounds
