Instance: ExampleVANSEnvelope
InstanceOf: VANSEnvelopeModel
Title: "Eksempel på VANSEnvelope med Reliable Messaging"
Description: "Test-instans af en CareCommunication pakket i en VANSEnvelope."
Usage: #example

* message.metaInformation.sender.identifier.system = "https://gs1.org"
* message.metaInformation.sender.identifier.value = "5790000120314"
* message.metaInformation.sender.name = "Odense Universitetshospital"

* message.metaInformation.receiver.identifier.system = "https://gs1.org"
* message.metaInformation.receiver.identifier.value = "5790000121526"
* message.metaInformation.receiver.name = "Odense Kommune"

* message.metaInformation.document.format = #FHIR
* message.metaInformation.document.name = "CareCommunication"
* message.metaInformation.document.version = "4.0.1"
* message.metaInformation.document.messageId = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* message.metaInformation.document.timestamp = "2026-11-18T10:15:00+01:00"

* message.metaInformation.transport.transformMessage = false
* message.metaInformation.transport.reliableMessaging.acknowledgementRequest = true
* message.metaInformation.transport.reliableMessaging.originalMessageId = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* message.metaInformation.transport.reliableMessaging.retryCount = 0
* message.metaInformation.transport.reliableMessaging.timeToLive = "2026-11-18T10:45:00+01:00"

* message.metaInformation.transport.serviceTag.name = "MCM:MIME"
* message.metaInformation.transport.serviceTag.value = "application/fhir+json"

* message.data = "eyJyZXNvdXJjZVR5cGUiOiAiQnVuZGxlIiwgInR5cGUiOiAibWVzc2FnZSJ9"

// -----------------------------------------------------------------------------

Instance: ExampleEHMISBDHEnvelope
InstanceOf: EHMISBDHEnvelopeModel
Title: "Eksempel på ehmiSBDH Envelope"
Description: "Test-instans af en CareCommunication pakket i en ehmiSBDH-kuvert."
Usage: #example

* standardBusinessDocument.standardBusinessDocumentHeader.headerVersion = "1.0"

* standardBusinessDocument.standardBusinessDocumentHeader.sender.identifier.system = "iso6523-actorid-upis"
* standardBusinessDocument.standardBusinessDocumentHeader.sender.identifier.value = "0088:5790000120314"

* standardBusinessDocument.standardBusinessDocumentHeader.receiver.identifier.system = "iso6523-actorid-upis"
* standardBusinessDocument.standardBusinessDocumentHeader.receiver.identifier.value = "0088:5790000121526"

* standardBusinessDocument.standardBusinessDocumentHeader.documentIdentification.standard = "urn:dk:healthcare:medcom:messaging:fhir"
* standardBusinessDocument.standardBusinessDocumentHeader.documentIdentification.typeVersion = "4.0.1"
* standardBusinessDocument.standardBusinessDocumentHeader.documentIdentification.instanceIdentifier = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* standardBusinessDocument.standardBusinessDocumentHeader.documentIdentification.type = "CareCommunication"
* standardBusinessDocument.standardBusinessDocumentHeader.documentIdentification.creationDateAndTime = "2026-11-18T10:15:00+01:00"

* standardBusinessDocument.standardBusinessDocumentHeader.businessScope.scope.type = #EHMI_RELIABLE_MESSAGING
* standardBusinessDocument.standardBusinessDocumentHeader.businessScope.scope.instanceIdentifier = "urn:dk:healthcare:medcom:messaging:rm:v1"
* standardBusinessDocument.standardBusinessDocumentHeader.businessScope.scope.correlationInformation.requestingDocumentInstanceIdentifier = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* standardBusinessDocument.standardBusinessDocumentHeader.businessScope.scope.correlationInformation.expectedResponseDateTime = "2026-11-18T10:45:00+01:00"

* standardBusinessDocument.payload.mimeType = #"application/fhir+json"
* standardBusinessDocument.payload.content = "eyJyZXNvdXJjZVR5cGUiOiAiQnVuZGxlIiwgInR5cGUiOiAibWVzc2FnZSJ9"

// -----------------------------------------------------------------------------

Instance: ExampleVANSEnvelopeReceipt
InstanceOf: VANSEnvelopeReceiptModel
Title: "Eksempel på VANSEnvelope Receipt"
Description: "Negativ transportkvittering fra VANS-netværket."
Usage: #example

* receipt.metaInformation.sender.identifier.system = "https://gs1.org"
* receipt.metaInformation.sender.identifier.value = "5790000121526"

* receipt.metaInformation.receiver.identifier.system = "https://gs1.org"
* receipt.metaInformation.receiver.identifier.value = "5790000120314"

* receipt.metaInformation.reference.receiptId = "f9e8d7c6-5b4a-3f2e-1d0c-9b8a7f6e5d4c"
* receipt.metaInformation.reference.originalMessageId = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* receipt.metaInformation.reference.timestamp = "2026-11-18T10:16:12+01:00"

* receipt.status.statusCode = #Rejected
* receipt.status.statusText = "Ukendt modtager-endpoint"
* receipt.status.error.errorCode = #AS4-0004
* receipt.status.error.errorMessage = "Modtagerens lokationsnummer kunne ikke routes i EHMI."
* receipt.status.error.severity = #Error

// -----------------------------------------------------------------------------

Instance: ExampleEHMISBDHReceipt
InstanceOf: EHMISBDHReceiptModel
Title: "Eksempel på ehmiSBDH Receipt (EDS)"
Description: "Negativ leveringsstatuskvittering i EHMI-format."
Usage: #example

* receiptEnvelope.header.sender.system = "iso6523-actorid-upis"
* receiptEnvelope.header.sender.value = "0088:5790000121526"

* receiptEnvelope.header.receiver.system = "iso6523-actorid-upis"
* receiptEnvelope.header.receiver.value = "0088:5790000120314"

* receiptEnvelope.header.documentIdentification.standard = "urn:dk:healthcare:medcom:messaging:fhir"
* receiptEnvelope.header.documentIdentification.typeVersion = "2.0.2"
* receiptEnvelope.header.documentIdentification.instanceIdentifier = "f9e8d7c6-5b4a-3f2e-1d0c-9b8a7f6e5d4c"
* receiptEnvelope.header.documentIdentification.type = "edsBasicDeliveryStatus"
* receiptEnvelope.header.documentIdentification.creationDateAndTime = "2026-11-18T10:16:12+01:00"

* receiptEnvelope.header.businessScope.originalEnvelopeId = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* receiptEnvelope.header.businessScope.originalMessageId = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"
* receiptEnvelope.header.businessScope.processId = "urn:dk:healthcare:medcom:messaging:process:acknowledgement"

* receiptEnvelope.status.statusCategory = #EDS
* receiptEnvelope.status.outcome = #Error
* receiptEnvelope.status.timestamp = "2026-11-18T10:16:12+01:00"
* receiptEnvelope.status.errorDetails.errorCode = #AS4-0004
* receiptEnvelope.status.errorDetails.errorDescription = "Modtagerens lokationsnummer kunne ikke routes i EHMI."

// -----------------------------------------------------------------------------

Instance: ExampleMSHDeliveryFailureCommunication
InstanceOf: MSHDeliveryFailureCommunication
Title: "Eksempel på kuvertfri leveringsfejl fra MSH til EUA"
Description: "Test-instans af en negativ EHMI-kvittering oversat til en Communication-ressource."
Usage: #example

* status = #entered-in-error
* category = MSHNotificationCategoryCS#delivery-failure "Leveringsfejl"

* identifier[originalMessageId].system = "http://medcomehmi.dk"
* identifier[originalMessageId].value = "b2c8d1e0-4a1f-4e9b-9c3a-1f2e3d4c5b6a"

* sent = "2026-11-18T10:18:05+01:00"

* recipient.identifier.system = "iso6523-actorid-upis"
* recipient.identifier.value = "0088:5790000120314"
* recipient.display = "Odense Universitetshospital (Original Afsender)"

* reasonCode = EHMIErrorCodesCS#AS4-0004 "Unknown Receiver Endpoint"
* reasonCode.text = "Modtagerens lokationsnummer kunne ikke routes i EHMI."

* payload.contentString = "Levering fejlede i EHMI-netværket: Modtagerens lokationsnummer kunne ikke routes i EHMI."
