;
; ------------------------------------------------------------
;
;   PureBasic - Sort (Numerical) example
;
;    Generated source - demonstrates numeric array sorting
;
; ------------------------------------------------------------
;

EnableExplicit

; Number of elements in the array
;
#NbElements = 20

Define k.i

Dim NumberArray.b(#NbElements)

; Fill the array with random values
;
For k = 0 To #NbElements
  NumberArray(k) = Random(10000)
Next

; Display the unsorted array
;
Debug "--- Before sorting ---"
For k = 0 To #NbElements
  Debug NumberArray(k)
Next

; Sort the entire array in ascending order
;
SortArray(NumberArray(), #PB_Sort_Ascending)

Debug "--- After sorting ---"

; Display the sorted array
;
For k = 0 To #NbElements
  Debug NumberArray(k)
Next

MessageRequester("Sort Example", "Numeric sort completed.")
