; Map.pb - Generated PureBasic Source
; Demonstrates Map (dictionary) data structure operations

EnableExplicit

; Define a structure to store in the map
Structure ItemData
  ID.l
  Value.w
  Flag.b
EndStructure

; Create a map using the structure
NewMap Items.ItemData()

; Add elements using string keys
Items("alpha")\ID = 100
Items("alpha")\Value = 10
Items("alpha")\Flag = 1

Items("beta")\ID = 200
Items("beta")\Value = 20
Items("beta")\Flag = 0

Items("gamma")\ID = 300
Items("gamma")\Value = 30
Items("gamma")\Flag = 1

Items("delta")\ID = 400
Items("delta")\Value = 40
Items("delta")\Flag = 0

Items("epsilon")\ID = 500
Items("epsilon")\Value = 50
Items("epsilon")\Flag = 1

; Display total number of elements
Debug "Total elements in map: " + Str(MapSize(Items()))

; Method 1: Iterate using ResetMap and NextMapElement
Debug ""
Debug "--- Iteration with ResetMap/NextMapElement ---"
ResetMap(Items())
While NextMapElement(Items())
  Debug "Key: " + MapKey(Items()) + " -> ID=" + Str(Items()\ID) + ", Value=" + Str(Items()\Value)
Wend

; Method 2: Iterate using ForEach
Debug ""
Debug "--- Iteration with ForEach ---"
ForEach Items()
  Debug "Key: " + MapKey(Items()) + " -> ID=" + Str(Items()\ID) + ", Flag=" + Str(Items()\Flag)
Next

; Method 3: Find a specific element by key
Debug ""
Debug "--- Direct element lookup ---"
If FindMapElement(Items(), "gamma")
  Debug "Found 'gamma': ID=" + Str(Items()\ID) + ", Value=" + Str(Items()\Value)
Else
  Debug "Element 'gamma' not found"
EndIf

; Check if an element exists
If FindMapElement(Items(), "omega")
  Debug "Found 'omega'"
Else
  Debug "'omega' does not exist in the map"
EndIf

; Delete an element
DeleteMapElement(Items(), "beta")
Debug ""
Debug "After deleting 'beta', map size: " + Str(MapSize(Items()))

; Clear the entire map
ClearMap(Items())
Debug "After ClearMap, map size: " + Str(MapSize(Items()))

End
