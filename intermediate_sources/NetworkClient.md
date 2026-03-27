# NetworkClient.pb - Intermediate Description

## Purpose
Demonstrates a simple TCP network client that connects to a server on localhost, sends a UTF-8 string message, then disconnects.

## Application Type
GUI (uses MessageRequester for UI)

## Compiler Flags
None required (GUI application)

## Structure
- Opens a network connection to localhost on a specified port
- Sends a string message
- Closes the connection

## Key Libraries/Functions
- OpenNetworkConnection()
- SendNetworkString() with #PB_UTF8 encoding
- CloseNetworkConnection()
- MessageRequester()

## Input/Output
- No file I/O
- Network output: sends a string to server
- UI: message requesters for status

## Logic Flow
1. Define port number
2. Attempt to connect to 127.0.0.1 on the port
3. If connected, show success message
4. Send a UTF-8 string to the server
5. Show confirmation and wait for user acknowledgment
6. Close the connection
7. If connection failed, show error message

## Cross-Platform Notes
No platform-specific code

## Important Notes
- Requires the companion NetworkServer.pb to be running first
- Uses #PB_UTF8 encoding for string transmission
- Connection is TCP-based
