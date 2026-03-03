Profile: Senologie_Strahlentherapie
Parent: MII_PR_Onko_Strahlentherapie_Bestrahlung_Strahlentherapie
Id: senologie-strahlentherapie
Title: "BIH Senologie Strahlentherapie"
Description: "Procedure für Strahlentherapie aus dotbase Questionnaire 'Strahlentherapie ESP-PECS'. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung."

* insert PR_CS_VS_Version
* ^status = #draft

// Basis Mapping aus dotbase
* status MS
* status = #completed (exactly)
* status ^short = "Durchgeführt"

* code MS
* code.coding ^short = "Strahlentherapie-Typ"
* code.coding ^comment = "Aus dotbase: 'Lokalisation der Strahlentherapie' + 'Zeitpunkt' (adjuvant, neoadjuvant, etc.)"
* code.text = "Bestrahlung"

* subject MS

* performedPeriod MS
* performedPeriod.start ^short = "Therapie-Beginn"
* performedPeriod.start ^comment = "Aus dotbase: 'Beginn' (date)"
* performedPeriod.end ^short = "Therapie-Ende"
* performedPeriod.end ^comment = "Aus dotbase: 'Ende' (date)"

// Inherited from MII Bestrahlung parent:
// - extension:Gesamtdosis (replaces EX_Senologie_TotalDoseGy)
// - extension:Boost (replaces EX_Senologie_BoostApplied)
// - bodySite with extension:Seitenlokalisation (replaces EX_Senologie_RadiationTarget + RadiationTargetOrgan)

// Bestrahlungsregion/Seite (inherited bodySite + Seitenlokalisation)
* bodySite MS
* bodySite ^short = "Bestrahlungsregion"
* bodySite ^comment = "Bestrahlungsziel inkl. Seitenlokalisation — aus dotbase: 'Seite lokoregionale Bestrahlung', 'Lokoregionäre Bestrahlung', 'Organ'"

// Behandlungsintention (from MII Onko top-level Strahlentherapie)
* extension contains MII_EX_Onko_Strahlentherapie_Intention named Intention 0..1
* extension[Intention] ^short = "Behandlungsintention"
* extension[Intention] ^comment = "Aus dotbase: 'Zeitpunkt' (adjuvant, neoadjuvant, palliativ)"

// Senologie-spezifisch: Anzahl Bestrahlungssitzungen (no MII equivalent)
* extension contains EX_Senologie_SessionCount named sessionCount 0..1
* extension[sessionCount] ^short = "Anzahl der Bestrahlungssitzungen"
* extension[sessionCount] ^comment = "Aus dotbase: 'Anzahl Sitzungen' (decimal)"

// Freitext Dokumentation
* note ^short = "Detaillierte Beschreibung"
* note ^comment = "Aus dotbase: 'Freitext' - Technik, Besonderheiten, etc."

// Bezug zu Diagnose
* reasonReference MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Bezogene Diagnose"

// partOf bleibt offen für Verknüpfung zu MII Strahlentherapie-Session
* partOf MS
* partOf ^short = "Zugehörige Strahlentherapie-Session"
