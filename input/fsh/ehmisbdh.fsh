Profile: EhmiStandardBusinessDocumentHeader
Parent: Basic
Title: "EHMI Standard Business Document Header"
Description: "Profile for EHMI Standard Business Document Header."
* extension contains HeaderVersion named HeaderVersion 1..1 MS 
* extension[HeaderVersion].valueString 1..1
//* extension[HeaderVersion].valueString = "1.0"
* extension contains SbdhSender named Sender 1..1
* extension contains SbdhReceiver named Receiver 1..1
//* extension[Sender].Identifier 1..1
//* extension[Sender].valueString = "1.0"
//* extension contains Partner named Receiver 1..1 MS 
//* extension[Receiver].valueString 0..1
* extension contains DocumentIdentification named DocumentIdentification 1..1 MS 
//* extension[DocumentIdentification].valueString 0..1
* identifier 0..0
* subject 0..0
* created 0..0
* author 0..0

Instance: ehmiSBDH
InstanceOf: EhmiStandardBusinessDocumentHeader
* code = #transfer
* extension[HeaderVersion].valueString = "1.0"
* extension[Sender].extension[PartnerIdentifier].valueString = "Sender-GLN"
* extension[Sender].extension[Authority].valueString = "iso6523-actorid-upis"
* extension[Receiver].extension[PartnerIdentifier].valueString = "Receiver-GLN"
* extension[Receiver].extension[Authority].valueString = "iso6523-actorid-upis"
* extension[DocumentIdentification].extension[Standard].valueString = "HomeCareObservation"
* extension[DocumentIdentification].extension[Type].valueString = "Bundle"
* extension[DocumentIdentification].extension[TypeVersion].valueString = "HomeCareObservation.v1"
* extension[DocumentIdentification].extension[uuid-instance-identifier].valueUuid = "urn:uuid:1d9b1528-2448-40f5-9191-977872320527"
* extension[DocumentIdentification].extension[sbdh-date-and-time].valueDateTime = "2025-01-01"

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

