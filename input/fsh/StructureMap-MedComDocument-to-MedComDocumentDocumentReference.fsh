Instance: MedComDocumentBundle2MedComDocumentDocumentReference-transform
InstanceOf: StructureMap
Title: "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
Description: "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
Usage: #definition
* id = "MedComDocumentBundle2MedComDocumentDocumentReference-transform"
* url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureMap/MedComDocumentBundle2MedComDocumentDocumentReference-transform"
* name = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* title = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* status = #draft
* description = "Transformation specification of a MedComDocumentBundle to a MedComDocumentDocumentReference"
* structure[+].url = "http://medcomfhir.dk/ig/document/StructureDefinition-medcom-document-bundle"
* structure[=].mode = #source
* structure[+].url = "https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference"
//* structure[+].url = "http://medcomfhir.dk/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference"
* structure[=].mode = #target

/*
OBS:
 structure[+].url bør senre rettes til http://medcomfhir.dk/ig/.... når det er udgivet på medcoms server
*/

//#####################
//Group: extension.homeCommunityid
//Comment: the repository OID, where the document is placed
//#####################


//OBS!! homeCommunityid sættes af kildesystem, så skal have afklaret hvordan dette defienres.
* group[+].name = "extension.homeCommunityid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
//* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
//* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension:homeCommunityid system (Must be fixed to "urn:oid:1.2.208.176.1.2")
* group[=].rule[0].name = "homeCommunityid-system"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "urn:oid:1.2.208.176.1.2" // fixed value - OID for danish xds-domain   
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.system"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid code (OID for the repository eg. "1.2.208.176.43210.8.20")
* group[=].rule[+].name = "homeCommunityid-code"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "[REPOSITORY OID: 1.2.208.176.43210.8.20|?]" // Source system must provide xds repository OID
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.code"
* group[=].rule[=].target.transform = #create

//Rule #2: MedComDocumentDocumentReference.extension:homeCommunityid display (displayname for repository eg. "TEST2")
* group[=].rule[+].name = "homeCommunityid-display"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "[REPOSITORY NAME: TEST1|TEST2]" // Source system must provide xds repository name 
* group[=].rule[=].target.context = "target"
//* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension').valueCoding.display"
* group[=].rule[=].target.transform = #create

//#####################
//Group: extension.versionNumber
//Comment: Version of the MedCom XDS-metdatdata standard
//##################### 
* group[+].name = "extension.versionid"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].mode = #target

//Rule #1: MedComDocumentDocumentReference.extension:versionid  (MedCom XDS Version ID)
* group[=].rule[0].name = "versionid"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueString = "1.0.0" // fixed value - MedCom XDS Version   
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.extension.where(url='https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-version-id-extension').valueString"
* group[=].rule[=].target.transform = #create



//#####################
//Group: masterIdentifier
//Comment: XDS metadata standard: "uniqueId".
//#####################

* group[+].name = "masterIdentifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "masterIdentifier"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.id"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.masterIdentifier"
* group[=].rule[=].target.transform = #copy


//#####################
//Group: identifier
//Comment: XDS metadata standard: "entryUUID". UUID is created during mapping.
//#####################

* group[+].name = "identifier"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "identifier"
* group[=].rule[=].source.context = "uuid"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.contextType = #variable
* group[=].rule[=].target.element = "DocumentReference.identifier"
* group[=].rule[=].target.transform = #uuid

//#####################
//Group: status
//Comment: XDS metadata standard attribute "availabilityStatus": set by system upon upload.
//#####################

//RUN: 
// availabilityStatus in XDS metadata: "urn:oasis:names:tc:ebxml-regrep:StatusType:Approved"|"urn:oasis:names:tc:ebxml-regrep:StatusType:Deprecated". 
// status in DocumentReference: "current"|"superseded" 
//For now "hard coded" value "current"
* group[+].name = "status"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[+].name = "status"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.defaultValueCode = #current // fixed value - MedCom XDS Version   
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "DocumentReference.status"
* group[=].rule[=].target.transform = #create


//#####################
//Group: type
//Comment: XDS metadata standard attribute "typeCode"
//#####################

* group[+].name = "type"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "system"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.system"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.system"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "code"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.code"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.code"
* group[=].rule[=].target.transform = #copy

* group[=].rule[+].name = "display"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).type.coding.display"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "type.coding.display"
* group[=].rule[=].target.transform = #copy




//#####################
//Group: category
//Comment: XDS metadata standard attribute "classCode"
//#####################
//RUN: only one entry "001" in value set
* group[+].name = "category"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "system"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "1.2.208.184.100.9"  // codeSystem ? CodeSystem:$codeSystem = ” 1.2.208.184.100.9” or http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-classcode-VS
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "category.coding.system"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "code"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueCode = #001 // Skulle det være noget andet ved medd.?
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "category.coding.code"
* group[=].rule[=].target.transform = #create

* group[=].rule[+].name = "display"
* group[=].rule[=].source.context = "defaultValue"
* group[=].rule[=].source.defaultValueString = "Klinisk rapport"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "category.coding.display"
* group[=].rule[=].target.transform = #create


//#####################
//Group: subject
//Comment: XDS metadata standard attribute "patientId"
//#####################

* group[+].name = "subject"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "subject"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).subject.reference"
* group[=].rule[=].target.context = "target"
* group[=].rule[=].target.element = "subject.reference"
* group[=].rule[=].target.transform = #copy


//#####################
//Group: author
//Comment: XDS metadata standard attribute "author.authorinstitution" and "author.authorperson"
//#####################


* group[+].name = "author"
* group[=].typeMode = #none
* group[=].input[0].name = "source"
* group[=].input[=].type = "Bundle"
* group[=].input[=].mode = #source
* group[=].input[+].name = "target"
* group[=].input[=].type = "MedComDocumentDocumentReference"
* group[=].input[=].mode = #target

* group[=].rule[0].name = "authorinstitution"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).author.reference.where($this.startsWith('Organization'))"
* group[=].rule[=].target.element = "author.reference"
* group[=].rule[=].target.transform = #copy

* group[=].rule[0].name = "authorperson"
* group[=].rule[=].source.context = "source"
* group[=].rule[=].source.element = "Bundle.entry.resource.ofType(Composition).author.reference.where($this.startsWith('Practitioner'))"
* group[=].rule[=].target.element = "author.reference"
* group[=].rule[=].target.transform = #copy

// ?? why is only practiontioner allowed in author.person? - see https://build.fhir.org/ig/medcomdk/dk-medcom-core-document/StructureDefinition-medcom-documentreference-definitions.html#DocumentReference.author



/*
##### target // documentReferece  (APD-DK ) raw json: 
link:
https://build.fhir.org/ig/medcomdk/dk-medcom-xds-documents/DocumentReference-94e65db8-2f0c-4a2c-a7c9-06a160d59a12.json


{
  "resourceType" : "DocumentReference",
  "id" : "94e65db8-2f0c-4a2c-a7c9-06a160d59a12",
  "meta" : {
    "profile" : ["https://medcomfhir.dk/ig/xdsdocuments/StructureDefinition/apd-dk-documentreference"]
  },

....

}],
  "extension" : [{
    "url" : "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-homecommunityid-extension",
    "valueCoding" : {
      "system" : "urn:oid:1.2.208.176.8.1",
      "code" : "1.2.208.176.43210.8.20",
      "display" : "TEST2"
    }
  },
  {
    "url" : "https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/medcom-xds-version-id-extension",
    "valueString" : "1.0.0"
  }],
  "masterIdentifier" : {
    "value" : "urn:uuid:bf1bb63b-d405-4dfe-9810-37b16b333a01"
  },
  "status" : "current",
  "type" : {
    "coding" : [{
      "system" : "urn:oid:2.16.840.1.113883.6.1",
      "code" : "56446-8",
      "display" : "Appointment Summary Document"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "urn:oid:1.2.208.184.100.9",
      "code" : "001",
      "display" : "Klinisk rapport"
    }]
  }],
  "subject" : {
    "reference" : "#37628912-7816-47a3-acd8-396b610be142"
  },
  "author" : [{
    "reference" : "#8fa7df76-bec2-4fe2-9a44-750030a0eda0"
  }],
  "authenticator" : {
    "reference" : "#42cb9200-f421-4d08-8391-7d51a2503cb4"
  },
  "securityLabel" : [{
    "coding" : [{
      "code" : "N"
    }]
  }],
  "content" : [{
    "attachment" : {
      "contentType" : "text/xml",
      "language" : "da",
      "url" : "DOC001.XML",
      "size" : 3654,
      "hash" : "da39a3ee5e6b4b0d3255bfef95601890afd80709",
      "title" : "Aftale for 0201919990",
      "creation" : "2023-09-08T13:28:17+01:00"
    },
    "format" : {
      "system" : "urn:oid:1.2.208.184.100.10",
      "code" : "urn:ad:dk:medcom:apd-v2.0.1:full",
      "display" : "DK APD schema"
    }
  }],
  "context" : {
    "event" : [{
      "coding" : [{
        "system" : "urn:oid:1.2.208.176.2.4",
        "code" : "ALAL03",
        "display" : "Psykiske lidelser og adfærdsmæssige forstyrrelser"
      }]
    }],
    "facilityType" : {
      "coding" : [{
        "system" : "urn:oid:2.16.840.1.113883.6.96",
        "code" : "554871000005105",
        "display" : "psykiatrienhed"
      }]
    },
    "practiceSetting" : {
      "coding" : [{
        "system" : "urn:oid:2.16.840.1.113883.6.96",
        "code" : "394588006",
        "display" : "børne- og ungdomspsykiatri"
      }]
    },
    "sourcePatientInfo" : {
      "reference" : "#37628912-7816-47a3-acd8-396b610be142"
    }
  }
}



*/