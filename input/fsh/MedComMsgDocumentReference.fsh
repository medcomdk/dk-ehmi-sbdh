Profile: MedComMsgDocumentReference
Parent: MedComCoreDocumentReference
Id: medcom-msg-documentreference

Description: "A core profile stating the rules, when exchanging a FHIR message as a FHIR document."
* masterIdentifier 1..1 MS
* masterIdentifier.value 1..1 MS
* masterIdentifier ^short = "[DocumentEntry.uniqueId] Master Version Specific Identifier"
* identifier 1..1 MS
* identifier.value 1..1 MS 
* identifier ^short = "[DocumentEntry.entryUUID] Identifier for the document"
* identifier obeys uuid
* status MS 
* status ^short = "[DocumentEntry.availabilityStatus] current = active | superseded = deprecated"
// TypeCode
* type 1.. MS
* type ^short = "[DocumentEntry.typeCode] Kind of document"
* type.coding.system 1.. MS
* type.coding.code 1.. MS
//RUN: Authenticator er også i medd. svarende til MedComCorePractitioner
* authenticator 0..1 MS
* authenticator ^short = "[DocumentEntry.legalAuthenticator] Who authenticated the document"
* authenticator only Reference(MedComDocumentPractitioner)
* authenticator ^type.aggregation = #contained
// ClassCode
//RUN: ClassCode har vi også tilsvarende i medd.: fx "CareCommunication" fra  MedComMessagingMessageTypes
* category 1..1 MS 
* category from $ClassCode (extensible)
* category.coding.code 1.. MS
* category.coding.system 1.. MS
* category ^short = "[DocumentEntry.class] Categorization of document"
* author 1..2 MS 
* author ^type.aggregation = #contained
* author ^short = "[DocumentEntry.author] Who and/or what authored the document"
* author ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this.resolve()"
  * ^slicing.rules = #closed
  //RUN: author inst. + person har vi også i meddelelser: MedComCorePractitioner + MedComCoreOrganization
  /*
* author contains
    institution 1..1 and
    person 0..1
* author[institution] MS
* author[institution] only Reference(MedComDocumentOrganization)
* author[institution] ^short = "[DocumentEntry.author.authorInstitution] The organization who authored the document"
* author[person] MS
* author[person] only Reference(MedComDocumentPractitioner)
* author[person] ^short = "[DocumentEntry.author.authorPerson] The person who authored the document"
*/
/*
//RUN: securityLabel == confidentialityCode i XDS: Har vi noget tilsvarende confidentialityCode i FHIR meddelelser? 
* securityLabel 1.. MS  
* securityLabel ^short = "[DocumentEntry.confidentialityCode] Document security-tags"
// RUN: Subject har vi også i medd. OBS på at MedComDocumentPatient nedarbejder DKCorePatient og ikke MedComCorePatient grundet for mange "MS" i MedComCorePatient. Tanke - skal der så tilsvarende løsnes på MedComCorePatient på sigt og profileres hhv. en MedComCoreMsgPatient og MedComCoreDocPatient
* subject 1..1 MS
* subject only Reference(MedComDocumentPatient)
* subject ^type.aggregation = #contained
* subject ^short = "[DocumentEntry.sourcePatientInfo, DocumentEntry.sourcePatientId] Who/what is the subject of the document"
//RUN: Mime er autogereret metadata - med i medd.
* content MS
* content.attachment.contentType ^short = "[DocumentEntry.mimeType] Mime type of the content, with charset etc."
* content.attachment.contentType 1.. MS
* content.attachment.contentType from $ContentType
//
* content.attachment.language ^short = "[DocumentEntry.languageCode] Human language of the content"
* content.attachment.language 1.. MS
* content.attachment.language from $Language (extensible)

* content.attachment.creation ^short = "[DocumentEntry.creationTime] Date attachment was first created"
* content.attachment.creation 1.. MS
* content.attachment.hash 0.. MS
* content.attachment.hash ^short = "[DocumentEntry.hash] Hash of the data (sha-1)"
//Formatcode: 
* content.format ^short = "[DocumentEntry.formatCode] Format/content rules for the document"
* content.format 1.. MS
*/
/* * content.format.coding.code 1.. MS
* content.format.coding.system 1.. MS */
/*
* content.attachment.size 0.. MS
* content.attachment.title 1.. MS
* content.attachment.url 0.. MS
* content.attachment.size ^short = "[DocumentEntry.size] Number of bytes of content"
* content.attachment.title ^short = "[DocumentEntry.title] Label to display in place of the data"
* content.attachment.url ^short = "[DocumentEntry.URI] Uri where the data can be found"
* context 1.. MS
* context.event 0..1 MS 
* context.event.coding.code 1.. MS
* context.event.coding.system 1.. MS
* context.event ^short = "[DocumentEntry.eventCodeList] Main clinical acts documented"
* context.period MS
* context.period.start MS
* context.period.end MS
* context.period ^short = "[DocumentEntry.serviceStartTime, DocumentEntry.serviceStopTime] Time of service that is being documented"
* context.facilityType 1.. MS
* context.facilityType.coding.code 1.. MS
* context.facilityType.coding.system 1.. MS
* context.facilityType.coding.system from $FacilityType (extensible)
* context.facilityType ^short = "[DocumentEntry.healthcareFacilityTypeCode] Kind of facility where patient was seen"
* context.practiceSetting 1.. MS
* context.practiceSetting.coding.code 1.. MS
* context.practiceSetting.coding.system 1.. MS
* context.practiceSetting.coding.system from $PracticeSetting (extensible)
* context.practiceSetting ^short = "[DocumentEntry.practiceSettingCode] Additional details about where the content was created (e.g. clinical specialty)"
* context.related 0..* MS
* context.related ^short = "[DocumentEntry.referenceIdList] Related identifiers or resources"
* context.sourcePatientInfo 1..1 MS
* context.sourcePatientInfo ^short = "[DocumentEntry.sourcePatientId and DocumentEntry.sourcePatientInfo] Patient demographics from source. Must be the same reference as in DocumentReference.subject."
* extension contains 
    medcom-document-homecommunityid-extension named homeCommunityid 1..1 MS SU and
    medcom-document-version-id-extension named versionid 1..1 MS SU
* extension[homeCommunityid] ^short = "[DocumentEntry.homeCommunityId] A unique identifier for a community where the DocumentEntry and document can be accessed"
* extension[versionid] ^short = "Specifies the version of the DocumentReference for a standard."
*/
/* Invariant: apd-dk-rule-1
Description: "Where formatCode is 'urn:ad:dk:medcom:appointmentsummary:full', the eventCode must be 'ALAL01' (hjertesygdomme)"
Severity: #error
Expression: "where(type.coding.where(system = 'http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/dk-ihe-typecode-de-regenstrief').code = '56446-8').context.event.coding.code = 'ALAL01'"
*/

//RUN kommenteret ud
/*
Invariant: uuid
Description: "General UUID expression"
Severity: #error
Expression: "value.matches('[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')"
*/
