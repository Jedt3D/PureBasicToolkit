# Material2.pb - Intermediate Description

## Purpose
Demonstrates advanced material features: alpha rejection, environment mapping (reflection and curved), material scaling, multi-layer materials, and culling modes.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Variables: MouseX, MouseY, KeyX, KeyY (floats), Quit (integer)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts
- Texture: LoadTexture
- Material: CreateMaterial, ScaleMaterial, MaterialCullingMode, AddMaterialLayer, SetMaterialAttribute
- Material Constants: #PB_Material_NoCulling, #PB_Material_Add, #PB_Material_AlphaReject, #PB_Material_EnvironmentMap, #PB_Material_ReflectionMap, #PB_Material_CurvedMap
- Mesh: CreateSphere, CreateCube, CreateTorus
- Entity: CreateEntity, RotateEntity
- Light: CreateLight
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor, RotateCamera

## Input/Output
- Input: grass2.png, Wood.jpg, Dirt.jpg, spheremap.png textures
- Output: 4 entities showing different material techniques: alpha reject, environment maps

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add textures archive; parse scripts
4. Load 4 textures: grass, wood, dirt, spheremap
5. Create 4 materials:
   - Material 0: grass with scale 0.25, no culling, alpha reject -160
   - Material 1: grass with scale 0.5, no culling, alpha reject 128
   - Material 2: wood + spheremap additive layer, reflection environment map
   - Material 3: dirt scaled 0.1 + spheremap additive layer, curved environment map
6. Create sphere, cube, torus meshes
7. Create 4 entities at different positions
8. Create light and camera
9. Main loop: rotate all 4 entities, camera controls, render
10. Exit on Escape or Quit

## Important Notes
- SetMaterialAttribute with #PB_Material_AlphaReject uses negative value (-160) for first material
- AddMaterialLayer adds a second texture layer with blending mode
- Environment mapping modes: ReflectionMap and CurvedMap
- Reference code uses MouseX/MouseY/KeyX/KeyY in camera but never updates them from mouse (they stay 0)
