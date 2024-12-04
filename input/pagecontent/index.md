# EHMI Standard Business Document Header

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

SBDH is in EHMI called ehmiSBDH due to constraints EHMI lay upon the GS1 and PEPPOL specifications, none of which is breaking to a validation through the original specification with the PEPPOL extensions

ehmiSBDH can therefore be send and delivered through the eDelivery Network in EHMI Core in all use cases, where ehmiSBDH serves the entire EHMI ecosystem.

## ehmiSBDH in relation to EHMI Core

ehmiSBDH wraps the bidirectional message with clinical content between the Message Service Handlers (MSH) and serve as a neutral container for whatever MedCom Message, that is being send. If it is a FHIR, OIOXml or Edifact message, SBDH can wrap it and due to extensive extraction of metadata from the message also serve the ground for 
- handling ehmiSBDH Acknowledgements
- handling of the secondary exchange of data through the national Danish XDS Framework

## ehmiSBDH in relation to EDS Delivery Status:

- serve EDS with metadata in use cases where non-patient related messages are exchanged like in message acknowledgements and SBDH acknowledgements
- serve EDS with metadata in use cases where patient related messages are exchanged like in the FHIR message HomeCareObservation and messages alike in OIOXml and Edifact. 
