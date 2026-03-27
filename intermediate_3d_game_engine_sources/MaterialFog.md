# MaterialFog.pb - Intermediate Description

## Purpose
Demonstrates the MaterialFog() function which applies per-material fog to entities. 16 boxes orbit inside a large cube room, with yellow material fog applied to their material.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Variables: a (float for angle), ai (float for per-entity angle), i (integer loop counter)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive
- Material: CreateMaterial, LoadTexture, MaterialCullingMode, MaterialFog
- Material Constants: #PB_Material_AntiClockWiseCull
- Mesh: CreateCube
- Entity: CreateEntity, MoveEntity
- Light: CreateLight, AmbientColor
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Math: Radian, Cos, Sin

## Input/Output
- Input: MRAMOR6X6.jpg (room walls), Caisse.png (boxes) textures
- Output: 16 boxes orbiting in a circle inside a large cube room with material-based fog

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for data and textures
4. Create large cube (size 100) for the room with anti-clockwise culling
5. Create small cube (size 10) for orbiting boxes
6. Apply MaterialFog(1, RGBA(255,255,0,0), 1, 0, 100) to box material
7. Create 16 box entities
8. Create camera at (0, 20, -50) looking at origin
9. Create light and set ambient color
10. Main loop:
    a. Increment angle 'a' by 0.5
    b. Move each of 16 entities in circular orbit: Cos(ai)*30, 0, Sin(ai)*30
    c. Examine keyboard, render and flip
11. Exit on Escape

## Important Notes
- MaterialFog(material, color, density, start, end) - RGBA color with alpha, linear fog type
- Anti-clockwise culling makes the large cube visible from inside
- 16 entities share mesh 1 and material 1
- Reference uses LoadTexture(0, ...) twice (for both materials) - the second overwrites texture 0
- Variables a.f and ai.f use inline type suffixes
