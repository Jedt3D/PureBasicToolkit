# CreateRenderTexture.pb - Intermediate Description

## Purpose
Demonstrates CreateRenderTexture() which captures a camera's view into a texture that can be applied to a mesh. Shows a robot with its view rendered onto a custom quad mesh (like a mirror/screen), with an embossed compositor effect applied.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures.

## Key Libraries/Functions
- Engine3D: InitEngine3D, Add3DArchive, Parse3DScripts, RenderWorld, WorldShadows
- RenderTexture: CreateRenderTexture, SaveRenderTexture
- Compositor: CreateCompositorEffect
- Mesh: LoadMesh, CreateMesh, MeshVertex, MeshFace, FinishMesh, CreatePlane
- Material: CreateMaterial, LoadTexture
- Entity: CreateEntity, RotateEntity, EntityRenderMode, EntityX, EntityY, EntityZ
- Animation: StartEntityAnimation
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraFOV, RotateCamera
- Light: CreateLight, AmbientColor
- SkyBox
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- Mouse: InitMouse, ExamineMouse, MouseDeltaX, MouseDeltaY
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers

## Input/Output
- Loads: Dirt.jpg, robot.mesh, desert07.jpg (skybox), compositor scripts
- Saves: test1.png, test2.png... via F5 key
- Displays: Robot walking on ground, with a floating screen showing camera 0's view with embossed effect

## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen, add archives (textures, models, desert skybox, compositors), parse scripts
3. Enable modulative shadows
4. Create ground plane with dirt texture
5. Load robot mesh, create robot entity with no material
6. Start robot "Walk" animation
7. Create camera 1 (main view) at (-100, 120, 190)
8. Create camera 0 (render texture source) at (90, 60, 0) with FOV 80
9. Create render texture from camera 0 (800x600)
10. Apply "Embossed" compositor to camera 0
11. Create material from render texture, build custom quad mesh
12. Create entity from quad mesh at (100, 40, 0), rotate to face camera 1
13. Camera 1 looks at the screen entity
14. Create light, ambient, skybox
15. Main loop:
    a. Process events, mouse, keyboard
    b. F5 saves render texture to PNG file
    c. Rotate robot entity
    d. Move/rotate camera 1
    e. RenderWorld and FlipBuffers
16. Exit on Escape

## Important Notes
- CreateRenderTexture(textureID, cameraID, width, height) without flags uses default update mode
- SaveRenderTexture(textureID, filename) saves the current render texture to file
- Custom mesh created with MeshVertex/MeshFace/FinishMesh for the display quad
- MeshFace(0,1,2,3) creates a quad face (4 vertices)
- Both front and back faces created
- #PB_Material_None for entity with no material
- The 'No' variable tracks save file counter
- WorldShadows(#PB_Shadow_Modulative, distance, color) with 3 parameters
