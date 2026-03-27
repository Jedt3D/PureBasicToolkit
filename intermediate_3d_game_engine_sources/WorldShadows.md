# WorldShadows.pb - Intermediate Description
## Purpose
Demonstrates world shadow rendering with additive shadow mode, showing shadows cast by cube, sphere, and PB logo entities on a ground plane with a rotating logo.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- Constants: #CameraSpeed = 0.2
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts()
- WorldShadows() with #PB_Shadow_Additive
- CreateCamera(#PB_Any), MoveCamera(), CameraLookAt()
- CreateLight(#PB_Any)
- LoadTexture(#PB_Any), CreateMaterial(#PB_Any)
- CreatePlane(#PB_Any), CreateCube(#PB_Any), CreateSphere(#PB_Any), LoadMesh(#PB_Any)
- CreateEntity(#PB_Any), ScaleEntity()
- RotateEntity() with #PB_Relative
- AmbientColor()
- SkyBox()
- RotateCamera(), MoveCamera()
- RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Wood.jpg, Dirt.jpg textures, PureBasic.mesh model, desert pack
- Displays: Ground plane with shadow-casting entities (cube, sphere, PB logo), rotating logo
## Logic Flow
1. Initialize engine, create windowed screen
2. Add archives for main, models, textures, desert pack
3. Enable additive world shadows
4. Create camera with #PB_Any, position and look at origin
5. Create light
6. Create wood and dirt materials using #PB_Any
7. Create ground plane with dirt material
8. Create cube, sphere, and PB logo entities with wood material
9. Scale PB logo to 0.2
10. Set skybox and ambient color
11. Main loop:
    - Mouse input for camera rotation
    - Keyboard for camera movement (with MouseWheel for zoom)
    - Rotate PB logo each frame
    - Render and flip
## Important Notes
- Uses #PB_Any extensively for all object creation
- WorldShadows(#PB_Shadow_Additive) provides basic shadow rendering
- PB logo rotates continuously with RotateEntity(Logo, 0, 1, 0, #PB_Relative)
- Commented out alternative: WorldShadows(#PB_Shadow_TextureAdditive, 1, $444444, 2048)
- MouseWheel used in camera zoom calculation
