
Instance: e16a8fb2-41dd-42b7-8a06-9c3977c4c7a5
InstanceOf: DocumentReference
Description: "DocumentReference for fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
Usage: #example
* meta.profile = "https://medcomfhir.dk/ig/xdsdocuments/StructureDefinition/homecare-observation-documentreference"
* contained[0] = 84b20d13-c7ee-417f-906d-c54ec3639d56
* contained[+] = 988cbb72-2054-4d15-8c53-84665b65b4b6
* contained[+] = a7b72c02-0baa-40f2-82a3-eee59d203764
//* extension[0].url = "https://medcomfhir.dk/ig/document/StructureDefinition/medcom-xds-homecommunityid-extension"
//* extension[=].valueCoding = urn:oid:1.2.208.176.8.1#1.2.208.176.43210.8.20 "TEST2"
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version"
* extension[=].valueString = "2.0"
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* status = #current
* type = urn:oid:1.2.208.184.100.1#HCOM "HomeCareObservation Message"
* category.coding = urn:oid:1.2.208.184.100.9#006 "Workflow"
* subject = Reference(a7b72c02-0baa-40f2-82a3-eee59d203764)
* author = Reference(988cbb72-2054-4d15-8c53-84665b65b4b6)
* authenticator = Reference(84b20d13-c7ee-417f-906d-c54ec3639d56)
* securityLabel.coding.code = #N
* content.attachment.contentType = $IANAMediaOID#application/fhir+json
* content.attachment.language = $IANALanguageOID#da
* content.attachment.url = "HomeCareObservation.json"
* content.attachment.size = 3654
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.title = "Kommunale prøvesvar for 2509479989"
* content.attachment.creation = "2026-01-16T10:05:15.979+01:00"
* content.format = urn:oid:1.2.208.184.100.10#urn:ad:dk:medcom:hcom-v1.1:full "DK HomeCareObservation message"
//* context.event = urn:oid:1.2.208.176.2.4#ALAL02 "Hjertesygdomme"
* context.facilityType = urn:oid:2.16.840.1.113883.6.96#550621000005101 "hjemmesygeplejeenhed"
* context.practiceSetting = urn:oid:2.16.840.1.113883.6.96#658161000005107 "hjemmesygepleje"
* context.sourcePatientInfo = Reference(a7b72c02-0baa-40f2-82a3-eee59d203764)

Instance: 84b20d13-c7ee-417f-906d-c54ec3639d56
InstanceOf: Practitioner
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-practitioner"
* name.family = "Svendsen"
* name.given[0] = "Trine"
* name.given[1] = "Kirkegaard"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:a6c11dab-a9e9-46b8-9bb3-fe06d6587e07"

Instance: 988cbb72-2054-4d15-8c53-84665b65b4b6
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-organization"
* identifier.system = "urn:oid:1.2.208.176.1.1"
* identifier.value = "937961000016000"
* name = "Ehmi Sender"

Instance: a7b72c02-0baa-40f2-82a3-eee59d203764
InstanceOf: Patient
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-patient"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2509479989"
* name.use = #official
* name.family = "Elmer"
* name.given = "Bruno"
* gender = #male
* birthDate = "1947-09-25"
