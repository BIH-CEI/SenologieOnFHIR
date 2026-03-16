Instance: Example-Operation-BET
InstanceOf: Senologie_Operation
Title: "Beispiel: BET links mit Sentinel-LK-Biopsie"
Description: "Brusterhaltende Therapie (BET) links mit intraoperativer Sentinel-Lymphknoten-Biopsie"
Usage: #example

* status = #completed

// Intention (required by MII Onko parent)
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Art der Operation: BET
* category = $SCT#392022002 "Breast-conserving surgery"

// OPS-Code (inherited from MII Onko)
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2024"
* code.coding[=].code = #5-870.0
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Exzision"
* code.text = "BET links, Sentinel-LK-Biopsie"

// Lateralität
* bodySite = $SCT#80248007 "Left breast structure"

// Zeitpunkt
* performedDateTime = "2024-04-10"

// Patient
* subject = Reference(Patient/example-patient)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage device"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#262171009 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

// Outcome
* outcome.text = "R0-Resektion, Sentinel negativ"
