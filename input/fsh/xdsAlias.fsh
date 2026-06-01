/* Example of defining aliases (henviser til et CodeSystem eller ValueSet): 
Alias: $ActCodes = http://terminology.hl7.org/CodeSystem/v3-ActCode 
Alias: $RequestPriority = http://medcomfhir.dk/ig/terminology/ValueSet/medcom-careCommunication-requestPriority 
*/
Alias: $QrdTypeCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-dk-ihe-qrd-typecode-VS
Alias: $QrdEventCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-dk-ihe-qrd-eventcodelist-VS
Alias: $QrdHomeCommunityID = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-qrd-homeCommunityId-VS
Alias: $QrdFormatCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-qrd-formatcode-VS

//used for instances
Alias: $ClassCodeCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-classcode-CS
Alias: $TypeCodeCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-LOINC-typecode-CS
Alias: $ContentTypeCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-mimeType-CS
Alias: $LanguageCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-LanguageCode-CS
Alias: $FormatCodeCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-formatcode-CS
Alias: $EventCodeCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-episodeOfCare-CS
Alias: $FacilityTypeCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-snomed-CS
Alias: $PracticeSettingCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-snomed-CS
Alias: $HomeCommunityIDCS = http://medcomfhir.dk/ig/xdsmetadata/CodeSystem/MedCom-ihe-homeCommunityId-CS
Alias: $StatusCS = http://hl7.org/fhir/document-reference-status

Alias: $ApdTypeCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-dk-ihe-apd-typecode-VS
Alias: $ApdEventCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-dk-ihe-apd-eventcodelist-VS
Alias: $ApdHomeCommunityID = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-homeCommunityId-VS
Alias: $ApdFormatCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-formatcode-VS
/* Example of defining aliases (henviser til et CodeSystem eller ValueSet): 
Alias: $ActCodes = http://terminology.hl7.org/CodeSystem/v3-ActCode 
Alias: $RequestPriority = http://medcomfhir.dk/ig/terminology/ValueSet/medcom-careCommunication-requestPriority 
*/
//Alias: $ClassCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-classcode-VS
Alias: $ClassCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-classcode-VS

//Alias: $ContentType = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-mimetype-VS
Alias: $ContentType = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-mimeType-VS

//Alias: $Language = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-languagecode-VS
Alias: $Language = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-languagecode-VS

//Alias: $FormatCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-formatcode-VS
Alias: $FormatCode = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-formatcode-VS

//Alias: $HomeCommunityID = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-apd-homeCommunityId-VS
Alias: $HomeCommunityID = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-homeCommunityId-VS

Alias: $PracticeSetting = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-PracticeSettingCode-VS

Alias: $FacilityType = http://medcomfhir.dk/ig/xdsmetadata/ValueSet/MedCom-ihe-core-HealthcareFacilityTypeCode-VS

Alias: $DanishiheOID = urn:oid:1.2.208.184.100.9
Alias: $SnomedctOID = urn:oid:2.16.840.1.113883.6.96
Alias: $LoincOID = urn:oid:2.16.840.1.113883.6.1
Alias: $MedComOID = urn:oid:1.2.208.184.100.1
Alias: $SKSOID = urn:oid:1.2.208.176.2.4
Alias: $NPUOID = urn:oid:1.2.208.176.2.1
Alias: $PROdkOID = urn:oid:1.2.208.176.7.3.1
Alias: $MedComFormatOID = urn:oid:1.2.208.184.100.10
Alias: $DanishxdsOID = urn:oid:1.2.208.176.8.1
Alias: $IANALanguageOID = urn:oid:2.16.840.1.113883.6.121
Alias: $IANAMediaOID = urn:oid:2.16.840.1.113883.5.79