### Slide 1: Title Slide

**Title:**
Breast Cancer Interoperable Dataset in Germany

**Subtitle:**
Supplemental Material — SNOMED CT Expo 2026 | Berlin Institute of Health at Charité (BIH) & German Society for Senology (DGS)

---

### Slide 2: Section

**Title:** Architecture Overview
**Layout:** abschnitt

---

### Slide 3: Architecture

**Title:** Document Once, Export Everywhere

**Content:**
- Clinicians capture data via FHIR SDC Questionnaires
- SNOMED CT codes are embedded transparently in answer options
- SDC $extract produces FHIR resources (24 profiles)
- StructureMaps + ConceptMaps transform to 4 registry formats
  - oBDS v3.0.5 (cancer registry)
  - IRegG (implant registry)
  - IQTIG 18/1 (quality assurance)
  - OncoBox (DKG certification)
- IG published at: https://bih-cei.github.io/SenologieOnFHIR

---

### Slide 4: Standards Stack

**Title:** Standards Hierarchy

**Content:**
- International: HL7 FHIR R4, IPS/EPS, SNOMED CT, LOINC
- European: EHDS, HL7 Europe Imaging/Lab
- National (DE): ISiK 5.0, MII Kerndatensatz, DE Base Profiles
- Domain: MII Oncology, MII Pathology, MII Imaging
- Specialty: Kerndatensatz Senologie, S3 Guideline, DGS

---

### Slide 5: Section

**Title:** Clinical Profiles
**Layout:** abschnitt

---

### Slide 6: Profiles — History & Diagnosis

**Title:** Profiles: History, Diagnosis & Imaging (10)

**Content:**
- Family History (FamilyMemberHistory) — BRCA1/2, family cancer history
- Gynecological History (Observation) — menarche, parity, menopause
- Clinical Examination (Observation) — palpation, lymph node status
- Malignant Diagnosis (Condition) — SNOMED CT + ICD-10-GM dual coding
- Benign Diagnosis (Condition) — benign/B3 lesions
- Tumor Localization (BodyStructure) — laterality, quadrant
- Imaging Report (DiagnosticReport) — mammography, ultrasound, MRI
- Imaging Finding (Observation) — BI-RADS, ACR density
- Other Imaging (DiagnosticReport) — bone scan, CT, PET-CT
- Gene Expression Test (RiskAssessment) — Oncotype DX, MammaPrint

---

### Slide 7: Profiles — Treatment & Outcomes

**Title:** Profiles: Treatment, Workflow & Outcomes (14)

**Content:**
- Pathology Report (DiagnosticReport) — ER/PR/HER2, grading, Ki-67
- Pathology Specimen (Specimen) — collection method, specimen type
- Tumor Board Recommendation (CarePlan) — MDT therapy plan
- Surgical Planning (ServiceRequest) — planned procedure, intent
- Surgery (Procedure) — BET, mastectomy + OPS codes
- Systemic Therapy (Procedure + MedicationStatement) — chemo, endocrine, targeted
- Radiation Therapy (Procedure) — target volume, dose, boost
- Planned Systemic Therapy (MedicationRequest) — regimen planning
- Supportive Medication (MedicationStatement) — concomitant drugs
- Surgical Complication (Observation) — Clavien-Dindo grade (SNOMED CT)
- Breast Implant (Device) — implant type, UDI
- Research Participation (ResearchSubject) — trial enrollment
- Gene Expression Score (Observation) — recurrence score values
- Follow-up (Observation) — disease status, ECOG

---

### Slide 8: Section

**Title:** SNOMED CT Terminology Design
**Layout:** abschnitt

---

### Slide 9: Dual-Coding Strategy

**Title:** SNOMED CT as Primary + National Codes for Registries

**Content:**
- Diagnosis: SNOMED CT 254837009 + ICD-10-GM C50.4
- Procedure: SNOMED CT 392021009 + OPS 5-870.a1
- Medication: SNOMED CT 386911006 + ATC L02BG04
- Morphology: SNOMED CT (via ConceptMap) to ICD-O-3 8500/3
- Topography: SNOMED CT 80248007 to ICD-O-3 C50.4
- Clinicians never see codes — SDC forms use human-readable labels
- 13 ValueSets, 8 ConceptMaps (SNOMED CT to national codes)

---

### Slide 10: Invisible SNOMED CT

**Title:** Clinicians Never See SNOMED CT Codes

**Content:**
- SDC Questionnaires present human-readable clinical terms
  - "Breast-conserving surgery" (not 392021009)
  - "BI-RADS 4" (not 397144001)
  - "Clavien-Dindo Grade II" (not 1367520006)
- FHIR SDC $extract produces fully coded resources
- Any FHIR-capable system can embed the same forms
  - Hospital EHR, specialized documentation tool, trial EDC, standalone app
- Modular adoption: data model, forms, transformations, or terminology only

---

### Slide 11: Section

**Title:** Registry Transformation Pipeline
**Layout:** abschnitt

---

### Slide 12: Registry Targets

**Title:** 4 Registries, 30 StructureMaps, 4 Logical Models

**Content:**
- oBDS v3.0.5 — Cancer registry (KRG §65c): 16 maps
- IRegG — Implant registry: 4 maps
- IQTIG 18/1 — Quality assurance (breast surgery): 4 maps
- OncoBox N1.1.1 — DKG breast center certification: 6 maps
- Each registry has a FHIR Logical Model as transformation target
- ConceptMaps translate SNOMED CT to registry-specific codes
- One FHIR Bundle in, four registry reports out

---

### Slide 13: Quality Indicators

**Title:** CQL-Based S3 Guideline Quality Indicators

**Content:**
- QI-02: Pre-therapeutic histological confirmation rate
- QI-04: Axillary surgery rate in DCIS (inverse — target < 5%)
- QI-06: Sentinel node biopsy rate in pN0
- QI-08: Radiation rate after breast-conserving surgery
- QI-09: Endocrine therapy rate in HR+ patients
- QI-11: R0 resection rate
- QI-12: ER/PR determination with % and intensity
- QI-13: HER2 scoring per ASCO/CAP
- All queries use SNOMED CT-coded Conditions and Procedures

---

### Slide 14: Section

**Title:** SNOMED CT Governance
**Layout:** abschnitt

---

### Slide 15: Governance Feedback

**Title:** Stress-Testing SNOMED CT — Feeding Back What We Find

**Content:**
- Missing concepts: breast-specific surgical subtypes, local interim CodeSystem
- Missing German translations: documented for NRC submission
- Mapping conflicts: SNOMED CT to oBDS code mismatches resolved via ConceptMaps
- National extension gaps: concepts in INT edition not on DE Ontoserver
- Continuous feedback loop:
  - Registry specs evolve → IG adapts → new gaps identified → NRC submission
- Public commenting phase: May 2026 (version 0.9.0)
  - Community discussion on terminology choices

---

### Slide 16: Open Design Questions

**Title:** Community Ballot — Selected Open Questions

**Content:**
- OF-6: How to categorize antineoplastic vs. supportive medications?
- OF-9: Gene expression tests as DeviceDefinition or CodeSystem?
- OF-10: Is ASK needed alongside ATC and SNOMED CT?
- OF-12: Tumor progression — update Condition or create new?
- OF-15: Structured ycTNM and ypTNM for neoadjuvant response
- 15 questions total for community discussion in May 2026
- All have SNOMED CT terminology implications

---

### Slide 17: Project Status

**Title:** Milestones & Roadmap

**Content:**
- Complete: 24 profiles, 30 StructureMaps, 12 test patients, 5 SDC Questionnaires
- In progress: CQL quality indicators (8 of 17)
- May 2026: Public commenting phase (v0.9.0)
- Planned: SNOMED CT gap report to NRC
- Q4 2026: Version 1.0.0 release
- IG: https://bih-cei.github.io/SenologieOnFHIR
