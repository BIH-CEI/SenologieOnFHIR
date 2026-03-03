Profile: Senologie_Systemtherapie_Medikation
Parent: MII_PR_Onko_Systemische_Therapie_Medikation
Id: senologie-systemtherapie-medikation
Title: "BIH Senologie Systemtherapie Medikation (einzelne Gabe)"
Description: "MedicationStatement für einzelne Medikamentengaben aus dotbase Questionnaire 'Systemtherapie Therapiedokumentation'. Erbt ATC/UNII-Codierung und partOf:systemischeTherapie von MII Onko."

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase "Systemtherapie" (repeating group mit table-Typ)
* status MS
* status = #completed (exactly)
* status ^short = "Durchgeführt"

* medicationCodeableConcept MS
* medicationCodeableConcept ^short = "Substanz/Medikament"
* medicationCodeableConcept ^comment = "Aus dotbase: 'Substanz' (choice mit verschiedenen Medikamenten, SNOMED) — ATC/UNII coding geerbt von MII Onko"

* subject MS
* subject only Reference(Patient)

// Zeitpunkt der Gabe
* dateAsserted MS
* dateAsserted ^short = "Datum der Medikamentengabe"
* dateAsserted ^comment = "Aus dotbase: 'Datum' in der repeating group"

* effectiveDateTime MS
* effectiveDateTime ^short = "Wann wurde die Substanz gegeben"
* effectiveDateTime ^comment = "Aus dotbase: 'Datum'"

// Inherited from MII Onko Systemtherapie Medikation:
// - partOf:systemischeTherapie (link to parent Systemtherapie Procedure)
// - medicationCodeableConcept.coding with UNII slice

// Bezug zur übergeordneten Systemtherapie-Procedure
* partOf MS
* partOf ^short = "Zugehörig zu dieser Systemtherapie-Procedure"
* partOf ^comment = "Reference zu Senologie_Systemtherapie_Procedure via geerbtems partOf:systemischeTherapie"

// Senologie-spezifisch: Zyklus-Information (no MII equivalent)
* extension contains EX_Senologie_TherapyCycle named therapyCycle 0..1
* extension[therapyCycle] ^short = "Therapie-Zyklus"
* extension[therapyCycle] ^comment = "Aus dotbase: 'Zyklus' (1, 2, 3, etc.)"

// Senologie-spezifisch: Tag innerhalb des Zyklus (no MII equivalent)
* extension contains EX_Senologie_DayInCycle named dayInCycle 0..1
* extension[dayInCycle] ^short = "Tag im Zyklus"
* extension[dayInCycle] ^comment = "Aus dotbase: 'Tag' (Tag 1-N innerhalb eines Zyklus)"

// Dosierung
* dosage MS
* dosage.doseAndRate MS
* dosage.doseAndRate.dose[x] only SimpleQuantity
* dosage.doseAndRate.dose[x] ^short = "Verabreichte Dosis"
* dosage.doseAndRate.dose[x] ^comment = "Aus dotbase: 'Dosis' (decimal mit 2 Dezimalstellen)"

// Kommentar / Besonderheiten
* note ^short = "Besonderheiten/Kommentar zur Gabe"
* note.text ^comment = "Aus dotbase: 'Kommentar' Freitext"

// Bezug zu Diagnose
* reasonReference only Reference(Condition)
* reasonReference ^short = "Bezogene Diagnose"
