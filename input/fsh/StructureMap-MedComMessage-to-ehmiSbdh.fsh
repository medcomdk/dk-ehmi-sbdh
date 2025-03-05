Instance: MedComMessagingMessage2ehmiSbdh-transform
InstanceOf: StructureMap
Title: "Transform a MedcomMessagingMessage to an ehmiSBDH-Envelope "
Description: "Transformation specification of a MedcomMessagingMessage to an ehmiSBDH-Envelope. This specification is 
not complete but aims at indicating how a transformation from a MedCom FHIR format to the ehmiSBDH Envelope can be done"
Usage: #definition
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedcomMessagingMessage2Sbdh-transform"
* name = "MedcomMessagingMessage2SbdhTransform"
* title = "Transformation specification of a MedcomMessagingMessage to an ehmiSBDH-Envelope "
* status = #draft
* description = "Transform from a MedCom Messaging Messsage to an ehmiSBDH-Envelope"
* structure[0].url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-message"
* structure[=].mode = #source
//* structure[+].url = "https://medcomehmi.dk/ig/dk-ehmi-sbdh/ehmiSBDH/StandardBusinessDocumentHeader.xsd"
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/ehmiSBDH/StandardBusinessDocumentHeader.xsd"
* structure[=].mode = #target


* group[0].name = "HeaderVersion"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "StandardBusinessDocumentHeader"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "HeaderVersion"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.variable = "HeaderVersion" 
* group[=].rule[=].source.defaultValueString = "1.0"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/HeaderVersion"
* group[=].rule[=].target.transform = #create


* group[+].name = "SbdhSender"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Organization"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "Sender"
* group[=].input[=].mode = #target
* group[=].rule[0].name = "SbdhSenderIdentifierValue"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "[Bundle.entry[0].resource.sender.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value]"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/Sender/identifier"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "SbdhSenderIdentifierAuthority"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.variable = "SbdhSenderIdentifierAuthority"
* group[=].rule[=].source.defaultValueString = "iso6523-actorid-upis" 
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/Sender/identifier@Authority"
* group[=].rule[=].target.transform = #create

* group[+].name = "SbdhReceiver"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Organization"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "Receiver"
* group[=].input[=].mode = #target
* group[=].rule[+].name = "SbdhIdentifierValue"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "[Bundle.entry[0].resource.destination.receiver.reference.resolve().identifier.where(system = 'https://www.gs1.org/gln').value]"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/Receiver/identifier"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "SbdhReceiverIdentifierAuthority"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.variable = "IdentifierAuthority"
* group[=].rule[=].source.defaultValueString = "iso6523-actorid-upis"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/Receiver/identifier@Authority"
* group[=].rule[=].target.transform = #create

//DocumentIdentification
* group[+].name = "SbdhDocumentIdentification"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "MessageHeader"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentIdentification"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "SbdhDocumentIdentificationStandard"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MessageHeader.definition[pre|]"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/DocumentIdentification/Standard"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "SbdhDocumentIdentificationTypeVersion"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MessageHeader.definition[post|]"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/DocumentIdentification/TypeVersion"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "SbdhDocumentIdentificationInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.variable = "SbdhEnvelopeIdentifier"
* group[=].rule[=].source.variable.value = "generateUuid()"
//* group[=].rule[=].source.defaultValueString = "2be1a947-8ebd-496f-ac1a-7eef6b2cfe18"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.id = "StandardBusinessDocumentHeader/DocumentIdentification/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy //RUN: info: Der er en "transform = #uuid" der genrerer et random UUID

* group[=].rule[+].name = "SbdhDocumentIdentificationType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.variable = "SbdhDocumentIdentificationType"
//* group[=].rule[=].source.variable.value = "Bundle"
* group[=].rule[=].source.defaultValueCode = #Bundle
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/DocumentIdentification/Type"
* group[=].rule[=].target.transform = #copy

//DocumentIdentification
* group[+].name = "SbdhDocumentIdentificationCreationDateAndTime"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Provenance"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "DocumentIdentification"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "SbdhDocumentIdentificationCreationDateAndTime"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Provenance.recorded"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "StandardBusinessDocumentHeader/DocumentIdentification/CreationDateAndTime"
* group[=].rule[=].target.transform = #copy

//BusinessScopes
//BusinessScopeEdeliveryMessageCommunication
* group[+].name = "BusinessScopeEdeliveryMessageCommunication"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "sbdhBusinessScope"
* group[=].input[=].mode = #target
// DOCUMENTID
* group[=].rule[+].name = "ScopeDocumentType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "DOCUMENTID"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[DOCUMENTID]/Type"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "ScopeDocumentInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[DOCUMENTID]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeDocumentIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[DOCUMENTID]/Identifier"
* group[=].rule[=].target.transform = #create
// PROCESSID
* group[=].rule[+].name = "ScopeProcessIdType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "PROCESSID"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[PROCESSID]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeProcessIdInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "sdn-emergence"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[PROCESSID]/InstanceIdentifier"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeProcessIdIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[PROCESSID]/Identifier"
* group[=].rule[=].target.transform = #create
//BusinessScope - Health message communication
* group[+].name = "BusinessScopeHealthMessageCommunication"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "sbdhBusinessScope"
* group[=].input[=].mode = #target
//PATIENTID 
* group[=].rule[+].name = "ScopePatientIdType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "PATIENTID"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[PATIENTID]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopePatientIdInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry.resource.ofType(Patient).identifier"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[PATIENTID]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopePatientIdIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[PATIENTID]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - SENDERID
* group[=].rule[+].name = "ScopeSenderIdType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "SENDERID"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[SENDERID]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeSenderIdInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry.resource.ofType(SenderOrganization).identifier[SOR-ID].value"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[SENDERID]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeSenderIdIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[SENDERID]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - RECEIVERID
* group[=].rule[+].name = "ScopeReceiverIdType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "RECEIVERID"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[RECEIVERID]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeReceiverIdInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry.resource.ofType(ReceiverOrganization).identifier[SOR-ID].value"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[RECEIVERID]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeReceiverIdIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[RECEIVERID]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - MESSAGEIDENTIFIER
* group[=].rule[+].name = "ScopeMessageIdentiferType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "MESSAGEIDENTIFIER"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[MESSAGEIDENTIFIER]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeMessageIdentiferInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry[0].resource.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[MESSAGEIDENTIFIER]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeMessageIdentiferIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[MESSAGEIDENTIFIER]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - MESSAGEENVELOPEIDENTIFIER
* group[=].rule[+].name = "ScopeMessageEnvelopeIdentiferType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "MESSAGEENVELOPEIDENTIFIER"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[MESSAGEENVELOPEIDENTIFIER]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeMessageEnvelopeIdentiferInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[MESSAGEENVELOPEIDENTIFIER]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeMessageEnvelopeIdentiferIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[MESSAGEENVELOPEIDENTIFIER]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - ORIGINALMESSAGEIDENTIFIER
* group[=].rule[+].name = "ScopeOriginalMessageIdentiferType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "ORIGINALMESSAGEIDENTIFIER"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGEIDENTIFIER]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeOriginalMessageIdentiferInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGEIDENTIFIER]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeOriginalMessageIdentiferIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGEIDENTIFIER]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - ORIGINALENVELOPEIDENTIFIER
* group[=].rule[+].name = "ScopeOriginalEnvelopeIdentiferType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "ORIGINALENVELOPEIDENTIFIER"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALENVELOPEIDENTIFIER]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeOriginalEnvelopeIdentiferInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALENVELOPEIDENTIFIER]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeOriginalEnvelopeIdentiferIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALENVELOPEIDENTIFIER]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - ORIGINALMESSAGESTANDARD
* group[=].rule[+].name = "ScopeOriginalMessageStandardType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "ORIGINALMESSAGESTANDARD"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGESTANDARD]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeOriginalMessageStandardInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGESTANDARD]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeOriginalMessageStandardIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGESTANDARD]/Identifier"
* group[=].rule[=].target.transform = #create
// Health message communication - ORIGINALMESSAGEVERSION
* group[=].rule[+].name = "ScopeOriginalMessageVersionType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "ORIGINALMESSAGEVERSION"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGEVERSION]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeOriginalMessageVersionInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGEVERSION]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeOriginalMessageVersionIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ORIGINALMESSAGEVERSION]/Identifier"
* group[=].rule[=].target.transform = #create
//BusinessScope - XDS-METADATA 
* group[+].name = "BusinessScopeXdsMetadata"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "sbdhBusinessScope"
* group[=].input[=].mode = #target
* group[=].rule[+].name = "ScopeXdsMetadataType"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "XDS-METADATA"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[XDS-METADATA]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeXdsMetadataInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[XDS-METADATA]/InstanceIdentifier"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "ScopeXdsMetadataIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[XDS-METADATA]/Identifier"
* group[=].rule[=].target.transform = #create
//Group: Reliable messaging
* group[+].name = "BusinessScopeSbdhReliableMessaging"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "sbdhBusinessScopeReliableMessaging"
* group[=].input[=].mode = #target
//* group[=].rule[+].name = "ScopeReceiptAcknowledgement"
* group[=].rule[+].name = "ScopeReceiptAcknowledgement"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "EHMI-ReceiptAcknowledgement"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ReceiptAcknowledgement]/Type"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeReceiptAcknowledgementInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "Request"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ReceiptAcknowledgement]/InstanceIdentifier"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "ScopeReceiptAcknowledgementIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "dk-medcom-messaging"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Scope[ReceiptAcknowledgement]/Identifier"
* group[=].rule[=].target.transform = #create
// CorrelationInformation - RequestingDocumentCreationDateTime
* group[=].rule[+].name = "CorrelationInformationRequestingDocumentCreationDateTime"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "RequestingDocumentCreationDateTime"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "CorrelationInformation/RequestingDocumentCreationDateTime"
* group[=].rule[=].target.transform = #create
// CorrelationInformation - RequestingDocumentInstanceIdentifier
* group[=].rule[+].name = "CorrelationInformationRequestingDocumentInstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "RequestingDocumentInstanceIdentifier"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "CorrelationInformation/RequestingDocumentInstanceIdentifier"
* group[=].rule[=].target.transform = #create
// CorrelationInformation - ExpectedResponseDateTime
* group[=].rule[+].name = "CorrelationInformationExpectedResponseDateTime"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "ExpectedResponseDateTime"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "CorrelationInformation/ExpectedResponseDateTime"
* group[=].rule[=].target.transform = #create

//Group: BusinessServices - Request
* group[+].name = "BusinessServicesRequest"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "sbdhBusinessScopeBusinessServices"
* group[=].input[=].mode = #target
// BusinessService - ReceiptAcknowledgement Request
* group[=].rule[+].name = "BusinessServiceReceiptAcknowledgementRequest"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "EHMI-ReceiptAcknowledgement-Request"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceName"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - TypeOfServiceTransaction
* group[=].rule[+].name = "ServiceTransactionTypeOfServiceTransaction"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "RequestingServiceTransaction"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/TypeOfServiceTransaction"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - IsNonRepudiationRequired
* group[=].rule[+].name = "ServiceTransactionIsNonRepudiationRequired"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "false"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/IsNonRepudiationRequired"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - IsAuthenticationRequired
* group[=].rule[+].name = "ServiceTransactionIsAuthenticationRequired"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "false"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/IsAuthenticationRequired"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - IsNonRepudiationOfReceiptRequired
* group[=].rule[+].name = "ServiceTransactionIsNonRepudiationOfReceiptRequired"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "false"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/IsNonRepudiationOfReceiptRequired"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - IsIntelligibleCheckRequired
* group[=].rule[+].name = "ServiceTransactionIsIntelligibleCheckRequired"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "false"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/IsIntelligibleCheckRequired"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - IsApplicationErrorResponseRequested
* group[=].rule[+].name = "ServiceTransactionIsApplicationErrorResponseRequested"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "false"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/IsApplicationErrorResponseRequested"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - TimeToAcknowledgeReceipt
* group[=].rule[+].name = "ServiceTransactionTimeToAcknowledgeReceipt"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "300000"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/TimeToAcknowledgeReceipt"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - TimeToAcknowledgeAcceptance
* group[=].rule[+].name = "ServiceTransactionTimeToAcknowledgeAcceptance"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "0"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/TimeToAcknowledgeAcceptance"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - TimeToPerform
* group[=].rule[+].name = "ServiceTransactionTimeToPerform"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "0"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/TimeToPerform"
* group[=].rule[=].target.transform = #create
// BusinessService - ServiceTransaction - Recurrence
* group[=].rule[+].name = "ServiceTransactionRecurrence"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "0"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "BusinessService/ServiceTransaction/Recurrence"
* group[=].rule[=].target.transform = #create

/*
//ehmiSbdhBusinessServices - Request
BusinessServiceName
ServiceTransaction – TypeOfServiceTransaction
IsNonRepudiationRequired
IsAuthenticationRequired
IsNonRepudiationOfReceiptRequired
IsIntelligibleCheckRequired
IsApplicationErrorResponseRequested
TimeToAcknowledgeReceipt
TimeToAcknowledgeAcceptance
TimeToPerform
Recurrence

//Group: EHMI-ReceiptAcknowledgement - Response
//CorrelationInformation 
CorrelationInformation - RequestingDocumentCreationDateTime
CorrelationInformation - RequestingDocumentInstanceIdentifier
CorrelationInformation - ExpectedResponseDateTime
//ehmiSbdhBusinessServices - Response
BusinessServiceName
ServiceTransaction – TypeOfServiceTransaction
IsNonRepudiationRequired
IsAuthenticationRequired
IsNonRepudiationOfReceiptRequired
IsIntelligibleCheckRequired
IsApplicationErrorResponseRequested
TimeToAcknowledgeReceipt
TimeToAcknowledgeAcceptance
TimeToPerform
Recurrence

//Group: EHMI ReceiptAcknowledgement

/* group[=].rule[+].name = "Identifier.Authority"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "SbdhReceiver/identifier@Authority"
* group[=].rule[=].target.transform = #create
*/


/* group[=].rule[+].name = "category"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "category"
* group[=].rule[=].target.transform = #evaluate
* group[=].rule[=].target.parameter.valueString = "'non-stock'"
*/

/*
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
* group[=].name = "main"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "ActivityDefinition"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "SupplyRequest"
* group[=].input[=].mode = #target
* group[=].rule[0].name = "status"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "status"
* group[=].rule[=].target.transform = #evaluate
* group[=].rule[=].target.parameter.valueString = "'draft'"
* group[=].rule[+].name = "category"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "category"
* group[=].rule[=].target.transform = #evaluate
* group[=].rule[=].target.parameter.valueString = "'non-stock'"
* group[=].rule[+].name = "priority"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "priority"
* group[=].rule[=].target.transform = #evaluate
* group[=].rule[=].target.parameter.valueString = "'routine'"
* group[=].rule[+].name = "quantity"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "quantity"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "category"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "item"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "code"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "orderedItem.itemCodeableConcept"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "when"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "occurrenceDateTime"
* group[=].rule[=].target.transform = #evaluate
* group[=].rule[=].target.parameter.valueString = "now()"
* group[=].rule[+].name = "authoredOn"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "id"
* group[=].rule[=].source.variable = "a"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "authoredOn"
* group[=].rule[=].target.transform = #evaluate
* group[=].rule[=].target.parameter.valueString = "now()"
*/