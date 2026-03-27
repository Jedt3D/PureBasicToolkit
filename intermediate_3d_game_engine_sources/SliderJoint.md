# SliderJoint.pb - Intermediate Description
## Purpose
Demonstrates the SliderJoint physics constraint in the 3D engine, allowing an entity to slide along an axis between two limits when impulse is applied.
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
- CreateMaterial(), LoadTexture(), MaterialShininess()
- CreateCube(), CreateSphere()
- CreateEntity(), ScaleEntity()
- CreateEntityBody() with #PB_Entity_StaticBody, #PB_Entity_BoxBody, #PB_Entity_SphereBody
- SliderJoint() - creates slider joint between two entities
- SetJointAttribute() with #PB_SliderJoint_LowerLimit, #PB_SliderJoint_UpperLimit
- ApplyEntityImpulse()
- CreateCamera(), MoveCamera(), CameraLookAt()
- CreateLight(), AmbientColor()
- RotateCamera(), RenderWorld(), FlipBuffers()
## Input/Output
- Loads: Dirt.jpg, Wood.jpg textures
- Displays: Two box entities connected by slider joint, a floor, and a sphere
- PageUp/PageDown applies impulse to the sliding entity
## Logic Flow
1. Initialize engine, sprite, keyboard, mouse
2. Open window and windowed screen
3. Add texture archives and parse scripts
4. Create 4 materials (Dirt, Wood, green, blue with shininess)
5. Create cube and sphere meshes
6. Create 4 entities: two boxes, a floor, a sphere
7. Create entity bodies (static for anchors, dynamic for sliding objects)
8. Create SliderJoint between entity 0 and entity 1 with limits -3 to 0
9. Create camera looking at the scene, create light
10. Main loop: handle input, PageUp/PageDown applies impulse to entity 1
11. Mouse rotates camera, arrow keys move camera
12. Render and flip until Escape or Quit
## Important Notes
- Entity 0 is static (anchor), Entity 1 slides along the joint axis
- Joint limits constrain the range of sliding motion
- Uses physics bodies for realistic simulation
