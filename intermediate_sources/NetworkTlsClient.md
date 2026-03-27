# NetworkTlsClient.pb - Intermediate Description

## Purpose
Demonstrates a TLS-encrypted TCP network client that connects to a TLS server, sends an HTTP-like request string, receives the response, and displays it.

## Application Type
GUI (uses Debug output)

## Compiler Flags
None required

## Structure
- Enables TLS networking with UseNetworkTLS()
- Opens a TLS v1.3 connection to localhost
- Sends an HTTP GET request string
- Receives response data in a loop with timeout
- Displays received data

## Key Libraries/Functions
- UseNetworkTLS()
- OpenNetworkConnection() with #PB_Network_TLSv1_3 flag
- SendNetworkString()
- NetworkClientEvent(), NetworkServerEvent()
- ReceiveNetworkData()
- AllocateMemory(), MemorySize(), FreeMemory()
- PeekS() with #PB_UTF8 | #PB_ByteLength
- CloseNetworkConnection()

## Input/Output
- Network I/O: sends request, receives response
- Debug output for status and received data

## Logic Flow
1. Enable TLS with UseNetworkTLS()
2. Open TLS v1.3 connection to 127.0.0.1:20252
3. Allocate receive buffer
4. Send HTTP GET-style request string
5. Loop with timeout: check NetworkServerEvent and NetworkClientEvent
6. On data event: receive in loop until no more data
7. On disconnect: break
8. On no event: delay and decrement timeout
9. Display received string
10. Clean up connection and memory

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Requires companion NetworkTlsServer.pb running first
- Uses TLS v1.3 (#PB_Network_TLSv1_3)
- UseNetworkTLS() called without parameters for client (no key/cert needed)
- Receive loop handles partial reads
