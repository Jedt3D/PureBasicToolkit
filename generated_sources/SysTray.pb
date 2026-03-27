;
; ------------------------------------------------------------
;
;   PureBasic - SysTray example
;
;    Generated source - demonstrates system tray icon management
;
; ------------------------------------------------------------
;

EnableExplicit

Define Event.i
Define IconPath$

If OpenWindow(0, 100, 150, 300, 100, "PureBasic - SysTray Example", #PB_Window_SystemMenu)

  ; Select icon format based on platform
  ;
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    IconPath$ = #PB_Compiler_Home + "examples/sources/Data/CdPlayer.ico"
  CompilerElse
    UsePNGImageDecoder()
    IconPath$ = #PB_Compiler_Home + "examples/sources/Data/world.png"
  CompilerEndIf

  ; Add two system tray icons
  ;
  AddSysTrayIcon(1, WindowID(0), LoadImage(0, IconPath$))
  AddSysTrayIcon(2, WindowID(0), LoadImage(1, IconPath$))
  SysTrayIconToolTip(1, "Icon 1")
  SysTrayIconToolTip(2, "Icon 2")

  ; Event loop
  ;
  Repeat
    Event = WaitWindowEvent()

    If Event = #PB_Event_SysTray
      ; Handle double-click on tray icons
      ;
      If EventType() = #PB_EventType_LeftDoubleClick
        MessageRequester("SysTray", "Left double-click on SysTrayIcon " + Str(EventGadget()), 0)
        ChangeSysTrayIcon(EventGadget(), LoadImage(0, IconPath$))
        SysTrayIconToolTip(EventGadget(), "Changed!")
      EndIf
    EndIf

  Until Event = #PB_Event_CloseWindow

EndIf
