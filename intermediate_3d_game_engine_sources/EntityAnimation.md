# EntityAnimation.pb - Intermediate Description
## Purpose
Demonstrates manual entity animation control with adjustable playback speed using PageUp/PageDown keys. Shows a robot walking on a desert ground plane.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. No enumerations.
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- WorldShadows() with #PB_Shadow_Modulative
- CreateMaterial(), CreatePlane(), CreateEntity(), EntityRenderMode()
- LoadMesh(), StartEntityAnimation() with #PB_EntityAnimation_Manual
- AddEntityAnimationTime() - manually advances animation time
- SkyBox(), CreateCamera(), MoveCamera(), CameraLookAt()
- CreateLight(), AmbientColor(), KeyboardMode()
- RenderWorld() returns TimeSinceLastFrame
## Input/Output
- Loads: Dirt.jpg, robot.mesh, desert07.jpg (skybox), scripts from Data/Scripts
- Displays: Robot entity on ground plane with desert skybox, shadows
- Controls: Mouse to rotate camera, arrow keys to move, PageUp/PageDown for speed, Esc to quit
## Logic Flow
1. Define float variables including Speed = 0.3
2. Initialize subsystems
3. Open window and screen at 80% desktop
4. Add archives for Main, Textures, Models, Scripts, desert skybox zip
5. Parse 3D scripts
6. Set modulative world shadows
7. Create ground: material from Dirt.jpg, plane 1500x1500, entity with render mode 0
8. Load robot mesh, create entity with #PB_Material_None
9. Start "Walk" animation in manual mode
10. Create desert skybox
11. Create and position camera looking at entity
12. Create light and set ambient color
13. Set keyboard international mode
14. Main loop: process events, read mouse delta, read keyboard for movement and speed control, advance animation time using TimeSinceLastFrame * Speed, rotate/move camera, render (capture TimeSinceLastFrame), flip
15. Exit on Escape
## Important Notes
- Animation is manual mode - requires AddEntityAnimationTime() each frame
- Speed adjusted by PageUp/PageDown between 0.1 and 2.0
- TimeSinceLastFrame comes from RenderWorld() return value
- Uses Bool() for speed increment calculation
