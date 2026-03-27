# Text3D.pb - Intermediate Description
## Purpose
Demonstrates 3D text rendering by creating a Text3D object attached to a rotating cube entity, showing text that moves with the entity in 3D space.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures or constants
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- CreateCube(), CreateMaterial(), LoadTexture()
- CreateEntity(), RotateEntity()
- CreateText3D(), Text3DColor() with RGBA, Text3DAlignment() with #PB_Text3D_HorizontallyCentered
- Text3DID(), AttachEntityObject(), MoveText3D()
- CreateCamera(), MoveCamera()
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Caisse.png texture, fonts data
- Displays: Rotating cube with "Hello world" 3D text attached above it
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add archives for textures and fonts
4. Create cube mesh and material from Caisse.png
5. Create entity from cube
6. Create Text3D with "Hello world", set red color, center alignment
7. Attach text to entity with empty bone name, move text above entity
8. Rotate entity initial orientation
9. Create camera at (0,0,10)
10. Main loop: examine keyboard, rotate entity each frame, render, flip
## Important Notes
- Text3D is attached to entity using AttachEntityObject with empty string for bone
- MoveText3D offsets the text relative to the entity
- Text3DColor uses RGBA (not RGB)
- Text3DAlignment uses #PB_Text3D_HorizontallyCentered
- Font archive must be added for 3D text rendering
