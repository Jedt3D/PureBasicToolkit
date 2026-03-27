# CheckObjectVisibility.pb - Intermediate Description

## Purpose
Demonstrates CheckObjectVisibility() to determine if 3D objects (cube, sphere, cylinder) are visible in the current camera view. Displays results in a 3D GUI window.

## Type
3D Engine Demo

## Compiler Flags
None

## Structure
No custom structures. Constants:
- `#CameraSpeed = 0.4`
- `#MainWindow = 0`
Enumeration: #Text1, #Text2, #Text3

## Key Libraries/Functions
- Engine3D: InitEngine3D(), Add3DArchive(), Parse3DScripts(), CreateMaterial(), LoadTexture(), GetScriptMaterial(), CreatePlane(), CreateCube(), CreateSphere(), CreateCylinder(), CreateEntity(), CreateCamera(), CameraBackColor(), MoveCamera(), CameraLookAt(), RotateCamera(), CameraViewWidth(), CameraViewHeight(), CreateLight(), AmbientColor(), CheckObjectVisibility(), RenderWorld()
- GUI3D: OpenWindow3D(), TextGadget3D(), SetGadgetText3D(), ShowGUI(), WindowEvent3D(), InputEvent3D()

## Input/Output
- Loads: Dirt.jpg, Color/Blue, Color/Green, Color/Red script materials, GUI data
- Displays: Three colored shapes on a plane with a 3D GUI window showing which objects are visible

## Logic Flow
1. Define constants, enumeration, input variables, RatioX/RatioY
2. Declare IsOnScreen procedure
3. Initialize engine, sprite, keyboard, mouse
4. Open window and windowed screen
5. Add archives for textures, models, scripts, GUI; parse scripts
6. Create materials: dirt, blue, green, red (from scripts)
7. Create meshes: plane, cube, sphere, cylinder
8. Create entities: ground at origin, cube at (0,4,150), sphere at (150,4,0), cylinder at (0,4,-150)
9. Create camera with blue-gray background, position (-1,10,15) looking at (100,0,0)
10. Create light, ambient color
11. Calculate viewport ratios (RatioX, RatioY) for resolution-independent GUI
12. Create 3D window with three text gadgets for visibility status
13. ShowGUI(128, #False) - semi-transparent, no mouse cursor
14. Main loop:
    - Process window events and 3D window events
    - Read mouse for GUI input and camera rotation
    - Read keyboard for camera movement (with mouse wheel)
    - Call IsOnScreen for each entity: checks visibility and updates text gadgets
    - RotateCamera, MoveCamera
    - RenderWorld, FlipBuffers
15. Exit on Escape

Procedure IsOnScreen(Editor, object$, objectID):
- Calls CheckObjectVisibility(0, objectID) with camera 0
- Updates text gadget with "is on screen" or "is not on screen"

## Important Notes
- CheckObjectVisibility(cameraID, objectID) returns true if object is in camera frustum
- Uses EntityID() to get the object ID for visibility check
- 3D GUI scaled by viewport ratio for resolution independence
- Procedure declared before use (Declare), defined after main code
- ShowGUI(128, #False): 128 = semi-transparent, #False = no mouse cursor display
- MouseWheel() multiplied by 10 added to camera Z movement
