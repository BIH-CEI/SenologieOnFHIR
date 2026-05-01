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

// category required by proc-mii-1 when OPS coded (parent may set it but SUSHI cannot resolve)
* category = $SCT#18629005 "Administration of medication"

* code MS
* code.coding ^short = "Systemtherapie-Typ"
* code.text ^short = "Systemtherapie"

* subject MS

// Inherited from MII Onko Systemtherapie parent:
// - extension:Intention (Therapieintention)
// - performed[x] with performedPeriod slice (Beginn/Ende)
// - outcome (Ende-Grund — replaces TherapyStatus extension)
// - usedCode (Protokolle)

// Therapielinie + First-Line-Flag (OncoBox I02 / KB-8)
* extension contains
    EX_Senologie_TherapyLine named therapyLine 0..1 and
    EX_Senologie_FirstLineTherapy named firstLine 0..1
* extension[therapyLine] ^short = "Therapielinie (1, 2, 3, ...)"
* extension[firstLine] ^short = "First-Line bei Metastasierung (KB-8)"

* outcome MS
* outcome ^short = "Therapie-Status am Ende"
* outcome ^comment = "Aus dotbase: Status (abgeschlossen, abgebrochen, etc.) — ersetzt ehemalige TherapyStatus-Extension"

* usedCode MS
* usedCode ^short = "Therapieprotokoll (z.B. EC-Pac, TCH)"
* usedCode ^comment = "Protokollbezeichnung aus dotbase / MII Onko Protokolle"

* reasonReference MS
* reasonReference ^short = "Bezogene Diagnose"

* note ^short = "Besonderheiten/Details zur Therapie"
* partOf ^short = "Teil einer übergeordneten Maßnahme"
