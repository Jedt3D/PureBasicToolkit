# Window3D.pb - Intermediate Description
## Purpose
Demonstrates the 3D GUI system with a 3D window containing a button, showing how to handle 3D GUI events similar to regular PureBasic GUI events.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #MainWindow = 0, #CloseButton = 0
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive()
- SkyBox()
- CreateCamera(), MoveCamera()
- OpenWindow3D() - creates a 3D GUI window
- ButtonGadget3D() - creates a 3D button
- ShowGUI() - displays GUI with transparency and mouse cursor
- InputEvent3D() - passes mouse/keyboard input to 3D GUI
- WindowEvent3D() - returns 3D GUI events
- EventWindow3D(), EventGadget3D() - identify event sources
- CloseWindow3D() - closes 3D window
- #PB_Event3D_CloseWindow, #PB_Event3D_Gadget - 3D event constants
- KeyboardInkey() - gets keyboard text input
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: GUI data, desert skybox
- Displays: 3D window with "Hello in 3D !" title and "Quit" button
## Logic Flow
1. Initialize engine, create windowed screen
2. Add GUI and desert archives
3. Set desert skybox
4. Create camera at (0,100,100)
5. Open 3D window at (100,100,500,200) with title
6. Create Quit button in 3D window
7. Show GUI semi-transparent with mouse cursor
8. Main loop:
   - Handle regular window events
   - Pass mouse position, button, and keyboard input to InputEvent3D
   - Process 3D events in inner loop:
     - #PB_Event3D_CloseWindow: close the 3D window
     - #PB_Event3D_Gadget: if Quit button, set Quit flag
   - Render and flip
9. Exit on Escape or Quit
## Important Notes
- InputEvent3D requires mouse position, button state, and keyboard text
- 3D GUI events mirror regular PureBasic GUI event patterns
- ShowGUI(128, 1): 128 = semi-transparent, 1 = show mouse cursor
- KeyboardInkey() provides text input for the 3D GUI
- Inner Repeat/Until loop processes all pending 3D events
