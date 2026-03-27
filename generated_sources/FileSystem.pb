;
; ------------------------------------------------------------
;
;   PureBasic - FileSystem Browser Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define Event.i
Define FileName.s

If OpenWindow(0, 100, 200, 300, 210, "PureBasic - FileSystem Example")

  StringGadget  (0,  10, 10, 210, 24, GetHomeDirectory())
  ButtonGadget  (1, 225, 10, 65,  24, "List")
  ListViewGadget(2,  10, 40, 280, 160)

  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_Gadget
      If EventGadget() = 1

        ClearGadgetItems(2)

        If ExamineDirectory(0, GetGadgetText(0), "*.*")

          While NextDirectoryEntry(0)
            FileName = DirectoryEntryName(0)

            If DirectoryEntryType(0) = #PB_DirectoryEntry_Directory
              FileName = "[DIR] " + FileName
            EndIf

            AddGadgetItem(2, -1, FileName)
          Wend

          FinishDirectory(0)
        Else
          MessageRequester("Error", "Can't examine this directory: " + GetGadgetText(0), 0)
        EndIf

      EndIf
    EndIf

  Until Event = #PB_Event_CloseWindow

EndIf

End
