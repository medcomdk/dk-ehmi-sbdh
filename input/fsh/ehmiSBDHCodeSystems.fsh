Alias: $EhmiSbdhEmdpointPayloadTypeCS = ehmi-sbdh-endpoint-payloadType
Alias: $EhmiSbdhEmdpointPayloadTypeVS = ehmi-sbdh-endpoint-payloadType-vs
Alias: $EhmiSbdhMedComMessagingCS = dk-medcom-messaging
Alias: $EhmiSbdhMedComMessagingVS = dk-medcom-messaging-vs

CodeSystem: EhmiSbdhEmdpointPayloadTypeCS
Id: ehmi-sbdh-endpoint-payloadType
Title: "EHMI SBDH Messaging Types CS"
Description: "ehmi-sbdh for the EHMI Messaging Infrastructure"
* ^version  =  "1.0.0"
* ^status  =  #active
* ^date  =  "2024-11-01"
* ^experimental = false
* ^caseSensitive = true
* #ehmiMessage "EHMI message"

ValueSet: EhmiSbdhEmdpointPayloadTypeVS
Id: ehmi-sbdh-endpoint-payloadType-vs
Title: "EHMI SBDH Messaging Types VS"
Description: "VS containing codes for EHMI SBDH Messaging Types"
* ^version  =  "1.0.0"
* ^status  =  #active
* ^date  =  "2024-11-01"
* ^experimental = false
* include codes from system $EhmiSbdhEmdpointPayloadTypeCS
//* include codes from system $AuditEventTypes
//* include codes from system http://hl7.org/fhir/restful-interaction
//* include codes from system http://terminology.hl7.org/CodeSystem/audit-entity-type

CodeSystem: EhmiSbdhMedComMessagingCS
Id: dk-medcom-messaging
Title: "EHMI Messaging Codes for SBDH CS"
Description: "dk-medcom-messaging for the EHMI Messaging Infrastructure"
* ^version  =  "1.0.0"
* ^status  =  #active
* ^date  =  "2024-11-01"
* ^experimental = false
* ^caseSensitive = true
* #HeaderVersion "HeaderVersion"
* #DOCUMENTID "DOCUMENTID"
* #PROCESSID "PROCESSID"
* #PATIENTID "PATIENTID"
* #SENDERID "SENDERID"
* #RECEIVERID "RECEIVERID"
* #MESSAGEIDENTIFIER "MESSAGEIDENTIFIER"
* #MESSAGEENVELOPEIDENTIFIER "MESSAGEENVELOPEIDENTIFIER"
* #ORIGINALMESSAGEIDENTIFIER "ORIGINALMESSAGEIDENTIFIER"
* #ORIGINALMESSAGEENVELOPEIDENTIFIER "ORIGINALMESSAGEENVELOPEIDENTIFIER"
* #ORIGINALMESSAGESTANDARD "ORIGINALMESSAGESTANDARD"
* #ORIGINALMESSAGEVERSION "ORIGINALMESSAGEVERSION"
* #XDS-Metadata "XDS-Metadata"
//* # ""

ValueSet: EhmiSbdhMedComMessagingVS
Id: dk-medcom-messaging-vs
Title: "EHMI SBDH Messaging Types VS"
Description: "VS containing codes for EHMI SBDH Messaging Types"
* ^version  =  "1.0.0"
* ^status  =  #active
* ^date  =  "2024-11-01"
* ^experimental = false
* include codes from system $EhmiSbdhMedComMessagingCS
