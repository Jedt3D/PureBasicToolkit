;
; ------------------------------------------------------------
;
;   PureBasic - Date example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Define CurrentDate$
Define CurrentTime$

CurrentDate$ = FormatDate("%yyyy/%mm/%dd", Date())
CurrentTime$ = FormatDate("%hh:%ii:%ss", Date())

MessageRequester("PureBasic - Date Example", "Date: " + CurrentDate$ + Chr(10) + "Time: " + CurrentTime$, 0)
