// Metadata instance
/*
Instance: 77787891-083a-4d19-9e56-423e7a223e30
InstanceOf: DocumentReference
Title: "Instance of HomeCareObservation DocumentReference."
Description: "Instance of HomeCareObservation DocumentReference containing relevant metadata"
Usage: #example
* meta.profile = "https://medcomfhir.dk/ig/xdsdocuments/StructureDefinition/homecare-observation-documentreference"
//* identifier = 12c2deaf-389a-4f7d-8133-60b24c75cd7f
* contained[+] = 42cb9200-f421-4d08-8391-7d51a2503cb4
* contained[+] = 8fa7df76-bec2-4fe2-9a44-750030a0eda0
* contained[+] = 37628912-7816-47a3-acd8-396b610be142
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* status = #current "Current"
* type = $MedComOID#HCOMsg "HomeCareObservation Message"
* authenticator = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)
* category.coding.code = $ClassCodeCS#Workflow
//* category = $DanishXdsOid#006 //"Workflow" 
* author[institution] = Reference(8fa7df76-bec2-4fe2-9a44-750030a0eda0)
* subject = Reference(37628912-7816-47a3-acd8-396b610be142)
//* securityLabel = #N
* content.attachment.contentType = $IANAMediaOID#text/xml "MimeType-text/xml"
* content.attachment.language = $IANALanguageOID#da "Danish"
* content.attachment.creation = "2023-09-08T13:28:17+01:00" 
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.size = 3654
* content.attachment.url = "DOC001.XML"
* content.attachment.title = "Kommunale prøvesvar for 0201919990"
* content.format = $MedComFormatOID#urn:ad:dk:medcom:pdd-v1.0.1:full "DK PDD document" // Danish XDS typecode must be updated
* context.event = $SKSOID#ALAL02 "Hjertesygdomme" // Danish XDS typecode must be updated
* context.sourcePatientInfo = Reference(37628912-7816-47a3-acd8-396b610be142)
* context.facilityType = $SnomedctOID#550621000005101 "hjemmesygeplejeenhed" // Danish XDS typecode must be updated
* context.practiceSetting = $SnomedctOID#658161000005107 "hjemmesygepleje" // Danish XDS typecode must be updated
//* extension[0].url = "https://medcomfhir.dk/ig/document/StructureDefinition/medcom-xds-homecommunityid-extension"
* extension[0].valueCoding = $DanishxdsOID#1.2.208.176.43210.8.20 "TEST2"
* extension[1].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[1].valueString = "1.1.0"

Instance: 42cb9200-f421-4d08-8391-7d51a2503cb4
InstanceOf: MedComDocumentPractitioner
Title: "XDS document bundled Author Person"
Description: "Instance of a XDS document bundled  author person"
Usage: #example
* name.given = "Sidsel"
* name.family = "Andersen"

Instance: 8fa7df76-bec2-4fe2-9a44-750030a0eda0
InstanceOf: MedComDocumentOrganization
Title: "XDS document bundled Author Organization"
Description: "Instance of a XDS document bundled  author organization"
Usage: #example
* identifier[SOR-ID].value = "61741000016007"
* identifier[SOR-ID].system = "urn:oid:1.2.208.176.1.1"
* name = "Lægerne Hasseris Bymidte"

Instance: 37628912-7816-47a3-acd8-396b610be142
InstanceOf: MedComDocumentPatient
Title: "XDS document bundled Source Patient"
Description: "Instance of a XDS document bundled  source patient"
Usage: #example
* identifier[cpr].system = "urn:oid:1.2.208.176.1.2"
* identifier[cpr].value = "0201919990"
* name[official].use = #official
* name[official].family = "Lauridsen"
* name[official].given[0] = "Else"
* name[official].given[+] = "Test"
* gender = #female
* birthDate = "1991-02-02"
*/