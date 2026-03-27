# LightAttenuation.pb - Intermediate Description

## Purpose
Demonstrates the LightAttenuation() function which controls how light intensity falls off with distance. A single light orbits around a scene of randomly placed objects.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 1
- Variables: KeyX, KeyY, MouseX, MouseY (floats), a (float for angle), i, j, num (integers)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, WorldShadows
- Material: CreateMaterial, LoadTexture, MaterialShininess, MaterialBlendingMode, DisableMaterialLighting
- Mesh: CreatePlane, CreateCube, CreateSphere, CreateCapsule, CreateTorus
- Entity: CreateEntity, RotateEntity
- Light: CreateLight, LightAttenuation, MoveLight
- Billboard: CreateBillboardGroup, AddBillboard, MoveBillboardGroup
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera

## Input/Output
- Input: Wood.jpg, Dirt.jpg, flare.png textures; desert.zip skybox pack
- Output: Ground plane with 25 randomly oriented objects lit by an orbiting attenuated light

## Logic Flow
1. Initialize all subsystems
2. Open window and screen at 80% desktop
3. Add archives for main, textures, scripts, desert pack; parse scripts
4. Set keyboard international mode; enable modulative shadows
5. Create materials: wood with shininess, dirt for ground, flare with additive blending
6. Create ground plane entity
7. Create 4 mesh types: cube, sphere, capsule, torus
8. Loop i=-2 to 2, j=-2 to 2: create 25 entities with random mesh types, random rotations, spaced 8 units apart
9. Create camera at (5, 15, -25) looking at origin
10. Create light with attenuation (range 100, factor 1.0)
11. Create billboard group for light visual
12. Set ambient color to black
13. Main loop:
    a. Increment angle 'a' by 0.01
    b. Move light and billboard in circular orbit: (-16*Cos(a), 8, -16*Sin(a))
    c. Camera controls, render
14. Exit on Escape or Quit

## Important Notes
- LightAttenuation(0, 100, 1.0) sets range and falloff
- Light and billboard are moved in sync to create visible light source
- 25 entities placed in 5x5 grid pattern
- Variable 'a' declared with inline float suffix a.f
