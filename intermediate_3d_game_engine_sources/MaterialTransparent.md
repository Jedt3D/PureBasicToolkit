# MaterialTransparent.pb - Intermediate Description

## Purpose
Demonstrates material transparency using alpha blending. A large textured cube pulses between fully transparent and fully opaque while rotating and moving, with a skybox background.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 1
- Variables: KeyX, KeyY, MouseX, MouseY, RollZ, Blend, Pas (floats), Pas initialized to 1

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, SkyBox
- Material: CreateMaterial, LoadTexture, MaterialBlendingMode, SetMaterialColor
- Material Constants: #PB_Material_AlphaBlend, #PB_Material_DiffuseColor
- Mesh: CreateCube, CreateSphere
- Entity: CreateEntity, RotateEntity, MoveEntity, EntityX, EntityY, EntityZ
- Camera: CreateCamera, MoveCamera, CameraLookAt

## Input/Output
- Input: Dirt.jpg texture, stevecube.jpg skybox, skybox.zip pack
- Output: Pulsing transparent cube rotating and moving against skybox

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for textures, models, skybox pack, scripts; parse scripts
4. Create cube (size 50) and sphere meshes
5. Create material with dirt texture and alpha blending mode
6. Create entity with cube mesh
7. Set skybox
8. Create camera at (90, 80, 150)
9. Main loop:
    a. Increment Blend by Pas (1 or -1)
    b. Reverse Pas when Blend hits 255 or 0
    c. Set material diffuse color with RGBA(255,255,255,Blend) for alpha
    d. Rotate entity and move in local Z direction
    e. Camera looks at entity position
    f. Render and flip
10. Exit on Escape or Quit

## Important Notes
- MaterialBlendingMode with #PB_Material_AlphaBlend enables per-material transparency
- RGBA alpha channel controls the transparency level
- Entity moves continuously in local space (-1 in Z)
- Camera tracks entity position each frame
- Sphere mesh (1) is created but unused
