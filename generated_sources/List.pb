;
; ------------------------------------------------------------
;
;   PureBasic - Linked List Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

; Define structures
Structure BasicStruct
  Field1.i
  Field2.w
  Field3.l
EndStructure

Structure ComplexStruct
  Field1.i
 *Basic.BasicStruct
  Basic2.BasicStruct
 *Next.ComplexStruct
EndStructure

; Create linked lists
NewList SimpleList.BasicStruct()
NewList ComplexList.ComplexStruct()

;-------- Simple list operations --------

AddElement(SimpleList())
SimpleList()\Field2 = 1

AddElement(SimpleList())
SimpleList()\Field2 = 2

AddElement(SimpleList())
SimpleList()\Field2 = 3

AddElement(SimpleList())
SimpleList()\Field2 = 4

Debug "============================================="
Debug " Simple Structure"
Debug "................."
Debug ""

Debug "Number of elements in the list: " + Str(ListSize(SimpleList()))

; First iteration method: ResetList + NextElement
ResetList(SimpleList())

While NextElement(SimpleList())
  Debug "ResetList() - 'Field2' value: " + Str(SimpleList()\Field2)
Wend

; Second iteration method: ForEach
ForEach SimpleList()
  Debug "ForEach() - 'Field2' value: " + Str(SimpleList()\Field2)
Next

; Direct element access
SelectElement(SimpleList(), 2)
Debug "3rd Element - 'Field2' value: " + Str(SimpleList()\Field2)

Debug ""

;-------- Complex structure operations --------

AddElement(ComplexList())
ComplexList()\Field1 = 11

; Set up pointer-based sub-structure
ComplexList()\Basic = AllocateStructure(BasicStruct)
ComplexList()\Basic\Field1 = 111
ComplexList()\Basic\Field2 = 222
ComplexList()\Basic\Field3 = 333

; Set up embedded sub-structure
ComplexList()\Basic2\Field1 = 1111
ComplexList()\Basic2\Field2 = 2222
ComplexList()\Basic2\Field3 = 3333

; Create a chain via Next pointer
ComplexList()\Next = AllocateStructure(ComplexStruct)
ComplexList()\Next\Field1 = 7
ComplexList()\Next\Basic = AllocateStructure(BasicStruct)
ComplexList()\Next\Basic\Field1 = 77
ComplexList()\Next\Basic\Field2 = 88
ComplexList()\Next\Basic\Field3 = 99
ComplexList()\Next\Basic2\Field1 = 777
ComplexList()\Next\Basic2\Field2 = 888
ComplexList()\Next\Basic2\Field3 = 999
ComplexList()\Next\Next = AllocateStructure(ComplexStruct)
ComplexList()\Next\Next\Field1 = 9999

; Debug nested structure values
Debug "============================================="
Debug " Complex Structure"
Debug ".................."
Debug "ComplexList()\Field1 = " + Str(ComplexList()\Field1)
Debug "ComplexList()\Basic\Field2 = " + Str(ComplexList()\Basic\Field2) + " (pointer-based, no * in access)"
Debug "ComplexList()\Basic2\Field3 = " + Str(ComplexList()\Basic2\Field3)
Debug "ComplexList()\Next\Field1 = " + Str(ComplexList()\Next\Field1) + " (pointer chain)"
Debug "ComplexList()\Next\Basic\Field1 = " + Str(ComplexList()\Next\Basic\Field1) + " (pointer chain)"
Debug "ComplexList()\Next\Basic2\Field1 = " + Str(ComplexList()\Next\Basic2\Field1) + " (pointer chain)"
Debug "ComplexList()\Next\Next\Field1 = " + Str(ComplexList()\Next\Next\Field1) + " (double pointer chain)"

End
