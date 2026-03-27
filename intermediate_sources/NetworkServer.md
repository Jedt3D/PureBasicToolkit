# NetworkServer.pb - Intermediate Description

## Purpose
Demonstrates a simple TCP network server that listens for client connections, receives data, and handles connect/disconnect events.

## Application Type
GUI (uses MessageRequester for UI)

## Compiler Flags
None required (GUI application)

## Structure
- Creates a TCP server on localhost
- Allocates a receive buffer
- Event loop processes network events (connect, data, disconnect)
- Displays received data via message requesters

## Key Libraries/Functions
- CreateNetworkServer()
- NetworkServerEvent(), EventClient()
- ReceiveNetworkData()
- CloseNetworkServer()
- AllocateMemory(), PeekS(), FreeMemory()
- MessageRequester()
- #PB_Network_IPv4, #PB_Network_TCP
- #PB_NetworkEvent_Connect, #PB_NetworkEvent_Data, #PB_NetworkEvent_Disconnect

## Input/Output
- Network input: receives data from clients
- UI: message requesters for status

## Logic Flow
1. Define port and allocate receive buffer
2. Create TCP server bound to localhost
3. Show server started message
4. Enter event loop checking NetworkServerEvent()
5. On connect: show client connected message
6. On data: receive data, display as UTF-8 string
7. On disconnect: show client disconnected, set quit flag
8. Exit loop, show goodbye, close server

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Requires companion NetworkClient.pb to send data
- Uses #PB_Network_IPv4 | #PB_Network_TCP flags
- PeekS with #PB_UTF8 to decode received bytes
