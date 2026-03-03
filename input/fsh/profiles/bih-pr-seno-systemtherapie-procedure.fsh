Profile: Senologie_Systemtherapie_Procedure
Parent: MII_PR_Onko_Systemische_Therapie
Id: senologie-systemtherapie-procedure
Title: "BIH Senologie Systemtherapie (übergeordnet)"
Description: "Procedure für übergeordnete Systemtherapie-Dokumentation. Erbt Intention, outcome und usedCode von MII Onko Systemtherapie."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #completed (exactly)
* status ^short = "Durchgeführt"

* code MS
* code.coding ^short = "Systemtherapie-Typ"
* code.text = "Systemtherapie"

* subject MS

// Inherited from MII Onko Systemtherapie parent:
// - extension:Intention (Therapieintention)
// - performed[x] with performedPeriod slice (Beginn/Ende)
// - outcome (Ende-Grund — replaces TherapyStatus extension)
// - usedCode (Protokolle)

* outcome MS
* outcome ^short = "Therapie-Status am Ende"
* outcome ^comment = "Aus dotbase: Status (abgeschlossen, abgebrochen, etc.) — ersetzt ehemalige TherapyStatus-Extension"

* reasonReference MS
* reasonReference ^short = "Bezogene Diagnose"

* note ^short = "Besonderheiten/Details zur Therapie"
* partOf ^short = "Teil einer übergeordneten Maßnahme"
