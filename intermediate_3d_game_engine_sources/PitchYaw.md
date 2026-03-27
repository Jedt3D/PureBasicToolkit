# PitchYaw.pb - Intermediate Description
## Purpose
Demonstrates using Pitch() and Yaw() functions to control camera orientation through a node hierarchy. A NodePitch controls vertical look (pitch) and NodeYaw controls horizontal look (yaw), creating a smooth FPS-like camera system with a billboard-populated grass landscape and house.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #CameraSpeed=2
- Variables: KeyX, KeyY, MouseX, MouseY (float), various entity/mesh/material IDs via #PB_Any
## Key Libraries/Functions
- Node: CreateNode, AttachNodeObject, MoveNode, NodeID, Pitch, Yaw
- Camera: CreateCamera, CameraID
- Billboard: CreateBillboardGroup, AddBillboard
- Entity: CreateEntity, ScaleEntity
- Mesh: CreatePlane, LoadMesh, MeshID
- Material: CreateMaterial, LoadTexture, TextureID, MaterialID, SetMaterialAttribute
- Scene: SkyBox, CreateLight, RenderWorld, Parse3DScripts
- Constants: #PB_Material_AlphaReject, #PB_Material_TAM, #PB_Material_ClampTAM, #PB_Local, #PB_World, #PB_Relative
## Input/Output
- Loads: grass1.png, Dirt.jpg textures, tudorhouse.mesh, desert07.jpg skybox
- Displays: Grass-covered landscape with a house, FPS-style camera control
- Controls: Mouse for look, arrows for movement, Esc to quit
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen
3. Add archives for textures, models, scripts, desert skybox; parse scripts
4. Create grass material with alpha reject and dirt material
5. Create billboard group with 4001 grass billboards randomly placed
6. Create ground plane
7. Load and place tudor house (scaled 0.5)
8. Set up skybox and camera, light
9. Create node hierarchy: NodePitch (for vertical) contains camera, NodeYaw (for horizontal, positioned at 200,70,900) contains NodePitch
10. Main loop:
    a. Mouse delta controls pitch and yaw via Pitch() and Yaw() functions
    b. Arrow keys set movement with deceleration (KeyX *= 0.85, KeyY *= 0.9)
    c. MoveNode(NodeYaw) for movement in local space
11. Exit on Escape
## Important Notes
- Pitch and Yaw are separate functions that apply rotation to nodes
- The node hierarchy separates pitch and yaw to avoid gimbal lock issues
- Pitch uses #PB_Local | #PB_Relative, Yaw uses #PB_World | #PB_Relative
- Movement has momentum/deceleration effect
- Billboard count is 4001 (0 to 4000)
