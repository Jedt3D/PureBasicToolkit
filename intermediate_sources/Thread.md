# Thread.pb - Intermediate Description

## Purpose
Demonstrates creating a background thread that runs independently from the main program. The thread outputs a debug message every 2 seconds while the main thread shows a message requester.

## Application Type
GUI (uses Debug and MessageRequester)

## Compiler Flags
None (standard GUI app)

## Structure
- Procedure AlertThread(Parameter) - thread function with infinite loop
- CreateThread() call to start the thread
- MessageRequester blocks main thread until user clicks

## Key Libraries/Functions
- CreateThread() - creates and starts a new thread
- Delay() - pauses execution for specified milliseconds
- Debug - output display
- MessageRequester() - blocks main thread until dismissed

## Input/Output
- No input
- Output: Debug messages every 2 seconds, MessageRequester for user to end program

## Logic Flow
1. Define thread procedure with infinite loop (Debug + 2 second Delay)
2. Create thread passing the procedure address
3. Show MessageRequester on main thread
4. Program ends when user clicks OK (thread terminates with program)

## Cross-Platform Notes
No platform-specific code

## Important Notes
- The thread runs indefinitely until the program exits
- Thread procedure receives an integer Parameter (unused in this example)
