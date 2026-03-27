# Entity.pb - Intermediate Description
## Purpose
Demonstrates creating and displaying 3D entities using a loaded robot mesh with different materials (wireframe, copy, textured). Shows entity animation and rendering modes including skeleton display.
## Type
3D Engine Demo
## Compiler Flags
None (GUI/3D application)
## Structure
No custom structures. Uses constants: #CameraSpeed = 1
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- ExamineDesktops(), OpenWindow(), OpenWindowedScreen()
- Add3DArchive() with FileSystem and Zip archive types
- LoadMesh(), CreateMaterial(), CopyMaterial(), LoadTexture()
- MaterialShadingMode() with #PB_Material_Wireframe
- CreateEntity() - creates 3 entities with same mesh, different materials
- StartEntityAnimation() - "Walk" animation
- EntityRenderMode() with #PB_Entity_DisplaySkeleton
- SkyBox(), CreateCamera(), MoveCamera()
- RotateEntity(), RotateCamera(), MoveCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: robot.mesh, clouds.jpg, r2skin.jpg, stevecube.jpg (skybox)
- Displays: 3 robot entities - wireframe, normal, textured; with skybox
- Controls: Mouse to rotate camera, arrow keys to move camera, Esc to quit
## Logic Flow
1. Define float variables for input tracking
2. Initialize 3D engine, sprite, keyboard, mouse subsystems
3. Get desktop size, open window at 80% desktop size, open windowed screen
4. Add texture, model, and skybox archives
5. Load robot mesh (mesh 0)
6. Create 3 materials: material 0 from clouds.jpg (set to wireframe), material 1 as copy of 0, material 2 from r2skin.jpg
7. Create 3 entities at different X positions using same mesh but different materials
8. Start "Walk" animation on entity 0
9. Set entity 0 render mode to display skeleton
10. Create skybox from stevecube.jpg
11. Create camera and position it
12. Main loop: process window events, read mouse/keyboard input, rotate entities 1 and 2, rotate/move camera, render and flip
13. Exit on Escape key
## Important Notes
- Entity 0 is at origin, entity 1 at x=-60, entity 2 at x=60
- Variable 'Quit' is used but never set (for window close handling)
- No EnableExplicit in reference; must add for generated code
- Uses implicit variable types in reference (dx, dy, Quit are untyped)
