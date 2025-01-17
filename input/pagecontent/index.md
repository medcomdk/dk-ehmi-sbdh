# EHMI Standard Business Document Header (ehmiSBDH)

## Introduction

The EHMI Standard Business Document Header (ehmiSBDH) is a customized version of the PEPPOL SBDH, which again is an esxtension of the original GS1 SBDH.

It is developed to serve as an envelope in message and document exchanges, the version for PEPPOL especially focused for wrapping the message/document and handling the metadata realted to it in an eDelivery environment.

In relation to EHMI Core:
- suit the direct messaging of clinical content in EHMI through the eDelivery Network in EHMI Core
- handle reliable messaging at the eDelivery network level like VANSenvelope in the VANS network
- handle the XDS Metadata that is needed when MedCom Messages are exchanged as “documents” in the national Danish XDS Framework
- serve the ground for EHMI Statistics of message exchange

In relation to EDS Delivery Status:
- serve the ground for EDS Delivery Status

ehmiSbdhis in EHMI called ehmiSbdhdue to constraints EHMI lay upon the GS1 and PEPPOL specifications, none of which is breaking to a validation through the original specification with the PEPPOL extensions

ehmiSbdhcan therefore be send and delivered through the eDelivery Network in EHMI Core in all use cases, where ehmiSbdhserves the entire EHMI ecosystem.

## ehmiSbdhin relation to EHMI Core

ehmiSbdhwraps the bidirectional message with clinical content between the Message Service Handlers (MSH) and serve as a neutral container for whatever MedCom Message, that is being send. If it is a FHIR, OIOXml or Edifact message, ehmiSbdhcan wrap it and due to extensive extraction of metadata from the message also serve the ground for 
- handling ehmiSbdhAcknowledgements
- handling of the secondary exchange of data through the national Danish XDS Framework

### ehmiSbdhAcknowledgements

## ehmiSbdhin relation to EDS Delivery Status:

- serve EDS with metadata in use cases where non-patient related messages are exchanged like in message acknowledgements and ehmiSbdhacknowledgements
- serve EDS with metadata in use cases where patient related messages are exchanged like in the FHIR message HomeCareObservation and messages alike in OIOXml and Edifact. 

## Structure Mappings

For a number of different mappings to and from ehmiSbdhand/or MedCom Messaging Message, there is developed a number of FHIR Structure Mappings in order for the suppliers to better understand and potentially automate some tasks around mappings.

These are:
- **MedCom Messaging Message**
  - [Transformation specification of a MedcomMessagingMessage to an ehmiSbdhEnvelope](MedComMessagingMessage2ehmiSbdh-transform.html)
  - [Transformation specification of a MedcomMessagingMessage to a MedCom Messaging Ack](StructureMap-MedComAcknowledgementMessage2ehmiSbdh-transform.html)
  - [Transformation specification of a MedCom Messaging Ack to an ehmiSbdhEnvelope](StructureMap-MedComAcknowledgementMessage2ehmiSbdh-transform.html)
  - [Transformation specification of a MedcomMessagingMessage and an ehmiSbdhEnvelope to a DocumentReference](StructureMap-MedComMessagingMessage2MedComDocumentReference-transform.html)

- **ehmiSbdhEnvelope**
  - [Transformation specification of an ehmiSbdhEnvelope with a patient to an EHMI Delivery Status structure](StructureMap-ehmiSbdh2edsPatientDeliveryStatus-transform.html)
  - [Transformation specification of an ehmiSbdhEnvelope without a patient to an EHMI Delivery Status structure](StructureMap-Sbdh2edsBasicDeliveryStatus-transform.html)
  
