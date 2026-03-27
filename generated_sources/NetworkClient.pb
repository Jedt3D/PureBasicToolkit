; NetworkClient.pb - Generated PureBasic Source
; Demonstrates a simple TCP network client connecting to a local server

EnableExplicit

Define Port.l
Define ConnectionID.l

; Port must match the server
Port = 6832

; Attempt to connect to the server on localhost
ConnectionID = OpenNetworkConnection("127.0.0.1", Port)

If ConnectionID
  MessageRequester("Network Client", "Successfully connected to server on port " + Str(Port), 0)

  ; Send a UTF-8 encoded string to the server
  SendNetworkString(ConnectionID, "Hello from the PureBasic network client!", #PB_UTF8)

  MessageRequester("Network Client", "Message has been sent to the server." + #LF$ +
                                     "Check the server before closing this dialog.", 0)

  ; Clean up the connection
  CloseNetworkConnection(ConnectionID)
Else
  MessageRequester("Network Client", "Could not connect to server on port " + Str(Port) + "." + #LF$ +
                                     "Make sure the server is running first.", 0)
EndIf

End
