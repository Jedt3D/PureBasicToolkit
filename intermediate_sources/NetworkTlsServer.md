# NetworkTlsServer.pb - Intermediate Description

## Purpose
Demonstrates a TLS-encrypted TCP server with embedded private key and certificate. Listens for TLS connections, receives data, sends a response, and times out.

## Application Type
GUI (uses Debug output)

## Compiler Flags
None required

## Structure
- Embeds PEM-encoded private key and certificate strings
- Initializes TLS with key and certificate
- Creates a TLS v1.3 server
- Event loop receives data and sends response
- Times out after a period

## Key Libraries/Functions
- UseNetworkTLS(Key$, Cert$)
- CreateNetworkServer() with #PB_Network_TLSv1_3 flag
- NetworkServerEvent(), EventClient()
- ReceiveNetworkData(), SendNetworkString()
- CloseNetworkServer()
- AllocateMemory(), PeekS(), PokeA()
- #PB_NetworkEvent_Data, #PB_NetworkEvent_None

## Input/Output
- Network I/O: receives client data, sends response
- Debug output for status

## Logic Flow
1. Define PEM private key and certificate as strings
2. Initialize TLS with UseNetworkTLS(Key$, Cert$)
3. Create TLS v1.3 server on port 20252
4. Allocate receive buffer
5. Loop with timeout checking NetworkServerEvent()
6. On data: receive data, display string, send acknowledgment
7. On no event: delay and decrement timeout
8. After timeout, close server

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Server needs both private key and certificate for TLS
- Uses self-signed certificate (for testing only)
- Requires companion NetworkTlsClient.pb
- PokeA used to null-terminate buffer before reading
