Instance: MedComDocumentBundle2MedComDocumentDocumentReference-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
Description: "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference "
Usage: #definition
* id = "MedComDocumentBundle2MedComDocumentDocumentReferencetransform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedComDocumentBundle2MedComDocumentDocumentReferencetransform"
* name = "MedComDocumentBundle2MedComDocumentDocumentReferencetransform"
* title = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* status = #draft
* description = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-core-document-bundle"                    
* structure[=].mode = #source
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-core-documentreference"
* structure[=].mode = #target


/* 
URLS til ressourcer 

build.fhir.org:
https://build.fhir.org/ig/medcomdk/dk-medcom-document/StructureDefinition-medcom-document-bundle
https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-core-document-bundle

https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference
https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-core-documentreference

medcomfhir.dk - ikke udgivet endnu!!:
http://medcomfhir.dk/ig/document/StructureDefinition-medcom-document-bundle
http://medcomfhir.dk/ig/document/StructureDefinition/medcom-documentreference

*/



/*
OBS:
 structure[+].url bør senre rettes til http://medcomfhir.dk/ig/.... når det er udgivet  på medcoms server

Fejl i QA rapport: 
Se på referencer som de peger på det rigtige sted. Spørg AI om referecererne.
Prøv at kommenter alle fejl ud, så det er det der virker der er tilbage. 
Prøv at kører mapping. 



*/



//#####################
//Group #0: extension.homeCommunityid
//Comment: the repository OID, where the document is placed
//#####################
* group[+].name = "extensionhomeCommunityid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension:homeCommunityid system (homeCommunityid depends on usecase)
* group[=].rule[0].name = "extensionhomeCommunityidsystem"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:1.2.208.176.8.1" // fixed value - OID for danish xds-domain   
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
//* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.system"
//* group[=].rule[=].target.element = "extension.where(url='http://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-document-homecommunityid-extension').valueCoding.system"
* group[=].rule[=].target.element = "extension.where(url='http://medcomfhir.dk/ig/coredocument/StructureDefinition/medcom-core-document-homecommunityid-extension').valueCoding.system"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid code (OID for the repository eg. "1.2.208.176.43210.8.20")
* group[=].rule[+].name = "extensionhomeCommunityidcode"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.2.208.176.8.1" // Source system must provide xds repository OID
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.code"
* group[=].rule[=].target.element = "extension.where(url='http://medcomfhir.dk/ig/coredocument/StructureDefinition/medcom-core-document-homecommunityid-extension').valueCoding.code"
* group[=].rule[=].target.transform = #create

//Rule #3: MedComDocumentDocumentReference.extension:homeCommunityid display (displayname for repository eg. "TEST2")
* group[=].rule[+].name = "extensionhomeCommunityiddisplay"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "Common Danish IHE XDS domain" // Source system must provide xds repository name 
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
//* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.display"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='http://medcomfhir.dk/ig/coredocument/StructureDefinition/medcom-core-document-homecommunityid-extension').valueCoding.display"
* group[=].rule[=].target.transform = #create





//#####################
//Group #1: extension.versionNumber
//Comment: Version of the MedCom XDS-metdatdata standard
//##################### 
* group[+].name = "extensionversionid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension.versionid  (MedCom XDS Version ID)
* group[=].rule[0].name = "extensionversionid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.0.0" // fixed value - MedCom XDS Version   
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-version-id-extension').valueString"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-core-document-version-id-extension').valueString"
* group[=].rule[=].target.transform = #create



//#####################
//Group #2 masterIdentifier
//Comment: XDS metadata standard: "uniqueId".
//#####################

* group[+].name = "masterIdentifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "masterIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "masterIdentifier"
* group[=].rule[=].target.transform = #copy


//#####################
//Group #3: identifier
//Comment: XDS metadata standard: "entryUUID". UUID is created during mapping.
//#####################

* group[+].name = "identifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "identifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "identifier"
* group[=].rule[=].target.transform = #uuid

//#####################
//Group: #4 status
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
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "status"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #current // fixed value - MedCom XDS Version   
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "status"
* group[=].rule[=].target.transform = #create


/*

//#####################
//Group #5: type
//Comment: XDS metadata standard attribute "typeCode"
//#####################

* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "typesystem"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).type.coding.system"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.system"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "type.coding.system"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "typecode"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).type.coding.code"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.code"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "type.coding.code"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "typedisplay"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).type.coding.display"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.display"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "type.coding.display"
* group[=].rule[=].target.transform = #copy




//#####################
//Group #6: category
//Comment: XDS metadata standard attribute "classCode"
//#####################
//RUN: only one entry "001" in value set
* group[+].name = "category"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "categorysystem"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.2.208.184.100.9"  // codeSystem ? CodeSystem:$codeSystem = ” 1.2.208.184.100.9” or http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-classcode-VS
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "category.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "categorycode"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #001 // Skulle det være noget andet ved medd.?
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "category.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "categorydisplay"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "Klinisk rapport"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "category.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group #7: subject
//Comment: XDS metadata standard attribute "patientId"
//#####################

* group[+].name = "subject"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "subject"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).subject.reference"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).subject.reference"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "subject.reference"
* group[=].rule[=].target.transform = #copy


//#####################
//Group #8: author
//Comment: XDS metadata standard attribute "author.authorinstitution"  and "author.authorperson"
//#####################


* group[+].name = "authorinstitution"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "authorinstitution"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).author.reference.where($this.startsWith('Organization'))"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).author.reference.where($this.startsWith('Organization'))"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "author.reference"
* group[=].rule[=].target.transform = #copy

* group[+].name = "authorperson"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "authorperson"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).author.reference.where($this.startsWith('Practitioner'))"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).author.reference.where($this.startsWith('Practitioner'))"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "author.reference"
* group[=].rule[=].target.transform = #copy

//#####################
//Group #9: authenticator
//Comment: XDS metadata standard attribute "authenticator". Optional in documentReference.
//#####################
* group[+].name = "authenticator"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "authenticator"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).authenticator.reference.where($this.startsWith('Practitioner'))"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).authenticator.reference"  //alternate path
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "authenticator.reference"
* group[=].rule[=].target.transform = #copy

//#####################
//Group: #10 securityLabel
//Comment: XDS metadata standard attribute "author.authorinstitution" and "author.authorperson"
//#####################
* group[+].name = "securityLabel"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "securityLabel"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).confidentiality"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).confidentiality"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "securityLabel.coding.code"
* group[=].rule[=].target.transform = #copy


//#####################
//Group: content.attachment
//Comment: XDS metadata standard attributes: mimeType, languageCode, URI, size, hash, title, creationTime
//#####################

* group[+].name = "contentattachment"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target
 
// DocRef attribute: content.attachment.contentType == XDS attribute: DocumentEntry.mimeType
* group[=].rule[0].name = "contentattachmentcontentType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "application/fhir+xml" //ContentType is set by the system providing the document. For FHIR documents: "application/fhir+xml" | "application/fhir+json"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.attachment.contentType"
* group[=].rule[=].target.transform = #create

// DocRef attribute: content.attachment.language == XDS attribute: DocumentEntry.languageCode
* group[=].rule[+].name = "contentattachmentlanguage"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).language"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).language"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.attachment.language"
* group[=].rule[=].target.transform = #copy

// DocRef attribute: content.attachment.url == XDS attribute: DocumentEntry.URI (Optional)
/*
* group[=].rule[+].name = "contentattachmenturl"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "??" 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "content.attachment.url"
* group[=].rule[=].target.transform = #copy 
*/

// DocRef attribute: content.attachment.size == XDS attribute: DocumentEntry.size (optional)
/*
* group[=].rule[+].name = "contentattachmentsize"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "??"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "content.attachment.size"
* group[=].rule[=].target.transform = #copy
*/

// DocRef attribute: content.attachment.hash == XDS attribute: DocumentEntry.hash (optional)
/*
* group[=].rule[+].name = "contentattachmenthash"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "??"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "content.attachment.hash"
* group[=].rule[=].target.transform = #copy
*/


/*
// DocRef attribute: content.attachment.title == XDS attribute: DocumentEntry.title
* group[=].rule[+].name = "contentattachmenttitle"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).title"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).title"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.attachment.title"
* group[=].rule[=].target.transform = #copy

// DocRef attribute: content.attachment.creation == XDS attribute: DocumentEntry.creationTime
* group[=].rule[+].name = "contentattachmentcreation"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).date"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).date"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.attachment.creation"
* group[=].rule[=].target.transform = #copy

//#####################
//Group: content-format
//Comment: XDS metadata standard attribute: DocumentEntry.formatCode
//#####################

// RUN: Where to find these informations (in source structure)??
* group[+].name = "contentformat"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "contentformatsystem"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:1.2.208.184.100.10"  //??: https://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-plr-formatcode-VS/
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.format.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "contentformatcode"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "http://medcomfhir.dk/ig/conditionlist" // ?? 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.format.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "contentformatdisplay"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.0.0" // ?? 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "content.format.display"
* group[=].rule[=].target.transform = #create

//#####################
//Group: context-event (Optional)
//Comment: XDS metadata standard attribute: DocumentEntry.eventCodeList
//#####################

//#####################
//Group: contextperiod (Optional)
//Comment: XDS metadata standard attributes: DocumentEntry.serviceStartTime + DocumentEntry.serviceStopTime
//#####################



//#####################
//Group: context-facilityType
//Comment: XDS metadata standard attributes: DocumentEntry.healthcareFacilityTypeCode
//Set by document provider system, must be selected from ValueSet: DK_IHE_HealthcareFacilityTypeCode_VS
//RUN: Is set by providersystem
//#####################

* group[+].name = "contextfacilityType"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "contextfacilityTypesystem"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:2.16.840.1.113883.6.96"  //SNOMED CT
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "context.facilityType.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "contextfacilityTypecode"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #554871000005105 // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "context.facilityType.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "contextfacilityTypedisplay"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "psykiatrienhed" // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "context.facilityType.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group: context-practiceSetting
//Comment: XDS metadata standard attributes: DocumentEntry.practiceSettingCode
//Set by document provider system, must be selected from ValueSet: DK_IHE_practiceSettingCode_VS

//RUN: Is set by providersystem
//#####################

* group[+].name = "contextpracticeSetting"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "contextpracticeSettingsystem"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:2.16.840.1.113883.6.96"  //SNOMED CT
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "context.practiceSetting.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "contextpracticeSettingcode"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #394588006 // Set b y document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "context.practiceSetting.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "contextpracticeSettingdisplay"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "boerne- og ungdomspsykiatri" // Set by document provider system, for now hard coded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.practiceSetting.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group: context-sourcePatientInfo..
//Comment: XDS  metadata standard attribute "DocumentEntry.sourcePatientId and DocumentEntry.sourcePatientInfo"
//#####################

* group[+].name = "contextsourcePatientInfo"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "contextsourcePatientInfo"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "entry.resource.ofType(Composition).subject.reference"
//* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).subject.reference"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "context.sourcePatientInfo.reference"
* group[=].rule[=].target.transform = #copy




/*
### QUESTIONS ###

#1 How to set values provided by system (document provider):
- extension-homeCommunityid
- extension-version-id
- status dd
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
