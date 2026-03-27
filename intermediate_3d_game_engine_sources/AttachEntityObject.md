# AttachEntityObject.pb - Intermediate Description

## Purpose
Demonstrates AttachEntityObject() to attach colored spheres to specific bone joints on an animated robot entity. Supports detaching with Space and reattaching with Return. The robot can be moved with arrow keys and speed adjusted with PageUp/PageDown.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses variables:
- `Speed` (float, default 1.0)
- `RobotMove` (integer, boolean flag)

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), WorldShadows(), CreateMaterial(), GetScriptMaterial(), CreatePlane(), LoadMesh(), CreateSphere(), CreateEntity(), AttachEntityObject(), DetachEntityObject(), EntityRenderMode(), MoveEntity(), RotateEntity(), StartEntityAnimation(), StopEntityAnimation(), EntityAnimationStatus(), AddEntityAnimationTime(), CreateCamera(), MoveCamera(), CameraLookAt(), RotateCamera(), CreateLight(), AmbientColor(), Fog(), SkyBox(), RenderWorld()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()
- Keyboard/Mouse: InitKeyboard(), InitMouse(), ExamineKeyboard(), ExamineMouse()

## Input/Output
- Loads: robot.mesh, Dirt.jpg, desert07.jpg skybox, Color/Red and Color/Green script materials
- Displays: Robot on a dirt ground with red and green spheres attached to joints, in a desert environment with fog

## Logic Flow
1. Define float variables for input, Speed=1.0, RobotMove flag
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen at 80% desktop
4. Add archives for textures, models, scripts, desert skybox pack; parse scripts
5. Setup modulative shadows
6. Create dirt material, get red/green script materials
7. Create ground plane, robot mesh, sphere mesh
8. Create ground entity (render mode 0), robot entity, red sphere entity, green sphere entity
9. Attach red sphere to Joint18, green sphere to Joint15 of robot
10. Setup fog, skybox, camera looking at robot, light and ambient color
11. Main loop:
    - Process mouse delta for camera rotation
    - Space: detach red sphere; Return: reattach red sphere
    - Arrow keys: move robot and set rotation direction, set RobotMove flag
    - PageUp/PageDown: adjust speed
    - If moving, check/start Walk animation (manual mode); else stop animation
    - Add animation time scaled by TimeSinceLastFrame
    - Rotate/move camera, render world scaled by speed
12. Exit on Escape

## Important Notes
- Uses #PB_Any for dynamic resource allocation
- Animation is manual mode with AddEntityAnimationTime
- TimeSinceLastFrame comes from RenderWorld() return value multiplied by speed
- Camera rotation uses variables RollZ/KeyX/KeyY that may be uninitialized (standard pattern)
