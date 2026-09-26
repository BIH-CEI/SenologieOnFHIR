# Diagnosis & Staging

<img src="senologie-diagnose.png" alt="UML Diagnosis & Staging" style="max-width:100%"/>

## Spectrum of Senological Diagnoses

A breast centre (Brustzentrum) does not exclusively treat cancer patients. The diagnostic spectrum includes:

| Category | Examples | ICD-10-GM | Reportable |
|-----------|-----------|-----------|----------------|
| Invasive carcinoma | NST, lobular, medullary | C50.x | Yes (oBDS, OncoBox, IQTIG) |
| Carcinoma in situ | DCIS | D05.x | Yes (oBDS, OncoBox, IQTIG) |
| Lesions of uncertain malignant potential | ADH, FEA, papilloma, LIN | D48.6 | Partially |
| Benign conditions | Fibroadenoma, cysts, mastopathy | D24, N60–N64 | No |
| Inflammatory conditions | Mastitis, abscess | N61 | No |
| Risk-reducing procedures | Prophylactic mastectomy (e.g. BRCA) | Z40 | No (implant registry may apply) |
| Reconstructive procedures | Breast reconstruction | Z42 | No (implant registry may apply) |

Not all cases require a complete oncological staging workup or a cancer registry notification. The data model must be capable of representing the full spectrum while clearly distinguishing the level of documentation required for each diagnosis.

## Diagnosis Modelling

Assignment of a definitive diagnosis is not always clear from the outset. A patient presents with a suspicious finding — whether it represents a benign change, a risk lesion, a carcinoma in situ, or an invasive carcinoma is often only established during the diagnostic process (imaging → biopsy → pathology → surgical specimen if applicable). DCIS, for example, is neither clearly benign nor invasively malignant, yet it is managed — for the purposes of reporting and treatment — like a malignancy. B3 lesions may prove harmless on excision or may turn out to be precursors of carcinoma.

The data model must be able to represent this diagnostic process — from the initial working diagnosis (Verdachtsdiagnose) through to the confirmed diagnosis with complete staging.

The diagnosis is represented as a FHIR Condition. Two profiles cover the full spectrum:

- **Senologie_Diagnose_Maligne**: For invasive carcinomas, DCIS, and notifiable findings. Inherits from MII Onko Primärtumor. Mandatory: ICD-10-GM, SNOMED CT. Optional: ICD-11 (dual-coding for future-proofing). Includes the oncological staging fields.
- **Senologie_Diagnose_Benigne**: For non-reportable diagnoses (fibroadenoma, cysts, mastitis, reconstruction). Same coding structure, but without mandatory oncological fields.

## Staging

Oncological staging is relevant only for malignant diagnoses and encompasses:

- **TNM classification**: Clinical (cTNM) and pathological (pTNM) as separate staging entries. Additional qualifiers: y-symbol (after neoadjuvant therapy), m-symbol (multifocality), L/V/Pn categories (lymphovascular, venous, perineural invasion).
- **UICC stage**: Derived from the TNM combination.
- **Receptor status**: Oestrogen (ER), progesterone (PR), HER2 — both qualitative (positive/negative) and quantitative (IRS score, IHC score, proportion of positive cells).
- **Ki-67 proliferation index**: Percentage of proliferating cells, pivotal for subtype classification.
- **Gene expression tests**: Oncotype DX, EndoPredict, MammaPrint — risk stratification to guide treatment decisions.

The TNM categories L, V, and Pn are represented as separate Observations following MII Onko profiles (mii-pr-onko-tnm-l-kategorie, -v-kategorie, -pn-kategorie).

## Representation of Clinical Scenarios

### Initial Diagnosis

The most common constellation: a patient is presented with a newly diagnosed tumour. A Condition with `clinicalStatus = active` is created and full staging is performed.

### Recurrence

When the disease recurs after prior treatment, a new case is created. The recurrence Condition references the primary disease via `occurredFollowing`. The type of recurrence (local, regional, distant) is documented as staging information.

### Bilateral Synchronous Tumours

Two simultaneous primary tumours in both breasts are documented as separate Conditions with different laterality (`bodySite`). All subsequent resources (Procedures, Observations) must explicitly reference the applicable Condition — SDC Choice Selection with `candidateExpression` is used for this purpose.

### Progression and Metastasis

A transition from a curative to a palliative situation is documented via a status update on the existing Condition, accompanied by a follow-up Observation (MII Onko Verlauf).

## Related Resources

| Type | Resource |
|-----|-----------|
| Profile | [Senologie_Diagnose_Maligne](StructureDefinition-senologie-diagnose-maligne.html) |
| Profile | [Senologie_Diagnose_Benigne](StructureDefinition-senologie-diagnose-benigne.html) |
| Profile | [Senologie_Genexpressions_Score](StructureDefinition-senologie-genexpressions-score.html) |
| Profile | [Senologie_Genexpressionstest](StructureDefinition-senologie-genexpressionstest.html) |
| Profile | [Senologie_Ki67_Proliferationsindex](StructureDefinition-senologie-ki67-proliferationsindex.html) |
| Profile | [Senologie_PD-L1_Status](StructureDefinition-senologie-pdl1-status.html) |
| Profile | [Senologie_Somatische_Mutation](StructureDefinition-senologie-somatische-mutation.html) |
| Questionnaire | [Diagnose](Questionnaire-senologie-diagnose.html) |
| Example | [Case 1 — Diagnosis Breast Carcinoma](Condition-Fall1-Diagnose-Mammakarzinom.html) |
| Example | [Case 1 — Gene Expression Test](RiskAssessment-Fall1-Genexpressionstest.html) |
