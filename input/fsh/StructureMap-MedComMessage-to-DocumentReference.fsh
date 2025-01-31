/*
Instance: MedComMessagingMessage2MedComDocumentReference-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComMessagingMessage and an ehmiSBDH-Envelope to a DocumentReference"
Description: "Transformation specification of a MedComMessagingMessage and an ehmiSBDH-Envelope to a DocumentReference"
Usage: #definition
* id = "MedComMessagingMessage2MedComDocumentReference-transform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedComMessagingMessage2MedComDocumentReference-transform"
* name = "Transformation specification of a MedComMessagingMessage and an ehmiSBDH-Envelope to a DocumentReference"
* title = "Transformation specification of a MedComMessagingMessage and an ehmiSBDH-Envelope to a DocumentReference"
* status = #draft
* description = "Transformation specification of a MedComMessagingMessage and an ehmiSBDH-Envelope to a DocumentReference"
* structure[+].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-message"
* structure[=].mode = #source
* structure[+].url = "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-documentreference"
* structure[=].mode = #target
* group[0].name = "MedComMessagingMessage2MedComDocumentReference"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentReference"
* group[=].input[=].mode = #target
* group[=].rule[0].name = "homeCommunityid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #xyz
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "homeCommunityid"
* group[=].rule[=].target.transform = #create
* group[=].rule[0].name = "homeCommunityid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #zyx
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "versionid"
* group[=].rule[=].target.transform = #create
*/