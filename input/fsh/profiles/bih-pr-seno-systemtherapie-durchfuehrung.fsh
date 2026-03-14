Profile: Senologie_Systemtherapie_Medikation
Parent: MII_PR_Onko_Systemische_Therapie_Medikation
Id: senologie-systemtherapie-medikation
Title: "BIH Senologie Systemtherapie Medikation (einzelne Gabe)"
Description: "MedicationStatement für einzelne Medikamentengaben aus dotbase. Erbt ATC/UNII-Codierung und partOf:systemischeTherapie von MII Onko."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #completed (exactly)
* status ^short = "Durchgeführt"

// Inherited medicationCodeableConcept with ATC+UNII slices from MII Onko parent
* medication[x] MS
* medication[x] ^short = "Substanz/Medikament"
* medication[x] ^comment = "Aus dotbase: 'Substanz' — SNOMED CT Binding auf Senologie-Medikationsliste, ATC/UNII geerbt von MII Onko"

// SNOMED CT Slice für Senologie-spezifische Medikamenten-Codierung
* medicationCodeableConcept.coding contains sct 0..1 MS
* medicationCodeableConcept.coding[sct].system = $SCT (exactly)
* medicationCodeableConcept.coding[sct] ^short = "SNOMED CT Wirkstoff"
* medicationCodeableConcept.coding[sct] from vs-senologie-systemtherapie-medikation (extensible)

* subject MS
* subject only Reference(Patient)

* dateAsserted MS
* dateAsserted ^short = "Datum der Medikamentengabe"

// Inherited effectivePeriod from parent — use effective[x] to avoid type slice conflict
* effective[x] MS
* effective[x] ^short = "Zeitraum der Gabe"

// Inherited partOf:systemischeTherapie from parent
* partOf MS
* partOf ^short = "Zugehörig zu Systemtherapie-Procedure"

// Senologie-spezifisch: Zyklus-Info (no MII equivalent)
* extension contains EX_Senologie_TherapyCycle named therapyCycle 0..1
* extension[therapyCycle] ^short = "Therapie-Zyklus"
* extension[therapyCycle] ^comment = "Aus dotbase: 'Zyklus' (1, 2, 3, etc.)"

* extension contains EX_Senologie_DayInCycle named dayInCycle 0..1
* extension[dayInCycle] ^short = "Tag im Zyklus"
* extension[dayInCycle] ^comment = "Aus dotbase: 'Tag' (Tag 1-N innerhalb eines Zyklus)"

// Dosierung
* dosage MS
* dosage.doseAndRate MS
* dosage.doseAndRate.dose[x] ^short = "Verabreichte Dosis"

* note ^short = "Besonderheiten/Kommentar zur Gabe"

* reasonReference ^short = "Bezogene Diagnose"
