Profile: Senologie_Strahlentherapie
Parent: MII_PR_Onko_Strahlentherapie_Bestrahlung_Strahlentherapie
Id: senologie-strahlentherapie
Title: "BIH Senologie Strahlentherapie"
Description: "Procedure für Strahlentherapie aus dotbase Questionnaire 'Strahlentherapie ESP-PECS'. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #completed (exactly)
* status ^short = "Durchgeführt"

// category inherited from MII parent: SCT#1287742003 "Radiotherapy (procedure)"

* code MS
* code.coding ^short = "Strahlentherapie-Typ"
* code.text ^short = "Bestrahlung"

* subject MS

// Inherited from MII Bestrahlung parent:
// - extension:Gesamtdosis, extension:Boost, extension:Applikationsart
// - bodySite with extension:Seitenlokalisation
// - performed[x] with performedPeriod slice

* bodySite MS
* bodySite ^short = "Bestrahlungsregion"

// Behandlungsintention
* extension contains MII_EX_Onko_Strahlentherapie_Intention named Intention 0..1
* extension[Intention] ^short = "Behandlungsintention"
* extension[Intention] ^comment = "Aus dotbase: 'Zeitpunkt' (adjuvant, neoadjuvant, palliativ)"

// Senologie-spezifisch
* extension contains EX_Senologie_SessionCount named sessionCount 0..1
* extension[sessionCount] ^short = "Anzahl der Bestrahlungssitzungen"

* note ^short = "Detaillierte Beschreibung"
* reasonReference MS
* reasonReference ^short = "Bezogene Diagnose"
* partOf MS
* partOf ^short = "Zugehörige Strahlentherapie-Session"
