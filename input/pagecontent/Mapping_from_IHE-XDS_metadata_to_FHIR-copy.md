# Mapping from IHE XDS metadata to FHIR - copy

This table describes the mapping between the <a href="https://svn.medcom.dk/svn/releases/Standarder/IHE/DK_profil_metadata/" target="_blank">IHE XDS metadata</a> and FHIR DocumentReference, FHIR Messaging resources, which are all found in the <a href="https://medcomfhir.dk/ig/messaging/profiles.html" target="_blank">MedCom Messaging IG</a>. 
The purpose of this mapping is to show how information from IHE XDS Metadata corresponds to the elements in a MedCom FHIR Message. 
<!--Mapping to the FHIR resources Composition and Bundle ensures that the requirements are adhered to in the FHIR documents, as the metadata information must also be included in the FHIR document. This ensures consistency and integrity between the two standards. -->
The table illustrates the relevant elements and their corresponding counterparts in FHIR, where such exist.

<!-- The purpose of this table is to help implementers of FHIR. The actual implementation guides, which includes all requirements for the profiles can be found in the <a href="https://medcomfhir.dk/ig/document/profiles.html" target="_blank">MedCom Document IG</a>.-->

> Please notice, not all elements from the FHIR profiles are represented in the mapping and therefore it cannot stand alone for implementation. Attributes which are not used in the IHE XDS metadata standard are not included in the mapping.

The table contains: 
* 1.: Data elements from the <a href="https://medcomfhir.dk/ig/document/StructureDefinition-medcom-documentreference.html" target="_blank">MedComDocumentReference profile</a>. This profile is not a part of the standard nor the metadata, but may be used for validation of the metadata.
* 2.: Optionalities for the data elements from the MedComDocumentReference.
* 3.: Static or dynamic data from a ValueSet. This data is not available from the message.
* 4.: Data element from the MedCom FHIR message, and FHIRPath to the element in the Bundle.
* 5.: Example of content from the HomeCareObservation message. 

<table class="tg" id="Tab1">
<caption style="font-weight:bold">Table 1: Mapping IHE-XDS metadata to FHIR DocumentReference from FHIR MedComMessaging related resources</caption>
<thead>
  <tr>
    <th><span style="font-weight:bold">MedComDocumentReference element</span></th>
    <th><span style="font-weight:bold">Cardinality - MedComDocumentReference</span></th>
    <th><span style="font-weight:bold">Static/Dynamic metadata</span></th>
    <th><span style="font-weight:bold">MedComMessaging related Resources and elements</span></th>
    <th><span style="font-weight:bold">Example from HomeCareObservationMessage</span></th>
  </tr>
</thead>
<tbody>

<tr>
  <td>extension.where(url = 'http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version')</td>
  <td>1..1</td>
  <td>DocumentReference.version
    <br/>   - "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.version",
    <br/>   - "valueString" : "2.0"
  </td>
  <td></td>
  <td></td>
</tr>

<tr>
  <td>extension.where(url = 'http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-homecommunityid-extension')</td>
  <td>0..1</td>
  <td></td>
  <td></td>
  <td></td>
</tr>

<tr>
  <td>masterIdentifier</td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.entry[0].resource.id</td>
  <td></td>
</tr>

<tr>
  <td>identifier:entryUUID</td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.id</td>
  <td></td>
</tr>

<tr>
  <td>status</td>
  <td>1..1</td>
  <td>From statusCode ValueSet</td>
  <td></td>
  <td>"current"</td>
</tr>

<tr>
  <td>type</td>
  <td>1..1</td>
  <td>From typeCode ValueSet</td>
  <td></td>
  <td>
    <br/> - system : "urn:oid:1.2.208.184.100.1",
    <br/> - code : "HCOM",
    <br/> - display : "HomeCareObservation message"
  </td>
</tr>

<tr>
  <td>category</td>
  <td>1..1</td>
  <td>From classCode ValueSet</td>
  <td></td>
  <td>
    <br/> - system : "urn:oid:1.2.208.184.100.9",
    <br/> - code : "006",
    <br/> - display : "Workflow"
  </td>
</tr>

<tr>
  <td>subject 
    <br/> - references a MedComDocumentPatient 
    <br/> - FHIRPath: contained.ofType(Patient)
  </td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.entry.resource.ofType(Patient)</td>
  <td>identifier (CPR-number) and name can be compared</td>
</tr>

<tr>
  <td>author</td>
  <td>1..2</td>
  <td></td>
  <td></td>
  <td></td>
</tr>

<tr>
  <td>author:institution
    <br/> - references a MedComDocumentOrganization. 
    <br/> - FHIRPath: contained.ofType(Organization)
  </td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.entry[0].resource.sender.resolve()</td>
  <td>identifier (SOR-identifier) can be compared</td>
</tr>

<tr>
  <td>author:person
    <br/> - references a MedComDocumentPractitioner. 
    <br/> - FHIRPath: contained.ofType(Practitioner)
  </td>
  <td>0..1</td>
  <td></td>
  <td>Bundle.entry.resource.ofType(Practitioner)</td>
  <td>Name can be compared.</td>
</tr>

<tr>
  <td>authenticator   
    <br/> - references a MedComDocumentOrganization. 
    <br/> - FHIRPath: contained.ofType(Organization)
  </td>
  <td>0..1</td>
  <td></td>
  <td>Bundle.entry[0].resource.sender.resolve()</td>
  <td>identifier (SOR-identifier) can be compared</td>
</tr>

<tr>
  <td>securityLabel</td>
  <td>1..1</td>
  <td>From securityLabel ValueSet</td>
  <td></td>
  <td>"N"</td>
</tr>

<tr>
  <td>content.attachment.contentType</td>
  <td>1..1</td>
  <td>From mimeType ValueSet</td>
  <td></td>
  <td>"application/fhir+xml" or "application/fhir+json", depending on the content.
    </td>
</tr>

<tr>
  <td>content.attachment.language</td>
  <td>1..1</td>
  <td>From languageCode ValueSet</td>
  <td></td>
  <td>"da"</td>
</tr>

<tr>
  <td>content.attachment.url</td>
  <td>1..1</td>
  <td></td>
  <td></td>
  <td>E.g. "HCOM-401cbc36-db1e-4fe0-bf90-6df331dde179.XML"</td>
</tr>

<tr>
  <td>content.attachment.hash</td>
  <td>0..1</td>
  <td></td>
  <td></td>
  <td></td>
</tr>

<tr>
  <td>content.attachment.title</td>
  <td>1..1</td>
  <td>Static value</td>
  <td>+ Dynamic value, E.g. patient identifier: 
    <br/>Bundle.entry.resource.ofType(Patient).identifier.where(system = 'urn:oid:1.2.208.176.1.2').value
  </td>
  <td>E.g. "Kommunale prøvesvar for 2509479989"</td>
</tr>

<tr>
  <td>content.attachment.creation</td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.timestamp</td>
  <td></td>
</tr>

<tr>
  <td>content.format</td>
  <td>1..1</td>
  <td>From formatCode ValueSet</td>
  <td></td>
  <td>
    <br/> - system : "urn:oid:1.2.208.184.100.10",
    <br/> - code : "urn:ad:dk:medcom:hcom-v1.2:full",
    <br/> - display : "DK HomeCareObservation message"
    </td>
</tr>

<tr>
  <td>context.period.start</td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.timestamp</td>
  <td>"2023-09-13T12:24:10+02:00"</td>
</tr>

<tr>
  <td>context.facilityType</td>
  <td>1..1</td>
  <td>Dynamic lookup in SOR for "enhedstype" based on sender SOR-code</td>
  <td>Bundle.entry[0].resource.sender.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value (To get sender SOR-code)
  </td>
  <td>
    <br/> - system : "http://snomed.info/sct",
    <br/> - version : "http://snomed.info/sct/554471000005108",
    <br/> - code : "550621000005101",
    <br/> - display : "hjemmesygeplejeenhed"</td>
</tr>

<tr>
  <td>context.practiceSetting</td>
  <td>1..1</td>
  <td>Dynamic lookup in SOR for "Speciale" based on sender SOR-code</td>
  <td>Bundle.entry[0].resource.sender.resolve().identifier.where(system = 'urn:oid:1.2.208.176.1.1').value (To get sender SOR-code)
  </td>  
  <td><br/> - system : "http://snomed.info/sct",
    <br/> - version : "http://snomed.info/sct/554471000005108",
    <br/> - code : "658161000005107",
    <br/> - display : "hjemmesygepleje"</td>
</tr>

<tr>
  <td>context.sourcePatientInfo
    <br/> - references a MedComDocumentPatient 
    <br/> - FHIRPath: contained.ofType(Patient)
  </td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.entry.resource.ofType(Patient)</td>
  <td>identifier (CPR-number) and name can be compared</td>
</tr>

<tr>
  <td>context.sourcePatientInfo.identifier
    <br/> - references a MedComDocumentPatient 
    <br/> - FHIRPath: contained.ofType(Patient).identifier.value
  </td>
  <td>1..1</td>
  <td></td>
  <td>Bundle.entry.resource.ofType(Patient).identifier.value</td>
  <td>E.g. "2509479989"</td>
</tr>

<tr>
  <td>Contained resources</td>
  <td>2..3</td>
  <td></td>
  <td><b>up to 3 contained resources:</b>
    <br/> - Practitioner : Bundle.entry.resource.ofType(Practitioner) (Cast to "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-practitioner")
    <br/> - Author/Sender : Bundle.entry[0].resource.ofType(MessageHeader).sender.resolve().ofType(Organization) (Cast to "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-organization")
    <br/> - Patient : Bundle.entry.resource.ofType(Patient) (Cast to "http://medcomfhir.dk/ig/document/StructureDefinition/medcom-document-patient")
  </td>
  <td></td>
</tr>

</tbody>
</table>