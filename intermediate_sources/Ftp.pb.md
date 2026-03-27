# Ftp.pb - Intermediate Description

## Purpose
Demonstrates connecting to an FTP server and sending a file with progress monitoring.

## Application Type
GUI (uses Debug and MessageRequester, plus OpenFileRequester)

## Compiler Flags
None (default GUI mode)

## Structure
- Opens FTP connection to localhost
- Uses OpenFileRequester to pick a file
- Sends the file with SendFTPFile in asynchronous mode
- Monitors progress in a loop with FTPProgress()

## Key Libraries/Functions
- OpenFTP(), SendFTPFile(), FTPProgress(), CloseFTP()
- OpenFileRequester()
- #PB_FTP_Finished, #PB_FTP_Error
- Delay(), Debug, MessageRequester()

## Input/Output
- Input: User selects a file via file requester
- Output: Debug output showing upload progress, message on error

## Logic Flow
1. Attempt to open FTP connection to 127.0.0.1 with test/test credentials
2. If connected, prompt user to select a file
3. Send file via SendFTPFile with asynchronous flag
4. Loop checking FTPProgress() with 300ms delays
5. Print progress via Debug until finished or error
6. If connection fails, show error requester

## Cross-Platform Notes
- FTP library works cross-platform
- OpenFileRequester is GUI-based

## Important Notes
- Connects to localhost (127.0.0.1) which requires a local FTP server for testing
- Uses asynchronous mode (flag = 1) for SendFTPFile
