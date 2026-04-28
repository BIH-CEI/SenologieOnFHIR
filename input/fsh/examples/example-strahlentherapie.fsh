Instance: Example-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen"
Description: "Adjuvante Ganzbrustbestrahlung links mit 50 Gy in 25 Fraktionen nach BET"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

// Code (MII parent requires code.coding with OPS or SCT)
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2024"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"
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

// Einzeldosis pro Fraktion (50 Gy / 25 Fraktionen = 2 Gy)
* extension[einzeldosis].valueQuantity = 2 'Gy' "Gy"

// Bezogene Diagnose
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)
