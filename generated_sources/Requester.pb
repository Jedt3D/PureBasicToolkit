; Requester.pb - Generated PureBasic Source
; Demonstrates various requester dialogs: File, Save, Path, Color, Font, Message

EnableExplicit

Define Event.l
Define Quit.l
Define File$
Define Path$
Define Colour.l

If OpenWindow(0, 100, 200, 320, 250, "Requester Demo")

  ; Create menu with test items for each requester type
  If CreateMenu(0, WindowID(0))
    MenuTitle("Requesters")
      MenuItem(0, "Open File...")
      MenuItem(1, "Save File...")
      MenuItem(2, "Select Path...")
      MenuBar()
      MenuItem(3, "Choose Color...")
      MenuItem(4, "Choose Font...")
      MenuBar()
      MenuItem(5, "Show Message")
      MenuBar()
      MenuItem(6, "Quit")
  EndIf

  ; Event loop
  Repeat
    Event = WaitWindowEvent()

    Select Event

      Case #PB_Event_Menu
        Select EventMenu()

          Case 0 ; Open File Requester
            File$ = OpenFileRequester("Open a File", "", "Text Files (*.txt)|*.txt|PureBasic Files (*.pb)|*.pb|All Files|*.*", 0)
            If File$
              MessageRequester("Open File", "Selected file: " + File$, 0)
            EndIf

          Case 1 ; Save File Requester
            File$ = SaveFileRequester("Save a File", "untitled.txt", "Text Files (*.txt)|*.txt|All Files|*.*", 0)
            If File$
              MessageRequester("Save File", "Save to: " + File$, 0)
            EndIf

          Case 2 ; Path Requester
            Path$ = PathRequester("Select a Directory", GetHomeDirectory())
            If Path$
              MessageRequester("Selected Path", "Directory: " + Path$, 0)
            EndIf

          Case 3 ; Color Requester
            Colour = ColorRequester()
            If Colour > -1
              MessageRequester("Color Chosen",
                               "Red:   " + Str(Red(Colour)) + Chr(10) +
                               "Green: " + Str(Green(Colour)) + Chr(10) +
                               "Blue:  " + Str(Blue(Colour)), 0)
            EndIf

          Case 4 ; Font Requester
            If FontRequester("Arial", 12, 0)
              MessageRequester("Font Chosen",
                               "Font: " + SelectedFontName() + Chr(10) +
                               "Size: " + Str(SelectedFontSize()), 0)
            EndIf

          Case 5 ; Message Requester
            MessageRequester("Information",
                             "This is a message requester demo." + Chr(13) +
                             "Line 2 of the message." + Chr(13) +
                             "Line 3 of the message.", 0)

          Case 6 ; Quit
            Quit = 1

        EndSelect

      Case #PB_Event_CloseWindow
        Quit = 1

    EndSelect

  Until Quit = 1

EndIf

End
