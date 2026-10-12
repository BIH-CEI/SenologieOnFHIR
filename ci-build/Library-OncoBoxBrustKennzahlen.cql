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
// SELF-CONTAINED: Foundation-Defines (Diagnose/OP-Filter) sind lokal dupliziert,
// damit die Library OHNE Cross-Library-Include auskommt. HAPI Clinical Reasoning
// bricht sonst beim Measure $evaluate-measure (NPE in MeasureEvaluator).
// Single Source of Truth fuer die klinischen Konzepte sind weiterhin die
// ValueSets/Profile im Senologie-KDS.
// ============================================================================

library OncoBoxBrustKennzahlen version '0.4.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "SCT": 'http://snomed.info/sct'
codesystem "ICD10GM": 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem "LOINC": 'http://loinc.org'
codesystem "OPS": 'http://fhir.de/CodeSystem/bfarm/ops'

// ============================================================================
// Foundation: Diagnose-Filter
// ============================================================================

define "Invasive Mammakarzinome":
  [Condition] C
    where exists(C.code.coding c where c.system = 'http://snomed.info/sct' and c.code = '254837009')

define "DCIS Diagnosen":
  [Condition] C
    where exists(C.code.coding c where c.system = 'http://snomed.info/sct' and c.code = '109889007')

define "Invasive oder DCIS":
  "Invasive Mammakarzinome" union "DCIS Diagnosen"

// ============================================================================
// Foundation: OP-Filter (SNOMED CT primaer, OPS als Fallback)
// ============================================================================

define "Brust Biopsien":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '119738008' or c.code = '1188850001'
          or c.code = '122548005' or c.code = '274474001'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops'
        and (c.code.startsWith('1-490') or c.code.startsWith('1-491') or c.code.startsWith('1-494'))))

define "BET Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '392021009' or c.code = '392090004' or c.code = '64368001'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-870')))

define "Mastektomie Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '172043006' or c.code = '359740005' or c.code = '392011008'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops'
        and (c.code.startsWith('5-872') or c.code.startsWith('5-871'))))

define "Axilladissektion Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '234262008' or c.code = '110469001'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-402')))

define "Alle Brustoperationen":
  "BET Operationen" union "Mastektomie Operationen"

// ============================================================================
// Shared QI/KB-Logik: Praeoperative histologische Sicherung
// (Basis fuer S3-QI-2 und OncoBox KB-12 — identische klinische Logik)
// ============================================================================

define "Praeop_Sicherung_Zaehler":
  "Invasive oder DCIS" C
    where exists("Brust Biopsien")
       or exists(C.verificationStatus.coding c
            where c.system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung'
              and (c.code = '7' or c.code = '8'))

define "Praeop_Sicherung_Nenner":
  "Invasive oder DCIS"

// ============================================================================
// KB-1: Postop. Fallbesprechung — Anteil mit postop. Tumorkonferenz
// ============================================================================
define "KB_01_Nenner": "Invasive Mammakarzinome"

define "KB_01_Zaehler":
  // TODO: filter auf CarePlan/ServiceRequest mit Tumorkonferenz-Typ "postop"
  "Invasive Mammakarzinome"

define "KB_01_Rate_Prozent":
  if Count(KB_01_Nenner) = 0 then 0.0
  else (Count(KB_01_Zaehler) * 100.0) / Count(KB_01_Nenner)

// ============================================================================
// KB-2: Praetherapeutische Fallbesprechung
// ============================================================================
define "KB_02_Nenner": "Invasive Mammakarzinome"

define "KB_02_Zaehler":
  // TODO: filter auf CarePlan mit Tumorkonferenz-Typ "praetherapeutisch"
  "Invasive Mammakarzinome"

define "KB_02_Rate_Prozent":
  if Count(KB_02_Nenner) = 0 then 0.0
  else (Count(KB_02_Zaehler) * 100.0) / Count(KB_02_Nenner)

// ============================================================================
// KB-7: Trastuzumab bei HER2-positiven Patientinnen
// ============================================================================
define "HER2 positiv":
  // TODO: refine — aktuell alle Observations mit LOINC 48676-1 ohne Wert-Filter.
  // Proper check braucht LOINC-Answer-Code LA6576-8 (Positive) ODER SCT-Coding.
  [Observation: Code '48676-1' from "LOINC"]

define "KB_07_Nenner": "HER2 positiv"

define "KB_07_Zaehler":
  // TODO: MedicationAdministration mit Substanz Trastuzumab
  "HER2 positiv"

define "KB_07_Rate_Prozent":
  if Count(KB_07_Nenner) = 0 then 0.0
  else (Count(KB_07_Zaehler) * 100.0) / Count(KB_07_Nenner)

// ============================================================================
// KB-12: Praeoperative histologische Sicherung
// Identische klinische Logik wie S3-QI-2.
// ============================================================================
define "KB_12_Zaehler":   "Praeop_Sicherung_Zaehler"
define "KB_12_Nenner":    "Praeop_Sicherung_Nenner"

define "KB_12_Rate_Prozent":
  if Count(KB_12_Nenner) = 0 then 0.0
  else (Count(KB_12_Zaehler) * 100.0) / Count(KB_12_Nenner)

// Boolean-Wrapper fuer Measure /$evaluate-measure (populationBasis=boolean)
define "HasKB12InitialPop": exists("KB_12_Nenner")
define "HasKB12Nenner":     exists("KB_12_Nenner")
define "HasKB12Zaehler":    exists("KB_12_Zaehler")

// ============================================================================
// KB-13a: Anzahl Primaerfaelle (Fallzahl)
// ============================================================================
define "KB_13a_Anzahl": Count("Invasive Mammakarzinome")

// KB-13b: Anzahl Rezidive/Metastasen
define "KB_13b_Anzahl":
  Count([Condition] C
    where C.category.coding.code contains 'rezidiv'
       or C.category.coding.code contains 'metastase')

// ============================================================================
// KB-15: BET-Rate bei pT1 (analog S3-QI-8 — TODO, eigene Defines noetig)
// ============================================================================
define "KB_15_Nenner":
  // TODO: filter Invasive Mammakarzinome auf pT1
  "Invasive Mammakarzinome"

define "KB_15_Zaehler":
  // TODO: pT1 + BET
  "BET Operationen"

define "KB_15_Rate_Prozent":
  if Count(KB_15_Nenner) = 0 then 0.0
  else (Count(KB_15_Zaehler) * 100.0) / Count(KB_15_Nenner)

// ============================================================================
// KB-17: Lymphknoten-Entfernung (≥10 LK bei invasivem CA mit ALND)
// ============================================================================
define "KB_17_Nenner": "Axilladissektion Operationen"

define "KB_17_Zaehler":
  // TODO: Korreliere ALND mit Observation 21894-1 (LK untersucht) >= 10
  "Axilladissektion Operationen"

define "KB_17_Rate_Prozent":
  if Count(KB_17_Nenner) = 0 then 0.0
  else (Count(KB_17_Zaehler) * 100.0) / Count(KB_17_Nenner)

// ============================================================================
// KB-18: Drahtmarkierung bei nicht-tastbaren Befunden
// ============================================================================
define "KB_18_Nenner":
  // TODO: filter auf Faelle mit nicht-tastbarem Befund (Klinische_Untersuchung)
  "Invasive Mammakarzinome"

define "KB_18_Zaehler":
  // TODO: filter auf ServiceRequest mit preOpMarkierung-Extension
  "Invasive Mammakarzinome"

define "KB_18_Rate_Prozent":
  if Count(KB_18_Nenner) = 0 then 0.0
  else (Count(KB_18_Zaehler) * 100.0) / Count(KB_18_Nenner)

// ============================================================================
// KB-19: Revisionsoperationen
// ============================================================================
define "KB_19_Nenner": Count("Alle Brustoperationen")

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
