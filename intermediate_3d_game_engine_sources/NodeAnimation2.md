# NodeAnimation2.pb - Intermediate Description
## Purpose
Advanced NodeAnimation demo showing multiple animation paths with weight blending. Demonstrates creating separate animations for different entities (cube, sphere, cylinder) with ribbon trail effects. The #Weight constant controls blending between two competing animations on the cylinder.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #Weight=1
- Forward declarations: AddPath0, AddPath1, AddPath2(Weight), AddPath3(Weight)
- Procedures with local vars: Duration, Time (implicit integer in procedures)
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateNode, AttachNodeObject, NodeID, EntityID, EntityParentNode
- NodeAnimation: CreateNodeAnimation, CreateNodeAnimationKeyFrame, StartNodeAnimation, AddNodeAnimationTime, SetNodeAnimationWeight
- Entity: CreateEntity, EntityX, EntityY, EntityZ, EntityLookAt, ScaleEntity, MoveEntity
- Mesh: CreateCube, CreateSphere, CreateCylinder, CreatePlane, MeshID
- Material: CreateMaterial, LoadTexture, MaterialID, GetScriptMaterial, MaterialShininess
- RibbonEffect: CreateRibbonEffect, RibbonEffectColor, RibbonEffectWidth, AttachRibbonEffect
- Scene: WorldShadows, SkyBox, AmbientColor, CreateLight, RenderWorld, Parse3DScripts
- Camera: CreateCamera, MoveCamera, CameraFOV, CameraBackColor, CameraLookAt
## Input/Output
- Loads: Dirt.jpg, stevecube.jpg skybox, LightRibbonTrail script material
- Displays: Three objects (cube, sphere, cylinder) following animated paths with ribbon trails
- Controls: Esc to quit
## Logic Flow
1. Declare 4 path procedures
2. Initialize engine, sprite, keyboard, mouse
3. Open windowed screen
4. Add archives and parse scripts; enable additive shadows
5. Create ground plane with dirt texture
6. Create cube (#1), sphere (#2), cylinder (#3) entities
7. Create checkpoint cylinder entities (#4-#8) as waypoint markers
8. Set up camera (top-down-ish view, FOV 25, custom back color)
9. Create node #0, attach cube entity to it
10. Set up lighting
11. Create 3 ribbon trail effects attached to entities
12. Call AddPath0-3 to create 4 node animations
13. Main loop: advance all animations, EntityLookAt for cube, render
14. Procedures: Each creates keyframes for different paths
    - AddPath2 and AddPath3 both animate the cylinder's parent node with different weights
## Important Notes
- Duration and Time inside procedures are local variables (not typed as float - they are integer by default)
- SetNodeAnimationWeight controls blending between competing animations
- EntityParentNode is used to get the parent node of entities for animation
- The reference uses fixed numeric IDs for node animations (0-3)
- The procedures use untyped local variables Duration and Time which default to integer
