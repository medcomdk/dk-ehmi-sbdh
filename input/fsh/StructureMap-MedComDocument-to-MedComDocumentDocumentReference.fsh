Instance: MedComDocumentBundle2MedComDocumentDocumentReference-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
Description: "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
Usage: #definition
* id = "MedComDocumentBundle2MedComDocumentDocumentReference-transform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedComDocumentBundle2MedComDocumentDocumentReference-transform"
* name = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* title = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* status = #draft
* description = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* structure[+].url = "http://medcomfhir.dk/ig/document/StructureDefinition-medcom-document-bundle"
* structure[=].mode = #source
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference"
//* structure[+].url = "http://medcomfhir.dk/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference"
* structure[=].mode = #target

/*
OBS:
 structure[+].url bør senre rettes til http://medcomfhir.dk/ig/.... når det er udgivet på medcoms server
*/

//#####################
//Group: extension.homeCommunityid
//Comment: the repository OID, where the document is placed
//#####################


//OBS!! homeCommunityid sættes af kildesystem, så skal have afklaret hvordan dette defienres.
* group[+].name = "extension-homeCommunityid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
//* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
//* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension:homeCommunityid system (Must be fixed to "urn:oid:1.2.208.176.1.2")
* group[=].rule[0].name = "extension-homeCommunityid-system"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:1.2.208.176.1.2" // fixed value - OID for danish xds-domain   
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.system"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid code (OID for the repository eg. "1.2.208.176.43210.8.20")
* group[=].rule[+].name = "extension-homeCommunityid-code"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "[REPOSITORY OID: 1.2.208.176.43210.8.20|?]" // Source system must provide xds repository OID
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.code"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid display (displayname for repository eg. "TEST2")
* group[=].rule[+].name = "extension-homeCommunityid-display"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "[REPOSITORY NAME: TEST1|TEST2]" // Source system must provide xds repository name 
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.display"
* group[=].rule[=].target.transform = #create

//#####################
//Group: extension.versionNumber
//Comment: Version of the MedCom XDS-metdatdata standard
//##################### 
* group[+].name = "extension.versionid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension:versionid  (MedCom XDS Version ID)
* group[=].rule[0].name = "extension-versionid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.0.0" // fixed value - MedCom XDS Version   
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-version-id-extension').valueString"
* group[=].rule[=].target.transform = #create



//#####################
//Group: masterIdentifier
//Comment: XDS metadata standard: "uniqueId".
//#####################

* group[+].name = "masterIdentifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "masterIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.masterIdentifier"
* group[=].rule[=].target.transform = #copy


//#####################
//Group: identifier
//Comment: XDS metadata standard: "entryUUID". UUID is created during mapping.
//#####################

* group[+].name = "identifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "identifier"
* group[=].rule[=].source.context = "uuid"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.identifier"
* group[=].rule[=].target.transform = #uuid

//#####################
//Group: status
//Comment: XDS metadata standard attribute "availabilityStatus": set by system upon upload.
//#####################

//RUN: 
// availabilityStatus in XDS metadata: "urn:oasis:names:tc:ebxml-regrep:StatusType:Approved"|"urn:oasis:names:tc:ebxml-regrep:StatusType:Deprecated". 
// status in DocumentReference: "current"|"superseded" 
//For now "hard coded" value "current"
* group[+].name = "status"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "status"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #current // fixed value - MedCom XDS Version   
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.status"
* group[=].rule[=].target.transform = #create


//#####################
//Group: type
//Comment: XDS metadata standard attribute "typeCode"
//#####################

* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "type-system"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.system"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.system"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "type-code"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.code"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.code"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "type-display"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.display"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.display"
* group[=].rule[=].target.transform = #copy




//#####################
//Group: category
//Comment: XDS metadata standard attribute "classCode"
//#####################
//RUN: only one entry "001" in value set
* group[+].name = "category"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "category-system"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "1.2.208.184.100.9"  // codeSystem ? CodeSystem:$codeSystem = ” 1.2.208.184.100.9” or http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-classcode-VS
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "category.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "category-code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueCode = #001 // Skulle det være noget andet ved medd.?
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "category.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "category-display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "Klinisk rapport"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "category.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group: subject
//Comment: XDS metadata standard attribute "patientId"
//#####################

* group[+].name = "subject"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "subject"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).subject.reference"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "subject.reference"
* group[=].rule[=].target.transform = #copy


//#####################
//Group: author
//Comment: XDS metadata standard attribute "author.authorinstitution" and "author.authorperson"
//#####################


* group[+].name = "author-institution"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "author-institution"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).author.reference.where($this.startsWith('Organization'))"
* group[=].rule[=].target.element = "author.reference"
* group[=].rule[=].target.transform = #copy

* group[+].name = "author-person"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "author-person"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).author.reference.where($this.startsWith('Practitioner'))"
* group[=].rule[=].target.element = "author.reference"
* group[=].rule[=].target.transform = #copy

//#####################
//Group: authenticator
//Comment: XDS metadata standard attribute "authenticator". Optional in documentReference.
//#####################
* group[+].name = "authenticator"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "authenticator"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).authenticator.reference.where($this.startsWith('Practitioner'))"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).authenticator.reference"  //alternate path
* group[=].rule[=].target.element = "authenticator.reference"
* group[=].rule[=].target.transform = #copy

//#####################
//Group: securityLabel
//Comment: XDS metadata standard attribute "author.authorinstitution" and "author.authorperson"
//#####################
* group[+].name = "securityLabel"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "securityLabel"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).confidentiality"
* group[=].rule[=].target.element = "securityLabel.coding.code"
* group[=].rule[=].target.transform = #copy


//#####################
//Group: content.attachment
//Comment: XDS metadata standard attributes: mimeType, languageCode, URI, size, hash, title, creationTime
//#####################

* group[+].name = "content-attachment"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target
 
// DocRef attribute: content.attachment.contentType == XDS attribute: DocumentEntry.mimeType
* group[=].rule[0].name = "content-attachment-contentType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "application/fhir+xml" //ContentType is set by the system providing the document. For FHIR documents: "application/fhir+xml" | "application/fhir+json"
* group[=].rule[=].target.element = "content.attachment.contentType"
* group[=].rule[=].target.transform = #create

// DocRef attribute: content.attachment.language == XDS attribute: DocumentEntry.languageCode
* group[=].rule[+].name = "content-attachment-language"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).language"
* group[=].rule[=].target.element = "content.attachment.language"
* group[=].rule[=].target.transform = #copy

// DocRef attribute: content.attachment.url == XDS attribute: DocumentEntry.URI (Optional)
/*
* group[=].rule[+].name = "content-attachment-url"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "??" 
* group[=].rule[=].target.element = "content.attachment.url"
* group[=].rule[=].target.transform = #copy 
*/

// DocRef attribute: content.attachment.size == XDS attribute: DocumentEntry.size (optional)
/*
* group[=].rule[+].name = "content-attachment-size"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "??"
* group[=].rule[=].target.element = "content.attachment.size"
* group[=].rule[=].target.transform = #copy
*/

// DocRef attribute: content.attachment.hash == XDS attribute: DocumentEntry.hash (optional)
/*
* group[=].rule[+].name = "content-attachment-hash"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "??"
* group[=].rule[=].target.element = "content.attachment.hash"
* group[=].rule[=].target.transform = #copy
*/

// DocRef attribute: content.attachment.title == XDS attribute: DocumentEntry.title
* group[=].rule[+].name = "content-attachment-title"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).title"
* group[=].rule[=].target.element = "content.attachment.title"
* group[=].rule[=].target.transform = #copy

// DocRef attribute: content.attachment.creation == XDS attribute: DocumentEntry.creationTime
* group[=].rule[+].name = "content-attachment-creation"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).date"
* group[=].rule[=].target.element = "content.attachment.creation"
* group[=].rule[=].target.transform = #copy

//#####################
//Group: content-format
//Comment: XDS metadata standard attribute: DocumentEntry.formatCode
//#####################

// RUN: Where to find these informations (in source structure)??
* group[+].name = "content-format"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "content-format-system"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "urn:oid:1.2.208.184.100.10"  //??: https://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-plr-formatcode-VS/
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "content.format.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "content-format-code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "http://medcomfhir.dk/ig/conditionlist" // ?? 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "content.format.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "content-format-display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "Conditonlist version x.x.x" // ?? 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "content.format.display"
* group[=].rule[=].target.transform = #create

//#####################
//Group: context-event (Optional)
//Comment: XDS metadata standard attribute: DocumentEntry.eventCodeList
//#####################

//#####################
//Group: context-period (Optional)
//Comment: XDS metadata standard attributes: DocumentEntry.serviceStartTime + DocumentEntry.serviceStopTime
//#####################



//#####################
//Group: context-facilityType
//Comment: XDS metadata standard attributes: DocumentEntry.healthcareFacilityTypeCode
//Set by document provider system, must be selected from ValueSet: DK_IHE_HealthcareFacilityTypeCode_VS
//RUN: Is set by providersystem
//#####################

* group[+].name = "context-facilityType"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "context-facilityType-system"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "urn:oid:2.16.840.1.113883.6.96"  //SNOMED CT
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.facilityType.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "context-facilityType-code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueCode = #554871000005105 // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.facilityType.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "context-facilityType-display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "psykiatrienhed" // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.facilityType.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group: context-practiceSetting
//Comment: XDS metadata standard attributes: DocumentEntry.practiceSettingCode
//Set by document provider system, must be selected from ValueSet: DK_IHE_practiceSettingCode_VS

//RUN: Is set by providersystem
//#####################

* group[+].name = "context-practiceSetting"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "context-practiceSetting-system"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "urn:oid:2.16.840.1.113883.6.96"  //SNOMED CT
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.practiceSetting.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "context-practiceSetting-code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueCode = #394588006 // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.practiceSetting.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "context-practiceSetting-display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "børne- og ungdomspsykiatri" // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.practiceSetting.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group: context-sourcePatientInfo
//Comment: XDS metadata standard attribute "DocumentEntry.sourcePatientId and DocumentEntry.sourcePatientInfo"
//#####################

* group[+].name = "context-sourcePatientInfo"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "context-sourcePatientInfo"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).subject.reference"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.sourcePatientInfo.reference"
* group[=].rule[=].target.transform = #copy


/*
### QUESTIONS ###

#1 How to set values provided by system (document provider):
- extension-homeCommunityid
- extension-version-id
- status
- category
- content.attachment.contentType
- content.format 
- context.facilityType
- context-practiceSetting

#2 Difference between references with/without types eg: "- Patient/d65cd8db-4520-4264-87be-a5fd01fb9762" and - '#37628912-7816-47a3-acd8-396b610be142'


#3 why is only practiontioner allowed in author.person? 
- see https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference-definitions.html#DocumentReference.author



*/





/*
##### target instance // documentReferece (APD-DK) raw json: 
link:
https://build.fhir.org/ig/medcomdk/dk-medcom-xds-documents/DocumentReference-94e65db8-2f0c-4a2c-a7c9-06a160d59a12.json
*/
