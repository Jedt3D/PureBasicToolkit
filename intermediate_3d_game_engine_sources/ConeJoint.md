# ConeJoint.pb - Intermediate Description

## Purpose
Demonstrates ConeTwistJoint physics joints connecting cylinder entities in a chain. Shows two joints connecting three cylinders, with swing and twist constraints. Space applies impulse, F frees a joint.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld
- Entity: CreateEntity, ScaleEntity, CreateEntityBody, ApplyEntityImpulse
- Joint: ConeTwistJoint, SetJointAttribute, FreeJoint
- Mesh: CreateCylinder
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: Dirt.jpg, Wood.jpg
- Displays: Three cylinders connected by cone twist joints, swinging and twisting

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives, parse scripts
3. Create materials (dirt, wood)
4. Create cylinder mesh
5. Create 3 entities (entity 0 static anchor at origin, entities 1 and 2 hanging below)
6. Set bodies: entity 0 = static, entities 1 and 2 = box bodies with mass 1.0
7. Create ConeTwistJoint(0) between entities 0 and 1 with restricted swing, free twist
8. Create ConeTwistJoint(1) between entities 1 and 2 with free swing and twist
9. Apply initial impulse to entity 1
10. Create camera at (0, 4, 22) looking at origin
11. Main loop:
    a. Process events, mouse, keyboard
    b. Space applies impulse to entities 1 and 2
    c. F releases joint 1
    d. Move/rotate camera
    e. RenderWorld and FlipBuffers
12. Exit on Escape

## Important Notes
- ConeTwistJoint(id, entity1ID, x1,y1,z1, entity2ID, x2,y2,z2) - anchor points relative to each entity
- SetJointAttribute with #PB_ConeTwistJoint_SwingSpan, #PB_ConeTwistJoint_SwingSpan2, #PB_ConeTwistJoint_TwistSpan
- FreeJoint(id) releases a joint at runtime
- #PB_Entity_StaticBody and #PB_Entity_BoxBody used for body types
