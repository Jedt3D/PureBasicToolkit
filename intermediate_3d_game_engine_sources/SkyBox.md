# SkyBox.pb - Intermediate Description
## Purpose
Demonstrates SkyBox functionality in the 3D engine, allowing the user to switch between different skybox textures at runtime using function keys.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Enumeration for #MainWindow, #Editor
- Constants: #CameraSpeed = 1
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- CreateMaterial(), LoadTexture(), CreateEntity(), LoadMesh()
- CreateCamera(), MoveCamera(), CameraBackColor(), CameraViewWidth(), CameraViewHeight()
- OpenWindow3D(), EditorGadget3D(), SetGadgetText3D(), ShowGUI()
- SkyBox() - main feature to set/change/disable skybox
- RotateCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: r2skin.jpg texture, robot.mesh model, desert.zip pack, skybox.zip pack
- Displays: Robot entity with SkyBox background, 3D GUI window with instructions
- F2: stevecube.jpg skybox, F3: desert07.jpg skybox, F4: disable skybox
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen at 80% desktop size
3. Add multiple 3D archives (textures, models, packs, scripts, GUI)
4. Parse 3D scripts
5. Create material from r2skin.jpg, create robot entity
6. Create camera at (0,0,100), set back color
7. Calculate GUI ratios based on camera view size
8. Open 3D window with editor gadget showing instructions
9. Set initial skybox to desert07.jpg
10. Show GUI semi-transparent
11. Main loop: handle window events, mouse input, keyboard input
12. F2/F3/F4 change or disable skybox
13. Arrow keys move camera, mouse rotates camera
14. Render and flip until Escape or Quit
## Important Notes
- Uses windowed screen mode with 80% desktop size
- SkyBox("") with empty string disables the skybox
- Uses #PB_Relative for camera rotation
- Variable 'Quit' is referenced but never explicitly declared (implicit)
