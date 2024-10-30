/*
Instance: instanceHomeCareObservationDocumentReference
InstanceOf: HomeCareObservationDocumentReference
Usage: #example
//* meta.profile = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/homecare-observation-documentreference"
* contained[0] = instanceXDSAuthorPerson
* contained[+] = instanceDkCoreOrganization
* contained[+] = instanceXDSSourcePatient
* extension[0].url = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension"
* extension[=].valueCoding = urn:oid:1.2.208.176.8.1#1.2.208.176.43210.8.20 "TEST2"
* extension[+].url = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-version-id-extension"
* extension[=].valueString = "1.1.0"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* identifier.valueString = "12c2deaf-389a-4f7d-8133-60b24c75cd7f"
* status = #current
* docStatus = #final
* type = urn:oid:2.16.840.1.113883.6.1#55188-7 "Patient data Document"
* category = urn:oid:1.2.208.184.100.9#002 "Workflow"
* subject = Reference(instanceXDSSourcePatient)
* author = Reference(instanceDkCoreOrganization)
* authenticator = Reference(instanceXDSAuthorPerson)
* custodian = Reference(instanceDkCoreOrganization)
* securityLabel.coding.code = #N
* content.attachment.contentType = #application/fhir+json
* content.attachment.language = #da
* content.attachment.url = "DOC001.XML"
* content.attachment.size = 3654
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.title = "Kommunale prøvesvar for 0201919990"
* content.attachment.creation = "2024-04-01T00:00:00+01:00"
* content.format = urn:oid:1.2.208.184.100.10#urn:ad:dk:medcom:pdd-v1.0.1:full "DK PDD document"
* context.event = urn:oid:1.2.208.176.2.4#ALAL02 "Hjertesygdomme"
* context.facilityType = urn:oid:2.16.840.1.113883.6.96#550621000005101 "hjemmesygeplejeenhed"
* context.practiceSetting = urn:oid:2.16.840.1.113883.6.96#658161000005107 "hjemmesygepleje"
* context.sourcePatientInfo = Reference(instanceXDSSourcePatient)

Instance: instanceXDSAuthorPerson
InstanceOf: Practitioner
Usage: #inline
//* meta.profile = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/xds-author-person"
* name.family = "Andersen"
* name.given = "Sidsel"

Instance: instanceDkCoreOrganization
InstanceOf: DkCoreOrganization
//InstanceOf: Organization
Usage: #inline
//* meta.profile = "http://hl7.dk/fhir/core/StructureDefinition/dk-core-organization"
//* identifier.system = "urn:oid:1.2.208.176.1.1"
* identifier.valueString = "61741000016007"
* name = "Lægerne Hasseris Bymidte"

Instance: instanceXDSSourcePatient
//InstanceOf: Patient
InstanceOf: https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/xds-source-patient
Usage: #inline
//* meta.profile = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/xds-source-patient"
//* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.valueString = "0201919990"
* name[official].use = #official
* name[official].family = "Lauridsen"
* name[official].given[0] = "Else"
* name[official].given[+] = "Test"
* gender = #female
* birthDate = "1991-02-02"

// Metadata instance
Instance: instanceHomeCareObservationDocumentReference
//Instance: 77787891-083a-4d19-9e56-423e7a223e31
InstanceOf: HomeCareObservationDocumentReference
Title: "HomeCareObservation DocumentReference Instance. "
Description: "HomeCareObservation DocumentReference Instance containing relevant metadata"
* contained[+] = instanceXDSAuthorPerson
* contained[+] = instanceDkCoreOrganization
* contained[+] = instanceXDSSourcePatient
//* contained[+] = 42cb9200-f421-4d08-8391-7d51a2503cb4
//* contained[+] = 8fa7df76-bec2-4fe2-9a44-750030a0eda0
//* contained[+] = 37628912-7816-47a3-acd8-396b610be142
* masterIdentifier.value = "urn:uuid:fe27d893-6b9e-4e3d-91b0-72d033ce5c07"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* identifier.valueString = "12c2deaf-389a-4f7d-8133-60b24c75cd7f" // = FHIR messageheader.id
* docStatus = #final "Final"
* status = #current "Current"
* type = $LoincOID#55188-7 "Patient data Document" // Danish XDS typecode must be updated
* category = $DanishiheOID#002 "Workflow" // Danish XDS Classcode must be updated
* subject = Reference(instanceXDSSourcePatient) // DocumentEntry.sourcePatientId
//* subject = Reference(37628912-7816-47a3-acd8-396b610be142)
* author = Reference(instanceDkCoreOrganization)
//* author = Reference(8fa7df76-bec2-4fe2-9a44-750030a0eda0)
* authenticator = Reference(instanceXDSAuthorPerson)
* custodian = Reference(instanceDkCoreOrganization)
// content
* content.attachment.contentType = $IANAMediaOID#application/fhir+json "MimeType-fhir/json"
//* content.attachment.contentType = $IANAMediaOID#application/fhir+xml "MimeType-fhir/xml"
* content.attachment.language = $IANALanguageOID#da "Danish"
* content.attachment.creation = "2024-04-01T00:00:00+01:00" // FHIR message bundle.
* content.attachment.hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
* content.attachment.size = 3654
* content.attachment.url = "DOC001.XML"
* content.attachment.title = "Kommunale prøvesvar for 0201919990"
* content.format = $MedComFormatOID#urn:ad:dk:medcom:pdd-v1.0.1:full "DK PDD document" // Danish XDS typecode must be updated
// context
* context.event = $SKSOID#ALAL02 "Hjertesygdomme" // Danish XDS typecode must be updated
* context.facilityType = $SnomedctOID#550621000005101 "hjemmesygeplejeenhed" // Danish XDS typecode must be updated
* context.practiceSetting = $SnomedctOID#658161000005107 "hjemmesygepleje" // Danish XDS typecode must be updated
* context.sourcePatientInfo = Reference(instanceXDSSourcePatient) // DocumentEntry.sourcePatientInfo

* extension[0].url = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension"
* extension[0].valueCoding = $DanishxdsOID#1.2.208.176.43210.8.20 "TEST2"
* extension[1].url = "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-version-id-extension"
* extension[1].valueString = "1.1.0"
*/