;
; ------------------------------------------------------------
;
;   PureBasic - Sort (String) example
;
;    Generated source - demonstrates string array sorting
;
; ------------------------------------------------------------
;

EnableExplicit

; Number of elements (0 to 8 = 9 strings total)
;
#NbElements = 8

Define k.i

Dim TextArray.s(#NbElements)

; Read strings from the DataSection
;
For k = 0 To #NbElements
  Read.s TextArray(k)
Next

; Display the unsorted strings
;
Debug "--- Before sorting ---"
For k = 0 To #NbElements
  Debug TextArray(k)
Next

; Sort the array ascending, case-insensitive
;
SortArray(TextArray(), #PB_Sort_Ascending | #PB_Sort_NoCase)

Debug "--- After sorting ---"

; Display the sorted strings
;
For k = 0 To #NbElements
  Debug TextArray(k)
Next

MessageRequester("Information", "String sort completed!", 0)

End


DataSection
  Data.s "Hello", "This", "is", "a", "Nice", "test", "Isn't", "it ?", "Haha !"
EndDataSection
