Instance: EUADeliveryFailureReceiverCapability
InstanceOf: CapabilityStatement
Title: "EUA API-kontrakt for modtagelse af kuvertfri leveringsfejl"
Description: "Definerer REST API-grænsefladen på EUA (End User Application), som MSH kalder ved negative EHMI-kvitteringer."
Usage: #definition

* name = "EUADeliveryFailureReceiverCapability"
* status = #draft
* date = "2026-11-18"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml

* rest.mode = #server
* rest.documentation = "EUA udstiller et kuvertfrit FHIR REST endpoint til modtagelse af negative leveringskvitteringer fra MSH."

* rest.resource.type = #Communication
* rest.resource[=].supportedProfile = Canonical(MSHDeliveryFailureCommunication)
* rest.resource[=].documentation = "MSH opretter en Communication-ressource på EUA via HTTP POST, når en ehmiSBDH-kvittering har outcome != 'OK'."

* rest.resource[=].interaction.code = #create
* rest.resource[=].interaction[=].documentation = "POST [eua-base]/Communication - Bruges af MSH til at pushe en negativ kvittering direkte til EUA."

* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = "GET [eua-base]/Communication/[id] - Bruges til opslag af specifik fejlmeddelelse."

* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = "GET [eua-base]/Communication?identifier=... - Bruges hvis EUA poller MSH eller søger fejl på et oprindeligt meddelelses-ID."

* rest.resource[=].searchParam.name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Søg på det oprindelige meddelelses-ID."

* rest.resource[=].searchParam[+].name = "category"
* rest.resource[=].searchParam[=].definition = "http://hl7.org"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Filtrer på kategori=delivery-failure."

* rest.resource[=].searchParam[+].name = "sent"
* rest.resource[=].searchParam[=].definition = "http://hl7.org"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Filtrer på tidspunkt for leveringsfejlen."
