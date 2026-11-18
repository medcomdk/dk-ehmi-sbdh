Instance: VANSStatusToEHMIStatus
InstanceOf: ConceptMap
Title: "ConceptMap: VANS Receipt Status til EHMI/EDS Outcome"
Description: "Oversætter statuskoder fra VANSEnvelope Receipt til EHMISBDH Receipt outcome."
Usage: #definition

* name = "VANSStatusToEHMIStatus"
* status = #draft
* sourceCanonical = Canonical(VANSReceiptStatusVS)
* targetCanonical = Canonical(EHMIReceiptOutcomeVS)

* group.source = Canonical(VANSReceiptStatusCS)
* group.target = Canonical(EHMIReceiptOutcomeCS)

* group.element[0].code = #Accepted
* group.element[0].display = "Accepted"
* group.element[0].target.code = #OK
* group.element[0].target.display = "OK"
* group.element[0].target.equivalence = #equivalent

* group.element[1].code = #Rejected
* group.element[1].display = "Rejected"
* group.element[1].target.code = #Error
* group.element[1].target.display = "Error"
* group.element[1].target.equivalence = #equivalent

* group.element[2].code = #Error
* group.element[2].display = "Error"
* group.element[2].target.code = #Error
* group.element[2].target.display = "Error"
* group.element[2].target.equivalence = #equal

// -----------------------------------------------------------------------------

Instance: EHMIStatusToVANSStatus
InstanceOf: ConceptMap
Title: "ConceptMap: EHMI/EDS Outcome til VANS Receipt Status"
Description: "Oversætter outcome fra EHMISBDH Receipt tilbage til VANSEnvelope Receipt statuskoder."
Usage: #definition

* name = "EHMIStatusToVANSStatus"
* status = #draft
* sourceCanonical = Canonical(EHMIReceiptOutcomeVS)
* targetCanonical = Canonical(VANSReceiptStatusVS)

* group.source = Canonical(EHMIReceiptOutcomeCS)
* group.target = Canonical(VANSReceiptStatusCS)

* group.element[0].code = #OK
* group.element[0].display = "OK"
* group.element[0].target.code = #Accepted
* group.element[0].target.display = "Accepted"
* group.element[0].target.equivalence = #equivalent

* group.element[1].code = #Error
* group.element[1].display = "Error"
* group.element[1].target.code = #Rejected
* group.element[1].target.display = "Rejected"
* group.element[1].target.equivalence = #equivalent
