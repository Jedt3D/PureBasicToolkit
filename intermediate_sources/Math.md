# Math.pb - Intermediate Description

## Purpose
Demonstrates math functions (Sin, Cos, Random) by drawing a spirograph-like animation in a window using trig functions and image drawing.

## Application Type
GUI (OpenWindow with event loop and timer-based animation)

## Compiler Flags
None required (GUI application)

## Structure
- Opens a window with an ImageGadget
- Creates an image for off-screen drawing
- Uses a timer to animate
- Applies trigonometric rotation formulas to plot points

## Key Libraries/Functions
- OpenWindow, ImageGadget, CreateImage, AddWindowTimer
- StartDrawing, ImageOutput, FrontColor, Plot, StopDrawing
- Cos(), Sin(), Random(), RGB()
- DesktopScaledX/Y for DPI-aware sizing
- SetGadgetState to update gadget display
- WaitWindowEvent

## Input/Output
- No external input
- Visual output in a window with animated dots

## Logic Flow
1. Open a 400x400 window with an ImageGadget
2. Create a drawing image at desktop-scaled resolution
3. Set random initial radius values for X and Y
4. Add a window timer at 10ms interval
5. Event loop: on each timer tick, increment angle, compute rotated coordinates using Sin/Cos, plot colored points
6. Loop until window is closed

## Cross-Platform Notes
- Uses DesktopScaledX/DesktopScaledY for proper DPI scaling on Retina/HiDPI displays

## Important Notes
- The animation uses parametric rotation: x2 = X*Cos(a) + Y*Sin(a), y2 = X*Sin(a) - Y*Cos(a)
- Two mirrored points are plotted per frame for visual symmetry
- Colors are randomized each frame
