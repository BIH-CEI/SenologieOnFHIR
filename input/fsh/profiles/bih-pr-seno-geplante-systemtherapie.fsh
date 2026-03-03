Profile: Senologie_Geplante_Systemtherapie
Parent: MedicationRequest
Id: senologie-geplante-systemtherapie
Title: "BIH Senologie Geplante Systemtherapie"
Description: "MedicationRequest für geplante Systemtherapie aus dotbase Questionnaire 'Geplante Systemtherapie'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase "Geplante Systemtherapie"
* status MS
* status = #draft (exactly)
* status ^short = "Geplant/In Bearbeitung"

* intent MS
* intent = #plan (exactly)

* medicationCodeableConcept MS
* medicationCodeableConcept ^short = "Substanz/Medikament"
* medicationCodeableConcept ^comment = "Aus dotbase: 'Therapieprotokoll' - geplante Substanzen"

* subject MS
* subject only Reference(Patient)

// Therapieintention (kurativ, palliativ, neoadjuvant, adjuvant)
* reasonCode ^short = "Therapieintention"
* reasonCode ^comment = "Aus dotbase: 'Intention' (z.B. neoadjuvant, adjuvant, palliativ)"

* reasonReference MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Bezogene Diagnose"
* reasonReference ^comment = "Reference zur Condition-Ressource der Diagnose"

// Therapielinie (1. Linie, 2. Linie, etc.)
* extension contains EX_Senologie_TherapyLine named therapyLine 0..1
* extension[therapyLine] ^short = "Therapielinie"
* extension[therapyLine] ^comment = "Aus dotbase: 'Therapielinie' (1, 2, 3, etc.)"

// Therapieprotokoll Details → now in courseOfTherapyType
* courseOfTherapyType MS
* courseOfTherapyType ^short = "Therapieprotokoll"
* courseOfTherapyType ^comment = "Aus dotbase: 'Therapieprotokoll' - geplantes Schema/Protokoll — ersetzt ehemalige TherapyProtocol-Extension"

// Freitext für weitere Spezifika
* note ^short = "Planungsdetails"
* note ^comment = "Aus dotbase: 'Details' Freitext"

// Zeitraum/Planung
* dosageInstruction MS
* dosageInstruction.timing ^short = "Geplante Gabe-Rhythmik"
* dosageInstruction.doseAndRate.dose[x] ^short = "Geplante Dosis"
