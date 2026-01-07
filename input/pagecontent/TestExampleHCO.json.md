# Example Bundle: 401cbc36-db1e-4fe0-bf90-6df331dde179

[This example is also represented here more comprehensive in different formats](https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/branches/DocRefexample/Bundle-401cbc36-db1e-4fe0-bf90-6df331dde179)

    {
      "resourceType" : "Bundle",
      "id" : "401cbc36-db1e-4fe0-bf90-6df331dde179",
      "meta" : {
        "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-message"]
      },
      "type" : "message",
      "timestamp" : "2023-09-13T12:24:10+02:00",
      "entry" : [{
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/MessageHeader/489de4f2-0d8d-4de2-a7ce-ccb93568799f",
        "resource" : {
          "resourceType" : "MessageHeader",
          "id" : "489de4f2-0d8d-4de2-a7ce-ccb93568799f",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-messageheader"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MessageHeader_489de4f2-0d8d-4de2-a7ce-ccb93568799f\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MessageHeader 489de4f2-0d8d-4de2-a7ce-ccb93568799f</b></p><a name=\"489de4f2-0d8d-4de2-a7ce-ccb93568799f\"> </a><a name=\"hc489de4f2-0d8d-4de2-a7ce-ccb93568799f\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecareobservation-messageheader.html\">MedComHomeCareObservationMessageHeader</a></p></div><p><b>event</b>: <a href=\"http://medcomfhir.dk/ig/terminology/2.0.2/CodeSystem-medcom-messaging-eventCodes.html#medcom-messaging-eventCodes-homecareobservation-message\">MedComMessagingEventCodes homecareobservation-message</a>: HomeCare Observation Message</p><h3>Destinations</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Endpoint</b></td><td><b>Receiver</b></td></tr><tr><td style=\"display: none\">*</td><td/><td><a href=\"https://sor2.sum.dsdn.dk/#id=52581000016005\">https://sor2.sum.dsdn.dk/#id=52581000016005</a></td><td><a href=\"Organization-1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1.html\">Organization Skødstrup Lægepraksis</a></td></tr></table><p><b>sender</b>: <a href=\"Organization-a0330c62-fe29-4719-83fa-a94959084f29.html\">Organization Pleje og Rehabilitering</a></p><h3>Sources</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Endpoint</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"https://sor2.sum.dsdn.dk/#id=1144561000016002\">https://sor2.sum.dsdn.dk/#id=1144561000016002</a></td></tr></table><p><b>focus</b>: <a href=\"DiagnosticReport-efb1ed12-6a5d-4342-9572-861071644e46.html\">Diagnostic Report for 'HomeCareDiagnosticReport' for '-&gt;Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)'</a></p><p><b>definition</b>: <a href=\"http://medcomfhir.dk/ig/messagedefinitions/1.0.1-trial-use/MessageDefinition-MedComHomeCareObservationMessageDefinitionV1.1.html\">http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComHomeCareObservationMessageDefinition|1.1</a></p></div>"
          },
          "eventCoding" : {
            "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-eventCodes",
            "code" : "homecareobservation-message"
          },
          "destination" : [{
            "extension" : [{
              "url" : "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-destinationUseExtension",
              "valueCoding" : {
                "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-destinationUse",
                "code" : "primary"
              }
            }],
            "endpoint" : "https://sor2.sum.dsdn.dk/#id=52581000016005",
            "receiver" : {
              "reference" : "Organization/1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1"
            }
          }],
          "sender" : {
            "reference" : "Organization/a0330c62-fe29-4719-83fa-a94959084f29"
          },
          "source" : {
            "endpoint" : "https://sor2.sum.dsdn.dk/#id=1144561000016002"
          },
          "focus" : [{
            "reference" : "DiagnosticReport/efb1ed12-6a5d-4342-9572-861071644e46"
          }],
          "definition" : "http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComHomeCareObservationMessageDefinition|1.1"
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9",
        "resource" : {
          "resourceType" : "Patient",
          "id" : "bbcd4817-1c4b-4089-a712-346f65ec16f9",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-patient"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_bbcd4817-1c4b-4089-a712-346f65ec16f9\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient bbcd4817-1c4b-4089-a712-346f65ec16f9</b></p><a name=\"bbcd4817-1c4b-4089-a712-346f65ec16f9\"> </a><a name=\"hcbbcd4817-1c4b-4089-a712-346f65ec16f9\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/core/2.4.0/StructureDefinition-medcom-core-patient.html\">MedComCorePatient</a></p></div><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</p><hr/></div>"
          },
          "identifier" : [{
            "system" : "urn:oid:1.2.208.176.1.2",
            "value" : "2509479989"
          }],
          "name" : [{
            "use" : "official",
            "family" : "Elmer"
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/DiagnosticReport/efb1ed12-6a5d-4342-9572-861071644e46",
        "resource" : {
          "resourceType" : "DiagnosticReport",
          "id" : "efb1ed12-6a5d-4342-9572-861071644e46",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecareobservation-diagnosticreport"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"DiagnosticReport_efb1ed12-6a5d-4342-9572-861071644e46\"> </a><p class=\"res-header-id\"><b>Generated Narrative: DiagnosticReport efb1ed12-6a5d-4342-9572-861071644e46</b></p><a name=\"efb1ed12-6a5d-4342-9572-861071644e46\"> </a><a name=\"hcefb1ed12-6a5d-4342-9572-861071644e46\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecareobservation-diagnosticreport.html\">MedComHomeCareObservationDiagnosticReport</a></p></div><h2><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/MedComDiagnosticReportCodes HomeCareReport}\">HomeCareDiagnosticReport</span> </h2><table class=\"grid\"><tr><td>Subject</td><td>Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</td></tr><tr><td>Reported</td><td>2023-09-12 12:24:19+0200</td></tr><tr><td>Performers</td><td> <a href=\"Organization-a0330c62-fe29-4719-83fa-a94959084f29.html\">Organization Pleje og Rehabilitering</a> <a href=\"PractitionerRole-4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf.html\">PractitionerRole Sygeplejerske</a></td></tr></table><p><b>Report Details</b></p><table class=\"grid\"><tr><td><b>Code</b></td><td><b>Value</b></td><td><b>Flags</b></td><td><b>Note</b></td><td><b>When For</b></td></tr><tr><td><a href=\"Observation-3fd3835d-1758-4d22-8547-000182752817.html\"><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes MCS88122}\">Pt—Respiration; frekvens = ? X 1/min</span></a></td><td>19 1/min</td><td>Final, <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></td><td/><td>2023-09-13 09:24:08+0200</td></tr><tr><td><a href=\"Observation-ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1.html\"><span title=\"Codes:{urn:oid:1.2.208.176.2.1 NPU21692}\">Hjerte—Systole; frekv. = ? × 1/min</span></a></td><td>92 1/min</td><td>Final, <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></td><td><blockquote><div><p>Patienten har været ud og går lige inden målingen.</p>\n</div></blockquote></td><td>2023-09-13 09:24:09+0200</td></tr><tr><td><a href=\"Observation-8917f29d-269c-4bb3-8ce9-d255c351d52b.html\"><span title=\"Codes:{urn:oid:1.2.208.176.2.1 DNK05472}\">Arm—Blodtryk(systolisk); tryk = ? mmHg</span></a></td><td>147 mmHg</td><td>Final, <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></td><td/><td>2023-09-13 09:24:10+0200</td></tr><tr><td><a href=\"Observation-6bf03841-8397-4a2a-9f9a-8966b0cfa571.html\"><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes MCS88126}\">Pt—Bevidsthedsniveau; arb.antal(værdi 0-3) = ?</span></a></td><td>0 1<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code1 = '1')</span></td><td>Final, <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></td><td/><td>2023-09-13 09:24:11+0200</td></tr><tr><td><a href=\"Observation-85fd1372-cf02-49c6-bd45-7205f5541a66.html\"><span title=\"Codes:{urn:oid:1.2.208.176.2.1 NPU08676}\">Pt—Legeme; temp. = ? °C</span></a></td><td>38.7 °C</td><td>Final, <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></td><td/><td>2023-09-13 09:24:12+0200</td></tr><tr><td><a href=\"Observation-f64a0a78-53cf-4a7f-9b89-4a2338a4935c.html\"><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes MCS88125}\">Pt—Tidlig Opsporing af Begyndende Sygdom (TOBS) score; antal (værdi 0-15) = ?</span></a></td><td>3 1<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code1 = '1')</span></td><td>Final, <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></td><td/><td>2023-09-13 09:24:13+0200</td></tr></table><p>ABCDE\nSeFølLyt-Princippet\nA.\tRF 19 - påskyndet men regelmæssig, fri respiration. SAT 93%\nB.\tPuls 92 palperet på venstre håndled. Fyldig regelmæssig. Fin kapilærrespons\nC.\tBT 147/83 - klamtsvedende. Kolde ekstremiteter. \nD.\tReagerer habituelt. Pupilreaktion i.a. VAS 7. Bl.s. 6,8\nE.\tTemperatur 38,7 Målt rektalt</p></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/MedComDiagnosticReportCodes",
              "code" : "HomeCareReport"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "issued" : "2023-09-12T12:24:19+02:00",
          "performer" : [{
            "reference" : "Organization/a0330c62-fe29-4719-83fa-a94959084f29"
          },
          {
            "reference" : "PractitionerRole/4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf"
          }],
          "result" : [{
            "reference" : "Observation/3fd3835d-1758-4d22-8547-000182752817"
          },
          {
            "reference" : "Observation/ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1"
          },
          {
            "reference" : "Observation/8917f29d-269c-4bb3-8ce9-d255c351d52b"
          },
          {
            "reference" : "Observation/6bf03841-8397-4a2a-9f9a-8966b0cfa571"
          },
          {
            "reference" : "Observation/85fd1372-cf02-49c6-bd45-7205f5541a66"
          },
          {
            "reference" : "Observation/f64a0a78-53cf-4a7f-9b89-4a2338a4935c"
          }],
          "conclusion" : "ABCDE\nSeFølLyt-Princippet\nA.\tRF 19 - påskyndet men regelmæssig, fri respiration. SAT 93%\nB.\tPuls 92 palperet på venstre håndled. Fyldig regelmæssig. Fin kapilærrespons\nC.\tBT 147/83 - klamtsvedende. Kolde ekstremiteter. \nD.\tReagerer habituelt. Pupilreaktion i.a. VAS 7. Bl.s. 6,8\nE.\tTemperatur 38,7 Målt rektalt"
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/PractitionerRole/4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf",
        "resource" : {
          "resourceType" : "PractitionerRole",
          "id" : "4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-practitionerrole"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"PractitionerRole_4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf\"> </a><p class=\"res-header-id\"><b>Generated Narrative: PractitionerRole 4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf</b></p><a name=\"4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf\"> </a><a name=\"hc4b3b6f0f-a475-4b04-8a92-105e8ce6a7bf\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/core/2.4.0/StructureDefinition-medcom-core-practitionerrole.html\">MedComCorePractitionerRole</a></p></div><p><b>practitioner</b>: <a href=\"Practitioner-be9f367d-a84a-4815-90a8-c83a03813fd8.html\">Practitioner Mia </a></p><p><b>code</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-PractitionerRolesSKSadministrativ sygeplejerske}\">Sygeplejerske</span></p></div>"
          },
          "practitioner" : {
            "reference" : "Practitioner/be9f367d-a84a-4815-90a8-c83a03813fd8"
          },
          "code" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-PractitionerRolesSKSadministrativ",
              "code" : "sygeplejerske"
            }]
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Practitioner/be9f367d-a84a-4815-90a8-c83a03813fd8",
        "resource" : {
          "resourceType" : "Practitioner",
          "id" : "be9f367d-a84a-4815-90a8-c83a03813fd8",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/core/StructureDefinition/medcom-core-practitioner"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Practitioner_be9f367d-a84a-4815-90a8-c83a03813fd8\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner be9f367d-a84a-4815-90a8-c83a03813fd8</b></p><a name=\"be9f367d-a84a-4815-90a8-c83a03813fd8\"> </a><a name=\"hcbe9f367d-a84a-4815-90a8-c83a03813fd8\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/core/2.4.0/StructureDefinition-medcom-core-practitioner.html\">MedComCorePractitioner</a></p></div><p><b>name</b>: Mia </p><p><b>telecom</b>: <a href=\"tel:+4505577668\">+45 05577668</a></p></div>"
          },
          "name" : [{
            "given" : ["Mia"]
          }],
          "telecom" : [{
            "system" : "phone",
            "value" : "+45 05577668"
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Organization/1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1",
        "resource" : {
          "resourceType" : "Organization",
          "id" : "1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-requesterorganization"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization 1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1</b></p><a name=\"1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1\"> </a><a name=\"hc1ab9c2d9-c348-4d75-9122-60ea8a6fdcf1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/3.0.0/StructureDefinition-medcom-requesterorganization.html\">MedComMessagingRequesterOrganization</a></p></div><p><b>identifier</b>: <code>https://www.gs1.org/gln</code>/5790000127092, <code>urn:oid:1.2.208.176.1.1</code>/52581000016005, <code>urn:oid:1.2.208.176.1.4</code>/061654</p><p><b>name</b>: Skødstrup Lægepraksis</p><h3>Contacts</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Name</b></td></tr><tr><td style=\"display: none\">*</td><td>O.K.M. </td></tr></table></div>"
          },
          "identifier" : [{
            "system" : "https://www.gs1.org/gln",
            "value" : "5790000127092"
          },
          {
            "system" : "urn:oid:1.2.208.176.1.1",
            "value" : "52581000016005"
          },
          {
            "system" : "urn:oid:1.2.208.176.1.4",
            "value" : "061654"
          }],
          "name" : "Skødstrup Lægepraksis",
          "contact" : [{
            "name" : {
              "given" : ["O.K.M."]
            }
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Organization/a0330c62-fe29-4719-83fa-a94959084f29",
        "resource" : {
          "resourceType" : "Organization",
          "id" : "a0330c62-fe29-4719-83fa-a94959084f29",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-producer-organization"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_a0330c62-fe29-4719-83fa-a94959084f29\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization a0330c62-fe29-4719-83fa-a94959084f29</b></p><a name=\"a0330c62-fe29-4719-83fa-a94959084f29\"> </a><a name=\"hca0330c62-fe29-4719-83fa-a94959084f29\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/3.0.0/StructureDefinition-medcom-producer-organization.html\">MedComCoreProducerOrganization</a></p></div><p><b>identifier</b>: <code>https://www.gs1.org/gln</code>/5790000123117, <code>urn:oid:1.2.208.176.1.1</code>/1144561000016002, <code>http://medcomfhir.dk/ig/terminology/CodeSystem/MedComProducentID</code>/KAF</p><p><b>name</b>: Pleje og Rehabilitering</p></div>"
          },
          "identifier" : [{
            "system" : "https://www.gs1.org/gln",
            "value" : "5790000123117"
          },
          {
            "system" : "urn:oid:1.2.208.176.1.1",
            "value" : "1144561000016002"
          },
          {
            "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/MedComProducentID",
            "value" : "KAF"
          }],
          "name" : "Pleje og Rehabilitering"
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Provenance/008e1c02-605d-458e-8cb8-3eeb16a69aac",
        "resource" : {
          "resourceType" : "Provenance",
          "id" : "008e1c02-605d-458e-8cb8-3eeb16a69aac",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-provenance"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Provenance_008e1c02-605d-458e-8cb8-3eeb16a69aac\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Provenance 008e1c02-605d-458e-8cb8-3eeb16a69aac</b></p><a name=\"008e1c02-605d-458e-8cb8-3eeb16a69aac\"> </a><a name=\"hc008e1c02-605d-458e-8cb8-3eeb16a69aac\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/3.0.0/StructureDefinition-medcom-messaging-provenance.html\">MedComMessagingProvenance</a></p></div><p>Provenance for <a href=\"MessageHeader-489de4f2-0d8d-4de2-a7ce-ccb93568799f.html\">MessageHeader: event[x] = HomeCare Observation Message (MedComMessagingEventCodes#homecareobservation-message); definition = http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComHomeCareObservationMessageDefinition|1.1</a></p><p>Summary</p><table class=\"grid\"><tr><td>Occurrence</td><td>2023-09-13 12:24:00+0200</td></tr><tr><td>Recorded</td><td>2023-09-13 12:24:00+0200</td></tr><tr><td>Activity</td><td><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes new-message}\">A new message has been sent</span></td></tr></table><p><b>Agents</b></p><table class=\"grid\"><tr><td><b>who</b></td></tr><tr><td><a href=\"Organization-a0330c62-fe29-4719-83fa-a94959084f29.html\">Organization Pleje og Rehabilitering</a></td></tr></table></div>"
          },
          "target" : [{
            "reference" : "MessageHeader/489de4f2-0d8d-4de2-a7ce-ccb93568799f"
          }],
          "occurredDateTime" : "2023-09-13T12:24:00+02:00",
          "recorded" : "2023-09-13T12:24:00+02:00",
          "activity" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes",
              "code" : "new-message"
            }]
          },
          "agent" : [{
            "who" : {
              "reference" : "Organization/a0330c62-fe29-4719-83fa-a94959084f29"
            }
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Observation/3fd3835d-1758-4d22-8547-000182752817",
        "resource" : {
          "resourceType" : "Observation",
          "id" : "3fd3835d-1758-4d22-8547-000182752817",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Observation_3fd3835d-1758-4d22-8547-000182752817\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation 3fd3835d-1758-4d22-8547-000182752817</b></p><a name=\"3fd3835d-1758-4d22-8547-000182752817\"> </a><a name=\"hc3fd3835d-1758-4d22-8547-000182752817\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecare-observation.html\">MedComHomeCareObservation</a></p></div><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes MCS88122}\">Pt—Respiration; frekvens = ? X 1/min</span></p><p><b>subject</b>: <a href=\"Patient-bbcd4817-1c4b-4089-a712-346f65ec16f9.html\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</a></p><p><b>effective</b>: 2023-09-13 09:24:08+0200</p><p><b>value</b>: 19 1/min</p><p><b>interpretation</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></p></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes",
              "code" : "MCS88122"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "effectiveDateTime" : "2023-09-13T09:24:08+02:00",
          "valueQuantity" : {
            "value" : 19,
            "unit" : "1/min"
          },
          "interpretation" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes",
              "code" : "NI",
              "display" : "Not Interpreted"
            }]
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Observation/ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1",
        "resource" : {
          "resourceType" : "Observation",
          "id" : "ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Observation_ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1</b></p><a name=\"ba691ee4-6d38-4f5b-82f1-40b54e3b8ad1\"> </a><a name=\"hcba691ee4-6d38-4f5b-82f1-40b54e3b8ad1\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecare-observation.html\">MedComHomeCareObservation</a></p></div><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{urn:oid:1.2.208.176.2.1 NPU21692}\">Hjerte—Systole; frekv. = ? × 1/min</span></p><p><b>subject</b>: <a href=\"Patient-bbcd4817-1c4b-4089-a712-346f65ec16f9.html\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</a></p><p><b>effective</b>: 2023-09-13 09:24:09+0200</p><p><b>value</b>: 92 1/min</p><p><b>interpretation</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></p><p><b>note</b>: </p><blockquote><div><p>Patienten har været ud og går lige inden målingen.</p>\n</div></blockquote></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "urn:oid:1.2.208.176.2.1",
              "code" : "NPU21692",
              "display" : "Hjerte—Systole; frekv. = ? × 1/min"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "effectiveDateTime" : "2023-09-13T09:24:09+02:00",
          "valueQuantity" : {
            "value" : 92,
            "unit" : "1/min"
          },
          "interpretation" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes",
              "code" : "NI",
              "display" : "Not Interpreted"
            }]
          }],
          "note" : [{
            "text" : "Patienten har været ud og går lige inden målingen."
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Observation/8917f29d-269c-4bb3-8ce9-d255c351d52b",
        "resource" : {
          "resourceType" : "Observation",
          "id" : "8917f29d-269c-4bb3-8ce9-d255c351d52b",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Observation_8917f29d-269c-4bb3-8ce9-d255c351d52b\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation 8917f29d-269c-4bb3-8ce9-d255c351d52b</b></p><a name=\"8917f29d-269c-4bb3-8ce9-d255c351d52b\"> </a><a name=\"hc8917f29d-269c-4bb3-8ce9-d255c351d52b\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecare-observation.html\">MedComHomeCareObservation</a></p></div><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{urn:oid:1.2.208.176.2.1 DNK05472}\">Arm—Blodtryk(systolisk); tryk = ? mmHg</span></p><p><b>subject</b>: <a href=\"Patient-bbcd4817-1c4b-4089-a712-346f65ec16f9.html\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</a></p><p><b>effective</b>: 2023-09-13 09:24:10+0200</p><p><b>value</b>: 147 mmHg</p><p><b>interpretation</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></p></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "urn:oid:1.2.208.176.2.1",
              "code" : "DNK05472",
              "display" : "Arm—Blodtryk(systolisk); tryk = ? mmHg"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "effectiveDateTime" : "2023-09-13T09:24:10+02:00",
          "valueQuantity" : {
            "value" : 147,
            "unit" : "mmHg"
          },
          "interpretation" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes",
              "code" : "NI",
              "display" : "Not Interpreted"
            }]
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Observation/6bf03841-8397-4a2a-9f9a-8966b0cfa571",
        "resource" : {
          "resourceType" : "Observation",
          "id" : "6bf03841-8397-4a2a-9f9a-8966b0cfa571",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Observation_6bf03841-8397-4a2a-9f9a-8966b0cfa571\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation 6bf03841-8397-4a2a-9f9a-8966b0cfa571</b></p><a name=\"6bf03841-8397-4a2a-9f9a-8966b0cfa571\"> </a><a name=\"hc6bf03841-8397-4a2a-9f9a-8966b0cfa571\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecare-observation.html\">MedComHomeCareObservation</a></p></div><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes MCS88126}\">Pt—Bevidsthedsniveau; arb.antal(værdi 0-3) = ?</span></p><p><b>subject</b>: <a href=\"Patient-bbcd4817-1c4b-4089-a712-346f65ec16f9.html\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</a></p><p><b>effective</b>: 2023-09-13 09:24:11+0200</p><p><b>value</b>: 0 1<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code1 = '1')</span></p><p><b>interpretation</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></p></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes",
              "code" : "MCS88126"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "effectiveDateTime" : "2023-09-13T09:24:11+02:00",
          "valueQuantity" : {
            "value" : 0,
            "system" : "http://unitsofmeasure.org",
            "code" : "1"
          },
          "interpretation" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes",
              "code" : "NI",
              "display" : "Not Interpreted"
            }]
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Observation/85fd1372-cf02-49c6-bd45-7205f5541a66",
        "resource" : {
          "resourceType" : "Observation",
          "id" : "85fd1372-cf02-49c6-bd45-7205f5541a66",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Observation_85fd1372-cf02-49c6-bd45-7205f5541a66\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation 85fd1372-cf02-49c6-bd45-7205f5541a66</b></p><a name=\"85fd1372-cf02-49c6-bd45-7205f5541a66\"> </a><a name=\"hc85fd1372-cf02-49c6-bd45-7205f5541a66\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecare-observation.html\">MedComHomeCareObservation</a></p></div><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{urn:oid:1.2.208.176.2.1 NPU08676}\">Pt—Legeme; temp. = ? °C</span></p><p><b>subject</b>: <a href=\"Patient-bbcd4817-1c4b-4089-a712-346f65ec16f9.html\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</a></p><p><b>effective</b>: 2023-09-13 09:24:12+0200</p><p><b>value</b>: 38.7 °C</p><p><b>interpretation</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></p></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "urn:oid:1.2.208.176.2.1",
              "code" : "NPU08676",
              "display" : "Pt—Legeme; temp. = ? °C"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "effectiveDateTime" : "2023-09-13T09:24:12+02:00",
          "valueQuantity" : {
            "value" : 38.7,
            "unit" : "°C"
          },
          "interpretation" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes",
              "code" : "NI",
              "display" : "Not Interpreted"
            }]
          }]
        }
      },
      {
        "fullUrl" : "http://medcomfhir.dk/ig/homecareobservation/Observation/f64a0a78-53cf-4a7f-9b89-4a2338a4935c",
        "resource" : {
          "resourceType" : "Observation",
          "id" : "f64a0a78-53cf-4a7f-9b89-4a2338a4935c",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/homecareobservation/StructureDefinition/medcom-homecare-observation"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Observation_f64a0a78-53cf-4a7f-9b89-4a2338a4935c\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Observation f64a0a78-53cf-4a7f-9b89-4a2338a4935c</b></p><a name=\"f64a0a78-53cf-4a7f-9b89-4a2338a4935c\"> </a><a name=\"hcf64a0a78-53cf-4a7f-9b89-4a2338a4935c\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-medcom-homecare-observation.html\">MedComHomeCareObservation</a></p></div><p><b>status</b>: Final</p><p><b>code</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes MCS88125}\">Pt—Tidlig Opsporing af Begyndende Sygdom (TOBS) score; antal (værdi 0-15) = ?</span></p><p><b>subject</b>: <a href=\"Patient-bbcd4817-1c4b-4089-a712-346f65ec16f9.html\">Elmer (official) (no stated gender), DoB Unknown ( urn:oid:1.2.208.176.1.2#2509479989)</a></p><p><b>effective</b>: 2023-09-13 09:24:13+0200</p><p><b>value</b>: 3 1<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code1 = '1')</span></p><p><b>interpretation</b>: <span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes NI}\">Not Interpreted</span></p></div>"
          },
          "status" : "final",
          "code" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-observation-codes",
              "code" : "MCS88125"
            }]
          },
          "subject" : {
            "reference" : "Patient/bbcd4817-1c4b-4089-a712-346f65ec16f9"
          },
          "effectiveDateTime" : "2023-09-13T09:24:13+02:00",
          "valueQuantity" : {
            "value" : 3,
            "system" : "http://unitsofmeasure.org",
            "code" : "1"
          },
          "interpretation" : [{
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-core-interpretation-codes",
              "code" : "NI",
              "display" : "Not Interpreted"
            }]
          }]
        }
      }]
    }