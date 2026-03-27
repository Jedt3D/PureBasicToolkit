# EntityAnimation2.pb - Intermediate Description
## Purpose
Demonstrates entity animation with keyboard-controlled robot movement. Robot walks when arrow keys are pressed and stops when released. Shows animation start/stop based on movement state.
## Type
3D Engine Demo
## Compiler Flags
None
## Structure
No custom structures.
## Key Libraries/Functions
- InitEngine3D(), InitSprite(), InitKeyboard(), InitMouse()
- OpenWindow(), OpenWindowedScreen()
- Add3DArchive(), Parse3DScripts(), WorldShadows()
- MoveEntity() - moves robot in response to keyboard
- RotateEntity() - rotates robot to face movement direction
- EntityAnimationStatus() - checks if animation is stopped
- StartEntityAnimation() with #PB_EntityAnimation_Manual
- StopEntityAnimation() - stops when robot not moving
- AddEntityAnimationTime() - advances animation
- #PB_EntityAnimation_Stopped constant
## Input/Output
- Loads: Dirt.jpg, robot.mesh, desert07.jpg
- Displays: Movable robot on desert ground with skybox
- Controls: Arrow keys move robot, PageUp/PageDown speed, Mouse rotates camera, Esc quits
## Logic Flow
1. Define float vars (Speed=1.0) and integer RobotMove
2. Initialize subsystems, open window/screen
3. Add archives, parse scripts, set shadows
4. Create ground plane with dirt material
5. Load robot mesh, create entity
6. Create skybox, camera, light
7. Main loop:
   a. Process events, read mouse/keyboard
   b. Set RobotMove = #False
   c. Check arrow keys - move entity and rotate to face direction, set RobotMove=#True
   d. Check PageUp/PageDown for speed adjustment
   e. If RobotMove and animation stopped, start "Walk" in manual mode
   f. If not moving, stop animation
   g. Add animation time, rotate/move camera
   h. TimeSinceLastFrame = RenderWorld() * Speed
   i. Flip buffers
8. Exit on Escape
## Important Notes
- Robot faces specific direction based on which arrow key (0/90/180/-90 degrees)
- Animation loops via check: if stopped, restart
- RollZ and KeyX/KeyY used in camera but never set to non-zero (leftover from template)
- Desert.zip vs desert.zip - capitalization differs from EntityAnimation.pb
