# CheckObjectVisibility2.pb - Intermediate Description

## Purpose
Demonstrates the CheckObjectVisibility() function which tests whether one entity can "see" another entity from a camera attached to it. A robot walks around and reports which objects (PureBasic logo, colored spheres) it can see via a 3D text label.

## Type
3D Engine Demo

## Compiler Flags
None (GUI subsystem implied by OpenWindow)

## Structure
No custom structures. Uses simple variables for movement and visibility tracking.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, CheckObjectVisibility
- Entity: CreateEntity, MoveEntity, EntityDirection, StartEntityAnimation, StopEntityAnimation, AddEntityAnimationTime, AttachEntityObject, ScaleEntity, RotateEntity
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraFOV
- Material: GetScriptMaterial, CreateMaterial, SetMaterialColor, LoadTexture
- Mesh: LoadMesh, CreateSphere, CreatePlane
- Light: CreateLight, AmbientColor
- Billboard: CreateBillboardGroup, AddBillboard
- RenderTexture: CreateRenderTexture
- Text3D: CreateText3D, Text3DColor, Text3DAlignment, Text3DCaption, MoveText3D, ScaleText3D
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- SkyBox
- WorldShadows
- EntityRenderMode, EntityAnimationStatus

## Input/Output
- Loads: robot.mesh, r2skin.jpg, PureBasic.mesh, Dirt.jpg, desert07.jpg (skybox), color scripts
- Displays: A robot walking on a ground plane with 4 objects, showing which ones the robot can see via 3D text and a render texture billboard

## Logic Flow
1. Initialize engine, sprite, keyboard
2. Open windowed screen at 80% desktop size
3. Add 3D data archives (textures, models, scripts, fonts, desert skybox)
4. Parse scripts and create materials (red, green, blue, yellow script materials + r2skin)
5. Create ground plane with dirt texture
6. Create robot entity and 4 target entities (PureBasic mesh, 3 colored spheres)
7. Create main camera (0) looking at robot, and secondary camera (1) attached to robot head
8. Create render texture from camera 1, make billboard showing robot's POV
9. Attach camera 1 and billboard to robot's Joint1 bone
10. Create lights, skybox, shadows
11. Create Text3D attached to robot head for displaying visibility info
12. Main loop:
    a. Process window events and keyboard
    b. Move robot based on arrow keys, control speed with PageUp/PageDown
    c. Animate robot walk when moving
    d. Rotate PureBasic entity
    e. Check visibility of each entity from camera 1 using CheckObjectVisibility()
    f. Update Text3D caption with visible objects
    g. RenderWorld and FlipBuffers
13. Exit on Escape

## Important Notes
- Uses EntityAnimationStatus and manual animation timing
- CheckObjectVisibility takes camera attached to entity and checks against other entity IDs
- Uses #PB_EntityAnimation_Manual and #PB_EntityAnimation_Stopped constants
- Robot direction set via EntityDirection with #PB_Parent and #PB_Vector_X
- TimeSinceLastFrame returned by RenderWorld()
- The variable Quit is used but never set in the reference (external quit mechanism)
- Uses Object$ string variable (note: no Define needed since it's implicit in the reference)
