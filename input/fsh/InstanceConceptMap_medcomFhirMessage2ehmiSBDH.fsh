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