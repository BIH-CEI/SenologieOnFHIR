### Example Case: Erika Neumann

> **[Download Bundle (JSON)](Bundle-Fall1-Erika-Neumann.json)** — All 22 resources as a FHIR Transaction Bundle. Can be visualised in the [clinFHIR Bundle Viewer](https://test.clinfhir.com/clinfhir/bundleViewer.html) or imported into a FHIR server.

#### At a Glance

| | |
|---|---|
| **Patient** | Erika Neumann, born 1966, female |
| **Diagnosis** | Invasive breast carcinoma NST, left upper outer quadrant (OAQ) |
| **Stage** | cT1c cN0 cM0, UICC IA |
| **Molecular subtype** | HR+/HER2- (Luminal A-like) |
| **Receptor status** | ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15% |
| **Gene expression** | Oncotype DX Recurrence Score 18 (low) |
| **Treatment** | BCS + SLNB → adjuvant RT → endocrine therapy |
| **Outcome** | R0, pN0(sn), no recurrence at 6-month follow-up |

#### Clinical Course

##### Presentation and Diagnostics

Ms Neumann presents in January 2025 with a self-detected lump in the left breast. Clinical examination confirms a firm, mobile nodule in the upper outer quadrant.

**Imaging:**
- Bilateral mammography: BI-RADS 5 left OAQ (18 mm, ill-defined margins), BI-RADS 1 right
- Bone scintigraphy: no evidence of osseous metastases

**Pathology (core needle biopsy):**
- Invasive carcinoma NST, G2
- ER+ IRS 12, PR+ IRS 8, HER2- (IHC 1+), Ki-67 15%

**Staging:** cT1c cN0 cM0, UICC IA

##### Genetic Risk Assessment

Oncotype DX Recurrence Score: 18 (low risk). 10-year distant recurrence risk: 12%. On this basis, adjuvant chemotherapy is not recommended.

##### Tumour Board (Tumorboard)

The multidisciplinary tumour board recommends:
- Breast-conserving surgery (BCS) with sentinel lymph node biopsy (SLNB)
- Adjuvant whole-breast irradiation with boost
- Endocrine therapy (aromatase inhibitor) for 5–10 years
- No chemotherapy

##### Surgical Treatment

In February 2025, BCS of the left breast with sentinel lymph node biopsy is performed:
- R0 resection
- Sentinel lymph node negative: pN0(sn) (0/2)
- Definitive pTNM: pT1c pN0(sn) cM0

##### Radiotherapy

Adjuvant whole-breast irradiation left (March–April 2025):
- 50 Gy in 25 fractions
- Boost 10 Gy in 5 fractions to the tumour bed
- Total dose: 60 Gy, 30 sessions

##### Endocrine Therapy

Aromatase inhibitor (letrozole 2.5 mg daily) commenced following completion of radiotherapy, planned for at least 5 years.

##### Concomitant Medication

- Metoprolol 47.5 mg (arterial hypertension, since 2020)
- L-thyroxine 75 µg (hypothyroidism, since 2018)

##### Follow-up (6 months)

- Clinically unremarkable, no evidence of recurrence
- ECOG 0 (fully active)
- Endocrine therapy compliance good

#### Data in This IG

All FHIR resources for this case are included as examples in the IG. They demonstrate the interplay of profiles across the entire care pathway:

- Patient, Condition (diagnosis), DiagnosticReports (imaging, pathology)
- Observations (BI-RADS, clinical examination, gynaecological history, gene expression score, ECOG, follow-up)
- RiskAssessment (gene expression test), FamilyMemberHistory
- CarePlan (tumour board recommendation), ServiceRequest (surgical planning)
- Procedures (BCS, SLNB, radiotherapy)
- Specimen (core needle biopsy specimen)
- MedicationStatements (concomitant medication)
