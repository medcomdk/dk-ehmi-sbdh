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
//#####################
//The following elements regarding homeCommunityid must be populated by source system 
//1: extension.valueCoding.system: Must be "urn:oid:1.2.208.176.1.2"
//2: extension.valueCoding.code: OID for the repository eg. "1.2.208.176.43210.8.20"
//3: extension.valueCoding.display: "displayname" for repository eg. "TEST2"

//OBS!! homeCommunityid sættes af kildesystem, så skal have afklaret hvordan dette defienres.
* group[+].name = "extension.homeCommunityid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
//* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
//* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension:homeCommunityid system (Must be fixed to "urn:oid:1.2.208.176.1.2")
* group[=].rule[0].name = "homeCommunityid-system"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:1.2.208.176.1.2" // fixed value - OID for danish xds-domain   
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.system.value"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid code (OID for the repository eg. "1.2.208.176.43210.8.20")
* group[=].rule[+].name = "homeCommunityid-code"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "[REPOSITORY OID: 1.2.208.176.43210.8.20|?]" // Source system must provide xds repository OID
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.code.code"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid display (displayname for repository eg. "TEST2")
* group[=].rule[+].name = "homeCommunityid-display"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "[REPOSITORY NAME: TEST1|TEST2]" // Source system must provide xds repository name 
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.display.value"
* group[=].rule[=].target.transform = #create



