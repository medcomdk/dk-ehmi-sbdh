/*Profile: EhmiSBDH
Parent: Bundle
Description: "An example profile of the Basic resource."
//* type = #collection
* type = #batch

/*Profile: EhmiSbdhSender
Parent: Organization
Description: "An example profile of the Organization resource."
* identifier MS 
* identifier.type = #GLN

Profile: EhmiSbdhReceiver
Parent: Organization
Description: "An example profile of the Organization resource."
* identifier MS 
* identifier.type = #GLN

//* code = #adminact
/*
Profile: EhmiSBDH
Parent: Basic
Description: "An example profile of the Basic resource."
* code.coding.system = "http://terminology.hl7.org/CodeSystem/basic-resource-type"
* code.coding.code = #adminact


Profile: EhmiSbdhDocumentInformation
Parent: Basic
Description: "An example profile of the Basic resource."
//* code = #adminact

*/