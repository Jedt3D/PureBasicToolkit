;
; ------------------------------------------------------------
;
;   PureBasic - Desktop example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Define NbDesktops.i
Define k.i
Define Text$

NbDesktops = ExamineDesktops()

MessageRequester("Information", "You have " + Str(NbDesktops) + " desktop(s)")

; Enumerate all desktops
;
For k = 0 To NbDesktops - 1

  Text$ = "Desktop " + Str(k + 1) + #LF$ + #LF$
  Text$ + "Size: " + Str(DesktopWidth(k)) + "*" + Str(DesktopHeight(k)) + #LF$
  Text$ + "Color depth: " + Str(DesktopDepth(k)) + #LF$

  If DesktopFrequency(k) = 0
    Text$ + "Frequency: Default" + #LF$ + #LF$
  Else
    Text$ + "Frequency: " + Str(DesktopFrequency(k)) + " Hz" + #LF$ + #LF$
  EndIf

  Text$ + "Name: " + DesktopName(k)

  MessageRequester("Information", Text$)

Next
