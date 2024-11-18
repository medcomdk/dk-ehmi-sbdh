/*
Instance: Sbdh2EhmiDeliveryStatus-transform
InstanceOf: StructureMap
Usage: #definition
* url = "http://hl7.org/fhir/StructureMap/Sbdh2EhmiDeliveryStatus-transform"
* name = "Transform from a FHIR Messsage to an ehmiSBDH Envelope"
* title = "Transformation specification of a FHIR Messsage to an ehmiSBDH Envelope"
* status = #draft
* description = "Transform from a FHIR Messsage to an ehmiSBDH Envelope"
* structure[+].url = "http://medcomehmi.dk/ig/ehmi-sbdh/StructureDefinition/EhmiStandardBusinessDocumentBundle"
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
* group[+].name = "Sender"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "MedComMessagingOrganization"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "SbdhSender"
* group[=].input[=].mode = #target
* group[=].rule[0].name = "Identifier.value"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingOrganization[Sender]/identifier[EAN-ID]/value"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "SbdhSender/identifier/value"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "Identifier.Authority"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "SbdhSender/identifier@Authority"
* group[=].rule[=].target.transform = #create
* group[+].name = "Receiver"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "MedComMessagingOrganization"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "SbdhReceiver"
* group[=].input[=].mode = #target
* group[=].rule[+].name = "Identifier.value"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingOrganization[Receiver]/identifier[EAN-ID]/value"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "SbdhReceiver/identifier/value"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "Identifier.Authority"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #iso6523-actorid-upis
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "SbdhReceiver/identifier@Authority"
* group[=].rule[=].target.transform = #create
//DocumentIdentification
* group[+].name = "DocumentIdentification"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "MedComMessagingHeader"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "sbdhDocumentIdentification"
* group[=].input[=].mode = #target
* group[=].rule[+].name = "Standard"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingHeader/definition[pre|]"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Standard/value"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "TypeVersion"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingHeader/definition[post|]"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "TypeVersion/value"
* group[=].rule[=].target.transform = #copy
* group[=].rule[+].name = "InstanceIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "2be1a947-8ebd-496f-ac1a-7eef6b2cfe18"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.id = "InstanceIdentifier/value"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "Type"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #Bundle
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "Type/value"
* group[=].rule[=].target.transform = #create
* group[=].rule[+].name = "CreationDateAndTime"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "MedComMessagingProvenance/recorded"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "CreationDateAndTime/value"
* group[=].rule[=].target.transform = #copy
//BusinessScopes
//BusinessScopeEdeliveryMessageCommunication
* group[+].name = "BusinessScopeEdeliveryMessageCommunication"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "MedComMessagingMessage"
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
* group[=].rule[=].source.element = "MedComMessagingHeader/id"
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
* group[=].input[=].type = "MedComMessagingMessage"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry.resource.ofType(Patient).identifier)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry.resource.ofType(SenderOrganization).identifier[SOR-ID].value)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry.resource.ofType(ReceiverOrganization).identifier[SOR-ID].value)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.entry[0].resource.id)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
* group[=].input[=].type = "MedComMessagingMessage"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
* group[=].input[=].type = "MedComMessagingMessage"
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
* group[=].rule[=].source.element = "MedComMessagingMessage(Bundle.id)"
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
/*

//Group: Reliable messaging
ReceiptAcknowledgement- - Request
//CorrelationInformation 
CorrelationInformation - RequestingDocumentCreationDateTime
CorrelationInformation - RequestingDocumentInstanceIdentifier
CorrelationInformation - ExpectedResponseDateTime
//SBDH BusinessServices - Request
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
//SBDH BusinessServices - Response
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