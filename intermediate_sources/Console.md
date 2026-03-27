# Console.pb - Intermediate Description

## Purpose
Demonstrates console programming: text input, colored output, background/foreground color cycling, graphical console mode.

## Application Type
Console

## Compiler Flags
-cl (console app)

## Structure
- No procedures or structures
- Linear flow with For loops

## Key Libraries/Functions
- Console: OpenConsole, CloseConsole, ConsoleTitle, EnableGraphicalConsole
- Console I/O: Print, PrintN, Input, ConsoleLocate, ConsoleColor, ClearConsole
- System: Delay

## Input/Output
- Input: user name via console Input()
- Output: colored console text

## Logic Flow
1. Open console and set title
2. Enable graphical console
3. Ask user for name
4. Clear and display welcome message
5. Cycle through background text colors (0-15)
6. Cycle through foreground text colors (0-15)
7. Cycle through full background colors with foreground variations
8. Close console

## Cross-Platform Notes
- Graphical console mode may behave differently across platforms
- Color range 0-15

## Important Notes
- Must compile with -cl flag
- Uses EnableGraphicalConsole(1) for positioning
- Delay() for pauses between color cycles
