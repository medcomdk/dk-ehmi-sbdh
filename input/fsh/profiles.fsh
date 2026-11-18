Profile: MSHDeliveryFailureCommunication
Parent: Communication
Id: msh-delivery-failure-communication
Title: "MSH Delivery Failure Communication"
Description: "Kuvertfri FHIR Communication-profil til levering af negative EHMI-kvitteringer fra MSH til EUA. Positive kvitteringer er udelukket."
* ^version = "1.0.0"
* ^status = #draft

* status = #entered-in-error (exactly)

* category 1..1
* category from MSHNotificationCategoryVS (required)

* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains originalMessageId 1..1
* identifier[originalMessageId].system = "http://medcomehmi.dk" (exactly)
* identifier[originalMessageId].value 1..1

* sent 1..1
* recipient 1..1
* recipient.identifier 1..1

* payload 1..*
* payload.content[x] only string
* payload.contentString 1..1

* reasonCode 0..*
