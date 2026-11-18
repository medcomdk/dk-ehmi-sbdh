Logical: VANSEnvelopeModel
Id: vans-envelope-logical-model
Title: "VANSEnvelope Logical Model (incl. Reliable Messaging)"
Description: "Logisk FHIR-model af MedComs VANSEnvelope med understøttelse af Reliable Messaging."
Characteristics: #can-be-target
* ^status = #draft

* message 1..1 BackboneElement "Meddelelseskuvert" "Indeholder metadata til routing, Reliable Messaging og selve payload-data."
  * metaInformation 1..1 BackboneElement "Metadata om forsendelsen" "Oplysninger om afsender, modtager, dokumenttype og transport."
    * sender 1..1 BackboneElement "Afsender" "Identifikation af afsendende part."
      * identifier 1..1 Identifier "Afsender-ID" "Lokationsnummer (EAN) eller SOR-id."
      * name 0..1 string "Afsendernavn" "Navn på afsendende organisation."
    * receiver 1..1 BackboneElement "Modtager" "Identifikation af modtagende part."
      * identifier 1..1 Identifier "Modtager-ID" "Lokationsnummer (EAN) eller SOR-id."
      * name 0..1 string "Modtagernavn" "Navn på modtagende organisation."
    * document 1..1 BackboneElement "Dokumentmetadata" "Beskriver indholdet i kuverten."
      * format 1..1 code "Format" "Angiver formatet, f.eks. 'FHIR'."
      * name 1..1 string "Meddelelsesnavn" "Navnet på FHIR-standarden, f.eks. 'CareCommunication'."
      * version 1..1 string "Version" "Versionsnummeret på FHIR-standarden."
      * messageId 1..1 id "Kuvert-ID (MessageEnvelopeId)" "Unikt ID for selve kuverten."
      * timestamp 1..1 dateTime "Afsendelsestidspunkt" "Tidspunkt for oprettelse/afsendelse af kuverten."
    * transport 1..1 BackboneElement "Transportinformation" "Tekniske parametre til VANS og Reliable Messaging."
      * transformMessage 0..1 boolean "Konverteringsflag" "Angiver om VANS-leverandøren skal mappe mellem formater."
      * reliableMessaging 1..1 BackboneElement "Reliable Messaging" "Parametre til styring af kvitteringer og genfremsendelse."
        * acknowledgementRequest 1..1 boolean "Kvitteringsønske" "SKAL være 'true' for MedCom FHIR."
        * originalMessageId 0..1 id "Oprindeligt Meddelelses-ID" "Fastholder ID fra første afsendelse ved retry."
        * correlationId 0..1 id "Korrelations-ID" "Reference-ID til kvitteringsmeddelelser."
        * retryCount 0..1 integer "Genfremsendelsestæller" "Antal genfremsendelser (maks 2)."
        * timeToLive 0..1 dateTime "Udløbstidspunkt" "Seneste leveringstidspunkt."
        * acknowledgementType 0..1 code "Kvitteringstype" "Ønsket kvitteringstype."
      * serviceTag 0..* BackboneElement "Service-tags" "Nøgle/værdi-par til netværksstyring."
        * name 1..1 string "Tag-navn" "F.eks. 'MCM:MIME'."
        * value 1..1 string "Tag-værdi" "F.eks. 'application/fhir+json'."
  * data 1..1 base64Binary "Payload (Base64)" "Selve FHIR-meddelelsen indkodet som Base64."

// -----------------------------------------------------------------------------

Logical: VANSEnvelopeReceiptModel
Id: vans-envelope-receipt-logical-model
Title: "VANSEnvelope Receipt Logical Model"
Description: "Logisk FHIR-model af MedComs VANSEnvelope Receipt til tekniske transportkvitteringer."
Characteristics: #can-be-target
* ^status = #draft

* receipt 1..1 BackboneElement "Transportkvittering (Receipt)" "Rod-element for en teknisk kvittering i VANS-netværket."
  * metaInformation 1..1 BackboneElement "Kvitterings-metadata" "Oplysninger om afsender, modtager og reference."
    * sender 1..1 BackboneElement "Kvitteringsafsender" "Parten der udsteder kvitteringen."
      * identifier 1..1 Identifier "Afsender-ID" "Lokationsnummer (EAN) eller VANS-operatør ID."
      * name 0..1 string "Afsendernavn" "Navn på kvitterende part."
    * receiver 1..1 BackboneElement "Kvitteringsmodtager" "Den oprindelige afsender af meddelelsen."
      * identifier 1..1 Identifier "Modtager-ID" "Lokationsnummer (EAN) på oprindelig afsender."
      * name 0..1 string "Modtagernavn" "Navn på oprindelig afsender."
    * reference 1..1 BackboneElement "Forsendelsesreference" "Binder kvitteringen sammen med den oprindelige kuvert."
      * receiptId 1..1 id "Kvitterings-ID" "Unikt ID for kvitteringskuverten."
      * originalMessageId 1..1 id "Oprindeligt Kuvert-ID" "Matcher MessageEnvelopeId fra oprindelig kuvert."
      * timestamp 1..1 dateTime "Kvitteringstidspunkt" "Tidspunkt for generering af kvitteringen."
  * status 1..1 BackboneElement "Leveringsstatus" "Resultatet af den tekniske transport."
    * statusCode 1..1 code "Statuskode" "Angiver om leveringen lykkedes eller fejlede."
    * statusCode from VANSReceiptStatusVS (required)
    * statusText 0..1 string "Statusbeskrivelse" "Menneskelæsbar beskrivelse af kvitteringsstatus."
    * error 0..* BackboneElement "Fejloplysninger" "Detaljer om tekniske fejl."
      * errorCode 1..1 code "Fejlkode" "Teknisk VANS-fejlkode."
      * errorMessage 1..1 string "Fejltekst" "Uddybende fejlbeskrivelse."
      * severity 0..1 code "Alvorsgrad" "F.eks. 'Fatal', 'Error' eller 'Warning'."

// -----------------------------------------------------------------------------

Logical: EHMISBDHEnvelopeModel
Id: ehmi-sbdh-envelope-logical-model
Title: "ehmiSBDH Envelope Logical Model"
Description: "Logisk FHIR-model af MedComs EHMI Standard Business Document Header (ehmiSBDH) inkl. Reliable Messaging."
Characteristics: #can-be-target
* ^status = #draft

* standardBusinessDocument 1..1 BackboneElement "StandardBusinessDocument" "Rod-element der indkapsler SBDH-header og payload."
  * standardBusinessDocumentHeader 1..1 BackboneElement "StandardBusinessDocumentHeader" "Metadata til routing, dokumentidentifikation og Reliable Messaging."
    * headerVersion 1..1 string "HeaderVersion" "Version af SBDH-specifikationen (typisk '1.0')."
    * sender 1..* BackboneElement "Sender" "Afsendende part i EHMI-netværket."
      * identifier 1..1 Identifier "Sender Identifier" "Partens identifikator (EAN/SOR)."
      * contactInformation 0..* BackboneElement "Kontaktinformation" "Valgfri kontaktinfo på afsender."
        * contact 1..1 string "Kontaktperson/enhed" "Navn på kontakt."
        * emailAddress 0..1 string "E-mail" "Kontakt-e-mail."
        * telephoneNumber 0..1 string "Telefonnummer" "Kontakttelefon."
    * receiver 1..* BackboneElement "Receiver" "Modtagende part i EHMI-netværket."
      * identifier 1..1 Identifier "Receiver Identifier" "Modtagerens identifikator (EAN/SOR)."
    * documentIdentification 1..1 BackboneElement "DocumentIdentification" "Unik identifikation af forsendelsen."
      * standard 1..1 string "Standard" "Navn på standarden."
      * typeVersion 1..1 string "TypeVersion" "Versionsnummer på meddelelsesstandarden."
      * instanceIdentifier 1..1 id "InstanceIdentifier (Envelope ID)" "Unikt UUID for kuverten."
      * type 1..1 string "Type" "Meddelelsestype (f.eks. 'CareCommunication')."
      * multipleType 0..1 boolean "MultipleType" "Angiver om payload indeholder flere dokumenter."
      * creationDateAndTime 1..1 dateTime "CreationDateAndTime" "Tidspunkt for oprettelse af SBDH-kuverten."
    * businessScope 1..1 BackboneElement "BusinessScope" "Scopes til processer, dokument-ID og Reliable Messaging."
      * scope 1..* BackboneElement "Scope" "Individuelt scope-element."
        * type 1..1 code "Scope Type" "F.eks. 'DOCUMENTID', 'PROCESSID' eller 'EHMI_RELIABLE_MESSAGING'."
        * instanceIdentifier 1..1 string "Scope InstanceIdentifier" "Værdien for det pågældende scope."
        * identifier 0..1 string "Scope Identifier" "Supplerende identifikator eller profil-URI."
        * correlationInformation 0..* BackboneElement "CorrelationInformation" "Parametre til Reliable Messaging."
          * requestingDocumentCreationDateTime 0..1 dateTime "Oprindeligt oprettelsestidspunkt" "Tidspunkt for første afsendelse."
          * requestingDocumentInstanceIdentifier 0..1 id "Oprindeligt Dokument-ID" "Binder genfremsendelser sammen."
          * expectedResponseDateTime 0..1 dateTime "Forventet kvitteringstidspunkt" "Tidsfrist for kvittering."
  * payload 1..1 BackboneElement "Payload" "Selve meddelelsesindholdet."
    * mimeType 1..1 code "MIME-type" "F.eks. 'application/fhir+json'."
    * content 1..1 base64Binary "Indhold" "Det indlejrede FHIR-Bundle."

// -----------------------------------------------------------------------------

Logical: EHMISBDHReceiptModel
Id: ehmi-sbdh-receipt-logical-model
Title: "ehmiSBDH Receipt & Delivery Status Logical Model"
Description: "Logisk FHIR-model af en kvitteringskuvert i ehmiSBDH-format samt tilhørende EHMI Delivery Status (EDS)."
Characteristics: #can-be-target
* ^status = #draft

* receiptEnvelope 1..1 BackboneElement "ehmiSBDH Kvitteringskuvert" "SBDH-kuvert der bærer en kvittering eller transportstatus retur."
  * header 1..1 BackboneElement "Kvitterings-SBDH Header" "Routing- og referenceoplysninger for kvitteringen."
    * sender 1..1 Identifier "Kvitteringsafsender" "EAN/SOR-identifikator på kvitterende part."
    * receiver 1..1 Identifier "Kvitteringsmodtager" "EAN/SOR-identifikator på den oprindelige afsender."
    * documentIdentification 1..1 BackboneElement "DocumentIdentification" "Identificerer pakken som en kvittering."
      * standard 1..1 string "Standard" "Standard-URI."
      * typeVersion 1..1 string "TypeVersion" "Version af kvitteringsstandarden."
      * instanceIdentifier 1..1 id "Kvitteringskuvert-ID" "Unikt UUID for kvitteringsforsendelsen."
      * type 1..1 string "Type" "Angiver kvitteringstype, f.eks. 'edsBasicDeliveryStatus'."
      * creationDateAndTime 1..1 dateTime "Tidspunkt" "Tidspunkt for generering af kvitteringen."
    * businessScope 1..1 BackboneElement "BusinessScope (Korrelation)" "Binder kvitteringen til den oprindelige forsendelse."
      * originalEnvelopeId 1..1 id "Oprindeligt InstanceIdentifier" "Matcher InstanceIdentifier fra oprindelig kuvert."
      * originalMessageId 0..1 id "Oprindeligt FHIR MessageHeader.id" "Matcher ID'et på den underliggende FHIR-meddelelse."
      * processId 1..1 string "ProcessId" "Proces-URI for kvitteringen."
  * status 1..1 BackboneElement "Kvitterings- og Leveringsstatus" "Resultatet af transporten eller valideringen."
    * statusCategory 1..1 code "Kvitteringsniveau" "F.eks. 'EDS' eller 'FHIR-Acknowledgement'."
    * outcome 1..1 code "Statuskode" "Angiver om leveringen lykkedes ('OK') eller fejlede ('Error')."
    * outcome from EHMIReceiptOutcomeVS (required)
    * timestamp 1..1 dateTime "Leveringstidspunkt" "Præcist tidspunkt for modtagelse/validering."
    * errorDetails 0..* BackboneElement "Fejldetaljer" "Udfyldes hvis outcome er 'Error'."
      * errorCode 1..1 code "Fejlkode" "AS4-transportfejlkode eller FHIR OperationOutcome-kode."
      * errorDescription 1..1 string "Fejlbeskrivelse" "Detaljeret fejltekst."
