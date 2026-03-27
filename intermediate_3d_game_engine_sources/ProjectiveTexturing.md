# ProjectiveTexturing.pb - Intermediate Description
## Purpose
Demonstrates projective texturing where a card/image (ValetCoeur.jpg) is projected from a secondary camera onto 3D objects. Arrow keys move the projection target point. F12 toggles wireframe view. Objects receive the projected texture as an additional material layer.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Procedures: POM(v.f) returns random float, SetupMaterial(n, Filename$, scale.f=1)
- Variables: MouseX, MouseY, cx, cz (float, cz init 1), fdf, i
## Key Libraries/Functions
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID, ScaleMaterial, AddMaterialLayer, SetMaterialAttribute
- Mesh: CreatePlane, CreateIcoSphere, MeshID
- Entity: CreateEntity, ScaleEntity, RotateEntity
- Camera: CreateCamera, CameraFOV, MoveCamera, CameraLookAt, CameraRenderMode, CameraX, CameraY
- Line3D: CreateLine3D
- Scene: CreateLight, AmbientColor, RenderWorld, Parse3DScripts
- Constants: #PB_Material_Add, #PB_Material_ProjectiveTexturing, #PB_Material_TAM, #PB_Material_BorderTAM, #PB_Camera_Wireframe, #PB_Camera_Textured
## Input/Output
- Loads: grass.jpg, Dirt.jpg, RustySteel.jpg, ValetCoeur.jpg textures
- Displays: Ground plane with scattered icospheres receiving projected card texture
- Controls: Arrows to aim projection, F12 for wireframe, Esc to quit
## Logic Flow
1. Define POM() helper for random offset values
2. Define SetupMaterial() to load texture and create material with scaling
3. Initialize engine, sprite, keyboard, mouse
4. Open windowed screen
5. Add texture archive, parse scripts
6. Create 3 materials with SetupMaterial (grass, dirt, rusty steel)
7. Create projection camera (#1) at y=80, FOV 40, small viewport
8. Create main camera (#0) at y=80, z=-80, looking at origin
9. Create light, set ambient color
10. For materials 1-3: add ValetCoeur.jpg as additive layer with projective texturing enabled and border TAM
11. Create ground plane entity
12. Create 49 random icosphere entities with random materials, positions, scales, rotations
13. Main loop:
    a. Arrow keys adjust cx/cz (projection target)
    b. F12 toggles wireframe
    c. CameraLookAt(1, cx, 0, cz) for projection camera
    d. Draw line from projection camera to target
    e. Render
14. Exit on Escape
## Important Notes
- Projective texturing requires #PB_Material_ProjectiveTexturing attribute set on material layer
- Camera #1 is the projector, Camera #0 is the viewer
- POM() generates random values in range [-v/2, +v/2] approximately
- SetMaterialAttribute with #PB_Material_BorderTAM prevents texture repeating outside projection
- The projection camera has a small viewport (2x4) as it's used only for projection
