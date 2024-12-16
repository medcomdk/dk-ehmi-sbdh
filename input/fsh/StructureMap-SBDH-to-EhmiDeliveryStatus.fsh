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
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/branches/v0.90.1-beta.1/ehmiSBDH/StandardBusinessDocumentHeader.xsd"
//* structure[+].url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureDefinition/EhmiStandardBusinessDocumentBundle"
* structure[=].mode = #source
* structure[0].url = "http://medcomehmi.dk/ig/dk-ehmi-eds/StructureDefinition/EhmiDeliveryStatus"
* structure[=].mode = #target
* group[0].name = "HeaderVersion"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "ehmiSbdh"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target


* group[=].rule[0].name = "HeaderVersion"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "HeaderVersion"
* group[=].rule[=].target.transform = #create


* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "SourceNameForATest"
* group[=].input[=].type = "ehmiSbdh"
* group[=].input[=].mode = #source
* group[=].input[+].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "SystemType"
* group[=].rule[=].source.context = "Default"
//* group[=].rule[=].source.contextType = #variable
* group[=].rule[=].source.defaultValueString = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "AuditEvent.type.system"

* group[=].rule[+].name = "code"
* group[=].rule[=].source.context = "Default"
* group[=].rule[=].source.defaultValueString = "ehmiMessaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "AuditEvent.type.code"

* group[=].rule[+].name = "display"
* group[=].rule[=].source.context = "Default"
* group[=].rule[=].source.defaultValueString = "EHMI messaging event"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "AuditEvent.type.code"










//* group