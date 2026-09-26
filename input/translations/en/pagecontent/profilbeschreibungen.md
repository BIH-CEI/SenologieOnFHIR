# Profiles

This module defines FHIR profiles for senological (breast care) documentation. Each profile either specialises an existing MII profile or a FHIR base resource.

## Diagnosis

### Malignant Diagnosis
**[Senologie_Diagnose_Maligne](StructureDefinition-senologie-diagnose-maligne.html)** (Condition)

Notifiable breast diseases (ICD-10-GM C50, D05) including invasive carcinomas and DCIS. Inherits from the MII Oncology profile `MII_PR_Onko_Diagnose_Primaertumor` and adds senology-specific requirements:

- Dual coding: SNOMED CT (24 diagnosis codes) and ICD-10-GM
- Diagnostic verification according to oBDS (histological, cytological, imaging-based, etc.)
- Metastasis status (non-metastatic / primary-metastatic / secondary-metastatic)
- TNM staging via MII Oncology references

### Benign Diagnosis
**[Senologie_Diagnose_Benigne](StructureDefinition-senologie-diagnose-benigne.html)** (Condition)

Non-notifiable breast diseases (D24, N60–N64) such as mastopathy, cysts, fibroadenomas, and inflammatory conditions. Uses the FHIR base Condition profile, as no cancer-registry requirements apply.

---

## Imaging

### Imaging Report
**[Senologie_Bildgebung_Befund](StructureDefinition-senologie-bildgebung-befund.html)** (DiagnosticReport)

Overall report of a breast imaging study (mammography, ultrasound, MRI, tomosynthesis) with modality coding via LOINC and RadLex. References individual observations.

### Imaging Observation
**[Senologie_Bildgebung_Observation](StructureDefinition-senologie-bildgebung-observation.html)** (Observation)

Individual imaging findings: BI-RADS category (0–6), ACR breast density (A–D), mass lesions, microcalcifications, lymph node status. Coded via LOINC, SNOMED CT, and RadLex.

### Other Imaging
**[Senologie_Bildgebung_Sonstige](StructureDefinition-senologie-bildgebung-sonstige.html)** (DiagnosticReport)

Non-breast-specific imaging performed as part of staging or follow-up (bone scintigraphy, CT thorax/abdomen, PET-CT, chest X-ray, liver ultrasound). Open modality coding via LOINC and SNOMED CT — the specific modalities are controlled by the form.

---

## Pathology

### Pathology Report
**[Senologie_Pathologie_Befund](StructureDefinition-senologie-pathologie-befund.html)** (DiagnosticReport)

Histopathology report with receptor status (ER, PR, HER2, Ki-67), grading, and B3 lesions. Inherits from `MII_PR_Patho_Report`.

### Pathology Specimen
**[Senologie_Pathologie_Praeparat](StructureDefinition-senologie-pathologie-praeparat.html)** (Specimen)

Tissue sample with collection method, time point (intra-/pre-operative), body site, and laterality. Inherits from `MII_PR_Patho_Specimen`.

---

## Tumour Localisation

**[Senologie_Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.html)** (BodyStructure)

Precise anatomical tumour localisation within the breast: quadrant, clock-face position, distance from nipple. Inherits from `MII_PR_Bildgebung_Koerperstruktur`.

---

## Clinical Examination and Medical History

### Clinical Examination
**[Senologie_Klinische_Untersuchung](StructureDefinition-senologie-klinische-untersuchung.html)** (Observation)

Physical examination of the breast including palpation findings, skin changes, nipple findings, and lymph node status per side.

### Gynaecological History
**[Senologie_Gynaekologische_Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.html)** (Observation)

Risk factors: age at menarche, menopausal status, pregnancies, hormone replacement therapy.

### Family History
**[Senologie_Familienanamnese](StructureDefinition-senologie-familienanamnese.html)** (FamilyMemberHistory)

Family history of breast and ovarian cancer with degree of relationship and age at diagnosis.

---

## Gene Expression Test

### Risk Assessment
**[Senologie_Genexpressionstest](StructureDefinition-senologie-genexpressionstest.html)** (RiskAssessment)

Genomic recurrence-risk stratification (Oncotype DX, MammaPrint, Prosigna, EndoPredict) with qualitative risk category (low/intermediate/high) and probability of distant recurrence.

### Gene Expression Score
**[Senologie_Genexpressions_Score](StructureDefinition-senologie-genexpressions-score.html)** (Observation)

Numeric score of the gene expression test reported as a laboratory result.

---

## Surgical Therapy

### Breast Surgery
**[Senologie_Operation](StructureDefinition-senologie-operation.html)** (Procedure)

Breast surgical procedures (mastectomy, breast-conserving surgery, axillary dissection, reconstruction) with intent, pre-operative marking, and intraoperative imaging. Inherits from `MII_PR_Onko_Mamma_Operation`.

### Surgical Planning
**[Senologie_OP_Planung](StructureDefinition-senologie-op-planung.html)** (ServiceRequest)

Pre-operative planning with planned duration, tumour board (Tumorkonferenz) decision, marking, blood draw, antibiotic therapy, and operating-table positioning. Uses module-specific extensions.

### Surgical Complication
**[Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.html)** (Observation)

Post-operative complications classified according to the Clavien-Dindo classification (Grade I–V) with time point and reference to the causative procedure.

### Breast Implant
**[Senologie_Implantat](StructureDefinition-senologie-implantat.html)** (Device)

Implant documentation with type, manufacturer, REF number, and serial number.

---

## Systemic Therapy

### Therapy Procedure
**[Senologie_Systemtherapie_Procedure](StructureDefinition-senologie-systemtherapie-procedure.html)** (Procedure)

Overall therapy course (chemotherapy, hormone therapy, targeted therapy, immunotherapy) with intent, time period, and outcome. Inherits from `MII_PR_Onko_Systemische_Therapie`.

### Medication Administration
**[Senologie_Systemtherapie_Medikation](StructureDefinition-senologie-systemtherapie-medikation.html)** (MedicationStatement)

Individual medication administration with SNOMED-CT-coded active substance, cycle and day tracking via extensions. Inherits from `MII_PR_Onko_Systemische_Therapie_Medikation`.

### Planned Systemic Therapy
**[Senologie_Geplante_Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.html)** (MedicationRequest)

Therapy planning with substance, intent (neoadjuvant, adjuvant, palliative), protocol/regimen, and line of therapy.

### Therapy Adverse Events (CTCAE)

For documenting adverse events of systemic therapy and radiotherapy, the MII Oncology profile **MII_PR_Onko_Nebenwirkung_Adverse_Event** (AdverseEvent) is used — no dedicated Senologie profile exists. It contains:
- `event.coding` — type of adverse event (CTCAE-coded with version)
- `seriousness` — CTCAE grade (1–5)
- `suspectEntity.instance` — reference to the causative therapy

For **surgical complications**, the senology-specific profile [Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.html) with Clavien-Dindo classification is used instead.

---

## Radiotherapy

**[Senologie_Strahlentherapie](StructureDefinition-senologie-strahlentherapie.html)** (Procedure)

Radiation treatment with total dose, boost, application method, intent, and fractionation (number of sessions via extension). Inherits from `MII_PR_Onko_Strahlentherapie`.

---

## Tumour Board

**[Senologie_Tumorboard_Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.html)** (CarePlan)

Multidisciplinary therapy recommendation with slices for: surgical therapy, chemotherapy, radiotherapy, endocrine therapy, targeted therapy, immunotherapy, antiresorptive therapy, further diagnostics, genetics, study participation, follow-up care.

---

## Extensions

The module defines extensions for clinical data points not provided for in the FHIR base resources:

| Extension | Context | Purpose |
|---|---|---|
| [OperationsDuration](StructureDefinition-ex-senologie-operations-duration.html) | ServiceRequest | Planned surgery duration |
| [TumorConferenceConsent](StructureDefinition-ex-senologie-tumor-conference-consent.html) | ServiceRequest | Tumour board decision |
| [PreOpMarkierung](StructureDefinition-ex-senologie-pre-op-markierung.html) | ServiceRequest | Pre-operative marking |
| [PreOpBlutabnahme](StructureDefinition-ex-senologie-pre-op-blutabnahme.html) | ServiceRequest | Pre-operative blood draw |
| [PreOpAntibiotikatherapie](StructureDefinition-ex-senologie-pre-op-antibiotikatherapie.html) | ServiceRequest | Antibiotic prophylaxis |
| [OperatingTableSetup](StructureDefinition-ex-senologie-operating-table-setup.html) | ServiceRequest | Operating table positioning |
| [SessionCount](StructureDefinition-ex-senologie-session-count.html) | Procedure | Number of radiotherapy sessions |
| [TherapyCycle](StructureDefinition-ex-senologie-therapy-cycle.html) | MedicationStatement | Therapy cycle number |
| [DayInCycle](StructureDefinition-ex-senologie-day-in-cycle.html) | MedicationStatement | Day within therapy cycle |
| [ExaminationLocation](StructureDefinition-ex-senologie-examination-location.html) | DiagnosticReport | Examination location |
| [TherapyLine](StructureDefinition-ex-senologie-therapy-line.html) | MedicationRequest | Line of therapy |
