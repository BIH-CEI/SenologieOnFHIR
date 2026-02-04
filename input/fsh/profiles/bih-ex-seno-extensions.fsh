// ============================================================
// Senologie Extensions
// ============================================================
// Extracted from inline extension definitions across profiles.
// Organized by source profile.

// --- Pathologie Befund Extensions ---

Extension: EX_Senologie_PathologyLab
Id: ex-senologie-pathology-lab
Title: "Pathologisches Institut"
Description: "Pathologisches Institut / Labor"
* value[x] only string

Extension: EX_Senologie_SpecimenType
Id: ex-senologie-specimen-type
Title: "Art des Präparats"
Description: "Art des pathologischen Präparats (z.B. Biopsie, Resektat)"
* value[x] only CodeableConcept

Extension: EX_Senologie_Localization
Id: ex-senologie-localization
Title: "Lokalisation des Präparats"
Description: "Lokalisation des Präparats"
* value[x] only CodeableConcept or string

Extension: EX_Senologie_BodySideOfSpecimen
Id: ex-senologie-body-side-of-specimen
Title: "Seite des Präparats"
Description: "Seite des Präparats (Links/Rechts/Beidseits)"
* value[x] only CodeableConcept

Extension: EX_Senologie_ClockPosition
Id: ex-senologie-clock-position
Title: "Uhrzeitposition des Befunds"
Description: "Uhrzeitposition im Drüsenquadranten (12-Uhr-Position)"
* value[x] only CodeableConcept

Extension: EX_Senologie_NippleDistance
Id: ex-senologie-nipple-distance
Title: "Mamillenabstand"
Description: "Abstand zur Mamille in mm"
* value[x] only Quantity

Extension: EX_Senologie_SpecimenCollectionTiming
Id: ex-senologie-specimen-collection-timing
Title: "Zeitpunkt Präparateentnahme"
Description: "Zeitpunkt der Präparateentnahme (intraoperativ, präoperativ, etc.)"
* value[x] only CodeableConcept

Extension: EX_Senologie_HistologyFindings
Id: ex-senologie-histology-findings
Title: "Histologie allgemein"
Description: "Histologische Befunde (Diagnosekode)"
* value[x] only CodeableConcept

Extension: EX_Senologie_B3LesionDetails
Id: ex-senologie-b3-lesion-details
Title: "Details B3 Läsion"
Description: "Details zur B3 Läsion (wenn Diagnose = B3)"
* value[x] only CodeableConcept

// --- OP Planung Extensions ---

Extension: EX_Senologie_OperationsDuration
Id: ex-senologie-operations-duration
Title: "Geplante OP-Dauer"
Description: "Geplante OP-Dauer in Minuten"
* value[x] only Duration

Extension: EX_Senologie_TumorConferenceConsent
Id: ex-senologie-tumor-conference-consent
Title: "CA-Behandlung/Tumorkonferenz-Zustimmung"
Description: "CA-Behandlung / Tumorkonferenz-Zustimmung (Ja/Nein)"
* value[x] only CodeableConcept

Extension: EX_Senologie_PreOpMarkierung
Id: ex-senologie-pre-op-markierung
Title: "Präoperative Markierung"
Description: "Präoperative Markierung geplant"
* value[x] only CodeableConcept

Extension: EX_Senologie_PreOpBlutabnahme
Id: ex-senologie-pre-op-blutabnahme
Title: "Präoperative Blutabnahme"
Description: "Präoperative Blutabnahme geplant"
* value[x] only CodeableConcept

Extension: EX_Senologie_PreOpAntibiotikatherapie
Id: ex-senologie-pre-op-antibiotikatherapie
Title: "Präoperative Antibiotikatherapie"
Description: "Präoperative Antibiotikatherapie"
* value[x] only CodeableConcept or string

Extension: EX_Senologie_OperatingTableSetup
Id: ex-senologie-operating-table-setup
Title: "OP-Lagerung/Tischanordnung"
Description: "OP-Lagerung und Tischanordnung"
* value[x] only CodeableConcept

// --- Strahlentherapie Extensions ---

Extension: EX_Senologie_RadiationTarget
Id: ex-senologie-radiation-target
Title: "Bestrahlungsziel"
Description: "Bestrahlungsziel (Brust, Brustwand, regionale Lymphknoten, etc.)"
* value[x] only CodeableConcept

Extension: EX_Senologie_BoostApplied
Id: ex-senologie-boost-applied
Title: "Boost durchgeführt"
Description: "Boost-Bestrahlung durchgeführt (Ja/Nein/Optional)"
* value[x] only CodeableConcept

Extension: EX_Senologie_RadiationTargetOrgan
Id: ex-senologie-radiation-target-organ
Title: "Bestrahltes Organ"
Description: "Bestrahltes Organ bei Fernmetastasen-Bestrahlung"
* value[x] only CodeableConcept

Extension: EX_Senologie_TotalDoseGy
Id: ex-senologie-total-dose-gy
Title: "Gesamtdosis in Gray"
Description: "Gesamtdosis der Bestrahlung in Gray"
* value[x] only Quantity

Extension: EX_Senologie_SessionCount
Id: ex-senologie-session-count
Title: "Anzahl Bestrahlungssitzungen"
Description: "Anzahl der Bestrahlungssitzungen"
* value[x] only Quantity

Extension: EX_Senologie_TreatmentIntention
Id: ex-senologie-treatment-intention
Title: "Behandlungsintention"
Description: "Behandlungsintention (adjuvant, neoadjuvant, palliativ)"
* value[x] only CodeableConcept

// --- Systemtherapie Extensions ---

Extension: EX_Senologie_TherapyCycle
Id: ex-senologie-therapy-cycle
Title: "Therapie-Zyklus"
Description: "Nummer des Therapie-Zyklus (1, 2, 3, etc.)"
* value[x] only integer

Extension: EX_Senologie_DayInCycle
Id: ex-senologie-day-in-cycle
Title: "Tag im Zyklus"
Description: "Tag innerhalb eines Therapie-Zyklus"
* value[x] only integer

Extension: EX_Senologie_TherapyStatus
Id: ex-senologie-therapy-status
Title: "Therapie-Status"
Description: "Therapie-Status am Ende (abgeschlossen, abgebrochen, etc.)"
* value[x] only CodeableConcept

// --- Geplante Systemtherapie Extensions ---

Extension: EX_Senologie_TherapyLine
Id: ex-senologie-therapy-line
Title: "Therapielinie"
Description: "Therapielinie (1. Linie, 2. Linie, etc.)"
* value[x] only integer

Extension: EX_Senologie_TherapyProtocol
Id: ex-senologie-therapy-protocol
Title: "Therapieprotokoll"
Description: "Geplantes Therapieprotokoll/Schema"
* value[x] only CodeableConcept

// --- Operative Komplikation Extensions ---

Extension: EX_Senologie_ClavienDindoGrade
Id: ex-senologie-clavien-dindo-grade
Title: "Clavien-Dindo-Klassifikation"
Description: "Detaillierte Clavien-Dindo-Klassifikation (Grade I, II, IIIa, IIIb, IVa, IVb, V)"
* value[x] only CodeableConcept

Extension: EX_Senologie_ComplicationTiming
Id: ex-senologie-complication-timing
Title: "Zeitpunkt der Komplikation"
Description: "Zeitpunkt der Komplikation (intraoperativ, postoperativ, stationär, ambulant)"
* value[x] only CodeableConcept
