/*
Alias: Bundle = http://hl7.org/fhir/StructureDefinition/Bundle
Alias: ehmiSbdh= http://example.org/StructureDefinition/SBDH

Instance: ehmiSBDBundleToSBDH
InstanceOf: StructureMap
Title: "Mapping ehmiSBDBundle to SBDH"
Description: "StructureMap for transforming ehmiSBDBundle to ehmiSBDH format."

* url = "http://example.org/StructureMap/ehmiSBDBundleToSBDH"
* name = "ehmiSBDBundleToSBDH"
* status = #active
* usage = #definition // Specified usage to remove warning

// Setting group and inputs
* group[0].name = "BundleToSBDH"
* group[0].typeMode = #none
* group[0].input[0].name = "source"
* group[0].input[0].type = "Bundle"
* group[0].input[0].mode = #source
* group[0].input[1].name = "target"
* group[0].input[1].type = "SBDH"
* group[0].input[1].mode = #target

// Map Bundle.id to SBDH.DocumentIdentification.InstanceIdentifier
// Updated to use correct `source.context` and element
* group[0].rule[0].name = "mapId"
* group[0].rule[0].source[0].context = "source" // REQUIRED: Specify `source` context
* group[0].rule[0].source[0].element = "id"
* group[0].rule[0].target[0].context = "target"
* group[0].rule[0].target[0].element = "DocumentIdentification.InstanceIdentifier"

// Map Bundle.timestamp to SBDH.DocumentIdentification.CreationDateAndTime
* group[0].rule[1].name = "mapTimestamp"
* group[0].rule[1].source[0].context = "source" // REQUIRED: Specify `source` context
* group[0].rule[1].source[0].element = "timestamp"
* group[0].rule[1].target[0].context = "target"
* group[0].rule[1].target[0].element = "DocumentIdentification.CreationDateAndTime"

// Corrected sender mapping to use identifier.value directly
* group[0].rule[2].name = "mapSender"
* group[0].rule[2].source[0].context.value = "source.entry[0].resource.identifier[0]" // REQUIRED: Use identifier directly
* group[0].rule[2].source[0].element = "value"
* group[0].rule[2].target[0].context = "target"
* group[0].rule[2].target[0].element = "SenderIdentifier"

// Corrected receiver mapping to use identifier.value directly
* group[0].rule[3].name = "mapReceiver"
* group[0].rule[3].source[0].context.value = "source.entry[1].resource.identifier[0]" // REQUIRED: Use identifier directly
* group[0].rule[3].source[0].element = "value"
* group[0].rule[3].target[0].context = "target"
* group[0].rule[3].target[0].element = "ReceiverIdentifier"
*/