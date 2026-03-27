;
; ------------------------------------------------------------
;
;   PureBasic - BindGadgetEvent example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Procedure RepaintCanvas(xPos.i)
  ; Paint a canvas that looks like a trackbar
  If StartDrawing(CanvasOutput(0))
    Box(0, 0, OutputWidth(), OutputHeight(), RGB($FF, $FF, $FF))
    DrawingMode(#PB_2DDrawing_Gradient)
    BackColor(RGB($40, $40, $40))
    FrontColor(RGB($DD, $DD, $DD))
    LinearGradient(0, 0, OutputWidth(), OutputHeight())
    Box(0, 0, OutputWidth(), OutputHeight())
    DrawingMode(#PB_2DDrawing_Default)
    Box(xPos, 0, OutputWidth() - xPos, OutputHeight(), RGB($FF, $FF, $FF))
    Box(xPos - 3, 0, 5, OutputHeight(), RGB($00, $00, $00))
    StopDrawing()
  EndIf
EndProcedure

Procedure OnLeftClick()
  RepaintCanvas(GetGadgetAttribute(0, #PB_Canvas_MouseX))
EndProcedure

Procedure OnMouseMove()
  Protected x.i
  If GetGadgetAttribute(0, #PB_Canvas_Buttons) & #PB_Canvas_LeftButton
    x = GetGadgetAttribute(0, #PB_Canvas_MouseX)
    If x < 0 : x = 0 : EndIf
    If x > DesktopScaledX(GadgetWidth(0)) : x = DesktopScaledX(GadgetWidth(0)) : EndIf
    RepaintCanvas(x)
  EndIf
EndProcedure

If OpenWindow(0, 0, 0, 220, 40, "BindGadgetEvent", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  CanvasGadget(0, 10, 10, 200, 20)

  RepaintCanvas(50)

  BindGadgetEvent(0, @OnLeftClick(), #PB_EventType_LeftClick)
  BindGadgetEvent(0, @OnMouseMove(), #PB_EventType_MouseMove)

  Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
EndIf
