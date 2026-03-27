# GenericJoint.pb - Intermediate Description
## Purpose
Demonstrates GenericJoint() physics joints with spring properties. Creates various spring-connected objects (plane, punching ball, targets, turnstile) that can be hit by shot spheres. Shows different joint configurations.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Constant #Speed=50.
## Key Libraries/Functions
- GenericJoint() - creates 6DOF joints between entities
- SetJointAttribute() with #PB_Joint_EnableSpring, #PB_Joint_Stiffness, #PB_Joint_Damping, #PB_Joint_NoLimit
- CreateEntityBody() with Box, Sphere, ConvexHull, Static body types
- ApplyEntityImpulse() for shooting
- PointPick(), PickX/Y/Z() for mouse aiming
- CreateSprite(), StartDrawing/SpriteOutput/StopDrawing for crosshair
- DisplayTransparentSprite() for crosshair overlay
- WorldShadows(#PB_Shadow_Additive)
- MouseLocate() to center mouse
- LoadFont() for sprite text
## Input/Output
- Loads: Wood.jpg, script materials (SphereMappedRustySteel, Color/Red/Green/Yellow), Dirt.jpg, ground_diffuse.png
- Displays: Ground platform with spring-connected objects, crosshair cursor
- Controls: Left click to shoot, arrows/mouse wheel move camera, Esc quit
## Logic Flow
1. Define constant and variables
2. Initialize subsystems, open window/screen
3. Add archives, parse scripts
4. Create sprites for crosshair (circle with crosslines) and info display
5. Create materials (Wood, rusty steel, red, green, dirt, ground, yellow)
6. Create ground entity (scaled cube, static body)
7. Create shoot ball mesh (sphere)
8. Create 5 joint demonstrations:
   a. Plane: elastic Y rotation (spring on axis 4)
   b. Punching ball: elastic X and Z rotation (springs on axes 3,5)
   c. Red target: elastic Z translation (spring on axis 2)
   d. Green target: elastic X translation + free Z rotation (spring axis 0, no limit axis 5)
   e. Turnstile: free X rotation (no limit axis 3)
9. Create camera, light, enable shadows
10. Center mouse
11. Main loop:
    a. Process events, examine mouse/keyboard
    b. On left click: PointPick, create shoot sphere with impulse
    c. Camera movement with arrows/mouse wheel
    d. Camera always looks at origin
    e. Render, display crosshair sprite at mouse position, flip
12. Exit on Escape
## Important Notes
- Joint axes: 0-2 = translation X/Y/Z, 3-5 = rotation X/Y/Z
- Spring properties: EnableSpring, Stiffness, Damping per axis
- NoLimit removes joint constraint on specific axis
- All objects connected to ground entity (ID 10)
- Crosshair drawn using PureBasic 2D drawing on sprite
- ScaleMaterial(10,1/8,1/8) for ground texture tiling
- Multiple materials from different sources (script, texture file)
