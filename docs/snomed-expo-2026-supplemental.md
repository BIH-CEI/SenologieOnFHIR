# Breast Cancer Interoperable Dataset in Germany
## Supplemental Material — SNOMED CT Expo 2026

---

## 1. Architecture Overview

```
                          Clinician / Documentarian
                                    |
                          SDC Questionnaires (FHIR)
                          SNOMED CT-coded answer options
                                    |
                              $extract (SDC)
                                    |
                    FHIR Resources (24 Profiles)
                    SNOMED CT + ICD-10-GM + OPS
                                    |
              StructureMaps + ConceptMaps (30 maps, 8 CMs)
                    /         |          |         \
                oBDS        IRegG      IQTIG     OncoBox
              (cancer     (implant   (quality    (DKG
             registry)   registry)  assurance) certification)
                 |           |          |          |
              XML v3.0.5   XML        XML/CSV    Excel/XML
```

**Design Principle**: Document once at the point of care, transform automatically to all required registry formats. SNOMED CT is the semantic anchor that enables this one-to-many transformation.

**Standards Stack**:

| Layer | Standard |
|-------|----------|
| International | HL7 FHIR R4 | IPS/EPS | SNOMED CT | LOINC |
| European | EHDS | HL7 Europe Imaging/Lab |
| National (DE) | ISiK 5.0 | MII Kerndatensatz | DE Base Profiles |
| Domain | MII Oncology | MII Pathology | MII Imaging |
| Specialty | **Kerndatensatz Senologie** | S3 Guideline | DGS |

---

## 2. Clinical Profiles (24)

### History & Assessment
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Familienanamnese | FamilyMemberHistory | Diagnosis codes for family members (e.g., BRCA1/2) |
| Gynaekologische Anamnese | Observation | Menarche, parity, lactation, menopause status |
| Klinische Untersuchung | Observation | Palpation findings, lymph node examination |

### Diagnosis & Staging
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Diagnose Maligne | Condition (MII Onko) | Primary coding (e.g., 254837009 \|Malignant neoplasm of breast\|) |
| Diagnose Benigne | Condition | Benign/B3 lesions coded in SNOMED CT |
| Tumorlokalisation | BodyStructure (MII) | Laterality, quadrant, clock position |

### Imaging
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Bildgebung Befund | DiagnosticReport | Report structure, modality coding |
| Bildgebung Observation | Observation | BI-RADS assessment, ACR density (via RadLex) |
| Bildgebung Sonstige | DiagnosticReport | Non-breast imaging (bone scan, CT, PET-CT) |

### Pathology
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Pathologie Befund | DiagnosticReport (MII Patho) | Histology, receptor status (ER/PR/HER2), grading |
| Pathologie Praeparat | Specimen (MII Patho) | Specimen type, collection method |
| Genexpressionstest | RiskAssessment | Oncotype DX, MammaPrint, EndoPredict, Prosigna |
| Genexpressions Score | Observation | Recurrence score values |

### Workflow & Planning
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Tumorboard Empfehlung | CarePlan | Therapy recommendations coded in SNOMED CT |
| OP Planung | ServiceRequest | Planned procedure type, intent, laterality |
| Studienteilnahme | ResearchSubject | Trial enrollment status |

### Treatment
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Operation | Procedure (MII Onko) | Procedure category (SNOMED CT) + OPS code |
| Systemtherapie Procedure | Procedure (MII Onko) | Therapy type (chemo, endocrine, targeted, immuno) |
| Systemtherapie Medikation | MedicationStatement (MII Onko) | Drug substances coded in SNOMED CT + ATC |
| Geplante Systemtherapie | MedicationRequest | Planned regimens |
| Strahlentherapie | Procedure (MII Onko) | Target volume, modality, boost |
| Begleitmedikation | MedicationStatement | Supportive medications |

### Complications & Implants
| Profile | FHIR Resource | SNOMED CT Role |
|---------|--------------|----------------|
| Operative Komplikation | Observation | Complication type + Clavien-Dindo grade (SNOMED CT) |
| Implantat | Device | Implant type, UDI tracking |

---

## 3. Terminology Design

### SNOMED CT as Primary Coding System

SNOMED CT is used for:
- **Diagnoses**: Malignant/benign breast conditions, histological subtypes
- **Procedures**: Surgical category (BET, mastectomy, SLNB, axillary dissection)
- **Body sites**: Laterality, quadrant localization
- **Findings**: BI-RADS, receptor status, Clavien-Dindo grades
- **Medications**: Therapeutic substances (Trastuzumab, Letrozol, Tamoxifen, etc.)
- **Staging**: TNM components, UICC stages

### Dual-Coding Strategy

| Domain | SNOMED CT (semantics) | National Code (statutory) |
|--------|----------------------|--------------------------|
| Diagnosis | 254837009 \|Malignant neoplasm of breast\| | ICD-10-GM C50.4 |
| Procedure | 392021009 \|Lumpectomy of breast\| | OPS 5-870.a1 |
| Medication | 386911006 \|Letrozole\| | ATC L02BG04 |
| Morphology | (via ConceptMap) | ICD-O-3 8500/3 |
| Topography | 80248007 \|Left breast structure\| | ICD-O-3 C50.4 |

### ValueSets (13)
- Diagnose (malign, benign, B3, local codes)
- Laterality (Seite)
- Systemic therapy medications
- Gene expression test types
- Risk classification
- Metastasis status
- Screening status

### ConceptMaps (8 reverse maps, SNOMED CT to national codes)
- SNOMED CT to oBDS Seitenlokalisation
- SNOMED CT to oBDS Grading
- SNOMED CT to oBDS Residualstatus
- SNOMED CT to oBDS Intention
- SNOMED CT to oBDS Therapiestellung
- SNOMED CT to oBDS Therapieart
- SNOMED CT to ICD-O-3 Topography (Quadrant)
- SNOMED CT to ATC (Medications)

---

## 4. Registry Transformation Pipeline

### Target Registries & Logical Models

| Registry | Purpose | Format | Logical Model |
|----------|---------|--------|---------------|
| **oBDS** v3.0.5 | Cancer registry reporting (KRG §65c) | XML | OBDSMeldung |
| **IRegG** | Breast implant registry (IRegG) | XML | IRegBrustimplantatMeldung |
| **IQTIG** 18/1 | Quality assurance (breast surgery) | XML/CSV | IQTIGMammachirurgie181 |
| **OncoBox** N1.1.1 | DKG breast center certification | Excel/XML | OncoBoxBrustMeldung |

### StructureMaps (30 total)

**oBDS (16 maps)**: Diagnose, Histologie, TNM, Modul Mamma, OP, Residualstatus, SYST, ST, Nebenwirkung, Fernmetastasen, Verlauf, Leistungszustand, Tod, Tumorkonferenz, Tumorzuordnung, Meldung (orchestrator)

**IRegG (4 maps)**: Patient, Operation, Entlassung, Meldung (orchestrator)

**IQTIG (4 maps)**: Basis, Operation, Brust, Mammachirurgie181 (orchestrator)

**OncoBox (6 maps)**: Zentrum, Primaerfall, Operation, Therapie, Kennzahlen, Brust (orchestrator)

### Transformation Example

```
FHIR Bundle (Senologie profiles)
  │
  ├─ Condition (SNOMED: 254837009, ICD-10-GM: C50.4)
  ├─ Procedure (SNOMED: 392021009, OPS: 5-870.a1)
  ├─ Observation (SNOMED: HER2 3+, ER 90%, PR 80%)
  ├─ MedicationStatement (SNOMED: Trastuzumab)
  └─ Device (Breast implant, UDI)
       │
       ▼ StructureMaps + ConceptMaps
       │
  ├─► oBDS XML:    <Diagnose><ICD-Code>C50.4</ICD-Code>...
  ├─► IRegG XML:   <Implantat><OPS>5-886.17</OPS>...
  ├─► IQTIG CSV:   18/1 Mammachirurgie data fields...
  └─► OncoBox XML: <Primaerfall><HER2>3+</HER2>...
```

---

## 5. SDC Questionnaires — Invisible SNOMED CT

### Design: Clinicians never see SNOMED CT codes

```
┌─────────────────────────────────────────────┐
│  Questionnaire: Postoperative Documentation │
│                                             │
│  Operation type:  [Breast-conserving ▼]     │  ← Clinician sees text
│  Side:            [Left breast     ▼]       │  ← SNOMED CT 80248007
│  Complication:    [Seroma          ▼]       │  ← SNOMED CT 285345009
│  Clavien-Dindo:  [Grade II        ▼]       │  ← SNOMED CT 1367520006
│  Date:            [2025-02-05      ]        │
│                                             │
│                        [Submit]             │
└─────────────────────────────────────────────┘
                         │
                    $extract (SDC)
                         │
                         ▼
              FHIR Procedure + Observation
              (fully SNOMED CT-coded)
```

### Modular Adoption

Systems can use the IG at different levels:

| Level | What to adopt | Example |
|-------|--------------|---------|
| **Terminology only** | ValueSets, ConceptMaps | Existing system adds SNOMED CT coding |
| **Data model** | 24 FHIR Profiles | KIS implements profiles directly |
| **Forms** | SDC Questionnaires | App renders standardized forms |
| **Transformation** | StructureMaps | Registry gateway exports automatically |
| **Full stack** | All of the above | New breast center documentation system |

---

## 6. Quality Indicators (CQL)

CQL-based quality indicators from the S3 breast cancer guideline query SNOMED CT-coded resources:

| QI | Indicator | SNOMED CT Query |
|----|-----------|-----------------|
| QI-02 | Pre-therapeutic histological confirmation | Procedure with OPS 1-490/1-491/1-494 before surgery |
| QI-04 | Axillary surgery rate in DCIS (inverse) | DCIS (109889007) + BET + axillary procedure |
| QI-06 | Sentinel node biopsy in pN0 | Invasive carcinoma (254837009) + SNB procedure |
| QI-08 | Radiation after breast-conserving surgery | Invasive carcinoma + BET + radiation procedure |
| QI-09 | Endocrine therapy in HR+ patients | Invasive carcinoma + endocrine medication |
| QI-11 | R0 resection rate | Invasive carcinoma + surgery + R0 outcome |
| QI-12 | ER/PR determination with % and intensity | Invasive carcinoma + DiagnosticReport with ER/PR |
| QI-13 | HER2 scoring (ASCO/CAP) | Invasive carcinoma + DiagnosticReport with HER2 |

---

## 7. SNOMED CT Governance Findings

### Content Gaps Identified

| Category | Example | Status |
|----------|---------|--------|
| Missing concepts | Breast-specific surgical subtypes | Documented for NRC submission |
| Missing German translations | Clinical terms without DE preferred term | Documented for NRC submission |
| Mapping conflicts | SNOMED CT ↔ oBDS code mismatches | Resolved via ConceptMap review |
| National extension gaps | Concepts in INT edition not on DE Ontoserver | Reported to NRC |
| Local interim codes | CodeSystem for concepts without SNOMED match | To be replaced once concepts are added |

### Feedback Loop

```
Clinical Practice ──► IG Development ──► SNOMED CT Gap Analysis
       ▲                                        │
       │                                        ▼
Registry Evolution ◄── IG Update ◄───── NRC / SNOMED International
```

---

## 8. Open Design Questions (Community Ballot)

The IG includes 15 open questions for community discussion during the May 2026 commenting phase. Selected questions with SNOMED CT relevance:

**OF-6: Medication Architecture** — How to categorize antineoplastic vs. supportive vs. concomitant medications? Which SNOMED CT hierarchy to use for medication categorization?

**OF-9: Gene Expression Tests** — Model commercial IVD assays (Oncotype DX, MammaPrint) as DeviceDefinition or CodeSystem? SNOMED CT has limited coverage of these proprietary assays.

**OF-10: ASK vs. ATC for Medications** — Is the German drug substance catalog (ASK) needed alongside ATC and SNOMED CT? Implications for ConceptMap complexity.

**OF-12: Tumor Progression Modeling** — Update existing Condition vs. create new Condition with reference? Impacts which SNOMED CT clinical status codes to use.

---

## 9. Project Status

| Milestone | Status |
|-----------|--------|
| Clinical dataset annotation (DGS) | Complete |
| 24 FHIR Profiles | Complete |
| 30 StructureMaps (4 registries) | Complete |
| 12 Synthetic test patients | Complete |
| SDC Questionnaires (5) | Complete |
| CQL Quality Indicators (8 of 17) | In progress |
| Public commenting phase | May 2026 |
| SNOMED CT gap report to NRC | Planned |
| Version 0.9.0 release | May 2026 |
| Version 1.0.0 release | Q4 2026 |

---

## 10. Links

- **IG CI Build**: https://bih-cei.github.io/SenologieOnFHIR
- **IG Canonical**: https://www.senologie.org/fhir *(not yet published under canonical — CI build available at the link above)*
- **German Society for Senology**: https://www.senologie.org
- **Berlin Institute of Health**: https://www.bihealth.org
- **MII Kerndatensatz Onkologie**: https://www.medizininformatik-initiative.de/fhir/ext/modul-onko
