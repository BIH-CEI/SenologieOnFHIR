Profile: Senologie_Strahlentherapie
Parent: Procedure
Id: senologie-strahlentherapie
Title: "BIH Senologie Strahlentherapie"
Description: "Procedure für Strahlentherapie aus dotbase Questionnaire 'Strahlentherapie ESP-PECS'"

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
* subject only Reference(Patient)

* performedPeriod MS
* performedPeriod.start ^short = "Therapie-Beginn"
* performedPeriod.start ^comment = "Aus dotbase: 'Beginn' (date)"
* performedPeriod.end ^short = "Therapie-Ende"
* performedPeriod.end ^comment = "Aus dotbase: 'Ende' (date)"

// Bestrahlungsregion/Seite
* bodySite ^short = "Bestrahlungsregion"
* bodySite ^comment = "Aus dotbase: 'Seite lokoregionale Bestrahlung' (Links/Rechts/Beidseits)"

// Lokoregionäre Bestrahlung (Brust/Brustwand/regional Lymphknoten)
* extension contains EX_Senologie_RadiationTarget named radiationTarget 0..1
* extension[radiationTarget] ^short = "Bestrahlungsziel"
* extension[radiationTarget] ^comment = "Aus dotbase: 'Lokoregionäre Bestrahlung' (Brust, Brustwand, regionale LK, etc.)"

// Boost (zusätzliche Dosierung in kleinerem Feld)
* extension contains EX_Senologie_BoostApplied named boostApplied 0..1
* extension[boostApplied] ^short = "Boost durchgeführt"
* extension[boostApplied] ^comment = "Aus dotbase: 'Boost' (Ja/Nein/Optional)"

// Betroffenes Organ (bei Palliativbestrahlung)
* extension contains EX_Senologie_RadiationTargetOrgan named radiationTargetOrgan 0..1
* extension[radiationTargetOrgan] ^short = "Bestrahltes Organ (bei Fernmetastasen)"
* extension[radiationTargetOrgan] ^comment = "Aus dotbase: 'Organ' (bei Fernmetastasen-Bestrahlung)"

// Dosimetrie
* extension contains EX_Senologie_TotalDoseGy named totalDoseGy 0..1
* extension[totalDoseGy] ^short = "Gesamtdosis in Gray"
* extension[totalDoseGy] ^comment = "Aus dotbase: 'Gesamtdosis Gy' (integer in Gy)"

* extension contains EX_Senologie_SessionCount named sessionCount 0..1
* extension[sessionCount] ^short = "Anzahl der Bestrahlungssitzungen"
* extension[sessionCount] ^comment = "Aus dotbase: 'Anzahl Sitzungen' (decimal)"

// Freitext Dokumentation
* note ^short = "Detaillierte Beschreibung"
* note ^comment = "Aus dotbase: 'Freitext' - Technik, Besonderheiten, etc."

// Behandlungsintention
* extension contains EX_Senologie_TreatmentIntention named treatmentIntention 0..1
* extension[treatmentIntention] ^short = "Behandlungsintention"
* extension[treatmentIntention] ^comment = "Aus dotbase: 'Zeitpunkt' (adjuvant, neoadjuvant, palliativ)"

// Bezug zu Diagnose
* reasonReference MS
* reasonReference only Reference(Condition)
* reasonReference ^short = "Bezogene Diagnose"
