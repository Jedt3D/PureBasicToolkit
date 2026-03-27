# GetScriptMaterial.pb - Intermediate Description
## Purpose
Demonstrates GetScriptMaterial() with #PB_Any to load named materials from script files. Creates 4 colored spheres using Red, Blue, Yellow, Green script materials.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Constant #CameraSpeed=1.
## Key Libraries/Functions
- GetScriptMaterial(#PB_Any, name$) - loads material from script by name, returns dynamic ID
- Parse3DScripts() - parses material script files
- CreateSphere(), CreateEntity(), CreateCamera(), CreateLight()
- CameraBackColor(), AmbientColor()
## Input/Output
- Loads: Script materials (Color/Red, Color/Blue, Color/Yellow, Color/Green) from Data/Scripts
- Displays: 4 colored spheres arranged in cross pattern
- Controls: Esc to quit
## Logic Flow
1. Define constant and variables
2. Initialize subsystems, open window/screen
3. Add Scripts archive, parse 3D scripts
4. Get 4 script materials with #PB_Any: Red, Blue, Yellow, Green
5. Create sphere mesh (radius 40, 50x50 segments)
6. Create 4 entities positioned in cross pattern:
   - Red at (-60, 0, 0)
   - Blue at (60, 0, 0)
   - Yellow at (0, 60, 0)
   - Green at (0, -60, 0)
7. Create camera with gray background at y=100, z=300 looking at origin
8. Create light, set ambient
9. Main loop: process events, examine keyboard, render, flip
10. Exit on Escape
## Important Notes
- Simple demo focused on GetScriptMaterial usage
- Uses #PB_Any and stores returned IDs in variables (Red, Blue, Yellow, Green)
- No mouse interaction needed
- Only Scripts archive added (no textures/models needed)
- Camera positioned far back to see all 4 spheres
