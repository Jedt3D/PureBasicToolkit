;
; ------------------------------------------------------------
;
;   PureBasic - SerialPort example
;
;    Generated source - demonstrates serial port communication
;
; ------------------------------------------------------------
;

EnableExplicit

Define PortName$

; Select port name based on operating system
;
CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  PortName$ = "COM1"
CompilerElse
  PortName$ = "/dev/ttyS0"
CompilerEndIf

; Try to open the serial port with:
;   300 baud, no parity, 8 data bits, 1 stop bit, no handshake
;   1024 byte input/output buffers
;
If OpenSerialPort(0, PortName$, 300, #PB_SerialPort_NoParity, 8, 1, #PB_SerialPort_NoHandshake, 1024, 1024)
  MessageRequester("Information", "Serial port opened successfully: " + PortName$)
Else
  MessageRequester("Error", "Cannot open serial port: " + PortName$)
EndIf
