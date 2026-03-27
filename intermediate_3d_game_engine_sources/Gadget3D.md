# Gadget3D.pb - Intermediate Description
## Purpose
Demonstrates the 3D GUI system with various gadget types: progress bar, combo box, scroll bar, string input, checkbox, spinner, option buttons, regular button, panel with tabs, list view, image gadget, scroll area, editor. All rendered in the 3D scene.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Enumerations for Window3D IDs (#MainWindow, #SecondWindow) and Gadget3D IDs (many gadgets).
## Key Libraries/Functions
- OpenWindow3D() with #PB_Window3D_SizeGadget
- TextGadget3D(), ProgressBarGadget3D(), ComboBoxGadget3D()
- ScrollBarGadget3D(), StringGadget3D(), CheckBoxGadget3D()
- SpinGadget3D(), OptionGadget3D(), ButtonGadget3D()
- PanelGadget3D(), ListViewGadget3D(), ImageGadget3D()
- ScrollAreaGadget3D(), EditorGadget3D(), ContainerGadget3D()
- CloseGadgetList3D()
- AddGadgetItem3D(), SetGadgetState3D(), SetGadgetText3D()
- GadgetToolTip3D()
- InputEvent3D() with keyboard input, WindowEvent3D()
- EventGadget3D(), GetActiveWindow3D(), CloseWindow3D()
- ShowGUI() not called (uses InputEvent3D directly)
- KeyboardInkey() for text input
- DesktopResolutionX() for HiDPI scaling
## Input/Output
- Loads: clouds.jpg (for image gadget), desert07.jpg (skybox), GUI resources
- Displays: Two 3D windows with various gadgets over desert skybox
- Controls: Mouse interacts with 3D GUI, keyboard for text input, special keys (Back, Return, Delete, arrows), Esc quit
## Logic Flow
1. Define variables and enumerations
2. Initialize subsystems, open window/screen
3. Add archives (Data root, Textures, GUI, desert zip)
4. Create skybox, camera
5. Get desktop resolution for HiDPI scaling (r.d)
6. Create main 3D window with various gadgets, scaling by r
7. Create second 3D window with panel containing tabs:
   - First tab: list view with 21 items
   - Second tab: container with image, scroll area with image
   - Third tab: editor with multi-line text
8. Main loop:
   a. Process window events
   b. Examine keyboard/mouse, build input parameters
   c. Check special keys (Back, Return, arrows, Delete)
   d. Send InputEvent3D with mouse position, button, key input, special key
   e. Process WindowEvent3D loop: update active window label, handle close button
   f. Render and flip
9. Exit on Escape
## Important Notes
- HiDPI scaling using DesktopResolutionX() multiplied on all coordinates
- Many gadget types demonstrated in two 3D windows
- Special key handling maps PB keyboard constants to InputEvent3D
- CloseButton gadget can close the main window
- Panel gadget has 3 tabs with different content types
- Uses #LF$ for multiline editor text
