Profile: Senologie_Begleitmedikation
Parent: MedicationStatement
Id: senologie-begleitmedikation
Title: "BIH Senologie Begleitmedikation"
Description: "Begleitmedikation der Patientin – aktuelle Dauermedikation und sonstige Medikamente, die nicht Teil der onkologischen Systemtherapie sind (z. B. Antihypertensiva, Schilddrüsenhormone, Antikoagulantien)."

* insert PR_CS_VS_Version
* ^status = #draft

// Status
* status MS
* status ^short = "Status der Medikationsaussage"

// Medikament (SNOMED CT, extensible)
* medication[x] MS
* medication[x] only CodeableConcept
* medication[x] ^short = "Medikament"
* medicationCodeableConcept from http://snomed.info/sct?fhir_vs=isa/373873005 (extensible)
* medicationCodeableConcept ^comment = "Codierung bevorzugt über SNOMED CT (Pharmaceutical / biologic product). Freitext über .text möglich."
* medicationCodeableConcept.text MS
* medicationCodeableConcept.text ^short = "Medikationsname (Freitext)"

// Patient
* subject MS
* subject 1..1
* subject only Reference(Patient)
* subject ^short = "Patientin"

// Zeitraum der Einnahme
* effective[x] MS
* effective[x] only Period
* effective[x] ^short = "Einnahmezeitraum"

// Dosierung
* dosage MS
* dosage ^short = "Dosierung"
* dosage.text ^short = "Dosierschema (Freitext)"
* dosage.doseAndRate MS
* dosage.doseAndRate.dose[x] ^short = "Dosis"

// Bezogene Diagnose (optional)
* reasonReference ^short = "Grund / zugehörige Diagnose"

// Datum der Angabe
* dateAsserted MS
* dateAsserted ^short = "Datum der Angabe"
