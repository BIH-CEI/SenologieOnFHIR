// ============================================================================
// Senologie Meldungs-Bundle
//
// Kanonischer FHIR-Bundle für einen SenologieOnFHIR-Datensatz.
// Definiert welche Ressourcen (mit welchen Profilen) in einer vollständigen
// Senologie-Meldung enthalten sind.
//
// Zweck:
//   1. Basis für Reverse-Engineering der Questionnaires:
//      welches Formular-Item liefert welche Ressource?
//   2. Validierungsziel für synthetische Testdaten (Synthea → postprocess_target)
//   3. Ausgangspunkt für Ausleitungs-Bundles (OncoBox, oBDS, CCDM)
//
// Typ: collection (Snapshot eines Patientendatensatzes, kein Transaction-Bundle)
// ============================================================================

Profile: Senologie_Meldungs_Bundle
Parent: Bundle
Id: senologie-meldungs-bundle
Title: "Senologie Meldungs-Bundle"
Description: "Kanonischer Bundle für einen vollständigen SenologieOnFHIR-Datensatz einer Brustkrebspatientin. Enthält Pflicht- und optionale Ressourcen gemäß den SenologieOnFHIR-Profilen."
* insert SenoCRMIProfile

* ^status = #active

// Bundle-Typ: Snapshot-Sammlung, keine transaktionale Verarbeitung
* type = #collection

// ── Slicing auf Bundle.entry ─────────────────────────────────────────────────
// Discriminator: Profil der enthaltenen Ressource.
// rules = open: weitere Ressourcen (z.B. Practitioner, Organization) erlaubt.
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = false

* entry contains
    patient          1..1 MS and
    diagnose         1..1 MS and
    er-status        0..1 MS and
    pr-status        0..1 MS and
    her2-status      0..1 MS and
    ki67             0..1 MS and
    grading          0..1 MS and
    tumorlokalisation 0..* MS and
    bildgebung       0..* and
    pathologie-befund 0..* and
    operation        0..* MS and
    strahlentherapie 0..* MS and
    systemtherapie   0..* MS and
    tumorboard       0..* MS and
    follow-up        0..* MS and
    pdl1-status      0..1 and
    somatische-mutation 0..* and
    genexpressionstest  0..* and
    psychoonkologie  0..1 and
    sozialdienst     0..1

// Hinweis: Bundle.entry.resource ist vom Typ 'Resource', nicht Reference.
// SUSHI akzeptiert daher nur Basis-Ressourcentypen in 'only'-Constraints.
// Das Ziel-Profil wird per ^type[0].profile als Canonical-URL angegeben.
// Der #profile-Discriminator sorgt dafür, dass Ressourcen in den richtigen Slice fallen.

// ── Pflicht: Patient ─────────────────────────────────────────────────────────
* entry[patient].resource only Patient
* entry[patient] ^short = "Patientin (Pflicht)"

// ── Pflicht: Diagnose ────────────────────────────────────────────────────────
* entry[diagnose].resource only Condition
* entry[diagnose].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"
* entry[diagnose] ^short = "Mammakarzinom-Diagnose (Pflicht) — Profil: Senologie_Diagnose_Maligne"

// ── Biomarker ────────────────────────────────────────────────────────────────
* entry[er-status].resource only Observation
* entry[er-status].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-er-status"
* entry[er-status] ^short = "Östrogenrezeptor-Status — Profil: Senologie_ER_Status"

* entry[pr-status].resource only Observation
* entry[pr-status].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-pr-status"
* entry[pr-status] ^short = "Progesteronrezeptor-Status — Profil: Senologie_PR_Status"

* entry[her2-status].resource only Observation
* entry[her2-status].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-her2-status"
* entry[her2-status] ^short = "HER2-Rezeptor-Status — Profil: Senologie_HER2_Status"

* entry[ki67].resource only Observation
* entry[ki67].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-ki67-proliferationsindex"
* entry[ki67] ^short = "Ki-67-Proliferationsindex — Profil: Senologie_Ki67_Proliferationsindex"

* entry[grading].resource only Observation
* entry[grading].resource ^type[0].profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-grading"
* entry[grading] ^short = "Histopathologisches Grading (G1–G3) — Profil: MII_PR_Onko_Grading"

// ── Lokalisation & Bildgebung ────────────────────────────────────────────────
* entry[tumorlokalisation].resource only BodyStructure
* entry[tumorlokalisation].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation"
* entry[tumorlokalisation] ^short = "Tumorlokalisation (Quadrant, Seite) — BodyStructure"

* entry[bildgebung].resource only DiagnosticReport
* entry[bildgebung].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-befund"
* entry[bildgebung] ^short = "Bildgebungsbefunde (Mammographie, MRT, US) — DiagnosticReport"

* entry[pathologie-befund].resource only DiagnosticReport
* entry[pathologie-befund].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund"
* entry[pathologie-befund] ^short = "Pathologiebefund (MII PathoReport) — DiagnosticReport"

// ── Therapien ────────────────────────────────────────────────────────────────
* entry[operation].resource only Procedure
* entry[operation].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-operation"
* entry[operation] ^short = "Operative Eingriffe (BET, Mastektomie, SLNB)"

* entry[strahlentherapie].resource only Procedure
* entry[strahlentherapie].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie"
* entry[strahlentherapie] ^short = "Strahlentherapie"

* entry[systemtherapie].resource only Procedure
* entry[systemtherapie].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure"
* entry[systemtherapie] ^short = "Systemtherapie (CHT, HO, Immuntherapie, Targeted)"

// ── Tumorboard & Verlauf ──────────────────────────────────────────────────────
* entry[tumorboard].resource only CarePlan
* entry[tumorboard].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"
* entry[tumorboard] ^short = "Tumorboard-Empfehlung (prä-/posttherapeutisch)"

* entry[follow-up].resource only Observation
* entry[follow-up].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up"
* entry[follow-up] ^short = "Follow-Up / Verlaufsbeobachtung"

// ── Erweiterte Molekulardiagnostik ───────────────────────────────────────────
* entry[pdl1-status].resource only Observation
* entry[pdl1-status].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-pdl1-status"
* entry[pdl1-status] ^short = "PD-L1-Status (relevant bei TNBC)"

* entry[somatische-mutation].resource only Observation
* entry[somatische-mutation].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-somatische-mutation"
* entry[somatische-mutation] ^short = "Somatische Mutationen (BRCA1/2 somatisch, PIK3CA)"

* entry[genexpressionstest].resource only RiskAssessment
* entry[genexpressionstest].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-genexpressionstest"
* entry[genexpressionstest] ^short = "Genexpressionstest (Oncotype DX, MammaPrint, Prosigna) — RiskAssessment"

// ── Psychosoziale Versorgung ──────────────────────────────────────────────────
* entry[psychoonkologie].resource only Procedure
* entry[psychoonkologie].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-psychoonkologie"
* entry[psychoonkologie] ^short = "Psychoonkologisches Assessment — Procedure"

* entry[sozialdienst].resource only Procedure
* entry[sozialdienst].resource ^type[0].profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-sozialdienst"
* entry[sozialdienst] ^short = "Sozialdienstberatung — Procedure"
