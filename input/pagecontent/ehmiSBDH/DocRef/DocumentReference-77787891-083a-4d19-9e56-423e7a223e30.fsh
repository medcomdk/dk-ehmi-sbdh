Alias: $sct = http://snomed.info/sct

Instance: 77787891-083a-4d19-9e56-423e7a223e30
InstanceOf: DocumentReference
Usage: #example
* meta.profile = "https://medcomfhir.dk/ig/xdsdocuments/StructureDefinition/homecare-observation-documentreference"
* contained[0] = 42cb9200-f421-4d08-8391-7d51a2503cb4
* contained[+] = 8fa7df76-bec2-4fe2-9a44-750030a0eda0
* contained[+] = 37628912-7816-47a3-acd8-396b610be142
* extension[0].url = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-homecommunityid-extension"
* extension[=].valueCoding = urn:oid:1.2.208.176.8.1#1.2.208.176.8.1 "Common Danish IHE XDS domain. Integrating the Healthcare Enterprise (IHE) cross[X]-enterprise Document Sharing (XDS) domain"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[=].valueString = "2.0.0"
* masterIdentifier.use = #usual
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* identifier.value = "urn:uuid:5941658d-b927-4641-ac6a-52636497063f"
* status = #current
* type = urn:oid:1.2.208.184.100.1#HCOM "HomeCareObservation message"
* category = urn:oid:1.2.208.184.100.9#006 "Workflow"
* subject = Reference(37628912-7816-47a3-acd8-396b610be142)
* author = Reference(8fa7df76-bec2-4fe2-9a44-750030a0eda0)
* authenticator = Reference(42cb9200-f421-4d08-8391-7d51a2503cb4)
* securityLabel.coding.code = #N
* content.attachment.contentType = #application/fhir+xml
* content.attachment.language = #da
* content.attachment.url = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-message"
* content.attachment.size = 3654
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.title = "Kommunale prøvesvar for 0201919990"
* content.attachment.creation = "2025-12-18T13:28:17+01:00"
* content.format = urn:oid:1.2.208.184.100.10#urn:ad:dk:medcom:hcom-v1.2:full "DK HomeCareObservation message"
* context.facilityType.coding.version = "http://snomed.info/sct/554471000005108"
* context.facilityType.coding = $sct#550621000005101 "hjemmesygeplejeenhed"
* context.practiceSetting.coding.version = "http://snomed.info/sct/554471000005108"
* context.practiceSetting.coding = $sct#658161000005107 "hjemmesygepleje"
* context.sourcePatientInfo = Reference(37628912-7816-47a3-acd8-396b610be142)
* context.sourcePatientInfo.identifier.value = "0201919990"

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