# Reliable Messaging using ehmiSBDH Envelope

Reliable Messaging in ehmiSBDH Envelope follows the principles laid out in <a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/documents/020_Governance-for-Reliable-Messaging-in-general.html" target="_blank">Reliable Messaging in general</a>

The Reliable Messaging Model and how the flow is laid out using ehmiSBDH Envelope is shown in <a href="#Fig1">Figure 1</a>

In EHMI Reliable Messaging **SHALL** be *"turned on"* by adding the Scope structure pointed out by the Scope-Type element: ehmiSBDH Envelope/StandardBusinessDocumentHeader/BusinessScope/Scope/Type[EHMI-ReceiptAcknowledgement] and the Scope-InstanceIdentifier: ehmiSBDH Envelope/StandardBusinessDocumentHeader/BusinessScope/Scope/InstanceIdentifier[Request]

This is defined as the default mode of Reliable Messaging in EHMI.

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="reliable-messaging-ehmiSBDHEnvelope.png" target="_blank"> <img src="reliable-messaging-ehmiSBDHEnvelope.png" alt="reliable messaging principle" style="width:90%; height:auto; margin-left:0%; margin-right:10%; margin-top:5px; margin-bottom:5px;" id="Fig1"></a>
<figcaption text-align="left"><b>Figure 1: Reliable Messaging - ehmiSBDH Envelope </b></figcaption>
</figure>

When Reliable Messaging is implemented, the Receiver **SHALL** check the incoming StandardBusinessDocumentHeader/DocumentInformation/Identifier (hereafter EnvelopeIdentifier) and the StandardBusinessDocumentHeader/BusinessScope/Scope[Type:DOCUMENTID]/InstanceIdentifier (hereafter MessageIdentifier) against a cache of previously received ehmiSBDH Envelopes. The correct action to take depends on what is received:

| Case                                                            | Description                |
|:----------------------------------------------------------------|:---------------------------|
| Both EnvelopeIdentifier and MessageIdentifier have not been received       | This is the normal case, and the message **SHALL** be processed            |
| Both EnvelopeIdentifier and MessageIdentifier have already been received   | The original ehmiSBDH Envelope server may either reprocess the message, or reject the message|
| MessageIdentifier has already been received, but EnvelopeIdentifier is new | The original ehmiSBDH-EnvelopeReceipt has been lost (failed to return to the request issuer) and thus the previously received Message in An ehmiSBDH Envelope has been resubmitted with a new EnvelopeIdentifier for processing again. The original ehmiSBDH-EnvelopeReceipt **SHALL** be resent|
| The EnvelopeIdentifier has already been received, but the MessageIdentifier is new | This is an error - EnvelopeIdentifier values **SHALL** never be reused. Receiver **MAY** return a Negative ehmiSBDH-EnvelopeReceipt|

## Different Reliable Messaging scenarios using ehmiSBDH Envelope

This section provides a description of the different types of Reliable Messaging scenarios.

- Scenario #1 - Normally successful unsolicited  ehmiSBDH Envelope or request message flow with ehmiSBDH-EnvelopeReceipt request
- Scenario #2 - Duplicate of an unchanged ehmiSBDH Envelope with a positive ehmiSBDH-EnvelopeReceipt request
- Scenario #3 - (Re-)Sending Unchanged ehmiSBDH Envelope
- Scenario #4 - ehmiSBDH Envelope is sent normally, ehmiSBDH-EnvelopeReceipt is lost along the way
- Scenario #5 - (Re-)Sending Modified ehmiSBDH Envelope

### Scenario #1 - Normally successful unsolicited ehmiSBDH Envelope or request ehmiSBDH Envelope flow with ehmiSBDH-EnvelopeReceipt request 

An unsolicited  ehmiSBDH Envelope is sent with a new request for a positive ehmiSBDH-EnvelopeReceipt from the Sending MSH to a Receiving MSH.

The Receiving MSH **SHALL** always send a positive ehmiSBDH-EnvelopeReceipt to the Sending MSH.

### Scenario #2 - Duplicate of an unchanged ehmiSBDH Envelope with a positive ehmiSBDH-EnvelopeReceipt request 

Duplication of an unchanged ehmiSBDH Envelope can be done in one of the following ways:

- An error may have occurred in the flow from the Sending MSH to the Receiving MSH with subsequent duplication of An ehmiSBDH Envelope in scenario 1a.
- The Sending MSH may inadvertently send a duplicate of ehmiSBDH Envelope

The ehmiSBDH Envelopes are completely identical and as a consequence, the ehmiSBDH Envelope with request for positive ehmiSBDH-EnvelopeReceipt arrives at the Receiving MSH more than once.

The Receiving MSH **SHALL** ignore the contents of the duplicate instances of the ehmiSBDH Envelope but **SHALL** acknowledge a duplicate ehmiSBDH Envelope in the same way as the original ehmiSBDH Envelope.

A positive ehmiSBDH-EnvelopeReceipt may not be sent first and then a negative ehmiSBDH-EnvelopeReceipt or vice versa.

The Receiving MSH **SHALL** never display several instances of An ehmiSBDH Envelope in An ehmiSBDH Envelope overview, but **SHALL** log in a system log that reception of a duplicate ehmiSBDH Envelope has taken place.

If the Sending MSH of the ehmiSBDH Envelope has received ehmiSBDH-EnvelopeReceipt already after the Receiving MSH's ehmiSBDH-EnvelopeReceipt of An ehmiSBDH Envelope's first instance, the Sending MSH **SHALL** similarly ignore the duplicate instances of the ehmiSBDH-EnvelopeReceipt.

The Sending MSH **SHALL** never display multiple instances of the same ehmiSBDH-EnvelopeReceipt in An ehmiSBDH Envelope summary but **SHALL** log in a system log that ehmiSBDH-EnvelopeReceipt of a duplicate has taken place.

### Scenario #3 - (Re) Sending Unchanged ehmiSBDH Envelope 

Correct retransmission of message A.

The Sending MSH **SHALL** form a new ehmiSBDH Envelope with a new ID and time of dispatch.

Since there has been no change in the Message content section, the rest of the ehmiSBDH Envelope **SHALL** remain identical.

The ehmiSBDH Envelope **SHALL** be sent and ehmiSBDH Envelope-Acknowledged as a completely new ehmiSBDH Envelope according to Scenario #1 or # 1b.

Re-dispatches **SHALL** always be done manually and **SHOULD** be in accordance with the normal response time for the specific ehmiSBDH Envelope flow.

### Scenario #4 - ehmiSBDH Envelope is sent normally, but ehmiSBDH-EnvelopeReceipt is lost along the way 

Like in Scenario #1, but where ehmiSBDH-EnvelopeReceipt is lost along the way from the Sending MSH to the Receiving MSH.

The shipping pattern is like Scenario #3.

### Scenario #5 - (Re-) Sending Modified Message 

If the content of the Message content part is changed, the ehmiSBDH Envelope is considered a completely new ehmiSBDH Envelope and consequently change of both EnvelopeIdentifier, MessageIdentifier and timestamp **SHALL** be made if relevant.

Resubmissions **SHALL** always be done manually.

## ehmiSBDH Envelope Reliable Messaging Elements

### ehmiSBDH Envelope Reliable Messaging Message Elements

<!-- An ehmiSBDH Envelope consists of the following elements (see <!--a href="#Fig2"Figure 2</a>):-->

<!--figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="ehmiSBDH Envelope_schema-reliable.png" target="_blank"> <img src="ehmiSBDH Envelope_schema-reliable.png" alt="ehmiSBDH Envelope_schema-reliable" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig2"></a>
<figcaption text-align="left"><b>Figure 2: Reliable Messaging - reliable ehmiSBDH Envelope tables </b></figcaption>
</figure-->


An ehmiSBDH Envelope's Reliable Messaging part can be found in the ehmiSBDH Envelope/-element, which is shown in [ehmiSBDH Envelope's Reliable Messaging part](ehmiSBDH.html#reliable-messaging) <!--a href="#Fig3"Figure 3</a>:-->

<!--figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="ehmiSBDH Envelope_schema-reliable-type.png" target="_blank"> <img src="ehmiSBDH Envelope_schema-reliable-type.png" alt="ehmiSBDH Envelope_schema-reliable" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig3"></a>
<figcaption text-align="left"><b>Figure 3: Reliable Messaging - reliable ehmiSBDH Envelope type </b></figcaption>
</figure-->


Reliable Messaging in ehmiSBDH Envelope **SHALL** be the default mode but can explicitly be "turned off" by leaving out the Scope-element pointed out by the Scope-Type: ehmiSBDH Envelope/StandardBusinessDocumentHeader/BusinessScope/Scope/Type[EHMI-ReceiptAcknowledgement] and the Scope-InstanceIdentifier: ehmiSBDH Envelope/StandardBusinessDocumentHeader/BusinessScope/Scope/InstanceIdentifier[Request]

In EHMI Messaging, these elements **SHALL** be present together with the underlying structure-parts.

### ehmiSBDH Envelope ehmiSBDH-EnvelopeReceipt Reliable Messaging Elements

When "reliable", the receiver of the ehmiSBDH Envelope **SHALL** send An ehmiSBDH-EnvelopeReceipt return to the original Sender.

An ehmiSBDH-EnvelopeReceipt consists of the following elements <!--(see a href="#Fig4"Figure 4</a>):-->

<!--figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="ehmiSBDH Envelope_schema-acknowledgement.png" target="_blank"> <img src="ehmiSBDH Envelope_schema-acknowledgement.png" alt="ehmiSBDH Envelope_schema-acknowledgement" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig4"></a>
<figcaption text-align="left"><b>Figure 4: Reliable Messaging - reliable ehmiSBDH Envelope acknowledgement </b></figcaption>
</figure-->


## Links for Reliable Messaging|
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/documents/FHIRMessages_NetworkEnvelopes_EN.html" target="_blank">MedComs desciption of Reliable Messaging in general in MedComs FHIR governance</a>

