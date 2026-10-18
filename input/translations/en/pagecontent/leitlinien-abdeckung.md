### S3 Guideline Coverage

The Senologie core dataset follows the German **S3 guideline on breast cancer** (AWMF 032-045OL, long version 5.0, December 2025). Its recommendations were annotated systematically: for each recommendation, the required data objects, their terminology, and their relation to the FHIR profiles are recorded.

This page is the entry point to that annotation. The full annotation per recommendation is on the chapter pages linked below, the coded terms are in the [Glossary (SNOMED + S3)](glossar-s3-snomed.html), and the annotation's own data model is in the [annotation schema](leitlinien-annotation-schema.html).

{:.stu-note}
The annotation is **subject to review, not a decision.** Mappings with `mapping_quelle: vorschlag` were assigned by us and have not been clinically confirmed; the `mapped` / `partial` / `gap` assessment is the project's own. Feedback is explicitly welcome (see [Open Issues](offene-fragen.html)).

#### Scope of the analysis

| Metric | Value |
|---|---|
| Chapters analysed | 11 (ch. 3–8) |
| Annotated recommendations and quality indicators | 376 |
| Data objects recorded | 821 |
| Of those, with a terminology code | 150 (141 after merging identical terms) |
| Of those, without a code (mapping gap) | 671 |

Not annotated: ch. 1 (guideline metadata), ch. 2 (methodology), ch. 4.7 (modifiable lifestyle factors), ch. 9 (research questions) and ch. 10 (annexes).

#### FHIR mapping status

Every annotated recommendation carries an assessment of how far its data objects are represented in the profiles:

| Status | Meaning | Recommendations | Share |
|---|---|---|---|
| `mapped` | fully represented in existing profiles | 23 | 6 % |
| `partial` | partly represented, extension needed | 185 | 49 % |
| `gap` | no suitable profile, new profile/extension needed | 169 | 45 % |

{:.stu-note}
This distribution is counted from the annotation blocks and replaces the earlier estimate of "~70 % covered" on this page, which could not be derived from the annotation. Note that `partial` is the most common case — the clinical domains are largely modelled, but rarely at the level of detail the guideline asks for. The distribution counts recommendations, not data objects.

#### Annotation per chapter

| Chapter | Topic | Rec./QI | Data objects | coded |
|---|---|---|---|---|
| [3](../de/s3-kap-3-allgemeines.html) | Risk factors, early detection, genetics | 43 | 55 | 29 |
| [4.1](../de/s3-kap-4-1-diagnostik.html) | Diagnostics (imaging, biopsy, staging) | 16 | 54 | 2 |
| [4.2–4.3](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | DCIS and risk lesions (B3) | 17 | 71 | 12 |
| [4.4](../de/s3-kap-4-4-operative-therapie.html) | Surgical therapy | 21 | 77 | 3 |
| [4.5](../de/s3-kap-4-5-pathologie.html) | Pathology, biomarkers, prognosis | 13 | 54 | 18 |
| [4.6](../de/s3-kap-4-6-strahlentherapie.html) | Adjuvant radiotherapy | 36 | 93 | 11 |
| [4.8](../de/s3-kap-4-8-systemische-therapie.html) | Systemic therapy, early breast cancer | 40 | 88 | 21 |
| [5](../de/s3-kap-5-rezidiv-metastasiert.html) | Recurrent and metastatic disease | 69 | 95 | 41 |
| [6](../de/s3-kap-6-betreuung.html) | Supportive care, follow-up, palliative care | 34 | 90 | 7 |
| [7](../de/s3-kap-7-spezielle-situationen.html) | Special situations | 69 | 70 | 5 |
| [8](../de/s3-kap-8-qualitaetsindikatoren.html) | Quality indicators | 18 | 74 | 1 |

{:.stu-note}
The chapter pages are **German only** and the links above point to the German site: they quote the S3 guideline verbatim, and the annotation convention is to keep the recommendation text in the German original. The coded terms are available in English in the [Glossary](glossar-s3-snomed.html).

The "coded" column counts data objects with a terminology code. A low value does not mean missing coverage — it means the recommendation mostly asks for structural rather than coded information (e.g. ch. 4.4: surgical procedures are bound via OPS/SNOMED in the profiles rather than repeated in the annotation).

#### Known gaps

The consolidated analysis across all chapters is on the [Consolidated Gap Analysis](leitlinien-gap-analyse.html) page, sorted by priority. The main points:

| Guideline area | Gap | Explanation |
|---|---|---|
| Drug therapy | No profile | MedicationRequest/MedicationAdministration missing; ~60 drugs are annotated with ATC codes but not modelled |
| Psycho-oncological care | No profile | Screening (PHQ, GAD), interventions — not senology-specific, possibly via a PRO module |
| Rehabilitation | No profile | Rehabilitation goals, follow-up schedule — outside the Senologie scope |
| Palliative care | No profile | Palliative care documentation — a topic in its own right |
| Complementary medicine | No profile | Ch. 6 of the S3 guideline — deliberately not represented |
| Risk calculation (IBIS, BOADICEA) | No profile | Computed risk models — RiskAssessment exists (gene expression tests), but not for polygenic risk scores |
| Pregnancy-associated breast cancer | Partial | Gynaecological history and pregnancy status via IPS; therapy-specific adjustments not modelled |
| Breast cancer in older patients | Partial | Geriatric assessment out of scope; therapy decisions representable via tumour board |
| Follow-up schedule | Partial | Follow-up observations exist, but no structured follow-up protocol (PlanDefinition) |

#### Next steps

1. **Review** of the annotated chapters by clinical experts
2. **Terminology validation** of all `vorschlag` mappings and of the 18 coded terms without a stated provenance
3. **Reconcile with the AGO recommendations** and add what is missing
4. **Derive FHIR profiles** from the priority 1 and 2 gaps
5. **QI-based profile validation** — can all 17 quality indicators be computed from the profiles?

The annotation lives in the repository as Markdown with YAML blocks under `input/pagecontent/s3-kap-*.md`; the coded terms are additionally available machine-readable in `exports/glossar-s3-snomed.csv`.
