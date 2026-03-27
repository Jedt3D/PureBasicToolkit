; RegularExpression.pb - Generated PureBasic Source
; Demonstrates regular expression pattern matching and extraction

EnableExplicit

Define NbMatches.l
Define i.l

; Pattern: match words that contain digits (one or more digits in sequence)
Debug "=== Test 1: Extract digit sequences ==="
If CreateRegularExpression(0, "\d+")

  Dim DigitResult$(0)

  NbMatches = ExtractRegularExpression(0, "Order 42 has 3 items weighing 15kg total", DigitResult$())

  Debug "Number of digit matches: " + Str(NbMatches)
  For i = 0 To NbMatches - 1
    Debug "  Match " + Str(i) + ": " + DigitResult$(i)
  Next

  FreeRegularExpression(0)
Else
  MessageRequester("Error", "Regex error: " + RegularExpressionError())
EndIf

Debug ""

; Pattern: match email-like patterns
Debug "=== Test 2: Extract 3-letter words with 'b' in middle ==="
If CreateRegularExpression(1, "[a-z]b[a-z]")

  Dim WordResult$(0)

  NbMatches = ExtractRegularExpression(1, "abc it won't match abz but obs will", WordResult$())

  Debug "Number of matches: " + Str(NbMatches)
  For i = 0 To NbMatches - 1
    Debug "  Match " + Str(i) + ": " + WordResult$(i)
  Next

  FreeRegularExpression(1)
Else
  MessageRequester("Error", "Regex error: " + RegularExpressionError())
EndIf

Debug ""

; Pattern: match words starting with uppercase
Debug "=== Test 3: Match capitalized words ==="
If CreateRegularExpression(2, "\b[A-Z][a-z]+\b")

  Dim CapResult$(0)

  NbMatches = ExtractRegularExpression(2, "The Quick Brown Fox Jumps Over The Lazy Dog", CapResult$())

  Debug "Capitalized words found: " + Str(NbMatches)
  For i = 0 To NbMatches - 1
    Debug "  " + CapResult$(i)
  Next

  FreeRegularExpression(2)
Else
  MessageRequester("Error", "Regex error: " + RegularExpressionError())
EndIf

Debug ""

; Test regex error handling with invalid pattern
Debug "=== Test 4: Invalid regex pattern ==="
If CreateRegularExpression(3, "[invalid")
  Debug "This should not appear - pattern is invalid"
  FreeRegularExpression(3)
Else
  Debug "Expected error caught: " + RegularExpressionError()
EndIf

End
