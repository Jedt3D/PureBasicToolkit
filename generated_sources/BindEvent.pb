;
; ------------------------------------------------------------
;
;   PureBasic - BindEvent and BindGadgetEvent example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Enumeration
  #Window_Main
EndEnumeration

Enumeration
  #Canvas_Minus
  #Canvas_Plus
  #Progress_Value
EndEnumeration

#Timer_Repeat = 100

Global ActiveGadget.i, Pressed.b, Counter.i
Global MinVal.i = -50, MaxVal.i = 50
Global TimerDelay.i = 50

Procedure PaintButton(canvas.i, state.i, label.s)
  ; Paint canvas as a fake button
  ; state: 0 = released, non-zero = pressed
  Protected w.i, h.i, bWidth.i, bHeight.i

  If StartDrawing(CanvasOutput(canvas))
    bWidth = OutputWidth()
    bHeight = OutputHeight()
    Box(0, 0, bWidth, bHeight, $CFFFFC)

    If state = 0
      ; Released look
      LineXY(0, bHeight - 1, bWidth - 1, bHeight - 1, $000000)
      LineXY(bWidth - 1, 0, bWidth - 1, bHeight - 1, $000000)
      LineXY(0, 0, bWidth - 1, 0, $FFFFFF)
      LineXY(0, 0, 0, bHeight - 1, $FFFFFF)
    Else
      ; Pressed look
      LineXY(0, bHeight - 1, bWidth - 1, bHeight - 1, $FFFFFF)
      LineXY(bWidth - 1, 0, bWidth - 1, bHeight - 1, $FFFFFF)
      LineXY(0, 0, bWidth - 1, 0, $000000)
      LineXY(0, 0, 0, bHeight - 1, $000000)
    EndIf

    w = TextWidth(label)
    h = TextHeight(label)
    DrawText((bWidth - w) / 2, (bHeight - h) / 2, label, $000000, $CFFFFC)

    StopDrawing()
  EndIf
EndProcedure

Procedure OnSpeedButtonEvent()
  ActiveGadget = EventGadget()

  Select EventType()
    Case #PB_EventType_MouseEnter
      If ActiveGadget = #Canvas_Minus
        Debug "Enter button -"
      ElseIf ActiveGadget = #Canvas_Plus
        Debug "Enter button +"
      EndIf

    Case #PB_EventType_MouseLeave
      If ActiveGadget = #Canvas_Minus
        Debug "Leave button -"
      ElseIf ActiveGadget = #Canvas_Plus
        Debug "Leave button +"
      EndIf

    Case #PB_EventType_LeftButtonDown
      Pressed = #True
      Select ActiveGadget
        Case #Canvas_Minus
          PaintButton(#Canvas_Minus, 1, "-")
        Case #Canvas_Plus
          PaintButton(#Canvas_Plus, 1, "+")
      EndSelect

    Case #PB_EventType_LeftButtonUp
      Pressed = #False
      PaintButton(#Canvas_Minus, 0, "-")
      PaintButton(#Canvas_Plus, 0, "+")

  EndSelect
EndProcedure

Procedure OnTimerEvent()
  If Pressed
    Select ActiveGadget
      Case #Canvas_Minus
        If Counter > MinVal
          Counter - 1
          SetGadgetState(#Progress_Value, GetGadgetState(#Progress_Value) - 1)
        EndIf

      Case #Canvas_Plus
        If Counter < MaxVal
          Counter + 1
          SetGadgetState(#Progress_Value, GetGadgetState(#Progress_Value) + 1)
        EndIf
    EndSelect

    Debug Counter
  EndIf
EndProcedure

Procedure Main()
  ; Open a window with speed buttons and progress bar.
  OpenWindow(#Window_Main, 0, 0, 400, 100, "Hold +/- to change value", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  CanvasGadget(#Canvas_Minus, 10, 30, 32, 32)
  CanvasGadget(#Canvas_Plus, 400 - 32 - 10, 30, 32, 32)
  PaintButton(#Canvas_Minus, 0, "-")
  PaintButton(#Canvas_Plus, 0, "+")
  ProgressBarGadget(#Progress_Value, 52, 30, 296, 32, MinVal, MaxVal, #PB_ProgressBar_Smooth)

  AddWindowTimer(#Window_Main, #Timer_Repeat, TimerDelay)

  BindGadgetEvent(#Canvas_Minus, @OnSpeedButtonEvent())
  BindGadgetEvent(#Canvas_Plus, @OnSpeedButtonEvent())
  BindEvent(#PB_Event_Timer, @OnTimerEvent())

  Repeat
  Until WaitWindowEvent(10) = #PB_Event_CloseWindow
EndProcedure

Main()
