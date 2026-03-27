;
; ------------------------------------------------------------
;
;   PureBasic - HTTP URL Parsing Example
;
;    Generated source
;
; ------------------------------------------------------------
;

EnableExplicit

Define URL.s

URL = "http://user:pass@www.purebasic.com:1024/subdirectory/index.php?year=2008&month=12&day=3"

; Extract URL parts
Debug "--- Extracting URL Parts ---"
Debug "Year parameter: " + GetURLPart(URL, "year")
Debug "Site: " + GetURLPart(URL, #PB_URL_Site)
Debug "Port: " + GetURLPart(URL, #PB_URL_Port)
Debug "Parameters: " + GetURLPart(URL, #PB_URL_Parameters)
Debug "Path: " + GetURLPart(URL, #PB_URL_Path)
Debug "User: " + GetURLPart(URL, #PB_URL_User)
Debug "Password: " + GetURLPart(URL, #PB_URL_Password)

; Modify URL parts
Debug ""
Debug "--- Modifying URL Parts ---"
Debug SetURLPart(URL, #PB_URL_Site, "forums.purebasic.fr")
Debug SetURLPart(URL, #PB_URL_Port, "80")
Debug SetURLPart(URL, #PB_URL_User, "newuser")
Debug SetURLPart(URL, #PB_URL_Password, "newpassword")
