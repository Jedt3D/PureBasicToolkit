# Light.pb - Intermediate Description

## Purpose
Demonstrates dynamic colored lights with HSL color cycling. Three lights rotate through the color spectrum using HSL-to-RGB conversion, illuminating an animated Sinbad character.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 0.2
- Procedure: HSLToRGB(hue.a, saturation.a, lightness.a, alpha=0) returns .l
- Macro: light(num, color, x, y, z) - creates a light with billboard
- Variables: KeyX, KeyY, MouseX, MouseY (floats), hue, num, color (integers)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, WorldShadows
- Mesh: LoadMesh, CreateCylinder
- Texture: LoadTexture
- Material: CreateMaterial, MaterialShininess, MaterialBlendingMode, SetMaterialColor, DisableMaterialLighting (via macro)
- Entity: CreateEntity, StartEntityAnimation, EntityRenderMode
- Light: CreateLight, SetLightColor, #PB_Light_DiffuseColor, #PB_Light_SpecularColor
- Billboard: CreateBillboardGroup, AddBillboard
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera

## Input/Output
- Input: Sinbad.mesh, MRAMOR6X6.jpg, flare.png textures
- Output: Animated character with 3 color-cycling lights and flare billboards

## Logic Flow
1. Define HSLToRGB procedure for color conversion
2. Initialize all subsystems
3. Open window and screen
4. Add archives for main data, textures, Sinbad model pack; parse scripts
5. Enable texture additive shadows
6. Load Sinbad mesh; create cylinder mesh for ground
7. Create floor material with shininess
8. Create Sinbad entity with "Dance" animation; create floor entity (render mode 0)
9. Use light() macro to create 3 colored lights (red, green, blue) with flare billboards
10. Set ambient color
11. Create camera at (0, 5, 20) looking at (0, 5, 0)
12. Main loop:
    a. Increment hue counter
    b. For each of 3 lights: compute HSL color, update light diffuse/specular and material self-illumination
    c. Camera controls, render
13. Exit on Escape, Quit, or middle mouse button

## Important Notes
- HSLToRGB uses byte (0-255) inputs for hue, saturation, lightness
- The light() macro creates both the light source and a billboard visual
- Color cycling uses hue offset of 80 per light for spread
- EntityRenderMode(1, 0) hides the cylinder floor entity
- Reference uses implicit variables hue, num, color in main loop
