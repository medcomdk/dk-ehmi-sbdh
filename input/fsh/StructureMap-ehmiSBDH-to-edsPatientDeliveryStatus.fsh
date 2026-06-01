/*
Instance: ehmiSbdh2edsPatientDeliveryStatus-transform
InstanceOf: StructureMap
Title: "Transformation specification of an ehmiSBDH-Envelope to an EHMI Delivery Status structure (edsPatientDeliveryStatus)"
Description: "Transformation specification of an ehmiSBDH-Envelope to an EHMI Delivery Status structure (edsPatientDeliveryStatus)"
Usage: #definition
* id = "ehmiSbdh2edsPatientDeliveryStatus-transform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/ehmiSbdh2edsPatientDeliveryStatus-transform"
* name = "Transform from an ehmiSBDH-Envelope to an edsPatientDeliveryStatus"
* title = "Transform from an ehmiSBDH-Envelope to an edsPatientDeliveryStatus"
* status = #draft
* description = "Transform from a FHIR Messsage to an ehmiSBDH-Envelope"
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH/StandardBusinessDocumentHeader.xsd"
* structure[=].mode = #source
* structure[0].url = "http://medcomehmi.dk/ig/dk-ehmi-eds/StructureDefinition/edsPatientDeliveryStatus"
* structure[=].mode = #target


* group[0].name = "HeaderVersion"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "StandardBusinessDocumentHeader"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target


* group[=].rule[0].name = "HeaderVersion"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/HeaderVersion"
* group[=].rule[=].target.transform = #create


/*
* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "SourceNameForATest" // Depr name when comfortable with syntax
* group[=].input[=].type = "ehmiSbdh"
* group[=].input[=].mode = #source
* group[=].input[+].name = "EDSDeliveryStatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "SystemType"
* group[=].rule[=].source.context = "defaultValue"
//* group[=].rule[=].source.contextType = #variable
* group[=].rule[=].source.defaultValueString = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "[AuditEvent.type.system]"

* group[=].rule[+].name = "code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiMessaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "[AuditEvent.type.code]"

* group[=].rule[+].name = "display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "EHMI messaging event"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "[AuditEvent.type.display]"

// Try out conditioned rules for the Slicing

* group[+].name = "Subtype"
* group[=].typeMode = #none
* group[=].input[0].name = "ehmiSBDH"
* group[=].input[=].type = "ehmiSBDH"
* group[=].input[=].mode = #source
* group[=].input[+].name = "EDSDeliveryStatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "terminologySystem"
* group[=].rule[=].source.context = "msgSent"
* group[=].rule[=].source.defaultValueString = "http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-sub-types"
* group[=].rule[=].target.context = "subtypeMsgSent"
* group[=].rule[=].target.element = "[AuditEvent.subtype.system]"





* group[+].name = "agents"
* group[=].typeMode = #none
* group[=].input[0].name = "ehmiSBDH"
* group[=].input[=].type = "ehmiSBDH"
* group[=].input[=].mode = #source
* group[=].input[+].name = "EDSDeliveryStatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target


* group[=].rule[0].name = "defineSenderTypeCode"
* group[=].rule[=].source.context = "sender"
* group[=].rule[=].source.defaultValueString = "ehmiSender"
* group[=].rule[=].target.context = "agentType"
* group[=].rule[=].target.element = "AuditEvent.agent[0].type.coding.code"

* group[=].rule[+].name = "defineSenderTypeSystem"
* group[=].rule[=].source.context = "sender"
* group[=].rule[=].source.defaultValueString = " http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-participationroletype"
* group[=].rule[=].target.context = "agentTypeCode"
* group[=].rule[=].target.element = "AuditEvent.agent[0].type.coding.system"

* group[=].rule[+].name = "defineReceiverTypeCode"
* group[=].rule[=].source.context = "target"
* group[=].rule[=].source.defaultValueString = "ehmiReceiver"
* group[=].rule[=].target.context = "agentTypeCode"
* group[=].rule[=].target.element = "AuditEvent.agent[1].type.coding.code"

* group[=].rule[+].name = "defineSenderTypeSystem"
* group[=].rule[=].source.context = "sender"
* group[=].rule[=].source.defaultValueString = " http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-participationroletype"
* group[=].rule[=].target.context = "agentTypeCode"
* group[=].rule[=].target.element = "AuditEvent.agent[1].type.coding.system"



// GLN 
* group[=].rule[+].name = "Sender"
* group[=].rule[=].source.context = "sbdhSenderGLN"
* group[=].rule[=].source.element = "StandardBusinessDocumentHeader/Sender/identifier.substring(4)"
* group[=].rule[=].target.context = "edsStatusSenderGLN"
* group[=].rule[=].target.element = "AuditEvent.agent.where(type.coding.code = 'ehmiSender').extension.value.value"

* group[=].rule[+].name = "Receiver"
* group[=].rule[=].source.context = "sbdhReceiverGLN"
* group[=].rule[=].source.element = "StandardBusinessDocumentHeader/Receiver/identifier.substring(4)"
* group[=].rule[=].target.context = "edsStatusSenderGLN"
* group[=].rule[=].target.element = "AuditEvent.agent.where(type.coding.code = 'ehmiSender').extension.value.value"
// ATT: Substring is needed to remove first 4 chars to transform to GLN


* group[=].rule[+].name = "MessageType"
* group[=].rule[=].source.context = "sbdhMessageType"
* group[=].rule[=].source.element = "SBDH/DocumentIdentification/Standard/[value]"
* group[=].rule[=].target.context = "edsStatusMessageType"
* group[=].rule[=].target.element = "AuditEvent.entity.detail.where(type= 'ehmiMessageType').value"
*/



