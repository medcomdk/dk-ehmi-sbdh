map "http://medcomehmi.dk" = "VANSReceiptToEHMISBDHReceipt"

uses "http://medcomfhir.dk" alias VANSRec as source
uses "http://medcomehmi.dk" alias SBDHRec as target

imports "http://medcomehmi.dk"

group TransformVANSReceiptToSBDH(source src : VANSRec, target tgt : SBDHRec) {
  src.receipt as vRec -> tgt.receiptEnvelope as sRec then {
    vRec.metaInformation as vMeta -> sRec.header as sHdr then {
      vMeta.sender.identifier -> sHdr.sender;
      vMeta.receiver.identifier -> sHdr.receiver;

      vMeta.reference as vRef -> sHdr.documentIdentification as sDoc then {
        sDoc.standard = 'urn:dk:healthcare:medcom:messaging:fhir';
        sDoc.typeVersion = '2.0.2';
        sDoc.type = 'edsBasicDeliveryStatus';
        vRef.receiptId -> sDoc.instanceIdentifier;
        vRef.timestamp -> sDoc.creationDateAndTime;
      };

      vMeta.reference as vRef -> sHdr.businessScope as sBs then {
        vRef.originalMessageId -> sBs.originalEnvelopeId;
        sBs.processId = 'urn:dk:healthcare:medcom:messaging:process:acknowledgement';
      };
    };

    vRec.status as vStat -> sRec.status as sStat then {
      sStat.statusCategory = 'EDS';
      vStat.statusCode as code -> sStat.outcome = translate(code, 'http://medcomehmi.dk', 'code');
      vRec.metaInformation.reference.timestamp -> sStat.timestamp;

      vStat.error as vErr -> sStat.errorDetails as sErr then {
        vErr.errorCode -> sErr.errorCode;
        vErr.errorMessage -> sErr.errorDescription;
      };
    };
  };
}
