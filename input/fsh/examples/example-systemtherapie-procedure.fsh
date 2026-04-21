Instance: Example-Systemtherapie-ECT
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Beispiel: Neoadjuvante Chemotherapie EC-T"
Description: "Neoadjuvante Chemotherapie mit Epirubicin/Cyclophosphamid gefolgt von Docetaxel (EC-T Schema)"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

// Intention (required by MII Onko parent)
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Code (MII parent requires code.coding with OPS or SCT)
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2024"
* code.coding[=].code = #8-54
* code.coding[=].display = "Chemotherapie"
// code.text already set by profile to "Systemtherapie"

// Patient
* subject = Reference(Patient/example-patient)

// Therapiezeitraum
* performedPeriod.start = "2024-01-15"
* performedPeriod.end = "2024-05-20"

// Outcome: regulär abgeschlossen
* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#E "reguläres Ende"
* outcome.text = "Therapie planmäßig abgeschlossen, klinisch partielle Remission"

// Bezogene Diagnose
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)

// Protokoll
* usedCode.text = "EC-T (4x EC q3w, 4x Docetaxel q3w)"
