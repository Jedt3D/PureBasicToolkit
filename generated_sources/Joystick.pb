;
; ------------------------------------------------------------
;
;   PureBasic - Joystick Input Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define NbJoysticks.i
Define Event.i
Define x.i
Define y.i
Define Quit.i

NbJoysticks = InitJoystick()

If NbJoysticks = 0
  MessageRequester("Error", "No joysticks are available.", 0)
  End
EndIf

If OpenWindow(0, 100, 100, 300, 260, "PureBasic - Joystick Demo")

  MessageRequester("Information", "This will test the joystick in a window.", 0)

  x = WindowWidth(0) / 2
  y = WindowHeight(0) / 2 - 20

  Repeat

    ; Process all pending window events
    Repeat
      Event = WindowEvent()
      If Event = #PB_Event_CloseWindow
        Quit = 1
      EndIf
    Until Event = 0

    Delay(20)

    If ExamineJoystick(0)
      x + JoystickAxisX(0)
      y + JoystickAxisY(0)

      If JoystickButton(0, 1)
        MessageRequester("Info", "Button 1 has been pressed", 0)
      EndIf

      If JoystickButton(0, 2)
        MessageRequester("Info", "Button 2 has been pressed", 0)
      EndIf

      If StartDrawing(WindowOutput(0))
        FrontColor(RGB(255, 0, 0))
        Box(x, y, 10, 10)
        StopDrawing()
      EndIf
    EndIf

  Until Quit = 1

EndIf

End
