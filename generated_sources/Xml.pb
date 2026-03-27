;
; ------------------------------------------------------------
;
;   PureBasic - XML Viewer example
;
;    Generated source - demonstrates XML parsing and tree display
;
; ------------------------------------------------------------
;

EnableExplicit

#WinMain    = 0
#GadgetTree = 0
#XmlHandle  = 0

; Recursive procedure to populate the TreeGadget from XML nodes
;
Procedure FillTree(*CurrentNode, CurrentSublevel.i)
  Protected NodeText$
  Protected *ChildNode

  ; Only process normal XML element nodes
  ;
  If XMLNodeType(*CurrentNode) = #PB_XML_Normal

    ; Build display text: element name + attributes + text content
    ;
    NodeText$ = GetXMLNodeName(*CurrentNode) + ": "

    If ExamineXMLAttributes(*CurrentNode)
      While NextXMLAttribute(*CurrentNode)
        NodeText$ + " Attr:" + XMLAttributeName(*CurrentNode) + "=" + Chr(34) + XMLAttributeValue(*CurrentNode) + Chr(34) + " "
      Wend
    EndIf

    NodeText$ + " " + GetXMLNodeText(*CurrentNode)

    AddGadgetItem(#GadgetTree, -1, NodeText$, 0, CurrentSublevel)

    ; Recurse into child nodes
    ;
    *ChildNode = ChildXMLNode(*CurrentNode)

    While *ChildNode <> 0
      FillTree(*ChildNode, CurrentSublevel + 1)
      *ChildNode = NextXMLNode(*ChildNode)
    Wend

  EndIf

EndProcedure


; --- Main program ---

Define FileName$
Define Message$
Define Event.i
Define *MainNode
Define i.i

FileName$ = OpenFileRequester("Choose XML file...", "", "XML files (*.xml)|*.xml|All files (*.*)|*.*", 0)

If FileName$ <> ""

  If LoadXML(#XmlHandle, FileName$)

    ; Check for XML parsing errors
    ;
    If XMLStatus(#XmlHandle) <> #PB_XML_Success
      Message$ = "Error in XML file:" + Chr(13)
      Message$ + "Message: " + XMLError(#XmlHandle) + Chr(13)
      Message$ + "Line: " + Str(XMLErrorLine(#XmlHandle)) + "   Character: " + Str(XMLErrorPosition(#XmlHandle))
      MessageRequester("Error", Message$)
    EndIf

    ; Display the tree even if there were errors (partial data may be available)
    ;
    If OpenWindow(#WinMain, 0, 0, 500, 500, "XML Viewer", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
      TreeGadget(#GadgetTree, 10, 10, 480, 480)

      ; Get the root node and populate the tree
      ;
      *MainNode = MainXMLNode(#XmlHandle)
      If *MainNode
        FillTree(*MainNode, 0)
      EndIf

      ; Expand all tree items for visibility
      ;
      For i = 0 To CountGadgetItems(#GadgetTree) - 1
        SetGadgetItemState(#GadgetTree, i, #PB_Tree_Expanded)
      Next i

      ; Wait for window close
      ;
      Repeat
        Event = WaitWindowEvent()
      Until Event = #PB_Event_CloseWindow
    EndIf

  Else
    MessageRequester("Error", "The file cannot be opened.")
  EndIf

EndIf
