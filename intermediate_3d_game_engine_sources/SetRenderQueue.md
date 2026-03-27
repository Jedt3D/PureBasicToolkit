# SetRenderQueue.pb - Intermediate Description
## Purpose
Demonstrates SetRenderQueue() to control entity rendering order. Two overlapping cubes can have their render queue priority swapped using F5/F6 keys, showing how render queue affects which entity appears in front.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Uses named constants for IDs.
## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, RenderWorld, SkyBox, SetRenderQueue, EntityID
- Entity: CreateEntity
- Mesh: CreateCube
- Material: CreateMaterial, LoadTexture
- Camera: CreateCamera, MoveCamera
- Keyboard: ExamineKeyboard, KeyboardReleased, KeyboardPushed
## Input/Output
- Loads: clouds.jpg, Dirt.jpg, stevecube.jpg (skybox)
- Displays: Two cubes with swappable render order
## Logic Flow
1. Define constants for Camera, Entity0/1, Material0/1, Mesh, Texture0/1
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add Textures archive and skybox.zip
5. Create two materials with clouds.jpg and Dirt.jpg
6. Create cube mesh (size 20)
7. Create entity 0 at (5, 0, 0) with clouds material
8. Create entity 1 at (-5, 0, 0) with dirt material
9. Set skybox
10. Create camera at (0, 40, 150)
11. Main loop:
    - F5: SetRenderQueue entity 0 to priority 1, entity 1 to priority 0
    - F6: SetRenderQueue entity 0 to priority 0, entity 1 to priority 1
    - RenderWorld, FlipBuffers
12. Exit on Escape
## Important Notes
- SetRenderQueue takes EntityID() (not entity number) and a priority value
- Higher priority value renders on top (in front)
- Simple static scene with keyboard-triggered render order swap
