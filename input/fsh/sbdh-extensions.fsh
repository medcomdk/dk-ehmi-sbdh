// Define the extensions for the Standard Business Document Header

// HeaderVersion element
Extension: HeaderVersion
Id: header-version
Title: "Header Version"
Description: "Header version of the Standard Business Document Header"
* value[x] only string
//* value[x] only string

// Partner element
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
    contact 1..1 MS 
    and emailAddress 0..1 MS 
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
    standard 1..1 MS 
    and typeVersion 1..1 MS
    and type 1..1 MS 
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
* value[x] only string
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
    scope 1..* MS 

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
