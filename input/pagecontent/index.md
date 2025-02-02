## EHMI Standard Business Document Header (ehmiSBDH)

### Introduction

The EHMI Standard Business Document Header (ehmiSBDH) is a customized version of the PEPPOL SBDH, which again is an extension of the original GS1 SBDH.

It is developed to serve as an envelope in message and document exchanges, the version for PEPPOL especially for wrapping the message/document and handling the metadata related to it in an eDelivery environment.

In relation to EHMI Core:
- suit the direct messaging of clinical content in EHMI through the eDelivery Network in EHMI Core
- handle reliable messaging at the eDelivery network level like VANSenvelope in the VANS network
- handle the XDS Metadata that is needed when MedCom Messages are exchanged as “documents” in the national Danish XDS Framework
- serve the ground for EHMI Statistics of message exchange

In relation to EHMI Delivery Status:
- serve the ground for EHMI Delivery Status

ehmiSBDH is in EHMI called ehmiSBDH due to constraints EHMI lay on the GS1- and PEPPOL-specifications, none of which is breaking to a validation against the original specification with the PEPPOL extensions

ehmiSBDH can therefore be send and delivered through the eDelivery Network in EHMI Core in all use cases, where ehmiSbdhserves the entire EHMI ecosystem.

### ehmiSBDH in relation to EHMI Core

ehmiSBDH wraps the bidirectional message with clinical content between the Message Service Handlers (MSH) and serve as a neutral container for whatever MedCom Message, that is being send. If it is a FHIR, OIOXml or Edifact message, ehmiSBDH can wrap it and due to extensive extraction of metadata from the message also serve the ground for 
- handling ehmiSBDH Acknowledgements
- handling of the secondary exchange of data through the national Danish XDS Framework

#### ehmiSBDH Acknowledgement

An ehmiSBDH Acknowledgement is basically just a ehmiSBDH wrapping the [ehmiSBDH EnvelopeReceipt](ehmiSBDHEnvelopeReceipt.html) like it would wrap any MedCom Message. The configuration of especially the BusinessScopes is a little different, but technically it is 

### ehmiSBDH in relation to EHMI Delivery Status:

- serve EDS with metadata in use cases where non-patient related messages are exchanged like in message acknowledgements and ehmiSBDH Acknowledgements
- serve EDS with metadata in use cases where patient related messages are exchanged like in the FHIR message HomeCareObservation and messages alike in OIOXml and Edifact. 

### ehmiSBDH xsd-schemas

<!-- br -->

All ehmiSBDH xsd-files can be found via the [download-page](downloads.html), but an overview of what they most importantly contain can be seen here:

(all files open in new window)
<!-- br -->

- <a href="ehmiSBDH_StandardBusinessDocumentHeader.xsd.html" target="_blank">ehmiSBDH StandardBusinessDocumentHeader Xsd</a>
- <a href="ehmiSBDH_Partner.xsd.html" target="_blank">ehmiSBDH Partner Xsd</a>
- <a href="ehmiSBDH_DocumentIdentification.xsd.html" target="_blank">ehmiSBDH DocumentIdentification Xsd</a>
- <a href="ehmiSBDH_BusinessScope.xsd.html" target="_blank">ehmiSBDH BusinessScope Xsd</a>
- <a href="ehmiSBDH_EDN-Business-Message-Envelope-1.2.xsd.html" target="_blank">ehmiSBDH BinaryContentType Xsd</a>
- <a href="ehmiSBDH_ebbp-signals-2.0.4.xsd.html" target="_blank">ehmiSBDH Ebbp-Signals 2.0.4 Xsd</a>

<!-- br -->

### Supporting work in progress

This specification of ehmiSBDH covers what is needed to understand and work with for EHMI Core and its stations of MSHs.
But there is still room for more service and it is planned to deliver more huidance on how to map from one format to another in the MSHs. 
FHIR StructureMappings delivers a useful tool to do that and as this IG lives over time more and more FHIR StructureMappings will find their way into this IG.
FHIR StructureMappings are not limited to handle resources of FHIR profiles, but can handle practically all kinds of formats.

#### Structure Mappings

For a number of different mappings to and from ehmiSBDH and/or MedCom Messaging Message, there will be developed a number of FHIR StructureMappings in order for the suppliers to better understand and potentially automate some tasks around mappings.

There has already been developed one in its initial phase, which is:

- **MedCom Messaging Message StructureMappings**
  - [Transformation specification of a MedcomMessagingMessage to an ehmiSBDH Envelope](StructureMap-MedComMessagingMessage2ehmiSbdh-transform.html)

The StructureMappings in the pipeline are:

- **Further MedCom Messaging Message StructureMappings**
  - Transformation of a MedcomMessagingMessage to a MedCom Messaging Ack
  - Transformation of a MedCom Messaging Ack to an ehmiSBDH Envelope
  - Transformation of a MedcomMessagingMessage and an ehmiSBDH Envelope to a MedCom DocumentReference

- **ehmiSBDH Envelope**
  - Transformation of an ehmiSBDH Envelope with a patient to an EHMI Delivery Status structure, edsPatientDeliveryStatus
  - Transformation of an ehmiSBDH Envelope without a patient to an EHMI Delivery Status structure, edsBasicDeliveryStatus
  - Transformation of a MedcomMessagingMessage and an ehmiSBDH Envelope to a MedCom DocumentReference

