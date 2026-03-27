# Mail.pb - Intermediate Description

## Purpose
Demonstrates sending an email with attachments using PureBasic's Mail library.

## Application Type
GUI (uses MessageRequester)

## Compiler Flags
None (default GUI mode)

## Structure
- Creates a mail message with body text
- Adds file attachments (with 3 parameters each: mail, description, file)
- Adds recipients (To and Cc)
- Sends via SMTP server asynchronously
- Monitors send progress

## Key Libraries/Functions
- CreateMail(), SetMailBody(), AddMailAttachment() (3 params: mail, description, file)
- AddMailRecipient(), #PB_Mail_To, #PB_Mail_Cc
- SendMail(), MailProgress()
- #PB_Mail_Asynchronous, #PB_Mail_Finished, #PB_Mail_Error
- MessageRequester(), Delay()

## Input/Output
- Input: Hardcoded email content and SMTP server settings
- Output: Message requester indicating success or failure

## Logic Flow
1. Create mail with sender address and subject
2. Set multi-line mail body
3. Add two file attachments (each with mail ID, description string, and file path)
4. Add To and Cc recipients
5. Send mail via SMTP server asynchronously
6. Poll MailProgress in a loop with 300ms delays
7. Show success or error message

## Cross-Platform Notes
- Mail library works cross-platform
- SMTP connection is platform-independent

## Important Notes
- CRITICAL: AddMailAttachment takes 3 parameters: (mailID, description$, filePath$)
- Uses asynchronous sending with progress monitoring
- Example uses placeholder SMTP server and email addresses
