Instance: Example-Medikation-Epirubicin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Beispiel: Epirubicin 90 mg/m², Zyklus 1, Tag 1"
Description: "Einzelgabe Epirubicin im Rahmen des EC-T Schemas, Zyklus 1, Tag 1"
Usage: #example

* status = #completed

// Medikament: Epirubicin (SNOMED CT)
* medicationCodeableConcept.coding[sct] = $SCT#417916005 "Epirubicin"
* medicationCodeableConcept.text = "Epirubicin"

// Patient
* subject = Reference(Patient/example-patient)

// Datum
* dateAsserted = "2024-01-15"
* effectivePeriod.start = "2024-01-15"
* effectivePeriod.end = "2024-01-15"

// Zugehörig zu Systemtherapie
* partOf = Reference(Procedure/Example-Systemtherapie-ECT)

// Zyklus-Info
* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

// Dosierung
* dosage.doseAndRate.doseQuantity.value = 90
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

// Bezogene Diagnose
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)
