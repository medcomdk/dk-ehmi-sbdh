# Mapping from IHE XDS metadata to FHIR

This table describes the mapping between the <a href="https://svn.medcom.dk/svn/releases/Standarder/IHE/DK_profil_metadata/" target="_blank">IHE XDS metadata</a> and FHIR DocumentReference, FHIR Messaging resources and FHIR Bundle of type Document, which are all found in the <a href="https://medcomfhir.dk/ig/document/profiles.html" target="_blank">MedCom Document IG</a>. 
The purpose of this mapping is to show how information from IHE XDS Metadata corresponds to the elements in a MedCom FHIR Message. 
<!--Mapping to the FHIR resources Composition and Bundle ensures that the requirements are adhered to in the FHIR documents, as the metadata information must also be included in the FHIR document. This ensures consistency and integrity between the two standards. -->
The table illustrates the relevant elements and their corresponding counterparts in FHIR, where such exist.

<!-- The purpose of this table is to help implementers of FHIR. The actual implementation guides, which includes all requirements for the profiles can be found in the <a href="https://medcomfhir.dk/ig/document/profiles.html" target="_blank">MedCom Document IG</a>.-->

> Please notice, not all elements from the FHIR profiles are represented in the mapping and therefore it cannot stand alone for implementation. Attributes which are not used in the IHE XDS metadata standard are not included in the mapping.

The table contains: 
* 1.: Data elements from the metadata in the <a href="https://svn.medcom.dk/svn/releases/Standarder/IHE/DK_profil_metadata/" target="_blank">IHE XDS metadata standard version 2</a>.
* 2.: Optionalities for the data elements from the IHE XDS metadata standard.
* 3.: Data elements from the <a href="https://medcomfhir.dk/ig/document/StructureDefinition-medcom-documentreference.html" target="_blank">MedComDocumentReference profile</a>. This profile is not a part of the standard nor the metadata, but may be used for validation of the metadata.
* 4.: Optionalities for the data elements from the MedComDocumentReference.
* 5.: Data elements from the MedCom Messaging Resources.
* 6.: Data elements from the MedComDocumentBundle profile.
* 7.: Optionalities for the data elements in MedComDocumentComposition and MedComDocumentBundle.


<style type="text/css">
/* Tabel – responsiv og læsbar */
.tg{
  border-collapse:collapse;
  border-spacing:0;
  width:100%;
  table-layout:auto;
}

/* Alle celler */
.tg td,
.tg th{
  border:1px solid #000;
  font-family:Arial, sans-serif;
  font-size:14px;
  padding:10px 8px;

  /* KRITISK: forhindrer at overskrifter klippes */
  overflow:visible;
  white-space:normal;
  overflow-wrap:anywhere;
  word-break:break-word;
  hyphens:auto;

  vertical-align:top;
}

/* Overskrifter tydeligere */
.tg th{
  font-weight:bold;
}

/* Bevar dine eksisterende farver/klasser */
.tg .tg-ippy{color:#2c415c;text-align:left}
.tg .tg-ztr9{color:#2c415c;font-weight:bold;text-align:left}
.tg .tg-1ady{background-color:#9dbad7;color:#333;text-align:left}
.tg .tg-on52{color:#333;text-align:left}

.tg tbody th{
  font-weight: normal;
}
</style>
<div style="overflow-x:auto;">
<table class="tg" id="Tab1">
<caption style="font-weight:bold">Table 1: Mapping from IHE-XDS metadata to FHIR DocumentReference, and FHIR Composition.</caption>
<thead>
  <tr>
    <th><span style="font-weight:bold">IHE-XDS metadata</span></th>
    <th><span style="font-weight:bold">Optionality IHE-XDS metadata</span></th>
    <th><span style="font-weight:bold">MedComDocumentReference</span></th>
    <th><span style="font-weight:bold">Cardinality MedComDocumentReference</span></th>
    <th><span style="font-weight:bold">MedComMessaging Resources</span></th>
    <th><span style="font-weight:bold">MedComMessagingBundle</span></th>
    <th><span style="font-weight:bold">Cardinality MedComDocumentComposition or MedComDocumentBundle</span></th>
  </tr>
</thead>
<tbody>

<tr>
  <td></td>
  <td></td>
  <td>Contained resources</td>
  <td>3:3</td>
  <td> 3 contained resources:
    <br/> - Bundle.Practitioner (Cast to "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-organization")
    <br/> - Bundle.Organization[Sender] (Cast to "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-organization")
    <br/> - Patient (Cast to "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-patient")
  </td>
  <td></td>
  <td></td>
</tr>

<tr>
  <td></td>
  <td></td>
  <td>extension</td>
  <td>1:1</td>
  <td> 1 extension:
    <br/> - extension-DocumentReference.version
    <br/> - Static value
    <br/>   - "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version",
    <br/>   - "valueString" : "2.0"
  </td>
  <td></td>
  <td></td>
</tr>


<tr>
  <td>author</td>
  <td>R</td>
  <td>author</td>
  <td>1..2</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>1..2</td>
</tr>

<tr>
  <td>author.authorInstitution</td>
  <td>R</td>
  <td>author:institution(MedComDocumentOrganization)</td>
  <td>1..1</td>
  <td>Reference(Sender:Organization)(Cast to MedComDocumentOrganization)</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<!--tr>
  <td>author.authorPerson</td>
  <td>R2</td>
  <td>author(MedComDocumentPractitioner | MedComDocumentPractitionerRole | Device | MedComDocumentPatient | DkCoreRelatedPerson)</td>
  <td>0..1</td>
  <td>author(MedComDocumentPractitioner | MedComDocumentPractitionerRole | Device | MedComDocumentPatient | DkCoreRelatedPerson)</td>
  <td>N/A</td>
  <td>0..1</td>
</tr-->

<tr>
  <td>availabilityStatus (Approved | Deprecated)<a href="#section1">[1]</a></td>
  <td>R</td>
  <td>status(current | superseded)</td>
  <td>1..1</td>
  <td>Static: "current"</td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<tr>
  <td>classCode</td>
  <td>R</td>
  <td>category</td>
  <td>1..1</td>
  <td>Static: 
    <br/> - system : "urn:oid:1.2.208.184.100.9",
    <br/> - code : "006",
    <br/> - display : "Workflow"
    <br/> - <a target="_blank" href="https://build.fhir.org/ig/medcomdk/dk-medcom-xds-metadata/branches/2.0/ValueSet-MedCom-xds-classcode-VS.html">classCode-valueset</a></td>
  <td>N/A</td>
  <td>0..1</td>
</tr>

<tr>
  <td>confidentialityCode</td>
  <td>R</td>
  <td>securityLabel</td>
  <td>1..1</td>
  <td>Static: <br/>N</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>creationTime</td>
  <td>R</td>
  <td>content.attachment.creation</td>
  <td>1..1</td>
  <td>N/A</td>
  <td>Bundle.timestamp</td>
  <td>1..1</td>
</tr>

<tr>
  <td>entryUUID<a href="#section1">[1]</a></td>
  <td>R</td>
  <td>identifier:entryUUID</td>
  <td>1..1</td>
  <td>N/A</td>
  <td>(MedCom recommends using Bundle.id as EntryUUID)</td>
  <td>N/A</td>
</tr>

<!--tr>
  <td>eventCodeList</td>
  <td>R2</td>
  <td>context.event</td>
  <td>0..*</td>
  <td>event.code</td>
  <td>N/A</td>
  <td>0..*</td>
</tr-->

<tr>
  <td>typeCode</td>
  <td>R</td>
  <td>type</td>
  <td>1..1</td>
  <td>Static: 
    <br/> - system : "urn:oid:1.2.208.184.100.1",
    <br/> - code : "HCOM",
    <br/> - display : "HomeCareObservation message"
    <br/> - <a target="_blank" href="https://build.fhir.org/ig/medcomdk/dk-medcom-xds-metadata/branches/2.0/ValueSet-MedCom-xds-typecode-VS.html">typeCode-valueset</a></td>
  </td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>formatCode</td>
  <td>R</td>
  <td>content.format</td>
  <td>1..1</td>
  <td>Static: 
    <br/> - system : "urn:oid:1.2.208.184.100.10",
    <br/> - code : "urn:ad:dk:medcom:hcom-v1.2:full",
    <br/> - display : "DK HomeCareObservation message"
    <br/> - <a target="_blank" href="https://build.fhir.org/ig/medcomdk/dk-medcom-xds-metadata/branches/2.0/ValueSet-MedCom-xds-formatcode-VS.html">formatCode-valueset</a></td>
  </td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>hash<a href="#section1">[1]</a><a href="#section2">[2]</a></td>
  <td>R2</td>
  <!--<td>O</td>-->
  <td>content.attachment.hash</td>
  <td>0..1</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<tr>
  <td>healthcareFacilityTypeCode</td>
  <td>R</td>
  <td>context.facilityType</td>
  <td>1..1</td>
  <td>Dynamic lookup in SOR for "enhedstype" based on Sender:Organization.sorcode, f.eks
    <br/> - system : "http://snomed.info/sct",
    <br/> - version : "http://snomed.info/sct/554471000005108",
    <br/> - code : "550621000005101",
    <br/> - display : "hjemmesygeplejeenhed"
  </td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<tr>
  <td>homeCommunityId <a href="#section1">[1]</a></td>
  <td>R</td>
  <td>extension:homeCommunityid</td>
  <td>0..1</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<tr>
  <td>languageCode</td>
  <td>R</td>
  <td>content.attachment.language</td>
  <td>1..1</td>
  <td>Static: "da"</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>legalAuthenticator</td>
  <td>R2</td>
  <td>authenticator</td>
  <td>0..1</td>
  <td>Reference(Practitioner)</td>
  <td>N/A</td>
  <td></td>
</tr>

<tr>
  <td>mimeType <a href="#section1">[1]</a></td>
  <td>R</td>
  <td>content.attachment.contentType</td>
  <td>1..1</td>
  <td>Static:
    <br/> - application/fhir+xml eller application/fhir+json
    <br/> - <a target="_blank" href="https://build.fhir.org/ig/medcomdk/dk-medcom-xds-metadata/branches/2.0/ValueSet-MedCom-xds-mimetype-fhir-VS.html">MedCom-xds-mimetype-fhir-valueset</a></td>
  </td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<!--tr>
  <td>objectType <a href="#section1">[1]</a></td>
  <td>R</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
</tr-->

<tr>
  <td>patientId</td>
  <td>R</td>
  <td>subject(MedComDocumentPatient)</td>
  <td>1..1</td>
  <td>Reference(Bundle.Patient)(cast to MedComDocumentPatient)</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>practiceSettingCode</td>
  <td>R</td>
  <td>context.practiceSetting</td>
  <td>1..1</td>
  <td>Dynamic lookup in SOR for "Speciale" based on Sender:Organization.sorcode, f.eks
    <br/> - system : "http://snomed.info/sct",
    <br/> - version : "http://snomed.info/sct/554471000005108",
    <br/> - code : "658161000005107",
    <br/> - display : "hjemmesygepleje"
   </td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<!--tr>
  <td>referenceIdList</td>
  <td>O</td>
  <td>context.related</td>
  <td>0..*</td>
  <td>event.detail</td>
  <td>N/A</td>
  <td>0..*</td>
</tr!-->

<tr>
  <td>repositoryUniqueId <a href="#section1">[1]</a></td>
  <td>R</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<tr>
  <td>serviceStartTime</td>
  <td>R2</td>
  <td>context.period.start</td>
  <td>1..1</td>
  <td>Bundle.timestamp</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<!--tr>
  <td>serviceStopTime</td>
  <td>R2</td>
  <td>context.period.end</td>
  <td>0..1</td>
  <td>event.period.end</td>
  <td>N/A</td>
  <td>0..1</td>
</tr-->

<!--tr>
  <td>size<a href="#section1">[1]</a><a href="#section2">[2]</a></td>
  <td>R2</td>
  <td>content.attachment.size</td>
  <td>0..1</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
</tr-->

<tr>
  <td>sourcePatientId</td>
  <td>R</td>
  <td>context.sourcePatientInfo.identifier</td>
  <td>1..1</td>
  <td>Bundle.Patient.identifier:cpr(cast to MedComDocumentPatient.identifier:cpr)</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>sourcePatientInfo</td>
  <td>R</td>
  <td>context.sourcePatientInfo(MedComDocumentPatient)</td>
  <td>1..1</td>
  <td>Bundle.Patient(cast to MedComDocumentPatient)</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>submissionTime <a href="#section1">[1]</a><a href="#section3">[3]</a></td>
  <td>R</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

<tr>
  <td>title</td>
  <td>R</td>
  <td>content.attachment.title</td>
  <td>1..1</td>
  <td>Static+Dynamic: "Kommunale prøvesvar for " + Patient.identifier</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>uniqueId</td>
  <td>R</td>
  <td>masterIdentifier</td>
  <td>1..1</td>
  <td>identifier</td>
  <td>N/A</td>
  <td>1..1</td>
</tr>

<tr>
  <td>URI <a href="#section1">[1]</a></td>
  <td>O</td>
  <td>content.attachment.url</td>
  <td>1..1</td>
  <td>= title</td>
  <td>N/A</td>
  <td>N/A</td>
</tr>

</tbody>
</table>

</div>
<br><br>

<p id="section1">[1] Information for this attribute is not expected to be in the document.</p>
<p id="section2">[2] According to the IHE XDS metadata standard, this attribute is prohibited for On Demand documents</p>
<p id="section3">[3] SubmissionTime is not mapped to DocumentReference, Composition, or the Bundle. The value will be available in the Transaction Bundle once submission via FHIR-based infrastructure is introduced.</p>