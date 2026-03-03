Profile: Senologie_Systemtherapie_Procedure
Parent: MII_PR_Onko_Systemische_Therapie
Id: senologie-systemtherapie-procedure
Title: "BIH Senologie Systemtherapie (übergeordnet)"
Description: "Procedure für übergeordnete Dokumentation einer Systemtherapie-Serie aus dotbase Questionnaire 'Systemtherapie Therapiedokumentation'. Erbt Intention und outcome von MII Onko Systemtherapie."

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

// Zeitraum der gesamten Therapie
* performedPeriod MS
* performedPeriod.start MS
* performedPeriod.start ^short = "Therapie-Beginn"
* performedPeriod.start ^comment = "Aus dotbase: 'Systemtherapie Beginn' → Datum"
* performedPeriod.end MS
* performedPeriod.end ^short = "Therapie-Ende"
* performedPeriod.end ^comment = "Aus dotbase: 'Systemtherapie Ende' → Datum"

// Inherited from MII Onko Systemtherapie parent:
// - extension:Intention (replaces reasonCode-based intention)
// - outcome (replaces EX_Senologie_TherapyStatus)
// - usedCode (Protokolle)

// Therapie-Status am Ende → now carried by inherited Procedure.outcome
* outcome MS
* outcome ^short = "Therapie-Status am Ende"
* outcome ^comment = "Aus dotbase: 'Systemtherapie Ende' → Status (abgeschlossen, abgebrochen, etc.) — ersetzt ehemalige TherapyStatus-Extension"

// Bezug zu Diagnose
* reasonReference MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Bezogene Diagnose"

// Freitext Notizen
* note ^short = "Besonderheiten/Details zur Therapie"
* note ^comment = "Aus dotbase: Details bei Beginn und Ende"

// Die einzelnen MedicationStatement Gaben werden über basedOn referenziert
* partOf ^short = "Teil einer übergeordneten Maßnahme"
