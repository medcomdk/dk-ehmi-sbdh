Alias: $medcom-messaging-eventCodes = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-eventCodes
Alias: $medcom-messaging-destinationUse = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-destinationUse
Alias: $MedComDiagnosticReportCodes = http://medcomfhir.dk/ig/terminology/CodeSystem/MedComDiagnosticReportCodes
Alias: $medcom-core-PractitionerRolesSKSadministrativ = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-PractitionerRolesSKSadministrativ
Alias: $medcom-messaging-activityCodes = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes
Alias: $medcom-observation-codes = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes
Alias: $medcom-core-interpretation-codes = http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes

Instance: 401cbc36-db1e-4fe0-bf90-6df331dde179
InstanceOf: Bundle
Usage: #example
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-message"
* type = #message
* timestamp = "2023-09-13T12:24:10+02:00"
* entry[0].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/MessageHeader/489de4f2-0d8d-4de2-a7ce-ccb93568799f"
* entry[=].resource = 489de4f2-0d8d-4de2-a7ce-ccb93568799f
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
* entry[=].resource = bbcd4817-1c4b-4089-a712-346f65ec16f9
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/DiagnosticReport/efb1ed12-6a5d-4342-9572-861071644e46"
* entry[=].resource = efb1ed12-6a5d-4342-9572-861071644e46
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/PractitionerRole/4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf"
* entry[=].resource = 4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Practitioner/be9f367d-a84a-4815-90a8-c83a03813fd8"
* entry[=].resource = be9f367d-a84a-4815-90a8-c83a03813fd8
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Organization/1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1"
* entry[=].resource = 1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Organization/a0330c62-fe29-4719-83fa-a94959084f29"
* entry[=].resource = a0330c62-fe29-4719-83fa-a94959084f29
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Provenance/008e1c02-605d-458e-8cb8-3eeb16a69aac"
* entry[=].resource = 008e1c02-605d-458e-8cb8-3eeb16a69aac
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Observation/3fd3835d-1758-4d22-8547-000182752817"
* entry[=].resource = 3fd3835d-1758-4d22-8547-000182752817
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Observation/ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1"
* entry[=].resource = ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Observation/8917f29d-269c-4bb3-8ce9-d255c351d52b"
* entry[=].resource = 8917f29d-269c-4bb3-8ce9-d255c351d52b
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Observation/6bf03841-8397-4a2a-9f9a-8966b0cfa571"
* entry[=].resource = 6bf03841-8397-4a2a-9f9a-8966b0cfa571
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Observation/85fd1372-cf02-49c6-bd45-7205f5541a66"
* entry[=].resource = 85fd1372-cf02-49c6-bd45-7205f5541a66
* entry[+].fullUrl = "http://medcomfhir.dk/ig/homecareobservation/Observation/f64a0a78-53cf-4a7f-9b89-4a2338a4935c"
* entry[=].resource = f64a0a78-53cf-4a7f-9b89-4a2338a4935c

Instance: 489de4f2-0d8d-4de2-a7ce-ccb93568799f
InstanceOf: MessageHeader
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-messageheader"
* eventCoding = $medcom-messaging-eventCodes#homecareobservation-message
* destination.extension.url = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-destinationUseExtension"
* destination.extension.valueCoding = $medcom-messaging-destinationUse#primary
* destination.endpoint = "https://sor2.sum.dsdn.dk/#id=52581000016005"
* destination.receiver = Reference(1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1)
* sender = Reference(a0330c62-fe29-4719-83fa-a94959084f29)
* source.endpoint = "https://sor2.sum.dsdn.dk/#id=1144561000016002"
* focus = Reference(efb1ed12-6a5d-4342-9572-861071644e46)
* definition = "http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComHomeCareObservationMessageDefinition|1.1"

Instance: bbcd4817-1c4b-4089-a712-346f65ec16f9
InstanceOf: Patient
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-patient"
* identifier.system = "urn:oid:1.2.208.176.1.2"
* identifier.value = "2509479989"
* name.use = #official
* name.family = "Elmer"

Instance: efb1ed12-6a5d-4342-9572-861071644e46
InstanceOf: DiagnosticReport
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-diagnosticreport"
* status = #final
* code = $MedComDiagnosticReportCodes#HomeCareReport
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* issued = "2023-09-12T12:24:19+02:00"
* performer[0] = Reference(a0330c62-fe29-4719-83fa-a94959084f29)
* performer[+] = Reference(4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf)
* result[0] = Reference(3fd3835d-1758-4d22-8547-000182752817)
* result[+] = Reference(ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1)
* result[+] = Reference(8917f29d-269c-4bb3-8ce9-d255c351d52b)
* result[+] = Reference(6bf03841-8397-4a2a-9f9a-8966b0cfa571)
* result[+] = Reference(85fd1372-cf02-49c6-bd45-7205f5541a66)
* result[+] = Reference(f64a0a78-53cf-4a7f-9b89-4a2338a4935c)
* conclusion = "ABCDE\nSeFølLyt-Princippet\nA.\tRF 19 - påskyndet men regelmæssig, fri respiration. SAT 93%\nB.\tPuls 92 palperet på venstre håndled. Fyldig regelmæssig. Fin kapilærrespons\nC.\tBT 147/83 - klamtsvedende. Kolde ekstremiteter. \nD.\tReagerer habituelt. Pupilreaktion i.a. VAS 7. Bl.s. 6,8\nE.\tTemperatur 38,7 Målt rektalt"

Instance: 4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf
InstanceOf: PractitionerRole
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-practitionerrole"
* practitioner = Reference(be9f367d-a84a-4815-90a8-c83a03813fd8)
* code = $medcom-core-PractitionerRolesSKSadministrativ#sygeplejerske

Instance: be9f367d-a84a-4815-90a8-c83a03813fd8
InstanceOf: Practitioner
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-practitioner"
* name.given = "Mia"
* telecom.system = #phone
* telecom.value = "+45 05577668"

Instance: 1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-requesterorganization"
* identifier[0].system = "https://www.gs1.org/gln"
* identifier[=].value = "5790000127092"
* identifier[+].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "52581000016005"
* identifier[+].system = "urn:oid:1.2.208.176.1.4"
* identifier[=].value = "061654"
* name = "Skødstrup Lægepraksis"
* contact.name.given = "O.K.M."

Instance: a0330c62-fe29-4719-83fa-a94959084f29
InstanceOf: Organization
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-producer-organization"
* identifier[0].system = "https://www.gs1.org/gln"
* identifier[=].value = "5790000123117"
* identifier[+].system = "urn:oid:1.2.208.176.1.1"
* identifier[=].value = "1144561000016002"
* identifier[+].system = "http://medcomfhir.dk/ig/terminology/CodeSystem/MedComProducentID"
* identifier[=].value = "KAF"
* name = "Pleje og Rehabilitering"

Instance: 008e1c02-605d-458e-8cb8-3eeb16a69aac
InstanceOf: Provenance
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-provenance"
* target = Reference(489de4f2-0d8d-4de2-a7ce-ccb93568799f)
* occurredDateTime = "2023-09-13T12:24:00+02:00"
* recorded = "2023-09-13T12:24:00+02:00"
* activity = $medcom-messaging-activityCodes#new-message
* agent.who = Reference(a0330c62-fe29-4719-83fa-a94959084f29)

Instance: 3fd3835d-1758-4d22-8547-000182752817
InstanceOf: Observation
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"
* status = #final
* code = $medcom-observation-codes#MCS88122
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* effectiveDateTime = "2023-09-13T09:24:08+02:00"
* valueQuantity.value = 19
* valueQuantity.unit = "1/min"
* interpretation = $medcom-core-interpretation-codes#NI "Not Interpreted"

Instance: ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1
InstanceOf: Observation
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"
* status = #final
* code = urn:oid:1.2.208.176.2.1#NPU21692 "Hjerte—Systole; frekv. = ? × 1/min"
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* effectiveDateTime = "2023-09-13T09:24:09+02:00"
* valueQuantity.value = 92
* valueQuantity.unit = "1/min"
* interpretation = $medcom-core-interpretation-codes#NI "Not Interpreted"
* note.text = "Patienten har været ud og går lige inden målingen."

Instance: 8917f29d-269c-4bb3-8ce9-d255c351d52b
InstanceOf: Observation
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"
* status = #final
* code = urn:oid:1.2.208.176.2.1#DNK05472 "Arm—Blodtryk(systolisk); tryk = ? mmHg"
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* effectiveDateTime = "2023-09-13T09:24:10+02:00"
* valueQuantity.value = 147
* valueQuantity.unit = "mmHg"
* interpretation = $medcom-core-interpretation-codes#NI "Not Interpreted"

Instance: 6bf03841-8397-4a2a-9f9a-8966b0cfa571
InstanceOf: Observation
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"
* status = #final
* code = $medcom-observation-codes#MCS88126
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* effectiveDateTime = "2023-09-13T09:24:11+02:00"
* valueQuantity = 0 '1'
* interpretation = $medcom-core-interpretation-codes#NI "Not Interpreted"

Instance: 85fd1372-cf02-49c6-bd45-7205f5541a66
InstanceOf: Observation
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"
* status = #final
* code = urn:oid:1.2.208.176.2.1#NPU08676 "Pt—Legeme; temp. = ? °C"
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* effectiveDateTime = "2023-09-13T09:24:12+02:00"
* valueQuantity.value = 38.7
* valueQuantity.unit = "°C"
* interpretation = $medcom-core-interpretation-codes#NI "Not Interpreted"

Instance: f64a0a78-53cf-4a7f-9b89-4a2338a4935c
InstanceOf: Observation
Usage: #inline
* meta.profile = "http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"
* status = #final
* code = $medcom-observation-codes#MCS88125
* subject = Reference(bbcd4817-1c4b-4089-a712-346f65ec16f9)
* effectiveDateTime = "2023-09-13T09:24:13+02:00"
* valueQuantity = 3 '1'
* interpretation = $medcom-core-interpretation-codes#NI "Not Interpreted"