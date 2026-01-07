Instance: DocumentReferenceBundle-7c4bc126-0fb3-4f98-9e85-98790de415bc
InstanceOf: Bundle
Usage: #example
* type = #collection

* entry[0].resource = 7c4bc126-0fb3-4f98-9e85-98790de415bc
* entry[+].resource = be9f367d-a84a-4815-90a8-c83a03813fd8
* entry[+].resource = a0330c62-fe29-4719-83fa-a94959084f29
* entry[+].resource = bbcd4817-1c4b-4089-a712-346f65ec16f9 //Patient

Instance: 7c4bc126-0fb3-4f98-9e85-98790de415bc
InstanceOf: DocumentReference
Usage: #example
* meta.profile = "https://medcomfhir.dk/ig/xdsdocuments/StructureDefinition/homecare-observation-documentreference"
* contained[0] = be9f367d-a84a-4815-90a8-c83a03813fd8
* contained[+] = a0330c62-fe29-4719-83fa-a94959084f29
* contained[+] = bbcd4817-1c4b-4089-a712-346f65ec16f9
* extension[0].url = "https://medcomfhir.dk/ig/document/StructureDefinition/medcom-xds-homecommunityid-extension"
* extension[=].valueCoding = urn:oid:1.2.208.176.8.1#1.2.208.176.43210.8.20 "TEST2"
* extension[+].url = "https://medcomfhir.dk/ig/xdsmetadata/StructureDefinition/medcom-xds-version-id-extension"
* extension[=].valueString = "1.1.0"
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* status = #current
* type = urn:oid:1.2.208.184.100.1#HCOMsg "HomeCareObservation Message"
* category.coding.code = #Workflow
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* author = Reference(a0330c62-fe29-4719-83fa-a94959084f29)
* authenticator = Reference(be9f367d-a84a-4815-90a8-c83a03813fd8)
* securityLabel.coding.code = #N
* content.attachment.contentType = #text/xml
* content.attachment.language = #da
* content.attachment.url = "DOC001.XML"
* content.attachment.size = 3654
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.title = "Kommunale prøvesvar for 0201919990"
* content.attachment.creation = "2023-09-08T13:28:17+01:00"
* content.format = urn:oid:1.2.208.184.100.10#urn:ad:dk:medcom:pdd-v1.0.1:full "DK PDD document"
* context.event = urn:oid:1.2.208.176.2.4#ALAL02 "Hjertesygdomme"
* context.facilityType = urn:oid:2.16.840.1.113883.6.96#550621000005101 "hjemmesygeplejeenhed"
* context.practiceSetting = urn:oid:2.16.840.1.113883.6.96#658161000005107 "hjemmesygepleje"
* context.sourcePatientInfo = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)

/*
Instance: be9f367d-a84a-4815-90a8-c83a03813fd8
InstanceOf: Practitioner
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-practitioner"
* name.given = "Mia"
* telecom.system = #phone
* telecom.value = "+45 05577668"

Instance: a0330c62-fe29-4719-83fa-a94959084f29
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-producer-organization"
* identifier[0].system = "https://www.gs1.org/gln"
* identifier[=].value = "5790000123117"
* identifier[+].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "1144561000016002"
* identifier[+].system = "http://medcomfhir.dk/ig/terminology/CodeSystem/MedComProducentID"
* identifier[=].value = "KAF"
* name = "Pleje og Rehabilitering"

Instance: bbcd4817-1c4b-4089-a712-346f65ec16f9
InstanceOf: Patient
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-patient"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2509479989"
* name.use = #official
* name.family = "Elmer"
*/
