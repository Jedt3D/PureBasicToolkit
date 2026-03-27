# CompoundBody.pb - Intermediate Description

## Purpose
Demonstrates compound physics bodies - multiple sub-entities combined into a single physics body. Shows three compound bodies: a cross shape (4 cubes + sphere), a single cube compound, and a robot mesh compound, all falling onto a ground plane.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Uses #PB_Any for dynamic entity IDs.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, WorldDebug
- Entity: CreateEntity, AddSubEntity, CreateEntityBody, MoveEntity, RotateEntity, ScaleEntity, ApplyEntityImpulse
- Mesh: CreateCube, CreateSphere, CreatePlane, LoadMesh
- Material: CreateMaterial, SetMaterialColor, LoadTexture
- Camera: CreateCamera, MoveCamera, RotateCamera
- Light: CreateLight, AmbientColor
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY, MouseX, MouseY, MouseButton, InputEvent3D, BodyPick
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- GUI3D: OpenWindow3D, HideWindow3D, ShowGUI
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: Wood.jpg, Dirt.jpg, clouds.jpg, r2skin.jpg, robot.mesh
- Displays: Three compound bodies with debug body outlines, falling and interacting with physics on a ground plane

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives, parse scripts
3. Enable WorldDebug for body outlines
4. Create 4 materials (wood, dirt, clouds, r2skin)
5. Create meshes (cube, sphere, robot)
6. Create 5 sub-entities for compound 1 (4 cubes in cross + sphere center)
7. Create Compound 1 with AddSubEntity and CreateEntityBody(#PB_Entity_CompoundBody)
8. Create Compound 2 with single cube sub-entity
9. Create Compound 3 with robot mesh as capsule body sub-entity
10. Create ground plane with static body
11. Create light, camera
12. Open hidden 3D GUI window for mouse cursor
13. Main loop:
    a. Process events, mouse (with BodyPick for dragging), keyboard
    b. Space bar applies upward impulse to compound 1
    c. Move/rotate camera
    d. RenderWorld and FlipBuffers
14. Exit on Escape

## Important Notes
- #PB_Entity_CompoundBody, #PB_Entity_BoxBody, #PB_Entity_SphereBody, #PB_Entity_CapsuleBody, #PB_Entity_StaticBody are body type constants
- AddSubEntity parameters: (compound, sub-entity, body-type, optional offsets)
- CreateEntityBody(compound, #PB_Entity_CompoundBody, mass, restitution, friction)
- Uses #PB_Any for entity creation returning dynamic IDs
- #PB_Material_AmbientColor and #PB_Material_AmbientColors used in SetMaterialColor
- BodyPick used for mouse-based physics interaction
- ShowGUI(128, 1) enables semi-transparent GUI with mouse cursor
