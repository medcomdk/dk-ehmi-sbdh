CodeSystem: VANSReceiptStatusCS
Id: vans-receipt-status-cs
Title: "VANS Receipt Status CodeSystem"
Description: "Statuskoder for tekniske kvitteringer i VANSEnvelope."
* ^status = #draft
* ^caseSensitive = true
* ^content = #complete

* #Accepted "Accepted" "Kuverten er accepteret af VANS/modtager."
* #Rejected "Rejected" "Kuverten er afvist."
* #Error "Error" "Teknisk fejl under transport."

ValueSet: VANSReceiptStatusVS
Id: vans-receipt-status-vs
Title: "VANS Receipt Status ValueSet"
Description: "Tilladte statuskoder i VANSEnvelope Receipt."
* ^status = #draft
* include codes from system VANSReceiptStatusCS

// -----------------------------------------------------------------------------

CodeSystem: EHMIReceiptOutcomeCS
Id: ehmi-receipt-outcome-cs
Title: "EHMI Receipt Outcome CodeSystem"
Description: "Statuskoder for kvitteringer og leveringsstatus (EDS) i ehmiSBDH."
* ^status = #draft
* ^caseSensitive = true
* ^content = #complete

* #OK "OK" "Leveret / Positiv kvittering."
* #Error "Error" "Levering fejlet / Negativ kvittering."

ValueSet: EHMIReceiptOutcomeVS
Id: ehmi-receipt-outcome-vs
Title: "EHMI Receipt Outcome ValueSet"
Description: "Tilladte statuskoder i ehmiSBDH Receipt."
* ^status = #draft
* include codes from system EHMIReceiptOutcomeCS

// -----------------------------------------------------------------------------

CodeSystem: EHMIErrorCodesCS
Id: ehmi-error-codes-cs
Title: "EHMI Transport & AS4 Error Codes"
Description: "Fejlkoder fra EHMI/AS4-infrastrukturen."
* ^status = #draft
* ^caseSensitive = true
* ^content = #fragment

* #AS4-0001 "ValueInconsistent" "Ugyldig SBDH-header eller dokumentidentifikation."
* #AS4-0004 "Unknown Receiver Endpoint" "Modtagerens lokationsnummer kunne ikke routes i EHMI."

// -----------------------------------------------------------------------------

CodeSystem: MSHNotificationCategoryCS
Id: msh-notification-category-cs
Title: "MSH Notification Category CodeSystem"
Description: "Koder til kategorisering af kuvertfri systemnotifikationer fra MSH til EUA."
* ^status = #draft
* ^caseSensitive = true
* ^content = #complete

* #delivery-failure "Leveringsfejl" "Meddelelsen kunne ikke leveres til modtageren i EHMI-netværket."

ValueSet: MSHNotificationCategoryVS
Id: msh-notification-category-vs
Title: "MSH Notification Category ValueSet"
Description: "Tilladte notifikationskategorier mellem MSH og EUA."
* ^status = #draft
* include codes from system MSHNotificationCategoryCS
