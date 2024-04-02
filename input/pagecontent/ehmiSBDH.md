# ehmiSBDH

<br/>

## Indledning

<br/>

The EHMI Standard Business Document Header (ehmiSBDH) is a customized version of the PEPPOL SBDDH.

It is developed to

- suit the direct messaging of clinical content in EHMI
- handle the XDS Metadata that is needed when MedCom Messages are exchanged as “documents” in the XDS Framework
- serve the ground for EDS Delivery Status
- serve the ground for EHMI Statistics of message exchange

[TBD]

<br/>

## SBDH – Generelle elementer 

<br/>

### Generelt

StandardBusinessDocumentHeader (SBDH) er en konvolutspecifikation udstedt af GS1 og profileret til anvendelse i PEPPOL. Den understøttes af eDelivery's Access Points (AP) ift. AS4 protokollen. Vi følger i EHMI konventionerne, som er udlagt i PEPPOLs profilering, men udvider den også til at kunne passe på sundhedsområdet. SBDH er dog ingenting uden en omgivende container, kaldet StandardBusinessDocument (SBD).

<br/>

### StandardBusinessDocument

<br/>

StandardBusinessDocument er som nævnt SBDHs omgivende container, og er en wrapper rundt om SBDH, og indeholder kun to elementer:
-	StandardBusinessDocumentHeader
-	BinaryContent (base64-encodet)

Selvom StandardBusinessDocument, som sådan er konvolutten, bruges termen SBDH generelt om hele konvolutten, da det er dette indhold som er særligt interessant i meddelelsesudvekslingen.
BinaryContent er elementet som indeholder en base64-encodet meddelelse eller kvittering for en afsendt SBDH.

<br/>

<img src="ehmiSBDH_Document.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

Indholdet i SBDH er for en stor dels vedkommende bestemt af hvorledes
-	de samme informationer registreres i EER
-	de samme informationer registreres i SMP
-	sammenhængen er til DokumentDelingServicen DDS 
-	sammenhængen er til EHMI EnvelopeReceipt
-	de samme informationer registreres i EDS

<br/>

SBDH har en struktur, der overordnet er delt ind i følgende elementer:
-	HeaderVersion
-	Sender
-	Receiver
-	DocumentInformation
-	Manifest
-	BusinessScope

<br/>

#### SBDH for en MedCom meddelelse og en MedCom kvittering

<br/>

I en SBDH for en MedCom meddelelse og en MedCom kvittering kan følgende metadata indgå:
-	Generelle SBDH metadata
-	Metadata for eDelivery generel meddelelseskommunikation
-	Metadata for sundhedsmeddelelseskommunikation
-	XDS Metadata for Dokumentdeling
-	Metadata for Reliable messaging - BusinessService Request

<br/>

#### SBDH for en EHMI EnvelopeReceipt 

<br/>

I en SBDH for en EHMI EnvelopeReceipt er der følgende metadata:
-	Generelle SBDH metadata
-	Metadata for eDelivery generel meddelelseskommunikation
-	Metadata for sundhedsmeddelelseskommunikation
-	Metadata for Reliable messaging - BusinessService Response

<br/>

### SBDH – Fast definerede generelle elementer

<br/>

SBDH’s generelle elementer er illustreret i nedenstående figur.

<br/>

<img src="ehmiSBDH_Header.png" alt="EHMI StandardBusinessDocument" /><br/>

<br/>

BusinessScope har dog fået sit eget kapitel, da det afviger markant fra de øvrige.
I det følgende præsenteres de generelle SBDH elementer for de foreløbigt 2 meddelelsestyper, som EHMI opererer med:
-	FHIR
-	EHMI EnvelopeReceipt 

Hvor det er relevant, vil de generelle elementer være opdelt i underafsnit, der beskriver stien til værdien for det pågældende element i de respektive meddelelsestyper.
Hvor de fleste elementer har almindeligt fokus på meddelelsesudveksling generelt og samspillet med SMP, giver særligt BusinessScope et sundhedsorienteret aftryk i specifikationen.

<br/>

#### HeaderVersion

<br/>

Altid 

    <HeaderVersion>1.0</HeaderVersion>

<br/>

#### Sender

<br/>

Sender indeholder i EHMI kun det mandatory element Identifier.

<br/>

##### Identifier

<br/>

Indeholder attributten Authority, som jf. [Policy_identifiers], POLICY 6 Numeric Codes for Issuing Agencies, altid har værdien: "iso6523-actorid-upis"
 
Identifier repræsenterer GLN for afsender, hvor 
- Værdien 0088: afspejler at typen er GLN.
- Værdien efter 0088: afspejler GLN-nummeret.

    `    <Sender>
            <Identifier Authority="iso6523-actorid-upis">    
                “0088:”+[GLN-nummer]
            </Identifier>
        </Sender>

<br/>

##### Hvis MedCom meddelelsen er af typen FHIR 

Hvis MedCom meddelelsen er af typen FHIR, da altid på følgende form:

<br/>

   <Sender>
        <Identifier Authority="iso6523-actorid-upis">    
            Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value
        </Identifier>
    </Sender>

<br/>

##### Sender eksempel

<br/>

Uanset meddelelsestype vil det altid munde ud i følgende Sender/Identifier, hvor værdien efter 0088: selvfølgelig vil variere.

    <Sender>
        <Identifier Authority="iso6523-actorid-upis">
            0088:5790000121526
        </Identifier>
    </Sender>

<br/>

##### Receiver

<br/>

Receiver indeholder i EHMI kun det mandatory element Identifier.

<br/>

##### Identifier

<br/>

Indeholder attributten Authority, som jf. [Policy_identifiers], POLICY 6 Numeric Codes for Issuing Agencies, altid har værdien: "iso6523-actorid-upis"
 Identifier repræsenterer GLN for modtager, hvor 
- Værdien 0088: afspejler at typen er GLN-typenummeret.
- Værdien efter 0088: afspejler GLN-nummeret.

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[GLN-nummer]
        </Identifier>
    </Receiver>' 

<br/>

##### Hvis MedCom meddelelsen er af typen FHIR 

<br/>

Hvis MedCom meddelelsen er af typen FHIR, da altid på følgende form:

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">    
            “0088:”+[Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value]
        </Identifier>
    </Receiver>

<br/>

##### Receiver eksempel:

<br/>

Uanset meddelelsestype vil det altid munde ud i følgende Receiver/Identifier, hvor værdien efter 0088: selvfølgelig vil variere.

    <Receiver>
        <Identifier Authority="iso6523-actorid-upis">0088:5790000201389    </Identifier>
    </Receiver>

<br/>

#### DocumentInformation

<br/>

##### Standard

Vi opererer med 4 type standarder, som har hvert sit prefix ifm. standarden
- FHIR 
- ebxml
- OIOXML (beskrives I en senere version af standarden)
- Edifact (beskrives I en senere version af standarden)

<br/>

###### Hvis MedCom meddelelsen er af typen FHIR 

<br/>

Hvis MedCom meddelelsen er en OIOXML, da altid på følgende form:

    <DocumentInformation>
        <Standard>
            [Bundle.entry[0].resource.event.as(Coding).code]
        </Standard>
    </DocumentInformation>

<br/>

Meddelelseseksempel: 

<br/>

    <DocumentInformation>
        <Standard>homecareobservation-message</Standard>
    </DocumentInformation>

<br/>

###### Hvis MedCom meddelelsen er af typen EHMI EnvelopeReceipt

<br/>

Altid 

    <DocumentInformation>
        …
        <Standard>
            [bpssignal:ReceiptAcknowledgement@xmlns:bpssignal[standard]]
        </Standard>
        …
    </DocumentInformation>

<br/>

SBDH-envelope eksempel:

<br/>

    <DocumentInformation>
        …
        <Standard>ebbp-signals</Standard>
        …
    </DocumentInformation>

<br/>

##### TypeVersion

<br/>

Er den indeholdte meddelelses version på formen

<br/>

    <DocumentInformation>
        …
        <TypeVersion>[Sti til typeversionen]</TypeVersion>
        …
    </DocumentInformation>

<br/>

###### Hvis MedCom meddelelsen er af typen FHIR 

<br/>

Hvis MedCom meddelelsen er af typen FHIR, da altid på følgende form:

    <DocumentInformation>
        …
        <TypeVersion>
            [Bundle.entry[0].resource.MessageHeader.definition[versionssuffiks]]
        </TypeVersion>
        …
    </DocumentInformation>

<br/>

Meddelelseseksempel:

<br/>

    <DocumentInformation>
	    …
        <TypeVersion>1.0</TypeVersion>
        …
    </DocumentInformation>

Hvis den indeholdte meddelelse er af typen EHMI EnvelopeReceipt 

Altid 

<br/>

    <DocumentInformation>
        …
        <TypeVersion>
            [bpssignal:ReceiptAcknowledgement@xmlns:bpssignal[version]]
        </TypeVersion>
        …
    </DocumentInformation>

<br/>

EHMI EnvelopeReceipt eksempel:

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

Eksempel:

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

###### Hvis MedCom meddelelsen er af typen FHIR 

<br/>

Hvis MedCom meddelelsen er en FHIR, da altid på følgende form:

    <DocumentInformation>
        …
        <Type>[Bundle]</Type>
        …
    </DocumentInformation>

<br/>

Meddelelseseksempel:

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

Envelope Kvitteringseksempel:

<br/>

    <DocumentInformation>
        …
        <Type>ReceiptAcknowledgement</Type>
        …
    </DocumentInformation>

<br/>

##### MultipleType

<br/>

Altid false: 

<br/>

    <DocumentInformation>
        …
        <MultipleType>false</MultipleType>
        …
    </DocumentInformation>

<br/>

##### CreationDateAndTime

Altid på formen: [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC]

    <DocumentInformation>
        …
        <CreationDateAndTime>
            [YYYY-MM-DD]T[TT-MM-SS]+[offset-to-UTC] 
        </CreationDateAndTime>
        …
    </DocumentInformation>

Eksempel:

    <DocumentInformation>
        …
        <CreationDateAndTime>2024-03-01T16-19-00+01:00</CreationDateAndTime>
        …
    </DocumentInformation>

<br/>

##### DocumentInformation samlet meddelelseseksempel

    <DocumentIdentification>
	    <Standard>homecareobservation-message</Standard>
	    <TypeVersion>1.0</TypeVersion>
        <InstanceIdentifier>9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc</InstanceIdentifier>
	    <Type>Bundle</Type>
	    <MultipleType>false</MultipleType>
	    <CreationDateAndTime>2024-03-01T16-19-00+01:00</CreationDateAndTime>
    </DocumentIdentification>

<br/>

##### DocumentInformation samlet kvitteringseksempel

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
Name er udtrykt ved Type-elementet og value er udtrykt ved InstanceIdentifier. Disse to skifter for hvert scope, mens Identifieren i EHMI sammenhæng altid er den samme: dk-medcom-messaging
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

Værdien i InstanceIdentifier er identisk med den tilsvarende SMP-registrering.
Værdierne hentes fra MedComs standardkatalog og er her repræsenteret ved de værdier, som angiver typen af meddelelsen. Se bogmærke: [DKEDEL_DT_CodeList]

<br/>

##### DOCUMENTID  for MedCom FHIR Meddelelser

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:prod:messaging:medcom:fhir:structuredefinition:[Bundle/MessageHeader/eventCoding/code.value ]#urn:dk:medcom:fhir:[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

MedCom FHIR Meddelelseseksempel 

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation# urn:dk:medcom:fhir:homecareobservation:3.0
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

##### DOCUMENTID for EHMI EnvelopeReceipt

    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
            urn:dk:healthcare:prod:messaging:oasis:ebxml:schema:xsd:[bpps-signaltype]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

DOCUMENTID EHMI EnvelopeReceipt eksempel:
    
    <Scope> 
        <Type>DOCUMENTID</Type> 
        <InstanceIdentifier>
           urn:dk:healthcare:prod:messaging:oasis:ebxml:schema:xsd:SBDHReceiptAcknowledgement
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

#### PROCESSID

Værdien i InstanceIdentifier er identisk med den tilsvarende ProcessId SMP-registrering .
I 4-corner modellen  sendes SDN-emergence-registreringen med til SMP, så afsenders AP kan slå endelig modtager, også kaldet finalreceipient op korrekt i SMP.

    <Scope> 
        <Type>PROCESSID</Type> 
        <InstanceIdentifier>
            [Process Identifier value] 
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>
	
PROCESSID for SDN Eksempel

Altid

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

Patientens CPR nummer indgår som identifier til brug for EDS Forsendelsesstatus og XDS-metadata. Patientens CPR nummer er maskeret på samme måde som sundhedsarbejders identiteter er maskeret af SDS, med UUID version 5 . Namespace for maskering med UUID version 5 er jf. https://www.ietf.org/rfc/rfc4122.txt Appendix C, uuid_t NameSpace_OID, ns:OID ("6ba7b812-9dad-11d1-80b4-00c04fd430c8”). Dette er også anvendt af SDS på NSP ifm. Beregning af pseudonymer (se https://www.nspop.dk/pages/viewpage.action?pageId=220266653#id-3.(C)Pseudonymiseringidatakildertilborgervendtebrugergr%C3%A6nsefladesystemer-C-Beregningafpseudonymer)
Input til generatoren skal være patients cpr nummer.
CPR nummeret kan være af typen:
https://hl7.dk/fhir/core/2.2.0/StructureDefinition-dk-core-cpr-identifier.html 
eller
https://medcomfhir.dk/ig/core/2.3.0/StructureDefinition-medcom-core-ecpr-identifier.html 

    <Scope>
        <Type>PATIENTID</Type>
        <InstanceIdentifier>
            UUIDv5-maskeret([Bundle.entry.resource.ofType(Patient).identifier.where(system=’urn:oid:1.2.208.176.1.2’).value])
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

PATIENTID for MedCom FHIR meddelelser - eksempel:

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

SENDERID for MedCom FHIR meddelelser - eksempel:

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

RECEIVERID for MedCom FHIR meddelelser - eksempel:

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


MESSAGEIDENTIFIER eksempel:

    <Scope>
	    <Type>MESSAGEIDENTIFIER</Type> 
        <InstanceIdentifier>f06c1ac8-6096-5178-a380-2831d2456986</InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>

<br/>

###### Hvis MedCom meddelelsen er af typen EHMI EnvelopeReceipt

    <Scope>
	    <Type>MESSAGEIDENTIFIER</Type> 
	    <InstanceIdentifier>
            [generated]
        </InstanceIdentifier>
        <Identifier>dk-medcom-messaging</Identifier>
    </Scope>


MESSAGEIDENTIFIER eksempel:

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

MESSAGEENVELOPEIDENTIFIER eksempel:
    
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

ORIGINALMESSAGEIDENTIFIER eksempel:

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

ORIGINALMESSAGEENVELOPEIDENTIFIER eksempel:

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

ORIGINALMESSAGESTANDARD eksempel:

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


ORIGINALMESSAGEVERSION eksempel:

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

ORIGINALENVELOPEIDENTIFIER eksempel:
    
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

Altid FHIR DocumentReference for den pågældende meddelelsestype med tilhørende variable for at kunne identificere f.eks. patient og organisation

    <Scope>
	    <Type>XDS-METADATA</Type> 
	        <InstanceIdentifier>
                <[CDATA: <DocumentReference> [DocumentReference-structure] </DocumentReference>]>
            </InstanceIdentifier>
	    <Identifier>dk-medcom-DocumentReference</Identifier>
    </Scope>

<br/>

#### XDS-Metadata (eksempel på encoded value)

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

I et EHMI-SBDH-ReceiptAcknowledgement- - Request er scope altid dette:
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

Eksempel:

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

Eksempel:

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

Eksempel:

    <CorrelationInformation>
        …
        <ExpectedResponseDateTime>
            2021-02-17T09:40:10+01:00
        </ExpectedResponseDateTime>
    <CorrelationInformation>

<br/>

##### CorrelationInformation samlet eksempel

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

Altid 

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

##### SBDH BusinessServices - Request eksempel

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

##### Reliable messaging - BusinessService Request samlet eksempel

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

I et EHMI-SBDH-ReceiptAcknowledgement - Response er scope altid dette:

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

##### RequestingDocumentCreationDateTime eksempel

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

##### RequestingDocumentInstanceIdentifier eksempel

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

##### CorrelationInformation samlet eksempel

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

Altid 

    <BusinessServiceName>
        EHMI-SBDH-ReceiptAcknowledgement-Response
    </BusinessServiceName>

<br/>

###### ServiceTransaction – TypeOfServiceTransaction

Altid
    TypeOfServiceTransaction=”RespondingServiceTransaction”

<br/>

###### ServiceTransaction – IsNonRepudiationRequired

Altid

    IsNonRepudiationRequired=”false” 

<br/>

###### ServiceTransaction – IsAuthenticationRequired

Altid

    IsAuthenticationRequired=”false” 

<br/>

###### ServiceTransaction – IsNonRepudiationOfReceiptRequired

Altid

    IsNonRepudiationOfReceiptRequired=”false” 

<br/>

###### ServiceTransaction – IsIntelligibleCheckRequired

Altid
    IsIntelligibleCheckRequired=”false” 

<br/>

###### ServiceTransaction – IsApplicationErrorResponseRequested

Altid
    IsApplicationErrorResponseRequested=”false” 

<br/>

###### ServiceTransaction – TimeToAcknowledgeReceipt

Altid
    TimeToAcknowledgeReceipt=”0” (ms)

<br/>

###### ServiceTransaction – TimeToAcknowledgeAcceptance

Altid

    TimeToAcknowledgeAcceptance=”0” (=bruges pt ikke)

<br/>

###### 0	ServiceTransaction – TimeToPerform

Altid
    TimeToPerform=”0” (=bruges pt ikke)

<br/>

###### ServiceTransaction - Recurrence

Altid
    Recurrence=”0” (=bruges pt ikke)

<br/>

###### SBDH BusinessServices - Response eksempel

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

###### Reliable messaging - BusinessService Response samlet eksempel
    
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
    - Identifier (GLN-nummer for afsender) 
•	Receiver
    - Identifier (GLN-nummer for modtager) 
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

OriginalMessageIdentifier eksempel
    
    <bpssignal:OriginalMessageIdentifier>
        9a6ff822-08de-5a6f-9670-9fa4b9d2f0dc
    </bpssignal:OriginalMessageIdentifier>		

<br/>

###### OriginalDocumentIdentifier

Samme datatype som SBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier

    <bpssignal:OriginalDocumentIdentifier>
        [RequestingSBDH/BusinessScope/Scope(DOCUMENTID)/InstanceIdentifier]
    </bpssignal:OriginalDocumentIdentifier>

OriginalDocumentIdentifier eksempel

    <bpssignal:OriginalDocumentIdentifier>
        urn:dk:healthcare:prod:messaging:medcom: fhir:structuredefinition:[Bundle/MessageHeader/eventCoding/code.value ]#urn:dk:medcom:fhir:[Bundle/MessageHeader/definition/[value of MessageDefinition version-part]]
    </bpssignal:OriginalDocumentIdentifier>

<br/>

###### OriginalMessageDateTime

Altid på formen: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC] 

    <bpssignal:OriginalMessageDateTime>
        [RequestingSBDH/DocumentIdentification/CreationDateAndTime]
    </bpssignal:OriginalMessageDateTime>

OriginalMessageDateTime eksempel

    <bpssignal:OriginalMessageDateTime>
        2024-03-01T16:19:00+01:00
    </bpssignal:OriginalMessageDateTime>

<br/>

###### ThisMessageDateTime

Altid på formen: [YYYY-MM-DD]T[tt:mm:ss]+[offset-to-UTC]

    <bpssignal:ThisMessageDateTime>
        [RespondingSBDH.DocumentIdentification.CreationDateAndTime]
    </bpssignal:ThisMessageDateTime>

ThisMessageDateTime eksempel

    <bpssignal:ThisMessageDateTime>
        2024-03-01T16:19:10+01.00
    </bpssignal:ThisMessageDateTime>

<br/>

###### FromPartyInfo
 
    <bpssignal:FromPartyInfo type=[RequestingSBDH:Receiver.Identifier@Authority]>
        [RequestingSBDH:Receiver.Identifier]
    </bpssignal:FromPartyInfo>

FromPartyInfo eksempel

    <bpssignal:FromPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000201389
    </bpssignal:FromPartyInfo>

<br/>

###### ToPartyInfo

    <bpssignal:ToPartyInfo type=[RequestingSBDH:Sender.Identifier@Authority]>
        [RequestingSBDH:Sender.Identifier]
    </bpssignal:ToPartyInfo> 

ToPartyInfo eksempel

    <bpssignal:ToPartyInfo type=”iso6523-actorid-upis”>
        0088:5790000121526
    </bpssignal:ToPartyInfo>

 
<br/>

##### Samlet SBDH ReceiptAcknowledgement eksempel

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

ExceptionType eksempel

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

Reason eksempel

    <bpssignal:Reason>
        Internal error
    </bpssignal:Reason>

<br/>

###### ExceptionMessage

Se ExceptionType
    <bpssignal:ExceptionMessage>
        [ExceptionMessage]
    </bpssignal:ExceptionMessage>

ExceptionMessage eksempel

    <bpssignal:ExceptionMessage>
        javax.xml.bind.UnmarshalException 
        - with linked exception:
        [org.xml.sax.SAXParseException; lineNumber: 7; columnNumber: 21; The end-tag for element type "ns3:Sender" must end with a '&gt;' delimiter.]
    </bpssignal:ExceptionMessage>

 
<br/>

##### Samlet Receipt Acknowledgement  Exception eksempel

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

