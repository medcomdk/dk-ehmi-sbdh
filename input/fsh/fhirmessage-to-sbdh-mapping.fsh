
Instance: fhirmsg2sbdh-transform
InstanceOf: StructureMap
Usage: #definition
* url = "http://hl7.org/fhir/StructureMap/fhirmsg2sbdh-transform"
* name = "Transform from a FHIR Messsage to an ehmiSBDH Envelope"
* status = #draft
* structure[0].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-message"
* structure[=].mode = #source
* structure[+].url = "http://medcomehmi.dk/ig/ehmi-sbdh/StructureDefinition/EhmiStandardBusinessDocumentBundle"
* structure[=].mode = #target
* group.name = "Sender"
* group.typeMode = #none
* group.input[0].name = "source"
* group.input[=].type = "MedComMessagingOrganization"
* group.input[=].mode = #source
* group.input[+].name = "target"
* group.input[=].type = "SbdhSender"
* group.input[=].mode = #target
* group.rule[0].name = "Sender"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "MedComMessagingOrganization[Sender]/identifier[EAN-ID]/value"
* group.rule[=].target.context = "target"
* group.rule[=].target.element = "SbdhSender/identifier/value"

* group.name = "Receiver"
* group.typeMode = #none
* group.input[0].name = "source"
* group.input[=].type = "MedComMessagingOrganization"
* group.input[=].mode = #source
* group.input[+].name = "target"
* group.input[=].type = "SbdhReceiver"
* group.input[=].mode = #target
* group.rule[0].name = "Receiver"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "MedComMessagingOrganization[Receiver]/identifier[EAN-ID]/value"
* group.rule[=].target.context = "target"
* group.rule[=].target.element = "SbdhReceiver/identifier/value"

/* group.rule[+].name = "category"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "id"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "category"
* group.rule[=].target.transform = #evaluate
* group.rule[=].target.parameter.valueString = "'non-stock'"
*/

Instance: supplyrequest-transform
InstanceOf: StructureMap
Usage: #definition
* url = "http://hl7.org/fhir/StructureMap/supplyrequest-transform"
* name = "Transform from an ActivityDefinition to a SupplyRequest"
* status = #draft
* structure[0].url = "http://hl7.org/fhir/StructureDefinition/activitydefinition"
* structure[=].mode = #source
* structure[+].url = "http://hl7.org/fhir/StructureDefinition/supplyrequest"
* structure[=].mode = #target
* group.name = "main"
* group.typeMode = #none
* group.input[0].name = "source"
* group.input[=].type = "ActivityDefinition"
* group.input[=].mode = #source
* group.input[+].name = "target"
* group.input[=].type = "SupplyRequest"
* group.input[=].mode = #target
* group.rule[0].name = "status"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "id"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "status"
* group.rule[=].target.transform = #evaluate
* group.rule[=].target.parameter.valueString = "'draft'"
* group.rule[+].name = "category"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "id"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "category"
* group.rule[=].target.transform = #evaluate
* group.rule[=].target.parameter.valueString = "'non-stock'"
* group.rule[+].name = "priority"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "id"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "priority"
* group.rule[=].target.transform = #evaluate
* group.rule[=].target.parameter.valueString = "'routine'"
* group.rule[+].name = "quantity"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "quantity"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "category"
* group.rule[=].target.transform = #copy
* group.rule[+].name = "item"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "code"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "orderedItem.itemCodeableConcept"
* group.rule[=].target.transform = #copy
* group.rule[+].name = "when"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "id"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "occurrenceDateTime"
* group.rule[=].target.transform = #evaluate
* group.rule[=].target.parameter.valueString = "now()"
* group.rule[+].name = "authoredOn"
* group.rule[=].source.context = "source"
* group.rule[=].source.element = "id"
* group.rule[=].source.variable = "a"
* group.rule[=].target.context = "target"
* group.rule[=].target.contextType = #variable
* group.rule[=].target.element = "authoredOn"
* group.rule[=].target.transform = #evaluate
* group.rule[=].target.parameter.valueString = "now()"