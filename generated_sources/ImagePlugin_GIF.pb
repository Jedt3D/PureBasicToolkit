;
; ------------------------------------------------------------
;
;   PureBasic - Animated GIF Viewer Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

; Enable the GIF decoder
UseGIFImageDecoder()

Define Event.i
Define Frame.i

; Load a GIF file from PureBasic examples
If LoadImage(0, #PB_Compiler_Home + "Examples/Sources/Data/PureBasicLogo.gif")

  OpenWindow(0, 100, 100, DesktopUnscaledX(ImageWidth(0)), DesktopUnscaledY(ImageHeight(0)), "GIF Viewer")

  CanvasGadget(0, 0, 0, ImageWidth(0), ImageHeight(0))

  ; Start a timer immediately to display the first frame
  AddWindowTimer(0, 0, 1)

  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Timer
      SetImageFrame(0, Frame)

      ; Update timer with this frame's specific delay
      RemoveWindowTimer(0, 0)
      AddWindowTimer(0, 0, GetImageFrameDelay(0))

      If StartDrawing(CanvasOutput(0))
        DrawImage(ImageID(0), 0, 0)
        StopDrawing()
      EndIf

      ; Advance to next frame, loop back to start
      Frame + 1
      If Frame >= ImageFrameCount(0)
        Frame = 0
      EndIf
    EndIf

  Until Event = #PB_Event_CloseWindow
Else
  Debug "Unable to load the GIF file"
EndIf
