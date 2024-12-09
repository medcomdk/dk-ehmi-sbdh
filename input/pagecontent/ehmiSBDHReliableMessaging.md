# Reliable Messaging using ehmiSBDHEnvelope

Reliable Messaging in ehmiSBDHEnvelope follows the principles laid out in <a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/documents/020_Governance-for-Reliable-Messaging-in-general.html" target="_blank">Reliable Messaging in general</a>

The Reliable Messaging Model and how the flow is laid out using ehmiSBDHEnvelope is shown in <a href="#Fig1">Figure 1</a>

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="reliable-messaging-ehmiSBDHEnvelope.png" target="_blank"> <img src="reliable-messaging-ehmiSBDHEnvelope.png" alt="reliable messaging principle" style="width:90%; height:auto; margin-left:0%; margin-right:10%; margin-top:5px; margin-bottom:5px;" id="Fig1"></a>
<figcaption text-align="left"><b>Figure 1: Reliable Messaging - ehmiSBDHEnvelope </b></figcaption>
</figure>
<br>

In EHMI Reliable Messaging **SHALL** be *"turned on"* by adding the Scope structure pointed out by the Scope-Type element: ehmiSBDHEnvelope/StandardBusinessDocumentHeader/BusinessScope/Scope/Type[EHMI-ReceiptAcknowledgement] and the Scope-InstanceIdentifier: ehmiSBDHEnvelope/StandardBusinessDocumentHeader/BusinessScope/Scope/InstanceIdentifier[Request]

This is defined as the default mode of Reliable Messaging in EHMI.

When Reliable Messaging is implemented, the Receiver **SHALL** check the incoming StandardBusinessDocumentHeader/DocumentInformation/Identifier (hereafter EnvelopeIdentifier) and the StandardBusinessDocumentHeader/BusinessScope/Scope[Type:DOCUMENTID]/InstanceIdentifier (hereafter MessageIdentifier) against a cache of previously received ehmiSBDHEnvelopes. The correct action to take depends on what is received:

| Case                                                            | Description                |
|:----------------------------------------------------------------|:---------------------------|
| Both EnvelopeIdentifier and MessageIdentifier have not been received       | This is the normal case, and the message **SHALL** be processed            |
| Both EnvelopeIdentifier and MessageIdentifier have already been received   | The original ehmiSBDHEnvelope server may either reprocess the message, or reject the message|
| MessageIdentifier has already been received, but EnvelopeIdentifier is new | The original ehmiSBDHEnvelopeReceipt has been lost (failed to return to the request issuer) and thus the previously received Message in An ehmiSBDHEnvelope has been resubmitted with a new EnvelopeIdentifier for processing again. The original ehmiSBDHEnvelopeReceipt **SHALL** be resent|
| The EnvelopeIdentifier has already been received, but the MessageIdentifier is new | This is an error - EnvelopeIdentifier values **SHALL** never be reused. Receiver **MAY** return a Negative ehmiSBDHEnvelopeReceipt|

## Different Reliable Messaging scenarios using ehmiSBDHEnvelope

This section provides a description of the different types of Reliable Messaging scenarios.

- Scenario #1 - Normally successful unsolicited  ehmiSBDHEnvelope or request message flow with ehmiSBDHEnvelopeReceipt request
- Scenario #2 - Duplicate of an unchanged ehmiSBDHEnvelope with a positive ehmiSBDHEnvelopeReceipt request
- Scenario #3 - (Re-)Sending Unchanged ehmiSBDHEnvelope
- Scenario #4 - ehmiSBDHEnvelope is sent normally, ehmiSBDHEnvelopeReceipt is lost along the way
- Scenario #5 - (Re-)Sending Modified ehmiSBDHEnvelope

### Scenario #1 - Normally successful unsolicited ehmiSBDHEnvelope or request ehmiSBDHEnvelope flow with ehmiSBDHEnvelopeReceipt request 

An unsolicited  ehmiSBDHEnvelope is sent with a new request for a positive ehmiSBDHEnvelopeReceipt from the Sending MSH to a Receiving MSH.

The Receiving MSH **SHALL** always send a positive ehmiSBDHEnvelopeReceipt to the Sending MSH.

### Scenario #2 - Duplicate of an unchanged ehmiSBDHEnvelope with a positive ehmiSBDHEnvelopeReceipt request 

Duplication of an unchanged ehmiSBDHEnvelope can be done in one of the following ways:

- An error may have occurred in the flow from the Sending MSH to the Receiving MSH with subsequent duplication of An ehmiSBDHEnvelope in scenario 1a.
- The Sending MSH may inadvertently send a duplicate of ehmiSBDHEnvelope

The ehmiSBDHEnvelopes are completely identical and as a consequence, the ehmiSBDHEnvelope with request for positive ehmiSBDHEnvelopeReceipt arrives at the Receiving MSH more than once.

The Receiving MSH **SHALL** ignore the contents of the duplicate instances of the ehmiSBDHEnvelope but **SHALL** acknowledge a duplicate ehmiSBDHEnvelope in the same way as the original ehmiSBDHEnvelope.

A positive ehmiSBDHEnvelopeReceipt may not be sent first and then a negative ehmiSBDHEnvelopeReceipt or vice versa.

The Receiving MSH **SHALL** never display several instances of An ehmiSBDHEnvelope in An ehmiSBDHEnvelope overview, but **SHALL** log in a system log that reception of a duplicate ehmiSBDHEnvelope has taken place.

If the Sending MSH of the ehmiSBDHEnvelope has received ehmiSBDHEnvelopeReceipt already after the Receiving MSH's ehmiSBDHEnvelopeReceipt of An ehmiSBDHEnvelope's first instance, the Sending MSH **SHALL** similarly ignore the duplicate instances of the ehmiSBDHEnvelopeReceipt.

The Sending MSH **SHALL** never display multiple instances of the same ehmiSBDHEnvelopeReceipt in An ehmiSBDHEnvelope summary but **SHALL** log in a system log that ehmiSBDHEnvelopeReceipt of a duplicate has taken place.

### Scenario #3 - (Re) Sending Unchanged ehmiSBDHEnvelope 

Correct retransmission of message A.

The Sending MSH **SHALL** form a new ehmiSBDHEnvelope with a new ID and time of dispatch.

Since there has been no change in the Message content section, the rest of the ehmiSBDHEnvelope **SHALL** remain identical.

The ehmiSBDHEnvelope **SHALL** be sent and ehmiSBDHEnvelope-Acknowledged as a completely new ehmiSBDHEnvelope according to Scenario #1 or # 1b.

Re-dispatches **SHALL** always be done manually and **SHOULD** be in accordance with the normal response time for the specific ehmiSBDHEnvelope flow.

### Scenario #4 - ehmiSBDHEnvelope is sent normally, but ehmiSBDHEnvelopeReceipt is lost along the way 

Like in Scenario #1, but where ehmiSBDHEnvelopeReceipt is lost along the way from the Sending MSH to the Receiving MSH.

The shipping pattern is like Scenario #3.

### Scenario #5 - (Re-) Sending Modified Message 

If the content of the Message content part is changed, the ehmiSBDHEnvelope is considered a completely new ehmiSBDHEnvelope and consequently change of both EnvelopeIdentifier, MessageIdentifier and timestamp **SHALL** be made if relevant.

Resubmissions **SHALL** always be done manually.

## ehmiSBDHEnvelope Reliable Messaging Elements

### ehmiSBDHEnvelope Reliable Messaging Message Elements

<!-- An ehmiSBDHEnvelope consists of the following elements (see <!--a href="#Fig2"Figure 2</a>):-->

<!--figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="ehmiSBDHEnvelope_schema-reliable.png" target="_blank"> <img src="ehmiSBDHEnvelope_schema-reliable.png" alt="ehmiSBDHEnvelope_schema-reliable" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig2"></a>
<figcaption text-align="left"><b>Figure 2: Reliable Messaging - reliable ehmiSBDHEnvelope tables </b></figcaption>
</figure-->
<br>

An ehmiSBDHEnvelope's Reliable Messaging part can be found in the ehmiSBDHEnvelope/-element, which is shown in [ehmiSBDHEnvelope's Reliable Messaging part](ehmiSBDH.html#reliable-messaging) <!--a href="#Fig3"Figure 3</a>:-->

<!--figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="ehmiSBDHEnvelope_schema-reliable-type.png" target="_blank"> <img src="ehmiSBDHEnvelope_schema-reliable-type.png" alt="ehmiSBDHEnvelope_schema-reliable" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig3"></a>
<figcaption text-align="left"><b>Figure 3: Reliable Messaging - reliable ehmiSBDHEnvelope type </b></figcaption>
</figure-->
<br>

Reliable Messaging in ehmiSBDHEnvelope **SHALL** be the default mode but can explicitly be "turned off" by leaving out the Scope-element pointed out by the Scope-Type: ehmiSBDHEnvelope/StandardBusinessDocumentHeader/BusinessScope/Scope/Type[EHMI-ReceiptAcknowledgement] and the Scope-InstanceIdentifier: ehmiSBDHEnvelope/StandardBusinessDocumentHeader/BusinessScope/Scope/InstanceIdentifier[Request]

In EHMI Messaging, these elements **SHALL** be present together with the underlying structure-parts.

### ehmiSBDHEnvelope ehmiSBDHEnvelopeReceipt Reliable Messaging Elements

When "reliable", the receiver of the ehmiSBDHEnvelope **SHALL** send An ehmiSBDHEnvelopeReceipt return to the original Sender.

An ehmiSBDHEnvelopeReceipt consists of the following elements (see <!--a href="#Fig4"-->Figure 4</a>):

<!--figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="ehmiSBDHEnvelope_schema-acknowledgement.png" target="_blank"> <img src="ehmiSBDHEnvelope_schema-acknowledgement.png" alt="ehmiSBDHEnvelope_schema-acknowledgement" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig4"></a>
<figcaption text-align="left"><b>Figure 4: Reliable Messaging - reliable ehmiSBDHEnvelope acknowledgement </b></figcaption>
</figure-->
<br>

## Links for Reliable Messaging|
<a href="https://medcomdk.github.io/MedCom-FHIR-Communication/assets/documents/FHIRMessages_NetworkEnvelopes_EN.html" target="_blank">MedComs desciption of Reliable Messaging in general in MedComs FHIR governance</a>

