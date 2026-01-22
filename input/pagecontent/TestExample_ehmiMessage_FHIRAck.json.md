# Example Bundle: 401cbc36-db1e-4fe0-bf90-6df331dde179

[This example is also represented here in more comprehensive in different formats](Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b.json.html)

    {
      "resourceType" : "Bundle",
      "id" : "9597e34d-f90f-439d-bc79-ca7d91944d8b",
      "meta" : {
        "profile" : ["http://medcomfhir.dk/ig/acknowledgement/StructureDefinition/medcom-messaging-acknowledgement"]
      },
      "type" : "message",
      "timestamp" : "2023-09-13T12:25:00+02:00",
      "entry" : [{
        "fullUrl" : "MessageHeader/aba2d9bf-2c6c-47e8-bce4-7928bcd51019",
        "resource" : {
          "resourceType" : "MessageHeader",
          "id" : "aba2d9bf-2c6c-47e8-bce4-7928bcd51019",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/acknowledgement/StructureDefinition/medcom-messaging-acknowledgementHeader"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MessageHeader_aba2d9bf-2c6c-47e8-bce4-7928bcd51019\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MessageHeader aba2d9bf-2c6c-47e8-bce4-7928bcd51019</b></p><a name=\"aba2d9bf-2c6c-47e8-bce4-7928bcd51019\"> </a><a name=\"hcaba2d9bf-2c6c-47e8-bce4-7928bcd51019\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <code>http://medcomfhir.dk/ig/acknowledgement/StructureDefinition/medcom-messaging-acknowledgementHeader</code></p></div><p><b>event</b>: <a href=\"http://medcomfhir.dk/ig/terminology/2.0.2/CodeSystem-medcom-messaging-eventCodes.html#medcom-messaging-eventCodes-acknowledgement-message\">MedComMessagingEventCodes: acknowledgement-message</a> (Acknowledgement Message)</p><h3>Destinations</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Endpoint</b></td><td><b>Receiver</b></td></tr><tr><td style=\"display: none\">*</td><td/><td><a href=\"https://sor2.sum.dsdn.dk/#id=1144561000016002\">https://sor2.sum.dsdn.dk/#id=1144561000016002</a></td><td><a href=\"Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b.html#Organization_ef5cb9a6-835f-4d18-a34e-179c578b9a2a\">Organization Sender Organization</a></td></tr></table><p><b>sender</b>: <a href=\"Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b.html#Organization_42541447-b58c-4a1a-9514-02b80494bbd3\">Organization Receiver Organization</a></p><h3>Sources</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Endpoint</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"https://sor2.sum.dsdn.dk/#id=52581000016005\">https://sor2.sum.dsdn.dk/#id=52581000016005</a></td></tr></table><h3>Responses</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Identifier</b></td><td><b>Code</b></td></tr><tr><td style=\"display: none\">*</td><td>8dbf63f4-b784-4d40-8802-c1bdb1ecfa63</td><td>OK</td></tr></table><p><b>definition</b>: <code>http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComAcknowledgementMessageDefinition|2.0</code></p></div>"
          },
          "eventCoding" : {
            "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-eventCodes",
            "code" : "acknowledgement-message"
          },
          "destination" : [{
            "extension" : [{
              "url" : "http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-destinationUseExtension",
              "valueCoding" : {
                "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-destinationUse",
                "code" : "primary"
              }
            }],
            "endpoint" : "https://sor2.sum.dsdn.dk/#id=1144561000016002",
            "receiver" : {
              "reference" : "Organization/ef5cb9a6-835f-4d18-a34e-179c578b9a2a"
            }
          }],
          "sender" : {
            "reference" : "Organization/42541447-b58c-4a1a-9514-02b80494bbd3"
          },
          "source" : {
            "endpoint" : "https://sor2.sum.dsdn.dk/#id=52581000016005"
          },
          "response" : {
            "identifier" : "8dbf63f4-b784-4d40-8802-c1bdb1ecfa63",
            "code" : "ok"
          },
          "definition" : "http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComAcknowledgementMessageDefinition|2.0"
        }
      },
      {
        "fullUrl" : "Provenance/4c284936-5454-4116-95fc-3c8eeeed2400",
        "resource" : {
          "resourceType" : "Provenance",
          "id" : "4c284936-5454-4116-95fc-3c8eeeed2400",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-provenance"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Provenance_4c284936-5454-4116-95fc-3c8eeeed2400\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Provenance 4c284936-5454-4116-95fc-3c8eeeed2400</b></p><a name=\"4c284936-5454-4116-95fc-3c8eeeed2400\"> </a><a name=\"hc4c284936-5454-4116-95fc-3c8eeeed2400\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/4.0.1/StructureDefinition-medcom-messaging-provenance.html\">MedComMessagingProvenance</a></p></div><p>Provenance for <a href=\"MessageHeader/8dbf63f4-b784-4d40-8802-c1bdb1ecfa63\">MessageHeader/8dbf63f4-b784-4d40-8802-c1bdb1ecfa63</a></p><p>Summary</p><table class=\"grid\"><tr><td>Occurrence</td><td>2023-09-13 12:24:20+0200</td></tr><tr><td>Recorded</td><td>2023-09-13 12:24:20+0200</td></tr><tr><td>Activity</td><td><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes new-message}\">A new message has been sent</span></td></tr></table><p><b>Agents</b></p><table class=\"grid\"><tr><td><b>who</b></td></tr><tr><td><a href=\"Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b.html#Organization_ef5cb9a6-835f-4d18-a34e-179c578b9a2a\">Organization Sender Organization</a></td></tr></table></div>"
          },
          "target" : [{
            "reference" : "MessageHeader/8dbf63f4-b784-4d40-8802-c1bdb1ecfa63"
          }],
          "occurredDateTime" : "2023-09-13T12:24:20+02:00",
          "recorded" : "2023-09-13T12:24:20+02:00",
          "activity" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes",
              "code" : "new-message"
            }]
          },
          "agent" : [{
            "who" : {
              "reference" : "Organization/ef5cb9a6-835f-4d18-a34e-179c578b9a2a"
            }
          }]
        }
      },
      {
        "fullUrl" : "Provenance/69dab277-dd4b-4055-9fda-a10a65cb4412",
        "resource" : {
          "resourceType" : "Provenance",
          "id" : "69dab277-dd4b-4055-9fda-a10a65cb4412",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-provenance"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Provenance_69dab277-dd4b-4055-9fda-a10a65cb4412\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Provenance 69dab277-dd4b-4055-9fda-a10a65cb4412</b></p><a name=\"69dab277-dd4b-4055-9fda-a10a65cb4412\"> </a><a name=\"hc69dab277-dd4b-4055-9fda-a10a65cb4412\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/4.0.1/StructureDefinition-medcom-messaging-provenance.html\">MedComMessagingProvenance</a></p></div><p>Provenance for <a href=\"Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b.html#MessageHeader_aba2d9bf-2c6c-47e8-bce4-7928bcd51019\">MessageHeader: event[x] = Acknowledgement Message (MedComMessagingEventCodes#acknowledgement-message); definition = http://medcomfhir.dk/ig/messagedefinitions/MessageDefinition/MedComAcknowledgementMessageDefinition|2.0</a></p><p>Summary</p><table class=\"grid\"><tr><td>Occurrence</td><td>2023-09-13 12:25:00+0200</td></tr><tr><td>Recorded</td><td>2023-09-13 12:25:00+0200</td></tr><tr><td>Activity</td><td><span title=\"Codes:{http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes acknowledgement}\">Acknowledgement message has been sent</span></td></tr></table><p><b>Agents</b></p><table class=\"grid\"><tr><td><b>who</b></td></tr><tr><td><a href=\"Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b.html#Organization_42541447-b58c-4a1a-9514-02b80494bbd3\">Organization Receiver Organization</a></td></tr></table></div>"
          },
          "target" : [{
            "reference" : "MessageHeader/aba2d9bf-2c6c-47e8-bce4-7928bcd51019"
          }],
          "occurredDateTime" : "2023-09-13T12:25:00+02:00",
          "recorded" : "2023-09-13T12:25:00+02:00",
          "activity" : {
            "coding" : [{
              "system" : "http://medcomfhir.dk/ig/terminology/CodeSystem/medcom-messaging-activityCodes",
              "code" : "acknowledgement"
            }]
          },
          "agent" : [{
            "who" : {
              "reference" : "Organization/42541447-b58c-4a1a-9514-02b80494bbd3"
            }
          }],
          "entity" : [{
            "role" : "revision",
            "what" : {
              "reference" : "MessageHeader/8dbf63f4-b784-4d40-8802-c1bdb1ecfa63"
            }
          }]
        }
      },
      {
        "fullUrl" : "Organization/ef5cb9a6-835f-4d18-a34e-179c578b9a2a",
        "resource" : {
          "resourceType" : "Organization",
          "id" : "ef5cb9a6-835f-4d18-a34e-179c578b9a2a",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-organization"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_ef5cb9a6-835f-4d18-a34e-179c578b9a2a\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization ef5cb9a6-835f-4d18-a34e-179c578b9a2a</b></p><a name=\"ef5cb9a6-835f-4d18-a34e-179c578b9a2a\"> </a><a name=\"hcef5cb9a6-835f-4d18-a34e-179c578b9a2a\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/4.0.1/StructureDefinition-medcom-messaging-organization.html\">MedComMessagingOrganization</a></p></div><p><b>identifier</b>: <code>https://www.gs1.org/gln</code>/5790000123117, <code>urn:oid:1.2.208.176.1.1</code>/1144561000016002</p><p><b>name</b>: Sender Organization</p></div>"
          },
          "identifier" : [{
            "system" : "https://www.gs1.org/gln",
            "value" : "5790000123117"
          },
          {
            "system" : "urn:oid:1.2.208.176.1.1",
            "value" : "1144561000016002"
          }],
          "name" : "Sender Organization"
        }
      },
      {
        "fullUrl" : "Organization/42541447-b58c-4a1a-9514-02b80494bbd3",
        "resource" : {
          "resourceType" : "Organization",
          "id" : "42541447-b58c-4a1a-9514-02b80494bbd3",
          "meta" : {
            "profile" : ["http://medcomfhir.dk/ig/messaging/StructureDefinition/medcom-messaging-organization"]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_42541447-b58c-4a1a-9514-02b80494bbd3\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization 42541447-b58c-4a1a-9514-02b80494bbd3</b></p><a name=\"42541447-b58c-4a1a-9514-02b80494bbd3\"> </a><a name=\"hc42541447-b58c-4a1a-9514-02b80494bbd3\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://medcomfhir.dk/ig/messaging/4.0.1/StructureDefinition-medcom-messaging-organization.html\">MedComMessagingOrganization</a></p></div><p><b>identifier</b>: <code>https://www.gs1.org/gln</code>/5790000127092, <code>urn:oid:1.2.208.176.1.1</code>/52581000016005</p><p><b>name</b>: Receiver Organization</p></div>"
          },
          "identifier" : [{
            "system" : "https://www.gs1.org/gln",
            "value" : "5790000127092"
          },
          {
            "system" : "urn:oid:1.2.208.176.1.1",
            "value" : "52581000016005"
          }],
          "name" : "Receiver Organization"
        }
      }]
    }