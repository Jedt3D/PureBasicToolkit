; OpenGLGadget.pb - Generated PureBasic Source
; Demonstrates OpenGL rendering in PureBasic gadgets with a rotating cube

EnableExplicit

Enumeration
  #Window_Main
EndEnumeration

Enumeration
  #Gadget_OpenGLLeft
  #Gadget_OpenGLRight
EndEnumeration

#Timer_Render = 1

; Global rotation state
Global RotX.f
Global RotY.f
Global RotZ.f

Global SpeedX.f = 0.8
Global SpeedY.f = 0.5
Global SpeedZ.f = 1.2

Global Zoom.f = 1.0

; Procedure to render a colored rotating cube in an OpenGL gadget
Procedure RenderCube(gadgetID.i)
  SetGadgetAttribute(gadgetID, #PB_OpenGL_SetContext, #True)

  glPushMatrix_()
  glMatrixMode_(#GL_MODELVIEW)

  ; Position the cube
  glTranslatef_(0, 0, Zoom)

  ; Apply rotations
  glRotatef_(RotX, 1.0, 0, 0)
  glRotatef_(RotY, 0, 1.0, 0)
  glRotatef_(RotZ, 0, 0, 1.0)

  ; Update rotation angles
  RotX + SpeedX
  RotY + SpeedY
  RotZ + SpeedZ

  ; Clear the framebuffer and depth buffer
  glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)

  ; Draw front and back faces with vertex colors (no lighting)
  glDisable_(#GL_LIGHTING)
  glBegin_(#GL_QUADS)

  ; Front face - multicolored
  glNormal3f_(0, 0, 1.0)
  glColor3f_(1.0, 0, 0)
  glVertex3f_(0.5, 0.5, 0.5)
  glColor3f_(0, 1.0, 0)
  glVertex3f_(-0.5, 0.5, 0.5)
  glColor3f_(0, 0, 1.0)
  glVertex3f_(-0.5, -0.5, 0.5)
  glColor3f_(1.0, 1.0, 0)
  glVertex3f_(0.5, -0.5, 0.5)

  ; Back face - blue to white gradient
  glNormal3f_(0, 0, -1.0)
  glColor3f_(0, 0, 1.0)
  glVertex3f_(-0.5, -0.5, -0.5)
  glColor3f_(0.5, 0.5, 1.0)
  glVertex3f_(-0.5, 0.5, -0.5)
  glColor3f_(1.0, 1.0, 1.0)
  glVertex3f_(0.5, 0.5, -0.5)
  glColor3f_(0.5, 0.5, 1.0)
  glVertex3f_(0.5, -0.5, -0.5)

  glEnd_()

  ; Draw remaining faces with lighting for shading
  glEnable_(#GL_LIGHTING)
  glEnable_(#GL_LIGHT0)
  glBegin_(#GL_QUADS)

  ; Top face
  glNormal3f_(0, 1.0, 0)
  glVertex3f_(0.5, 0.5, 0.5)
  glVertex3f_(0.5, 0.5, -0.5)
  glVertex3f_(-0.5, 0.5, -0.5)
  glVertex3f_(-0.5, 0.5, 0.5)

  ; Bottom face
  glNormal3f_(0, -1.0, 0)
  glVertex3f_(-0.5, -0.5, -0.5)
  glVertex3f_(0.5, -0.5, -0.5)
  glVertex3f_(0.5, -0.5, 0.5)
  glVertex3f_(-0.5, -0.5, 0.5)

  ; Right face
  glNormal3f_(1.0, 0, 0)
  glVertex3f_(0.5, 0.5, 0.5)
  glVertex3f_(0.5, -0.5, 0.5)
  glVertex3f_(0.5, -0.5, -0.5)
  glVertex3f_(0.5, 0.5, -0.5)

  ; Left face
  glNormal3f_(-1.0, 0, 0)
  glVertex3f_(-0.5, -0.5, -0.5)
  glVertex3f_(-0.5, -0.5, 0.5)
  glVertex3f_(-0.5, 0.5, 0.5)
  glVertex3f_(-0.5, 0.5, -0.5)

  glEnd_()

  glPopMatrix_()
  glFinish_()

  SetGadgetAttribute(GadgetID, #PB_OpenGL_FlipBuffers, #True)
EndProcedure

; Configure OpenGL for the gadget context
Procedure InitOpenGL()
  glMatrixMode_(#GL_PROJECTION)
  gluPerspective_(30.0, 1.0, 1.0, 10.0)

  glMatrixMode_(#GL_MODELVIEW)
  glTranslatef_(0, 0, -5.0)

  glEnable_(#GL_DEPTH_TEST)
  glEnable_(#GL_CULL_FACE)
  glShadeModel_(#GL_SMOOTH)
EndProcedure

; Main program
Procedure Main()
  Protected event.i

  OpenWindow(#Window_Main, 0, 0, 520, 310, "OpenGL Cube Demo", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)

  ; Create two OpenGL gadgets side by side.
  OpenGLGadget(#Gadget_OpenGLLeft, 10, 10, 240, 240)
  InitOpenGL()

  OpenGLGadget(#Gadget_OpenGLRight, 270, 10, 240, 290)
  InitOpenGL()

  ; Timer for ~60 fps animation.
  AddWindowTimer(#Window_Main, #Timer_Render, 16)

  Repeat
    event = WaitWindowEvent()

    Select event
      Case #PB_Event_Timer
        If EventTimer() = #Timer_Render
          RenderCube(#Gadget_OpenGLLeft)
          RenderCube(#Gadget_OpenGLRight)
        EndIf
    EndSelect
  Until event = #PB_Event_CloseWindow
EndProcedure

Main()
