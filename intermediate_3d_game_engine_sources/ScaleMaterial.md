# ScaleMaterial.pb - Intermediate Description
## Purpose
Demonstrates ScaleMaterial() by showing two plane entities side by side: one with a normal material and one with the same material scaled (1x3), making the texture repeat differently.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, RenderWorld
- Material: CreateMaterial, LoadTexture, CopyMaterial, ScaleMaterial
- Mesh: CreatePlane
- Entity: CreateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- Light: AmbientColor, CreateLight
## Input/Output
- Loads: MRAMOR6X6.jpg texture
- Displays: Two planes side by side, one with normal texture, one with scaled texture
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add Data and Textures archives
4. Create material 0 from MRAMOR6X6.jpg texture
5. Copy material 0 to material 1
6. ScaleMaterial(1, 1, 3) to scale V coordinate by 3x
7. Create plane mesh (30x10)
8. Create entity 0 at (-16, 0, 0) with material 0 (unscaled)
9. Create entity 1 at (16, 0, 0) with material 1 (scaled)
10. Create camera at (0, 50, 2) looking at origin, dark blue background
11. Set ambient light and create directional light
12. Main loop: RenderWorld, FlipBuffers
13. Exit on Escape
## Important Notes
- Simple static scene - no animation or interaction beyond quitting
- ScaleMaterial changes UV scaling which affects texture tiling
