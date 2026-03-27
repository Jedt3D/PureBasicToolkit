;
; ------------------------------------------------------------
;
;   PureBasic - Array example file
;
;    (c) Generated PureBasic Example
;
; ------------------------------------------------------------
;

EnableExplicit

Structure BasicStructure
  Field1.b
  Field2.w
  Field3.l
EndStructure

Structure ComplexStructure
  Field.b
  Basic.BasicStructure
EndStructure

Define k.i, x.i, y.i, z.i

Dim BasicArray.l(100)                                  ; 101 elements from 0 to 100

Dim StructuredArray.BasicStructure(10)                 ; 11 elements of BasicStructure

Dim StructuredMultiArray.ComplexStructure(10, 20, 10)  ; 11*21*11 elements

; Fill the basic array
;
For k = 0 To 100
  BasicArray(k) = k
Next

; Fill the structured array
;
For k = 0 To 10
  StructuredArray(k)\Field1 = k
  StructuredArray(k)\Field2 = k + 1
  StructuredArray(k)\Field3 = k + 2
Next

; Fill the multi-dimensional structured array
;
For x = 0 To 10
  For y = 0 To 20
    For z = 0 To 10
      StructuredMultiArray(x, y, z)\Field = x
      StructuredMultiArray(x, y, z)\Basic\Field2 = y + 1
      StructuredMultiArray(x, y, z)\Basic\Field3 = z + 2
    Next
  Next
Next

; Copy the array into a new array
;
Dim BasicArrayCopy.l(1)
CopyArray(BasicArray(), BasicArrayCopy())

Debug "Copied array size: " + ArraySize(BasicArrayCopy())

End
