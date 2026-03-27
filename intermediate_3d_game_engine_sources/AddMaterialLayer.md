# AddMaterialLayer.pb - Intermediate Description

## Purpose
Demonstrates how to use AddMaterialLayer() to combine multiple textures on a 3D entity. It loads a robot mesh, creates a programmatic text texture, and blends it with a skin texture using additive blending on the robot model.

## Type
3D Engine Demo

## Compiler Flags
None (GUI/3D application, no special flags)

## Structure
No custom structures. Uses constants:
- `#CameraSpeed = 1`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), LoadMesh(), CreateTexture(), CreateMaterial(), AddMaterialLayer(), CreateEntity(), StartEntityAnimation(), CreateCamera(), MoveCamera(), RotateCamera(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Keyboard: InitKeyboard(), ExamineKeyboard(), KeyboardPushed()
- Mouse: InitMouse(), ExamineMouse(), MouseDeltaX(), MouseDeltaY()
- Window: OpenWindow()
- Font: LoadFont()
- Drawing: StartDrawing(), TextureOutput(), Box(), DrawingFont(), DrawText(), StopDrawing()

## Input/Output
- Loads: robot.mesh, r2skin.jpg from Data directories, Arial font
- Displays: A walking robot with a blended "PureBasic" text overlay on its skin texture

## Logic Flow
1. Define camera speed constant and float variables for input
2. Load a bold Arial font
3. Initialize 3D engine, sprite system, keyboard, mouse
4. Get desktop size, open window and windowed screen at 80% desktop size
5. Add 3D archives for textures and models
6. Load robot mesh
7. Create a 512x512 texture, draw "PureBasic" text on black background
8. Create material from r2skin.jpg texture, add the text texture as additive layer
9. Create entity from robot mesh with the combined material
10. Start "Walk" animation on the robot, rotate it -90 degrees Y
11. Create camera, position at (0, 70, 90)
12. Main loop: process window events, read mouse/keyboard input
13. Rotate and move camera based on input
14. RenderWorld() and FlipBuffers()
15. Exit on Escape key

## Important Notes
- Uses #PB_Any for dynamic resource IDs on mesh, textures, materials, entity, camera
- Font is loaded before InitEngine3D
- The additive blending mode #PB_Material_Add is used for the material layer
- Variable `Quit` is referenced but never set (standard pattern in PB examples)
