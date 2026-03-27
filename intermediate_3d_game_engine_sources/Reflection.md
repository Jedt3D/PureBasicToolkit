# Reflection.pb - Intermediate Description
## Purpose
Demonstrates real-time planar reflection using a reflection camera and render texture. A mirror plane reflects the scene using CameraReflection. The mirror can be moved/tilted with arrow keys. F12 toggles wireframe. Random icospheres float above the reflective surface.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Procedures: POM(v.f) returns random float, SetupMaterial(n, Filename$, scale.f=1)
- Variables: MouseX, MouseY, a, ap, dp, co, si (float), fdf, i
## Key Libraries/Functions
- Reflection: CameraReflection
- RenderTexture: CreateRenderTexture
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID, ScaleMaterial, AddMaterialLayer, SetMaterialAttribute
- Mesh: CreatePlane, CreateIcoSphere, MeshID
- Entity: CreateEntity, ScaleEntity, RotateEntity, MoveEntity, EntityDirection, EntityID
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraID, CameraRenderMode, ScreenWidth, ScreenHeight
- Scene: SkyBox, CreateLight, AmbientColor, RenderWorld, Parse3DScripts
- Constants: #PB_Material_ProjectiveTexturing, #PB_Material_Modulate, #PB_Camera_Wireframe, #PB_Camera_Textured, #PB_World, #PB_Vector_Y, #PB_Absolute
## Input/Output
- Loads: MRAMOR6X6.jpg, RustySteel.jpg, Dirt.jpg, soil_wall.jpg, Wood.jpg textures, desert07.jpg skybox
- Displays: Reflective plane with floating icospheres and skybox
- Controls: Arrows tilt/move mirror, F12 wireframe, Esc to quit
## Logic Flow
1. Define POM() and SetupMaterial() helpers
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen, add archives, parse scripts
4. Set skybox
5. Create main camera (#0) orbiting scene
6. Create reflection camera (#1)
7. Create render texture from reflection camera
8. Create mirror material: render texture + marble texture (modulate blend), projective texturing
9. Create mirror plane entity
10. Create 4 additional materials for icospheres
11. Create 51 random icospheres (entities 100-150)
12. Main loop:
    a. Arrow keys adjust ap (angle) and dp (displacement) for mirror
    b. F12 toggles wireframe
    c. Camera #0 orbits via cos/sin
    d. Move mirror entity using sin/cos of ap
    e. Set mirror orientation via EntityDirection
    f. Call CameraReflection(1, 0, EntityID(1)) to update reflection camera
    g. Render
13. Exit on Escape
## Important Notes
- CameraReflection updates camera #1 to mirror camera #0 about entity #1's plane
- The render texture captures the reflected view
- Projective texturing maps the reflection onto the mirror surface
- EntityDirection sets the mirror's normal vector (used for reflection plane)
- The marble texture (MRAMOR6X6.jpg) is modulated with the reflection
