;
; ------------------------------------------------------------
;
;   PureBasic - String example
;
;    Generated source - demonstrates basic string operations
;
; ------------------------------------------------------------
;

EnableExplicit

Define testStr$
Define resultLeft$
Define resultMid$
Define numVal.i

; Basic string manipulation
;
testStr$ = "Test"
resultLeft$ = Left(testStr$, 1)
resultMid$ = Mid(testStr$, 3, 1)

; String to number conversion
;
numVal = Val("-121212")

; Display combined results
;
MessageRequester("PureBasic", "Welcome: " + Mid(Str(numVal), 2, 3) + " " + resultMid$, 0)
