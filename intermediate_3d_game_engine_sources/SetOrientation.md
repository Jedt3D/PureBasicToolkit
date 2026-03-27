# SetOrientation.pb - Intermediate Description
## Purpose
Demonstrates SetOrientation() and FetchOrientation() to copy the rotation/orientation of one entity to another. Two robot entities are shown: one rotates continuously, and the other mirrors its orientation using quaternion fetch/set.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, RenderWorld, SkyBox
- Entity: CreateEntity, RotateEntity, EntityID
- Mesh: LoadMesh
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, RotateCamera
- Orientation: FetchOrientation, SetOrientation, GetX, GetY, GetZ, GetW
- Constants: #CameraSpeed, #PB_Absolute, #PB_Relative, #PB_3DArchive_Zip
## Input/Output
- Loads: robot.mesh, clouds.jpg, r2skin.jpg, stevecube.jpg (skybox)
- Displays: Two robots - one rotating, one mirroring orientation via quaternion
## Logic Flow
1. Define #CameraSpeed = 1, float variables for input
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add Textures, Models archives and skybox.zip
5. Load robot mesh
6. Create materials: clouds.jpg and r2skin.jpg
7. Create entity 1 at (-30, 0, 0) with clouds material
8. Create entity 2 at (30, 0, 0) with r2skin material
9. Set skybox
10. Create camera at (0, 40, 150)
11. Main loop:
    - Get mouse/keyboard input
    - RotateEntity(1, 0.7, 1, 0.5, #PB_Relative) - continuous rotation
    - FetchOrientation(EntityID(1)) to read entity 1's quaternion
    - SetOrientation(EntityID(2), GetX(), GetY(), GetZ(), GetW()) to apply to entity 2
    - Camera movement with keyboard/mouse
    - RenderWorld, FlipBuffers
12. Exit on Escape
## Important Notes
- FetchOrientation/SetOrientation work with quaternion components (X, Y, Z, W)
- GetX/Y/Z/W return the quaternion components from the last FetchOrientation call
- Both entities rotate identically despite being separate objects
