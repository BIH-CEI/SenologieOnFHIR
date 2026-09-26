# Alignment with EU and International Standards

The Core Dataset Senology (Kerndatensatz Senologie) is designed as a national specification for breast cancer care, but deliberately situates itself within the European and international context. This page positions the Core Dataset within the relevant specification layers.

### European Health Data Space (EHDS)

The [EHDS Regulation](https://health.ec.europa.eu/ehealth-digital-health-and-care/european-health-data-space-regulation-ehds_en) (in force since March 2025) defines priority categories of health data to be exchanged interoperably across the EU. [HL7 Europe](https://www.hl7europe.org/new-hl7-europe-fhir-implementation-guides-to-support-the-european-health-data-space/) is developing FHIR Implementation Guides for this purpose:

| EHDS Category | EU FHIR IG | Status (2026) | Relevance for Senology |
|---|---|---|---|
| **Patient Summary** (EPS) | HL7 Europe IPS | STU | Current medication, allergies, pre-existing conditions → [IPS-Prepopulation](ips-prepopulation.html) |
| **Laboratory Report** | HL7 Europe Laboratory | STU | Laboratory values (tumour markers, blood count during chemotherapy) |
| **Medical Imaging Report** | HL7 Europe Imaging Study | Ballot | Mammography, ultrasound, MRI findings → compatible with Senologie_Bildgebung_Befund |
| **Hospital Discharge Report** | HL7 Europe HDR | In progress | Discharge letter after surgery, end of therapy |
| **ePrescription / eDispensation** | HL7 Europe eP/eD | STU | Outpatient prescriptions: endocrine therapy (tamoxifen, letrozole), oral chemotherapy (capecitabine), supportive medication. Not relevant for inpatient/day-clinic-administered i.v. chemotherapy. |
| **Pathology Report** | *(no EU IG yet)* | — | Mapped nationally via MII Patho; EU IG expected in the medium term |

### Relationship of the Core Dataset to EU Categories

The Core Dataset covers content that touches multiple EU categories:

**Imaging** — The Senology profiles for imaging reports (mammography, ultrasound, MRI with BI-RADS/ACR) are content-compatible with the emerging [HL7 Europe Imaging Study IG](https://hl7europe.eu/new-webinar-the-hl7-europe-imaging-study-fhir-ig-and-how-to-contribute/). The base resource (DiagnosticReport) and modality coding (LOINC, RadLex) are aligned. The senology-specific extensions (BI-RADS categories, ACR density, quadrant localisation) are specialisations that can build on the EU standard.

**Pathology** — No standalone FHIR IG for pathology reports yet exists at the EU level. The Core Dataset uses the MII Pathology profiles (`MII_PR_Patho_Report`, `MII_PR_Patho_Specimen`) as its basis. Once an EU Pathology Report IG is published, compatibility should be assessed and, if necessary, a migration of the parent profiles initiated.

**Laboratory Results** — Laboratory values (e.g. tumour markers, blood count during chemotherapy) are currently outside the Senology scope (→ MII Laboratory Module). The HL7 Europe Laboratory IG defines the EU format. A future integration could source relevant laboratory values via the EU standard.

**Patient Summary** — General medical history (pre-existing conditions, medication, allergies) is intentionally outside the Senology scope. It is intended to be sourced via [IPS-/EPS-based pre-population](ips-prepopulation.html) from the ePA or an EU Patient Summary.

### National Specification Layers

The Core Dataset is positioned between the national base standards and the clinical domain:

```
┌─────────────────────────────────────────────────────────────┐
│  EU / International                                          │
│  HL7 FHIR R4  ·  IPS/EPS  ·  EU Lab/Imaging  ·  SNOMED CT  │
├─────────────────────────────────────────────────────────────┤
│  DE National                                                 │
│  ISiK  ·  MII Kerndatensatz  ·  DE Basisprofile  ·  ePA     │
├─────────────────────────────────────────────────────────────┤
│  Domäne Onkologie                                            │
│  MII Onkologie  ·  MII Pathologie  ·  MII Bildgebung         │
├─────────────────────────────────────────────────────────────┤
│  Fachgebiet Senologie                                        │
│  ► Kerndatensatz Senologie ◄                                  │
│  S3-Leitlinie  ·  DGS  ·  DKG-Zertifizierung                 │
└─────────────────────────────────────────────────────────────┘
```

Each layer inherits from the one above and specialises it for its respective context. The Core Dataset Senology is the **lowest, most domain-specific layer** — it implements the S3 guideline and the requirements of breast centres (Brustzentren) technically, while consistently utilising the standards of the layers above.

### Terminology Context

| Terminology | Layer | Use in Senology Core Dataset |
|---|---|---|
| **SNOMED CT** | International | Primary clinical coding (diagnoses, procedures, findings) |
| **LOINC** | International | Laboratory values, imaging modalities, observation codes |
| **ICD-10-GM** | DE National | Diagnosis coding (DRG, cancer registry) |
| **ICD-O-3** | International (WHO) | Morphology (histology), topography |
| **OPS** | DE National | Procedure coding (HIS) |
| **ATC-WHO** | International (WHO) | Drug classification — the primary EU-wide coding system for medications (EMA, EHDS ePrescription). The Core Dataset codes medications primarily in SNOMED CT and provides [ConceptMaps](terminologie-medikation.html) (SNOMED CT → ATC) for European exchange. |
| **ATC-DE** | DE National (BfArM) | German ATC extension — relevant for cancer registry reporting (oBDS). Differs from ATC-WHO in individual codes. |
| **UNII** | International (FDA) | Unique Ingredient Identifier — for investigational medicinal products and regulatory purposes. Relevant in clinical trials (e.g. IND drugs). |
| **INN** | International (WHO) | International Nonproprietary Name — substance-based naming, manufacturer-independent. Standard for study protocols and scientific communication. |
| **RadLex** | International (RSNA) | Radiological report categories (ACR density) |

Where international terminologies have gaps, [proposals for the BfArM](terminologie-uebersicht.html) (as the national SNOMED CT release centre) are documented.

### Compatibility Goals

| Standard | Compatibility Goal | Status |
|---|---|---|
| **ISiK** | Encounter, Patient, Condition, Procedure compatible | Present (ISiK as dependency) |
| **MII Core Dataset** | Profiles inherit from MII Onco, Patho, Imaging | Present (parent profiles) |
| **EU IPS/EPS** | General medical history sourceable from IPS | Documented ([IPS-Prepopulation](ips-prepopulation.html)) |
| **EU Imaging Report** | Imaging findings structurally compatible | Conceptual; formal verification pending |
| **EU Laboratory Report** | Laboratory values sourceable from EU Lab | Not yet integrated (MII Laboratory Module as intermediate step) |
| **EHDS Secondary Use** | Data available for research via EHDS | Prepared (SQL on FHIR, CQL) |

### Patient-Reported Outcomes (PROMs)

The capture of patient-reported endpoints is gaining importance in oncological care and in EU-wide quality measurement. Relevant instruments for senology:

| Instrument | Publisher | Licence | Implementation |
|---|---|---|---|
| **EQ-5D-5L** | EuroQol Group | Licence required | MII PRO Module |
| **EORTC QLQ-C30** | EORTC | Licence required | MII PRO Module |
| **EORTC QLQ-BR42** | EORTC | Licence required | MII PRO Module (planned) |
| **PRO-CTCAE** | NCI | Free (public domain) | MII PRO Module (planned) |
| **PROMIS-29 + Cognitive Function 4a** | NIH | Free | MII PRO Module — 8 domains (Physical Function, Anxiety, Depression, Fatigue, Pain Interference, Sleep Disturbance, Social Ability, Cognitive Function) with 4 items each + T-score. Cognitive Function clinically relevant due to "chemobrain". |
| **BREAST-Q** | Memorial Sloan Kettering | Licence required | Not implementable (licensing restrictions) |

PROMs are **not profiled independently** in the Senology Core Dataset, but are referenced via the [MII PRO Module](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Patient_Reported_Outcomes). The distinction between clinician-documented adverse events (CTCAE, within Senology scope) and patient-reported adverse events (PRO-CTCAE, within the PRO Module) is documented in [OF-11](offene-fragen.html).

At the EU level, [PaRIS (OECD)](https://www.oecd.org/health/paris/) and the [EU-PROM Network](https://www.ciph.cam.ac.uk/research/eu-prom/) are working on the standardisation of PROMs for secondary use within the EHDS. A future integration of standardised PROM data via the EHDS is conceivable.

### Further Development

As the EU Implementing Acts progress (expected early 2027) and further EU FHIR IGs are published, the compatibility of the Core Dataset will be reviewed regularly. In particular:

- **EU Pathology Report** — once an IG is published, alignment with MII Patho / Senology Pathology
- **EU Imaging Report** — formal compatibility review of the Senology imaging profiles
- **EHDS Secondary Use** — provision of Senology data via the national access point

Embedding the Core Dataset in the European context is one of its long-term goals — the technical foundation for this has already been established with FHIR R4, SNOMED CT, and LOINC.
