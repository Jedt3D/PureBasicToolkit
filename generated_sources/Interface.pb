;
; ------------------------------------------------------------
;
;   PureBasic - Interface / OOP Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

;- =================================
;- Example 1: Simple Foo Object
;- =================================
Debug "***************************"
Debug "*        Example 1        *"
Debug "***************************"

Structure FooData
  *vt
  intFoo.i
EndStructure

; Methods for FooData
Procedure FooData_SetValue(*this.FooData, value.i)
  *this\intFoo = value
EndProcedure

Procedure FooData_GetValue(*this.FooData)
  ProcedureReturn *this\intFoo
EndProcedure

Procedure FooData_Free(*this.FooData)
  FreeMemory(*this)
EndProcedure

; Interface definition
Interface IFoo
  Get()
  Set(value.i)
  Free()
EndInterface

; Virtual table
DataSection
  vtFooData:
  Data.i @FooData_GetValue()
  Data.i @FooData_SetValue()
  Data.i @FooData_Free()
EndDataSection

; Constructor
Procedure NewFoo()
  Protected *obj.FooData
  *obj = AllocateMemory(SizeOf(FooData))
  If *obj
    *obj\vt = ?vtFooData
    ProcedureReturn *obj
  EndIf
EndProcedure

; Usage of Example 1
Global *myFoo.IFoo = NewFoo()

If *myFoo
  *myFoo\Set(123)
  Debug *myFoo\Get()
  *myFoo\Free()
EndIf
Debug ""


;- =================================
;- Example 2: Rectangle Object
;- =================================
Debug "***************************"
Debug "*        Example 2        *"
Debug "***************************"

Interface INewRectangle
  Perimeter.i()
  Surface.i()
  SetLength.i(Valeur.i)
  SetWidth.i(Valeur.i)
  Destroy.i()
EndInterface

Structure RectangleData
  *DSVT
  RLength.i
  RWidth.i
EndStructure

; Constructor
Procedure.i RectangleInit(initLength.i = 0, initWidth.i = 0)
  Protected *obj.RectangleData

  *obj = AllocateMemory(SizeOf(RectangleData))

  If *obj
    *obj\DSVT = ?RectClass
    *obj\RLength = initLength
    *obj\RWidth = initWidth
  EndIf

  ProcedureReturn *obj
EndProcedure

; Methods
Procedure RectPerimeter(*this.RectangleData)
  ProcedureReturn (*this\RLength + *this\RWidth) * 2
EndProcedure

Procedure RectSurface(*this.RectangleData)
  ProcedureReturn *this\RLength * *this\RWidth
EndProcedure

Procedure RectSetLength(*this.RectangleData, Valeur.i)
  *this\RLength = Valeur
EndProcedure

Procedure RectSetWidth(*this.RectangleData, Valeur.i)
  *this\RWidth = Valeur
EndProcedure

Procedure RectDestroy(*this.RectangleData)
  FreeMemory(*this)
EndProcedure

DataSection
  RectClass:
  Data.i @RectPerimeter()
  Data.i @RectSurface()
  Data.i @RectSetLength()
  Data.i @RectSetWidth()
  Data.i @RectDestroy()
EndDataSection

; Usage of Example 2
Define MyRect.INewRectangle

MyRect = RectangleInit(20, 10)

Debug "Perimeter is  " + Str(MyRect\Perimeter())
Debug "Surface is  " + Str(MyRect\Surface())

Debug ""

; Modify dimensions
MyRect\SetLength(40)
MyRect\SetWidth(20)
Debug "Perimeter is  " + Str(MyRect\Perimeter())
Debug "Surface is  " + Str(MyRect\Surface())

MyRect\Destroy()
Debug ""
