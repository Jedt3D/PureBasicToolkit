; Menu.pb - Generated PureBasic Source
; Demonstrates window menu bar creation and event handling

EnableExplicit

Define Quit.l
Define Event.l

If OpenWindow(0, 100, 150, 300, 200, "PureBasic - Menu Demo")

  ; Create the menu bar
  If CreateMenu(0, WindowID(0))
    ; File menu
    MenuTitle("File")
      MenuItem(1, "&New")
      MenuItem(2, "&Open...")
      MenuItem(3, "&Save")
      MenuItem(4, "Save &As...")
      MenuBar()
      OpenSubMenu("Recent Files")
        MenuItem(10, "document1.txt")
        MenuItem(11, "document2.txt")
        OpenSubMenu("Older Files")
          MenuItem(12, "archive.zip")
          MenuItem(13, "backup.dat")
        CloseSubMenu()
      CloseSubMenu()
      MenuBar()
      MenuItem(5, "&Quit")

    ; Edit menu
    MenuTitle("Edit")
      MenuItem(6, "Cu&t")
      MenuItem(7, "&Copy")
      MenuItem(8, "&Paste")
      MenuBar()
      MenuItem(9, "Select &All")

    ; View menu with checkable items
    MenuTitle("View")
      MenuItem(14, "Show Toolbar")
      MenuItem(15, "Show Status Bar")

    ; Help menu
    MenuTitle("Help")
      MenuItem(16, "&About...")
  EndIf

  ; Disable "Save As..." initially
  DisableMenuItem(0, 4, 1)

  ; Set initial check states
  SetMenuItemState(0, 14, 1)  ; Toolbar checked
  SetMenuItemState(0, 15, 0)  ; Status bar unchecked

  ; Event loop
  Repeat
    Event = WaitWindowEvent()

    Select Event

      Case #PB_Event_Menu
        Select EventMenu()

          Case 1 ; New
            MessageRequester("Menu", "New document", 0)

          Case 2 ; Open
            MessageRequester("Menu", "Open file dialog", 0)

          Case 3 ; Save
            MessageRequester("Menu", "File saved", 0)

          Case 5 ; Quit
            Quit = 1

          Case 6 ; Cut
            MessageRequester("Menu", "Cut selected", 0)

          Case 7 ; Copy
            MessageRequester("Menu", "Copy selected", 0)

          Case 8 ; Paste
            MessageRequester("Menu", "Paste from clipboard", 0)

          Case 14 ; Toggle Toolbar
            If GetMenuItemState(0, 14) = 1
              SetMenuItemState(0, 14, 0)
              MessageRequester("View", "Toolbar hidden", 0)
            Else
              SetMenuItemState(0, 14, 1)
              MessageRequester("View", "Toolbar visible", 0)
            EndIf

          Case 15 ; Toggle Status Bar
            If GetMenuItemState(0, 15) = 1
              SetMenuItemState(0, 15, 0)
              MessageRequester("View", "Status bar hidden", 0)
            Else
              SetMenuItemState(0, 15, 1)
              MessageRequester("View", "Status bar visible", 0)
            EndIf

          Case 16 ; About
            MessageRequester("About", "Menu Demo Application" + Chr(10) + "PureBasic Example", 0)

          Default
            MessageRequester("Menu", "Selected menu item: " + Str(EventMenu()), 0)

        EndSelect

      Case #PB_Event_CloseWindow
        Quit = 1

    EndSelect

  Until Quit = 1

EndIf

End
