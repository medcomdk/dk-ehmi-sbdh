# Reliable Messaging using ehmiSBDHEnvelope

**Table of contents**
* [1 Different Reliable Messaging scenarios using ehmiSBDHEnvelope](#1-different-reliable-messaging-scenarios-using-vansenvelope)
    * [1.1 Scenario #1 - Normally successful unsolicited ehmiSBDHEnvelope or request ehmiSBDHEnvelope flow with ehmiSBDHEnvelopeAcknowledgement request ](#11-scenario-1---normally-successful-unsolicited-vansenvelope-or-request-vansenvelope-flow-with-vansenvelopeacknowledgement-request)
    * [1.2 Scenario #2 - Duplicate of an unchanged ehmiSBDHEnvelope with a positive ehmiSBDHEnvelopeAcknowledgement request ](#12-scenario-2---duplicate-of-an-unchanged-vansenvelope-with-a-positive-vansenvelopeacknowledgement-request)
    * [1.3 Scenario #3 - (Re) Sending Unchanged ehmiSBDHEnvelope ](#13-scenario-3---re-sending-unchanged-vansenvelope)
    * [1.4 Scenario #4 - ehmiSBDHEnvelope is sent normally, but ehmiSBDHEnvelopeAcknowledgement is lost along the way](#14-scenario-4---vansenvelope-is-sent-normally-but-vansenvelopeacknowledgement-is-lost-along-the-way)
    * [1.5 Scenario #5 - (Re-) Sending Modified Message ](#15-scenario-5---re--sending-modified-message)
* [2 VansEnvelope Reliable Messaging Elements](#2-vansenvelope-reliable-messaging-elements)
    * [2.2 VansEnvelope Reliable Messaging Message Elements](#22-vansenvelope-reliable-messaging-message-elements)
    * [2.3 VansEnvelope ehmiSBDHEnvelopeAcknowledgement Reliable Messaging Elements](#23-vansenvelope-vansenvelopeacknowledgement-reliable-messaging-elements)
<br><br>




Reliable Messaging in ehmiSBDHEnvelope follows the principles laid out in [Reliable Messaging in general](/assets/documents/020_Governance-for-Reliable-Messaging-in-general.md)

The Reliable Messaging Model and how the flow is laid out using ehmiSBDHEnvelope is shown in <a href="#Fig1">Figure 1</a>. 

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="../images/reliable-messaging-vansenvelope_1160x625.png" target="_blank"> <img src="../images/reliable-messaging-vansenvelope_1160x625.png" alt="reliable messaging principle" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig1"></a>
<figcaption text-align="left"><b>Figure 1: Reliable Messaging - ehmiSBDHEnvelope </b></figcaption>
</figure>
<br>

When Reliable Messaging is implemented, the Receiver **SHALL** check the incoming EnvelopeIdentifier and Message/MetaInformation/Identifier (hereafter MessageIdentifier) against a cache of previously received ehmiSBDHEnvelopes. The correct action to take depends on what is received:

| Case                                                            | Description                |
|:----------------------------------------------------------------|:---------------------------|
| Both EnvelopeIdentifier and MessageIdentifier have not been received       | This is the normal case, and the message **SHALL** be processed            |
| Both EnvelopeIdentifier and MessageIdentifier have already been received   | The original ehmiSBDHEnvelope server may either reprocess the message, or reject the message|
| MessageIdentifier has already been received, but EnvelopeIdentifier is new | The original ehmiSBDHEnvelopeAcknowledgement has been lost (failed to return to the request issuer) and thus the previously received Message in a ehmiSBDHEnvelope has been resubmitted with a new EnvelopeIdentifier for processing again. The original ehmiSBDHEnvelopeAcknowledgement **SHALL** be resent|
| The EnvelopeIdentifier has already been received, but the MessageIdentifier is new | This is an error - EnvelopeIdentifier values **SHALL** never be reused. Receiver **MAY** return a Negative ehmiSBDHEnvelopeAcknowledgement|

## 1 Different Reliable Messaging scenarios using ehmiSBDHEnvelope

This section provides a description of the different types of Reliable Messaging scenarios.

- Scenario #1 - Normally successful unsolicited  ehmiSBDHEnvelope or request message flow with ehmiSBDHEnvelopeAcknowledgement request
- Scenario #2 - Duplicate of an unchanged ehmiSBDHEnvelope with a positive ehmiSBDHEnvelopeAcknowledgement request
- Scenario #3 - (Re-)Sending Unchanged ehmiSBDHEnvelope
- Scenario #4 - ehmiSBDHEnvelope is sent normally, ehmiSBDHEnvelopeAcknowledgement is lost along the way
- Scenario #5 - (Re-)Sending Modified ehmiSBDHEnvelope

### 1.1 Scenario #1 - Normally successful unsolicited ehmiSBDHEnvelope or request ehmiSBDHEnvelope flow with ehmiSBDHEnvelopeAcknowledgement request 

An unsolicited  ehmiSBDHEnvelope is sent with a new request for a positive ehmiSBDHEnvelopeAcknowledgement from the Sending System to a Receiving System.

The Receiving System **SHALL** always send a positive ehmiSBDHEnvelopeAcknowledgement to the Sending System.

### 1.2 Scenario #2 - Duplicate of an unchanged ehmiSBDHEnvelope with a positive ehmiSBDHEnvelopeAcknowledgement request 

Duplication of an unchanged ehmiSBDHEnvelope can be done in one of the following ways:

- An error may have occurred in the flow from the Sending System to the Receiving System with subsequent duplication of a ehmiSBDHEnvelope in scenario 1a.
- The Sending System may inadvertently send a duplicate of ehmiSBDHEnvelope

The ehmiSBDHEnvelopes are completely identical and as a consequence, the ehmiSBDHEnvelope with request for positive ehmiSBDHEnvelopeAcknowledgement arrives at the Receiving System more than once.

The Receiving System **SHALL** ignore the contents of the duplicate instances of the ehmiSBDHEnvelope but **SHALL** acknowledge a duplicate ehmiSBDHEnvelope in the same way as the original ehmiSBDHEnvelope.

A positive ehmiSBDHEnvelopeAcknowledgement may not be sent first and then a negative ehmiSBDHEnvelopeAcknowledgement or vice versa.

The Receiving System **SHALL** never display several instances of a ehmiSBDHEnvelope in a ehmiSBDHEnvelope overview, but **SHALL** log in a system log that reception of a duplicate ehmiSBDHEnvelope has taken place.

If the Sending System of the ehmiSBDHEnvelope has received ehmiSBDHEnvelopeAcknowledgement already after the Receiving System's ehmiSBDHEnvelopeAcknowledgement of a ehmiSBDHEnvelope's first instance, the Sending System **SHALL** similarly ignore the duplicate instances of the ehmiSBDHEnvelopeAcknowledgement.

The Sending System **SHALL** never display multiple instances of the same ehmiSBDHEnvelopeAcknowledgement in a ehmiSBDHEnvelope summary but **SHALL** log in a system log that ehmiSBDHEnvelopeAcknowledgement of a duplicate has taken place.

### 1.3 Scenario #3 - (Re) Sending Unchanged ehmiSBDHEnvelope 

Correct retransmission of message A.

The Sending System **SHALL** form a new ehmiSBDHEnvelope with a new ID and time of dispatch.

Since there has been no change in the Message content section, the rest of the ehmiSBDHEnvelope **SHALL** remain identical.

The ehmiSBDHEnvelope **SHALL** be sent and ehmiSBDHEnvelopeAcknowledged as a completely new ehmiSBDHEnvelope according to Scenario #1 or # 1b.

Re-dispatches **SHALL** always be done manually and **SHOULD** be in accordance with the normal response time for the specific ehmiSBDHEnvelope flow.

### 1.4 Scenario #4 - ehmiSBDHEnvelope is sent normally, but ehmiSBDHEnvelopeAcknowledgement is lost along the way 

Like in Scenario #1, but where ehmiSBDHEnvelopeAcknowledgement is lost along the way from the Sending System to the Receiving System.

The shipping pattern is like Scenario #3.

### 1.5 Scenario #5 - (Re-) Sending Modified Message 

If the content of the Message content part is changed, the ehmiSBDHEnvelope is considered a completely new ehmiSBDHEnvelope and consequently change of both EnvelopeIdentifier, MessageIdentifier and timestamp **SHALL** be made if relevant.

Resubmissions **SHALL** always be done manually.

## 2 VansEnvelope Reliable Messaging Elements

### 2.2 VansEnvelope Reliable Messaging Message Elements

A VansEnvelope consists of the following elements (see <a href="#Fig2">Figure 2</a>.):

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="../images/vansenvelope_schema-reliable.png" target="_blank"> <img src="../images/vansenvelope_schema-reliable.png" alt="vansenvelope_schema-reliable" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig2"></a>
<figcaption text-align="left"><b>Figure 2: Reliable Messaging - reliable ehmiSBDHEnvelope tables </b></figcaption>
</figure>
<br>

A VansEnvelope's Reliable Messaging part can be found in the ehmiSBDHEnvelope/Message/MetaInformation/Transport/Type-element, which is shown in <a href="#Fig3">Figure 3</a>.:

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="../images/vansenvelope_schema-reliable-type.png" target="_blank"> <img src="../images/vansenvelope_schema-reliable-type.png" alt="vansenvelope_schema-reliable" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig3"></a>
<figcaption text-align="left"><b>Figure 3: Reliable Messaging - reliable ehmiSBDHEnvelope type </b></figcaption>
</figure>
<br>

Reliable Messaging in ehmiSBDHEnvelope is the default mode but can explicitly be turned on and off by setting the ehmiSBDHEnvelope/Message/MetaInformation/Transport/Type-element to "reliable" or "unreliable".

In FHIR Messaging, this element **SHALL** be "reliable" or left in default mode.

### 2.3 VansEnvelope ehmiSBDHEnvelopeAcknowledgement Reliable Messaging Elements

When "reliable", the receiver of the ehmiSBDHEnvelope **SHALL** send a ehmiSBDHEnvelopeAcknowledgement return to the original Sender.

A ehmiSBDHEnvelopeAcknowledgement consists of the following elements (see <a href="#Fig4">Figure 4</a>.):

<figure style="margin-left: 0px; margin-right: 0px; width: 100%;">
<a href="../images/vansenvelope_schema-acknowledgement.png" target="_blank"> <img src="../images/vansenvelope_schema-acknowledgement.png" alt="vansenvelope_schema-acknowledgement" style="width:auto; margin-left:0px; margin-right:0px;" id="Fig4"></a>
<figcaption text-align="left"><b>Figure 4: Reliable Messaging - reliable ehmiSBDHEnvelope acknowledgement </b></figcaption>
</figure>
<br>

| Links for Reliable Messaging|
|:---|
|[Reliable Messaging in general](020_Governance-for-Reliable-Messaging-in-general.md)|
|[Reliable Messaging in MedCom FHIR Messaging](043_Reliable_Messaging-FHIR.md)|