# LightDirectionXYZ.pb - Intermediate Description

## Purpose
Demonstrates LightDirectionX(), LightDirectionY(), LightDirectionZ() functions to get the direction vector of a spotlight. A green line shows the light direction, and clicking the ground plane redirects the spotlight.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Variables: x, y, z, Distance (floats), Distance initialized to 1500

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts
- Material: CreateMaterial, LoadTexture, GetScriptMaterial, SetMaterialColor
- Mesh: CreatePlane, CreateSphere
- Entity: CreateEntity
- Light: CreateLight (#PB_Light_Spot), SpotLightRange, LightLookAt, LightX, LightY, LightZ, LightDirectionX, LightDirectionY, LightDirectionZ
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- 3D GUI: ShowGUI, InputEvent3D
- Picking: MousePick, PickX, PickY, PickZ
- Line: CreateLine3D

## Input/Output
- Input: Dirt.jpg texture; Color/Yellow script material; GUI resources
- Output: Spotlight on ground plane with direction line visualization; mouse click redirects spotlight

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for textures, scripts, GUI; parse scripts
4. Create ground plane with dirt material (1000x1000)
5. Create spotlight at (0, 400, 0) with spot range (1, 30, 3)
6. Create yellow sphere at light position as visual marker
7. Create camera at (0, 900, 1000) looking at origin with dark background
8. Show GUI with semi-transparency and mouse cursor
9. Main loop:
    a. Process mouse: InputEvent3D for GUI, MousePick for ground clicking
    b. If mouse picks ground, redirect light with LightLookAt to picked position
    c. Calculate line endpoint: light position + direction * 1500
    d. Create green line from light to endpoint using CreateLine3D(10, ...)
    e. Render and flip
10. Exit on Escape or Quit

## Important Notes
- CreateLine3D(10, ...) is recreated each frame to update the direction line
- LightDirectionX/Y/Z return the normalized direction vector of the light
- SpotLightRange(0, 1, 30, 3) sets inner angle, outer angle, falloff
- ShowGUI(128, 1) enables semi-transparent GUI and mouse cursor
- Variable Quit is implicitly declared in reference
