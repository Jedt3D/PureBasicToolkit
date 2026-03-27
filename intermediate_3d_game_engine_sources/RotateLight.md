# RotateLight.pb - Intermediate Description
## Purpose
Demonstrates RotateLight() by creating a spotlight that continuously rotates, with a visual line showing its direction and a sphere marking its position. Shows a dirt-textured ground plane illuminated by the rotating spot light.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld
- Light: AmbientColor, CreateLight, SpotLightRange, LightDirection, RotateLight, LightX, LightY, LightZ, LightDirectionX, LightDirectionY, LightDirectionZ
- Entity: CreateEntity
- Mesh: CreatePlane, CreateSphere
- Material: CreateMaterial, LoadTexture, GetScriptMaterial, SetMaterialColor
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraBackColor
- Line3D: CreateLine3D
- Keyboard: KeyboardMode, ExamineKeyboard, KeyboardPushed
- Constants: #PB_Light_Spot, #PB_Material_SelfIlluminationColor, #PB_Relative, #PB_World, #PB_Absolute, #PB_Keyboard_International
## Input/Output
- Loads: Dirt.jpg texture, Scripts archive
- Uses material: "Color/Yellow"
- Displays: Ground plane with rotating spotlight, yellow sphere at light position, green direction line
## Logic Flow
1. Define float variables x, y, z, Distance = 1500
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add Textures and Scripts archives; parse scripts
5. Set keyboard to international mode
6. Create dirt ground plane (1000x1000)
7. Create spotlight (light 0) at (0, 400, 0) with spot range (1, 30, 3) and direction (0.2, -1, 0.5)
8. Set ambient color
9. Create yellow self-illuminated sphere (mesh 1, entity 1) at light position
10. Create camera at (0, 900, 1000) looking at origin
11. Main loop:
    - Examine keyboard
    - RotateLight(0, 0, 1, 0, #PB_Relative|#PB_World) - continuous rotation
    - Calculate line endpoint using light direction * Distance
    - CreateLine3D to draw green direction line from light to endpoint
    - RenderWorld and FlipBuffers
12. Exit on Escape
## Important Notes
- RotateLight uses combined #PB_Relative|#PB_World flags for world-space relative rotation
- Line3D is recreated every frame (ID 10) to update direction visualization
- The yellow sphere stays at fixed position (doesn't follow rotation since light position stays the same - only direction changes)
