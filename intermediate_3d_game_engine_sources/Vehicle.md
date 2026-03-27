# Vehicle.pb - Intermediate Description
## Purpose
Demonstrates vehicle physics with a drivable car on a flat ground with cylinder obstacles and walls, featuring steering, acceleration, braking, and reverse.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- s_Vehicle: Chassis.i, Wheels.i[4], EngineBrake.f, EngineForce.f, Steering.f, SteeringLeft.i, SteeringRight.i
- Macro: VECTOR3(V, a, b, c) sets x/y/z components
- Constants: #CameraSpeed=2, #CUBE_HALF_EXTENTS=1
- Global physics parameters: MaxEngineForce, MaxEngineBrake, SteeringIncrement, SteeringClamp, WheelRadius, WheelWidth, Suspension params, FrictionSlip, RollInfluence
- Procedures: BuildVehicle(), HandleVehicle(), ControlVehicle(), Interpolation(), Clamp()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- CreateVehicle(#PB_Any), AddSubEntity(), CreateVehicleBody()
- AddVehicleWheel()
- ApplyVehicleBrake(), ApplyVehicleForce(), ApplyVehicleSteering()
- GetEntityAttribute() with #PB_Entity_LinearVelocity
- SetEntityAttribute() with #PB_Entity_LinearDamping, #PB_Entity_AngularDamping
- CreateEntityBody() with #PB_Entity_PlaneBody, CylinderBody
- EntityRenderMode() with #PB_Entity_CastShadow
- CameraFollow()
- WorldShadows(), SkyBox()
## Input/Output
- Loads: Wood.jpg, Dirt.jpg textures, desert pack, scripts
- Displays: Drivable vehicle on flat ground with walls and cylinder obstacles
- Controls: Arrow keys for drive/steer
## Logic Flow
1. Initialize engine, create windowed screen
2. Create materials, ground plane with body, wall entities with plane bodies
3. Create cylinder obstacles in a line
4. Set up lighting and camera
5. BuildVehicle: create chassis entity, CreateVehicle, AddSubEntity with box body
6. Set vehicle body with mass, friction, suspension parameters
7. Create 4 wheel entities, add wheels with front steering, rear fixed
8. Main loop: ExamineMouse/Keyboard, HandleVehicle reads input, ControlVehicle applies forces/steering
9. CameraFollow tracks vehicle chassis
10. Interpolation used for steering return-to-center
## Important Notes
- Vehicle uses CreateVehicle/AddSubEntity/AddVehicleWheel API pattern
- Front wheels (0,1) are steerable, rear wheels (2,3) are fixed
- Reverse logic checks linear velocity to determine brake vs reverse
- CameraFollow provides automatic chase camera
- Wall bodies use #PB_Entity_PlaneBody with direction vectors
- Global Recul flag tracks reverse state
