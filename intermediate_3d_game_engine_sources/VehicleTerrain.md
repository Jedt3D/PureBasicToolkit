# VehicleTerrain.pb - Intermediate Description
## Purpose
Demonstrates vehicle physics on terrain, with a vehicle that can drive over terrain with proper physics collision and camera following that accounts for terrain height.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
- s_Vehicle: Chassis.i, Wheels.i[4], WheelsEngine.i[4], WheelsEngineCount.i, WheelsSteerable.i[4], WheelsSteerableCount.i, EngineBrake.f, EngineForce.f, Steering.f, SteeringLeft.i, SteeringRight.i
- Macro: VECTOR3(V, a, b, c)
- Constants: #CameraSpeed=2, #CUBE_HALF_EXTENTS=1
- Global physics parameters and Vector3 globals for CameraStart and CarPosition
- Procedures: BuildVehicle(), HandleVehicle(), ControlVehicle(), Interpolation(), Clamp(), InitBlendMaps()
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- SetupTerrains(), CreateTerrain(), DefineTerrainTile(), BuildTerrain()
- CreateTerrainBody(), TerrainRenderMode(), TerrainHeight()
- CreateVehicle(#PB_Any), AddSubEntity() with box body dimensions
- AddVehicleWheel() with full parameters including axle direction
- SetVehicleAttribute() with #PB_Vehicle_MaxSuspensionForce
- ApplyVehicleBrake(), ApplyVehicleForce(), ApplyVehicleSteering()
- LoadMesh(#PB_Any) for chassis.mesh and wheel.mesh
- CameraFollow() with terrain height for Y parameter
- WorldShadows(), SkyBox()
## Input/Output
- Loads: chassis.mesh, wheel.mesh, terrain textures, terrain513.png, desert pack
- Displays: Vehicle driving on terrain with proper physics
- Controls: Arrow keys for drive/steer
## Logic Flow
1. Initialize engine, create windowed screen
2. Setup terrain with physics body
3. BuildVehicle: load chassis and wheel meshes, create vehicle with 4 wheels
4. Configure wheels: front 2 steerable, all 4 engine-driven
5. Set per-wheel MaxSuspensionForce
6. Main loop: HandleVehicle reads input, ControlVehicle applies forces
7. CameraFollow uses TerrainHeight for Y offset
8. Render and flip
## Important Notes
- Uses loaded mesh models (chassis.mesh, wheel.mesh) instead of primitives
- AddSubEntity uses explicit box body dimensions (0,0,0,0,1.0,0.75,2.1)
- Suspension damping/compression computed from stiffness using Sqr()
- CameraFollow Y parameter includes TerrainHeight for terrain-aware following
- WheelsEngine/WheelsSteerable arrays allow flexible wheel configuration
- Wheel entities created with scale flag 32
