/*
Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Instance: example
InstanceOf: StructureMap
Usage: #definition
* url = "http://hl7.org/fhir/StructureMap/example"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:37843577-95fb-4adb-84c0-8837188a7bf3"
* version = "0.1"
* name = "ExampleMap"
* title = "Example Map"
* status = #draft
* date = "2017-03-09"
* publisher = "HL7 FHIR Standard"
* contact.telecom.system = #url
* contact.telecom.value = "http://hl7.org/fhir"
* description = "Example Structure Map"
* jurisdiction = $m49.htm#009 "Oceania"
* group.name = "Examples"
* group.typeMode = #none
* group.documentation = "test -> testValue"
* group.input.name = "test"
* group.input.mode = #source
* group.rule.name = "rule1"
* group.rule.source.context = "Source"
* group.rule.source.type = "SourceClassA"
* group.rule.source.element = "test"
* group.rule.source.variable = "t"
* group.rule.target.context = "Destination"
* group.rule.target.contextType = #variable
* group.rule.target.element = "testValue"
* group.rule.target.transform = #copy

/*
Instance: medcomFhirMessage2ehmiSBDH
InstanceOf: ConceptMap
Title: "MedComMessagingMapFhirToSorEdi"
Description: "ConceptMap between MedComs FHIR message names and SOREDI message names"
* name = "MedComMessagingMapFhirToSorEdi"
* version  =  "1.1.0"
* status  =  #active
* date = "2023-02-27"
* sourceUri = Canonical(MedComMessagingMessageTypes)
* targetUri = Canonical(MedComMessagingSorEdiValues)
* group.source = "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-eventCodes"
* group.target = "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-sorEdiSystem"
* group.element[+].code = #care-communication-message
* group.element[=].display = "Care Communication Message"
* group.element[=].target.code = #FDIS91
* group.element[=].target.display = "Care Communication Message (Korrepondance meddelelse)"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #hospital-notification-message
* group.element[=].display = "Hospital Notification Message"
* group.element[=].target.code = #FDIS20
* group.element[=].target.display = "Hospital Notification Message (Advis om Sygehusophold)"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #acknowledgement-message
* group.element[=].display = "Acknowledgement Message"
* group.element[=].target.code = #FCTL
* group.element[=].target.display = "Acknowledgement Message (Kvittering)"
* group.element[=].target.equivalence = #equivalent
*/