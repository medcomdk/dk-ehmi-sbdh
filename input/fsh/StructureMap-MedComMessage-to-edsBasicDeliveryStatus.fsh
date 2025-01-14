Instance: StructureMap-MedComMessagingMessage2edsBasicDeliveryStatus-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComMessage to an EHMI Delivery Status structure (edsBasicDeliveryStatus)"
Description: "Transformation specification of a MedComMessage to an EHMI Delivery Status structure (edsBasicDeliveryStatus)"
Usage: #definition
* url = "http://medcomehmi.dk/ig/dk-ehmi-MedComMessage/StructureMap/MedComMessage2edsBasicDeliveryStatus-transform"
* name = "Transform from a MedComMessage to an edsBasicDeliveryStatus"
* title = "Transform from a MedComMessage to an edsBasicDeliveryStatus"
* status = #draft
* description = "Transform from a FHIR Messsage to a MedComMessage"
* structure[+].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-message"
* structure[=].mode = #source
* structure[0].url = "http://medcomehmi.dk/ig/dk-ehmi-eds/StructureDefinition/edsBasicDeliveryStatus"
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
* group[=].input[=].type = "MedComMessage"
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
* group[=].input[0].name = "MedComMessage"
* group[=].input[=].type = "MedComMessage"
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
* group[=].input[0].name = "MedComMessage"
* group[=].input[=].type = "MedComMessage"
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
* group[=].rule[=].source.context = "MedComMessageSenderGLN"
* group[=].rule[=].source.element = "StandardBusinessDocumentHeader/Sender/identifier.substring(4)"
* group[=].rule[=].target.context = "edsStatusSenderGLN"
* group[=].rule[=].target.element = "AuditEvent.agent.where(type.coding.code = 'ehmiSender').extension.value.value"

* group[=].rule[+].name = "Receiver"
* group[=].rule[=].source.context = "MedComMessageReceiverGLN"
* group[=].rule[=].source.element = "StandardBusinessDocumentHeader/Receiver/identifier.substring(4)"
* group[=].rule[=].target.context = "edsStatusSenderGLN"
* group[=].rule[=].target.element = "AuditEvent.agent.where(type.coding.code = 'ehmiSender').extension.value.value"
// ATT: Substring is needed to remove first 4 chars to transform to GLN


* group[=].rule[+].name = "MessageType"
* group[=].rule[=].source.context = "MedComMessageMessageType"
* group[=].rule[=].source.element = "MedComMessage/DocumentIdentification/Standard/[value]"
* group[=].rule[=].target.context = "edsStatusMessageType"
* group[=].rule[=].target.element = "AuditEvent.entity.detail.where(type= 'ehmiMessageType').value"




//* group