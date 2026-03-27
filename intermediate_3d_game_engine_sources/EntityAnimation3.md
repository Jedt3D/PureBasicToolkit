# EntityAnimation3.pb - Intermediate Description
## Purpose
Demonstrates animation blending/crossfading between Idle and Walk animations using EntityAnimationBlendMode, GetEntityAnimationWeight, and SetEntityAnimationWeight. Robot smoothly transitions between idle and walking states with rotation smoothing via CurveAngle.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures. Uses Enumeration for #Idle=1, #Walk=2. Constant #ANIM_FADE_SPEED=7.5, #NUM_ANIMS=2. Global Dim Anim.s() array for animation names. Macro Clamp for clamping values.
## Key Libraries/Functions
- EntityAnimationBlendMode() with #PB_EntityAnimation_Average
- GetEntityAnimationWeight(), SetEntityAnimationWeight()
- StartEntityAnimation() with #PB_EntityAnimation_Manual
- StopEntityAnimation(), AddEntityAnimationTime()
- EntityYaw() - gets current yaw angle of entity
- Custom procedures: fadeAnimations(), CurveAngle(), WrapPi()
## Input/Output
- Loads: Dirt.jpg, robot.mesh, desert07.jpg
- Displays: Robot with smooth idle/walk transitions on desert ground
- Controls: Arrow keys move robot, PageUp/PageDown speed, Mouse camera, Esc quit
## Logic Flow
1. Define constants, enumeration, globals, animation name array, declare procedures
2. Define Clamp macro
3. Initialize subsystems, open window/screen
4. Add archives, parse scripts, set shadows
5. Create ground plane, load robot mesh
6. Create entity with EntityAnimationBlendMode set to Average
7. Parse animation names "Idle,Walk" into Anim() array using StringField
8. Create skybox, camera, light
9. Main loop:
   a. Process events, read mouse
   b. Track movement with RobotMove flag and target Angle
   c. Smooth rotation using CurveAngle
   d. If moving and not in Walk state, switch to Walk (fade in Walk, fade out Idle)
   e. If stopped and not in Idle state, switch to Idle (fade in Idle, fade out Walk)
   f. Add animation time, call fadeAnimations
   g. Rotate camera, render, flip
10. fadeAnimations procedure: gradually adjusts weights using Clamp macro
11. WrapPi: wraps angle to -180..180 range
12. CurveAngle: smoothly interpolates between current and target angle
## Important Notes
- Uses Global variables for FadeIn, FadeOut, Anim state tracking
- Animation weight blending creates smooth transitions
- CurveAngle uses TimeSinceLastFrame for smooth rotation
- Clamp macro modifies the variable in-place using If/ElseIf
