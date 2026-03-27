# LightLookAt.pb - Intermediate Description

## Purpose
Demonstrates the LightLookAt() function to direct a spotlight toward a picked point on the ground. Click on the ground to redirect the spotlight.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Variables: Quit (integer), Input$ (string)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive
- Material: CreateMaterial, LoadTexture
- Mesh: CreatePlane
- Entity: CreateEntity
- Light: CreateLight (#PB_Light_Spot), SpotLightRange, LightLookAt
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- 3D GUI: ShowGUI, InputEvent3D
- Picking: MousePick, PickX, PickY, PickZ

## Input/Output
- Input: Dirt.jpg texture; GUI resources
- Output: Spotlight on a ground plane; clicking redirects the light

## Logic Flow
1. Initialize all subsystems
2. Open window and screen
3. Add archives for textures and GUI
4. Create ground plane entity with dirt material
5. Create spotlight at (0, 900, 0) with spot range (1, 30, 3)
6. Set ambient to 0 (dark)
7. Create camera at (0, 900, 1200) looking at origin, dark background
8. Show GUI with transparency and cursor
9. Main loop:
    a. Process mouse: InputEvent3D for GUI
    b. If MousePick hits ground, redirect spotlight with LightLookAt(0, PickX, PickY, PickZ)
    c. Examine keyboard, read inkey
    d. Render and flip
10. Exit on Escape or Quit

## Important Notes
- Simple demo focused on LightLookAt functionality
- No Parse3DScripts needed since no script materials used
- Input$ = KeyboardInkey() reads keyboard input (unused functionally)
- The light is placed very high (Y=900) to create a wide spotlight cone on the ground
