
/* Define the StructureDefinition for StandardBusinessDocumentHeader
Profile: StandardBusinessDocumentHeader
Parent: Basic
Id: standard-business-document-header
Title: "Standard Business Document Header"
Description: "StructureDefinition for Standard Business Document Header"

* extension contains
    http://example.com/fhir/StructureDefinition/header-version 1..1 MS and
    http://example.com/fhir/StructureDefinition/sender 1..1 MS and
    http://example.com/fhir/StructureDefinition/receiver 1..1 MS and
    http://example.com/fhir/StructureDefinition/document-identification 1..1 MS

* extension[header-version].valueString = "Header Version Example"
* extension[sender].extension[identifier].valueString = "Sender Identifier Example"
* extension[sender].extension[contact-information].extension[contact].valueString = "Sender Contact Example"
* extension[sender].extension[contact-information].extension[email-address].valueString = "Sender Email Example"
* extension[receiver].extension[identifier].valueString = "Receiver Identifier Example"
* extension[receiver].extension[contact-information].extension[contact].valueString = "Receiver Contact Example"
* extension[receiver].extension[contact-information].extension[email-address].valueString = "Receiver Email Example"
* extension[document-identification].extension[standard].valueString = "Document Standard Example"
* extension[document-identification].extension[type].valueString = "Document Type Example"
* extension[document-identification].extension[instance-identifier].valueString = "Instance Identifier Example"
* extension[document-identification].extension[creation-date-and-time].valueDateTime = "2024-01-01T00:00:00Z"


Alias: $sct = http://snomed.info/sct
Alias: $basic-resource-type = http://terminology.hl7.org/CodeSystem/basic-resource-type

Instance: referral
InstanceOf: Basic
Usage: #example
* extension[0].url = "http://example.org/do-not-use/fhir-extensions/referral#requestingPractitioner"
* extension[=].valueReference = Reference(Practitioner/f201) "Dokter Bronsig"
* extension[+].url = "http://example.org/do-not-use/fhir-extensions/referral#notes"
* extension[=].valueString = "The patient had fever peaks over the last couple of days. He is worried about these peaks."
* extension[+].url = "http://example.org/do-not-use/fhir-extensions/referral#fulfillingEncounter"
* extension[=].valueReference = Reference(Encounter/f201)
* modifierExtension[0].url = "http://example.org/do-not-use/fhir-extensions/referral#referredForService"
* modifierExtension[=].valueCodeableConcept = $sct#11429006 "Consultation"
* modifierExtension[+].url = "http://example.org/do-not-use/fhir-extensions/referral#targetDate"
* modifierExtension[=].valuePeriod.start = "2013-04-01"
* modifierExtension[=].valuePeriod.end = "2013-04-15"
* modifierExtension[+].url = "http://example.org/do-not-use/fhir-extensions/referral#status"
* modifierExtension[=].valueCode = #complete
//* identifier.system = "http://goodhealth.org/basic/identifiers"
//* identifier.value = "19283746"
* code = $basic-resource-type#referral
//* subject = Reference(Patient/f201) "Roel"
* created = "2013-05-14"
//* author = Reference(Practitioner/example)

*/