Instance: Example-Begleitmedikation-Metoprolol
InstanceOf: Senologie_Begleitmedikation
Title: "Beispiel: Begleitmedikation Metoprolol 47,5 mg"
Description: "Patientin nimmt Metoprolol 47,5 mg 1x täglich wegen arterieller Hypertonie."
Usage: #example

* status = #active

// Medikament: Metoprolol (SNOMED CT)
* medicationCodeableConcept.coding = $SCT#372826007 "Metoprolol"
* medicationCodeableConcept.text = "Metoprolol"

// Patient
* subject = Reference(Patient/example-patient)

// Einnahmezeitraum
* effectivePeriod.start = "2022-06-01"

// Datum der Angabe
* dateAsserted = "2024-01-10"

// Dosierung
* dosage.text = "1x täglich morgens"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d
* dosage.doseAndRate.doseQuantity.value = 47.5
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg

// Grund: arterielle Hypertonie
* reasonReference = Reference(Condition/Example-Diagnose-Mammakarzinom)
* reasonReference.display = "Arterielle Hypertonie"
