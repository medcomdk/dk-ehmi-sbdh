Instance: MedComMessagingMessage2MedComMessageDocumentReference-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a MedComMessageDocumentReference"
Description: "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a MedComMessageDocumentReference"
Usage: #definition
* id = "MedComMessagingMessage2MedComMessageDocumentReference-transform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedComMessagingMessage2MedComDocumentReference-transform"
* name = "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a MedComMessageDocumentReference"
* title = "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a MedComMessageDocumentReference"
* status = #draft
* description = "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a MedComMessageDocumentReference"
* structure[+].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-message"
* structure[=].mode = #source
* structure[+].url = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-MedComMessageDocumentReference"
* structure[=].mode = #target


//Group MedComMessageDocumentReference
* group[0].name = "MedComMessageDocumentReference" //Human-readable labe
* group[=].typeMode = #none
* group[=].input[0].name = "source"  //id - Name for this instance of data: 
* group[=].input[=].type = "Bundle"  //string - Type for this instance of data
* group[=].input[=].mode = #source   // code - kan være "source" eller "target"
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComMessageDocumentReference"
* group[=].input[=].mode = #target

//Rule #1: MedComMessageDocumentReference.extension:homeCommunityid
// homeCommunityid sættes automatisk i xds metadata, så er der behov for denne mapning i det heletaget?
* group[=].rule[0].name = "homeCommunityid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #xyz  // UUID der peger på enten SDS eller PLSP XDS dokumentrepo    
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "homeCommunityid"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComMessageDocumentReference.extension:versionNumber
* group[=].rule[+].name = "versionNumber"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.0.0"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "versionid"
* group[=].rule[=].target.transform = #create

//Group: masterIdentifier
//I CDA er det documentId @extension og @root, tilsvarende i message må det være bundle.id
* group[+].name = "masterIdentifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComMessageDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "masterIdentifier.value"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].target.context = "masterIdentifier"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "value"
* group[=].rule[=].target.transform = #copy

//Group: identifier
// Dette UUID skal genereres af kildesystem og kommer ikke fra bundle.
* group[+].name = "identifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComMessageDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "identifer.value"
* group[=].rule[=].source.context = "uuid"
* group[=].rule[=].target.context = "identifer"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "value"
* group[=].rule[=].target.transform = #uuid

//Group: status [DocumentEntry.availabilityStatus]
//availabilityStatus skal defineres af kildesystem og kommer ikke fra bundle.
* group[+].name = "status"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComMessageDocumentReference"
* group[=].input[=].mode = #target


* group[=].rule[+].name = "status"
* group[=].rule[=].source.context = "defaultvalue"
* group[=].rule[=].source.defaultValueString = "current" // Her skal der jf. XDS matadatastandarden angives enten: current | superseded
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "status"
* group[=].rule[=].target.transform = #create

//Group: type
// [DocumentEntry.typeCode] i CDA er det clinicalDocument/code - hvad er tilsvarende i en message - fx "HomeCareObservation"?? 
* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComMessageDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "system"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "??"  // Kodesystem også defineret af DocumentReference men måske er det denne DK_IHE_TypeCode_VS
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.system"

* group[=].rule[+].name = "code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "HomeCareObservation"  // Kan ikke se hvor den kan kopieres fra bundle? 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.code"

* group[=].rule[+].name = "display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "HomeCareObservation"  // Kan ikke se hvor den kan kopieres fra bundle? 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.display"



//Group category [DocumentEntry.classcode] Categorization of document 
// CodeSystem:$codeSystem = ” 1.2.208.184.100.9” eller http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-classcode-VS

//Group subject [DocumentEntry.sourcePatientInfo, DocumentEntry.sourcePatientId] Who/what is the subject of the document

//Group author.institution [DocumentEntry.author] Who and/or what authored the document

//Group author.person [DocumentEntry.author] Who and/or what authored the document
// optional

//Group authenticator [DocumentEntry.legalAuthenticator] Who authenticated the document
// Optional

//Group securityLabel - [DocumentEntry.confidentialityCode] Document security-tags

//Group content






