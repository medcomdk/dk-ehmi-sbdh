map "http://medcomehmi.dk" = "EHMISBDHToVANSEnvelope"

uses "http://medcomehmi.dk" alias SBDH as source
uses "http://medcomfhir.dk" alias VANS as target

group TransformSBDHToVANS(source src : SBDH, target tgt : VANS) {
  src.standardBusinessDocument as sbd -> tgt.message as msg then {
    sbd.standardBusinessDocumentHeader as hdr -> msg.metaInformation as meta then {
      
      // Routing (første afsender/modtager)
      hdr.sender.first() as sSender -> meta.sender as vSender then {
        sSender.identifier -> vSender.identifier;
      };
      hdr.receiver.first() as sReceiver -> meta.receiver as vReceiver then {
        sReceiver.identifier -> vReceiver.identifier;
      };

      // Dokument-metadata
      hdr.documentIdentification as docId -> meta.document as vDoc then {
        vDoc.format = 'FHIR';
        docId.type -> vDoc.name;
        docId.typeVersion -> vDoc.typeVersion;
        docId.instanceIdentifier -> vDoc.messageId;
        docId.creationDateAndTime -> vDoc.timestamp;
      };

      // Transport, Reliable Messaging & MCM:MIME ServiceTag
      hdr -> meta.transport as tr then {
        tr.reliableMessaging as vRm then {
          vRm.acknowledgementRequest = true;
          hdr.businessScope.scope.where(type = 'EHMI_RELIABLE_MESSAGING').correlationInformation.requestingDocumentInstanceIdentifier.first() as origId -> vRm.originalMessageId = origId;
          hdr.businessScope.scope.where(type = 'EHMI_RELIABLE_MESSAGING').correlationInformation.expectedResponseDateTime.first() as ttl -> vRm.timeToLive = ttl;
        };
        sbd.payload as pl -> tr.serviceTag as st then {
          st.name = 'MCM:MIME';
          pl.mimeType -> st.value;
        };
      };
    };

    // Payload Data
    sbd.payload as pl then {
      pl.content -> msg.data;
    };
  };
}
