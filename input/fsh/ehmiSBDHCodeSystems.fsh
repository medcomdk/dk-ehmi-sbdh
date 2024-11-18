Alias: $EhmiSbdhCS = ehmi-sbdh-cs
Alias: $EhmiSbdhVS = ehmi-sbdh-vs
Alias: $EhmiSbdhMedComMessagingCS = dk-medcom-messaging-cs
Alias: $EhmiSbdhMedComMessagingVS = dk-medcom-messaging-vs

CodeSystem: EhmiSbdhCS
Id: ehmi-sbdh-cs
Title: "EHMI SBDH Messaging Types CS"
Description: "ehmi-sbdh for the EHMI Messaging Infrastructure"
* ^version  =  "1.0.0"
* ^status  =  #active
* ^date  =  "2024-11-01"
* ^experimental = false
* ^caseSensitive = true
* #ehmiMessaging "EHMI message events"

ValueSet: EhmiSbdhVS
Id: ehmi-sbdh-vs
Title: "EHMI SBDH Messaging Types VS"
Description: "VS containing codes for EHMI SBDH Messaging Types"
* ^version  =  "1.0.0"
* ^status  =  #active
* ^date  =  "2024-11-01"
* ^experimental = false
* include codes from system $EhmiSbdhCS
//* include codes from system $AuditEventTypes
//* include codes from system http://hl7.org/fhir/restful-interaction
//* include codes from system http://terminology.hl7.org/CodeSystem/audit-entity-type

CodeSystem: EhmiSbdhMedComMessagingCS
Id: dk-medcom-messaging-cs
Title: "EHMI Messaging Codes for SBDH CS"
Description: "dk-medcom-messaging-cs for the EHMI Messaging Infrastructure"
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
