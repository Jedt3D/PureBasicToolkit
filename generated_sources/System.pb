;
; ------------------------------------------------------------
;
;   PureBasic - System information example
;
;    Generated source - displays system information
;
; ------------------------------------------------------------
;

EnableExplicit

; Display system information in a single dialog
;
MessageRequester("System Information", "User: " + UserName() + #LF$ +
                                       "Computer: " + ComputerName() + #LF$ +
                                       "CPUs: " + CountCPUs() + #LF$ +
                                       "Physical Memory: " + Str(MemoryStatus(#PB_System_TotalPhysical) / (1024 * 1024)) + " MB")
