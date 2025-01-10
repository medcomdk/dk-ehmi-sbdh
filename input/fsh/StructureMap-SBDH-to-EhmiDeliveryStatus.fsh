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


// AuditEvent.type element:
// Uses only default values, does not require specification of source
* group[+].name = "AuditEventType"
* group[=].typeMode = #none
* group[=].input[0].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "typeSystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "http://terminology.hl7.org/CodeSystem/audit-event-type"
* group[=].rule[=].target.context = "AuditEvent.type"
* group[=].rule[=].target.element = "system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "typeCode"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiMessaging"
* group[=].rule[=].target.context = "AuditEvent.type"
* group[=].rule[=].target.element = "code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "typeDisplay"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "EHMI messaging event"
* group[=].rule[=].target.context = "AuditEvent.type"
* group[=].rule[=].target.element = "display"
* group[=].rule[=].target.transform = #create

// AuditEvent.subtype:
// Contains multiple Slices
// Slices are near identical, but with different fixed values.
// Profile may be unfinished, unlear mapping.
// Seems to not need Source as everything is fixed values or [0..0]
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
* group[=].rule[=].target.transform = #create


// AuditEvent.agent
// GLN is taken from the SBDH
* group[+].name = "AuditEventAgent"
* group[=].typeMode = #none
* group[=].input[0].name = "ehmiSBDH"
* group[=].input[=].type = "ehmiSBDH"
* group[=].input[=].mode = #source
* group[=].input[+].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "SenderTypeCode"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiSender"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[0].type.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "SenderTypeSystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-participationroletype"
* group[=].rule[=].target.context = "AuditEvent" // Context does not support fhirpath syntax("()", "[]", "/", etc) so rest is entered ud element
* group[=].rule[=].target.element = "agent[0].type.coding.system" // I have used FHIRpahts here, although it might be better to keep generic
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "ReceiverTypeCode"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "ehmiReceiver"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[1].type.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "SenderTypeSystem"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = " http://medcomehmi.dk/ig/dk-ehmi-terminology/CodeSystem/ehmi-delivery-status-participationroletype"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent[1].type.coding.system"
* group[=].rule[=].target.transform = #create


// underneath target.element  is the fhirPath to extract GLN in examples on IG. 
// If examples are faulty, the target.element must be changed accordingly. 
// ATT: Substring is needed to remove first 5 chars (0088:) to transform to GLN, from iso6523-actorid-upis

* group[=].rule[+].name = "SenderGLN"
* group[=].rule[=].source.context = "StandardBusinessDocumentHeader.Sender.identifier"
* group[=].rule[=].source.element = "substring(5)"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent.where(type.coding.code = 'ehmiSender').extension.value.value" 
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "ReceiverGLN"
* group[=].rule[=].source.context = "StandardBusinessDocumentHeader.Receiver.identifier"
* group[=].rule[=].source.element = "substring(5)"
* group[=].rule[=].target.context = "AuditEvent"
* group[=].rule[=].target.element = "agent.where(type.coding.code = 'ehmiReceiver').extension.value.value" 
* group[=].rule[=].target.transform = #copy


// AuditEvent.entity
* group[+].name = "AuditEventEntity"
* group[=].typeMode = #none
* group[=].input[0].name = "ehmiSBDH"
* group[=].input[=].type = "ehmiSBDH"
* group[=].input[=].mode = #source
* group[=].input[+].name = "EDSDeliverySatus"
* group[=].input[=].type = "AuditEvent"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "MessageType"
* group[=].rule[=].source.context = "StandardBusinessDocumentHeader.DocumentIdentification.Standard"
* group[=].rule[=].target.context = "edsStatusMessageType"
* group[=].rule[=].target.element = "AuditEvent.entity.detail.where(type= 'ehmiMessageType').value"
* group[=].rule[=].target.transform = #copy

