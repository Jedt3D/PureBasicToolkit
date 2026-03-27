# OpenGLGadget.pb - Intermediate Description

## Purpose
Demonstrates the OpenGLGadget for rendering 3D content using OpenGL within a PureBasic window. Draws a rotating colored cube with both flat-colored and lit/shaded faces.

## Application Type
GUI (OpenWindow with OpenGLGadgets and timer-based animation)

## Compiler Flags
None required (GUI application)

## Structure
- Global variables for rotation axes and speeds
- DrawCube procedure: renders a colored/shaded cube using OpenGL immediate mode
- SetupGL procedure: configures OpenGL projection and settings
- HandleError procedure: error checking utility
- Main code: opens window with two OpenGLGadgets, each rendering the same cube

## Key Libraries/Functions
- OpenWindow, OpenGLGadget, SetGadgetAttribute
- AddWindowTimer, WaitWindowEvent, EventTimer
- OpenGL functions: glPushMatrix_, glPopMatrix_, glMatrixMode_, glTranslatef_, glRotatef_
- glClear_, glBegin_, glEnd_, glVertex3f_, glColor3f_, glNormal3f_
- glEnable_, glDisable_, glShadeModel_, glFinish_
- gluPerspective_
- #GL_MODELVIEW, #GL_PROJECTION, #GL_QUADS, #GL_COLOR_BUFFER_BIT, #GL_DEPTH_BUFFER_BIT
- #GL_DEPTH_TEST, #GL_CULL_FACE, #GL_LIGHTING, #GL_LIGHT0, #GL_SMOOTH
- #PB_OpenGL_SetContext, #PB_OpenGL_FlipBuffers

## Input/Output
- No external input
- Visual output: two rotating cubes in a window

## Logic Flow
1. Define global rotation and zoom variables
2. DrawCube procedure: set context, push matrix, apply transforms and rotations, draw colored front/back faces, draw lit side/top/bottom faces, pop matrix, flip buffers
3. SetupGL: set perspective, position viewer, enable depth test, cull face, smooth shading
4. Open window with two OpenGLGadgets of different sizes
5. Call SetupGL for each gadget
6. Create timer at ~60fps
7. On timer events, call DrawCube for both gadgets
8. Exit on close window

## Cross-Platform Notes
- OpenGL is cross-platform but macOS may deprecate some features
- Immediate mode (glBegin/glEnd) is legacy but supported

## Important Notes
- Each gadget needs SetGadgetAttribute with #PB_OpenGL_SetContext before drawing
- SetGadgetAttribute with #PB_OpenGL_FlipBuffers to present
- Uses both colored (unlit) and shaded (lit) faces on the cube
- Two separate OpenGLGadgets in the same window
