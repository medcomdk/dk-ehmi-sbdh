<!-- ## ehmiSBDHEnvelopeReceipt-->

**ehmiSBDHEnvelopeReceipt**

The ehmiSBDHEnvelopeReceipt is the receipt mechanism for the ehmiSBDH.

- EHMI ReceiptAcknowledgement
- EHMI ReceiptException

<br>

**EHMI ReceiptAcknowledgement**

The EHMI Receipt Acknowledgement Business Signal signals that a message has been properly received by the Receiver MSH software component. Legible means that it has passed structure/schema validity check. The content of the receipt and the legibility of a business message MUST be reviewed prior to the processing of the Requesting or Responding Business Document or the evaluation of condition expressions in the message's Business Documents or Document Envelope. Condition Expressions are expressions that evaluate to true or false. [ebXMLbp] 

**EHMI ReceiptException**

A  Receipt Exception signals an error condition in the management of a Business Transaction. This Business Signal is returned to the initiating activity that originated the request. This exception MUST terminate the Business Transaction. These errors deal with the mechanisms of message exchange such as verification, validation, authentication, and authorization and will occur up to message acceptance. Typically, the rules and constraints applied to the message will have only dealt with the well-formedness of the message.

A receipt exception terminates the Business Transaction. The following are receipt exceptions:
- Syntax exceptions. There is invalid punctuation, vocabulary or grammar in the Business Document or Business Signal. 
- Authorization exceptions. Roles are not authorized to participate in the BTA. Note that the receiving BSI can only identify this exception.
- Signature exceptions. Business Documents are not signed for non-repudiation when required.
- Sequence exceptions. The order or type of a Business Document or Business Signal is incorrect.

A Receipt Exception typical signals an error condition in a Business Activity which requires a transaction to be terminated, i.e. receipt of a business message with a Business Document that has failed. (From [ebXMLbp] page 77)

<br>

<br>

## EHMI ReceiptAcknowledgement (ebBP signal message)
<br>

EHMI ReceiptAcknowledgement is used as a positive transport receipt, and so that the recipient of the receipt can easily correlate the message with the original envelope, the recipient can check for the following elements:

- Sender 
    - Identifier (GLN number for sender) 
- Receiver 
    - Identifier (GLN number for receiver) 
- Scope 
    - SENDERID (SORID for sender) 
    - RECEIVERID (SORID for receiver) 
    - CorrelationInformation

#### RequestingDocumentInstanceIdentifier

Contained as a BinaryContent in an EHMI SBDH ReceiptAcknowledgement is also an ebBP signal, which in principle contains the same information, but which does not need to be checked when it is a ReceiptAcknowledgement.

<br>

<img src="ehmiSBDH_ReceiptAckowledgement.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/><br>

<br>

##### OriginalMessageIdentifier

Same datatype as SBDH.DocumentIdentification.InstanceIdentifier

    <bpssignal:OriginalMessageIdentifier>
        [RequestingSBDH/DocumentIdentification/InstanceIdentifier]
    </bpssignal:OriginalMessageIdentifier>		

OriginalMessageIdentifier example
    
    <bpssignal:OriginalMessageIdentifier>
        9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc
    </bpssignal:OriginalMessageIdentifier>		

<br>

###### OriginalDocumentIdentifier

Same datatype as SBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier

    <bpssignal:OriginalDocumentIdentifier>
        [RequestingSBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier]
    </bpssignal:OriginalDocumentIdentifier>

OriginalDocumentIdentifier example

    <bpssignal:OriginalDocumentIdentifier>
        urn:dk:healthcare:prod:messaging:medcom: fhir:structuredefinition:[Bundle/MessageHeader/eventCoding/code.value]#urn:dk:medcom:fhir:[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
    </bpssignal:OriginalDocumentIdentifier>

<br>

###### OriginalMessageDateTime

Always in this format: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC] 

    <bpssignal:OriginalMessageDateTime>
        [RequestingSBDH/DocumentIdentification/CreationDateAndTime]
    </bpssignal:OriginalMessageDateTime>

OriginalMessageDateTime example

    <bpssignal:OriginalMessageDateTime>
        2024-03-01T16:19:00+01:00
    </bpssignal:OriginalMessageDateTime>

<br>

###### ThisMessageDateTime

Always in this format: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC]

    <bpssignal:ThisMessageDateTime>
        [RespondingSBDH.DocumentIdentification.CreationDateAndTime]
    </bpssignal:ThisMessageDateTime>

ThisMessageDateTime example

    <bpssignal:ThisMessageDateTime>
        2024-03-01T16:19:10+01.00
    </bpssignal:ThisMessageDateTime>

<br>

###### FromPartyInfo
 
    <bpssignal:FromPartyInfo type=[RequestingSBDH:Receiver.Identifier@Authority]>
        [RequestingSBDH:Receiver.Identifier]
    </bpssignal:FromPartyInfo>

FromPartyInfo example

    <bpssignal:FromPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000201389
    </bpssignal:FromPartyInfo>

<br>

###### ToPartyInfo

    <bpssignal:ToPartyInfo type=[RequestingSBDH:Sender.Identifier@Authority]>
        [RequestingSBDH:Sender.Identifier]
    </bpssignal:ToPartyInfo> 

ToPartyInfo example

    <bpssignal:ToPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000121526
    </bpssignal:ToPartyInfo>

<br>

##### Overall EHMI ReceiptAcknowledgement example

    <bpssignal:ReceiptAcknowledgement xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:bpssignal="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0 http://docs.oasis-open.org/ebxml-bp/2.0.4/ebbp-signals-2.0.4.xsd">
        <bpssignal:OriginalMessageIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </bpssignal:OriginalMessageIdentifier>
        <bpssignal:OriginalDocumentIdentifier>
            urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation#urn:dk:medcom:fhir:homecareobservation:3.0
        </bpssignal:OriginalDocumentIdentifier>
        <bpssignal:OriginalMessageDateTime>
            2024-03-01T16:19:00+01:00
        </bpssignal:OriginalMessageDateTime>
        <bpssignal:ThisMessageDateTime>
            2024-03-01T16:19:10+01:00
        </bpssignal:ThisMessageDateTime>
        <bpssignal:FromPartyInfo type=”iso6523-actorid-upis”>
            0088:5790000201389
        </bpssignal:FromPartyInfo>
        <bpssignal:ToPartyInfo type=”iso6523-actorid-upis”>
            0088:5790000121526
        </bpssignal:ToPartyInfo>
        <bpssignal:CollaborationIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </bpssignal:CollaborationIdentifier>
    </bpssignal:ReceiptAcknowledgement>


<br>

### Receipt Exception ()

<br>

<img src="ehmiSBDH_ReceiptAckowledgementException.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/><br>

<br>

###### OriginalMessageIdentifier

<br>

As 7.4.3.1.1

<br>

###### OriginalDocumentIdentifier

As 7.4.3.1.2

<br>

###### OriginalMessageDateTime

As 7.4.3.1.3 

<br>

###### ThisMessageDateTime

As 7.4.3.1.4 

<br>

###### FromPartyInfo

As 7.4.3.1.5 

<br>

###### ToPartyInfo

As 7.4.3.1.6

<br>

###### ExceptionType

The content is generally defined as a ReceiptException, but beyond that it is the logic of the receiver's error handling mechanism that determines the content. Here exemplified from MedCom's Gateway service. Reason and ExceptionMessage follow the same logic.

    <bpssignal:ExceptionType>
        <bpssignal:ReceiptException>
            [Syntax]
        </bpssignal:ReceiptException>
    </bpssignal:ExceptionType>

ExceptionType example

    <bpssignal:ExceptionType>
        <bpssignal:ReceiptException>
            <GeneralException>101</GeneralException>
        </bpssignal:ReceiptException>
    </bpssignal:ExceptionType>

<br>

###### Reason

See ExceptionType

    <bpssignal:Reason>
        [Reason]
    </bpssignal:Reason>

Reason example

    <bpssignal:Reason>
        Internal error
    </bpssignal:Reason>

<br>

###### ExceptionMessage

See ExceptionType

    <bpssignal:ExceptionMessage>
        [ExceptionMessage]
    </bpssignal:ExceptionMessage>

ExceptionMessage example

    <bpssignal:ExceptionMessage>
        javax.xml.bind.UnmarshalException 
        - with linked exception:
        [org.xml.sax.SAXParseException; lineNumber: 7; columnNumber: 21; The end-tag for element type "ns3:Sender" must end with a '&gt;' delimiter.]
    </bpssignal:ExceptionMessage>

 
<br>

##### Overall EHMI Receipt Acknowledgement  Exception example

    <?xml version="1.0" encoding="UTF-8"?>
    <bpssignal:Exception xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        xmlns:bpssignal="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0 ">
        <bpssignal:OriginalMessageIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </bpssignal:OriginalMessageIdentifier>
        <bpssignal:OriginalDocumentIdentifier>
            urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation#urn:dk:medcom:fhir:homecareobservation:3.0
        </bpssignal:OriginalDocumentIdentifier>
        <bpssignal:OriginalMessageDateTime>
            2024-03-01T16:19:00+01:00
        </bpssignal:OriginalMessageDateTime>
        <bpssignal:ThisMessageDateTime>
            2024-03-01T16:19:10+01:00
        </bpssignal:ThisMessageDateTime>
        <bpssignal:FromPartyInfo type=”iso6523-actorid-upis”>
            0088:5790000201389
        </bpssignal:FromPartyInfo>
        <bpssignal:ToPartyInfo type=”iso6523-actorid-upis”>
            0088:5790000121526
        </bpssignal:ToPartyInfo>
        <bpssignal:CollaborationIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </bpssignal:CollaborationIdentifier>
            <bpssignal:ExceptionType>
        <bpssignal:ReceiptException>
            Syntax
        </bpssignal:ReceiptException>
        </bpssignal:ExceptionType>
        <bpssignal:Reason>
            XML Parsing Error: not well-formed
        </bpssignal:Reason>
        <bpssignal:ExceptionMessage>
            Element type "StandardBusinessDocumentHeader" must be followed by either attribute specifications, ">" or "/>".
        </bpssignal:ExceptionMessage>
    </bpssignal:Exception>

