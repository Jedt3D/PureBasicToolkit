# Node.pb - Intermediate Description
## Purpose
Demonstrates hierarchical node attachment in a 3D scene. Creates multiple branches of entities attached to nodes in a tree structure, where rotating a parent node cascades rotation to all child nodes. Mouse movement controls the rotation of the entire hierarchy.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- No custom structures
- Constants: #CameraSpeed=1, #NBNode=3, #NbBranche=7
- Arrays: entity(#NbBranche, #NBNode), Node(#NbBranche, #NBNode)
- Variables: i, j (long), KeyX, KeyY, MouseX, MouseY (float), dx, dy, d, Quit
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateNode, CreateEntity, AttachNodeObject, MoveNode, RotateNode, NodeX, NodeY, NodeZ, NodeID, EntityID
- Sprite: InitSprite, OpenWindowedScreen, FlipBuffers
- Keyboard: InitKeyboard, ExamineKeyboard, KeyboardPushed
- Mouse: InitMouse, ExamineMouse, MouseX, MouseY
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Mesh: CreateSphere, MeshID
- Material: CreateMaterial, LoadTexture, MaterialID
- Scene: SkyBox, CreateLight, AmbientColor, RenderWorld, Add3DArchive
## Input/Output
- Loads: Dirt.jpg texture, stevecube.jpg skybox
- Displays: Hierarchical tree of sphere entities rotating based on mouse input
- Controls: Mouse moves branches, arrow keys move camera, Esc quits
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open windowed screen at 80% desktop size
3. Add 3D archives for data, textures, skybox
4. Create dirt material and sphere mesh
5. For each branch (0 to #NbBranche):
   a. Create root node and entity, attach entity to node, move entity forward
   b. For each sub-node (1 to #NBNode):
      - Create child node, move it forward
      - Attach child to parent node
      - Create entity, attach to child node, move entity forward
6. Create camera looking at first branch root node
7. Set up skybox and lighting
8. Main loop: process mouse to rotate nodes hierarchically, arrow keys move camera
9. Exit on Escape
## Important Notes
- Uses #PB_Any for dynamic node/entity IDs stored in arrays
- The node hierarchy creates a chain effect where rotating a parent rotates all children
- Variable d=3 controls spacing between nodes
- Mouse position directly controls rotation angles
