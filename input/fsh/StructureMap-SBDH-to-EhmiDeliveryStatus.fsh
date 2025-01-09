Instance: Sbdh2EhmiDeliveryStatus-transform
InstanceOf: StructureMap
Title: "Transformation specification of an ehmiSBDH Envelope to a EHMI Delivery Status structure"
Description: "Transformation specification of an ehmiSBDH Envelope to a EHMI Delivery Status structure"
Usage: #definition
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/Sbdh2EhmiDeliveryStatus-transform"
* name = "Transform from an ehmiSBDH Envelope to a EHMIDeliveryStatus"
* title = "Transformation specification of an ehmiSBDH Envelope to a EHMI Delivery Status structure"
* status = #draft
* description = "Transform from an ehmiSBDH Envelope to a EHMIDeliveryStatus"
* structure[0].url = "http://medcomehmi.dk/ig/dk-ehmi-eds/StructureDefinition/EhmiDeliveryStatus"
* structure[=].mode = #target
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/branches/v0.90.1-beta.1/ehmiSBDH/StandardBusinessDocumentHeader.xsd"
* structure[=].mode = #source

// Header version is default and does not require sources.
* group[0].name = "HeaderVersion"
* group[=].typeMode = #none
* group[=].input[0].name = "target"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "HeaderVersion"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/HeaderVersion"
* group[=].rule[=].target.transform = #create

// AuditEvent.type element:
// Uses only default values, does not require specification of source
* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "typeSystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* group[=].rule[=].target.context = "AuditEvent.type"
* group[=].rule[=].target.element = "system"

* group[=].rule[+].name = "typeCode"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiMessaging"
* group[=].rule[=].target.context = "AuditEvent.type"
* group[=].rule[=].target.element = "code"

* group[=].rule[+].name = "typeDisplay"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "EHMI messaging event"
* group[=].rule[=].target.context = "AuditEvent.type"
* group[=].rule[=].target.element = "display"

// AuditEvent.subtype:
// Contains multiple Slices
// Slices are near identical, but with different fixed values.
// Seems unfinished, unlear mapping.
// Seems to not need Source as everythin is fixed values or [0..0]
* group[+].name = "Subtype"
* group[=].typeMode = #none
//* group[=].input[0].name = "ehmiSBDH"
//* group[=].input[=].type = "ehmiSBDHeader"
//* group[=].input[=].mode = #source
* group[=].input[0].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "terminologySystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-sub-types"
* group[=].rule[=].target.context = "AuditEvent.subtype"
* group[=].rule[=].target.element = "system"


// AuditEvent.agents
// 
* group[+].name = "agents"
* group[=].typeMode = #none
//* group[=].input[0].name = "ehmiSBDH"
//* group[=].input[=].type = "ehmiSBDH"
//* group[=].input[=].mode = #source
* group[=].input[0].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target


* group[=].rule[0].name = "defineSenderTypeCode"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiSender"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[0].type.coding.code"

* group[=].rule[+].name = "defineSenderTypeSystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-participationroletype"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[0].type.coding.system"

* group[=].rule[+].name = "defineReceiverTypeCode"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiReceiver"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[1].type.coding.code"

* group[=].rule[+].name = "defineSenderTypeSystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = " http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-participationroletype"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[1].type.coding.system"

* group[=].rule[+].name = "SenderGLN"
* group[=].rule[=].source.context = "StandardBusinessDocumentHeader.Sender.identifier"
* group[=].rule[=].source.element = "substring(5)"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent.where(type.coding.code = 'ehmiSender').extension.value.value" // This is the fhirPath to extract GLN in examples on IG. 
// If examples are faulty, the target element must be changed accordingly. 

* group[=].rule[+].name = "ReceiverGLN"
* group[=].rule[=].source.context = "StandardBusinessDocumentHeader.Receiver.identifier"
* group[=].rule[=].source.element = "substring(5)"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent.where(type.coding.code = 'ehmiReceiver').extension.value.value" // This is the fhirPath to extract GLN in examples on IG. 
// If examples are faulty, the target element must be changed accordingly. 
// ATT: Substring is needed to remove first 5 chars to transform to GLN, from iso6523-actorid-upis


* group[=].rule[+].name = "MessageType"
* group[=].rule[=].source.context = "StandardBusinessDocumentHeader.DocumentIdentification.Standard"
//* group[=].rule[=].source.element = "/[value]"
* group[=].rule[=].target.context = "edsStatusMessageType"
* group[=].rule[=].target.element = "AuditEvent.entity.detail.where(type= 'ehmiMessageType').value"
