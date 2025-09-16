Profile: ReferralMessageDefinitionProfile
Parent: MessageDefinition
Id: referral-message-definition-profile
Title: "Profil for henvisnings-Messagedefinition"
Description: "Profil, der specificerer en standard for henvisningsbeskeder i MedCom"
* url 1..1 MS
* version 1..1 MS
* name 1..1 MS
* status = #active (exactly)
* eventCoding 1..1 MS
* focus 1..* MS

//Version 1.0.0

Instance: ReferralMessageV1
InstanceOf: ReferralMessageDefinitionProfile
Usage: #definition
Title: "Henvisningsmeddelelse v1"
* url = "http://medcomehmi.dk/ig/eas/MessageDefinition/ReferralMessageV1"
* version = "1.0.0"
* name = "ReferralMessage"
* status = #active
* date = "2025-06-01"
* publisher = "MedCom"
* eventCoding.system = "http://medcom.dk/fhir/message-events"
* eventCoding.code = #referral
* eventCoding.display = "Henvisning sendt"
* category = #consequence
* responseRequired = #always
* focus[0].code = #Patient
* focus[0].profile = "http://hl7.org/fhir/StructureDefinition/Patient"
* focus[0].min = 1
* focus[0].max = "1"

//Version 2.0.0

Instance: ReferralMessageV2
InstanceOf: ReferralMessageDefinitionProfile
Usage: #definition
Title: "Henvisningsmeddelelse v2"
* url = "http://medcomehmi.dk/ig/eas/MessageDefinition/ReferralMessageV2"
* version = "2.0.0"
* name = "ReferralMessage"
* status = #active
* date = "2025-12-01"
* publisher = "MedCom"
* eventCoding.system = "http://medcom.dk/fhir/message-events"
* eventCoding.code = #referral
* eventCoding.display = "Henvisning sendt"
* category = #consequence
* responseRequired = #always
* focus[0].code = #Patient
* focus[0].profile = "http://hl7.org/fhir/StructureDefinition/Patient"
* focus[0].min = 1
* focus[0].max = "1"
* focus[1].code = #ServiceRequest
* focus[1].profile = "http://hl7.org/fhir/StructureDefinition/ServiceRequest"
* focus[1].min = 1
* focus[1].max = "*"

Instance: ExampleReferralBundleV1
InstanceOf: Bundle
Usage: #example
Title: "Eksempel Henvisnings-Bundle v1"
* type = #message
* id = "example-referral-bundle-v1"
* entry[0].fullUrl = "MessageHeader/example-header-v1"
* entry[0].resource = ExampleReferralHeaderV1
* entry[1].fullUrl = "Patient/example-patient"
* entry[1].resource = ExamplePatient

Instance: ExampleReferralHeaderV1
InstanceOf: MessageHeader
Usage: #example
Title: "MessageHeader for ReferralMessage v1"
* id = "example-header-v1"
* definition = "http://medcom.dk/fhir/MessageDefinition/ReferralMessage|1.0.0"
* eventCoding.system = "http://medcom.dk/fhir/message-events"
* eventCoding.code = #referral
* source.endpoint = "urn:oid:1.2.208.176.1.1"
* destination[0].endpoint = "urn:oid:1.2.208.176.1.2"

Instance: ExampleReferralBundleV2
InstanceOf: Bundle
Usage: #example
Title: "Eksempel Henvisnings-Bundle v2"
* type = #message
* id = "example-referral-bundle-v2"
* entry[0].fullUrl = "MessageHeader/example-header-v2"
* entry[0].resource = ExampleReferralHeaderV2
* entry[1].fullUrl = "Patient/example-patient"
* entry[1].resource = ExamplePatient
* entry[2].fullUrl = "ServiceRequest/example-servicerequest"
* entry[2].resource = ExampleServiceRequest

Instance: ExampleReferralHeaderV2
InstanceOf: MessageHeader
Usage: #example
Title: "MessageHeader for ReferralMessage v2"
* id = "example-header-v2"
* definition = "http://medcom.dk/fhir/MessageDefinition/ReferralMessage|2.0.0"
* eventCoding.system = "http://medcom.dk/fhir/message-events"
* eventCoding.code = #referral
* source.endpoint = "urn:oid:1.2.208.176.1.1"
* destination[0].endpoint = "urn:oid:1.2.208.176.1.2"

Instance: ExamplePatient
InstanceOf: Patient
Usage: #example
* id = "example-patient"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "1234567890"
* name[0].family = "Hansen"
* name[0].given[0] = "Anna"
* gender = #female
* birthDate = "1980-05-12"

Instance: ExampleServiceRequest
InstanceOf: ServiceRequest
Usage: #example
* id = "example-servicerequest"
* status = #active
* intent = #order
* subject = Reference(ExamplePatient)
* code.text = "Fysioterapi"
