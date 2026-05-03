Instance: Example-Operation-BET
InstanceOf: Senologie_Operation
Title: "Beispiel: BET links mit Sentinel-LK-Biopsie"
Description: "Brusterhaltende Therapie (BET) links mit intraoperativer Sentinel-Lymphknoten-Biopsie"
Usage: #example

* status = #completed

// Intention (required by MII Onko parent)
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Art der Operation: BET
* category = $SCT#392022002 "Excision of mass"

// OPS-Code (inherited from MII Onko)
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a0
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Ohne weitere Maßnahmen"
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
* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "R0-Resektion"


// --- SLNB (Sub-Prozedur) ---
Instance: Example-Operation-SLNB
InstanceOf: Senologie_Operation
Title: "Beispiel: Sentinel-Lymphknoten-Biopsie links"
Description: "SLNB als Subprozedur der BET"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#234262008 "Excision of axillary lymph node"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Mit Radionuklidmarkierung (Sentinel-Lymphonodektomie)"
* code.text = "Sentinel-Lymphknoten-Biopsie"

* bodySite = $SCT#80248007 "Left breast structure"
* performedDateTime = "2024-04-10"
* subject = Reference(Patient/example-patient)
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)

// Sub-procedure of main OP
* partOf = Reference(Procedure/Example-Operation-BET)

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "Sentinel-LK negativ"
