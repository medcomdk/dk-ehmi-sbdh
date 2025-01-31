## EHMI Standard Business Document Header (ehmiSBDH)

### Introduction

The EHMI Standard Business Document Header (ehmiSBDH) is a customized version of the PEPPOL SBDH, which again is an extension of the original GS1 SBDH.

It is developed to serve as an envelope in message and document exchanges, the version for PEPPOL especially focused for wrapping the message/document and handling the metadata realted to it in an eDelivery environment.

In relation to EHMI Core:
- suit the direct messaging of clinical content in EHMI through the eDelivery Network in EHMI Core
- handle reliable messaging at the eDelivery network level like VANSenvelope in the VANS network
- handle the XDS Metadata that is needed when MedCom Messages are exchanged as “documents” in the national Danish XDS Framework
- serve the ground for EHMI Statistics of message exchange

In relation to EDS Delivery Status:
- serve the ground for EDS Delivery Status

ehmiSBDH is in EHMI called ehmiSbdh due to constraints EHMI lay upon the GS1 and PEPPOL specifications, none of which is breaking to a validation through the original specification with the PEPPOL extensions

ehmiSBDH can therefore be send and delivered through the eDelivery Network in EHMI Core in all use cases, where ehmiSbdhserves the entire EHMI ecosystem.

### ehmiSBDH in relation to EHMI Core

ehmiSBDH wraps the bidirectional message with clinical content between the Message Service Handlers (MSH) and serve as a neutral container for whatever MedCom Message, that is being send. If it is a FHIR, OIOXml or Edifact message, ehmiSBDH can wrap it and due to extensive extraction of metadata from the message also serve the ground for 
- handling ehmiSBDH Acknowledgements
- handling of the secondary exchange of data through the national Danish XDS Framework

#### ehmiSBDH Acknowledgements

### ehmiSBDH in relation to EDS Delivery Status:

- serve EDS with metadata in use cases where non-patient related messages are exchanged like in message acknowledgements and ehmiSBDH Acknowledgements
- serve EDS with metadata in use cases where patient related messages are exchanged like in the FHIR message HomeCareObservation and messages alike in OIOXml and Edifact. 

### ehmiSbdh xsd-schemas

<!-- br -->

All ehmiSbdh xsd-files can be found via the [download-page](downloads.html), but an overview of what they most importantly contain can be seen here:

(all files open in new window)
<!-- br -->

- <a href="ehmiSBDH_StandardBusinessDocumentHeader.xsd.html" target="_blank">ehmiSBDH StandardBusinessDocumentHeader Xsd</a>
- <a href="ehmiSBDH_Partner.xsd.html" target="_blank">ehmiSBDH Partner Xsd</a>
- <a href="ehmiSBDH_DocumentIdentification.xsd.html" target="_blank">ehmiSBDH DocumentIdentification Xsd</a>
- <a href="ehmiSBDH_BusinessScope.xsd.html" target="_blank">ehmiSBDH BusinessScope Xsd</a>
- <a href="ehmiSBDH_EDN-Business-Message-Envelope-1.2.xsd.html" target="_blank">ehmiSBDH BinaryContentType Xsd</a>
- <a href="ehmiSBDH_ebbp-signals-2.0.4.xsd.html" target="_blank">ehmiSBDH Ebbp-Signals 2.0.4 Xsd</a>

<!-- br -->

### Structure Mappings

For a number of different mappings to and from ehmiSbdh and/or MedCom Messaging Message, there is developed a number of FHIR Structure Mappings in order for the suppliers to better understand and potentially automate some tasks around mappings.

These are:
- **MedCom Messaging Message**
  - [Transformation specification of a MedcomMessagingMessage to an ehmiSbdhEnvelope](MedComMessagingMessage2ehmiSbdh-transform.html)
  - [Transformation specification of a MedcomMessagingMessage to a MedCom Messaging Ack](StructureMap-MedComAcknowledgementMessage2ehmiSbdh-transform.html)
  - [Transformation specification of a MedCom Messaging Ack to an ehmiSbdhEnvelope](StructureMap-MedComAcknowledgementMessage2ehmiSbdh-transform.html)
  - [Transformation specification of a MedcomMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference](StructureMap-MedComMessagingMessage2MedComDocumentReference-transform.html)

- **ehmiSbdhEnvelope**
  - [Transformation specification of an ehmiSbdhEnvelope with a patient to an EHMI Delivery Status structure](StructureMap-ehmiSbdh2edsPatientDeliveryStatus-transform.html)
  - [Transformation specification of an ehmiSbdhEnvelope without a patient to an EHMI Delivery Status structure](StructureMap-Sbdh2edsBasicDeliveryStatus-transform.html)
  
