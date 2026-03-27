# Cipher.pb - Intermediate Description

## Purpose
Demonstrates cipher/fingerprint functions: CRC32, MD5, and DES fingerprints with known test values.

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None

## Structure
- No procedures or structures
- Linear flow with three fingerprint tests

## Key Libraries/Functions
- Cipher: UseCRC32Fingerprint, UseMD5Fingerprint, StringFingerprint, DESFingerprint
- Constants: #PB_Cipher_CRC32, #PB_Cipher_MD5, #PB_Ascii
- MessageRequester for output

## Input/Output
- No file I/O
- Output: Three message dialogs showing fingerprint results

## Logic Flow
1. Register CRC32 and MD5 fingerprint plugins
2. Compute and display CRC32 of "abc"
3. Compute and display MD5 of "PureBasic"
4. Compute and display DES fingerprint

## Cross-Platform Notes
- Fully cross-platform

## Important Notes
- StringFingerprint takes format flag (#PB_Ascii) as third parameter
- DESFingerprint takes key and salt parameters
