; PureBasic Example: Console Application
; Demonstrates console I/O, arrays, and procedures
; If you run this from the PureBasic IDE, set:
; Compiler > Compiler Options > Executable Format = Console

EnableExplicit

; Procedure to calculate factorial
Procedure.q Factorial(n.q)
  Protected result.q = 1, i.q
  
  For i = 2 To n
    result * i
  Next i
  
  ProcedureReturn result
EndProcedure

; Procedure to display array
Procedure DisplayArray(Array arr.q(1))
  Protected i.i
  
  Print("Array contents: [")
  For i = 0 To ArraySize(arr())
    Print(Str(arr(i)))
    If i < ArraySize(arr())
      Print(", ")
    EndIf
  Next i
  PrintN("]")
EndProcedure

; Main procedure
Procedure Main()
  Protected i.i, n.i = 10
  Protected Dim numbers.q(n)
  Protected sum.q = 0
  
  If Not OpenConsole()
    End
  EndIf
  
  PrintN("PureBasic Console Example")
  PrintN("==========================")
  PrintN("")
  
  ; Fill array with random numbers
  PrintN("Generating " + Str(n + 1) + " random numbers...")
  RandomSeed(Date())
  
  For i = 0 To n
    numbers(i) = Random(100)
  Next i
  
  ; Display array
  DisplayArray(numbers())
  
  ; Calculate sum and average
  For i = 0 To n
    sum + numbers(i)
  Next i
  
  PrintN("")
  PrintN("Sum: " + Str(sum))
  PrintN("Average: " + StrF(sum / (n + 1), 2))
  
  ; Find min and max
  Protected min.q = numbers(0), max.q = numbers(0)
  
  For i = 1 To n
    If numbers(i) < min
      min = numbers(i)
    EndIf
    If numbers(i) > max
      max = numbers(i)
    EndIf
  Next i
  
  PrintN("Min: " + Str(min))
  PrintN("Max: " + Str(max))
  
  ; Demonstrate factorial
  PrintN("")
  PrintN("Factorials:")
  For i = 0 To 10
    PrintN(Str(i) + "! = " + Str(Factorial(i)))
  Next i
  
  ; User input
  PrintN("")
  Print("Enter your name: ")
  Define name.s = Input()
  
  PrintN("")
  PrintN("Hello, " + name + "!")
  PrintN("Press Enter to exit...")
  Input()
  CloseConsole()
EndProcedure

Main()

; IDE Options = PureBasic 6.30 - C Backend (MacOS X - arm64)
; ExecutableFormat = Console
; Folding = -
; EnableXP
; DPIAware
