; Prototype.pb - Generated PureBasic Source
; Demonstrates Prototype for function pointers in structures and as parameters

EnableExplicit

; ======================================
; Pattern 1: Prototype used in a Structure (OOP-like method dispatch)
; ======================================

; Define a prototype for a function that takes two doubles and returns a double
Prototype.d MathOperation(x.d, y.d)

; Structure with a method pointer field
Structure Calculator
  Compute.MathOperation
EndStructure

; Actual implementation of the add operation
Procedure.d AddValues(x.d, y.d)
  ProcedureReturn x + y
EndProcedure

; Actual implementation of the multiply operation
Procedure.d MultiplyValues(x.d, y.d)
  ProcedureReturn x * y
EndProcedure

; Factory procedure to create a Calculator with the add method
Procedure.i CreateCalculator(UseMultiply.l)
  Protected *calc.Calculator
  *calc = AllocateStructure(Calculator)
  If UseMultiply
    *calc\Compute = @MultiplyValues()
  Else
    *calc\Compute = @AddValues()
  EndIf
  ProcedureReturn *calc
EndProcedure

; Test pattern 1
Debug "=== Pattern 1: Prototype in Structure ==="
Define *adder.Calculator
Define *multiplier.Calculator

*adder = CreateCalculator(#False)
*multiplier = CreateCalculator(#True)

Debug "Adder:      25 + 75 = " + StrD(*adder\Compute(25, 75))
Debug "Multiplier: 6 * 7  = " + StrD(*multiplier\Compute(6, 7))

FreeStructure(*adder)
FreeStructure(*multiplier)

Debug ""

; ======================================
; Pattern 2: Prototype as procedure parameter (callbacks)
; ======================================

; Define a prototype for a string-returning function
Prototype.s StringProducer()

Procedure.s ProduceGreeting()
  ProcedureReturn "Hello from the greeting producer"
EndProcedure

Procedure.s ProduceFarewell()
  ProcedureReturn "Goodbye from the farewell producer"
EndProcedure

; Runner procedure that accepts any function matching the prototype
Procedure ExecuteProducer(Producer.StringProducer)
  Debug "  Result: " + Producer()
EndProcedure

Debug "=== Pattern 2: Prototype as Parameter ==="
Debug "Calling greeting producer:"
ExecuteProducer(@ProduceGreeting())
Debug "Calling farewell producer:"
ExecuteProducer(@ProduceFarewell())
Debug ""

; ======================================
; Pattern 3: Legacy function pointer calling
; ======================================

Procedure.s LegacyFunction()
  ProcedureReturn "Legacy function pointer call succeeded"
EndProcedure

Procedure RunLegacy(FuncPtr.i)
  Debug "  " + PeekS(CallFunctionFast(FuncPtr))
EndProcedure

Debug "=== Pattern 3: Legacy CallFunctionFast ==="
RunLegacy(@LegacyFunction())

End
