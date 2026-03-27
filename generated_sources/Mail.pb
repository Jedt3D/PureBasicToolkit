;
; ------------------------------------------------------------
;
;   PureBasic - Mail Sending Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define Result.i
Define Progress.i

If CreateMail(0, "sender@example.com", "Hello from PureBasic!")

  SetMailBody(0, "Hello !" + #CRLF$ +
                 "This is a multi-" + #CRLF$ +
                 "line mail message.")

  ; AddMailAttachment requires 3 parameters: mail, description, file path
  AddMailAttachment(0, "Image file", "Data/sample.bmp")
  AddMailAttachment(0, "Icon file", "Data/world.png")

  ; Add recipients
  AddMailRecipient(0, "recipient@example.com", #PB_Mail_To)
  AddMailRecipient(0, "cc_recipient@example.com", #PB_Mail_Cc)

  ; Send via SMTP server asynchronously
  Result = SendMail(0, "smtp.example.com", 25, #PB_Mail_Asynchronous)

  ; Monitor send progress
  Repeat
    Progress = MailProgress(0)
    Delay(300)
  Until Progress = #PB_Mail_Finished Or Progress = #PB_Mail_Error

  If Progress = #PB_Mail_Finished
    MessageRequester("Information", "Mail sent successfully!")
  Else
    MessageRequester("Error", "Failed to send the mail!")
  EndIf

EndIf
