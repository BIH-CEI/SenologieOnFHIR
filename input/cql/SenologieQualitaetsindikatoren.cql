// ============================================================================
// CQL Library: Senologie Qualitätsindikatoren
// DKG-Kennzahlen für zertifizierte Brustzentren
// ============================================================================
// Basiert auf den Senologie-FHIR-Profilen und den DKG-Zertifizierungskriterien.
// Testbar gegen die synthetische Kohorte (12 Patientinnen).
// ============================================================================

library SenologieQualitaetsindikatoren version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

// --- Codesysteme ---
codesystem "SCT": 'http://snomed.info/sct'
codesystem "ICD10GM": 'http://fhir.de/CodeSystem/bfarm/icd-10-gm'
codesystem "LOINC": 'http://loinc.org'
codesystem "OPS": 'http://fhir.de/CodeSystem/bfarm/ops'

// --- Codes ---
// Diagnosen
code "Malignant neoplasm of breast": '254837009' from "SCT"
code "DCIS": '109889007' from "SCT"

// Bildgebung
code "BI-RADS": '72018-2' from "LOINC"

// Rezeptorstatus
code "ER LOINC": '85337-4' from "LOINC"
code "PR LOINC": '85339-0' from "LOINC"
code "HER2 LOINC": '85319-2' from "LOINC"

// ============================================================================
// Basispopulationen
// ============================================================================

// Alle Patientinnen mit Mammakarzinom (C50.x) oder DCIS (D05.x)
define "Alle Brustkrebspatientinnen":
  [Patient] P
    where exists(
      [Condition: "Malignant neoplasm of breast"] C
        where C.subject.reference = 'Patient/' + P.id
    )
    or exists(
      [Condition: "DCIS"] C
        where C.subject.reference = 'Patient/' + P.id
    )

// Alle invasiven Mammakarzinome (C50.x, nicht DCIS)
define "Invasive Mammakarzinome":
  [Condition: "Malignant neoplasm of breast"]

// Alle DCIS
define "DCIS Diagnosen":
  [Condition: "DCIS"]

// Alle Operationen (Senologie-Profil)
define "Alle Brustoperationen":
  [Procedure] P
    where P.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-operation'
      or P.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-brustop'

// ============================================================================
// QI-1: Anteil brusterhaltender Therapie (BET-Rate)
// DKG-Ziel: ≥ 70% bei pT1 (invasiv)
// ============================================================================

// BET = OPS 5-870 (Brusterhaltende Operationen)
define "BET Operationen":
  "Alle Brustoperationen" P
    where exists(
      P.code.coding C
        where C.system = 'http://fhir.de/CodeSystem/bfarm/ops'
          and C.code.value starts with '5-870'
    )

// Mastektomie = OPS 5-872 (Radikale Mastektomie) oder 5-871
define "Mastektomie Operationen":
  "Alle Brustoperationen" P
    where exists(
      P.code.coding C
        where C.system = 'http://fhir.de/CodeSystem/bfarm/ops'
          and (C.code.value starts with '5-872' or C.code.value starts with '5-871')
    )

define "BET Rate":
  if Count("BET Operationen") + Count("Mastektomie Operationen") > 0
  then Count("BET Operationen") / (Count("BET Operationen") + Count("Mastektomie Operationen"))
  else null

define "BET Rate Prozent":
  "BET Rate" * 100

// ============================================================================
// QI-2: R0-Resektionsrate
// DKG-Ziel: ≥ 95% bei invasivem Karzinom
// ============================================================================

define "R0 Operationen":
  "Alle Brustoperationen" P
    where exists(
      P.outcome.coding C
        where C.code.value = 'R0'
    )
    or P.outcome.text.value = 'R0'

define "R0 Rate":
  if Count("Alle Brustoperationen") > 0
  then Count("R0 Operationen") / Count("Alle Brustoperationen")
  else null

define "R0 Rate Prozent":
  "R0 Rate" * 100

// ============================================================================
// QI-3: Hormonrezeptor-Bestimmungsrate
// DKG-Ziel: ≥ 95%
// ============================================================================

define "Patientinnen mit ER Bestimmung":
  "Invasive Mammakarzinome" C
    where exists(
      [Observation: "ER LOINC"] O
        where O.subject.reference = C.subject.reference
    )

define "ER Bestimmungsrate":
  if Count("Invasive Mammakarzinome") > 0
  then Count("Patientinnen mit ER Bestimmung") / Count("Invasive Mammakarzinome")
  else null

define "ER Bestimmungsrate Prozent":
  "ER Bestimmungsrate" * 100

// ============================================================================
// QI-4: Anteil Tumorkonferenz-Vorstellung
// DKG-Ziel: ≥ 95%
// ============================================================================

define "Patientinnen mit Tumorkonferenz":
  "Alle Brustkrebspatientinnen" P
    where exists(
      [CarePlan] CP
        where CP.subject.reference = 'Patient/' + P.id
          and CP.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-tumorboard-empfehlung'
    )

define "Tumorkonferenz Rate":
  if Count("Alle Brustkrebspatientinnen") > 0
  then Count("Patientinnen mit Tumorkonferenz") / Count("Alle Brustkrebspatientinnen")
  else null

define "Tumorkonferenz Rate Prozent":
  "Tumorkonferenz Rate" * 100

// ============================================================================
// QI-5: Postoperative Komplikationsrate (Clavien-Dindo ≥ III)
// ============================================================================

define "Schwere Komplikationen":
  [Observation] O
    where O.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-operative-komplikation'
      and exists(
        O.value.coding C
          where C.code.value in { 'III', 'IIIa', 'IIIb', 'IV', 'IVa', 'IVb', 'V' }
      )

define "Komplikationsrate schwer":
  if Count("Alle Brustoperationen") > 0
  then Count("Schwere Komplikationen") / Count("Alle Brustoperationen")
  else null

// ============================================================================
// Deskriptive Statistiken
// ============================================================================

// Fallzahlen
define "Anzahl Patientinnen gesamt":
  Count([Patient])

define "Anzahl Brustkrebspatientinnen":
  Count("Alle Brustkrebspatientinnen")

define "Anzahl invasive Karzinome":
  Count("Invasive Mammakarzinome")

define "Anzahl DCIS":
  Count("DCIS Diagnosen")

define "Anzahl Operationen":
  Count("Alle Brustoperationen")

define "Anzahl BET":
  Count("BET Operationen")

define "Anzahl Mastektomie":
  Count("Mastektomie Operationen")

// Subtyp-Verteilung (basierend auf Pathologie-Befunden)
define "Systemtherapien":
  [Procedure] P
    where P.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-systemtherapie-procedure'

define "Strahlentherapien":
  [Procedure] P
    where P.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-strahlentherapie'

define "Anzahl Systemtherapien":
  Count("Systemtherapien")

define "Anzahl Strahlentherapien":
  Count("Strahlentherapien")

// Komplikationen gesamt
define "Alle Komplikationen":
  [Observation] O
    where O.meta.profile.value contains 'http://fhir.bih-charite.de/kds-senologie/StructureDefinition/senologie-operative-komplikation'

define "Anzahl Komplikationen":
  Count("Alle Komplikationen")
