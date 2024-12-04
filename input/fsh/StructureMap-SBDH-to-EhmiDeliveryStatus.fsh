Instance: Sbdh2EhmiDeliveryStatus-transform
InstanceOf: StructureMap
Title: "Transformation specification of an ehmiSBDH Envelope to a EHMI Delivery Status structure"
Description: "Transformation specification of an ehmiSBDH Envelope to a EHMI Delivery Status structure"
Usage: #definition
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/Sbdh2EhmiDeliveryStatus-transform"
* name = "Transform from a FHIR Messsage to an ehmiSBDH Envelope"
* title = "Transformation specification of a FHIR Messsage to an ehmiSBDH Envelope"
* status = #draft
* description = "Transform from a FHIR Messsage to an ehmiSBDH Envelope"
* structure[+].url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureDefinition/EhmiStandardBusinessDocumentBundle"
* structure[=].mode = #source
* structure[0].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/EhmiDeliveryStatus"
* structure[=].mode = #target
* group[0].name = "HeaderVersion"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "ehmiSbdh"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "EhmiDeliveryStatus"
* group[=].input[=].mode = #target
* group[=].rule[0].name = "HeaderVersion"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "HeaderVersion"
* group[=].rule[=].target.transform = #create
