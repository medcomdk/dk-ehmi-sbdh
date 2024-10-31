/* Define the extensions for the Standard Business Document Header
Profile: EhmiSbdhPartner
Parent: Basic
Title: "EHMI Standard Business Document Header Partner"
Description: "Profile for EHMI Standard Business Document Header Partner"
* extension contains PartnerIdentification 1..1 MS 
* extension contains contactInformation 1..1 MS 

Profile: Sender
Parent: EhmiSbdhPartner
Title: "EHMI Standard Business Document Header Partner"

Profile: Receiver
Parent: EhmiSbdhPartner
Title: "EHMI Standard Business Document Header Partner"
*/

Extension: EhmiStandardBusinessDocumentBinaryContent
Id: ehmiStandardBusinessDocumentBinaryContent
Title: "EhmiStandardBusinessDocument BinaryContent"
Description: "BinaryContent of the Standard Business Document"
* value[x] only string

Extension: EhmiStandardBusinessDocumentHeaderExt
Id: ehmiStandardBusinessDocumentHeaderExt
Title: "EHMI Standard Business Document Header"
Description: "Profile for EHMI Standard Business Document Header."
* extension contains HeaderVersion named HeaderVersion 1..1 MS 
* extension[HeaderVersion].valueString 1..1
* extension contains SbdhSender named Sender 1..1
* extension contains SbdhReceiver named Receiver 1..1
* extension contains DocumentIdentification named DocumentIdentification 1..1 MS 
* extension contains BusinessScope named BusinessScope 0..1 MS 

// HeaderVersion element
Extension: HeaderVersion
Id: header-version
Title: "Header Version"
Description: "Header version of the Standard Business Document Header"
* value[x] only string
//* value[x] only string

//Partner element
Extension: Partner
Id: partner
Title: "Partner"
Description: "Partner information"
* extension contains
    PartnerIdentification 1..1 MS and
    contactInformation 0..1 MS

Extension: PartnerIdentification
Id: partnerIdentification
Title: "PartnerIdentification"
Description: "Identifier for the sender or receiver"
* extension contains
    PartnerIdentifier named Identifier 1..1 MS and
    Authority named Authority 1..1 MS

Extension: SbdhSender
Id: sbdhSender
Title: "sbdhSender Identification"
Description: "Identifier for the sbdhSender"
* extension contains
    PartnerIdentifier named Identifier 1..1 MS and
    Authority named Authority 1..1 MS

Extension: SbdhReceiver
Id: sbdhReceiver
Title: "sbdhReceiver Identification"
Description: "Identifier for the sbdhReceiver"
* extension contains
    PartnerIdentifier named Identifier 1..1 MS and
    Authority named Authority 1..1 MS

Extension: PartnerIdentifier
Id: partnerIdentifier
Title: "PartnerIdentifier"
Description: "Identifier for the sender or receiver"
* value[x] only string

Extension: Authority
Id: authority
Title: "Authority"
Description: "Authority"
* value[x] only string

Extension: ContactInformation
Id: contact-information
Title: "Contact Information"
Description: "Contact information including contact name and email address"
* extension contains
    Contact named Contact 1..1 MS 
    and EmailAddress named EmailAddress 0..1 MS 
/*
    and faxNumber 0..1 MS 
    and TelephoneNumber 0..1 MS 
    and ContactTypeIdentifier 0..1 MS
*/

Extension: Contact
Id: contact
Title: "Contact"
Description: "Contact information"
* value[x] only string

Extension: EmailAddress
Id: email-address
Title: "Email Address"
Description: "Email address"
* value[x] only ContactPoint

//DocumentIdentification
Extension: DocumentIdentification
Id: document-identification
Title: "Document Identification"
Description: "Document identification details"
* extension contains
    Standard named Standard 1..1 MS 
    and TypeVersion named TypeVersion 1..1 MS
    and Type named Type 1..1 MS 
    and uuid-instance-identifier named InstanceIdentifier 1..1 MS
    and sbdh-date-and-time named creationDateAndTime 1..1 MS

Extension: Standard
Id: standard
Title: "Standard"
Description: "Document standard"
* value[x] only string

Extension: TypeVersion
Id: typeVersion
Title: "Type"
Description: "Type Version"
* value[x] only string

Extension: Type
Id: type
Title: "Type"
Description: "Document type"
* value[x] only string

Extension: UUIDInstanceIdentifier
Id: uuid-instance-identifier
Title: "UUID Instance Identifier"
Description: "UUID instance identifier"
* value[x] only uuid
//* value[x] only valueUuid

Extension: SbdhDateAndTime
Id: sbdh-date-and-time
Title: "SBDH Date And Time"
Description: "SBDH date and time"
//* value[x] only string
* value[x] only dateTime

Extension: BusinessScope
Id: businessScope
Title: "BusinessScope"
Description: "BusinessScope"
* extension contains
    Scope named Scope 0..* MS 

Extension: Scope
Id: scope
Title: "Scope"
Description: "Scope"
* extension contains
    type 1..1 MS 
    and InstanceIdentifier 1..1 MS
    and Identifier 1..1 MS
/*
    and CorrelationInformation 0..1 MS
    and BusinessService 0..1 MS

Extension: CorrelationInformation
Id: correlationInformation
Title: "CorrelationInformation"
Description: "CorrelationInformation"
* extension contains
    sbdh-date-and-time named RequestingDocumentCreationDateTime 1..1 MS 
    and InstanceIdentifier named RequestingDocumentInstanceIdentifier 1..1 MS
    and sbdh-date-and-time named ExpectedResponseDateTime 0..1 MS

Extension: BusinessService
Id: businessService
Title: "BusinessService"
Description: "BusinessService"
* extension contains
    BusinessServiceName 1..1 MS 
    and ServiceTransaction 0..1 MS

Extension: BusinessServiceName
Id: businessServiceName
Title: "BusinessServiceName"
Description: "BusinessServiceName"
* value[x] only string

Extension: ServiceTransaction
Id: serviceTransaction
Title: "ServiceTransaction"
Description: "ServiceTransaction"
* extension contains
    ServiceTransactionString named TypeOfServiceTransaction 1..1 MS 
    and ServiceTransactionString named IsNonRepudiationRequired 0..1 MS
    and ServiceTransactionString named IsAuthenticationRequired 0..1 MS
    and ServiceTransactionString named IsNonRepudiationOfReceiptRequired 0..1 MS
    and ServiceTransactionString named IsIntelligibleCheckRequired 0..1 MS
    and ServiceTransactionString named IsApplicationErrorResponseRequested 0..1 MS
    and ServiceTransactionString named TimeToAcknowledgeReceipt 0..1 MS
    and ServiceTransactionString named 0..1 MS
    and ServiceTransactionString named 0..1 MS
    and ServiceTransactionString named 0..1 MS

Extension: ServiceTransactionString
Id: serviceTransactionString
Title: "ServiceTransactionString"
Description: "ServiceTransactionString"
* value[x] only string
*/
