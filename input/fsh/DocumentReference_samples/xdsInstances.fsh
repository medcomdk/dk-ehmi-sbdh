/*
Instance: instanceXDSAuthorPerson
//Instance: 42cb9200-f421-4d08-8391-7d51a2503cb4
InstanceOf: XDSAuthorPerson
Title: "Author Person"
Description: "Instance of an author person"
Usage: #example
* name.given = "Sidsel"
* name.family = "Andersen"

Instance: instanceDkCoreOrganization
//Instance: 8fa7df76-bec2-4fe2-9a44-750030a0eda0
InstanceOf: DkCoreOrganization
Title: "Author Organization"
Description: "Instance of an author organization"
Usage: #example
* identifier[SOR-ID].value = "61741000016007"
* identifier[SOR-ID].system = "urn:oid:1.2.208.176.1.1"
* name = "Lægerne Hasseris Bymidte"
* identifier.url = "http://medcomehmi.dk/ig/dk-ehmi-sbdh/StructureDefinition/identifier"

Instance: instanceXDSSourcePatient
//Instance: 37628912-7816-47a3-acd8-396b610be142
InstanceOf: https://medcomfhir.dk/ig/ihexdsmetadata/StructureDefinition/xds-source-patient
Title: "Source Patient"
Description: "Instance of a source patient"
Usage: #example
//* identifier = "urn:oid:1.2.208.176.1.2"
* identifier.valueString = "0201919990"
* name[official].use = #official
* name[official].family = "Lauridsen"
* name[official].given[0] = "Else"
* name[official].given[+] = "Test"
* gender = #female
* birthDate = "1991-02-02"
*/