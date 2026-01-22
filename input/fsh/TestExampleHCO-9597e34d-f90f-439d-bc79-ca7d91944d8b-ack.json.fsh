Alias: $medcom-messaging-eventCodes = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-eventCodes
Alias: $medcom-messaging-destinationUse = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-destinationUse
Alias: $medcom-messaging-activityCodes = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes

Instance: 9597e34d-f90f-439d-bc79-ca7d91944d8b
InstanceOf: Bundle
Description: "Ack example - medcom-acknowledgement-message"
Usage: #example
* meta.profile = "http://medcomfhir.dk/ig/acknowledgement/StructureDefinition/medcom-messaging-acknowledgement"
* type = #message
* timestamp = "2023-09-13T12:25:00+02:00"
* entry[0].fullUrl = "MessageHeader/aba2d9bf-2c6c-47e8-bce4-7928bcd51019"
* entry[=].resource = aba2d9bf-2c6c-47e8-bce4-7928bcd51019
* entry[+].fullUrl = "Provenance/4c284936-5454-4116-95fc-3c8eeeed2400"
* entry[=].resource = 4c284936-5454-4116-95fc-3c8eeeed2400
* entry[+].fullUrl = "Provenance/69dab277-dd4b-4055-9fda-a10a65cb4412"
* entry[=].resource = 69dab277-dd4b-4055-9fda-a10a65cb4412
* entry[+].fullUrl = "Organization/ef5cb9a6-835f-4d18-a34e-179c578b9a2a"
* entry[=].resource = ef5cb9a6-835f-4d18-a34e-179c578b9a2a
* entry[+].fullUrl = "Organization/42541447-b58c-4a1a-9514-02b80494bbd3"
* entry[=].resource = 42541447-b58c-4a1a-9514-02b80494bbd3

Instance: aba2d9bf-2c6c-47e8-bce4-7928bcd51019
InstanceOf: MessageHeader
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/acknowledgement/StructureDefinition/medcom-messaging-acknowledgementHeader"
* eventCoding = $medcom-messaging-eventCodes#acknowledgement-message
* destination.extension.url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-destinationUseExtension"
* destination.extension.valueCoding = $medcom-messaging-destinationUse#primary
* destination.endpoint = "https://sor2.sum.dsdn.dk/#id=1144561000016002"
* destination.receiver = Reference(ef5cb9a6-835f-4d18-a34e-179c578b9a2a)
* sender = Reference(42541447-b58c-4a1a-9514-02b80494bbd3)
* source.endpoint = "https://sor2.sum.dsdn.dk/#id=52581000016005"
* response.identifier = "8dbf63f4-b784-4d40-8802-c1bdb1ecfa63"
* response.code = #ok
* definition = "http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComAcknowledgementMessageDefinition|2.0"

Instance: 4c284936-5454-4116-95fc-3c8eeeed2400
InstanceOf: Provenance
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-provenance"
* target = Reference(MessageHeader/8dbf63f4-b784-4d40-8802-c1bdb1ecfa63)
* occurredDateTime = "2023-09-13T12:24:20+02:00"
* recorded = "2023-09-13T12:24:20+02:00"
* activity = $medcom-messaging-activityCodes#new-message
* agent.who = Reference(ef5cb9a6-835f-4d18-a34e-179c578b9a2a)

Instance: 69dab277-dd4b-4055-9fda-a10a65cb4412
InstanceOf: Provenance
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-provenance"
* target = Reference(aba2d9bf-2c6c-47e8-bce4-7928bcd51019)
* occurredDateTime = "2023-09-13T12:25:00+02:00"
* recorded = "2023-09-13T12:25:00+02:00"
* activity = $medcom-messaging-activityCodes#acknowledgement
* agent.who = Reference(42541447-b58c-4a1a-9514-02b80494bbd3)
* entity.role = #revision
* entity.what = Reference(MessageHeader/8dbf63f4-b784-4d40-8802-c1bdb1ecfa63)

Instance: ef5cb9a6-835f-4d18-a34e-179c578b9a2a
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-organization"
* identifier[0].system = "https://www.gs1.org/gln"
* identifier[=].value = "5790000123117"
* identifier[+].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "1144561000016002"
* name = "Sender Organization"

Instance: 42541447-b58c-4a1a-9514-02b80494bbd3
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-organization"
* identifier[0].system = "https://www.gs1.org/gln"
* identifier[=].value = "5790000127092"
* identifier[+].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "52581000016005"
* name = "Receiver Organization"