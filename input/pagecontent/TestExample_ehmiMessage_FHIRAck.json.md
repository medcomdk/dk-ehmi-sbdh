# Example Bundle: 401cbc36-db1e-4fe0-bf90-6df331dde179

[This example is also represented here more comprehensive in different formats](https://build.fhir.org/ig/medcomdk/dk-ehmi-sbdh/Bundle-9597e34d-f90f-439d-bc79-ca7d91944d8b)

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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Empty</div>"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Empty</div>"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Empty</div>"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Empty</div>"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Empty</div>"
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