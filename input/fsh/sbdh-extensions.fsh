// Define the extensions for the Standard Business Document Header
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
