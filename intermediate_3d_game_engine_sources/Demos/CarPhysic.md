# CarPhysic.pb - Intermediate Description
## Purpose
Demonstrates a physics-based car simulation using PureBasic's Bullet Physics engine. Shows how to build a car from box and cylinder entities connected with hinge joints for steering and drive wheels. Supports multiple drive configurations (FWD, RWD, 4WD, Tyrrell P34 six-wheeler).
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `wheel_struct`: Contains entity IDs for wheel support and wheel, joint IDs, wheel dimensions (radius, width, mass), and flags for steering/drive capability.
- `car_struct`: Contains chassis/body entity IDs, body joint ID, car dimensions (width, length, height, chassisHeight, mass), driving parameters (maxSteer, maxSpeed, accel), and a List of wheel_struct.
- Enumeration for drive types: #FWDRIVE, #RWDRIVE, #FOURWHEELDRIVE, #TYRELLP34
- Constants: #SCREENWIDTH=1000, #SCREENHEIGHT=500, #LEFTSIDE=-1, #RIGHTSIDE=1
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity, CreateEntityBody, HingeJoint, SliderJoint, SetJointAttribute, EnableHingeJointAngularMotor, RenderWorld, FlipBuffers
- Sprite: InitSprite, OpenWindowedScreen
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed, KeyboardReleased
- Window: OpenWindow with gadgets (FrameGadget, ButtonGadget, ComboBoxGadget, StringGadget, TextGadget)
- 3D Primitives: CreatePlane, CreateCube, CreateCylinder
- Materials/Textures: CreateTexture, CreateMaterial, SetMaterialColor
- Camera: CreateCamera, MoveCamera, CameraLookAt, CameraRenderMode
- Physics: DisableEntityBody, EnableWorldPhysics, WorldDebug, WorldShadows
## Input/Output
- Input: Keyboard (arrow keys for driving, W for wireframe, P for physics debug, Return for pause, Escape to quit), GUI gadgets for car parameters
- Output: 3D windowed screen showing car physics simulation with a ground plane, jump ramp, and controllable car
- Data: Uses #PB_Compiler_Home + "examples/3d/Data/Main" for scripts
## Logic Flow
1. Initialize 3D engine, sprites, keyboard
2. Open window with parameter gadgets (length, width, height, mass, steering, speed, acceleration, wheel params)
3. Open windowed screen in remaining space (right side of window)
4. Add 3D archive for scripts, parse scripts
5. Create textures (blank white, striped, ground green grid)
6. Create materials (ground, red, blue, cyan striped, white striped)
7. Create ground plane (300x300) with static body
8. Create a jump ramp (scaled/rotated cube with static body)
9. Create wheel mesh (cylinder) and default car using createCar procedure
10. Create camera, light, enable shadows
11. Main loop:
    a. Process window events (reset button triggers car recreation with GUI params)
    b. Examine keyboard for wireframe toggle (W), physics debug (P), simulation pause (Return)
    c. If car exists, disable body sleep, handle steering (left/right arrow keys adjust hinge joint limits), handle acceleration (up/down arrow keys enable hinge joint angular motors)
    d. Camera follows car using distance-based movement
    e. Render and flip
12. Exit on Escape or window close
## Important Notes
- EnableExplicit is used but placed after globals (line 76). The generated version should place it at the very top.
- The DISTANCE2 macro uses global temp variables and computes squared distance for efficiency.
- createCar procedure destroys existing car before creating a new one (calls killCar).
- Car template selection determines which wheels are steerable/driven.
- The Tyrrell P34 template has 6 wheels (4 front steering, 2 rear drive).
- Global variables extensively used for gadget IDs and car state.
