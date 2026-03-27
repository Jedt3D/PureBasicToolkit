# Water.pb - Intermediate Description
## Purpose
Demonstrates water rendering with sky dome, underwater ground plane, and dynamic sun height that affects lighting, fog, and water appearance.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #end_distance = 1024*4
- Procedure: ColorBlend(), CameraUserControl()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- CreateCamera(), MoveCamera(), CameraLookAt(), CameraRenderMode() with #PB_Camera_Wireframe, #PB_Camera_Textured
- LoadTexture(#PB_Any), SkyDome() - not SkyBox
- CreateWater() - creates water surface with normal and foam textures
- CreatePlane(), CreateEntity(), CreateMaterial()
- CreateLight(), AmbientColor(), Fog()
- RotateCamera(), MoveCamera()
- Pow() for gamma curve on sun height
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: sky.png, waternormal.png, foam.png, Dirt.jpg textures
- Displays: Water surface with sky dome, ground underwater, dynamic sun
- Controls: Arrow keys + mouse move camera, PageUp/Down change sun height, F12 toggle wireframe
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window at 90% desktop size
3. Add texture archive, parse scripts
4. Create camera, position and look at
5. Create sky dome from sky.png
6. Create water with normal and foam textures, color parameters, distance
7. Create underwater ground plane with dirt texture
8. Define CameraUserControl procedure for smooth camera movement
9. Main loop:
   - F12 toggles wireframe mode
   - CameraUserControl handles smooth movement
   - PageUp/Down adjust sun height (r value 0-1)
   - Recreate light each frame with color blend based on sun height
   - Update ambient color and fog based on sun height
   - Render and flip
10. ColorBlend interpolates between two RGBA colors
## Important Notes
- Uses SkyDome instead of SkyBox
- CreateWater takes normal map, foam map, two colors, distance, and wave parameters
- Sun height affects all lighting: light color, ambient, fog
- Pow(r, 0.25) creates non-linear brightness response
- CameraUserControl uses smooth interpolation for camera movement
- Window opened at 90% desktop size (not 80%)
- Exit on Escape release or both mouse buttons
