# RegularExpression.pb - Intermediate Description

## Purpose
Demonstrates PureBasic's RegularExpression library: creating regex patterns, extracting matches from strings, and handling regex errors.

## Application Type
GUI (uses Debug output and MessageRequester)

## Compiler Flags
None required

## Structure
- Creates a regular expression pattern
- Extracts matches from a test string into an array
- Iterates and displays matched results
- Handles regex creation errors

## Key Libraries/Functions
- CreateRegularExpression()
- ExtractRegularExpression()
- RegularExpressionError()
- Dim (array declaration)
- MessageRequester

## Input/Output
- No external input
- Output via Debug statements

## Logic Flow
1. Create a regular expression pattern matching 3-letter words with 'b' in the middle
2. Declare a result array
3. Extract all matches from a test string
4. Display number of matches found
5. Loop through matches and display each
6. If regex creation fails, show error message

## Cross-Platform Notes
No platform-specific code

## Important Notes
- CreateRegularExpression returns 0 on failure
- ExtractRegularExpression fills a Dim array and returns the count
- Array is auto-resized by ExtractRegularExpression
- RegularExpressionError() gives the error message if creation fails
- Pattern [a-z]b[a-z] matches 3-char sequences with 'b' as middle char
