// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.

Profile: SbdhPatient
Parent: MedComCorePatient
Description: "An example profile of the Patient resource."
* identifier contains 
  maskedCPR 1..1
* identifier[maskedCPR] 1..1
//* Identifier[maskedCPR].value obeys uuid
* identifier[maskedCPR].use = #official
* identifier[maskedCPR].system = "urn:oid:1.2.208.176.1.2"
* identifier[maskedCPR].type = 
* name 1..* MS

Instance: PatientExample
InstanceOf: SbdhPatient
Description: "An example of a patient with a license to krill."
* identifier[maskedCPR].value = "f06c1ac8-6096-5178-a380-2831d2456986"
* identifier[maskedCPR].use = #official
* identifier[maskedCPR].system = "OID"
* name[official]
  * given[0] = "James"
  * family = "Pond"

/*
Profile: EhmiMaskedCPR
Parent: Identifier
Description: "UUIDv5 masked CPR-identifier making the cpr a UUID"
* Identifier.use = #OID
* Identifier.system = "OID"
* Identifier.value obeys uuid
*/

Invariant: uuid
Description: "General UUID expression"
Severity: #error
Expression: "value.matches('[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')"

