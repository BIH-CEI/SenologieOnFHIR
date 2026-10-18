### Consolidated Gap Analysis

This page collects the gaps from all annotated chapters of the S3 guideline, sorted by priority. Scope, chapter overview and mapping status are on the [S3 Guideline Coverage](leitlinien-abdeckung.html) page; the coded terms are in the [Glossary (SNOMED + S3)](glossar-s3-snomed.html).

> Basis: S3 guideline on breast cancer v5.0 (December 2025), AWMF 032-045OL. Annotation as of 2026-02-18.

{:.stu-note}
The prioritisation is the project's own assessment and subject to review. It states where, on our reading of the guideline, modelling work is missing — not what is binding to implement.

#### Priority 1: Missing FHIR resource types

| Gap | Chapters | Recommendations | Action needed |
|---|---|---|---|
| **MedicationRequest / MedicationAdministration** | 4.8, 5.2 | ~70 | Drug therapy entirely unmodelled. ~60 drugs documented with ATC codes. |
| **Biopsy Procedure profile** | 4.1 | 4.15–4.24 | Guidance, needle, samples, marker, B classification, concordance |
| **CarePlan / therapy sequence** | 4.6, 4.8, 5, 6.3 | ~20 | Temporal sequence chemo → surgery → RT → maintenance, plus follow-up schedule |
| **Genomics Reporting** | 3.3, 5.2 | ~15 | BRCA1/2, PIK3CA, ESR1, AKT1, PTEN — profile the Genomics Reporting IG |
| **Follow-up CarePlan** | 6.3 | 6.13–6.24 | Follow-up schedule with intervals and examinations |
| **Geriatric assessment** | 7.2 | ~10 | G8 screening, CGA — Questionnaire/QuestionnaireResponse |

#### Priority 2: Missing extensions/observations on existing profiles

| Gap | Profile | Recommendations | Details |
|---|---|---|---|
| **HER2-low/ultralow** | Pathology | 4.73, 5.2 | Four levels: positive/low/ultralow/negative — highly therapy-relevant (T-DXd) |
| **PD-L1 IC + CPS** | Pathology | 4.75, 5.2 | Observation for mTNBC including antibody clone |
| **pCR status** | Pathology/Therapy | 4.8, 5.1 | Therapy steering post-NACT (→ T-DM1/capecitabine/olaparib) |
| **Fractionation scheme** | Radiotherapy | 4.94–4.101 | Conventional / moderately hypo / ultra-hypo |
| **Boost details** | Radiotherapy | 4.102–4.106 | Dose, technique (SIB/sequential/IORT/brachytherapy) |
| **Irradiation technique** | Radiotherapy | 4.6 | IMRT/VMAT, breath-hold technique (DIBH) |
| **SLN finding differentiation** | Surgery | 4.56–4.64 | Macro-/micrometastasis/ITC |
| **TAD as a surgical procedure** | Surgery | 4.62 | Missing from ValueSet vs-senologie-operation-art |
| **Target volume ValueSet** | Radiotherapy | 4.6.5–4.6.7 | Supraclavicular, internal mammary, axillary levels |
| **ER/PR staining intensity** | Pathology | 4.72 | Three levels: weak/moderate/strong |
| **Pre-analytics/fixation** | Pathology | 4.66 | Fixative, duration, cold ischaemia time |
| **Line of therapy** | Systemic therapy | 5.2 | 1st/2nd/3rd line plus prior therapy documentation |
| **Menopausal status** | Patient/Condition | 4.2, 5.2 | Stratification criterion for systemic therapy |
| **Breast reconstruction details** | Breast implant | 7.5 | One-stage/two-stage, expander, BIA-ALCL |
| **Special tumour entities** | Diagnose_Maligne | 7.6 | Metaplastic, phyllodes tumour, angiosarcoma, BIA-ALCL |

#### Priority 3: Conceptual gaps

| Gap | Description | Chapters |
|---|---|---|
| **Biomarker-defined tumour type** | Derived parameter (luminal A/B, HER2+, TNBC) | 4.5, 4.8, 5.2 |
| **Radiological-pathological correlation** | Concordance imaging ↔ histology | 4.1, 4.3 |
| **Active surveillance (DCIS)** | New treatment concept | 4.2 |
| **Psycho-oncology screening** | Distress thermometer, PHQ-9, GAD-7 as questionnaires | 6.1 |
| **Fertility preservation / cryopreservation** | No FHIR profile | 7.1 |
| **Gender identity** | Extension for transgender context | 7.4 |
| **PROMs (BREAST-Q)** | Patient-reported outcomes after reconstruction | 7.5 |
| **Local treatment of metastases** | RFA, TACE, SBRT, SIRT | 5.3 |

#### Terminologies used (across chapters)

Versions refer to the state of the guideline. How many terms are actually coded per system is counted in the [Glossary](glossar-s3-snomed.html).

| System | Version | Use | mapping_quelle |
|---|---|---|---|
| ICD-10-GM | 2025 | Diagnoses (C50, D05, D48.6) | leitlinie |
| ICD-O-3 | 2nd revision (2019) | Histological tumour types | leitlinie |
| UICC TNM | 8th edition (2017) | Staging (pT, pN, cM, R) | leitlinie |
| WHO tumour classification | 5th edition | Histological typing | leitlinie |
| ACR BI-RADS | 5th edition (2013) | Imaging findings | leitlinie |
| ASCO/CAP | 2023 | HER2 scoring, ER/PR assessment | leitlinie |
| Elston/Ellis (Nottingham) | — | Histological grading | leitlinie |
| ACMG | 5 classes | Variant classification (genetics) | leitlinie |
| ATC | 2025 | ~60 drugs (ch. 4.8, 5.2) | standard |
| LOINC | 2.77 | Biomarker observations | standard |
| SNOMED CT | 2025-01-31 | Clinical concepts | vorschlag/standard |
| OPS | 2025 | Surgical procedures | mii-kds |
| HGNC | — | Genes (BRCA1/2, PIK3CA, ESR1 etc.) | standard |
| CTCAE | v5.0 | Adverse event grades | standard |

#### Validation status

- **leitlinie**: referenced directly in the S3 guideline — **no review needed**
- **mii-kds**: taken from the MII core dataset — **validated**
- **standard**: established standard mappings (LOINC, ATC etc.) — **review recommended**
- **vorschlag**: assigned by us — **review required**

#### Quality indicators as profile validation

Chapter 8 defines 17 quality indicators with numerator/denominator definitions. These can serve as a **validation of the FHIR profiles**: if every data object a QI needs is present in the profiles, the QI can be computed.

The next steps for the annotation are on the [S3 Guideline Coverage](leitlinien-abdeckung.html#next-steps) page.
