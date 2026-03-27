;
; ------------------------------------------------------------
;
;   PureBasic - Image Plugin Converter Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

; Enable all supported image decoders
UseJPEGImageDecoder()
UseTGAImageDecoder()
UsePNGImageDecoder()
UseTIFFImageDecoder()
UseGIFImageDecoder()

; Enable all supported image encoders
UseJPEGImageEncoder()
UsePNGImageEncoder()

Define Event.i
Define Filename.s
Define ImageFormat.i
Define Extension.s

If OpenWindow(0, 0, 0, 250, 130, "PureBasic - Image Converter", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)

  CreateToolBar(0, WindowID(0))
    ToolBarImageButton(0, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Open.png"))
    ToolBarImageButton(1, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Save.png"))
    DisableToolBarButton(0, 1, 1)

  ImageGadget(0, 0, 28, WindowWidth(0), WindowHeight(0), 0, #PB_Image_Border)

  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Menu

      Select EventMenu()

        Case 0 ; Open
          Filename = OpenFileRequester("Choose a picture", "", "All Images|*.bmp;*.jpg;*.png;*.tif;*.tga;*.gif", 0)
          If Filename
            If UCase(GetExtensionPart(Filename)) = "GIF"
              MessageRequester("About GIF", "See the ImagePlugin_GIF example for animated GIF viewing")
            EndIf

            If LoadImage(0, Filename)
              SetGadgetState(0, ImageID(0))
              DisableToolBarButton(0, 1, 0)
              ResizeWindow(0, #PB_Ignore, #PB_Ignore, DesktopUnscaledX(ImageWidth(0) + 4), DesktopUnscaledY(ImageHeight(0) + 34))
            EndIf
          EndIf

        Case 1 ; Save
          Filename = SaveFileRequester("Save a picture", Left(Filename, Len(Filename) - Len(GetExtensionPart(Filename)) - 1), "BMP Format|*.bmp|JPEG Format|*.jpg|PNG Format|*.png", 0)
          If Filename

            Select SelectedFilePattern()
              Case 0 ; BMP
                ImageFormat = #PB_ImagePlugin_BMP
                Extension = "bmp"
              Case 1 ; JPEG
                ImageFormat = #PB_ImagePlugin_JPEG
                Extension = "jpg"
              Case 2 ; PNG
                ImageFormat = #PB_ImagePlugin_PNG
                Extension = "png"
            EndSelect

            If LCase(GetExtensionPart(Filename)) <> Extension
              Filename + "." + Extension
            EndIf

            If SaveImage(0, Filename, ImageFormat)
              MessageRequester("Information", "Image saved successfully", 0)
            EndIf

          EndIf

      EndSelect

    EndIf

  Until Event = #PB_Event_CloseWindow

EndIf

End
