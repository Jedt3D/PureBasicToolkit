;
; ------------------------------------------------------------
;
;   PureBasic - Console example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Define text$
Define name$
Define dlay.i
Define i.i, a.i

text$ = "Feel the Power of PureBasic!"
dlay  = 4000

;-------- Open our Console --------

OpenConsole()
ConsoleTitle("PureBasic - Console Example:")
EnableGraphicalConsole(1)

;-------- Ask and display the UserName --------

ConsoleLocate(18, 12)
Print("Please enter your name:   ")
name$ = Input()

ClearConsole()

ConsoleLocate(24, 10)
PrintN("Welcome " + name$)
ConsoleLocate(24, 12)
PrintN(text$)

Delay(dlay)

;-------- Cycle the Text Background Color 0 to 15 --------

ClearConsole()
For i = 0 To 15
  ConsoleColor(0, i)
  ConsoleLocate(24, 4 + i)
  Print(text$)
Next i

Delay(dlay)

;-------- Cycle the Text Foreground Color 0 to 15 --------

ConsoleColor(0, 0)
ClearConsole()
For i = 0 To 15
  ConsoleColor(i, 0)
  ConsoleLocate(24, 4 + i)
  Print(text$)
Next i

Delay(dlay)

;-------- Cycle Background Color 1 to 15 --------

For a = 1 To 15
  ConsoleColor(a, a)
  ClearConsole()
  For i = 0 To 15
    ConsoleColor(i, a)
    ConsoleLocate(24, 4 + i)
    Print(text$)
  Next i
  Delay(dlay / 10)
Next a

;-------- Exit --------

CloseConsole()
End
