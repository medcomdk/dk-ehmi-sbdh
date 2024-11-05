//https://build.fhir.org/ig/medcomdk/dk_HomeCareObservations/branches/MessageDefinition-QA/Bundle-401cbc36-db1e-4fe0-bf90-6df331dde179.xml

Profile: EhmiStandardBusinessDocumentBundle
Parent: Bundle
Title: "EHMI Standard Business Document Bundle"
Description: "Profile for EHMI Standard Business Document Bundle"
* type = #collection

Instance: ehmiSBDBundle
InstanceOf: EhmiStandardBusinessDocumentBundle
Title: "EHMI Standard Business Document Bundle"
Description: "Profile for EHMI Standard Business Document Bundle"
* entry[+].fullUrl = "Bundle/ehmiSBDHBundle"
* entry[=].resource = ehmiSBDHBundle
* entry[+].fullUrl = "Binary/ehmiSBDBinaryJson"
* entry[=].resource = ehmiSBDBinaryJson

Profile: EhmiStandardBusinessDocumentHeaderBundle
Parent: Bundle
Title: "EHMI Standard Business Document Header Bundle"
Description: "Profile for EHMI Standard Business Document Header Bundle"
* type = #collection

Instance: ehmiSBDHBundle
InstanceOf: EhmiStandardBusinessDocumentHeaderBundle
Title: "EHMI Standard Business Document Header Bundle"
Description: "Profile for EHMI Standard Business Document Header Bundle"
* entry[+].fullUrl = "Bundle/ehmiSBDHDocumentIdentificationBundle"
* entry[=].resource = ehmiSBDHDocumentIdentificationBundle

Profile: EhmiStandardBusinessDocumentHeaderDocumentIdentificationBundle
Parent: Bundle
Title: "EHMI Standard Business Document Header DocumentIdentification Bundle"
Description: "Profile for EHMI Standard Business Document Header DocumentIdentification Bundle"
* type = #collection

Instance: ehmiSBDHDocumentIdentificationBundle
InstanceOf: EhmiStandardBusinessDocumentHeaderDocumentIdentificationBundle
Title: "EHMI Standard Business Document Header DocumentIdentification Bundle"
Description: "Profile for EHMI Standard Business Document Header DocumentIdentification Bundle"
* entry[+].fullUrl = "Endpoint/ehmiSbdhSender"
* entry[=].resource = ehmiSbdhSender
* entry[+].fullUrl = "Endpoint/ehmiSbdhReceiver"
* entry[=].resource = ehmiSbdhReceiver
* entry[+].fullUrl = "Bundle/ehmiSBDHBusinessScopeBundle"
* entry[=].resource = ehmiSBDHBusinessScopeBundle

Profile: PartnerIdentification
Parent: Endpoint
Title: "Partner"
Description: "Partner information"
* status = #active
* identifier.type 1..1
* identifier.system = "http://gs1.org/gln"
* identifier.id = "iso6523-actorid-upis"
* identifier.value 1..1
* connectionType = #hl7-fhir-msg //eDelivery
* name 0..0
* contact 0..1
* managingOrganization 0..0
* period 0..0
* payloadMimeType 0..0
* payloadType.coding.code = #ehmiMessage

Profile: EhmiSbdhSender
Parent: PartnerIdentification
Title: "SbdhSender Partner"
Description: "SbdhSender Partner information"

Instance: ehmiSbdhSender
InstanceOf: EhmiSbdhSender
Title: "EHMI Standard Business Document Header DocumentIdentification EhmiSbdhSender"
Description: "Profile for EHMI Standard Business Document Header DocumentIdentification EhmiSbdhSender"
* status = #active
* identifier.type = #GLN
* identifier.system = "http://gs1.org/gln"
* identifier.id = "iso6523-actorid-upis"
* identifier.value = "GLN12345"
* connectionType = #hl7-fhir-msg //eDelivery
* payloadType.coding.code = #ehmiMessage
* address = "http://sender.dk/gln12345"

Profile: EhmiSbdhReceiver
Parent: PartnerIdentification
Title: "SbdhReceiver Partner"
Description: "SbdhReceiver Partner information"

Instance: ehmiSbdhReceiver
InstanceOf: EhmiSbdhReceiver
Title: "EHMI Standard Business Document Header DocumentIdentification EhmiSbdhReceiver"
Description: "Profile for EHMI Standard Business Document Header DocumentIdentification EhmiSbdhReceiver"
* status = #active
* identifier.type = #GLN
* identifier.system = "http://gs1.org/gln"
* identifier.id = "iso6523-actorid-upis"
* identifier.value = "GLN67890"
* connectionType = #hl7-fhir-msg //eDelivery
* payloadType.coding.code = #ehmiMessage
* address = "http://receiver.dk/gln67890"

Profile: EhmiStandardBusinessDocumentHeaderBusinessScopeBundle
Parent: Bundle
Title: "EHMI Standard Business Document Header BusinessScope Bundle"
Description: "Profile for EHMI Standard Business Document Header BusinessScope Bundle"
* type = #collection

Profile: EhmiSBDHScope
Parent: Basic
Title: "EHMI Standard Business Document Header Scope structure"
Description: "Profile for EHMI Standard Business Document Header Scope structure"
/* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open // allow other codes
* identifier contains
    Identifier 1..1 and 
    InstanceIdentifier 1..1 
* identifier[Identifier].*/
/* identifier.type MS
* identifier.system MS
* identifier.value MS*/
* identifier.type MS
* identifier.value MS
* code.coding.code MS
* code.coding.system MS
* subject 0..0
* created 0..0
* author 0..0

Instance: ehmiSBDHBusinessScopeBundle
InstanceOf: EhmiStandardBusinessDocumentHeaderBusinessScopeBundle
Title: "EHMI Standard Business Document Header BusinessScope Bundle"
Description: "Profile for EHMI Standard Business Document Header BusinessScope Bundle"
* entry[+].fullUrl = "Basic/ehmiSBDHScopeDocumentId"
* entry[=].resource = ehmiSBDHScopeDocumentId
* entry[+].fullUrl = "Basic/ehmiSBDHScopeProcessId"
* entry[=].resource = ehmiSBDHScopeProcessId
* entry[+].fullUrl = "Basic/ehmiSBDHScopePatientId"
* entry[=].resource = ehmiSBDHScopePatientId
* entry[+].fullUrl = "Basic/ehmiSBDHScopeSenderId"
* entry[=].resource = ehmiSBDHScopeSenderId
* entry[+].fullUrl = "Basic/ehmiSBDHScopeReceiverId"
* entry[=].resource = ehmiSBDHScopeReceiverId

// PEPPOL scope instances

Instance: ehmiSBDHScopeDocumentId
InstanceOf: EhmiSBDHScope
Title: "EHMI Standard Business Document Header Scope structure for DOCUMENTID"
Description: "Profile for EHMI Standard Business Document Header Scope structure"
* code = #urn:dk:medcom:prod:messaging:fhir:structuredefinition:homecareobservation#urn:dk:medcom:fhir:homecareobservation:3.0
* identifier.type.coding.code = #DOCUMENTID
* identifier.value = "dk-medcom-messaging"
* code.coding.system = "dk-medcom-messaging"

Instance: ehmiSBDHScopeProcessId
InstanceOf: EhmiSBDHScope
Title: "EHMI Standard Business Document Header Scope structure for PROCESSID"
Description: "Profile for EHMI Standard Business Document Header Scope structure"
* code = #sdn-emergence
* identifier.type.coding.code = #PROCESSID
* identifier.value = "dk-medcom-messaging"
* code.coding.system = "dk-medcom-messaging"

// PEPPOL scope instances

Instance: ehmiSBDHScopePatientId
InstanceOf: EhmiSBDHScope
Title: "EHMI Standard Business Document Header Scope structure for PATIENTID"
Description: "Profile for EHMI Standard Business Document Header Scope structure"
* code = #0101910227
* identifier.type.coding.code = #PATIENTID
* identifier.value = "dk-medcom-messaging"
* code.coding.system = "dk-medcom-messaging"

Instance: ehmiSBDHScopeSenderId
InstanceOf: EhmiSBDHScope
Title: "EHMI Standard Business Document Header Scope structure for SENDERID"
Description: "Profile for EHMI Standard Business Document Header Scope structure"
* code = #SOR1170101
* identifier.type.coding.code = #SENDERID
* identifier.value = "dk-medcom-messaging"
* code.coding.system = "dk-medcom-messaging"

Instance: ehmiSBDHScopeReceiverId
InstanceOf: EhmiSBDHScope
Title: "EHMI Standard Business Document Header Scope structure for RECEIVERID"
Description: "Profile for EHMI Standard Business Document Header Scope structure"
* code = #SOR1170102
* identifier.type.coding.code = #RECEIVERID
* identifier.value = "dk-medcom-messaging"
* code.coding.system = "dk-medcom-messaging"

Profile: EhmiStandardBusinessDocumentBinaryJson
Parent: Binary
Title: "EHMI Standard Business Document Binary"
Description: "Profile for EHMI Standard Business Document Binary"
* contentType 1..1 MS
* contentType = #fhir+json
* data 1..1 MS

Instance: ehmiSBDBinaryJson
InstanceOf: EhmiStandardBusinessDocumentBinaryJson
Title: "EHMI Standard Business Document Binary"
Description: "Profile for EHMI Standard Business Document Binary"
* contentType = #fhir+json
* data = "Base64Binary gryf"

/*
Profile: EhmiStandardBusinessDocument
Parent: Basic
Title: "EHMI Standard Business Document"
Description: "Profile for EHMI Standard Business Document"
* extension contains EhmiStandardBusinessDocumentHeaderExt named EhmiStandardBusinessDocumentHeader 1..1 MS 
* extension contains EhmiStandardBusinessDocumentBinaryContent named EhmiStandardBusinessDocumentBinaryContent 1..1 MS 
* identifier 0..0
* subject 0..0
* created 0..0
* author 0..0
* code = #transfer 

Profile: EhmiStandardBusinessDocumentHeader
Parent: Basic
Title: "EHMI Standard Business Document Header"
Description: "Profile for EHMI Standard Business Document Header."
* extension contains EhmiStandardBusinessDocumentHeaderExt named EhmiStandardBusinessDocumentHeader 1..1 MS 
/* 
extension contains HeaderVersion named HeaderVersion 1..1 MS 
* extension[HeaderVersion].valueString 1..1
* extension contains SbdhSender named Sender 1..1
* extension contains SbdhReceiver named Receiver 1..1
* extension contains DocumentIdentification named DocumentIdentification 1..1 MS 
* extension contains BusinessScope named BusinessScope 0..1 MS 
*/
/* BusinessScope.Scope ^slicing.discriminator.type = #value
* BusinessScope.Scope ^slicing.discriminator.path = "$this"
* BusinessScope.Scope ^slicing.rules = #open // allow other codes
* BusinessScope.Scope contains
*/   
/*
* identifier 0..0
* subject 0..0
* created 0..0
* author 0..0
* code = #transfer 

Instance: ehmiSBD
InstanceOf: EhmiStandardBusinessDocument
Title: "EHMI Standard Business Document"
Description: "Profile for EHMI Standard Business Document"
* extension[EhmiStandardBusinessDocumentHeader].extension[HeaderVersion].valueString = "1.0"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhSender].extension[PartnerIdentifier].valueString = "Sender-GLN"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhSender].extension[Authority].valueString = "iso6523-actorid-upis"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhReceiver].extension[PartnerIdentifier].valueString = "Receiver-GLN"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhReceiver].extension[Authority].valueString = "iso6523-actorid-upis"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[Standard].valueString = "HomeCareObservation"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[Type].valueString = "Bundle"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[TypeVersion].valueString = "HomeCareObservation.v1"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[uuid-instance-identifier].valueUuid = "urn:uuid:1d9b1528-2448-40f5-9191-977872320527"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[sbdh-date-and-time].valueDateTime = "2025-01-01"
* extension[EhmiStandardBusinessDocumentBinaryContent].valueString = "Base64(HCO Message)"

Instance: ehmiSBDH
InstanceOf: EhmiStandardBusinessDocumentHeader
Title: "EHMI Standard Business Document Header"
Description: "Profile for EHMI Standard Business Document Header."
* extension[EhmiStandardBusinessDocumentHeader].extension[HeaderVersion].valueString = "1.0"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhSender].extension[PartnerIdentifier].valueString = "Sender-GLN"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhSender].extension[Authority].valueString = "iso6523-actorid-upis"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhReceiver].extension[PartnerIdentifier].valueString = "Receiver-GLN"
* extension[EhmiStandardBusinessDocumentHeader].extension[SbdhReceiver].extension[Authority].valueString = "iso6523-actorid-upis"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[Standard].valueString = "HomeCareObservation"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[Type].valueString = "Bundle"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[TypeVersion].valueString = "HomeCareObservation.v1"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[uuid-instance-identifier].valueUuid = "urn:uuid:1d9b1528-2448-40f5-9191-977872320527"
* extension[EhmiStandardBusinessDocumentHeader].extension[DocumentIdentification].extension[sbdh-date-and-time].valueDateTime = "2025-01-01"
*/
/*
Instance: StandardBusinessDocument-instance
InstanceOf: StandardBusinessDocument
Title: "EHMI Standard Business Document Instance"
Description: "Profile for Standard Business Document Header as per the provided XSD."
* extension[HeaderVersion].valueString = "1.0"
*/

/*
Extension: HeaderVersion
* value[x] only string
//* valueString = "Header version of the standard business document."
*/

/*
Profile: StandardBusinessDocumentHeader
Parent: Basic
Title: "Standard Business Document Header"
Description: "Profile for Standard Business Document Header as per the provided XSD."

* extension[HHeaderVersion].valueString 
//* extension[HHeaderVersion].valueString = "HHeaderVersion"
* extension[SSender].valueString 
//* extension[SSender].valueString = "SSender"
* extension[RReceiver].valueString 
//* extension[RReceiver].valueString = "RReceiver"
* extension[DDocumentIdentification].valueString 
//* extension[DDocumentIdentification].valueString = "DDocumentIdentification"
* extension[BBusinessScope].valueString 
//* extension[BBusinessScope].valueString = "BBusinessScope"

Extension: HHeaderVersion
* value[x] only string
//* valueString = "Header version of the standard business document."

Extension: SSender
* value[x] only string
//* value[x] only Reference(Organization | Practitioner | PractitionerRole)
//* valueReference = "Sender of the standard business document."
//* valueString = "Sender of the standard business document."

Extension: RReceiver
* value[x] only string
//* value[x] only Reference(Organization | Practitioner | PractitionerRole)
//* valueReference = "Receiver of the standard business document."
//* valueString = "Receiver of the standard business document."

Extension: DDocumentIdentification
* extension contains
    standard 1..1 MS and
    type 1..1 MS and
    instanceIdentifier 1..1 MS and
    creationDateAndTime 1..1 MS
//* value[x] only string
//* valueString = "Document identification of the standard business document."

Extension: BBusinessScope
* value[x] only string
//* valueString = "Business scope of the standard business document."

Extension: HeaderVersion
Id: header-version
Title: "Header Version"
Description: "Header version of the Standard Business Document Header"
* value[x] only string

Extension: Identifier
Id: identifier
Title: "Identifier"
Description: "Identifier for the sender or receiver"
* value[x] only string

Extension: Contact
Id: contact
Title: "Contact"
Description: "Contact information"
* value[x] only string

Extension: EmailAddress
Id: email-address
Title: "Email Address"
Description: "Email address"
* value[x] only string

Extension: ContactInformation
Id: contact-information
Title: "Contact Information"
Description: "Contact information including contact name and email address"
* extension contains
    contact 1..1 MS and
    emailAddress 1..1 MS

Extension: Sender
Id: sender
Title: "Sender"
Description: "Sender information"
* extension contains
    identifier 1..1 MS and
    contactInformation 1..1 MS

Extension: Receiver
Id: receiver
Title: "Receiver"
Description: "Receiver information"
* extension contains
    identifier 1..1 MS and
    contactInformation 1..1 MS

Extension: Standard
Id: standard
Title: "Standard"
Description: "Document standard"
* value[x] only string

Extension: Type
Id: type
Title: "Type"
Description: "Document type"
* value[x] only string

Extension: InstanceIdentifier
Id: instance-identifier
Title: "Instance Identifier"
Description: "Document instance identifier"
* value[x] only string

Extension: CreationDateAndTime
Id: creation-date-and-time
Title: "Creation Date And Time"
Description: "Document creation date and time"
* value[x] only dateTime

Extension: DocumentIdentification
Id: document-identification
Title: "Document Identification"
Description: "Document identification details"
* extension contains
    standard 1..1 MS and
    type 1..1 MS and
    instanceIdentifier 1..1 MS and
    creationDateAndTime 1..1 MS
*/
/*Profile: EhmiSBDH
Parent: Bundle
Description: "An example profile of the Basic resource."
//* type = #collection
* type = #batch

/*Profile: EhmiSbdhSender
Parent: Organization
Description: "An example profile of the Organization resource."
* identifier MS 
* identifier.type = #GLN

Profile: EhmiSbdhReceiver
Parent: Organization
Description: "An example profile of the Organization resource."
* identifier MS 
* identifier.type = #GLN

//* code = #adminact
/*
Profile: EhmiSBDH
Parent: Basic
Description: "An example profile of the Basic resource."
* code.coding.system = "http://terminology.hl7.org/CodeSystem/basic-resource-type"
* code.coding.code = #adminact


Profile: EhmiSbdhDocumentInformation
Parent: Basic
Description: "An example profile of the Basic resource."
//* code = #adminact

*/

