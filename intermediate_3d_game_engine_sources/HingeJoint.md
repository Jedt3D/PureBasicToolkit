# HingeJoint.pb - Intermediate Description

## Purpose
Demonstrates the HingeJoint() function for creating a hinge constraint between two physics bodies. Press Space to apply an impulse to the hinged entity.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
- Constants: #CameraSpeed = 1
- Variables: KeyX, KeyY, MouseX, MouseY (floats), Quit (integer)

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, CreateMaterial, LoadTexture, CreateCube, CreateSphere
- Entity: CreateEntity, ScaleEntity, CreateEntityBody, ApplyEntityImpulse
- Physics: HingeJoint, SetJointAttribute, #PB_HingeJoint_LowerLimit
- Camera: CreateCamera, MoveCamera, CameraLookAt, RotateCamera
- Screen: InitSprite, OpenWindowedScreen, FlipBuffers, RenderWorld

## Input/Output
- Input: Dirt.jpg and Wood.jpg textures, skybox.zip
- Output: Two box entities connected by a hinge joint; Space applies impulse

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window at 80% desktop size, create windowed screen
3. Add texture, model, and skybox archives
4. Create two materials (Dirt, Wood textures)
5. Create cube and sphere meshes
6. Create two entities: entity 0 (static body), entity 1 (box body with mass 1.0)
7. Create HingeJoint connecting both entities with Y-axis pivot
8. Set joint lower limit to 0
9. Create camera at (0, 12, 15) looking at origin
10. Main loop: process events, handle mouse/keyboard, apply impulse on Space, render
11. Exit on Escape or Quit

## Important Notes
- Entity 0 is static (anchor), entity 1 is dynamic (swings on hinge)
- HingeJoint has many parameters: entity IDs, pivot positions, axis vectors for both bodies
