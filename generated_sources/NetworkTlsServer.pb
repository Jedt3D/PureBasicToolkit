; NetworkTlsServer.pb - Generated PureBasic Source
; Demonstrates a TLS-encrypted TCP server with embedded key and certificate

EnableExplicit

Define Key$
Define Cert$
Define Connection.l
Define *Buffer
Define Timeout.l
Define ClientID.l

; Self-signed RSA private key (for testing purposes)
Key$ = "-----BEGIN PRIVATE KEY-----" + #LF$
Key$ + "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAPEbSQq/uwESZduP" + #LF$
Key$ + "tDd83qXXkSPf6lUNa17xhM2fOZQxGr0Fdmvw6IsC+QGX25EE1TG6TFQkHlM2rW8y" + #LF$
Key$ + "6a3WEC/WzCNWaTCPYD/rguiAFG+4eQmwHjiJFVec0InjjSG9SX8xwS/gQeWdQniK" + #LF$
Key$ + "ROO4DmMJO8N7mdUhdHODSntXdr9zAgMBAAECgYAE+VMgbaQl+YMwbF6DZogRU8ki" + #LF$
Key$ + "vFPRPV2hr8nVlBtT+09Z5uryfx3NAFqytbdJ3penVviMI9KcVNxvFtXLSEc9Kyjz" + #LF$
Key$ + "gysorAfUpwFuECCLDbOXX0HlV6rgkqJdhyV6FybcDLvgcvulHQ64QdYRhW+jPx7v" + #LF$
Key$ + "Xk3h0/JRFqKQJsY7QQJBAPrDLJRPbAw+Mlq1fHBWk8Z1Qn1ivPAmz+2nPAgDya/x" + #LF$
Key$ + "dAlb9GbFAMzCS3upIBpxW70uLI04OuTVhwYL194I5C0CQQD2JHtHp25SkIDpBgZG" + #LF$
Key$ + "icEC7yAIE/wPC0P9X85UJqXx5dPx4HbEc8lqSKMbCzkbHyvjHonSHu00QxU1W6ZA" + #LF$
Key$ + "LFYfAkBcPWzphSl+e2Z0XWvPutkS2FFD5A0R3YUAq1J2tEX9NTj0tGF7aB36M8Im" + #LF$
Key$ + "U7jeYTJYrWJv8+4d/Ll1LOgT4XtlAkAxofOV5EYTsf28fzF+wcJAtDUyS81Uv0HL" + #LF$
Key$ + "cqkpQM3PdDeDm253eJ2Rp+nzxxSRynxQBNVnoELWefxp0Pw6DnajAkBF5h7fQIbw" + #LF$
Key$ + "AEPrhDzhjMXU7g9k9KzkkJN/bluLbleqkkAz1kfkGtWXJdGITZuY4K/X2yp1diWQ" + #LF$
Key$ + "0utZjmOmhWsl" + #LF$
Key$ + "-----END PRIVATE KEY-----"

; Self-signed certificate
Cert$ = "-----BEGIN CERTIFICATE-----" + #LF$
Cert$ + "MIICnTCCAgYCCQD0AWy2vzfcpzANBgkqhkiG9w0BAQUFADCBkjELMAkGA1UEBhMC" + #LF$
Cert$ + "VVMxDjAMBgNVBAgTBVN0YXRlMQ0wCwYDVQQHEwRDaXR5MRUwEwYDVQQKEwxPcmdh" + #LF$
Cert$ + "bml6YXRpb24xHDAaBgNVBAsTE09yZ2FuaXphdGlvbmFsIFVuaXQxLzAtBgNVBAMT" + #LF$
Cert$ + "JkNvbW1vbiBOYW1lIChlLmcuLCB5b3VyIHNlcnZlciBkb21haW4pMB4XDTI0MTEw" + #LF$
Cert$ + "NjE2NTI1N1oXDTI0MTIwNjE2NTI1N1owgZIxCzAJBgNVBAYTAlVTMQ4wDAYDVQQI" + #LF$
Cert$ + "EwVTdGF0ZTENMAsGA1UEBxMEQ2l0eTEVMBMGA1UEChMMT3JnYW5pemF0aW9uMRww" + #LF$
Cert$ + "GgYDVQQLExNPcmdhbml6YXRpb25hbCBVbml0MS8wLQYDVQQDEyZDb21tb24gTmFt" + #LF$
Cert$ + "ZSAoZS5nLiwgeW91ciBzZXJ2ZXIgZG9tYWluKTCBnzANBgkqhkiG9w0BAQEFAAOB" + #LF$
Cert$ + "jQAwgYkCgYEA8RtJCr+7ARJl24+0N3zepdeRI9/qVQ1rXvGEzZ85lDEavQV2a/Do" + #LF$
Cert$ + "iwL5AZfbkQTVMbpMVCQeUzatbzLprdYQL9bMI1ZpMI9gP+uC6IAUb7h5CbAeOIkV" + #LF$
Cert$ + "V5zQieONIb1JfzHBL+BB5Z1CeIpE47gOYwk7w3uZ1SF0c4NKe1d2v3MCAwEAATAN" + #LF$
Cert$ + "BgkqhkiG9w0BAQUFAAOBgQCprm5a5bg1LqCDdtwDTnRDmVcca6HoUlvbjZLmWdLj" + #LF$
Cert$ + "ltG1McNAATppTy/bF7vT3jXLobA1Vzs2g14POjYQhPnIbRPEnNzvAe+Se3y0YeFOw" + #LF$
Cert$ + "YarEyFBHKHODGIPaCnXGH8gB9fgcp2SYtLaPKvXdNL44VeYGbD4+fvUcu/zkXqTSg==" + #LF$
Cert$ + "-----END CERTIFICATE-----"

; Initialize TLS with the server key and certificate
UseNetworkTLS(Key$, Cert$)

; Create TLS server
Connection = CreateNetworkServer(#PB_Any, 20252, #PB_Network_TCP | #PB_Network_IPv4 | #PB_Network_TLSv1_3)

If Connection
  Debug "TLS Server started on port 20252"
  Debug "Launch NetworkTlsClient.pb to test the connection."

  Timeout = 10000
  *Buffer = AllocateMemory(2048)

  ; Event loop with timeout
  Repeat
    Select NetworkServerEvent()

      Case #PB_NetworkEvent_Data
        ClientID = EventClient()
        PokeA(*Buffer, 0)
        ReceiveNetworkData(ClientID, *Buffer, 2048)
        Debug "Received from client: " + PeekS(*Buffer, -1, #PB_UTF8)
        SendNetworkString(ClientID, "Message acknowledged by TLS server")

      Case #PB_NetworkEvent_Connect
        Debug "Client connected"

      Case #PB_NetworkEvent_Disconnect
        Debug "Client disconnected"

      Case #PB_NetworkEvent_None
        Delay(200)
        Timeout - 1

    EndSelect
  Until Timeout = 0

  Debug "Server timeout reached, shutting down"
  FreeMemory(*Buffer)
  CloseNetworkServer(Connection)
Else
  Debug "Cannot create TLS server"
EndIf
