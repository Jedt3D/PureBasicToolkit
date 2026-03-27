# FacialAnimation.pb - Intermediate Description
## Purpose
Demonstrates facial animation using pose animation. Loads a facial mesh and allows toggling between automatic speech animation and manual pose control via sliders for expressions and mouth shapes.
## Type
3D Engine Demo (complex game demo)
## Compiler Flags
None (GUI app with windowed screen)
## Structure
- `s_Slider`: Contains index, text gadget ID, and slider gadget ID
- Enumerations: #CheckBox, #FrameExpressions, #FrameShapes (gadget IDs)
- Constants: #Mesh=0, #Entity=0
- Global Lists: Expressions.s_Slider(), MouthShapes.s_Slider()
- Globals: mPlayAnimation, Track=4, KeyFrame=0, Animation$="Manual"
## Key Libraries/Functions
- Engine3D: InitEngine3D, CreateEntity, LoadMesh
- Vertex Animation: CreateVertexAnimation, CreateVertexTrack, CreateVertexPoseKeyFrame, AddVertexPoseReference, UpdateVertexPoseReference, VertexPoseReferenceCount, MeshPoseName, UpdateEntityAnimation
- Entity Animation: StartEntityAnimation, StopEntityAnimation
- Camera: CreateCamera, MoveCamera, CameraLookAt
- Gadgets: FrameGadget, CheckBoxGadget, TrackBarGadget, TextGadget, HideGadget, GetGadgetState, SetGadgetState, GetGadgetData, SetGadgetData
## Input/Output
- Input: GUI checkboxes and sliders for controlling facial poses, keyboard (Escape to quit)
- Output: 3D windowed screen (800x600 area) showing animated facial mesh, with control panel on right side
- Data: facial.mesh from Models directory, textures, scripts, GUI resources
## Logic Flow
1. Initialize engine, sprites, keyboard
2. Open window (1000x600) with windowed screen (800x600 left portion)
3. Add archives (Textures, Models, Scripts, GUI), parse scripts
4. SetupContent():
   a. Create two lights, load facial.mesh
   b. Create manual vertex animation with pose track and keyframe
   c. Add 15 pose references (indices 0-14) with weight 0
   d. Create head entity, start "Speak" animation
   e. Create camera pointing at head
5. setupControls():
   a. Create frame gadgets for Expressions and Shapes sections
   b. For each pose reference, check if name contains "Expression" - create slider in appropriate frame
   c. Store pose index in gadget data for later retrieval
   d. Create checkbox for manual/automatic toggle
6. checkBoxToggled(): Toggle between "Speak" (automatic) and "Manual" animation, show/hide slider controls
7. Main loop:
   a. Process window events (checkbox toggle, slider changes)
   b. On slider change: UpdateVertexPoseReference with slider value / 10.0, UpdateEntityAnimation
   c. Examine keyboard, render, flip
8. Exit on Escape or window close
## Important Notes
- No EnableExplicit - uses implicit variables (i, Event, Quit, Gadget, poseName$)
- Vertex pose animation system is used (CreateVertexAnimation, etc.)
- The manual animation track and keyframe are created programmatically on the loaded mesh
- Pose names are read from the mesh to populate UI labels
- GetGadgetData/SetGadgetData used to associate sliders with pose indices
- The animation string "Manual" is stored in Animation$ global
