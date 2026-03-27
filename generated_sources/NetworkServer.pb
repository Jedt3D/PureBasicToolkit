; NetworkServer.pb - Generated PureBasic Source
; Demonstrates a simple TCP network server that receives data from clients

EnableExplicit

Define Port.l
Define *Buffer
Define ServerEvent.l
Define ClientID.l
Define Quit.l

; Configuration
Port = 6832
*Buffer = AllocateMemory(2048)

If *Buffer = 0
  MessageRequester("Error", "Failed to allocate receive buffer", 0)
  End
EndIf

; Create TCP server on localhost
If CreateNetworkServer(0, Port, #PB_Network_IPv4 | #PB_Network_TCP, "127.0.0.1")

  MessageRequester("Network Server", "Server started on port " + Str(Port) + "." + #LF$ +
                                     "Run NetworkClient.pb to connect.", 0)

  ; Event loop for handling network events
  Repeat

    ServerEvent = NetworkServerEvent()

    If ServerEvent
      ClientID = EventClient()

      Select ServerEvent

        Case #PB_NetworkEvent_Connect
          MessageRequester("Network Server", "New client connected (ID: " + Str(ClientID) + ")", 0)

        Case #PB_NetworkEvent_Data
          ReceiveNetworkData(ClientID, *Buffer, 2048)
          MessageRequester("Network Server", "Data received from client " + Str(ClientID) + ":" + #LF$ +
                                             PeekS(*Buffer, -1, #PB_UTF8), 0)

        Case #PB_NetworkEvent_Disconnect
          MessageRequester("Network Server", "Client " + Str(ClientID) + " disconnected.", 0)
          Quit = 1

      EndSelect
    EndIf

  Until Quit = 1

  MessageRequester("Network Server", "Shutting down server.", 0)

  CloseNetworkServer(0)
  FreeMemory(*Buffer)
Else
  MessageRequester("Error", "Cannot create server on port " + Str(Port) + ". Port may be in use.", 0)
  FreeMemory(*Buffer)
EndIf

End
