// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.

Profile: SbdhPatient
Parent: MedComCorePatient
Description: "An example profile of the Patient resource."
* identifier contains 
  maskedCPR 1..1
* identifier[maskedCPR] only EhmiMaskedCPR
  * ^short = "[DA] cpr-nummer, som det fremgår af CPR registeret, men maskeret med uuid ´v5, så det optræder som en uuid"
//* Identifier[maskedCPR].value obeys uuid
* identifier[maskedCPR].use = #secondary
* identifier[maskedCPR].system = "urn:oid:1.2.208.176.1.200"
//* identifier[maskedCPR].system = "urn:oid:1.2.208.176.1.2"
* name 1..* MS

Instance: SbdhPatientExample
InstanceOf: SbdhPatient
Description: "An example of a patient with a license to krill."
* identifier[maskedCPR].value = "f06c1ac8-6096-5178-a380-2831d2456986"
* identifier[maskedCPR].use = #secondary
* identifier[maskedCPR].system = "urn:oid:1.2.208.176.1.200"
* name[official]
  * given[0] = "James"
  * family = "Pond"


Profile: EhmiMaskedCPR
Parent: Identifier
Description: "UUIDv5 masked CPR-identifier making the cpr a UUID"
* use = #secondary
* system = "urn:oid:1.2.208.176.1.200"
* value 1..
  * obeys uuid
  * ^mustSupport = false


Invariant: uuid
Description: "General UUID expression"
Severity: #error
Expression: "value.matches('[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}')"

