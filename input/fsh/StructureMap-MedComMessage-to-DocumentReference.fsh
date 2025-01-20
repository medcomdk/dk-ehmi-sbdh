Instance: MedComMessagingMessage2MedComDocumentReference-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference"
Description: "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference"
Usage: #definition
* id = "MedComMessagingMessage2MedComDocumentReference-transform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedComMessagingMessage2MedComDocumentReference-transform"
* name = "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference"
* title = "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference"
* status = #draft
* description = "Transformation specification of a MedComMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference"
* structure[+].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-message"
* structure[=].mode = #source
* structure[+].url = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-documentreference"
* structure[=].mode = #target

//RUNES OPGAVE

//Group
* group[0].name = "MedComMessagingMessage2MedComDocumentReference" //Human-readable labe
* group[=].typeMode = #none
* group[=].input[0].name = "source"  //id - Name for this instance of data: 
* group[=].input[=].type = "Bundle"  //string - Type for this instance of data
* group[=].input[=].mode = #source   // code - kan være "source" eller "target"
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

/*
//Rule demo1
* group[=].rule[0].name = "homeCommunityid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #xyz
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "homeCommunityid"
* group[=].rule[=].target.transform = #*/

//Rule demo2
* group[=].rule[0].name = "homeCommunityid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #zyx
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "versionid"
* group[=].rule[=].target.transform = #create



//masterIdentifier - konstant
* group[+].name = "masterIdentifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target

//Rule demo2
* group[=].rule[0].name = "homeCommunityid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #zyx
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "versionid"
* group[=].rule[=].target.transform = #create
/*
//Rule 
* group[=].rule[0].name = "defineValue"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #xyz
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "homeCommunityid"
* group[=].rule[=].target.transform = # */