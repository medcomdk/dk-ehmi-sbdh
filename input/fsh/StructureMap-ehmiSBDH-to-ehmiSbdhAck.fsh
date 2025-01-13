Instance: ehmiSbdh2ehmiSbdhAck-transform
InstanceOf: StructureMap
Title: "Transformation specification of an ehmiSbdh Envelope to an ehmiSbdhAck "
Description: "Transformation specification of an ehmiSbdh Envelope to an ehmiSbdhAck "
Usage: #definition
* url = "http://medcomehmi.dk/ig/dk-ehmi-ehmiSbdh/StructureMap/ehmiSbdh2ehmiSbdhAck-transform"
* name = "Transform from an ehmiSbdh Envelope to an ehmiSbdhAck"
* title = "Transform from an ehmiSbdh Envelope to an ehmiSbdhAck"
* status = #draft
* description = "Transform from a FHIR Messsage to an ehmiSbdh Envelope"
* structure[0].url = "https://build.fhir.org/ig/medcomdk/dk-ehmi-ehmiSbdh/branches/v0.90.1-beta.1/ehmiSbdh/StandardBusinessDocumentHeader.xsd"
* structure[=].mode = #source
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-ehmi-ehmiSbdh/branches/v0.90.1-beta.1/ehmiSbdh/StandardBusinessDocumentHeader.xsd"
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
* group[=].input[0].name = "ehmiSbdh"
* group[=].input[=].type = "ehmiSbdh"
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
* group[=].input[0].name = "ehmiSbdh"
* group[=].input[=].type = "ehmiSbdh"
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
* group[=].rule[=].source.context = "ehmiSbdhSenderGLN"
* group[=].rule[=].source.element = "StandardBusinessDocumentHeader/Sender/identifier.substring(4)"
* group[=].rule[=].target.context = "edsStatusSenderGLN"
* group[=].rule[=].target.element = "AuditEvent.agent.where(type.coding.code = 'ehmiSender').extension.value.value"

* group[=].rule[+].name = "Receiver"
* group[=].rule[=].source.context = "ehmiSbdhReceiverGLN"
* group[=].rule[=].source.element = "StandardBusinessDocumentHeader/Receiver/identifier.substring(4)"
* group[=].rule[=].target.context = "edsStatusSenderGLN"
* group[=].rule[=].target.element = "AuditEvent.agent.where(type.coding.code = 'ehmiSender').extension.value.value"
// ATT: Substring is needed to remove first 4 chars to transform to GLN


* group[=].rule[+].name = "MessageType"
* group[=].rule[=].source.context = "ehmiSbdhMessageType"
* group[=].rule[=].source.element = "ehmiSbdh/DocumentIdentification/Standard/[value]"
* group[=].rule[=].target.context = "edsStatusMessageType"
* group[=].rule[=].target.element = "AuditEvent.entity.detail.where(type= 'ehmiMessageType').value"




//* group