# SerialPort.pb - Intermediate Description

## Purpose
Demonstrates opening a serial port with PureBasic's SerialPort library, using platform-specific port names.

## Application Type
GUI (uses MessageRequester for output)

## Compiler Flags
None (standard GUI app)

## Structure
- Uses CompilerIf to select platform-specific serial port name
- Attempts to open serial port with OpenSerialPort()
- Reports success or failure via MessageRequester

## Key Libraries/Functions
- OpenSerialPort() - opens a serial port with specified parameters (baud, parity, data bits, stop bits, handshake, buffer sizes)
- MessageRequester() - displays result dialog
- CompilerIf / CompilerElse / CompilerEndIf - compile-time platform branching

## Input/Output
- No file I/O
- Output: MessageRequester showing success or error

## Logic Flow
1. Determine port name based on OS (COM1 for Windows, /dev/ttyS0 for others)
2. Attempt to open serial port 0 with 300 baud, no parity, 8 data bits, 1 stop bit, no handshake, 1024 byte buffers
3. Display success or failure message

## Cross-Platform Notes
- Windows uses "COM1" port name
- Linux/macOS uses "/dev/ttyS0" port name

## Important Notes
- The serial port may not physically exist on the machine; the example just demonstrates the API call
