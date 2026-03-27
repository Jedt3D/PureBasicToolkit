;
; ------------------------------------------------------------
;
;   PureBasic - Font Drawing Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define Event.i

LoadFont(0, "Courier", 15)
LoadFont(1, "Arial", 24)

If OpenWindow(0, 100, 200, 460, 148, "Font Test") = 0
  MessageRequester("Error", "Can't open Window", 0)
  End
EndIf

If CreateImage(0, DesktopScaledX(450), DesktopScaledY(130))

  If StartDrawing(ImageOutput(0))
    Box(0, 0, ImageWidth(0), ImageHeight(0), RGB(255, 255, 255))

    DrawingMode(#PB_2DDrawing_Transparent)

    DrawingFont(FontID(0))
    DrawText(10, 10, "Font: Courier - Size: 15 - Red", RGB(255, 0, 0))

    DrawingFont(FontID(1))
    DrawText(10, 40, "Font: Arial - Size: 24", RGB(0, 0, 0))

    StopDrawing()
  EndIf

EndIf

ImageGadget(0, 5, 10, ImageWidth(0), ImageHeight(0), ImageID(0))

Repeat
  Event = WaitWindowEvent()
Until Event = #PB_Event_CloseWindow

End
