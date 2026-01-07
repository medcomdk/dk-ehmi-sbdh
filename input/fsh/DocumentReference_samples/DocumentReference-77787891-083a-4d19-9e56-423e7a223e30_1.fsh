/*
Instance: 77787891-083a-4d19-9e56-423e7a223e31
InstanceOf: DocumentReference
Description: "DocumentReference for 401cbc36-db1e-4fe0-bf90-6df331dde179"
Usage: #example
* meta.profile = "https://medcomfhir.dk/ig/xdsdocuments/StructureDefinition/homecare-observation-documentreference"
* contained[0] = 42cb9200-f421-4d08-8391-7d51a2503cb4
* contained[+] = 8fa7df76-bec2-4fe2-9a44-750030a0eda0
* contained[+] = 37628912-7816-47a3-acd8-396b610be142
//* extension[0].url = "https://medcomfhir.dk/ig/document/StructureDefinition/medcom-xds-homecommunityid-extension"
//* extension[=].valueCoding = urn:oid:1.2.208.176.8.1#1.2.208.176.43210.8.20 "TEST2"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[=].valueString = "1.1.0"
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* status = #current
* type = urn:oid:1.2.208.184.100.1#HCOMsg "HomeCareObservation Message"
* category.coding.code = #Workflow
* subject = Reference(37628912-7816-47a3-acd8-396b610be142)
* author = Reference(8fa7df76-bec2-4fe2-9a44-750030a0eda0)
* authenticator = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)
* securityLabel.coding.code = #N
* content.attachment.contentType = #text/xml
* content.attachment.language = #da
* content.attachment.url = "DOC001.XML"
* content.attachment.size = 3654
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.title = "Kommunale prøvesvar for 0201919990"
* content.attachment.creation = "2023-09-08T13:28:17+01:00"
* content.format = urn:oid:1.2.208.184.100.10#urn:ad:dk:medcom:pdd-v1.0.1:full "DK PDD document"
//* context.event = urn:oid:1.2.208.176.2.4#ALAL02 "Hjertesygdomme"
* context.facilityType = urn:oid:2.16.840.1.113883.6.96#550621000005101 "hjemmesygeplejeenhed"
* context.practiceSetting = urn:oid:2.16.840.1.113883.6.96#658161000005107 "hjemmesygepleje"
* context.sourcePatientInfo = Reference(37628912-7816-47a3-acd8-396b610be142)

Instance: 42cb9200-f421-4d08-8391-7d51a2503cb4
InstanceOf: Practitioner
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-practitioner"
* name.family = "Andersen"
* name.given = "Sidsel"

Instance: 8fa7df76-bec2-4fe2-9a44-750030a0eda0
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-organization"
* identifier.system = "urn:oid:1.2.208.176.1.1"
* identifier.value = "61741000016007"
* name = "Lægerne Hasseris Bymidte"

Instance: 37628912-7816-47a3-acd8-396b610be142
InstanceOf: Patient
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-patient"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "0201919990"
* name.use = #official
* name.family = "Lauridsen"
* name.given[0] = "Else"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1991-02-02"
*/