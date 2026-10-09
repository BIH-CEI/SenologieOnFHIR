### Test Patients

This page describes 12 synthetic test cases that illustrate the complete care pathway in breast oncology (Senologie). The cases cover all breast cancer subtypes, stages 0–IV, benign findings, and a B3 lesion. They are intended to demonstrate and validate the FHIR profiles of this implementation guide, and to serve as the basis for CQL quality indicators.

**Total scope**: 208 FHIR instances across 12 cases, loaded onto HAPI FHIR (localhost:8095).

#### Overview

| Case | Name | Age | Diagnosis | Subtype | Stage | Surgery | Special features |
|---|---|---|---|---|---|---|---|
| 1 | Erika Neumann | 60 | Invasive NST | HR+/HER2- | IA | BCS | Oncotype DX, Letrozole |
| 2 | Lena Hoffmann | 44 | Invasive NST | TNBC | IV | Mastectomy | Neoadj+Immuno, Progression, MTB |
| 3 | Sabine Weber | 72 | Invasive NST | HR+/HER2- | IIA | Mastectomy | N1, older patient |
| 4 | Julia Fischer | 38 | Invasive NST | HER2+ | IIB | BCS | Neoadj TCHP, pCR |
| 5 | Monika Braun | 55 | Invasive NST | HR+/HER2+ | IIIA | BCS | Dual positive, neoadjuvant |
| 6 | Petra Schneider | 67 | **DCIS** | ER+ | 0 | BCS | No invasive component, screening |
| 7 | Kathrin Müller | 48 | Invasive NST | TNBC | IIA | BCS | Neoadj, pCR |
| 8 | **Klaus Hartmann** | 69 | Invasive NST | HR+/HER2- | IIA | Mastectomy | **Male**, Tamoxifen |
| 9 | Andrea Wolf | 51 | Invasive lobular | HR+/HER2- | IIIC | BCS | N3(12/18), **complication: lymphoedema** |
| 10 | Christina Becker | 43 | Invasive NST | TNBC | IA | Bilateral mastectomy | **BRCA1**, prophylactic + **2 implants** |
| 11 | Hannah Klein | 34 | **Fibroadenoma** | — | — | None | **Benign**, BI-RADS 3 |
| 12 | Renate Vogel | 45 | **ADH (B3)** | — | — | Re-excision | **B3 lesion**, vacuum-assisted biopsy |

---

#### Case 1: Erika Neumann — Early breast cancer, curative

##### Patient data

| Attribute | Value |
|---|---|
| Name | Erika Neumann |
| Date of birth | 12.03.1966 (60 years) |
| Menopausal status | Postmenopausal (for 5 years) |
| Comorbidities | Arterial hypertension, hypothyroidism |
| Concomitant medication | Metoprolol 47.5 mg 1-0-0, L-thyroxine 75 µg 1-0-0 |
| Family history | Mother with breast cancer at age 52 |

##### Care pathway

###### 1. Initial presentation (15.01.2025)

Self-detected lump upper outer left breast; referred by gynaecologist. Clinical examination: firm, non-mobile nodule approx. 2 cm; no palpable axillary lymph nodes.

**Profiles:** [Clinical Examination](StructureDefinition-senologie-klinische-untersuchung.html), [Gynaecological History](StructureDefinition-senologie-gynaekologische-anamnese.html), [Family History](StructureDefinition-senologie-familienanamnese.html), [Concomitant Medication](StructureDefinition-senologie-begleitmedikation.html)

###### 2. Imaging (15.01.2025)

Bilateral mammography and left breast ultrasound. Mammography: ACR B, BI-RADS 5 upper outer left. Ultrasound: irregular mass 18 mm, no pathological axillary lymph node.

**Profiles:** [Imaging Report](StructureDefinition-senologie-bildgebung-befund.html), [Imaging Observation](StructureDefinition-senologie-bildgebung-observation.html), [Tumour Localisation](StructureDefinition-senologie-tumorlokalisation.html)

###### 3. Biopsy and pathology (20.01.2025)

Ultrasound-guided core needle biopsy. Histology: invasive carcinoma NST (no special type), G2. Immunohistochemistry: ER positive (IRS 12), PR positive (IRS 8), HER2 negative (score 1+), Ki-67 15%.

**Profiles:** [Pathology Report](StructureDefinition-senologie-pathologie-befund.html), [Pathological Specimen](StructureDefinition-senologie-pathologie-praeparat.html), [Malignant Diagnosis](StructureDefinition-senologie-diagnose-maligne.html)

###### 4. Staging (22.01.2025)

Bone scintigraphy: no evidence of osseous metastases. Liver ultrasound: unremarkable. Chest X-ray: unremarkable. Staging result: cT1c cN0 cM0, UICC Stage IA.

**Profiles:** [Other Imaging](StructureDefinition-senologie-bildgebung-sonstige.html)

###### 5. Gene expression test

Oncotype DX Recurrence Score 18 — low risk. Guideline recommendation: no chemotherapy benefit in a postmenopausal patient with RS ≤25 (TAILORx).

**Profiles:** [Gene Expression Test](StructureDefinition-senologie-genexpressionstest.html), [Gene Expression Score](StructureDefinition-senologie-genexpressions-score.html)

###### 6. Tumour board (Tumorkonferenz) (28.01.2025)

Recommendation: breast-conserving surgery (BCS) with sentinel lymph node biopsy (SLNB), adjuvant radiotherapy, endocrine therapy with aromatase inhibitor. No chemotherapy.

**Profiles:** [Tumour Board Recommendation](StructureDefinition-senologie-tumorboard-empfehlung.html)

###### 7. Surgery (05.02.2025)

BCS left with SLNB. Histology: invasive carcinoma NST, 17 mm, G2. Sentinel lymph nodes: 0/2 involved. Pathological staging: pT1c pN0(sn)(0/2) cM0 R0 L0 V0 Pn0, UICC Stage IA. No complications.

**Profiles:** [Surgical Planning](StructureDefinition-senologie-op-planung.html), [Surgery](StructureDefinition-senologie-operation.html), [Pathology Report](StructureDefinition-senologie-pathologie-befund.html), [Pathological Specimen](StructureDefinition-senologie-pathologie-praeparat.html)

###### 8. Radiotherapy (10.03.–18.04.2025)

Whole breast irradiation left 50 Gy in 25 fractions with sequential boost to the tumour bed 10 Gy in 5 fractions. Adverse effect: radiodermatitis CTCAE grade 1.

**Profiles:** [Radiotherapy](StructureDefinition-senologie-strahlentherapie.html)

###### 9. Endocrine therapy (from 01.03.2025)

Letrozole 2.5 mg/day, planned for 5 years. Concomitant medication: calcium and vitamin D for osteoporosis prophylaxis.

**Profiles:** [Planned Systemic Therapy](StructureDefinition-senologie-geplante-systemtherapie.html), [Systemic Therapy Medication](StructureDefinition-senologie-systemtherapie-medikation.html), [Concomitant Medication](StructureDefinition-senologie-begleitmedikation.html)

###### 10. Follow-up (15.08.2025)

Bilateral mammography and ultrasound: no evidence of recurrence, BI-RADS 2. Clinical examination unremarkable. EQ-5D-5L: no limitations.

**Profiles:** [Imaging Report](StructureDefinition-senologie-bildgebung-befund.html), [Imaging Observation](StructureDefinition-senologie-bildgebung-observation.html), [Clinical Examination](StructureDefinition-senologie-klinische-untersuchung.html)

---

#### Case 2: Lena Hoffmann — Locally advanced/metastatic, palliative

##### Patient data

| Attribute | Value |
|---|---|
| Name | Lena Hoffmann |
| Date of birth | 28.09.1980 (44 years) |
| Menopausal status | Premenopausal |
| Comorbidities | None |
| Family history | Unremarkable |

##### Care pathway

###### 1. Initial presentation (03.03.2025)

Palpable mass right breast for 4 weeks, increasing in size. Enlarged axillary lymph nodes palpable on the right. Clinical examination: firm tumour approx. 5 cm right central, several enlarged fixed axillary lymph nodes on the right.

**Profiles:** [Clinical Examination](StructureDefinition-senologie-klinische-untersuchung.html), [Gynaecological History](StructureDefinition-senologie-gynaekologische-anamnese.html)

###### 2. Imaging (03.03.2025)

Mammography, ultrasound, and breast MRI. Mammography: ACR C, BI-RADS 5 right central. Ultrasound: irregular mass 52 mm, 3 pathological axillary lymph nodes. MRI: confirmed, no contralateral finding.

**Profiles:** [Imaging Report](StructureDefinition-senologie-bildgebung-befund.html), [Imaging Observation](StructureDefinition-senologie-bildgebung-observation.html), [Tumour Localisation](StructureDefinition-senologie-tumorlokalisation.html)

###### 3. Biopsy and pathology (07.03.2025)

Core needle biopsy of tumour and lymph node fine-needle aspiration. Histology: invasive carcinoma NST, G3. Immunohistochemistry: ER negative, PR negative, HER2 negative (FISH not amplified) — **triple-negative breast cancer (TNBC)**. Ki-67 70%.

**Profiles:** [Pathology Report](StructureDefinition-senologie-pathologie-befund.html), [Pathological Specimen](StructureDefinition-senologie-pathologie-praeparat.html), [Malignant Diagnosis](StructureDefinition-senologie-diagnose-maligne.html)

###### 4. Staging (10.03.2025)

CT thorax/abdomen: no evidence of distant metastases. Bone scintigraphy: solitary increased uptake at T12. MRI spine: **osseous metastasis at T12** confirmed. Staging result: cT3 cN2a cM1(OSS), UICC Stage IV.

**Profiles:** [Other Imaging](StructureDefinition-senologie-bildgebung-sonstige.html)

###### 5. Tumour board (Tumorkonferenz) (14.03.2025)

TNBC, locally advanced, solitary osseous metastasis. Recommendation: neoadjuvant chemotherapy with immunotherapy (KEYNOTE-522 regimen: carboplatin/paclitaxel + pembrolizumab), followed by mastectomy with axillary dissection, adjuvant pembrolizumab maintenance, chest wall radiotherapy. Referral to the **Molecular Tumour Board (MTB)** for genomic profiling. Bisphosphonate (zoledronate).

**Profiles:** [Tumour Board Recommendation](StructureDefinition-senologie-tumorboard-empfehlung.html)

###### 6. Trial participation

Screening for KEYNOTE-522 trial, informed consent obtained 17.03.2025, enrolled in the intervention arm.

**Profiles:** [Trial Participation](StructureDefinition-senologie-studienteilnahme.html)

###### 7. Neoadjuvant systemic therapy (24.03.–15.08.2025)

- **Phase 1 (cycles 1–4):** Carboplatin AUC 5 d1 + paclitaxel 80 mg/m² d1,8,15 + pembrolizumab 200 mg d1, q3w
- **Phase 2 (cycles 5–8):** Doxorubicin 60 mg/m² + cyclophosphamide 600 mg/m² + pembrolizumab 200 mg d1, q3w
- Adverse effects: nausea CTCAE grade 2, neutropenia CTCAE grade 3 (dose reduction in cycle 6), fatigue grade 2

**Profiles:** [Systemic Therapy Procedure](StructureDefinition-senologie-systemtherapie-procedure.html), [Systemic Therapy Medication](StructureDefinition-senologie-systemtherapie-medikation.html), [Planned Systemic Therapy](StructureDefinition-senologie-geplante-systemtherapie.html)

###### 8. Re-staging (20.08.2025)

Ultrasound and MRI: marked tumour regression (12 mm residual), axillary lymph nodes no longer pathological. Bone scintigraphy: reduction in uptake at T12. Assessment: good response, surgery recommended.

**Profiles:** [Imaging Report](StructureDefinition-senologie-bildgebung-befund.html), [Imaging Observation](StructureDefinition-senologie-bildgebung-observation.html), [Other Imaging](StructureDefinition-senologie-bildgebung-sonstige.html)

###### 9. Surgery (01.09.2025)

Right mastectomy with axillary dissection levels I–II. Histology: ypT1a ypN0(0/14) — pathological complete response (pCR) of lymph nodes. Residual tumour 8 mm (near-pCR). R0 L0 V0 Pn0. Complication: axillary seroma, Clavien–Dindo grade I (aspiration).

**Profiles:** [Surgical Planning](StructureDefinition-senologie-op-planung.html), [Surgery](StructureDefinition-senologie-operation.html), [Pathology Report](StructureDefinition-senologie-pathologie-befund.html), [Pathological Specimen](StructureDefinition-senologie-pathologie-praeparat.html), [Surgical Complication](StructureDefinition-senologie-operative-komplikation.html)

###### 10. Adjuvant systemic therapy (from 01.10.2025)

Pembrolizumab 200 mg q3w maintenance for 9 cycles. Zoledronate 4 mg i.v. q4w.

**Profiles:** [Systemic Therapy Procedure](StructureDefinition-senologie-systemtherapie-procedure.html), [Systemic Therapy Medication](StructureDefinition-senologie-systemtherapie-medikation.html), [Concomitant Medication](StructureDefinition-senologie-begleitmedikation.html)

###### 11. Radiotherapy (06.10.–14.11.2025)

Right chest wall and supraclavicular lymphatic drainage 50 Gy in 25 fractions. No relevant adverse effects.

**Profiles:** [Radiotherapy](StructureDefinition-senologie-strahlentherapie.html)

###### 12. Disease course / Progression (15.03.2026)

Follow-up CT: new hepatic lesions, suspected liver metastases. Biopsy confirms metastasis (TNBC). Repeat tumour board: transition to palliative treatment concept, referral to palliative care.

**Profiles:** [Other Imaging](StructureDefinition-senologie-bildgebung-sonstige.html), [Pathology Report](StructureDefinition-senologie-pathologie-befund.html), [Tumour Board Recommendation](StructureDefinition-senologie-tumorboard-empfehlung.html), [Malignant Diagnosis](StructureDefinition-senologie-diagnose-maligne.html)

---

#### Cases 3–12: Short profiles

##### Case 3: Sabine Weber — HR+/HER2-, N1, older patient
72 years, postmenopausal. Invasive carcinoma NST right breast, G2, ER+ IRS 10, PR+ IRS 6, HER2- score 0, Ki-67 12%. pT2 pN1a(2/12) cM0, UICC IIA. Right mastectomy + axillary dissection → R0. Adjuvant RT chest wall 50 Gy. Endocrine: anastrozole. No chemotherapy (postmenopausal, low-risk profile despite N1).

##### Case 4: Julia Fischer — HER2+, neoadjuvant, pCR
38 years, premenopausal. Invasive carcinoma NST left breast, G3, ER- PR- HER2+ (FISH amplified), Ki-67 45%. cT2 cN1 cM0, UICC IIB. Neoadjuvant TCHP (docetaxel + carboplatin + trastuzumab + pertuzumab). BCS left + SLNB → ypT0 ypN0 = **pCR**, R0. Adjuvant trastuzumab + pertuzumab 1 year, RT.

##### Case 5: Monika Braun — HR+/HER2+, dual positive
55 years, perimenopausal. Invasive carcinoma NST right breast, G2, ER+ IRS 8, PR+ IRS 4, HER2+ (score 3+), Ki-67 30%. cT3 cN1 cM0, UICC IIIA. Neoadjuvant EC → docetaxel + trastuzumab. BCS right + SLNB → ypT1a ypN0, R0. Adjuvant trastuzumab 1 year + RT + letrozole.

##### Case 6: Petra Schneider — DCIS (Stage 0)
67 years, postmenopausal. **Ductal carcinoma in situ (DCIS)**, G2, ER+. Screening mammography → BI-RADS 4 (microcalcifications). Vacuum-assisted biopsy → DCIS confirmed. BCS left → R0. Adjuvant RT 50 Gy (no boost). No systemic therapy, no staging. No axillary procedure (QI-4 compliant).

##### Case 7: Kathrin Müller — TNBC, curative, pCR
48 years, premenopausal. Invasive carcinoma NST right breast, G3, ER- PR- HER2-, Ki-67 65%. cT2 cN0 cM0, UICC IIA. Neoadjuvant carboplatin + weekly paclitaxel, then EC. BCS right + SLNB → ypT0 ypN0 = **pCR**, R0. Adjuvant RT 50 Gy + boost 16 Gy. No endocrine therapy (triple-negative).

##### Case 8: Klaus Hartmann — Male breast cancer
69 years, **male**. Invasive carcinoma NST right breast, G2, ER+ IRS 12, PR+ IRS 6, HER2- score 1+, Ki-67 18%. pT2 pN0(sn)(0/3) cM0, UICC IIA. Right mastectomy + SLNB → R0. Adjuvant RT chest wall. Endocrine: **tamoxifen** 20 mg/day (standard in men; no aromatase inhibitor). No gynaecological history.

##### Case 9: Andrea Wolf — N3, complication lymphoedema
51 years, premenopausal. Invasive lobular carcinoma left breast, G2, ER+ IRS 12, PR+ IRS 10, HER2-, Ki-67 20%. pT2 pN3a(12/18) cM0, UICC IIIC. Adjuvant EC × 4 → paclitaxel × 12. BCS left + axillary dissection levels I–III → R0. **Complication: left arm lymphoedema, Clavien–Dindo grade II**. RT 50 Gy + boost + lymphatic drainage field. Endocrine: tamoxifen.

##### Case 10: Christina Becker — BRCA1, bilateral, implants
43 years, premenopausal. Invasive carcinoma NST right breast, G3, ER- PR- HER2-, Ki-67 55%. **BRCA1 mutation**. cT1c cN0 cM0, UICC IA. Family history: mother breast cancer at 41, sister ovarian cancer at 39. **Bilateral mastectomy** (therapeutic right + prophylactic left) + **immediate bilateral reconstruction with silicone implants**. SLNB on the right side only (therapeutic side) — pN0(sn)(0/2). No lymph node assessment on the left, as prophylactic surgery was performed without tumour suspicion (no pN staging left). Adjuvant carboplatin + paclitaxel. RT right chest wall.

##### Case 11: Hannah Klein — Fibroadenoma (benign)
34 years, premenopausal. Palpable lump upper outer left breast, 15 mm, smooth margins. Mammography BI-RADS 3. Ultrasound: hypoechoic nodule. Core needle biopsy: **fibroadenoma**, no atypia. Diagnosis: **Senologie_Diagnose_Benigne** (ICD-10 D24, SNOMED 254845004). No surgery, no therapy — follow-up in 6 months.

##### Case 12: Renate Vogel — B3 lesion (ADH)
45 years, premenopausal. Screening mammography → BI-RADS 4a (microcalcifications). Vacuum-assisted biopsy: **atypical ductal hyperplasia (ADH)**, B3 category. Tumour board: re-excision recommended. Open biopsy/re-excision left → no upgrade, R0. No further therapy; close follow-up surveillance.

##### Case 13: Margarete Schreiber — Synchronous bilateral breast cancer
64 years, postmenopausal. Synchronous bilateral diagnosis: **Left**: C50.4, invasive carcinoma NST, pT1c pN0(sn) cM0, ER+/PR+/HER2-, G2 → BCS + SLNB, R0. **Right**: C50.2, invasive carcinoma NST, pT2 pN1a cM0, ER+/PR-/HER2+, G3 → SSM + ALND levels I–II, R0. Adjuvant chemotherapy EC-Pac-H (driven by HER2+ right, covering both sides). Demonstrates: two separate Conditions with side-specific Procedure linkage via `reasonReference` and SDC Choice Selection Pattern for reference-diagnosis selection in bilateral carcinoma.

---

#### Profile coverage

| Profile | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Malignant Diagnosis | x | x | x | x | x | x | x | x | x | x | | |
| Benign Diagnosis | | | | | | | | | | | x | |
| Imaging Report | x | x | x | x | x | x | x | x | x | x | x | x |
| Imaging Observation | x | x | x | x | x | x | x | x | x | x | x | x |
| Other Imaging | x | x | | | | | | | | | | |
| Pathology Report | x | x | x | x | x | x | x | x | x | x | x | x |
| Pathological Specimen | x | x | x | x | x | x | x | x | x | x | x | x |
| Clinical Examination | x | x | | | | | | | | | x | |
| Gynaecological History | x | x | | | | | | | | | | |
| Family History | x | | | | | | | | | x | | |
| Gene Expression Test | x | | | | | | | | | | | |
| Gene Expression Score | x | | | | | | | | | | | |
| Tumour Board | x | x | | x | x | | x | | x | | | x |
| Surgical Planning | x | | | | | | | | | | | |
| Surgery | x | x | x | x | x | x | x | x | x | x | | x |
| Surgical Complication | | x | | | | | | | x | | | |
| Implant | | | | | | | | | | x | | |
| Radiotherapy | x | x | x | x | x | x | x | x | x | x | | |
| Systemic Therapy Procedure | | x | | x | x | | x | | x | x | | |
| Systemic Therapy Medication | | x | | x | x | | x | | x | x | | |
| Concomitant Medication | x | x | x | | x | | | x | x | | | |
| Trial Participation | | x | | | | | | | | | | |

Legend: 1=Neumann, 2=Hoffmann, 3=Weber, 4=Fischer, 5=Braun, 6=Schneider, 7=Müller, 8=Hartmann, 9=Wolf, 10=Becker, 11=Klein, 12=Vogel

---

#### Link to Patient-Reported Outcomes (PROMs)

Both test patients are surveyed at defined time points in the care pathway using standardised PRO instruments. The following overview shows the planned assessment time points:

| Instrument | Time points | Case 1 | Case 2 |
|---|---|:---:|:---:|
| **EQ-5D-5L** | Baseline, post-op, 6 months, 12 months | &#10003; | &#10003; |
| **EORTC QLQ-C30** | Baseline, follow-up | &#10003; | &#10003; |
| **EORTC QLQ-BR45** | Post-op, follow-up | &#10003; | &#10003; |
| **PROMIS-29 + Cognitive Function 4a** | Initial presentation | &#10003; | &#10003; |
| **PRO-CTCAE** | During systemic therapy | | &#10003; |

**Note:** These instruments are profiled in the [MII PRO Module](https://www.medizininformatik-initiative.de/Kerndatensatz/Modul_Patient_Reported_Outcomes/IGMIIKDSModulPatientReportedOutcomesPRO.html) and are not part of this implementation guide. The Senologie IG references the PRO module for the structured capture of patient-reported endpoints.
