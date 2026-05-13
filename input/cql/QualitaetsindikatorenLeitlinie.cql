// ============================================================================
// CQL Library: Qualitätsindikatoren (S3-Leitlinie)
// S3-Leitlinie Mammakarzinom v5.0, Kapitel 8 (17 QIs)
// ============================================================================
// Testbar gegen die synthetische Kohorte (12 Patientinnen auf HAPI :8095).
// Aufruf: POST /fhir/$cql mit expression = "QI_xx_Rate_Prozent"
// ============================================================================

library QualitaetsindikatorenLeitlinie version '0.4.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

// --- Codesysteme ---
codesystem "SCT": 'http://snomed.info/sct'
codesystem "ICD10GM": 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem "LOINC": 'http://loinc.org'
codesystem "OPS": 'http://fhir.de/CodeSystem/bfarm/ops'
codesystem "CondClinical": 'http://terminology.hl7.org/CodeSystem/condition-clinical'

// Patient-Context erforderlich für FHIR Measure $evaluate-measure
// (sonst werden [Condition]/[Procedure] nicht auf den aktuellen Patienten gefiltert)
context Patient

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

// Procedure-Defines: SNOMED CT primary (FHIR Common Data Model), OPS als Fallback
// fuer deutsche Klinikdaten. So bleibt die CQL international auswertbar.

// Brust-Biopsien (diagnostisch — wichtig fuer QI-2 / KB-12 Praeop. Sicherung)
// SNOMED 119738008  Core biopsy of breast        (Stanzbiopsie)
// SNOMED 1188850001 Vacuum-assisted biopsy       (Vakuumbiopsie)
// SNOMED 122548005  Biopsy of breast (generic)
// SNOMED 274474001  Biopsy of breast (procedure)
// OPS    1-490*     Perkutane Biopsie
// OPS    1-491*     Perkutane Stanzbiopsie
// OPS    1-494*     Vakuum-Biopsie
define "Brust Biopsien":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '119738008' or c.code = '1188850001'
          or c.code = '122548005' or c.code = '274474001'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops'
        and (c.code.startsWith('1-490') or c.code.startsWith('1-491') or c.code.startsWith('1-494'))))

// BET (Brusterhaltende Therapie)
// SNOMED 392021009  Lumpectomy of breast
// SNOMED 392090004  Partial mastectomy of breast
// SNOMED 64368001   Partial mastectomy
// OPS    5-870*     BET
define "BET Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '392021009' or c.code = '392090004' or c.code = '64368001'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-870')))

// Mastektomie (Brust komplett entfernt)
// SNOMED 172043006  Simple mastectomy
// SNOMED 359740005  Radical mastectomy
// SNOMED 392011008  Mastectomy
// OPS    5-871*, 5-872*
define "Mastektomie Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '172043006' or c.code = '359740005' or c.code = '392011008'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops'
        and (c.code.startsWith('5-872') or c.code.startsWith('5-871'))))

// Sentinel-LK-Biopsie
// SNOMED 442619000  Sentinel lymph node biopsy
// SNOMED 432722007  Excision of sentinel lymph node
// OPS    5-401.1*   SLNB
define "SNB Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '442619000' or c.code = '432722007'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-401')))

// Axilla-Dissektion
// SNOMED 234262008  Excision of axillary lymph nodes
// SNOMED 110469001  Axillary lymphadenectomy
// OPS    5-402*
define "Axilladissektion Operationen":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '234262008' or c.code = '110469001'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('5-402')))

define "Alle Brustoperationen":
  "BET Operationen" union "Mastektomie Operationen"

// Strahlentherapie
// SNOMED 108290001  Radiation oncology AND/OR radiotherapy
// SNOMED 33195004   Teleradiotherapy procedure
// OPS    8-52*      Strahlentherapie (alle)
define "Strahlentherapien":
  [Procedure] P
    where exists(P.code.coding c
      where (c.system = 'http://snomed.info/sct'
        and (c.code = '108290001' or c.code = '33195004'))
      or (c.system = 'http://fhir.de/CodeSystem/bfarm/ops' and c.code.startsWith('8-52')))
    or P.meta.profile.value contains 'https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie'

// ============================================================================
// QI-2: Prätherapeutische histologische Sicherung
// Ziel: möglichst viele mit Stanz-/Vakuumbiopsie vor Ersteingriff
// ============================================================================

// QI-2 robust: prüft drei Datenquellen
//   1) FHIR-Klinikdaten: Procedure mit SNOMED-Biopsie-Codes oder OPS 1-490/491/494
//   2) FHIR-Klinikdaten (alternativ): Condition.verificationStatus mit MII-Onko
//      Diagnosesicherung Code 7 (histologische Untersuchung Primärtumor)
//      → wird auch aus oBDS-Importen befüllt (oBDS 5.7 Diagnosesicherung)
define "QI_02_Zaehler":
  "Invasive oder DCIS" C
    where exists("Brust Biopsien")
       or exists(C.verificationStatus.coding c
            where c.system = 'https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung'
              and (c.code = '7' or c.code = '8'))

define "QI_02_Nenner":
  "Invasive oder DCIS"

// ----------------------------------------------------------------------------
// Boolean-Wrapper fuer Measure /$evaluate-measure
// FHIR Measure-Population-Criteria muessen boolean-per-Patient liefern
// (true wenn der Patient in der Population ist). Die obigen Defines geben
// Listen zurueck — diese Wrapper machen daraus exists()-Checks.
// ----------------------------------------------------------------------------

define "HasInvasiveOrDCIS":
  exists("Invasive oder DCIS")

// QI-2: Praetherapeutische histologische Sicherung
define "HasQI02Nenner":  exists("QI_02_Nenner")
define "HasQI02Zaehler": exists("QI_02_Zaehler")

// QI-4: BET bei DCIS
define "HasQI04Nenner":  exists("QI_04_Nenner")
define "HasQI04Zaehler": exists("QI_04_Zaehler")

// QI-6: BET bei invasivem MaCa
define "HasQI06Nenner":  exists("QI_06_Nenner")
define "HasQI06Zaehler": exists("QI_06_Zaehler")

// QI-8: BET bei pT1
define "HasQI08Nenner":  exists("QI_08_Nenner")
define "HasQI08Zaehler": exists("QI_08_Zaehler")

// QI-9: Adjuvante endokrine Therapie bei HR+
define "HasQI09Nenner":  exists("QI_09_Nenner")
define "HasQI09Zaehler": exists("QI_09_Zaehler")

// QI-11: Trastuzumab bei HER2+
define "HasQI11Nenner":  exists("QI_11_Nenner")
define "HasQI11Zaehler": exists("QI_11_Zaehler")

// QI-12: Adjuvante Strahlentherapie
define "HasQI12Nenner":  exists("QI_12_Nenner")
define "HasQI12Zaehler": exists("QI_12_Zaehler")

// QI-13: Adjuvante Chemotherapie
define "HasQI13Nenner":  exists("QI_13_Nenner")
define "HasQI13Zaehler": exists("QI_13_Zaehler")

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
