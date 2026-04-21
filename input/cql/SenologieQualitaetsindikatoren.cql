// ============================================================================
// CQL Library: Senologie Qualitätsindikatoren
// S3-Leitlinie Mammakarzinom v5.0, Kapitel 8 (17 QIs)
// ============================================================================
// Testbar gegen die synthetische Kohorte (12 Patientinnen auf HAPI :8095).
// Aufruf: POST /fhir/$cql mit expression = "QI_xx_Rate_Prozent"
// ============================================================================

library SenologieQualitaetsindikatoren version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

// --- Codesysteme ---
codesystem "SCT": 'http://snomed.info/sct'
codesystem "ICD10GM": 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem "LOINC": 'http://loinc.org'
codesystem "OPS": 'http://fhir.de/CodeSystem/bfarm/ops'
codesystem "CondClinical": 'http://terminology.hl7.org/CodeSystem/condition-clinical'

// ============================================================================
// Hilfsdefinitionen
// ============================================================================

define "Alle Patienten":
  [Patient]

define "Alle Conditions":
  [Condition]

define "Invasive Mammakarzinome":
  [Condition] C
    where exists(C.code.coding c where c.system = 'http://snomed.info/sct' and c.code = '254837009')

define "DCIS Diagnosen":
  [Condition] C
    where exists(C.code.coding c where c.system = 'http://snomed.info/sct' and c.code = '109889007')

define "Invasive oder DCIS":
  "Invasive Mammakarzinome" union "DCIS Diagnosen"

define "Alle Prozeduren":
  [Procedure]

define "BET Operationen":
  [Procedure] P
    where exists(P.code.coding c where c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-870'))

define "Mastektomie Operationen":
  [Procedure] P
    where exists(P.code.coding c where c.system = 'http://fhir.de/CodeSystem/bfarm/ops'
      and (c.code.startsWith('5-872') or c.code.startsWith('5-871')))

define "SNB Operationen":
  [Procedure] P
    where exists(P.code.coding c where c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-401'))

define "Axilladissektion Operationen":
  [Procedure] P
    where exists(P.code.coding c where c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-402'))

define "Alle Brustoperationen":
  "BET Operationen" union "Mastektomie Operationen"

define "Strahlentherapien":
  [Procedure] P
    where exists(P.code.coding c where c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('8-52'))
    or P.meta.profile.value contains 'https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie'

// ============================================================================
// QI-2: Prätherapeutische histologische Sicherung
// Ziel: möglichst viele mit Stanz-/Vakuumbiopsie vor Ersteingriff
// ============================================================================

define "QI_02_Zaehler":
  "Invasive oder DCIS" C
    where exists(
      [Procedure] P
        where P.subject.reference = C.subject.reference
          and exists(P.code.coding c where c.system = 'http://fhir.de/CodeSystem/bfarm/ops'
            and (c.code.startsWith('1-490') or c.code.startsWith('1-491') or c.code.startsWith('1-494')))
    )

define "QI_02_Nenner":
  "Invasive oder DCIS"

define "QI_02_Rate_Prozent":
  if Count("QI_02_Nenner") > 0
  then (Count("QI_02_Zaehler") * 100) / Count("QI_02_Nenner")
  else null

// ============================================================================
// QI-4: Axilläre LK-Entfernung bei DCIS (INVERS — möglichst WENIGE)
// Ziel: < 5% mit Axilla-OP bei DCIS + BET
// ============================================================================

define "DCIS mit BET":
  "DCIS Diagnosen" C
    where exists(
      "BET Operationen" P where P.subject.reference = C.subject.reference
    )

define "QI_04_Zaehler":
  "DCIS mit BET" C
    where exists(
      ("SNB Operationen" union "Axilladissektion Operationen") P
        where P.subject.reference = C.subject.reference
    )

define "QI_04_Nenner":
  "DCIS mit BET"

define "QI_04_Rate_Prozent":
  if Count("QI_04_Nenner") > 0
  then (Count("QI_04_Zaehler") * 100) / Count("QI_04_Nenner")
  else null

// ============================================================================
// QI-6: SNB bei pN0 ohne Neoadjuvanz
// Ziel: möglichst viele mit SNB statt Axilladissektion
// ============================================================================

define "QI_06_Zaehler":
  "Invasive Mammakarzinome" C
    where exists("SNB Operationen" P where P.subject.reference = C.subject.reference)

define "QI_06_Nenner":
  "Invasive Mammakarzinome"

define "QI_06_Rate_Prozent":
  if Count("QI_06_Nenner") > 0
  then (Count("QI_06_Zaehler") * 100) / Count("QI_06_Nenner")
  else null

// ============================================================================
// QI-8: Strahlentherapie nach BET
// Ziel: adäquate Rate an Bestrahlung nach BET bei invasivem MaCa
// ============================================================================

define "Invasiv mit BET":
  "Invasive Mammakarzinome" C
    where exists("BET Operationen" P where P.subject.reference = C.subject.reference)

define "QI_08_Zaehler":
  "Invasiv mit BET" C
    where exists("Strahlentherapien" P where P.subject.reference = C.subject.reference)

define "QI_08_Nenner":
  "Invasiv mit BET"

define "QI_08_Rate_Prozent":
  if Count("QI_08_Nenner") > 0
  then (Count("QI_08_Zaehler") * 100) / Count("QI_08_Nenner")
  else null

// ============================================================================
// QI-9: Endokrine Therapie bei rezeptorpositivem Befund
// Ziel: möglichst viele HR+ Patientinnen mit endokriner Therapie
// ============================================================================

define "QI_09_Zaehler":
  "Invasive Mammakarzinome" C
    where exists(
      [MedicationStatement] M
        where M.subject.reference = C.subject.reference
          and exists(M.medication.coding c where
            c.code in {'386911006', '373562007', '387104004', '387003001'}
          )
    )

define "QI_09_Nenner":
  "Invasive Mammakarzinome"

define "QI_09_Rate_Prozent":
  if Count("QI_09_Nenner") > 0
  then (Count("QI_09_Zaehler") * 100) / Count("QI_09_Nenner")
  else null

// ============================================================================
// QI-11: R0-Resektion bei invasivem Mammakarzinom
// Ziel: möglichst häufig R0
// ============================================================================

define "Operationen bei invasivem MaCa":
  "Alle Brustoperationen" P
    where exists(
      "Invasive Mammakarzinome" C where C.subject.reference = P.subject.reference
    )

define "QI_11_Zaehler":
  "Operationen bei invasivem MaCa" P
    where P.outcome.text.value contains 'R0'
      or exists(P.outcome.coding c where c.code = 'R0')

define "QI_11_Nenner":
  "Operationen bei invasivem MaCa"

define "QI_11_Rate_Prozent":
  if Count("QI_11_Nenner") > 0
  then (Count("QI_11_Zaehler") * 100) / Count("QI_11_Nenner")
  else null

// ============================================================================
// QI-12: ER/PR Bestimmung mit % und Intensität
// Ziel: möglichst alle mit vollständiger IHC-Angabe
// ============================================================================

define "QI_12_Zaehler":
  "Invasive Mammakarzinome" C
    where exists(
      [DiagnosticReport] DR
        where DR.subject.reference = C.subject.reference
          and DR.conclusion.value contains 'ER'
          and DR.conclusion.value contains 'PR'
    )

define "QI_12_Nenner":
  "Invasive Mammakarzinome"

define "QI_12_Rate_Prozent":
  if Count("QI_12_Nenner") > 0
  then (Count("QI_12_Zaehler") * 100) / Count("QI_12_Nenner")
  else null

// ============================================================================
// QI-13: HER2 Score nach ASCO/CAP
// Ziel: möglichst alle mit HER2-Score (0, 1+, 2+, 3+)
// ============================================================================

define "QI_13_Zaehler":
  "Invasive Mammakarzinome" C
    where exists(
      [DiagnosticReport] DR
        where DR.subject.reference = C.subject.reference
          and DR.conclusion.value contains 'HER2'
    )

define "QI_13_Nenner":
  "Invasive Mammakarzinome"

define "QI_13_Rate_Prozent":
  if Count("QI_13_Nenner") > 0
  then (Count("QI_13_Zaehler") * 100) / Count("QI_13_Nenner")
  else null

// ============================================================================
// QI-14: RT Lymphabfluss bei ≥ 4 befallenen axillären LK
// ============================================================================

// Vereinfacht: Patientinnen mit ≥4 LK befallen die RT bekommen haben
// (vollständige Implementierung braucht LK-Count-Observation)

// ============================================================================
// Deskriptive Statistiken
// ============================================================================

define "Anzahl Patienten":
  Count([Patient])

define "Anzahl invasive Karzinome":
  Count("Invasive Mammakarzinome")

define "Anzahl DCIS":
  Count("DCIS Diagnosen")

define "Anzahl BET":
  Count("BET Operationen")

define "Anzahl Mastektomie":
  Count("Mastektomie Operationen")

define "BET Rate Prozent":
  if (Count("BET Operationen") + Count("Mastektomie Operationen")) > 0
  then (Count("BET Operationen") * 100) / (Count("BET Operationen") + Count("Mastektomie Operationen"))
  else null

define "Anzahl SNB":
  Count("SNB Operationen")

define "Anzahl Axilladissektion":
  Count("Axilladissektion Operationen")

define "Anzahl Strahlentherapien":
  Count("Strahlentherapien")

define "Anzahl Systemtherapien":
  Count([Procedure] P where P.meta.profile.value contains 'https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure')

define "Anzahl Tumorkonferenzen":
  Count([CarePlan])

define "Anzahl Komplikationen":
  Count([Observation] O where O.meta.profile.value contains 'https://www.senologie.org/fhir/StructureDefinition/senologie-operative-komplikation')
