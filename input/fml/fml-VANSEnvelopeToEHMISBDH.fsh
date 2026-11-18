map "http://medcomehmi.dk" = "VANSEnvelopeToEHMISBDH"

uses "http://medcomfhir.dk" alias VANS as source
uses "http://medcomehmi.dk" alias SBDH as target

group TransformEnvelope(source src : VANS, target tgt : SBDH) {
  src.message as msg -> tgt.standardBusinessDocument as sbd then {
    sbd.standardBusinessDocumentHeader as hdr then {
      hdr.headerVersion = '1.0';
      
      // Routing (Afsender og Modtager)
      msg.metaInformation as meta then {
        meta.sender as vSender -> hdr.sender as sSender then {
          vSender.identifier -> sSender.identifier;
        };
        meta.receiver as vReceiver -> hdr.receiver as sReceiver then {
          vReceiver.identifier -> sReceiver.identifier;
        };
        
        // Dokument-identifikation
        meta.document as doc -> hdr.documentIdentification as docId then {
          docId.standard = 'urn:dk:healthcare:medcom:messaging:fhir';
          doc.name -> docId.type;
          doc.version -> docId.typeVersion;
          doc.messageId -> docId.instanceIdentifier;
          doc.timestamp -> docId.creationDateAndTime;
        };

        // Reliable Messaging -> BusinessScope
        meta.transport as tr -> hdr.businessScope as bs then {
          tr.reliableMessaging as rm -> bs.scope as sc then {
            sc.type = 'EHMI_RELIABLE_MESSAGING';
            sc.instanceIdentifier = 'urn:dk:healthcare:medcom:messaging:rm:v1';
            rm -> sc.correlationInformation as ci then {
              rm.originalMessageId -> ci.requestingDocumentInstanceIdentifier;
              rm.timeToLive -> ci.expectedResponseDateTime;
            };
          };
        };
      };
    };

    // Payload og MIME-type fra ServiceTag
    msg -> sbd.payload as pl then {
      msg.data -> pl.content;
      msg.metaInformation.transport.serviceTag.where(name = 'MCM:MIME').value.first() as mime -> pl.mimeType = mime;
    };
  };
}
