// ============================================================================
// CQL Library: OncoBox Brust Kennzahlen (KB-1 bis KB-20)
//
// DKG-Brustzentrum-Qualitaetsindikatoren gemaess OncoBox Brust 2.0 Spec
// (Auditjahr 2026). Berechnet pro Zentrum/Kohorte und wird in die
// OncoBox-Meldung als <Kennzahlen>-Block aggregiert.
//
// Konzeptueller Hinweis: Die *Strukturdaten* (Patienten/Diagnose/Histologie/…)
// werden via StructureMap (input/maps/SenologieToOncoBoxBrust.map) erzeugt,
// die *Kennzahlen* (Population-Aggregate) per CQL.
//
// Aufruf: POST /fhir/$cql mit
//   { library: "OncoBoxBrustKennzahlen", expression: "KB_15_Rate_Prozent" }
//
// Wo moeglich werden Defines aus SenologieQualitaetsindikatoren wiederverwendet
// (KB-Kennzahlen ueberlappen teils mit S3-QIs).
// ============================================================================

library OncoBoxBrustKennzahlen version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include QualitaetsindikatorenLeitlinie version '0.1.0' called S3

codesystem "SCT": 'http://snomed.info/sct'
codesystem "ICD10GM": 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem "LOINC": 'http://loinc.org'
codesystem "OPS": 'http://fhir.de/CodeSystem/bfarm/ops'

// ============================================================================
// KB-1: Postop. Fallbesprechung — Anteil mit postop. Tumorkonferenz
// ============================================================================
// Zaehler: invasive Karzinome mit dokumentierter postop. Tumorkonferenz
// Nenner: alle invasiven Karzinome
define "KB_01_Nenner": S3."Invasive Mammakarzinome"

define "KB_01_Zaehler":
  // TODO: filter auf CarePlan/ServiceRequest mit Tumorkonferenz-Typ "postop"
  S3."Invasive Mammakarzinome"

define "KB_01_Rate_Prozent":
  if Count(KB_01_Nenner) = 0 then 0.0
  else (Count(KB_01_Zaehler) * 100.0) / Count(KB_01_Nenner)

// ============================================================================
// KB-2: Praetherapeutische Fallbesprechung
// ============================================================================
define "KB_02_Nenner": S3."Invasive Mammakarzinome"

define "KB_02_Zaehler":
  // TODO: filter auf CarePlan mit Tumorkonferenz-Typ "praetherapeutisch"
  S3."Invasive Mammakarzinome"

define "KB_02_Rate_Prozent":
  if Count(KB_02_Nenner) = 0 then 0.0
  else (Count(KB_02_Zaehler) * 100.0) / Count(KB_02_Nenner)

// ============================================================================
// KB-7: Trastuzumab bei HER2-positiven Patientinnen
// ============================================================================
define "HER2 positiv":
  [Observation: Code '48676-1' from "LOINC"] O
    where O.value as CodeableConcept ~ "P"

define "KB_07_Nenner": "HER2 positiv"

define "KB_07_Zaehler":
  // TODO: MedicationAdministration mit Substanz Trastuzumab
  "HER2 positiv"

define "KB_07_Rate_Prozent":
  if Count(KB_07_Nenner) = 0 then 0.0
  else (Count(KB_07_Zaehler) * 100.0) / Count(KB_07_Nenner)

// ============================================================================
// KB-12: Praeoperative histologische Sicherung (~ S3-QI-2)
// ============================================================================
// Wiederverwendung der S3-QI-2-Logik (Stanz-/Vakuumbiopsie vor Ersteingriff)
define "KB_12_Zaehler": S3."QI_02_Zaehler"
define "KB_12_Nenner": S3."QI_02_Nenner"
define "KB_12_Rate_Prozent": S3."QI_02_Rate_Prozent"

// ============================================================================
// KB-13a: Anzahl Primaerfaelle (Fallzahl)
// ============================================================================
define "KB_13a_Anzahl": Count(S3."Invasive Mammakarzinome")

// KB-13b: Anzahl Rezidive/Metastasen
define "KB_13b_Anzahl":
  Count([Condition] C
    where C.category.coding.code contains 'rezidiv'
       or C.category.coding.code contains 'metastase')

// ============================================================================
// KB-15: BET-Rate bei pT1 (~ S3-QI-6/QI-8)
// ============================================================================
// Wiederverwendung
define "KB_15_Rate_Prozent": S3."QI_08_Rate_Prozent"

// ============================================================================
// KB-17: Lymphknoten-Entfernung (≥10 LK bei invasivem CA mit ALND)
// ============================================================================
define "Axilladissektionen": S3."Axilladissektion Operationen"

define "KB_17_Nenner": "Axilladissektionen"

define "KB_17_Zaehler":
  // TODO: Korreliere ALND mit Observation 21894-1 (LK untersucht) >= 10
  "Axilladissektionen"

define "KB_17_Rate_Prozent":
  if Count(KB_17_Nenner) = 0 then 0.0
  else (Count(KB_17_Zaehler) * 100.0) / Count(KB_17_Nenner)

// ============================================================================
// KB-18: Drahtmarkierung bei nicht-tastbaren Befunden
// ============================================================================
define "KB_18_Nenner":
  // TODO: filter auf Faelle mit nicht-tastbarem Befund (Klinische_Untersuchung)
  S3."Invasive Mammakarzinome"

define "KB_18_Zaehler":
  // TODO: filter auf ServiceRequest mit preOpMarkierung-Extension
  S3."Invasive Mammakarzinome"

define "KB_18_Rate_Prozent":
  if Count(KB_18_Nenner) = 0 then 0.0
  else (Count(KB_18_Zaehler) * 100.0) / Count(KB_18_Nenner)

// ============================================================================
// KB-19: Revisionsoperationen
// ============================================================================
define "KB_19_Nenner": Count(S3."Alle Brustoperationen")

define "KB_19_Zaehler":
  Count([Procedure: code in "OPS"] P
    where P.statusReason.coding.code contains 'revision')

define "KB_19_Rate_Prozent":
  if KB_19_Nenner = 0 then 0.0
  else (KB_19_Zaehler * 100.0) / KB_19_Nenner

// ============================================================================
// HINWEIS: KB-3, KB-4, KB-5, KB-6, KB-8, KB-9, KB-10, KB-10b, KB-11, KB-11b,
// KB-14, KB-16, KB-20 sind als TODOs offen. Diese werden in einer
// Folge-Iteration ergaenzt — die Patientendaten dafuer sind aber bereits
// in den FHIR-Profilen (Procedure / MedicationAdministration / Observation /
// CarePlan / ResearchSubject) modelliert.
// ============================================================================
