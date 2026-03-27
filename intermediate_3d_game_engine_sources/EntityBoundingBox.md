# EntityBoundingBox.pb - Intermediate Description
## Purpose
Demonstrates entity bounding box visualization using WorldDebug with #PB_World_DebugEntity flag. Shows a rotating animated robot with its bounding box displayed.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Variables for bounding box corners (x1,y1,z1,x2,y2,z2) defined but not used in main logic.
## Key Libraries/Functions
- WorldDebug(#PB_World_DebugEntity) - enables bounding box display
- StartEntityAnimation() with #PB_EntityAnimation_Manual
- AddEntityAnimationTime(), RotateEntity()
- CreateEntity() with inline LoadMesh()
- Parse3DScripts(), SkyBox()
- KeyboardMode(#PB_Keyboard_International)
## Input/Output
- Loads: robot.mesh, desert07.jpg, scripts
- Displays: Rotating robot with visible bounding box outline
- Controls: Arrow keys move camera, PageUp/PageDown animation speed, Mouse rotates camera, Esc quit
## Logic Flow
1. Define variables including Speed=0.3, Color (unused), bounding box coords (unused)
2. Initialize subsystems, open window/screen
3. Add archives for Textures, Models, Scripts, desert zip
4. Parse scripts
5. Create entity 1 with inline LoadMesh for robot.mesh
6. Start "Walk" animation in manual mode
7. Create skybox, camera, light
8. Set keyboard international mode
9. Enable WorldDebug for entity bounding boxes
10. Main loop:
    a. Process events, read mouse/keyboard
    b. Adjust speed with PageUp/PageDown
    c. Advance animation time with speed multiplier
    d. Rotate/move camera
    e. Render (capture TimeSinceLastFrame)
    f. Rotate entity by 1 degree on Y axis
    g. Flip buffers
11. Exit on Escape
## Important Notes
- WorldDebug(#PB_World_DebugEntity) is the key function demonstrated
- Bounding box variables (x1,y1,z1,x2,y2,z2) and Color are defined but never used - likely leftover
- Entity rotates continuously in Y axis showing bounding box updating
- No ground plane in this demo
