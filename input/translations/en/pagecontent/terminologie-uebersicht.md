# Terminology

This chapter provides an overview of all terminologies, ValueSets, and CodeSystems used in the Senology module.

## Coding Systems Used

| System | OID / URL | Use in the module |
|---|---|---|
| SNOMED CT | `http://snomed.info/sct` | Diagnoses, procedures, findings, medications, imaging |
| ICD-10-GM | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | Diagnosis coding (cancer registry, DRG) |
| LOINC | `http://loinc.org` | Laboratory values, imaging modalities, clinical observations |
| RadLex | `http://radlex.org` | Radiological finding categories (ACR density, BI-RADS, tomosynthesis) |
| ATC | `http://fhir.de/CodeSystem/bfarm/atc` | Drug classification (reporting) |
| ASK | `http://fhir.de/CodeSystem/ask` | Drug substance catalogue (Arzneistoffkatalog) |
| OPS | `http://fhir.de/CodeSystem/bfarm/ops` | Operations and procedure key (Operationen- und Prozedurenschlüssel) |
| oBDS | various | Oncological core dataset (Onkologischer Basisdatensatz) (diagnosis confirmation, therapy intent) |

## ValueSets

### Diagnosis

| ValueSet | Coding Systems | Codes | Description |
|---|---|---|---|
| [VS Senologie Diagnose](ValueSet-vs-senologie-diagnose.html) | SNOMED CT, Local | 24 | All senological diagnoses (malignant, benign, B3, inflammatory, symptomatic) |
| [VS Senologie Diagnose SCT](ValueSet-vs-senologie-diagnose-sct.html) | SNOMED CT | 3 | SNOMED CT slice for malignant diagnoses |
| [VS Senologie Diagnose Lokal](ValueSet-vs-senologie-diagnose-lokal.html) | SNOMED CT, Local | 3 | Local codes without SNOMED mapping |
| [VS Senologie Diagnose B3](ValueSet-vs-senologie-diagnose-b3.html) | SNOMED CT | 8 | B3 lesions of uncertain dignity per S3 guideline |
| [VS Senologie ICD-10](ValueSet-vs-senologie-icd10.html) | ICD-10-GM | 34 | ICD-10-GM codes for breast diseases (C50, D05, D24, D48.6, N60–N64, T85.4) |
| [VS Senologie Diagnosesicherung](ValueSet-vs-senologie-diagnosesicherung.html) | Local (oBDS) | 12 | Diagnosis confirmation per oBDS (keys 1–9) |
| [VS Senologie Metastasierung](ValueSet-vs-senologie-metastasierung.html) | Local | 3 | Metastasis status (non-metastatic / primary metastatic / secondary metastatic) |
| [VS Senologie Seite](ValueSet-vs-senologie-seite.html) | SNOMED CT | 3 | Laterality (right, left, bilateral) |

### Therapy

**Note on medication coding:** In SDC questionnaires, only **one coding** can be stored per form field. Medication is therefore coded primarily in **SNOMED CT**, as SNOMED CT offers the broadest coverage as a reference terminology. For cancer registry reporting (oBDS), ATC is required — the translation is performed via the [ConceptMap SNOMED CT → ATC](ConceptMap-cm-senologie-medikation-sct-atc.html). This avoids double coding in the form and the reporting data are derived automatically.

| ValueSet | Coding Systems | Codes | Description |
|---|---|---|---|
| [VS Senologie Systemtherapie Medikation](ValueSet-vs-senologie-systemtherapie-medikation.html) | SNOMED CT | 19 | Antineoplastic drugs (CDK4/6 inhibitors, anthracyclines, taxanes, platinum compounds, etc.) |
| [VS Senologie Operation Art](ValueSet-vs-senologie-operation-art.html) | SNOMED CT | 10 | Surgical procedure types (mastectomy, breast-conserving surgery, axillary dissection, reconstruction, etc.) |

### Risk and Diagnostics

| ValueSet | Coding Systems | Codes | Description |
|---|---|---|---|
| [VS Senologie Genexpressionstest](ValueSet-vs-senologie-genexpressionstest.html) | Local | 4 | Gene expression tests (Oncotype DX, MammaPrint, Prosigna, EndoPredict) |
| [VS Senologie Risikoklasse](ValueSet-vs-senologie-risikoklasse.html) | HL7 risk-probability | 3 | Risk categories (low, intermediate, high) |
| [VS Senologie Screeningstatus](ValueSet-vs-senologie-screeningstatus.html) | SNOMED CT | 5 | Screening status for study participation |
| [VS Senologie Studienname](ValueSet-vs-senologie-studienname.html) | Local | 9 | Selection list of clinical trials at the breast centre (OncoBox 2.0 K02) |

### ConceptMaps

Translation tables are available for data exchange and cancer registry reporting:

| ConceptMap | Source → Target | Description |
|---|---|---|
| [CM Medikation SCT→ATC](ConceptMap-cm-senologie-medikation-sct-atc.html) | SNOMED CT → ATC | Medication mapping for cancer registry reports |
| [CM Medikation SCT→ASK](ConceptMap-cm-senologie-medikation-sct-ask.html) | SNOMED CT → ASK | Medication mapping for the drug substance catalogue |

See [Terminology Medication](terminologie-medikation.html) for details on the medication mappings.

---

## Local CodeSystems

The module defines its own CodeSystems for concepts not covered by international terminologies.

### CS Senologie Diagnose Lokal

Local diagnosis codes for concepts without a SNOMED CT equivalent:

{:.stu-note}
No suitable SNOMED CT concept could be identified for the following concepts. It is being assessed whether these can be submitted as extension requests to SNOMED International or to the BfArM National Release Centre (NRC).

| Code | Meaning | SNOMED CT Equivalent | Status |
|---|---|---|---|
| `bz-diagnose-bc-recurrence` | Breast carcinoma recurrence | `1306515008 | Recurrent primary malignant neoplasm of breast` | **Migration candidate** |
| `bz-diagnose-sonstiges` | Other | — (generic, no meaningful SNOMED equivalent) | Remains local |
| `bz-makromastie` | Macromastia | `43336006 | Gigantomastia` | **Migration candidate** |
| `bz-mamillensekretion-nicht-blutig` | Non-bloody nipple discharge | `54302000 | Discharge from nipple` (qualifier "non-bloody" not present in SNOMED) | Partial |
| `bz-mamillensekretion-blutig` | Bloody nipple discharge | `290113009 | Bloody nipple discharge` | **Migration candidate** |
| `bz-befund-unklarer-dignitaet` | Finding of uncertain dignity | `269497004 | Neoplasm of uncertain behavior of breast` | **Migration candidate** |
| `bz-anisomastie` | Anisomastia | No exact match (closest: `163438002 | O/E - breast asymmetry`, but a clinical finding, not a diagnosis) | Remains local |
| `bz-kapselfibrose` | Capsular fibrosis (implant) | `237474000 | Contracture of breast following insertion of breast implant` | **Migration candidate** |

### CS Senologie Metastasierung

| Code | Meaning | Note |
|---|---|---|
| `nicht-metastasiert` | M0 — no distant metastases | No direct SNOMED equivalent as a status concept |
| `primaer-metastasiert` | M1 at initial diagnosis | oBDS-specific distinction |
| `sekundaer-metastasiert` | M1 during follow-up | oBDS-specific distinction |

### CS Senologie Diagnosesicherung

12 codes per oBDS key (1–9 with subclasses). These are oBDS-specific and have no direct SNOMED equivalent, as they reflect the German cancer registry reporting process.

### CS Senologie Genexpressionstest

| Code | Meaning | Note |
|---|---|---|
| `oncotype-dx` | Oncotype DX (21-gene, score 0–100) | No SNOMED code — proprietary test name |
| `mammaprint` | MammaPrint (70-gene, index −1.0 to +1.0) | No SNOMED code — proprietary test name |
| `prosigna` | Prosigna/PAM50 (ROR score 0–100) | No SNOMED code — proprietary test name |
| `endopredict` | EndoPredict (EPclin, continuous) | No SNOMED code — proprietary test name |

### Summary: Local Codes and SNOMED Coverage

| Category | Local | Of which migratable to SNOMED | Remaining local |
|---|---|---|---|
| Diagnoses | 8 | 5 (recurrence, macromastia, bloody nipple discharge, uncertain dignity, capsular fibrosis) | 3 |
| Metastasis status | 3 | 0 (oBDS-specific) | 3 |
| Diagnosis confirmation | 12 | 0 (oBDS-specific) | 12 |
| Gene expression tests | 4 | 0 (proprietary test names) | 4 |
| **Total** | **27** | **5** | **22** |

The remaining 22 local codes are either oBDS-specific (15), proprietary test names (4), or have no SNOMED equivalent (3).

*All SNOMED CT codes were validated on 14 April 2026 against Snowstorm 10.8.2 (SNOMED CT International Edition).*
