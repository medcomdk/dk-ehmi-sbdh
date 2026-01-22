# ehmiSbdhprofile of Standard Business Document Header 

## ehmiSbdh– General elements

The StandardBusinessDocumentHeader (SBDH) is an envelope specification issued by GS1 and profiled for use in PEPPOL. It is supported by eDelivery's Access Points (AP) according to the AS4 protocol. We follow the conventions, which are laid out in PEPPOL's profiling, but also we are extending it to be able to take care of the health area. However, ehmiSBDH is nothing without a surrounding container, called StandardBusinessDocument (SBD).


### StandardBusinessDocument


StandardBusinessDocument is, as mentioned, SBDH's surrounding container, and is a wrapper around SBDH, and contains only two elements:

- StandardBusinessDocumentHeader
- BinaryContent (base64 encoded)

Although the StandardBusinessDocument, as such, is the envelope, the term ehmiSBDH is generally used for the entire envelope, since it is this content that is of particular interest in the message exchange. BinaryContent is the element that contains a base64-encoded message or Acknowledgement for a sent SBDH.


<!--img src="ehmiSBDH_Document.png" alt="EHMI StandardBusinessDocument" /><br/-->
<img src="ClassSbdBasic.png" alt="EHMI StandardBusinessDocument" style="width:50%;height:auto;margin-left:25%; margin-right:25%; margin-top:30px; margin-bottom:30px;"/>

The content of ehmiSBDH is largely determined by how

- the same information is registered in EER
- the same information is registered in SMP
- the context is to NSP DokumentDelingService, DDS
- the context is for ehmiSBDH EnvelopeReceipt
- the same information is registered in EDS


ehmiSBDH has a structure that is generally divided into the following elements:

-	HeaderVersion
-	Sender
-	Receiver
-	DocumentInformation
-	Manifest
-	BusinessScope


#### ehmiSBDH for a MedcomMessagingMessage and a MedCom Acknowledgement

In an ehmiSBDH for a MedCom Message and a MedCom Acknowledgement, the following metadata can be included:

- General ehmiSBDH metadata
- Metadata for eDelivery general message communications
- Health Message Communication Metadata
- XDS Metadata for Document Sharing
- Metadata for MedCom Statistics
- Metadata for Reliable messaging - BusinessService Request


#### ehmiSBDH for an ehmiSBDH EnvelopeReceipt 

In an ehmiSBDH for an ehmiSBDH EnvelopeReceipt there is the following metadata:

- General ehmiSBDH metadata
- Metadata for eDelivery general message communications
- Health Message Communication Metadata
- Metadata for MedCom Statistics
- Metadata for Reliable messaging - BusinessService Response


### ehmiSbdh– general fixed elements

SBDH's general elements are illustrated in the figure below.


<!--img src="ehmiSBDH_Header.png" alt="EHMI StandardBusinessDocument" /><br/-->
<img src="ClassSbdhBasic.png" alt="EHMI StandardBusinessDocument"  style="width:80%;height:auto;margin-left:0%; margin-right:20%; margin-top:30px; margin-bottom:30px;"/>

BusinessScope has, however, been given its own chapter, as it differs significantly from the others. In the following, the general ehmiSBDH-elements are presented for the provisionally 2 message types that EHMI operates with:

-	FHIR
-	ehmiSBDH EnvelopeReceipt 

Where applicable, the general elements will be divided into subsections that describe the path to the value of that element in the respective message types. Where most elements have a general focus on message exchange in general and the interaction with SMP, BusinessScope in particular gives a health-oriented imprint in the specification.


#### HeaderVersion

Always 

    <HeaderVersion>1.0</HeaderVersion>


#### Sender


ehmiSbdhSender contains only the mandatory element Identifier.
 

##### Identifier


Contains the attribute Authority, which according to [Policy_identifiers], POLICY 6 Numeric Codes for Issuing Agencies, always has the value: "iso6523-actorid-upis"

Identifier represents GLN of sender where

- The value 0088: reflects that the type is GLN.
- The value after 0088: reflects the GLN number.


    <Sender>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[GLN-number]
        </Identifier>
    </Sender>


##### If the MedCom Message is of type FHIR 

If the MedCom Message is of type FHIR, then always in the following format:


   <Sender>
        <Identifier Authority="iso6523-actorid-upis">    
            Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value
        </Identifier>
    </Sender>


##### Sender example


Regardless of the message type, it will always result in the following Sender/Identifier, where the value after 0088: will of course vary.

    <Sender>
        <Identifier Authority="iso6523-actorid-upis">
            0088:5790000121526
        </Identifier>
    </Sender>


##### Receiver


ehmiSbdhReceiver contains only the mandatory element Identifier.


##### Identifier


Contains the attribute Authority, which according to [Policy_identifiers], POLICY 6 Numeric Codes for Issuing Agencies, always has the value: "iso6523-actorid-upis"

Identifier represents GLN of sender where

- The value 0088: reflects that the type is GLN.
- The value after 0088: reflects the GLN number.


    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[GLN-number]
        </Identifier>
    </Receiver>' 


##### If the MedCom Message is of type FHIR 


If the MedCom Message is of type FHIR, then always in the following format:

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value]
        </Identifier>
    </Receiver>


##### Receiver example:


Regardless of the message type, it will always result in the following Receiver/Identifier, where the value after 0088: will of course vary.

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">0088:5790000201389    </Identifier>
    </Receiver>


#### DocumentInformation


##### Standard

EHMI operates with 4 types of standards, each of which has its own prefix according to the standard

- FHIR 
- eb
- OIOXML (described in a later version of the standard)
- Edifact (described in a later version of the standard)


###### If the MedCom Message is of type FHIR 


If the MedCom Message is of type FHIR, then always in the following format:

    <DocumentInformation>
        <Standard>
            [Bundle.entry[0].resource.event.as(Coding).code]
        </Standard>
    </DocumentInformation>


Message example: 


    <DocumentInformation>
        <Standard>homecareobservation-message</Standard>
    </DocumentInformation>


###### If the MedCom Message is of type ehmiSBDH EnvelopeReceipt


Always 


    <DocumentInformation>
        …
        <Standard>
            [bpssignal:ReceiptAcknowledgement@xmlns:bpssignal[standard]]
        </Standard>
        …
    </DocumentInformation>


SBDH-envelope example:


    <DocumentInformation>
        …
        <Standard>ehmisbdh-acknowledgement</Standard>
        …
    </DocumentInformation>


##### TypeVersion


Is the contained message version on the form


    <DocumentInformation>
        …
        <TypeVersion>[Path to the type version]</TypeVersion>
        …
    </DocumentInformation>


###### If the MedCom Message is of type FHIR 


If the MedCom Message is of type FHIR, then always in the following format:

    <DocumentInformation>
        …
        <TypeVersion>
            [Bundle.entry[0].resource.MessageHeader.definition[versionssuffiks]]
        </TypeVersion>
        …
    </DocumentInformation>


Message example:


    <DocumentInformation>
	    …
        <TypeVersion>1.0</TypeVersion>
        …
    </DocumentInformation>


If the contained message is of type ehmiSBDH EnvelopeReceipt, always 


    <DocumentInformation>
        …
        <TypeVersion>
            [bpssignal:ReceiptAcknowledgement@xmlns:bpssignal[version]]
        </TypeVersion>
        …
    </DocumentInformation>


ehmiSBDH EnvelopeReceipt example:


    <DocumentInformation>
        …
        <Type>ebbp-signals-2.0</Type>
        …
    </DocumentInformation>


##### InstanceIdentifier 


The InstanceIdentifier will be generated by the sending MSH and is regardless of whether a message or an ehmiSBDH EnvelopeReceipt is generated.

    <InstanceIdentifier>[generated UUID]</InstanceIdentifier>	

example:


    <!-- [generated UUID] -->	
    <DocumentInformation>
    	…
        <InstanceIdentifier>b7faca8e-e908-47bb-b323-0eb8a854c558</InstanceIdentifier>
        …
    </DocumentInformation>


##### Type


Message:


    <DocumentInformation>
        …
        <Type>[Message-starttag]</Type>
        …
    </DocumentInformation>


###### If the MedCom Message is of type FHIR 


If the MedCom Message is of type FHIR, then always in the following format:

    <DocumentInformation>
        …
        <Type>[Bundle]</Type>
        …
    </DocumentInformation>


Message example:


    <DocumentInformation>
        …
        <Type>Bundle</Type>
        …
    </DocumentInformation>


###### If the message is of type ehmiSBDH EnvelopeReceipt:


    <DocumentInformation>
        …
        <Type>[EnvelopeReceipt type]</Type>
        …
    </DocumentInformation>


Receipt type has the following scope: Scope for these ebXML Business Process Signals is:

- ReceiptAcknowledgement
- ReceiptException
- AcceptanceAcknowledgement (NOTE! not used in the production Production Pilot)


EnvelopeReceipt example:


    <DocumentInformation>
        …
        <Type>ReceiptAcknowledgement</Type>
        …
    </DocumentInformation>


##### MultipleType


Always false: 


    <DocumentInformation>
        …
        <MultipleType>false</MultipleType>
        …
    </DocumentInformation>


##### CreationDateAndTime

Always in this format: [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC]


    <DocumentInformation>
        …
        <CreationDateAndTime>
            [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC] 
        </CreationDateAndTime>
        …
    </DocumentInformation>


example:


    <DocumentInformation>
        …
        <CreationDateAndTime>2025-04-01T16-19-00+01:00</CreationDateAndTime>
        …
    </DocumentInformation>


##### DocumentInformation - aggregate message example

    <DocumentIdentification>
	    <Standard>homecareobservation-message</Standard>
	    <TypeVersion>1.2</TypeVersion>
        <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</InstanceIdentifier>
	    <Type>Bundle</Type>
	    <MultipleType>false</MultipleType>
	    <CreationDateAndTime>2025-04-01T16-19-00+01:00</CreationDateAndTime>
    </DocumentIdentification>


##### DocumentInformation - aggregate EnvelopeReceipt example


    <DocumentIdentification>
        <Standard>ehmisbdh-acknowledgement</Standard>
	    <TypeVersion>ebbp-signals-2.0</TypeVersion>
	    <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dx</InstanceIdentifier>
	    <Type>ReceiptAcknowledgement</Type>
	    <MultipleType>false</MultipleType>
	    <CreationDateAndTime>2025-04-01T16-19-00+01:00</CreationDateAndTime>
    </DocumentIdentification>


#### Manifest (deliberately omitted in the Production Pilot version) 


## ehmiSbdhBusinessScopes 

ehmiSbdhBusinessScopes is the SBDH's name-value pair construction characterized by an identifier. Name is expressed by the Type element and value is expressed by the InstanceIdentifier. These two change for each scope, while the Identifier in the EHMI context is always the same: dk-medcom-messaging. In the following, they are reviewed in the logical contexts in which they appear.

<img src="ClassSbdhBusinessScopeBasic.png" alt="ehmiSbdhBusinessScope"  style="width:30%;height:auto;margin-left:35%; margin-right:35%; margin-top:30px; margin-bottom:30px;"/>
### eDelivery message communication


#### In context of SMP 

In the eDelivery communication, the SBDH's Scope structure with the two types, DOCUMENTID and PROCESSID, is the direct relation to the SMP's DOCUMENTID and PROCESSID. Furthermore, the context also includes the elements already reviewed in the section on Receiver. In the following, precisely these two types of elements in the SBDH's overall BusinessScope structure are described. The scopes, DOCUMENTID and PROCESSID, are permanently defined scopes by PEPPOL, which ensure a unique relationship to SMP. DOCUMENTID and PROCESSID are used in EHMI with the same precision as in PEPPOL, so that consistency is ensured in how the values ​​are expressed across PEPPOL and EHMI. DOCUMENTID and PROCESSID are used by the APs together with recipient's Receiver/Identifier to look up recipient's eDelivery address in SMP with a unique response as a result.


<img src="ehmiSBDH_BusinessScopesPeppol.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

#### DOCUMENTID


The value in InstanceIdentifier is identical to the corresponding SMP record. The values ​​are taken from MedCom's standard catalog and are here represented by the values ​​that indicate the type of message. See bookmark: [DKEDEL_DT_CodeList]


##### DOCUMENTID for MedCom Messaging Messages

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:prod:messaging:medcom:fhir:structuredefinition::[Bundle/MessageHeader/eventCoding/code.value]##urn:dk:medcom:fhir:[Bundle/MessageHeader/eventCoding/code.value]::[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

MedcomMessagingMessage example 

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:medcom:messaging:fhir:structuredefinition::homecareobservation-message##urn:dk:medcom:fhir:homecareobservation-message::1.2
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

MedcomMessagingMessage Acknowledgement example 
    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
           urn:dk:healthcare:medcom:messaging:fhir:structuredefinition::acknowledgement-message##urn:dk:medcom:fhir:acknowledgement-message::2.0
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### DOCUMENTID for ehmiSBDH EnvelopeReceipt

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:prod:messaging:oasis:ebxml:schema:xsd::[bpps-signaltype]##urn:dk:medcom:[bpps-signaltype]::[version]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

DOCUMENTID ehmiSBDH EnvelopeReceipt example:

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
           urn:dk:healthcare:messaging:oasis:ebxml:schema:xsd::ehmisbdh-acknowledgement##urn:dk:ehmi:sbdh:ehmisbdh-acknowledgement::1.0
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

#### PROCESSID


The value in InstanceIdentifier is identical to the corresponding ProcessId SMP record. In the 4-corner model, the SDN emergency registration is also sent to the SMP, so that the sender's AP can look up the final receiver, also called the final recipient, correctly in the SMP.
    <Scope> 
        <Type>PROCESSID</Type> 
        <InstanceIdentifier>
            [Process Identifier value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

PROCESSID for SDN example

sdn-emergence is the InstanceIdentifier used to relate a message's emergence on SDN, SundhedsDataNettet.


Always
    <Scope> 
	    <Type>PROCESSID</Type> 
        <InstanceIdentifier>urn:ehmi:sdn-emergence</InstanceIdentifier>
	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

### Health message communication


#### Scope – message metadata - who


<img src="ehmiSBDH_BusinessScopesMetadata.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

##### PATIENTID

The patient's Civil Registration Number, CPR, is included as an identifier for use in EDS Shipment status and XDS metadata.


    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            [Bundle.entry.resource.ofType(Patient).identifier.where(system=’urn:oid:1.2.208.176.1.2’).value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

PATIENTID for MedComMessagingMessages - example:

    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            0101010227
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### SENDERID 

Sender's SOR identifier is used for EDS Shipment status. 

SENDERID for MedComMessagingMessages:

    <Scope>
	    <Type>SENDERID</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

SENDERID for MedComMessagingMessages - example:

    <Scope>
	    <Type>SENDERID</Type> 
	    <InstanceIdentifier>1170101</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### RECEIVERID 

Recipient's SOR identifier is used for EDS Shipment status. 

RECEIVERID for MedComMessagingMessages:

    <Scope>
	    <Type>RECEIVERID</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

RECEIVERID for MedComMessagingMessages - example:

    <Scope>
	    <Type>RECEIVERID</Type> 
	        <InstanceIdentifier>1170102</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

#### Scope – message metadata - what


<img src="ehmiSBDH_BusinessScopesMetadata.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

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

###### If the MedCom Message is of type ehmiSBDH EnvelopeReceipt

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

##### ORIGINALMESSAGEIDENTIFIER

ORIGINAL MESSAGE IDENTIFIER is the MESSAGE IDENTIFIER of the original contained message, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals” and SBD/SBDH/DocumentInformation/Standard.value = "acknowledgement-message"

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

##### ORIGINALMESSAGEENVELOPEIDENTIFIER

The ORIGINAL MESSAGEENVELOPEIDENTIFIER is the contained message's Bundle.id, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals” and SBD/SBDH/DocumentInformation/Standard.value = "acknowledgement-message"

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

##### ORIGINALMESSAGESTANDARD

ORIGINAL MESSAGE STANDARD is the original contained message standard, i.a. for use in collection of EDS shipping status.

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals” or SBD/SBDH/DocumentInformation/Standard.value = "acknowledgement-message"

    <Scope>
	    <Type>ORIGINALMESSAGESTANDARD</Type> 
	    <InstanceIdentifier>
            The original message standard [SBD/SBDH/DocumentInformation/Standard.value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGESTANDARD example for “ebbp-signals”:

    <Scope>
	    <Type>ORIGINALMESSAGESTANDARD</Type> 
        <InstanceIdentifier>homecareobservation-message</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGESTANDARD example for "acknowledgement-message":

    <Scope>
	    <Type>ORIGINALMESSAGESTANDARD</Type> 
        <InstanceIdentifier>unknown</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### ORIGINALMESSAGEVERSION

ORIGINAL MESSAGE VERSION is the version of the original contained message, i.a. for use in collection of EDS shipping status. 

Is only relevant when SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals” or SBD/SBDH/DocumentInformation/Standard.value = "acknowledgement-message"

    <Scope>
	    <Type>ORIGINALMESSAGEVERSION</Type> 
	    <InstanceIdentifier>
            [SBD/SBDH/DocumentInformation/TypeVersion.value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGEVERSION example for “ebbp-signals”:

    <Scope>
	    <Type>ORIGINALMESSAGEVERSION</Type> 
        <InstanceIdentifier>1.2</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

ORIGINALMESSAGEVERSION example for "acknowledgement-message":

    <Scope>
	    <Type>ORIGINALMESSAGEVERSION</Type> 
        <InstanceIdentifier>unknown</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### ORIGINALENVELOPEIDENTIFIER

The ORIGINALENVELOPEIDENTIFIER is the original ehmiSBDH-envelopes InstanceIdentifier, i.a. for use in collection of EDS shipping status.

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

#### MedCom Statistics

##### StatisticalInformation

The StatisticalInformation is the designated elements of a MedCom Message that has to be gathered for MedCom to monitoring which messages are sent over the EHMI Network.

The designated elements of a concrete MedcomMessagingMessage can be found <a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/documents/FHIRMessages_NetworkEnvelopes_EN.html" target="_blank">here</a>

    <Scope>
	    <Type>StatisticalInformation</Type> 
	    <InstanceIdentifier>
            "MCM:"+[SBD/SBDH/DocumentInformation/Standard]+(if designated postfix-value has been made for this message standard, then "#"+[designated postfix-values from a concrete message] else N/A)
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

StatisticalInformation example 1:
    
    <Scope>
	    <Type>StatisticalInformation</Type> 
        <InstanceIdentifier>
            MCM:homecareobservation-message
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

StatisticalInformation example 2:
    
    <Scope>
	    <Type>StatisticalInformation</Type> 
        <InstanceIdentifier>
            MCM:carecommunication-message#carecoordination
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

### XDS-Metadata


<img src="ehmiSBDH_BusinessScopesXdsMetadata.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

#### Document sharing XDS-Metadata

The following reflects the DokumentDelingsServicen on NSP's needs for XDS metadata. This scope type is set on the exchange with the document sharing services.

This scope only applies to MedCom Messages, not MedCom receipts, as they are not shared via the Document Sharing Service.

This scope does not apply to the primary exchange between Sender and Receiver.


#### ehmiSbdhBusinessScope/Scope for XDS-Metadata

Always FHIR DocumentReference for the relevant message type with associated variables to be able to identify e.g. patient and organization

    <Scope>
	    <Type>XDS-METADATA</Type> 
	        <InstanceIdentifier>
                <[CDATA: <DocumentReference> [DocumentReference-structure] </DocumentReference>]>
            </InstanceIdentifier>
	    <Identifier>dk-medcom-DocumentReference</Identifier>
    </Scope>

#### XDS-Metadata (example på encoded value)

    <Scope>
	    <Type>XDS-METADATA</Type> 
	        <InstanceIdentifier>
                <[CDATA: [DocumentReference-structure*]]>
            </InstanceIdentifier>
	    <Identifier>dk-medcom-DocumentReference</Identifier>
    </Scope>

* As [DocumentReference-structure] can't be referenced in the above xml-snippet, you can find the example of the structure to be included here: <a href="https://build.fhir.org/ig/medcomdk/dk-medcom-xds-documents/DocumentReference-77787891-083a-4d19-9e56-423e7a223e30.html" target="_blank">[DocumentReference-structure]</a>

### Reliable messaging 

Reliable messaging is triggered by a request for the degree of reliable messaging desired from the sender, which is done using SBDH's BusinessService in the BusinessScope element.

When the sender has made a request for Reliable messaging and thus the use of ehmiSBDH EnvelopeReceipts, these are handled using ebXML Business Process Signals (ebBP Signals 2.0.4).

Outcome spaces for these ebXML Business Process Signals are:

- ReceiptAcknowledgement
- ReceiptException
- AcceptanceAcknowledgement (currently not used in the Production Pilot)

Two structures are used

- Reliable messaging - Business Service request
- Reliable messaging - BusinessService response

Both are built around SBDH's BusinessScope/Scope element.

In connection with requirements related to on Reliable messaging, the structure in BusinessScope called BusinessService is used to design which type of ehmiSbdhtransactions the recipient of the original ehmiSBDH-envelope must fulfill.

CorrelationInformation is used to tie a message and its receipt together. All elements of CorrelationInformation are generated by the sending SBDH-MSH. Recipient of ehmiSBDH and sender of EHMI ReceiptAcknowledgement must acknowledge the elements RequestingDocumentCreationDateTime and RequestingDocumentInstanceIdentifier by indicating the CorrelationInformation. An ehmiSBDH EnvelopeReceipt is never acknowledged.


<img src="ClassSbdhBusinessScopeComplex.png" alt="ehmiSbdhBusinessScope Complex"  style="width:60%;height:auto;margin-left:5%; margin-right:35%; margin-top:30px; margin-bottom:30px;"/>
#### Reliable messaging - BusinessService Request


<img src="ehmiSBDH_ReceiptAckowledgementRequest.png" alt="ehmiSBDH_ReceiptAckowledgementRequest"  style="width:80%;height:auto;margin-left:5%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

The following, is how the setup is desired in the Production Pilot.


##### EHMI-ReceiptAcknowledgement- - Request

In an EHMI-ReceiptAcknowledgement - Request, the scope is always like this: 

    <Scope>
	    <Type>EHMI-ReceiptAcknowledgement</Type>
	    <InstanceIdentifier>Request</InstanceIdentifier>
	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### CorrelationInformation - 

Reliable messaging uses the SBDH's CorrelationInformation to tie the original ehmiSBDH and the ehmiSBDH EnvelopeReceipt together. The RequestingDocument InstanceIdentifier is specifically used here.


###### CorrelationInformation - RequestingDocumentCreationDateTime

RequestingDocumentCreationDateTime is the time of original message sending = DocumentIdentification/CreationDateAndTime

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


###### CorrelationInformation - RequestingDocumentInstanceIdentifier

RequestingDocumentInstanceIdentifier is the original envelope's identifier = DocumentIdentification/InstanceIdentifier

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


###### CorrelationInformation - ExpectedResponseDateTime

ExpectedResponseDateTime expresses the expected maximum time until an ehmiSbdhresponse is received. In the Production Pilot this is a 10 min response time, i.e. RequestingDocumentCreationDateTime + 10 min

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


##### CorrelationInformation - samlet example

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


##### ehmiSbdhBusinessServices - Request


###### BusinessServiceName

Always 

    <BusinessServiceName>
        EHMI-ReceiptAcknowledgement-Request
    </BusinessServiceName>


###### ServiceTransaction – TypeOfServiceTransaction

    TypeOfServiceTransaction=”RequestingServiceTransaction”


###### ServiceTransaction – IsNonRepudiationRequired

    IsNonRepudiationRequired=”false” 


###### ServiceTransaction – IsAuthenticationRequired

    IsAuthenticationRequired=”false” 


###### ServiceTransaction – IsNonRepudiationOfReceiptRequired

    IsNonRepudiationOfReceiptRequired=”false” 


###### ServiceTransaction – IsIntelligibleCheckRequired

    IsIntelligibleCheckRequired=”false” 


###### ServiceTransaction – IsApplicationErrorResponseRequested
    
    IsApplicationErrorResponseRequested=”false” 


###### ServiceTransaction – TimeToAcknowledgeReceipt

    TimeToAcknowledgeReceipt=”600000” (ms)


###### ServiceTransaction – TimeToAcknowledgeAcceptance

    TimeToAcknowledgeAcceptance=”0” (= is not currently used)


###### 0	ServiceTransaction – TimeToPerform

    TimeToPerform=”0” (=is not currently used)


###### ServiceTransaction – Recurrence

    Recurrence=”0” (=is not currently used)


##### ehmiSbdhBusinessServices - Request example

    <BusinessService>
        <BusinessServiceName>
            EHMI-ReceiptAcknowledgement-Request
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


##### Reliable messaging - BusinessService Request samlet example

    <BusinessScope>
        <Scope>
            <Type>EHMI-ReceiptAcknowledgement</Type>
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
                    EHMI-ReceiptAcknowledgement-Request
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
 

#### Reliable messaging - BusinessService Response


<img src="ehmiSBDH_ReceiptAckowledgementResponse.png" alt="ehmiSBDH_ReceiptAckowledgementResponse"  style="width:80%;height:auto;margin-left:5%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

The following is the setup desired in the Production Pilot.


##### EHMI-ReceiptAcknowledgement - Response

In an EHMI-ReceiptAcknowledgement - Response scope is always like this:

    <Scope>
	    <Type>EHMI-ReceiptAcknowledgement</Type>
	    <InstanceIdentifier>Response</InstanceIdentifier>
	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

##### CorrelationInformation - 

Reliable messaging uses the SBDH’s CorrelationInformation to tie the original ehmiSBDH and the Acknowledgement ehmiSbdh together. The RequestingDocumentInstanceIdentifier is specifically used here


##### CorrelationInformation - RequestingDocumentCreationDateTime

RequestingDocumentCreationDateTime is the disptach time of original envelope = RequestingSBDH/RequestingDocumentCreationDateTime

    <CorrelationInformation>
		<RequestingDocumentCreationDateTime>
            [YYYY-MM-DD]T[TT-MM-SS]+[offset to UTC]
        </RequestingDocumentCreationDateTime>
    …
    <CorrelationInformation>


##### RequestingDocumentCreationDateTime example

    <CorrelationInformation>
		<RequestingDocumentCreationDateTime>
            2021-02-17T09:30:10+01:00
        </RequestingDocumentCreationDateTime>
        …
    <CorrelationInformation>


##### CorrelationInformation - RequestingDocumentInstanceIdentifier

RequestingDocumentInstanceIdentifier is the original envelope's identifier = RequestingSBDH/RequestingDocumentInstanceIdentifier

    <CorrelationInformation>
        …
        <RequestingDocumentInstanceIdentifier>
            RequestingSBDH/RequestingDocumentInstanceIdentifier
        </RequestingDocumentInstanceIdentifier>
        …
    <CorrelationInformation>


##### RequestingDocumentInstanceIdentifier example

    <CorrelationInformation>
        …
        <RequestingDocumentInstanceIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </RequestingDocumentInstanceIdentifier>
        …
    <CorrelationInformation>


##### CorrelationInformation - ExpectedResponseDateTime

ExpectedResponseDateTime is omitted in an EHMI ReceiptAcknowledgement


##### CorrelationInformation - samlet example

    <CorrelationInformation>
	    <RequestingDocumentCreationDateTime>
            2021-02-17T09:30:10+01:00
        </RequestingDocumentCreationDateTime>
	    <RequestingDocumentInstanceIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </RequestingDocumentInstanceIdentifier>
    </CorrelationInformation>


##### ehmiSbdhBusinessServices - Response


###### BusinessServiceName

Always 

    <BusinessServiceName>
        EHMI-ReceiptAcknowledgement-Response
    </BusinessServiceName>


###### ServiceTransaction – TypeOfServiceTransaction

Always
    
    TypeOfServiceTransaction=”RespondingServiceTransaction”


###### ServiceTransaction – IsNonRepudiationRequired

Always

    IsNonRepudiationRequired=”false” 


###### ServiceTransaction – IsAuthenticationRequired

Always

    IsAuthenticationRequired=”false” 


###### ServiceTransaction – IsNonRepudiationOfReceiptRequired

Always

    IsNonRepudiationOfReceiptRequired=”false” 


###### ServiceTransaction – IsIntelligibleCheckRequired

Always

    IsIntelligibleCheckRequired=”false” 


###### ServiceTransaction – IsApplicationErrorResponseRequested

Always

    IsApplicationErrorResponseRequested=”false” 


###### ServiceTransaction – TimeToAcknowledgeReceipt

Always

    TimeToAcknowledgeReceipt=”0” (ms)


###### ServiceTransaction – TimeToAcknowledgeAcceptance

Always

    TimeToAcknowledgeAcceptance=”0” (=is not currently used)


###### 0	ServiceTransaction – TimeToPerform

Always

    TimeToPerform=”0” (=is not currently used)


###### ServiceTransaction - Recurrence

Always

    Recurrence=”0” (=is not currently used)


###### ehmiSbdhBusinessServices - Response example

    <BusinessService>
        <BusinessServiceName>
            EHMI-ReceiptAcknowledgement-Response
        </BusinessServiceName>
        <ServiceTransaction 
            TypeOfServiceTransaction=”RequestingServiceTransaction”, IsNonRepudiationRequired=”false”, 
            IsAuthenticationRequired=”false”, IsNonRepudiationOfReceiptRequired=”false”, IsIntelligibleCheckRequired=”false”, IsApplicationErrorResponseRequested=”false”, TimeToAcknowledgeReceipt=”600000 ”, 
            TimeToAcknowledgeAcceptance=”0”, 
            TimeToPerform=”0”, 
            Recurrence=”0”/>
    </BusinessService>


###### Reliable messaging - BusinessService Response overall example
    
    <BusinessScope>
        <Scope>
            <Type>EHMI-ReceiptAcknowledgement</Type>
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
                EHMI-ReceiptAcknowledgement-Response
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


<!--

#### EHMI ReceiptAcknowledgement


EHMI ReceiptAcknowledgement is used as a positive transport receipt, and so that the recipient of the receipt can easily correlate the message with the original envelope, the recipient can check the

- Sender 
    - Identifier (GLN number for sender) 
- Receiver 
    - Identifier (GLN number for receiver) 
- Scope 
    - SENDERID (SORID for sender) 
    - RECEIVERID (SORID for receiver) 
    - CorrelationInformation

##### RequestingDocumentInstanceIdentifier

Embedded in an ehmiSbdhReceiptAcknowledgement is also an ebBP signal, which in principle contains the same information, but which does not need to be checked when it is a ReceiptAcknowledgement.


<img src="ehmiSBDH_ReceiptAckowledgement.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

The Receipt Acknowledgement Business Signal signals that a message has been properly received by the Receiver MSH software component. Legible means that it has passed structure/schema validity check. The content of the receipt and the legibility of a business message MUST be reviewed prior to the processing of the Requesting or Responding Business Document or the evaluation of condition expressions in the message's Business Documents or Document Envelope. Condition Expressions are expressions that evaluate to true or false. [ebXMLbp] 


###### OriginalMessageIdentifier

Same datatype as SBDH.DocumentIdentification.InstanceIdentifier

    <bpssignal:OriginalMessageIdentifier>
        [RequestingSBDH/DocumentIdentification/InstanceIdentifier]
    </bpssignal:OriginalMessageIdentifier>		

OriginalMessageIdentifier example
    
    <bpssignal:OriginalMessageIdentifier>
        9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc
    </bpssignal:OriginalMessageIdentifier>		


###### OriginalDocumentIdentifier

Same datatype as SBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier

    <bpssignal:OriginalDocumentIdentifier>
        [RequestingSBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier]
    </bpssignal:OriginalDocumentIdentifier>

OriginalDocumentIdentifier example

    <bpssignal:OriginalDocumentIdentifier>
        urn:dk:healthcare:prod:messaging:medcom: fhir:structuredefinition:[Bundle/MessageHeader/eventCoding/code.value]#urn:dk:medcom:fhir:[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
    </bpssignal:OriginalDocumentIdentifier>


###### OriginalMessageDateTime

Always in this format: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC] 

    <bpssignal:OriginalMessageDateTime>
        [RequestingSBDH/DocumentIdentification/CreationDateAndTime]
    </bpssignal:OriginalMessageDateTime>

OriginalMessageDateTime example

    <bpssignal:OriginalMessageDateTime>
        2025-04-01T16:19:00+01:00
    </bpssignal:OriginalMessageDateTime>


###### ThisMessageDateTime

Always in this format: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC]

    <bpssignal:ThisMessageDateTime>
        [RespondingSBDH.DocumentIdentification.CreationDateAndTime]
    </bpssignal:ThisMessageDateTime>

ThisMessageDateTime example

    <bpssignal:ThisMessageDateTime>
        2025-04-01T16:19:10+01.00
    </bpssignal:ThisMessageDateTime>


###### FromPartyInfo
 
    <bpssignal:FromPartyInfo type=[RequestingSBDH:Receiver.Identifier@Authority]>
        [RequestingSBDH:Receiver.Identifier]
    </bpssignal:FromPartyInfo>

FromPartyInfo example

    <bpssignal:FromPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000201389
    </bpssignal:FromPartyInfo>


###### ToPartyInfo

    <bpssignal:ToPartyInfo type=[RequestingSBDH:Sender.Identifier@Authority]>
        [RequestingSBDH:Sender.Identifier]
    </bpssignal:ToPartyInfo> 

ToPartyInfo example

    <bpssignal:ToPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000121526
    </bpssignal:ToPartyInfo>


##### Overall EHMI ReceiptAcknowledgement example

    <bpssignal:ReceiptAcknowledgement xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:bpssignal="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://docs.oasis-open.org/ebxml-bp/ebbp-signals-2.0 http://docs.oasis-open.org/ebxml-bp/2.0.4/ebbp-signals-2.0.4.xsd">
        <bpssignal:OriginalMessageIdentifier>
            9a6ff82208de-5a6f-9670-9fa4b9d2f0dh
        </bpssignal:OriginalMessageIdentifier>
        <bpssignal:OriginalDocumentIdentifier>
            urn:dk:healthcare:medcom:messaging:fhir:structuredefinition::homecareobservation-message##urn:dk:medcom:fhir:homecareobservation-message::1.2
        </bpssignal:OriginalDocumentIdentifier>
        <bpssignal:OriginalMessageDateTime>
            2025-04-01T16:19:00+01:00
        </bpssignal:OriginalMessageDateTime>
        <bpssignal:ThisMessageDateTime>
            2025-04-01T16:19:10+01:00
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



#### Receipt Exception


A  Receipt Exception signals an error condition in the management of a Business Transaction. This Business Signal is returned to the initiating activity that originated the request. This exception MUST terminate the Business Transaction. These errors deal with the mechanisms of message exchange such as verification, validation, authentication, and authorization and will occur up to message acceptance. Typically, the rules and constraints applied to the message will have only dealt with the well-formedness of the message.

A receipt exeption terminates the Business Transaction. The following are receipt exceptions:

- Syntax exceptions. There is invalid punctuation, vocabulary or grammar in the Business Document or Business Signal. (the expected most common in a Business Transaction)
- Authorization exceptions. Roles are not authorized to participate in the Business Transaction. Note that the receiving Business Service Interface can only identify this exception.
- Signature exceptions. Business Documents are not signed for non-repudiation when required.
- Sequence exceptions. The order or type of a Business Document or Business Signal is incorrect.

A Receipt Exception typical signals an error condition in a Business Activity which requires a transaction to be terminated, i.e. receipt of a business message with a Business Document that has failed. (From [ebXMLbp] page 77)


<img src="ehmiSBDH_ReceiptAckowledgementException.png" alt="EHMI StandardBusinessDocument"  style="width:70%;height:auto;margin-left:15%; margin-right:15%; margin-top:30px; margin-bottom:30px;"/>

###### OriginalMessageIdentifier


As 7.4.3.1.1


###### OriginalDocumentIdentifier

As 7.4.3.1.2


###### OriginalMessageDateTime

As 7.4.3.1.3 


###### ThisMessageDateTime

As 7.4.3.1.4 


###### FromPartyInfo

As 7.4.3.1.5 


###### ToPartyInfo

As 7.4.3.1.6


###### ExceptionType

The content is generally defined as a ReceiptException, but beyond that it is the logic of the receiver's error handling mechanism that determines the content. Here exemplified from DDS MSH service. Reason and ExceptionMessage follow the same logic.

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


###### Reason

See ExceptionType

    <bpssignal:Reason>
        [Reason]
    </bpssignal:Reason>

Reason example

    <bpssignal:Reason>
        Internal error
    </bpssignal:Reason>


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

 

##### Overall Receipt Acknowledgement  Exception example

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
            urn:dk:healthcare:medcom:messaging:fhir:structuredefinition::homecareobservation-message##urn:dk:medcom:fhir:homecareobservation-message::1.2
        </bpssignal:OriginalDocumentIdentifier>
        <bpssignal:OriginalMessageDateTime>
            2025-04-01T16:19:00+01:00
        </bpssignal:OriginalMessageDateTime>
        <bpssignal:ThisMessageDateTime>
            2025-04-01T16:19:10+01:00
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
 
 -->

## ehmiSbdhBinaryContent – the contained message


BinaryContent is an ehmiSbdh1.2 extension that allows to wrap specific content in ehmiSBDH and base64-encode it. MimeType clarifies the content and what the recipient can expect from the base64 decoding. 

Outcome space for mimeType is:

-	text/xml
-	text/edi
-	fhir/xml
-	fhir/json

        <BinaryContent xmlns="http://peppol.eu/xsd/ticc/envelope/1.0" mimeType=[mimeType] encoding=[encoding]>
            [base64-encoded indhold]
        <BinaryContent>

Encoding in the pilot will be the following for all the MedComMessagingMessages:
- "UTF-8"

Encoding will have the following outcome space for ReceiptAcknowledgement and ReceiptException in the pilot:
- "UTF-8"

## ehmiSBDH xsd-schemas

All ehmiSBDH xsd-files can be found via the [download-page](downloads.html), but an overview of what they most importantly contain can be seen here:

(all files open in new window)

- <a href="ehmiSBDH_StandardBusinessDocumentHeader.xsd.html" target="_blank">ehmiSbdhStandardBusinessDocumentHeader Xsd</a>
- <a href="ehmiSBDH_Partner.xsd.html" target="_blank">ehmiSbdhPartner Xsd</a>
- <a href="ehmiSBDH_DocumentIdentification.xsd.html" target="_blank">ehmiSbdhDocumentIdentification Xsd</a>
- <a href="ehmiSBDH_BusinessScope.xsd.html" target="_blank">ehmiSbdhBusinessScope Xsd</a>
- <a href="ehmiSBDH_EDN-Business-Message-Envelope-1.2.xsd.html" target="_blank">ehmiSbdhBinaryContentType Xsd</a>
- <a href="ehmiSBDH_ebbp-signals-2.0.4.xsd.html" target="_blank">ehmiSbdhEbbp-Signals 2.0.4 Xsd</a>


