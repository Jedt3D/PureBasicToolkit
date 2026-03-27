; PopupMenu.pb - Generated PureBasic Source
; Demonstrates right-click context (popup) menus on gadgets

EnableExplicit

Define Quit.l
Define Event.l

; Create the popup menu before the window
If CreatePopupMenu(0)
  MenuItem(1, "Cut")
  MenuItem(2, "Copy")
  MenuItem(3, "Paste")
  MenuBar()
  OpenSubMenu("Settings")
    MenuItem(4, "Preferences...")
    MenuItem(5, "Advanced...")
  CloseSubMenu()
  MenuBar()
  MenuItem(6, "Quit")
EndIf

; Open a window with a list gadget
If OpenWindow(0, 100, 100, 350, 300, "PopupMenu Demo")

  ; Create a ListIconGadget with some items
  ListIconGadget(0, 10, 10, 330, 280, "Item Name", 200)
    AddGadgetItem(0, -1, "First Item")
    AddGadgetItem(0, -1, "Second Item")
    AddGadgetItem(0, -1, "Third Item")
    AddGadgetItem(0, -1, "Fourth Item")

  ; Event loop
  Repeat
    Event = WaitWindowEvent()

    Select Event

      Case #PB_Event_Gadget
        ; Check if the list gadget was right-clicked
        If EventGadget() = 0 And EventType() = #PB_EventType_RightClick
          DisplayPopupMenu(0, WindowID(0))
        EndIf

      Case #PB_Event_Menu
        Select EventMenu()

          Case 1
            MessageRequester("Popup", "Cut action performed", 0)

          Case 2
            MessageRequester("Popup", "Copy action performed", 0)

          Case 3
            MessageRequester("Popup", "Paste action performed", 0)

          Case 4
            MessageRequester("Popup", "Preferences dialog", 0)

          Case 5
            MessageRequester("Popup", "Advanced settings dialog", 0)

          Case 6
            Quit = 1

        EndSelect

      Case #PB_Event_CloseWindow
        Quit = 1

    EndSelect

  Until Quit = 1

EndIf

End
