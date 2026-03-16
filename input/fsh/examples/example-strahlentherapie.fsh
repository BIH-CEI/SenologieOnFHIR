Instance: Example-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen"
Description: "Adjuvante Ganzbrustbestrahlung links mit 50 Gy in 25 Fraktionen nach BET"
Usage: #example

* status = #completed

// Code (MII parent requires code.coding with OPS or SCT)
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2024"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger, intensitätsmodulierte Radiotherapie: Mit bildgestützter Bestrahlungsplanung"
// code.text already set by profile to "Bestrahlung"

// Patient
* subject = Reference(Patient/example-patient)

// Bestrahlungszeitraum
* performedPeriod.start = "2024-06-03"
* performedPeriod.end = "2024-07-04"

// Bestrahlungsregion
* bodySite = $SCT#80248007 "Left breast structure"

// Intention: adjuvant
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Anzahl Sitzungen
* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

// Bezogene Diagnose
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)
