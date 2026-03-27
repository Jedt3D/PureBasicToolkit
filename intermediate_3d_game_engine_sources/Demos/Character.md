# Character.pb - Intermediate Description
## Purpose
Demonstrates 3rd-person character control with complex animation blending. Based on the Ogre SDK Character demo, featuring Sinbad character with running, jumping, dancing, sword drawing/sheathing, and slicing animations with smooth crossfading transitions.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `s_Key`: Key bindings (Up, Down, Left, Right, Sword, Dance, Jump)
- `s_Entity`: Main entity structure containing Camera, BodyNode, Direction node, CameraPivot/Pitch/Goal/Node, PivotPitch float, BodyEnt, Sword1/2 entities, SwordTrail, animation names array (Anims.s[13]), BaseAnimID, TopAnimID, FadingIn/FadingOut arrays, SwordsDrawn flag, KeyDirection/GoalDirection vectors, VerticalVelocity, Timer
- Constants: #NUM_ANIMS=13, #CHAR_HEIGHT=5, #CAM_HEIGHT=2, #RUN_SPEED=17, #TURN_SPEED=500.0, #ANIM_FADE_SPEED=7.5, #JUMP_ACCEL=30.0, #GRAVITY=90.0, #PB_Shadow_TextureModulative=5
- Animation enumerations: #ANIM_IDLE_BASE through #ANIM_NONE (14 values)
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity, LoadMesh, AttachEntityObject, DetachEntityObject
- Animation: StartEntityAnimation, StopEntityAnimation, AddEntityAnimationTime, SetEntityAnimationTime, GetEntityAnimationTime, GetEntityAnimationLength, GetEntityAnimationWeight, SetEntityAnimationWeight, EntityAnimationBlendMode
- Node system: CreateNode, AttachNodeObject, MoveNode, RotateNode, NodeX/Y/Z, NodeYaw, NodeFixedYawAxis
- RibbonEffect: CreateRibbonEffect, RibbonEffectColor, RibbonEffectWidth, HideEffect, AttachRibbonEffect, DetachRibbonEffect
- Camera: CreateCamera, CameraRange, CameraLookAt, CameraYaw
- Mouse: InitMouse, ExamineMouse, MouseDeltaX/Y, MouseWheel, MouseButton
- Keyboard: KeyboardPushed, KeyboardReleased
## Input/Output
- Input: Keyboard (cursor keys move, Space jumps, Q draws swords, E dances), Mouse (look around, wheel zoom, left/right click for sword attacks)
- Output: 3D windowed screen with Sinbad character on desert ground with skybox
- Data: Sinbad.zip, desert.zip, Dirt.jpg, LightRibbonTrail material, Sinbad.mesh, Sword.mesh
## Logic Flow
1. Initialize engine, sprites, keyboard, mouse
2. Open window and windowed screen (80% desktop size)
3. Add archives (Main, Textures, Models, Scripts, desert.zip, Sinbad.zip), parse scripts
4. Create ground plane with dirt texture, light ribbon trail material
5. Create light (point), ambient color, fog, skybox (desert)
6. setupBody(): Create body node at character height, direction node, load Sinbad.mesh, attach swords to sheaths, create ribbon trail effects
7. setupCamera(): Create camera with pivot/pitch/goal/node hierarchy for orbital camera
8. setupAnimations(): Set cumulative blend mode, populate animation name list from comma-separated string, start idle animations, start relaxed hands
9. Main loop:
    a. Process window events
    b. Examine mouse: update camera goal (yaw/pitch/zoom)
    c. Examine keyboard: handle sword draw (Q), dance toggle (E), movement keys, jump (Space)
    d. Update body: calculate movement direction relative to camera, rotate body toward goal, move body
    e. Update animations: handle draw swords timing (sword transfer at halfway point), handle slice completion, handle jump phases (start->loop->end), increment animation times, fade animations
    f. Update camera: move pivot to character shoulder, smooth camera to goal position
    g. Render and flip
10. Exit on Escape
## Important Notes
- Does NOT use EnableExplicit (many implicit variables used like i, Sword, dx, dy, Quit, Flags)
- Complex animation state machine with crossfading between base and top body animations
- CurveAngle procedure smoothly interpolates angles with wrapping
- The code uses With/EndWith extensively for accessing Sinbad structure members
- Vector3 is a built-in PureBasic structure used for 3D vectors
- Macros for vector operations (Vector3_ZERO, LengthVector3, GetNodePosition, SubVector3)
- EntityParentNode used for ribbon trail attachment to sword nodes
- No EnableExplicit in reference - many variables implicitly declared
