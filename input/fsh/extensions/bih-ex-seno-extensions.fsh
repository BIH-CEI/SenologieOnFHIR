// ============================================================
// Senologie Custom Extensions (10 remaining)
// ============================================================
// After refactoring to MII parent profiles, only extensions
// without adequate native FHIR or MII equivalents remain.

// === OP Planung (6 Extensions) ===
// Used by: Senologie_OP_Planung (ServiceRequest)

Extension: EX_Senologie_OperationsDuration
Id: ex-senologie-operations-duration
Title: "Geplante OP-Dauer"
Description: "Geplante OP-Dauer in Minuten — ServiceRequest hat kein duration-Element"
* value[x] only Duration

Extension: EX_Senologie_TumorConferenceConsent
Id: ex-senologie-tumor-conference-consent
Title: "CA-Behandlung/Tumorkonferenz-Zustimmung"
Description: "CA-Behandlung / Tumorkonferenz-Zustimmung (Ja/Nein) — kein natives FHIR-Äquivalent"
* value[x] only CodeableConcept

Extension: EX_Senologie_PreOpMarkierung
Id: ex-senologie-pre-op-markierung
Title: "Präoperative Markierung"
Description: "Präoperative Markierung geplant — ServiceRequest hat kein usedCode"
* value[x] only CodeableConcept

Extension: EX_Senologie_PreOpBlutabnahme
Id: ex-senologie-pre-op-blutabnahme
Title: "Präoperative Blutabnahme"
Description: "Präoperative Blutabnahme geplant — kein natives FHIR-Äquivalent"
* value[x] only CodeableConcept

Extension: EX_Senologie_PreOpAntibiotikatherapie
Id: ex-senologie-pre-op-antibiotikatherapie
Title: "Präoperative Antibiotikatherapie"
Description: "Präoperative Antibiotikatherapie — kein natives FHIR-Äquivalent"
* value[x] only CodeableConcept or string

Extension: EX_Senologie_OperatingTableSetup
Id: ex-senologie-operating-table-setup
Title: "OP-Lagerung/Tischanordnung"
Description: "OP-Lagerung und Tischanordnung — kein natives FHIR-Äquivalent"
* value[x] only CodeableConcept

// === Strahlentherapie (2 Extensions) ===
// Used by: Senologie_Strahlentherapie (Procedure)

Extension: EX_Senologie_SessionCount
Id: ex-senologie-session-count
Title: "Anzahl Bestrahlungssitzungen"
Description: "Anzahl der Bestrahlungssitzungen — MII Onko hat kein Fraktionszahl-Element"
* value[x] only Quantity

Extension: EX_Senologie_Einzeldosis
Id: ex-senologie-einzeldosis
Title: "Einzeldosis pro Fraktion"
Description: "Einzeldosis pro Bestrahlungsfraktion in Gy — OncoBox 2.0 H10, oBDS Einzeldosis"
* value[x] only Quantity

// === Systemtherapie Medikation (2 Extensions) ===
// Used by: Senologie_Systemtherapie_Medikation (MedicationStatement)

Extension: EX_Senologie_TherapyCycle
Id: ex-senologie-therapy-cycle
Title: "Therapie-Zyklus"
Description: "Nummer des Therapie-Zyklus (1, 2, 3, etc.) — MII Onko hat kein cycle tracking"
* value[x] only integer

Extension: EX_Senologie_DayInCycle
Id: ex-senologie-day-in-cycle
Title: "Tag im Zyklus"
Description: "Tag innerhalb eines Therapie-Zyklus — MII Onko hat kein day-in-cycle"
* value[x] only integer

// === Geplante Systemtherapie (1 Extension) ===
// Used by: Senologie_Geplante_Systemtherapie (MedicationRequest)

// === Bildgebung (1 Extension) ===
// Used by: Senologie_Bildgebung_Befund (DiagnosticReport)

Extension: EX_Senologie_ExaminationLocation
Id: ex-senologie-examination-location
Title: "Standort der Untersuchung"
Description: "Standort/Einrichtung der bildgebenden Untersuchung — DiagnosticReport hat kein location-Element"
* value[x] only string or Reference(Location)

Extension: EX_Senologie_TherapyLine
Id: ex-senologie-therapy-line
Title: "Therapielinie"
Description: "Therapielinie (1. Linie, 2. Linie, etc.) — kein natives FHIR-Äquivalent"
* value[x] only integer
