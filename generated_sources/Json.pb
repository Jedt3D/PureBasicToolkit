;
; ------------------------------------------------------------
;
;   PureBasic - JSON Creation and Parsing Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

#JSON_Build = 0
#JSON_Read  = 1

Define Person.i
Define Values.i
Define i.i
Define Input.s

; Build JSON data from scratch
If CreateJSON(#JSON_Build)
  Person = SetJSONObject(JSONValue(#JSON_Build))
  SetJSONString(AddJSONMember(Person, "FirstName"), "John")
  SetJSONString(AddJSONMember(Person, "LastName"), "Smith")
  SetJSONInteger(AddJSONMember(Person, "Age"), 42)

  Values = SetJSONArray(AddJSONMember(Person, "Values"))
  For i = 1 To 5
    SetJSONInteger(AddJSONElement(Values), Random(256))
  Next i

  Debug "---------- Compact format ----------"
  Debug ""
  Debug ComposeJSON(#JSON_Build)
  Debug ""
  Debug "---------- Pretty-Printed format ----------"
  Debug ""
  Debug ComposeJSON(#JSON_Build, #PB_JSON_PrettyPrint)
  Debug ""
EndIf


; Parse JSON data from a string
Input = "[1, 3, 5, 7, null, 23, 25, 27]"
If ParseJSON(#JSON_Read, Input)
  NewList Numbers.i()
  ExtractJSONList(JSONValue(#JSON_Read), Numbers())

  Debug "---------- Extracting values ----------"
  Debug ""
  ForEach Numbers()
    Debug Numbers()
  Next
EndIf
