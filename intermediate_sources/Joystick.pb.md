# Joystick.pb - Intermediate Description

## Purpose
Demonstrates joystick input by moving a colored box on screen based on joystick axis movement and detecting button presses.

## Application Type
GUI

## Compiler Flags
None (default GUI mode)

## Structure
- Initializes joystick subsystem
- Opens window for drawing
- Game-like loop with ExamineJoystick, axis reading, button detection
- Draws a red box at joystick-controlled position

## Key Libraries/Functions
- InitJoystick(), ExamineJoystick(), JoystickAxisX(), JoystickAxisY(), JoystickButton()
- OpenWindow(), WindowWidth(), WindowHeight()
- StartDrawing(), WindowOutput(), StopDrawing()
- FrontColor(), Box(), RGB()
- WindowEvent(), Delay(), MessageRequester()

## Input/Output
- Input: Joystick axis movement and button presses
- Output: Red box moving on window, message requesters on button presses

## Logic Flow
1. Initialize joystick, check count
2. If no joysticks, show error and end
3. Open window, show info message
4. Set initial position to center
5. Game loop: process window events, delay 20ms
6. Examine joystick, update x/y from axis values
7. Check buttons 1 and 2, show messages
8. Draw red box at current position using WindowOutput
9. Loop until window close

## Cross-Platform Notes
- Joystick library works cross-platform
- WindowOutput() for direct window drawing

## Important Notes
- Uses a polling loop with Delay(20) for ~50fps
- WindowEvent() in inner loop to process all pending events
- Direct window drawing (not double-buffered)
