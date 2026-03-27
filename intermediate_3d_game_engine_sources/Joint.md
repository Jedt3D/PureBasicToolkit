# Joint.pb - Intermediate Description

## Purpose
Demonstrates both SliderJoint and HingeJoint working together. A sliding door opens/closes automatically, a ball drops when Space is pressed, and a hinged door swings with physics.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 0.2
- Macro: DoorClosed() checks EntityX(1) > -1.07
- Variables: KeyX, KeyY, MouseX, MouseY (floats), Direction (integer), Time (integer), Quit (integer)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, CreateMaterial, LoadTexture, GetScriptMaterial
- Entity: CreateEntity, ScaleEntity, CreateEntityBody, ApplyEntityImpulse, FreeEntity, DisableEntityBody, EntityX
- Physics: SliderJoint, HingeJoint, SetJointAttribute, #PB_SliderJoint_LowerLimit, #PB_SliderJoint_UpperLimit
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Light: CreateLight, AmbientColor

## Input/Output
- Input: Dirt.jpg, Wood.jpg textures; Color/Green, Color/Red script materials
- Output: Sliding door mechanism with ball drop and hinged door

## Logic Flow
1. Initialize all subsystems
2. Open window and screen at 80% desktop
3. Add archives for textures, models, scripts; parse scripts
4. Create materials: dirt, wood, green (script), red (script)
5. Create cube and sphere meshes
6. Create entities: two boxes for slider door, sphere ball, floor box, hinged door box
7. Create entity bodies: static for anchors, dynamic for moving parts
8. Create SliderJoint between entities 0 and 1 with limits [-3, 0]
9. Create HingeJoint between entities 4 and 5
10. Create camera at (10, 6, 19) looking at origin; create light
11. Main loop:
    a. Auto-toggle direction every 1500ms if door not closed
    b. Apply impulse in current direction to sliding entity
    c. On Space release: reset door, drop new ball from height 15
    d. Camera controls, render
12. Exit on Escape or Quit

## Important Notes
- Uses Macro for DoorClosed() check
- FreeEntity(3) and re-CreateEntity(3) pattern for resetting ball
- Direction toggles between 0 and 1 for door open/close
