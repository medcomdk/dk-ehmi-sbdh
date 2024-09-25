# ehmiSBDH

<br/>

## Introduction

<br/>

The EHMI Standard Business Document Header (ehmiSBDH) is a customized version of the PEPPOL SBDH.

It is developed to

- suit the direct messaging of clinical content in EHMI
- handle reliable messaging at the eDelivery network level like VANSenvelope in the VANS network
- handle the XDS Metadata that is needed when MedCom Messages are exchanged as “documents” in the XDS Framework
- serve the ground for EDS Delivery Status
- serve the ground for EHMI Statistics of message exchange

[TBD]

<br/>

## SBDH – General elements

### General

<br/>

The StandardBusinessDocumentHeader (SBDH) is an envelope specification issued by GS1 and profiled for use in PEPPOL. It is supported by eDelivery's Access Points (AP) according to the AS4 protocol. We follow the EHMI conventions, which are laid out in PEPPOL's profiling, but also extend it to be able to take care of the health area. However, SBDH is nothing without a surrounding container, called StandardBusinessDocument (SBD).

<br/>

### StandardBusinessDocument

<br/>

StandardBusinessDocument is, as mentioned, SBDH's surrounding container, and is a wrapper around SBDH, and contains only two elements:

- DefaultBusinessDocumentHeader
- BinaryContent (base64 encoded)

Although the StandardBusinessDocument, as such, is the envelope, the term SBDH is generally used for the entire envelope, since it is this content that is of particular interest in the message exchange. BinaryContent is the element that contains a base64-encoded message or acknowledgment for a sent SBDH.

<br/>

<img src="ehmiSBDH_Document.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

The content of SBDH is largely determined by how

- the same information is registered in EER
- the same information is registered in SMP
- the context is to NSP DokumentDelingService, DDS
- the context is for EHMI EnvelopeReceipt
- the same information is registered in EDS

<br/>

SBDH has a structure that is generally divided into the following elements:

-	HeaderVersion
-	Sender
-	Receiver
-	DocumentInformation
-	Manifest
-	BusinessScope

<br/>

#### SBDH for a MedCom Message and a MedCom Acknowledgement

<br/>

In an SBDH for a MedCom Message and a MedCom Acknowledgement, the following metadata can be included:

- General SBDH metadata
- Metadata for eDelivery general message communications
- Health Message Communication Metadata
- XDS Metadata for Document Sharing
- Metadata for Reliable messaging - BusinessService Request

<br/>

#### SBDH for an EHMI EnvelopeReceipt 

<br/>

In an SBDH for an EHMI EnvelopeReceipt there is the following metadata:

- General SBDH metadata
- Metadata for eDelivery general message communications
- Health Message Communication Metadata
- Metadata for Reliable messaging - BusinessService Response

<br/>

### SBDH – general fixed defined elements

<br/>

SBDH's general elements are illustrated in the figure below.

<br/>

<img src="ehmiSBDH_Header.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

BusinessScope has, however, been given its own chapter, as it differs significantly from the others. In the following, the general SBDH elements are presented for the provisionally 2 message types that EHMI operates with:

-	FHIR
-	EHMI EnvelopeReceipt 

Where applicable, the general elements will be divided into subsections that describe the path to the value of that element in the respective message types. Where most elements have a general focus on message exchange in general and the interaction with SMP, BusinessScope in particular gives a health-oriented imprint in the specification.

<br/>

#### HeaderVersion

<br/>

Always 

    <HeaderVersion>1.0</HeaderVersion>

<br/>

#### Sender

<br/>

Sender contains only the mandatory element Identifier.

<br/>

##### Identifier

<br/>

Contains the attribute Authority, which according to [Policy_identifiers], POLICY 6 Numeric Codes for Issuing Agencies, always has the value: "iso6523-actorid-upis"

Identifier represents GLN of sender where

- The value 0088: reflects that the type is GLN.
- The value after 0088: reflects the GLN number.

<br/>

    <Sender>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[GLN-number]
        </Identifier>
    </Sender>

<br/>

##### If the MedCom message is of type FHIR 

If the MedCom message is of type FHIR, then always in the following format:

<br/>

   <Sender>
        <Identifier Authority="iso6523-actorid-upis">    
            Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value
        </Identifier>
    </Sender>

<br/>

##### Sender example

<br/>

Regardless of the message type, it will always result in the following Sender/Identifier, where the value after 0088: will of course vary.

    <Sender>
        <Identifier Authority="iso6523-actorid-upis">
            0088:5790000121526
        </Identifier>
    </Sender>

<br/>

##### Receiver

<br/>

Receiver contains only the mandatory element Identifier.

<br/>

##### Identifier

<br/>

Contains the attribute Authority, which according to [Policy_identifiers], POLICY 6 Numeric Codes for Issuing Agencies, always has the value: "iso6523-actorid-upis"

Identifier represents GLN of sender where

- The value 0088: reflects that the type is GLN.
- The value after 0088: reflects the GLN number.

<br/>

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[GLN-number]
        </Identifier>
    </Receiver>' 

<br/>

##### If the MedCom message is of type FHIR 

<br/>

If the MedCom message is of type FHIR, then always in the following format:

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value]
        </Identifier>
    </Receiver>

<br/>

##### Receiver example:

<br/>

Regardless of the message type, it will always result in the following Receiver/Identifier, where the value after 0088: will of course vary.

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">0088:5790000201389    </Identifier>
    </Receiver>

<br/>

#### DocumentInformation

<br/>

##### Standard

EHMI operates with 4 types of standards, each of which has its own prefix according to the standard

- FHIR 
- ebxml
- OIOXML (described in a later version of the standard)
- Edifact (described in a later version of the standard)

<br/>

###### If the MedCom message is of type FHIR 

<br/>

If the MedCom message is of type FHIR, then always in the following format:

    <DocumentInformation>
        <Standard>
            [Bundle.entry[0].resource.event.as(Coding).code]
        </Standard>
    </DocumentInformation>

<br/>

Message example: 

<br/>

    <DocumentInformation>
        <Standard>homecareobservation-message</Standard>
    </DocumentInformation>

<br/>

###### If the MedCom message is of type EHMI EnvelopeReceipt

<br/>

Always 

<br/>

    <DocumentInformation>
        …
        <Standard>
            [bpssignal:ReceiptAcknowledgement@xmlns:bpssignal[standard]]
        </Standard>
        …
    </DocumentInformation>

<br/>

SBDH-envelope example:

<br/>

    <DocumentInformation>
        …
        <Standard>ebbp-signals</Standard>
        …
    </DocumentInformation>

<br/>

##### TypeVersion

<br/>

Is the contained message version on the form

<br/>

    <DocumentInformation>
        …
        <TypeVersion>[Path to the type version]</TypeVersion>
        …
    </DocumentInformation>

<br/>

###### If the MedCom message is of type FHIR 

<br/>

If the MedCom message is of type FHIR, then always in the following format:

    <DocumentInformation>
        …
        <TypeVersion>
            [Bundle.entry[0].resource.MessageHeader.definition[versionssuffiks]]
        </TypeVersion>
        …
    </DocumentInformation>

<br/>

Message example:

<br/>

    <DocumentInformation>
	    …
        <TypeVersion>1.0</TypeVersion>
        …
    </DocumentInformation>

<br/>

If the contained message is of type EHMI EnvelopeReceipt, always 

<br/>

    <DocumentInformation>
        …
        <TypeVersion>
            [bpssignal:ReceiptAcknowledgement@xmlns:bpssignal[version]]
        </TypeVersion>
        …
    </DocumentInformation>

<br/>

EHMI EnvelopeReceipt example:

<br/>

    <DocumentInformation>
        …
        <Type>ebbp-signals-2.0</Type>
        …
    </DocumentInformation>

<br/>

##### InstanceIdentifier 

<br/>

The InstanceIdentifier will be generated by the sending MSH and is regardless of whether a message or an EHMI EnvelopeReceipt is generated.

    <InstanceIdentifier>[generated UUID]</InstanceIdentifier>	

example:

<br/>

    <!-- [generated UUID] -->	
    <DocumentInformation>
    	…
        <InstanceIdentifier>b7faca8e-e908-47bb-b323-0eb8a854c558</InstanceIdentifier>
        …
    </DocumentInformation>

<br/>

##### Type

<br/>

Message:

<br/>

    <DocumentInformation>
        …
        <Type>[Message-starttag]</Type>
        …
    </DocumentInformation>

<br/>

###### If the MedCom message is of type FHIR 

<br/>

If the MedCom message is of type FHIR, then always in the following format:

    <DocumentInformation>
        …
        <Type>[Bundle]</Type>
        …
    </DocumentInformation>

<br/>

Message example:

<br/>

    <DocumentInformation>
        …
        <Type>Bundle</Type>
        …
    </DocumentInformation>

<br/>

###### If the message is of type EHMI EnvelopeReceipt:

<br/>

    <DocumentInformation>
        …
        <Type>[EnvelopeReceipt type]</Type>
        …
    </DocumentInformation>

<br/>

Receipt type has the following scope: Scope for these ebXML Business Process Signals is:

- ReceiptAcknowledgement
- ReceiptException
- AcceptanceAcknowledgement (NOTE! not used in the production pilot)

<br/>

EnvelopeReceipt example:

<br/>

    <DocumentInformation>
        …
        <Type>ReceiptAcknowledgement</Type>
        …
    </DocumentInformation>

<br/>

##### MultipleType

<br/>

Always false: 

<br/>

    <DocumentInformation>
        …
        <MultipleType>false</MultipleType>
        …
    </DocumentInformation>

<br/>

##### CreationDateAndTime

Always in this format: [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC]

<br/>

    <DocumentInformation>
        …
        <CreationDateAndTime>
            [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC] 
        </CreationDateAndTime>
        …
    </DocumentInformation>

<br/>

example:

<br/>

    <DocumentInformation>
        …
        <CreationDateAndTime>2024-03-01T16-19-00+01:00</CreationDateAndTime>
        …
    </DocumentInformation>

<br/>

##### DocumentInformation - aggregate message example

    <DocumentIdentification>
	    <Standard>homecareobservation-message</Standard>
	    <TypeVersion>1.0</TypeVersion>
        <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</InstanceIdentifier>
	    <Type>Bundle</Type>
	    <MultipleType>false</MultipleType>
	    <CreationDateAndTime>2024-03-01T16-19-00+01:00</CreationDateAndTime>
    </DocumentIdentification>

<br/>

##### DocumentInformation - aggregate EnvelopeReceipt example

<br/>

    <DocumentIdentification>
        <Standard>ebbp-signals</Standard>
	    <TypeVersion>ebbp-signals-2.0</TypeVersion>
	    <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dx</InstanceIdentifier>
	    <Type>ReceiptAcknowledgement</Type>
	    <MultipleType>false</MultipleType>
	    <CreationDateAndTime>2024-03-01T16-19-00+01:00</CreationDateAndTime>
    </DocumentIdentification>

<br/>

#### Manifest (deliberately omitted in the Production Pilot version) 

<br/>

## SBDH BusinessScopes 

SBDH BusinessScopes is the SBDH's name-value pair construction characterized by an identifier. Name is expressed by the Type element and value is expressed by the InstanceIdentifier. These two change for each scope, while the Identifier in the EHMI context is always the same: dk-medcom-messaging. In the following, they are reviewed in the logical contexts in which they appear.
<br/>

### BusinessScope for general eDelivery message communication

<br/>

#### In context of SMP 

In the eDelivery communication, the SBDH's Scope structure with the two types, DOCUMENTID and PROCESSID, is the direct relation to the SMP's DOCUMENTID and PROCESSID. Furthermore, the context also includes the elements already reviewed in the section on Receiver. In the following, precisely these two types of elements in the SBDH's overall BusinessScope structure are described. The scopes, DOCUMENTID and PROCESSID, are permanently defined scopes by PEPPOL, which ensure a unique relationship to SMP. DOCUMENTID and PROCESSID are used in EHMI with the same precision as in PEPPOL, so that consistency is ensured in how the values ​​are expressed across PEPPOL and EHMI. DOCUMENTID and PROCESSID are used by the APs together with recipient's Receiver/Identifier to look up recipient's eDelivery address in SMP with a unique response as a result.

<br/>

<img src="ehmiSBDH_BusinessScopesPeppol.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

#### DOCUMENTID

<br/>

The value in InstanceIdentifier is identical to the corresponding SMP record. The values ​​are taken from MedCom's standard catalog and are here represented by the values ​​that indicate the type of message. See bookmark: [DKEDEL_DT_CodeList]

<br/>

##### DOCUMENTID for MedCom FHIR Messages

<br/>

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:prod:messaging:medcom:fhir:structuredefinition:[Bundle/MessageHeader/eventCoding/code.value ]#urn:dk:medcom:fhir:[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

MedCom FHIR Message example 

<br/>

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation# urn:dk:medcom:fhir:homecareobservation:3.0
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### DOCUMENTID for EHMI EnvelopeReceipt

<br/>

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:prod:messaging:oasis:ebxml:schema:xsd:[bpps-signaltype]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

DOCUMENTID EHMI EnvelopeReceipt example:

<br/>

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
           urn:dk:healthcare:prod:messaging:oasis:ebxml:schema:xsd:SBDHReceiptAcknowledgement
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

#### PROCESSID

<br/>

The value in InstanceIdentifier is identical to the corresponding ProcessId SMP record. In the 4-corner model, the SDN emergency registration is also sent to the SMP, so that the sender's AP can look up the final receiver, also called the final recipient, correctly in the SMP.

    <Scope> 
        <Type>PROCESSID</Type> 
        <InstanceIdentifier>
            [Process Identifier value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

PROCESSID for SDN example

sdn-emergence is the InstanceIdentifier used to relate a message's emergence on SDN, SundhedsDataNettet.

<br/>

Always

    <Scope> 
	    <Type>PROCESSID</Type> 
        <InstanceIdentifier>sdn-emergence</InstanceIdentifier>
	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

### SBDH BusinessScope – health message communication

<br/>

#### Scope – message metadata - who

<br/>

<img src="ehmiSBDH_BusinessScopesMetadata.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

##### PATIENTID

The patient's Civil Registration Number, CPR, is included as an identifier for use in EDS Shipment status and XDS metadata.

<br/>

    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            [Bundle.entry.resource.ofType(Patient).identifier.where(system=’urn:oid:1.2.208.176.1.2’).value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

PATIENTID for MedCom FHIR messages - example:

    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            0101010227
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### SENDERID 

Sender's SOR identifier is used for EDS Shipment status. 

SENDERID for MedCom FHIR messages:

    <Scope>
	    <Type>SENDERID</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

SENDERID for MedCom FHIR messages - example:

    <Scope>
	    <Type>SENDERID</Type> 
	    <InstanceIdentifier>1170101</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### RECEIVERID 

Recipient's SOR identifier is used for EDS Shipment status. 

RECEIVERID for MedCom FHIR messages:

    <Scope>
	    <Type>RECEIVERID</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

RECEIVERID for MedCom FHIR messages - example:

    <Scope>
	    <Type>RECEIVERID</Type> 
	        <InstanceIdentifier>1170102</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

#### Scope – message metadata - what

<br/>

<img src="ehmiSBDH_BusinessScopesMetadata.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

##### MESSAGEIDENTIFIER

MESSAGEIDENTIFIER is the MessageHeader.id of the contained message, i.a. for use in collection of EDS shipping status. 

    <Scope>
	    <Type>MESSAGEIDENTIFIER</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.id]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>


MESSAGEIDENTIFIER example:

    <Scope>
	    <Type>MESSAGEIDENTIFIER</Type> 
        <InstanceIdentifier>f06c1ac8-6096-5178-a380-2831d2456986</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

###### If the MedCom message is of type EHMI EnvelopeReceipt

    <Scope>
	    <Type>MESSAGEIDENTIFIER</Type> 
	    <InstanceIdentifier>
            [generated]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>


MESSAGEIDENTIFIER example:

    <Scope>
	    <Type>MESSAGEIDENTIFIER</Type> 
        <InstanceIdentifier>
            f06c1ac8-6096-5178-a380-2831d2456986 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

###### MESSAGEENVELOPEIDENTIFIER

MESSAGEENVELOPEIDENTIFIER is the contained message's Bundle.id, i.a. for use in collection of EDS shipping status. 

    <Scope>
	    <Type>MESSAGEENVELOPEIDENTIFIER</Type> 
        <InstanceIdentifier>
            [Bundle.id]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

MESSAGEENVELOPEIDENTIFIER example:
    
    <Scope>
	    <Type>MESSAGEENVELOPEIDENTIFIER</Type> 
        <InstanceIdentifier>
            f06c1ac8-6096-5178-a380-2831d2456986
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### ORIGINALMESSAGEIDENTIFIER

ORIGINAL MESSAGE IDENTIFIER is the MESSAGE IDENTIFIER of the original contained message, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

    <Scope>
	    <Type>ORIGINALMESSAGEIDENTIFIER</Type> 
	    <InstanceIdentifier>
        Den originale meddelelses InstanceIdentifier
        [SBD/SBDH/BusinessScope/Scope[MESSAGEIDENTIFIER]/InstanceIdentifier.value]
        </InstanceIdentifier>
         <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGEIDENTIFIER example:

    <Scope>
	    <Type>ORIGINALMESSAGEIDENTIFIER</Type> 
        <InstanceIdentifier>
            f06c1ac8-6096-5178-a380-2831d2456986
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### ORIGINALMESSAGEENVELOPEIDENTIFIER

The ORIGINAL MESSAGEENVELOPEIDENTIFIER is the contained message's Bundle.id, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

    <Scope>
	    <Type>ORIGINALMESSAGEENVELOPEIDENTIFIER</Type> 
	    <InstanceIdentifier>
            [Bundle.id]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGEENVELOPEIDENTIFIER example:

    <Scope>
	    <Type>ORIGINALMESSAGEENVELOPEIDENTIFIER</Type> 
        <InstanceIdentifier>
            f06c1ac8-6096-5178-a380-2831d2456986
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### ORIGINALMESSAGESTANDARD

ORIGINAL MESSAGE STANDARD is the original contained message standard, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

    <Scope>
	    <Type>ORIGINALMESSAGESTANDARD</Type> 
	    <InstanceIdentifier>
            Den originale meddelelsesstandard [SBD/SBDH/DocumentInformation/Standard.value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGESTANDARD example:

    <Scope>
	    <Type>ORIGINALMESSAGESTANDARD</Type> 
    <InstanceIdentifier>homecareobservation-message</InstanceIdentifier>
     <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### ORIGINALMESSAGEVERSION

ORIGINAL MESSAGE VERSION is the version of the original contained message, i.a. for use in collection of EDS shipping status. 

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

    <Scope>
	    <Type>ORIGINALMESSAGEVERSION</Type> 
	    <InstanceIdentifier>
            [SBD/SBDH/DocumentInformation/TypeVersion.value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>


ORIGINALMESSAGEVERSION example:

    <Scope>
	    <Type>ORIGINALMESSAGEVERSION</Type> 
        <InstanceIdentifier> 
            [SBD/SBDH/DocumentInformation/TypeVersion.value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### ORIGINALENVELOPEIDENTIFIER

The ORIGINALENVELOPEIDENTIFIER is the original SBDH envelopes InstanceIdentifier, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

    <Scope>
	    <Type>ORIGINALENVELOPEIDENTIFIER</Type> 
	    <InstanceIdentifier>
            [SBD/SBDH/DocumentInformation/InstanceIdentifier.value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALENVELOPEIDENTIFIER example:
    
    <Scope>
	    <Type>ORIGINALMESSAGEIDENTIFIER</Type> 
        <InstanceIdentifier>
            f06c1ac8-6096-5178-a380-2831d2456986
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

### SBDH BusinessScope – XDS-Metadata

<br/>

<img src="ehmiSBDH_BusinessScopesXdsMetadata.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

#### Document sharing XDS-Metadata

The following reflects the DokumentDelingsServicen on NSP's needs for XDS metadata. This scope type is set on the exchange with the document sharing services.

This scope only applies to MedCom messages, not MedCom receipts, as they are not shared via the Document Sharing Service.

This scope does not apply to the primary exchange between Sender and Receiver.

<br/>

#### SBDH BusinessScope/Scope for XDS-Metadata

Always FHIR DocumentReference for the relevant message type with associated variables to be able to identify e.g. patient and organization

    <Scope>
	    <Type>XDS-METADATA</Type> 
	        <InstanceIdentifier>
                <[CDATA: <DocumentReference> [DocumentReference-structure] </DocumentReference>]>
            </InstanceIdentifier>
	    <Identifier>dk-medcom-DocumentReference</Identifier>
    </Scope>

<br/>

#### XDS-Metadata (example på encoded value)

[TBD]

<br/>

### SBDH BusinessScope – Reliable messaging 

Reliable messaging is triggered by a request for the degree of reliable messaging desired from the sender, which is done using SBDH's BusinessService in the BusinessScope element.

When the sender has made a request for Reliable messaging and thus the use of EHMI EnvelopeReceipts, these are handled using ebXML Business Process Signals (ebBP Signals 2.0.4).

Outcome spaces for these ebXML Business Process Signals are:

- ReceiptAcknowledgement
- ReceiptException
- AcceptanceAcknowledgement (currently not used in the Production Pilot)

Two structures are used

- Reliable messaging - Business Service request
- Reliable messaging - BusinessService response

Both are built around SBDH's BusinessScope/Scope element.

In connection with requirements related to on Reliable messaging, the structure in BusinessScope called BusinessService is used to design which type of SBDH transactions the recipient of the original SBDH envelope must fulfill.

CorrelationInformation is used to tie a message and its receipt together. All elements of CorrelationInformation are generated by the sending SBDH-MSH. Recipient of SBDH and sender of SBDH ReceiptAcknowledgement must acknowledge the elements RequestingDocumentCreationDateTime and RequestingDocumentInstanceIdentifier by indicating the CorrelationInformation. An EHMI EnvelopeReceipt is never acknowledged.


<br/>

#### Reliable messaging - BusinessService Request

<br/>

<img src="ehmiSBDH_ReceiptAckowledgementRequest.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

I det følgende er dette sat op som det ønskes i piloten.

<br/>

##### EHMI-SBDH-ReceiptAcknowledgement- - Request

I et EHMI-SBDH-ReceiptAcknowledgement- - Request er scope Always dette:
    <Scope>
	    <Type>EHMI-SBDH-ReceiptAcknowledgement</Type>
	    <InstanceIdentifier>Request</InstanceIdentifier>
 	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### CorrelationInformation 

Ifm. reliable messaging bruges SBDH’ens CorrelationInformation til at binde original SBDH og kvitterings SBDH sammen. Her anvendes specielt RequestingDocument InstanceIdentifier

<br/>

###### CorrelationInformation RequestingDocumentCreationDateTime

RequestingDocumentCreationDateTime er tidspunktet for original meddelelsens afsendelse = DocumentIdentification/CreationDateAndTime

    <CorrelationInformation>
	    <RequestingDocumentCreationDateTime>
            [YYYY-MM-DD]T[TT-MM-SS]+[offset to UTC]
        </RequestingDocumentCreationDateTime>
        …
    <CorrelationInformation>

example:

    <CorrelationInformation>
        <RequestingDocumentCreationDateTime>
            2021-02-17T09:30:10+01:00
        </RequestingDocumentCreationDateTime>
        …
    <CorrelationInformation>

<br/>

###### CorrelationInformation RequestingDocumentInstanceIdentifier

RequestingDocumentInstanceIdentifier er originalkuvertens identifier = DocumentIdentification/InstanceIdentifier

    <CorrelationInformation>
        …
        <RequestingDocumentInstanceIdentifier>
            RequestingSBDH/DocumentIdentification/InstanceIdentifier
        </RequestingDocumentInstanceIdentifier>
        …
    <CorrelationInformation>

example:

    <CorrelationInformation>
        …
		<RequestingDocumentInstanceIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </RequestingDocumentInstanceIdentifier>
        …
    <CorrelationInformation>

<br/>

###### CorrelationInformation ExpectedResponseDateTime

ExpectedResponseDateTime udtrykker den forventede tid, der max går indtil en SBDH  response modtages. I piloten giver den 10 min, dvs. RequestingDocumentCreationDateTime + 10 min

    <CorrelationInformation>
        …
        <ExpectedResponseDateTime>
            [YYYY-MM-DD]T[TT-MM-SS]+[offset to UTC]
        </ExpectedResponseDateTime>
    <CorrelationInformation>

example:

    <CorrelationInformation>
        …
        <ExpectedResponseDateTime>
            2021-02-17T09:40:10+01:00
        </ExpectedResponseDateTime>
    <CorrelationInformation>

<br/>

##### CorrelationInformation samlet example

    <CorrelationInformation>
	    <RequestingDocumentCreationDateTime>
            2021-02-17T09:30:10+01:00
        </RequestingDocumentCreationDateTime>
	    <RequestingDocumentInstanceIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </RequestingDocumentInstanceIdentifier>
	    <ExpectedResponseDateTime>
            2021-02-17T09:40:10+01:00
        </ExpectedResponseDateTime>
    </CorrelationInformation>

<br/>

##### SBDH BusinessServices - Request

<br/>

###### BusinessServiceName

Always 

    <BusinessServiceName>
        EHMI-SBDH-ReceiptAcknowledgement-Request
    </BusinessServiceName>

<br/>

###### ServiceTransaction – TypeOfServiceTransaction

    TypeOfServiceTransaction=”RequestingServiceTransaction”

<br/>

###### ServiceTransaction – IsNonRepudiationRequired

    IsNonRepudiationRequired=”false” 

<br/>

###### ServiceTransaction – IsAuthenticationRequired

    IsAuthenticationRequired=”false” 

<br/>

###### ServiceTransaction – IsNonRepudiationOfReceiptRequired

    IsNonRepudiationOfReceiptRequired=”false” 

<br/>

###### ServiceTransaction – IsIntelligibleCheckRequired

    IsIntelligibleCheckRequired=”false” 

<br/>

###### ServiceTransaction – IsApplicationErrorResponseRequested
    
    IsApplicationErrorResponseRequested=”false” 

<br/>

###### ServiceTransaction – TimeToAcknowledgeReceipt

    TimeToAcknowledgeReceipt=”600000” (ms)

<br/>

###### ServiceTransaction – TimeToAcknowledgeAcceptance

    TimeToAcknowledgeAcceptance=”0” (=bruges pt ikke)

<br/>

###### 0	ServiceTransaction – TimeToPerform

    TimeToPerform=”0” (=bruges pt ikke)

<br/>

###### ServiceTransaction – Recurrence

    Recurrence=”0” (=bruges pt ikke)

<br/>

##### SBDH BusinessServices - Request example

    <BusinessService>
        <BusinessServiceName>
            EHMI-SBDH-ReceiptAcknowledgement-Request
        </BusinessServiceName>
        <ServiceTransaction 
            TypeOfServiceTransaction=”RequestingServiceTransaction”, 
            IsNonRepudiationRequired=”false”, 
            IsAuthenticationRequired=”false”, 
            IsNonRepudiationOfReceiptRequired=”false”, 
            IsIntelligibleCheckRequired=”false”, 
            IsApplicationErrorResponseRequested=”false”, 
            TimeToAcknowledgeReceipt=”600000”, 
            TimeToAcknowledgeAcceptance=”0”, 
            TimeToPerform=”0”, 
            Recurrence=”0”/>
    </BusinessService>

<br/>

##### Reliable messaging - BusinessService Request samlet example

    <BusinessScope>
        <Scope>
            <Type>EHMI-SBDH-ReceiptAcknowledgement</Type>
            <InstanceIdentifier>Request</InstanceIdentifier>
            <Identifier>dk-medcom-messaging</Identifier>
            <CorrelationInformation>
                <RequestingDocumentCreationDateTime>
                    2021-02-17T09:30:10+01:00
                </RequestingDocumentCreationDateTime>
                <RequestingDocumentInstanceIdentifier>
                    9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
                </RequestingDocumentInstanceIdentifier>
                <ExpectedResponseDateTime>
                    2021-02-17T09:40:10+01:00
                </ExpectedResponseDateTime>
            </CorrelationInformation>
            <BusinessService>
                <BusinessServiceName>
                    EHMI-SBDH-ReceiptAcknowledgement-Request
                </BusinessServiceName>
                <ServiceTransaction 
                    TypeOfServiceTransaction=”RequestingServiceTransaction”, 
                    IsNonRepudiationRequired=”false”, 
                    IsAuthenticationRequired=”false”, 
                    IsNonRepudiationOfReceiptRequired=”false”, 
                    IsIntelligibleCheckRequired=”false”, 
                    IsApplicationErrorResponseRequested=”false”, 
                    TimeToAcknowledgeReceipt=”300000”, 
                    TimeToAcknowledgeAcceptance=”0”, 
                    TimeToPerform=”0”, 
                    Recurrence=”0”/>
            </BusinessService>
        </Scope>
        …
    </BusinessScope>
 
<br/>

#### Reliable messaging - BusinessService Response

<br/>

<img src="ehmiSBDH_ReceiptAckowledgementResponse.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

I det følgende er dette sat op som det ønskes i piloten.

<br/>

##### EHMI-SBDH-ReceiptAcknowledgement - Response

I et EHMI-SBDH-ReceiptAcknowledgement - Response er scope Always dette:

    <Scope>
	    <Type>EHMI-SBDH-ReceiptAcknowledgement</Type>
	    <InstanceIdentifier>Response</InstanceIdentifier>
 	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### CorrelationInformation 

Ifm. reliable messaging bruges SBDH’ens CorrelationInformation til at binde original SBDH og kvitterings SBDH sammen. Her anvendes specielt RequestingDocumentInstanceIdentifier

<br/>

##### CorrelationInformation RequestingDocumentCreationDateTime

RequestingDocumentCreationDateTime er tidspunktet for originalkuvertens afsendelse = RequestingSBDH/RequestingDocumentCreationDateTime

    <CorrelationInformation>
		    <RequestingDocumentCreationDateTime>
[YYYY-MM-DD]T[TT-MM-SS]+[offset to UTC]
    </RequestingDocumentCreationDateTime>
    …
    <CorrelationInformation>

<br/>

##### RequestingDocumentCreationDateTime example

    <CorrelationInformation>
		    <RequestingDocumentCreationDateTime>
2021-02-17T09:30:10+01:00
    </RequestingDocumentCreationDateTime>
…
    <CorrelationInformation>

<br/>

##### CorrelationInformation RequestingDocumentInstanceIdentifier

RequestingDocumentInstanceIdentifier er originalkuvertens identifier = RequestingSBDH/RequestingDocumentInstanceIdentifier

    <CorrelationInformation>
…
    <RequestingDocumentInstanceIdentifier>
RequestingSBDH/RequestingDocumentInstanceIdentifier
    </RequestingDocumentInstanceIdentifier>
…
    <CorrelationInformation>

<br/>

##### RequestingDocumentInstanceIdentifier example

    <CorrelationInformation>
…
	    <RequestingDocumentCreationDateTime>
9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
    </RequestingDocumentCreationDateTime>
…
    <CorrelationInformation>

<br/>

##### CorrelationInformation ExpectedResponseDateTime

ExpectedResponseDateTime udelades i en SBDH ReceiptAcknowledgement

<br/>

##### CorrelationInformation samlet example

    <CorrelationInformation>
	    <RequestingDocumentCreationDateTime>
            2021-02-17T09:30:10+01:00
        </RequestingDocumentCreationDateTime>
	    <RequestingDocumentInstanceIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </RequestingDocumentInstanceIdentifier>
    </CorrelationInformation>

<br/>

##### SBDH BusinessServices - Response

<br/>

###### BusinessServiceName

Always 

    <BusinessServiceName>
        EHMI-SBDH-ReceiptAcknowledgement-Response
    </BusinessServiceName>

<br/>

###### ServiceTransaction – TypeOfServiceTransaction

Always
    TypeOfServiceTransaction=”RespondingServiceTransaction”

<br/>

###### ServiceTransaction – IsNonRepudiationRequired

Always

    IsNonRepudiationRequired=”false” 

<br/>

###### ServiceTransaction – IsAuthenticationRequired

Always

    IsAuthenticationRequired=”false” 

<br/>

###### ServiceTransaction – IsNonRepudiationOfReceiptRequired

Always

    IsNonRepudiationOfReceiptRequired=”false” 

<br/>

###### ServiceTransaction – IsIntelligibleCheckRequired

Always
    IsIntelligibleCheckRequired=”false” 

<br/>

###### ServiceTransaction – IsApplicationErrorResponseRequested

Always
    IsApplicationErrorResponseRequested=”false” 

<br/>

###### ServiceTransaction – TimeToAcknowledgeReceipt

Always
    TimeToAcknowledgeReceipt=”0” (ms)

<br/>

###### ServiceTransaction – TimeToAcknowledgeAcceptance

Always

    TimeToAcknowledgeAcceptance=”0” (=bruges pt ikke)

<br/>

###### 0	ServiceTransaction – TimeToPerform

Always
    TimeToPerform=”0” (=bruges pt ikke)

<br/>

###### ServiceTransaction - Recurrence

Always
    Recurrence=”0” (=bruges pt ikke)

<br/>

###### SBDH BusinessServices - Response example

    <BusinessService>
        <BusinessServiceName>
            EHMI-SBDH-ReceiptAcknowledgement-Response
        </BusinessServiceName>
        <ServiceTransaction 
            TypeOfServiceTransaction=”RequestingServiceTransaction”, IsNonRepudiationRequired=”false”, 
            IsAuthenticationRequired=”false”, IsNonRepudiationOfReceiptRequired=”false”, IsIntelligibleCheckRequired=”false”, IsApplicationErrorResponseRequested=”false”, TimeToAcknowledgeReceipt=”600000 ”, 
            TimeToAcknowledgeAcceptance=”0”, 
            TimeToPerform=”0”, 
            Recurrence=”0”/>
    </BusinessService>

<br/>

###### Reliable messaging - BusinessService Response samlet example
    
    <BusinessScope>
        <Scope>
            <Type>EHMI-SBDH-ReceiptAcknowledgement</Type>
            <InstanceIdentifier>Response</InstanceIdentifier>
            <Identifier>dk-medcom-messaging</Identifier>
        <CorrelationInformation>
            <RequestingDocumentCreationDateTime>
                2021-02-17T09:30:10+01:00
            </RequestingDocumentCreationDateTime>
            <RequestingDocumentInstanceIdentifier>
                9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
            </RequestingDocumentInstanceIdentifier>
        </CorrelationInformation>
        <BusinessService>
            <BusinessServiceName>
                EHMI-SBDH-ReceiptAcknowledgement-Response
            </BusinessServiceName>
            <ServiceTransaction 
                TypeOfServiceTransaction=”RespondingServiceTransaction”, IsNonRepudiationRequired=”false”, 
                IsAuthenticationRequired=”false”, IsNonRepudiationOfReceiptRequired=”false”, IsIntelligibleCheckRequired=”false”, IsApplicationErrorResponseRequested=”false”, TimeToAcknowledgeReceipt=”0”, 
                TimeToAcknowledgeAcceptance=”0”, 
                TimeToPerform=”0”, 
                Recurrence=”0”/>
            </BusinessService>
            </Scope>
        …
    </BusinessScope>

<br/>

#### SBDH ReceiptAcknowledgement

<br/>

SBDH ReceiptAcknowledgement anvendes som positiv transportkvittering, og for at modtager af kvitteringen nemt kan korrelere message med originalkuverten, kan modtager checke på hhv. 
•	Sender
    - Identifier (GLN-number for afsender) 
•	Receiver
    - Identifier (GLN-number for modtager) 
•	Scope
    - SENDERID (SORID for afsender)
    - RECEIVERID (SORID for modtager)
    - CorrelationInformation

	RequestingDocumentInstanceIdentifier

Indlejret i en SBDH ReceiptAcknowledgement er også en ebBP-signal, som i princippet indeholder de samme informationer, men som det ikke er nødvendigt at checke, når det er en ReceiptAcknowledgement.

<br/>

<img src="ehmiSBDH_ReceiptAckowledgement.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

The Receipt Acknowledgement Business Signal signals that a message has been properly received by the Receiver MSH software component. Legible means that it has passed structure/schema validity check. The content of the receipt and the legibility of a business message MUST be reviewed prior to the processing of the Requesting or Responding Business Document or the evaluation of condition expressions in the message's Business Documents or Document Envelope. Condition Expressions are expressions that evaluate to true or false. [ebXMLbp] 

<br/>

###### OriginalMessageIdentifier

Samme datatype som SBDH.DocumentIdentification.InstanceIdentifier

    <bpssignal:OriginalMessageIdentifier>
        [RequestingSBDH/DocumentIdentification/InstanceIdentifier]
    </bpssignal:OriginalMessageIdentifier>		

OriginalMessageIdentifier example
    
    <bpssignal:OriginalMessageIdentifier>
        9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc
    </bpssignal:OriginalMessageIdentifier>		

<br/>

###### OriginalDocumentIdentifier

Samme datatype som SBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier

    <bpssignal:OriginalDocumentIdentifier>
        [RequestingSBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier]
    </bpssignal:OriginalDocumentIdentifier>

OriginalDocumentIdentifier example

    <bpssignal:OriginalDocumentIdentifier>
        urn:dk:healthcare:prod:messaging:medcom: fhir:structuredefinition:[Bundle/MessageHeader/eventCoding/code.value ]#urn:dk:medcom:fhir:[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
    </bpssignal:OriginalDocumentIdentifier>

<br/>

###### OriginalMessageDateTime

Always in this format: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC] 

    <bpssignal:OriginalMessageDateTime>
        [RequestingSBDH/DocumentIdentification/CreationDateAndTime]
    </bpssignal:OriginalMessageDateTime>

OriginalMessageDateTime example

    <bpssignal:OriginalMessageDateTime>
        2024-03-01T16:19:00+01:00
    </bpssignal:OriginalMessageDateTime>

<br/>

###### ThisMessageDateTime

Always in this format: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC]

    <bpssignal:ThisMessageDateTime>
        [RespondingSBDH.DocumentIdentification.CreationDateAndTime]
    </bpssignal:ThisMessageDateTime>

ThisMessageDateTime example

    <bpssignal:ThisMessageDateTime>
        2024-03-01T16:19:10+01.00
    </bpssignal:ThisMessageDateTime>

<br/>

###### FromPartyInfo
 
    <bpssignal:FromPartyInfo type=[RequestingSBDH:Receiver.Identifier@Authority]>
        [RequestingSBDH:Receiver.Identifier]
    </bpssignal:FromPartyInfo>

FromPartyInfo example

    <bpssignal:FromPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000201389
    </bpssignal:FromPartyInfo>

<br/>

###### ToPartyInfo

    <bpssignal:ToPartyInfo type=[RequestingSBDH:Sender.Identifier@Authority]>
        [RequestingSBDH:Sender.Identifier]
    </bpssignal:ToPartyInfo> 

ToPartyInfo example

    <bpssignal:ToPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000121526
    </bpssignal:ToPartyInfo>

 
<br/>

##### Samlet SBDH ReceiptAcknowledgement example

    <bpssignal:ReceiptAcknowledgement xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:bpssignal="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0 http://docs.oasis-open.org/ebxml-bp/2.0.4/ebbp-signals-2.0.4.xsd">
        <bpssignal:OriginalMessageIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </bpssignal:OriginalMessageIdentifier>
        <bpssignal:OriginalDocumentIdentifier>
            urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation# urn:dk:medcom:fhir:homecareobservation:3.0
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


<br/>

#### Receipt Exception

<br/>

A  Receipt Exception signals an error condition in the management of a Business Transaction. This Business Signal is returned to the initiating activity that originated the request. This exception MUST terminate the Business Transaction. These errors deal with the mechanisms of message exchange such as verification, validation, authentication, and authorization and will occur up to message acceptance. Typically, the rules and constraints applied to the message will have only dealt with the well-formedness of the message.

A receipt exception terminates the Business Transaction. The following are receipt exceptions:
•	Syntax exceptions. There is invalid punctuation, vocabulary or grammar in the Business Document or Business Signal. 
•	Authorization exceptions. Roles are not authorized to participate in the BTA. Note that the receiving BSI can only identify this exception.
•	Signature exceptions. Business Documents are not signed for non-repudiation when required.
•	Sequence exceptions. The order or type of a Business Document or Business Signal is incorrect.

A Receipt Exception typical signals an error condition in a Business Activity which requires a transaction to be terminated, i.e. receipt of a business message with a Business Document that has failed. (From [ebXMLbp] page 77)

<br/>

<img src="ehmiSBDH_ReceiptAckowledgementException.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

###### OriginalMessageIdentifier

<br/>

Som 7.4.3.1.1

<br/>

###### OriginalDocumentIdentifier

Som 7.4.3.1.2

<br/>

###### OriginalMessageDateTime

Som 7.4.3.1.3 

<br/>

###### ThisMessageDateTime

Som 7.4.3.1.4 

<br/>

###### FromPartyInfo

Som 7.4.3.1.5 

<br/>

###### ToPartyInfo

Som 7.4.3.1.6

<br/>

###### ExceptionType

Indholdet defineres overordnet som en ReceiptException, men derudover er det modtagerens fejlhåndteringsmekanismes logik, der bestemmer indholdet. Her eksemplificeret fra MedComs Gateway service. Reason og ExceptionMessage følger samme logik.

    <bpssignal:ExceptionType>
        <bpssignal:ReceiptException>
            [Syntax]
        </bpssignal:ReceiptException>
    </bpssignal:ExceptionType>

ExceptionType example

    <bpssignal:ExceptionType>
        <bpssignal:ReceiptException>
            <GeneralException>101    </GeneralException>
        </bpssignal:ReceiptException>
    </bpssignal:ExceptionType>

<br/>

###### Reason

Se ExceptionType

    <bpssignal:Reason>
        [Reason]
    </bpssignal:Reason>

Reason example

    <bpssignal:Reason>
        Internal error
    </bpssignal:Reason>

<br/>

###### ExceptionMessage

Se ExceptionType
    <bpssignal:ExceptionMessage>
        [ExceptionMessage]
    </bpssignal:ExceptionMessage>

ExceptionMessage example

    <bpssignal:ExceptionMessage>
        javax.xml.bind.UnmarshalException 
        - with linked exception:
        [org.xml.sax.SAXParseException; lineNumber: 7; columnNumber: 21; The end-tag for element type "ns3:Sender" must end with a '&gt;' delimiter.]
    </bpssignal:ExceptionMessage>

 
<br/>

##### Samlet Receipt Acknowledgement  Exception example

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
            urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation# urn:dk:medcom:fhir:homecareobservation:3.0
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
 

<br/>

## SBDH BinaryContent – den indeholdte message

<br/>

BinaryContent er en SBDH 1.2 udvidelse, der giver mulighed for at wrappe specifikt indhold i SBDH og base64-encode det. MimeType tydeliggør indholdet, og hvad modtager kan forvente af base64-decodingen.
Udfaldsrum for mimeType er:
-	text/xml
-	text/edi
-	fhir/xml
-	fhir/json

    <BinaryContent xmlns="http://peppol.eu/xsd/ticc/envelope/1.0" mimeType=[mimeType] encoding=[encoding]>
[base64-encoded indhold]
    <BinaryContent>

Encoding vil i piloten have følgende udfaldsrum for MedCom meddelelserne, som alle er OIOXML:
-	"UTF-8"
-	”ISO-8859-1”

Encoding vil i piloten have følgende udfaldsrum for ReceiptAcknowledgement og ReceiptException:
-	"UTF-8"

## SBDH xsd schemas

<br/>

Alle SBDH xsd-filer kan findes via [download-siden](downloads.html), men et overblik over, hvad de vigtigst indeholder kan ses her:

(all files opens in new window)
<br/>

- <a href="https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH_StandardBusinessDocumentHeader.xsd.html" target="_blank">Ehmi SBDH StandardBusinessDocumentHeader Xsd</a>
- <a href="https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH_Partner.xsd.html" target="_blank">Ehmi SBDH Partner Xsd</a>
- <a href="https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH_DocumentIdentification.xsd.html" target="_blank">Ehmi SBDH DocumentIdentification Xsd</a>
- <a href="https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH_BusinessScope.xsd.html" target="_blank">Ehmi SBDH BusinessScope Xsd</a>
- <a href="https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH_BinaryContentType.xsd.html" target="_blank">Ehmi SBDH BinaryContentType Xsd</a>
- <a href="https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH_ebbp-signals-2.0.4.xsd.html" target="_blank">Ehmi SBDH Ebbp-Signals 2.0.4 Xsd</a>

<br/>

