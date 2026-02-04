Profile: Senologie_Systemtherapie_Procedure
Parent: Procedure
Id: senologie-systemtherapie-procedure
Title: "BIH Senologie Systemtherapie (übergeordnet)"
Description: "Procedure für übergeordnete Dokumentation einer Systemtherapie-Serie aus dotbase Questionnaire 'Systemtherapie Therapiedokumentation'"

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* status MS
* status = #completed (exactly)
* status ^short = "Durchgeführt"

* code MS
* code.coding ^short = "Systemtherapie-Typ"
* code.coding ^comment = "Aus dotbase: 'Details' bei Therapie-Beginn"
* code.text = "Systemtherapie"

* subject MS
* subject only Reference(Patient)

// Zeitraum der gesamten Therapie
* performedPeriod MS
* performedPeriod.start MS
* performedPeriod.start ^short = "Therapie-Beginn"
* performedPeriod.start ^comment = "Aus dotbase: 'Systemtherapie Beginn' → Datum"
* performedPeriod.end MS
* performedPeriod.end ^short = "Therapie-Ende"
* performedPeriod.end ^comment = "Aus dotbase: 'Systemtherapie Ende' → Datum"

// Therapieintention (neoadjuvant, adjuvant, palliativ)
* reasonCode MS
* reasonCode ^short = "Therapieintention"
* reasonCode ^comment = "Aus dotbase: 'Systemtherapie Beginn' → Intention"

// Bezug zu Diagnose
* reasonReference MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Bezogene Diagnose"

// Status der Therapie (abgeschlossen, abgebrochen, etc.)
* extension contains EX_Senologie_TherapyStatus named therapyStatus 0..1
* extension[therapyStatus] ^short = "Therapie-Status am Ende"
* extension[therapyStatus] ^comment = "Aus dotbase: 'Systemtherapie Ende' → Status (abgeschlossen, abgebrochen, etc.)"

// Freitext Notizen
* note ^short = "Besonderheiten/Details zur Therapie"
* note ^comment = "Aus dotbase: Details bei Beginn und Ende"

// Die einzelnen MedicationStatement Gaben werden über basedOn referenziert
* partOf ^short = "Teil einer übergeordneten Maßnahme"

// Inverse: MedicationStatements referenzieren auf diese Procedure
