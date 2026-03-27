;
; ------------------------------------------------------------
;
;   PureBasic - WebView example
;
;    Generated source - demonstrates WebViewGadget with JS callbacks
;
; ------------------------------------------------------------
;

EnableExplicit

; Callback for "increment" - maintains a static counter
;
Procedure IncrementCallback(JsonParams$)
  Static Counter.i

  Debug #PB_Compiler_Procedure + ": " + JsonParams$

  Counter + 1
  ProcedureReturn UTF8(~"{ \"count\": " + Str(Counter) + "}")
EndProcedure

; Callback for "compute" - adds two numbers from JSON parameters
;
Procedure ComputeCallback(JsonParams$)

  Debug #PB_Compiler_Procedure + ": " + JsonParams$

  Dim Params(0)

  ; Parse the JSON parameter array
  ;
  ParseJSON(0, JsonParams$)
  ExtractJSONArray(JSONValue(0), Params())

  Debug "Parameter 1: " + Params(0)
  Debug "Parameter 2: " + Params(1)

  ProcedureReturn UTF8(Str(Params(0) + Params(1)))
EndProcedure


Define Event.i

; Open the window initially invisible (will show after webview loads)
;
OpenWindow(0, 100, 100, 400, 400, "WebView Demo", #PB_Window_SystemMenu | #PB_Window_Invisible)

; Create WebViewGadget - NOTE: no URL parameter!
;
WebViewGadget(0, 0, 0, 400, 400)

; Navigate to the HTML file using SetGadgetText
;
SetGadgetText(0, "file://" + #PB_Compiler_Home + "examples/sources/Data/WebView/webview.html")

; Bind JavaScript function names to PureBasic callback procedures
;
BindWebViewCallback(0, "increment", @IncrementCallback())
BindWebViewCallback(0, "compute", @ComputeCallback())

; Show the window after webview is set up
;
HideWindow(0, #False)

; Main event loop
;
Repeat
  Event = WaitWindowEvent()
Until Event = #PB_Event_CloseWindow
