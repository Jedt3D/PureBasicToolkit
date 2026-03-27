# Sound3D.pb - Intermediate Description
## Purpose
Demonstrates 3D positional audio where sounds are attached to entities via nodes, and the listener follows the camera to create spatial audio effects.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #CameraSpeed = 4
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- CreateCube(), CreateSphere()
- GetScriptMaterial()
- CreateEntity()
- LoadSound3D(), SoundVolume3D(), SoundRange3D(), PlaySound3D() with #PB_Sound3D_Loop
- SoundID3D()
- CreateNode(), AttachNodeObject() - links entities and sounds to nodes
- NodeX(), NodeY(), NodeZ()
- SoundListenerLocate() - positions the audio listener at camera location
- CreateCamera(), MoveCamera(), CameraLookAt()
- AmbientColor(), CreateLight()
- SkyBox()
- RotateCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Roar.ogg, Siren.ogg sound files; desert.zip skybox pack
- Displays: Two colored cubes (blue, red) with positional sounds attached
- Sound volume changes based on camera distance from entities
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add archives for data, textures, models, scripts, desert pack
4. Create cube and sphere meshes, get blue and red materials from scripts
5. Create two entities (blue cube, red sphere)
6. Load two 3D sounds (Roar.ogg, Siren.ogg), set volume and range, play looping
7. Create nodes at (-400,0,0) and (400,0,0), attach sounds and entities to nodes
8. Create camera, position it, look at node 1
9. Set ambient color, create light, set skybox
10. Main loop: handle input, arrow keys move camera, mouse rotates
11. SoundListenerLocate follows camera position each frame
12. Render and flip until Escape or Quit
## Important Notes
- Sound3D requires nodes to link sounds with spatial positions
- SoundListenerLocate must be called each frame to update the listener position
- Sound range defines min/max distance for volume falloff
