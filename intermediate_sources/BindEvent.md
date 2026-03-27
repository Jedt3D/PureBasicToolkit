# BindEvent.pb - Intermediate Description

## Purpose
Demonstrates BindEvent and BindGadgetEvent by creating speed buttons (+ and -) using CanvasGadgets that produce continuous events while pressed, controlling a ProgressBar.

## Application Type
GUI

## Compiler Flags
None

## Structure
- Global variables: Gadget, Pressed, n, Min, Max, Delay
- Procedure paint(canvas, state, text$) - draws fake button appearance
- Procedure OnSpeedButtonEvent() - handles all canvas gadget events
- Procedure OnTimer() - handles timer events for continuous action

## Key Libraries/Functions
- Window: OpenWindow, WaitWindowEvent, AddWindowTimer
- Gadget: CanvasGadget, ProgressBarGadget, SetGadgetState, GetGadgetState
- Event binding: BindGadgetEvent, BindEvent
- Drawing: StartDrawing, CanvasOutput, Box, LineXY, DrawText
- Events: EventGadget, EventType, #PB_EventType_LeftButtonDown, etc.

## Input/Output
- No file I/O
- Output: GUI window with +/- buttons and progress bar

## Logic Flow
1. Open window with two CanvasGadgets (buttons) and a ProgressBar
2. Paint initial button states
3. Bind gadget events for both canvases
4. Bind timer event
5. On button press: set Pressed flag, repaint pressed state
6. On timer: if pressed, increment/decrement counter and progress bar
7. On button release: reset Pressed, repaint released state
8. Event loop

## Cross-Platform Notes
- Fully cross-platform

## Important Notes
- Uses Global variables for inter-procedure communication
- Timer delay is configurable
- Protected keyword used inside paint procedure for local vars
