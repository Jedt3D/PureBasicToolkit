# TextureAddressingMode.pb - Intermediate Description
## Purpose
Demonstrates different texture addressing modes (Wrap, Mirror, Clamp, Border) on cubes and shows the effect of Clamp vs Wrap on grass planes with alpha blending.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Procedure: POM(v.f) - returns random value in range [-v, +v]
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- CreateCube(), LoadTexture(), CreateMaterial()
- ScaleMaterial(), MaterialFilteringMode() with #PB_Material_Anisotropic
- CopyMaterial(), SetMaterialAttribute() with #PB_Material_TAM
- #PB_Material_MirrorTAM, #PB_Material_ClampTAM, #PB_Material_BorderTAM
- MaterialBlendingMode() with #PB_Material_AlphaBlend
- MaterialCullingMode() with #PB_Material_NoCulling
- CreatePlane(), TransformMesh()
- CreateEntity(-1), RotateEntity()
- CreateLight(), CreateCamera(), MoveCamera(), CameraLookAt(), CameraBackColor()
- Cos(), Sin() for camera orbit
- RenderWorld(), FlipBuffers(), WindowEvent()
## Input/Output
- Loads: Dr_Bunsen_Head.jpg, grass2.png textures
- Displays: 4 cubes with different TAM modes, grass planes with/without clamping
## Logic Flow
1. Initialize engine, sprite, keyboard
2. Open window and windowed screen
3. Add texture archive, parse scripts
4. Create cube mesh, load texture, create base material scaled to 0.5
5. Copy material 3 times, set different TAM modes (Mirror, Clamp, Border)
6. Create 4 cube entities with different materials
7. Load grass texture, create material with alpha blending and no culling
8. Copy to clamped version
9. Create plane mesh, transform to vertical orientation
10. Create 101 grass entities on each side (without clamp left, with clamp right)
11. Create light and camera
12. Main loop: orbit camera around origin using Cos/Sin, render, flip
13. Exit on close window event or Escape
## Important Notes
- ScaleMaterial(0, 0.5, 0.5) causes texture to repeat, showing TAM effects
- POM function generates random positions for grass placement
- Camera orbits automatically without user input
- Uses WindowEvent() = #PB_Event_CloseWindow for exit condition
- TransformMesh rotates the plane mesh to be vertical
- CreateEntity(-1) is equivalent to #PB_Any but returns index directly
