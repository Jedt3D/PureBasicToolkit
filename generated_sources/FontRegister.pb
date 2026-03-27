;
; ------------------------------------------------------------
;
;   PureBasic - RegisterFontFile Example (Simplified)
;
;    Generated source
;
; ------------------------------------------------------------
;
; NOTE: Simplified version that uses a system font file
; instead of embedding binary font data via DataSection.
;

EnableExplicit

Define fontPath.s
Define i.i
Define itemText.s

; Determine platform-specific system font file path
CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_MacOS
    fontPath = "/System/Library/Fonts/Courier.dfont"
    ; Try alternative paths if needed
    If FileSize(fontPath) < 0
      fontPath = "/System/Library/Fonts/Monaco.dfont"
    EndIf
    If FileSize(fontPath) < 0
      fontPath = "/Library/Fonts/Arial.ttf"
    EndIf
    If FileSize(fontPath) < 0
      fontPath = "/System/Library/Fonts/Supplemental/Courier New.ttf"
    EndIf

  CompilerCase #PB_OS_Windows
    fontPath = "C:\Windows\Fonts\cour.ttf"

  CompilerCase #PB_OS_Linux
    fontPath = "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf"
    If FileSize(fontPath) < 0
      fontPath = "/usr/share/fonts/TTF/DejaVuSansMono.ttf"
    EndIf
CompilerEndSelect

; Open the main window with a ListIconGadget
OpenWindow(0, 0, 0, 920, 670, "Font Character Map", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
ListIconGadget(0, 0, 0, 920, 670, "0..31", 110, #PB_ListIcon_GridLines)

AddGadgetColumn(0, 1, "32..63", 110)
AddGadgetColumn(0, 2, "64..95", 110)
AddGadgetColumn(0, 3, "96..127", 110)
AddGadgetColumn(0, 4, "128..159", 110)
AddGadgetColumn(0, 5, "160..191", 110)
AddGadgetColumn(0, 6, "192..223", 110)
AddGadgetColumn(0, 7, "224..255", 110)

; Check if the font file exists and try to register it
If FileSize(fontPath) >= 0
  If RegisterFontFile(fontPath)
    Debug "Font registered successfully from: " + fontPath
  Else
    Debug "RegisterFontFile failed for: " + fontPath
  EndIf
Else
  Debug "Font file not found: " + fontPath
EndIf

; Load a monospace font for the gadget display
LoadFont(0, "Courier", 12)
SetGadgetFont(0, FontID(0))

; Populate the character map grid
For i = 0 To 31
  ; Build the row text with columns separated by Chr(10)
  ; Column 0: chars 0-31 (control chars shown as space)
  itemText = Str(i) + " " + Chr(32)
  ; Column 1: chars 32-63
  itemText + Chr(10) + Str(i + 32) + " " + Chr(i + 32)
  ; Column 2: chars 64-95
  itemText + Chr(10) + Str(i + 64) + " " + Chr(i + 64)
  ; Column 3: chars 96-127
  itemText + Chr(10) + Str(i + 96) + " " + Chr(i + 96)
  ; Column 4: chars 128-159
  itemText + Chr(10) + Str(i + 128) + " " + Chr(i + 128)
  ; Column 5: chars 160-191
  itemText + Chr(10) + Str(i + 160) + " " + Chr(i + 160)
  ; Column 6: chars 192-223
  itemText + Chr(10) + Str(i + 192) + " " + Chr(i + 192)
  ; Column 7: chars 224-255
  itemText + Chr(10) + Str(i + 224) + " " + Chr(i + 224)

  AddGadgetItem(0, -1, itemText)
Next i

Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
