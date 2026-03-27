; NetworkTlsClient.pb - Generated PureBasic Source
; Demonstrates a TLS-encrypted TCP client connecting to a TLS server

EnableExplicit

Define Connection.l
Define *Buffer
Define Receive$
Define Timeout.l
Define Length.l

; Enable TLS networking (no key/cert needed for client)
UseNetworkTLS()

; Connect to the TLS server on localhost
Connection = OpenNetworkConnection("127.0.0.1", 20252, #PB_Network_TCP | #PB_Network_IPv4 | #PB_Network_TLSv1_3)

If Connection
  ; Allocate a receive buffer
  *Buffer = AllocateMemory($FFFF, #PB_Memory_NoClear)
  If *Buffer

    Debug "Connected to TLS server, sending request..."
    SendNetworkString(Connection, "GET / HTTP/1.1" + #CRLF$ + "Host: localhost" + #CRLF$ + #CRLF$)
    Debug "Request sent, waiting for response..."

    Timeout = 100
    Receive$ = ""

    ; Poll for response data
    Repeat
      ; Need to process server events too for TLS handshake
      Select NetworkServerEvent()
      EndSelect

      Select NetworkClientEvent(Connection)
        Case #PB_NetworkEvent_Data
          ; Read all available data
          Repeat
            Length = ReceiveNetworkData(Connection, *Buffer, MemorySize(*Buffer))
            If Length > 0
              Receive$ + PeekS(*Buffer, Length, #PB_UTF8 | #PB_ByteLength)
            EndIf
          Until Length = 0 Or (Length > 0 And Length <> MemorySize(*Buffer))
          Break

        Case #PB_NetworkEvent_Disconnect
          Debug "Server disconnected"
          Break

        Case #PB_NetworkEvent_None
          Delay(10)
          Timeout - 1

      EndSelect
    Until Timeout = 0

    If Receive$ <> ""
      Debug "Response received:"
      Debug Receive$
    Else
      Debug "No response received (timeout)"
    EndIf

    FreeMemory(*Buffer)
  EndIf

  CloseNetworkConnection(Connection)
Else
  Debug "Cannot connect to TLS server. Is NetworkTlsServer.pb running?"
EndIf
