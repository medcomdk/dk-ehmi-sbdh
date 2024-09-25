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

Hvis den indeholdte meddelelse er af typen EHMI EnvelopeReceipt 

Always 

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

InstanceIdentifier vil blive genereret af den afsendende MSH og er uanset om det er en meddelelse eller en EHMI EnvelopeReceipt genereret.

    <InstanceIdentifier>[generated UUID]</InstanceIdentifier>	

example:

<br/>

    <!-- [generated UUID] -->	
    <DocumentInformation>
    	…
        <InstanceIdentifier>b7faca8e-e908-47bb-b323-0eb8a854c558    </InstanceIdentifier>
        …
    </DocumentInformation>

<br/>

##### Type

<br/>

Meddelelse:

<br/>

    <DocumentInformation>
        …
        <Type>[Meddelelse-starttag]</Type>
        …
    </DocumentInformation>

<br/>

###### If the MedCom message is of type FHIR 

<br/>

Hvis MedCom meddelelsen er en FHIR, da Always på følgende form:

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

###### Hvis meddelelsen er af typen EHMI EnvelopeReceipt:

<br/>

    <DocumentInformation>
        …
        <Type>[Kvitteringstype]</Type>
        …
    </DocumentInformation>

<br/>

Kvitteringstype har følgende udfaldsrum:
Udfaldsrum for disse ebXML Business Process Signals er:
- ReceiptAcknowledgement
- ReceiptException
- AcceptanceAcknowledgement (OBS! bruges ikke i produktionspiloten)

<br/>

Envelope Kvitteringsexample:

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

Always på formen: [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC]

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

##### DocumentInformation samlet Message example

    <DocumentIdentification>
	    <Standard>homecareobservation-message</Standard>
	    <TypeVersion>1.0</TypeVersion>
        <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</InstanceIdentifier>
	    <Type>Bundle</Type>
	    <MultipleType>false</MultipleType>
	    <CreationDateAndTime>2024-03-01T16-19-00+01:00</CreationDateAndTime>
    </DocumentIdentification>

<br/>

##### DocumentInformation samlet kvitteringsexample

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

#### Manifest (bevidst udeladt i Produktionspilotversionen) 

<br/>

## SBDH BusinessScopes 

SBDH BusinessScopes er SBDH’s name-value pair konstruktion karakteriseret ved identifier. 
Name er udtrykt ved Type-elementet og value er udtrykt ved InstanceIdentifier. Disse to skifter for hvert scope, mens Identifieren i EHMI sammenhæng Always er den samme: dk-medcom-messaging
I det følgende gennemgås de i de logiske sammenhænge, som de optræder i.

<br/>

### BusinessScope for generel eDelivery meddelelseskommunikation

<br/>

#### Sammenhæng til SMP 

I eDelivery kommunikationen udgør SBDH’ens Scope struktur med de to typer, DOCUMENTID og PROCESSID, den direkte sammenhæng til SMP’ens DOCUMENTID og PROCESSID. Ydermere inkluderer sammenhængen også de allerede gennemgåede elementer i afsnittet om Receiver. I det følgende beskrives netop disse to Type elementer i SBDH’ens overordnede BusinessScope struktur.
Scopene DOCUMENTID og PROCESSID er i PEPPOL fast definerede scopes, som sikrer en unik relation til SMP. DOCUMENTID og PROCESSID anvendes i EHMI med samme præcision som i PEPPOL, så der sikres en ensartethed i, hvordan man udtrykker værdierne på tværs af PEPPOL og EHMI. DOCUMENTID og PROCESSID bruges af AP’erne sammen med modtagers Receiver/Identifier til at slå modtagers eDelivery adresse op i SMP med et unikt respons som resultat.

<br/>

<img src="ehmiSBDH_BusinessScopesPeppol.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

#### DOCUMENTID

<br/>

Værdien i InstanceIdentifier er identisk med den tilsvarende SMP-registrering.
Værdierne hentes fra MedComs standardkatalog og er her repræsenteret ved de værdier, som angiver typen af meddelelsen. Se bogmærke: [DKEDEL_DT_CodeList]

<br/>

##### DOCUMENTID  for MedCom FHIR Meddelelser

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

Værdien i InstanceIdentifier er identisk med den tilsvarende ProcessId SMP-registrering .
I 4-corner modellen  sendes SDN-emergence-registreringen med til SMP, så afsenders AP kan slå endelig modtager, også kaldet finalreceipient op korrekt i SMP.

    <Scope> 
        <Type>PROCESSID</Type> 
        <InstanceIdentifier>
            [Process Identifier value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

PROCESSID for SDN example

<br/>

Always

    <Scope> 
	    <Type>PROCESSID</Type> 
        <InstanceIdentifier>sdn-emergence</InstanceIdentifier>
	    <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

### SBDH BusinessScope – sundhedsmeddelelseskommunikation

<br/>

#### Scope – message metadata - who

<br/>

<img src="ehmiSBDH_BusinessScopesMetadata.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

##### PATIENTID

Patientens CPR number indgår som identifier til brug for EDS Forsendelsesstatus og XDS-metadata. 

<br/>

    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            [Bundle.entry.resource.ofType(Patient).identifier.where(system=’urn:oid:1.2.208.176.1.2’).value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

PATIENTID for MedCom FHIR meddelelser - example:

    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            f06c1ac8-6096-5178-a380-2831d2456986
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### SENDERID 

Afsenders SOR-identifier indgår til brug for EDS Forsendelsesstatus. 
SENDERID for MedCom FHIR meddelelser:

    <Scope>
	    <Type>SENDERID</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

SENDERID for MedCom FHIR meddelelser - example:

    <Scope>
	    <Type>SENDERID</Type> 
	    <InstanceIdentifier>1170101    </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### RECEIVERID 

Modtagers SOR-identifier indgår til brug for EDS Forsendelsesstatus.
RECEIVERID for MedCom FHIR meddelelser:

    <Scope>
	    <Type>RECEIVERID</Type> 
	    <InstanceIdentifier>
            [Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

RECEIVERID for MedCom FHIR meddelelser - example:

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

MESSAGEIDENTIFIER er den indeholdte meddelelses MessageHeader.id, bl.a. til brug for forsendelsesstatus opsamling. 

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

MESSAGEENVELOPEIDENTIFIER er den indeholdte meddelelses Bundle.id, bl.a. til brug for forsendelsesstatus opsamling. 

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

ORIGINALMESSAGEIDENTIFIER er den originale indeholdte meddelelses MESSAGEIDENTIFIER, bl.a. til brug for forsendelsesstatus opsamling. 

Er kun relevant når SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

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

ORIGINALMESSAGEENVELOPEIDENTIFIER  er den indeholdte meddelelses Bundle.id, bl.a. til brug for forsendelsesstatus opsamling.  

Er kun relevant når SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

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

ORIGINALMESSAGESTANDARD er den originale indeholdte meddelelses standard, bl.a. til brug for forsendelsesstatus opsamling. 

Er kun relevant når SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

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

ORIGINALMESSAGEVERSION er den originale indeholdte meddelelses version, bl.a. til brug for forsendelsesstatus opsamling. 

Er kun relevant når SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

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

ORIGINALENVELOPEIDENTIFIER er den originale SBDH envelopes InstanceIdentifier, bl.a. til brug for forsendelsesstatus opsamling. 

Er kun relevant når SBD/SBDH/DocumentInformation/Standard.value = “ebbp-signals”

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

#### Dokumentdeling XDS-Metadata

Det følgende afspejler DokumentDelingsServicen på NSP's behov for XDS-metadata. Denne scope-type sættes på udvekslingen med dokumentdelingstjenesterne. 

Dette scope gælder kun for MedCom meddelelser ikke MedCom kvitteringer, da de ikke deles via DokumentDelingsServicen. 

Dette scope gælder ikke for den primære udveksling mellem Afsender og Modtager. 

<br/>

#### SBDH BusinessScope/Scope for XDS-Metadata

Always FHIR DocumentReference for den pågældende meddelelsestype med tilhørende variable for at kunne identificere f.eks. patient og organisation

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

Reliable messaging udløses af et request for hvilken grad af reliable messaging, der ønskes fra afsender, hvilket gøres vha. SBDHs BusinessService i BusinessScope elementet.

Når afsender har lavet et request for Reliable messaging og dermed brugen af SBDH-Acknowledgements håndteres disse vha. ebXML Business Process Signals (ebBP Signals 2.0.4).

Udfaldsrum for disse ebXML Business Process Signals er:
-	ReceiptAcknowledgement
-	ReceiptException
-	AcceptanceAcknowledgement (bruges pt ikke)

Der anvendes to strukturer 
-	Reliable messaging - BusinessService request
-	Reliable messaging - BusinessService response

Begge er bygget op omkring SBDHs BusinessScope/Scope element.

I forbindelse med krav ifm. om Reliable messaging anvendes strukturen i BusinessScope kaldet BusinessService til at udforme, hvilken type af SBDH-transaktioner, som modtager af SBDH-originalkuverten skal opfylde.

CorrelationInformation bruges til at binde meddelelse og kvittering sammen. I piloten genereres alle elementer i CorrelationInformation af afsendende SBDH-MSH. Modtager af SBDH og afsender af SBDH ReceiptAcknowledgement skal kvittere med angivelse af CorrelationInformation elementerne RequestingDocumentCreationDateTime og RequestingDocumentInstanceIdentifier. Der kvitteres aldrig på en kvittering.

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

SBDH ReceiptAcknowledgement anvendes som positiv transportkvittering, og for at modtager af kvitteringen nemt kan korrelere meddelelse med originalkuverten, kan modtager checke på hhv. 
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

Always på formen: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC] 

    <bpssignal:OriginalMessageDateTime>
        [RequestingSBDH/DocumentIdentification/CreationDateAndTime]
    </bpssignal:OriginalMessageDateTime>

OriginalMessageDateTime example

    <bpssignal:OriginalMessageDateTime>
        2024-03-01T16:19:00+01:00
    </bpssignal:OriginalMessageDateTime>

<br/>

###### ThisMessageDateTime

Always på formen: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC]

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

## SBDH BinaryContent – den indeholdte meddelelse

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

