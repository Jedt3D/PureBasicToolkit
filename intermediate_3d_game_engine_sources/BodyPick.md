# BodyPick.pb - Intermediate Description

## Purpose
Demonstrates BodyPick() for mouse-based picking of physics bodies in a 3D scene. Various shapes (capsule, cone, cube, cylinder, icosphere, sphere, torus, tube) are created with physics bodies and can be picked/dragged with the mouse.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 1`

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), MaterialShininess(), CreateCapsule(), CreateCone(), CreateCube(), CreateCylinder(), CreateIcoSphere(), CreatePlane(), CreateSphere(), CreateTorus(), CreateTube(), CreateEntity(), CreateEntityBody(), EntityRenderMode(), CreateCamera(), MoveCamera(), CameraLookAt(), RotateCamera(), CreateLight(), AmbientColor(), SkyBox(), BodyPick(), RenderWorld()
- GUI3D: OpenWindow3D(), HideWindow3D(), ShowGUI(), InputEvent3D()
- Sprite: InitSprite(), OpenWindowedScreen(), FlipBuffers()

## Input/Output
- Loads: Dirt.jpg, Desert.zip skybox, GUI data
- Displays: Various colored 3D shapes on a dirt plane with desert skybox, interactive physics picking

## Logic Flow
1. Define input variables
2. Initialize engine, sprite, keyboard, mouse
3. Open window and windowed screen
4. Add archives for textures, scripts, desert pack, GUI; parse scripts
5. Create 4 colored materials (blue, green, red, yellow) with shininess; create dirt material
6. Create meshes: capsule, cone, cube, cylinder, icosphere, plane, sphere, torus, tube
7. Create entities positioned along Z-axis (5 apart), ground plane
8. Set ground render mode 0; create physics bodies for all entities
9. Setup light, ambient color, skybox
10. Create camera at (100,30,20) looking at origin
11. Create hidden 3D window for GUI; show GUI semi-transparent with cursor
12. Main loop:
    - Read mouse input, call InputEvent3D for GUI
    - Call BodyPick() with camera, mouse button state, mouse position, and strength
    - Arrow keys for camera movement
    - RotateCamera, MoveCamera
    - RenderWorld, FlipBuffers
13. Exit on Escape

## Important Notes
- BodyPick(CameraID(Camera), MouseButton(#PB_MouseButton_Left), MouseX(), MouseY(), 1) enables mouse dragging of physics objects
- Various body types: CapsuleBody, ConeBody, BoxBody, CylinderBody, SphereBody, PlaneBody
- GUI is needed for mouse cursor display (ShowGUI with 128 transparency)
- Hidden 3D window is created for GUI system initialization
