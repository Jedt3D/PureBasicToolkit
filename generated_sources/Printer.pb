; Printer.pb - Generated PureBasic Source
; Demonstrates printing with text, images, and shapes

EnableExplicit

; Show the printer selection dialog
If PrintRequester()

  ; Start a new print job
  If StartPrinting("PureBasic Print Demo")

    ; Load fonts for the printed output
    LoadFont(0, "Arial", 24)
    LoadFont(1, "Arial", 72)

    ; Begin drawing on the printer output
    If StartDrawing(PrinterOutput())

      ; Set colors for printing on white paper
      BackColor(RGB(255, 255, 255))
      FrontColor(RGB(0, 0, 0))

      ; Draw header text with smaller font
      DrawingFont(FontID(0))
      DrawText(100, 80, "PureBasic Printer Demo")
      DrawText(100, 130, "This text is printed at 24pt Arial")

      ; Draw large text
      DrawingFont(FontID(1))
      DrawText(100, 300, "Large Title")

      ; Draw smaller text again
      DrawingFont(FontID(0))
      DrawText(100, 500, "Date: 2025-01-01")
      DrawText(100, 550, "Printed from PureBasic")

      ; Try to load and draw an image
      If LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/PureBasic.bmp")
        DrawImage(ImageID(0), 200, 650)
      EndIf

      ; Draw a red filled box
      Box(200, 900, 120, 80, RGB(255, 0, 0))

      ; Draw a blue filled box
      Box(350, 900, 120, 80, RGB(0, 0, 255))

      StopDrawing()
    EndIf

    StopPrinting()
  EndIf
EndIf

End
