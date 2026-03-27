# MaterialAnimation.pb - Intermediate Description

## Purpose
Demonstrates the MaterialAnimation() function for sprite-sheet style texture animation on a 3D plane. Arrow keys change the animation to different sprite sheets.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Variables: Ground (integer from CreateEntity #PB_Any), Quit (integer)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts
- Material: CreateMaterial, LoadTexture, MaterialAnimation, MaterialBlendingMode, MaterialFilteringMode, DisableMaterialLighting, SetMaterialAttribute
- Material Constants: #PB_Material_AlphaBlend, #PB_Material_None, #PB_Material_TAM, #PB_Material_ClampTAM
- Mesh: CreatePlane
- Entity: CreateEntity (#PB_Any)
- Camera: CreateCamera (#True flag), MoveCamera, CameraLookAt

## Input/Output
- Input: White.jpg texture, ogredance.png sprite sheet, zombie.zip, ogredance.zip packs; l.png, r.png, d.png, u.png sprite sheets
- Output: Animated sprite sheet on a plane, changeable with arrow keys

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for textures and animation packs; parse scripts
4. Create material 4 with white texture base
5. Apply MaterialAnimation(4, "ogredance.png", 8, 2) - 8 columns, 2 frame time
6. Set alpha blending, no filtering, disable lighting, clamp texture addressing
7. Create plane mesh and entity with animated material
8. Create camera at (0, 3, -0.1) looking at origin
9. Main loop:
    a. Arrow keys change animation: Left="l.png", Right="r.png", Up="d.png", Down="u.png"
    b. Each with 3 columns, 0.5 frame time
    c. Render and flip
10. Exit on Escape or Quit

## Important Notes
- MaterialAnimation(material, texture, columns, speed) creates sprite sheet animation
- The #True flag in CreateCamera enables orthographic or special mode
- Material 4 is used (not 0) as the material ID
- SetMaterialAttribute with #PB_Material_TAM and #PB_Material_ClampTAM sets texture addressing mode
