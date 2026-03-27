;
; ------------------------------------------------------------
;
;   PureBasic - ToolBar example
;
;    Generated source - demonstrates toolbar with image buttons
;
; ------------------------------------------------------------
;

EnableExplicit

UsePNGImageDecoder()

Define Event.i
Define Quit.i

If OpenWindow(0, 100, 200, 195, 260, "ToolBar Example", #PB_Window_SystemMenu | #PB_Window_SizeGadget)

  ; Create the toolbar with image buttons
  ;
  If CreateToolBar(0, WindowID(0))
    ToolBarImageButton(0, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/New.png"))
    ToolBarImageButton(1, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Open.png"))
    ToolBarImageButton(2, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Save.png"))

    ToolBarSeparator()

    ToolBarImageButton(3, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Cut.png"))
    ToolBarToolTip(0, 3, "Cut")

    ToolBarImageButton(4, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Copy.png"))
    ToolBarToolTip(0, 4, "Copy")

    ToolBarImageButton(5, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Paste.png"))
    ToolBarToolTip(0, 5, "Paste")

    ToolBarSeparator()

    ToolBarImageButton(6, LoadImage(0, #PB_Compiler_Home + "examples/sources/Data/ToolBar/Find.png"))
    ToolBarToolTip(0, 6, "Find a document")
  EndIf

  ; Create a menu with items that share IDs with toolbar buttons
  ;
  If CreateMenu(0, WindowID(0))
    MenuTitle("Project")
      MenuItem(0, "New")
      MenuItem(1, "Open")
      MenuItem(2, "Save")
  EndIf

  ; Disable the Save button
  ;
  DisableToolBarButton(0, 2, 1)

  ; Event loop - toolbar clicks generate #PB_Event_Menu events
  ;
  Repeat
    Event = WaitWindowEvent()

    Select Event
      Case #PB_Event_Menu
        MessageRequester("Information", "ToolBar or Menu ID: " + Str(EventMenu()), 0)

      Case #PB_Event_CloseWindow
        Quit = 1
    EndSelect

  Until Quit = 1

EndIf

End
