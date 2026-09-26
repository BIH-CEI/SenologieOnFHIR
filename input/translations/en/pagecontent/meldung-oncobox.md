# OncoBox Breast Transformation (OnkoZert / DKG Breast Centre Certification)

### Overview

Certified breast centres submit their case and quality indicator data annually in the form of an **OncoBox Breast XML report** to [OnkoZert](https://xml-oncobox.de/de/Zentren/BrustZentren), the certification body of the German Cancer Society (DKG). This transformation generates **OncoBox Breast-compliant reports from clinical FHIR data** based on the senology profiles of this IG.

- **Source format**: FHIR Bundle with Senology profiles (this IG)
- **Target format**: OncoBox Brust, specification **N1.1.1**
- **Method**: FHIR StructureMaps (FML) with OncoBox Logical Model as target structure
- **Execution**: [Matchbox](https://github.com/ahdis/matchbox) as local ETL pipeline
- **Scope**: **OncoBox Brust N1.1.1** with **OncoBox 2.0 FM extension (J03-J05)** -- not OncoBox Colon/Prostate/Lung

### Architecture

The transformation follows the same pattern as the [oBDS](meldung-obds.html), [IRegG](meldung-ireg.html), and [IQTIG transformation](meldung-iqtig.html): FHIR resources are mapped to a Logical Model via StructureMaps, which is then serialised as XML (OncoBox export format).

```
┌─────────────────────────────┐
│  FHIR Bundle                │
│  (Senologie-Profile)        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  StructureMap (FML)         │
│  Orchestrator + Teil-Maps   │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  OncoBox Logical Model      │
│  (OncoBoxBrustMeldung)      │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → OncoBox XML (N1.1.1)     │
└─────────────────────────────┘
```

The OncoBox Breast report consists of:

- **Zentrum** (Centre) -- OnkoZert centre identifier, reporting period
- **Primaerfall** (Primary case) (1..*) -- one entry per patient/case with diagnosis, therapy, and follow-up
- **Kennzahlen KB-1 to KB-20** -- aggregated DKG quality indicators (numerator/denominator)

### StructureMap Overview

| StructureMap | Task | Source Profiles | Target (Logical Model) |
|---|---|---|---|
| **SenologieToOncoBoxBrust** | Orchestrator: dispatches to sub-maps | Bundle (all profiles) | OncoBoxBrustMeldung |
| **SenologieToOncoBoxBrustZentrum** | Organization + metadata | Organization | zentrum |
| **SenologieToOncoBoxBrustPrimaerfall** | Patient + Condition + Encounter + diagnosis block | Patient, Condition, Encounter, Observation, CarePlan, ResearchSubject | primaerfall |
| **SenologieToOncoBoxBrustOperation** | Surgery + Specimen + Pathology | Procedure, Specimen, Observation | primaerfall.operation |
| **SenologieToOncoBoxBrustTherapie** | Systemic therapy + radiotherapy | Procedure (Senologie_Systemtherapie, _Strahlentherapie) | primaerfall.systemtherapie / .strahlentherapie |
| **SenologieToOncoBoxBrustVerlauf** | Follow-up + OncoBox 2.0 FM fields (J03-J05) | Observation (FM), Condition (recurrence), Procedure (surgery/systemic/RT) | primaerfall.verlauf |
| **SenologieToOncoBoxBrustKennzahlen** | Shell entries KB-1 to KB-20 | Bundle (aggregation) | kennzahl |

### Mapping Tables

#### Centre (Report Metadata)

| OncoBox Field | FHIR Source | Note |
|---|---|---|
| OncoBox_Version | fixed: N1.1.1 | Specification version |
| Zentrum_ID | Organization.identifier (onkozert-zentrum-id) | OnkoZert identifier; fallback: IKNR |
| Zentrum_Name | Organization.name | Name of the breast centre |
| IKNR | Organization.identifier (arge-ik/iknr) | Institutional identifier |
| Standort_ID | Organization.identifier (standortnummer) | Site |
| Berichtszeitraum | Transformation parameter | Typically 01 July of previous year -- 30 June of current year |
| Meldungsdatum | Bundle.timestamp | Date/time of report generation |

#### Primary Case -- Patient + Case

| OncoBox Field | FHIR Source | Note |
|---|---|---|
| Fall_ID | Condition.id | Pseudonymised |
| Patient_Pseudonym | Patient.id | Centre-internal pseudonym |
| Primaerfallart | Condition.code (ICD-10-GM prefix) | C50=1, D05=2, Z40=7, Z42=8, D24=9 |
| Patient_Geburtsdatum | Patient.birthDate | |
| Patient_Geschlecht | Patient.gender | W/M/D/U |
| Patient_PLZ | Patient.address.postalCode | |
| Patient_Menopausenstatus | Observation (LOINC 86805-9) | 1=pre, 2=peri, 3=post |
| Fall_Typ | Encounter.class | 1=inpatient, 2=outpatient, 3=partial inpatient |
| Fall_Aufnahmedatum / Fall_Entlassungsdatum | Encounter.period | |

#### Primary Case -- Diagnosis

| OncoBox Field | FHIR Source | Note |
|---|---|---|
| Diagnose_Datum | Condition.onsetDateTime | |
| Diagnose_ICD | Condition.code (ICD-10-GM) | Code + version |
| Diagnose_Dignität | ICD-10-GM prefix | C50=1 malignant, D05=2 in situ, D24=4 benign |
| Diagnose_Seite | Condition.bodySite (SNOMED) | R/L/B |
| Diagnose_ICDO | Observation (LOINC 59847-4) | ICD-O-3 morphology |
| Diagnose_Grading | Observation (LOINC 33732-9) | G1-G4, GX |
| Bildgebung | Observation (Senologie_Bildgebung_Observation) | Method, BI-RADS, date |
| cTNM | Observation (LOINC 21908-9 + components) | cT/cN/cM/UICC |
| pTNM | Observation (LOINC 21902-2 + components) | pT/pN/pM/L/V/Pn/UICC |
| Lymphknoten | Observations (LOINC 21894-1 / 21893-3 / 92832-5 / 92833-3) | examined/involved + sentinel |
| Rezeptorstatus ER/PR/HER2 | Observations (LOINC 85337-4 / 85339-0 / 85319-2) | P/N/U |
| Diagnose_Histo_Präop | Specimen.type (SNOMED) | OncoBox 2.0: core needle=1, vacuum-assisted=2, FNA=3, open=4, none=0 |

#### Primary Case -- Surgery

| OncoBox Field | FHIR Source | Note |
|---|---|---|
| Op_Datum | Procedure.performed | |
| Op_Seite | Procedure.bodySite (SNOMED) | R/L/B |
| Op_OPS | Procedure.code.coding (OPS) | |
| Op_Art | Procedure.code (OPS prefix) | BCS (5-870)=1, simple mastectomy (5-871)=2, SSM (5-872)=3, NSM (5-883)=4, reconstruction (5-885)=6, axilla (5-402)=7, SLNB (5-401.1)=8 |
| Op_Drahtmarkierung | Senologie_OP_Planung.extension preOpMarkierung | N=0, S=1, M=2, T=3 |
| Op_Sentinel | OPS 5-401.1* | 0/1 |
| Op_Axdissektion | OPS 5-402* | 0/1 |
| Op_Schnellschnitt | Specimen.processing (SNOMED 123038009) | 0/1 |
| Op_Praeparatkontrolle | Specimen.processing.procedure (SNOMED) | Mammography=1, Ultrasound=2 |
| Op_R_Lokal / Op_R_Gesamt | Procedure.outcome (SNOMED) | R0-RX |
| Op_Revision | Procedure.reasonCode (SNOMED 282032007 / text) | OncoBox 2.0: revision surgery 0/1 |
| Op_Anzahl_bis_R0 | Procedure aggregation (CQL) | OncoBox 2.0: default 1 at R0, CQL aggregation for chain (KB-14) |
| Op_Komplikation | Senologie_Operative_Komplikation | Abbreviation + ICD |

#### Primary Case -- Therapy

| OncoBox Field | FHIR Source | Note |
|---|---|---|
| Systemtherapie | Senologie_Systemtherapie_Procedure | Type, intent, protocol, period |
| Syst_Trastuzumab | Procedure.note contains "Trastuzumab" | Flag relevant for KB-7 |
| Syst_Stellung | Procedure.extension therapiestellung | N/A/P (neo/adj/pall) |
| Endokrine_Therapie | Senologie_Systemtherapie_Procedure (endocrine) | Tamoxifen, AI, GnRH |
| Strahlentherapie | Senologie_Strahlentherapie | Start/end, target volume, intent |
| Tumorkonferenz | CarePlan (Senologie_Tumorboard) | Type: pre-therapeutic / post-operative / recurrence |
| Psychoonkologie | Procedure / Observation | performed 0/1 |
| Sozialdienst | Procedure / Observation | performed 0/1 |
| Studienteilnahme | ResearchSubject | participated 0/1 |
| Stud_Name_Code (K02) | ResearchSubject.extension[StudiennameCode] | OncoBox 2.0: study name from selection list |
| Stud_Screening (K03) | ResearchSubject.extension[Studienscreening] | OncoBox 2.0: screening for study participation 0/1 |

#### Primary Case -- Follow-up + OncoBox 2.0 FM Fields (J03-J05)

| OncoBox Field | FHIR Source | Note |
|---|---|---|
| Verlauf_Datum | Observation.effectiveDateTime (FM) / Condition.recordedDate (recurrence) | Date of follow-up event |
| Verlauf_Ereignis | Observation LOINC 21907-1 -> 3 (FM); Condition.code SNOMED -> 1/2/4 | 1=local, 2=regional, 3=distant metastasis, 4=contralateral |
| **FM_OP_Datum (J03)** | Procedure.performedDateTime (surgery, Intention=P) | Only when event=3: date of surgery for distant metastasis |
| **FM_Therapien (J04)** | Existence check of Procedure resources (Intention=P) in Bundle | Surgery/systemic/RT/endocrine: 0/1 each |
| FM_Th_OP | Procedure (senologie-operation, Intention=P) present | 0=no, 1=yes |
| FM_Th_Syst | Procedure (senologie-systemtherapie, Intention=P) present | 0=no, 1=yes |
| FM_Th_ST | Procedure (senologie-strahlentherapie, Intention=P) present | 0=no, 1=yes |
| FM_Th_Endo | Procedure (senologie-systemtherapie, endocrine, Intention=P) present | 0=no, 1=yes |
| FM_Th_Sonst | -- | Not currently derivable automatically |
| **FM_Residualstatus (J05)** | Procedure.outcome (surgery, Intention=P) | R0/R1/R2/RX |

{:.stu-note}
The OncoBox 2.0 FM fields (J03-J05) extend the follow-up block with therapy-related details for distant metastases. FM-specific Procedures are identified by palliative therapy intent (`extension:Intention` = P). The fields are only relevant when `Verlauf_Ereignis = 3` (distant metastasis).

### DKG Quality Indicators (KB-1 to KB-20)

For each quality indicator (Kennzahl), OncoBox expects a **numerator/denominator block** according to the DKG data collection form. The 20 indicators are defined in the Excel specification (`OncoBoxBrust_N1.1.1_Spec.xlsx`) as individual sheets KB-1 to KB-20, each with inclusion criteria for the denominator, fulfilment criteria for the numerator, and a target value.

| KB | Name | FHIR Data Sources | Numerator | Denominator | Target |
|---|---|---|---|---|---|
| KB-1 | Post-op. case conference (Tumorkonferenz) | CarePlan (type=postoperative) | Post-op. tumour board present | All primary cases with surgery | >=95% |
| KB-2 | Pre-therapeutic case conference | CarePlan (type=pre-therapeutic) | Pre-therapeutic tumour board present | Invasive primary cases | >=95% |
| KB-3 | Case conference recurrence/metastasis | CarePlan (type=recurrence) | Tumour board present | Recurrences + metastases | >=90% |
| KB-4 | Adjuvant chemotherapy (invasive) | Senologie_Systemtherapie (adj. chemo) | Adjuvant chemotherapy received | Indicated pT1c+N+/pT2+/high-risk | >=80% |
| KB-5 | Adjuvant chemotherapy (DCIS) | -- | No chemotherapy in DCIS | DCIS cases | >=95% |
| KB-6 | Endocrine therapy | Senologie_Systemtherapie (endocrine) | Endocrine therapy received | HR+ invasive primary cases | >=85% |
| KB-7 | Trastuzumab | Senologie_Systemtherapie (Trastuzumab) | Trastuzumab received | HER2+ primary cases pT1c+ | >=95% |
| KB-8 | First-line therapy | Senologie_Systemtherapie (palliative, first-line) | First-line initiated | Primary metastatic cases | >=80% |
| KB-9 | Psycho-oncology | Procedure/Observation (psycho-oncology) | Psycho-oncological contact | All primary cases | >=80% |
| KB-10 | Social services | Procedure/Observation (social services) | Social services contact | All primary cases | >=80% |
| KB-11 | Clinical trials | ResearchSubject | Enrolled in trial | All primary cases | >=5% |
| KB-12 | Histological confirmation | Biopsy Procedure before surgery date | Pre-op B-biopsy present | Invasive primary cases | >=90% |
| KB-13 | Case volume | -- | Primary cases + recurrences + metastases | Reporting period | >=100 primary cases |
| KB-14 | Procedures until R0 | Number of surgeries per case | <=2 procedures until R0 | All operated cases | >=90% |
| KB-15 | BCS rate pT1 | Procedure.code (OPS 5-870*) | BCS performed | pT1 primary cases | >=70% |
| KB-16 | Mastectomies | Procedure.code (OPS 5-871/872/883*) | Mastectomy | All operated cases | none |
| KB-17 | Lymph node removal | Observation (lymph nodes examined) | >=10 lymph nodes examined | Invasive pT1+ with ALND | >=95% |
| KB-18 | Wire localisation (Drahtmarkierung) | Senologie_OP_Planung.extension preOpMarkierung | Localisation performed | Non-palpable lesions | >=95% |
| KB-19 | Revision surgery | Procedure.reasonCode "Revision" | No revision | All operated cases | >=95% |
| KB-20 | Checklist | -- | Organisational | -- | -- |

#### Aggregation Model

The 20 quality indicators are not produced by a 1:1 mapping but through **aggregation of all primary cases in the reporting period**. Two implementation options:

1. **Shell mapping + evaluation layer** (this IG): The orchestrator creates one shell entry per indicator (ID + name, numerator=0, denominator=0). The numerator/denominator values are aggregated by a downstream CQL-based evaluation layer and written into the OncoBox report. See [Use Case Evaluation](anwendungsfaelle-auswertung.html) and `input/cql/`.

2. **Pre-aggregation by the centre**: The centre generates the indicator values prior to transformation (e.g. in the dashboard) and passes them as parameters or as pre-built FHIR MeasureReports. The StructureMap maps the MeasureReport values directly into the indicator block.

### Crosswalk to Other Reporting Formats

Many OncoBox data points conceptually overlap with oBDS, IQTIG, and S3 guideline quality indicators. The Senology FHIR profiles form the **shared clinical data basis**; each transformation pipeline extracts the fields required for the respective target format.

| Data Element | oBDS | IQTIG 18.1 | OncoBox N1.1.1 | S3 Guideline QI |
|---|---|---|---|---|
| Surgery date, OPS codes | Yes (Operation) | Yes (O:OPSCHLUESSEL) | Yes (Op_OPS) | -- |
| ICD-10-GM diagnosis | Yes (Diagnose) | Yes (BRUST:DIAGICD) | Yes (Diagnose_ICD) | -- |
| Histology (ICD-O-3) | Yes | Yes (O:HISTMORPH) | Yes (Diagnose_ICDO) | -- |
| pTNM / grading | Yes (pTNM) | Yes | Yes | QI5, QI6 |
| Receptor status ER/PR/HER2 | Yes (Modul_Mamma) | Yes (O:ERSTATUS etc.) | Yes (Rezeptorstatus) | QI12, QI13 |
| Residual status R0/R1/R2 | Yes (Residualstatus) | Yes (O:RSTATUSLOK/GES) | Yes (Op_R_Lokal/Gesamt) | -- |
| Lymph nodes (examined/involved) | Yes (Histologie) | Yes | Yes (Lymphknoten) | KB-17 = S3 QI on LN |
| Wire localisation (Drahtmarkierung) | -- | Yes (BRUST:DRAHT) | Yes (Op_Drahtmarkierung) | KB-18 = S3 QI7 |
| Tumour board (Tumorkonferenz) | Yes (Tumorkonferenz) | Yes (BRUST:TKPRAEOP) | Yes (Tumorkonferenz) | KB-1, KB-2 = S3 QI1, QI2 |
| Trastuzumab in HER2+ | Yes (Systemtherapie) | -- | Yes (Syst_Trastuzumab) | KB-7 = S3 QI14 |
| Adjuvant endocrine therapy | Yes (Systemtherapie) | -- | Yes (Endokrine_Therapie) | KB-6 = S3 QI15 |
| Psycho-oncology | -- | -- | Yes (Psychoonkologie) | KB-9 |
| Social services | -- | -- | Yes (Sozialdienst) | KB-10 |
| Clinical trial participation | Yes (Studie) | -- | Yes (Studienteilnahme) | KB-11 |

For fields that are also included in the IQTIG report, the OncoBox maps use the same FHIR source as `SenologieToIqtigBrust` / `SenologieToIqtigOperation`. The code translation may differ due to different target key systems (IQTIG numeric vs. OncoBox mixed).

### Code Translation

The OncoBox Breast report uses its own key systems, which are partly oriented towards oBDS and DKG conventions:

| Data Element | FHIR Coding | OncoBox Key | Translation Method |
|---|---|---|---|
| Sex | Patient.gender | W/M/D/U | Direct assignment in FML |
| Laterality | SNOMED CT | R/L/B | Direct assignment in FML |
| Primary case type | ICD-10-GM prefix | 1-9 (C50, D05, D24, Z40, Z42, ...) | Prefix-based |
| Surgery type | OPS prefix | 1-9 (BCS, simple mastectomy, SSM, NSM, reconstruction, ...) | Prefix-based |
| Residual status | SNOMED CT (122538001 etc.) | R0/R1/R2/RX | Direct assignment in FML |
| Imaging method | SNOMED CT | 1-9 (mammography, ultrasound, MRI, tomosynthesis, ...) | Direct assignment in FML |
| Therapy intent | Senologie extension | N/A/P (neo/adj/pall) | Direct assignment in FML |
| Receptor status | SNOMED CT (10828004/260385009/261665006) | P/N/U | Direct assignment in FML |

### Data Availability and Open Gaps

{:.stu-note}
Not all OncoBox mandatory fields can be derived from the Senology profiles. In particular, the indicator aggregation requires a dedicated evaluation layer. The following table shows the status per data point.

| OncoBox Data Point | Source | Status |
|---|---|---|
| Zentrum_ID, IKNR, Standort | Organization (HIS/master data) | **External source** -- not clinical |
| Berichtszeitraum | Transformation parameter | **External source** -- report-specific |
| Primary case type (fine-grained) | Derivation from ICD + follow-up | **Partial** -- OnkoZert classification (sheet "Primaerfallarten") cannot be mapped 1:1 |
| Surgery date, OPS, laterality | Senologie_Operation / _BrustOP | Available |
| ICD-10-GM, diagnosis date | Senologie_Diagnose_Maligne / _Benigne | Available |
| Histology ICD-O-3, grading | Senologie_Pathologie_Befund | Available |
| cTNM / pTNM (T/N/M + version + UICC) | MII-Onko TNM classification | Available |
| pTNM detail (y symbol, L/V/Pn) | MII-Onko TNM classification components | Available |
| pTNM size DCIS | Pathology Observation (LOINC 44648-0) | Available |
| pTNM multifocality | Observation (LOINC 44638-1, SNOMED) | Available |
| Receptor status ER/PR/HER2, Ki-67 | MII-Onko Observations | Available |
| Lymph node status (regional + sentinel) | Senologie_Pathologie_Befund | Available |
| Wire localisation (Drahtmarkierung) | Senologie_OP_Planung (extension preOpMarkierung) | Available |
| Residual status R0/R1/R2 | Senologie_Operation.outcome | Available |
| BI-RADS, imaging method | Senologie_Bildgebung_Observation / _Befund | Available |
| Pre-operative histological confirmation (biopsy type) | Procedure (biopsy OPS) | **Partial** -- KB-12 binding missing |
| Trastuzumab flag | Senologie_Systemtherapie_Procedure.note / medication | **Partial** -- currently free-text-based; binding via ATC L01FD01 recommended |
| First-line therapy at metastasis | Senologie_Systemtherapie_Procedure (intent=palliative + first) | **Partial** -- order must be derived |
| Menopausal status | Observation (Modul Mamma) | **Partial** -- Observation binding missing in Senology profiles |
| Psycho-oncology / social services | Procedure / Observation | **Partial** -- dedicated profiles not present; derivable via CarePlan or Procedure.category |
| Clinical trial participation | ResearchSubject / Senologie_Studienteilnahme | Available |
| Study name selection list (K02) | ResearchSubject.extension[StudiennameCode] | **Available** -- OncoBox 2.0 |
| Study screening (K03) | ResearchSubject.extension[Studienscreening] | **Available** -- OncoBox 2.0 |
| Verlauf_Datum / Verlauf_Ereignis | Observation (FM) / Condition (recurrence) | Available |
| FM_OP_Datum (J03) | Procedure (surgery, Intention=P) | Available |
| FM_Therapien (J04) | Procedure existence check (surgery/systemic/RT/endocrine, Intention=P) | Available |
| FM_Residualstatus (J05) | Procedure.outcome (surgery, Intention=P) | Available |
| Number of procedures until R0 (KB-14) | Aggregation of Procedures (per case) | **Aggregation step** -- CQL required |
| BCS rate for pT1 (KB-15) | Aggregation (surgery type + pTNM) | **Aggregation step** -- CQL required |
| Tumour board type (pre/post/recurrence) | CarePlan.category | **Partial** -- CodeSystem for type to be added |
| Quality indicators KB-1 to KB-20 (numerator/denominator) | Aggregation layer | **External / CQL** -- see aggregation model |

#### Recommended Actions

Analogous to the IQTIG transformation:

1. **Extend Senology profiles** -- add tumour board type as CodeSystem, add psycho-oncology/social services profiles, add Trastuzumab binding via ATC, add first-line flag to systemic therapy profile.

2. **Dedicated OncoBox aggregation layer (CQL)** -- The 20 quality indicators are expressed as CQL Measure definitions and aggregated via FHIR Measure evaluation. The results (MeasureReports) are mapped into the OncoBox indicator blocks. S3 guideline QIs and KB indicators overlap substantially -- reuse between guideline QI measures and KB measures is intended.

3. **ETL pipeline** -- Centre ID, reporting period, and administrative metadata are drawn from the OnkoZert configuration. The ETL combines FHIR primary cases + CQL MeasureReports + administrative metadata into a complete OncoBox XML report.

**Recommendation**: Combination of option 1 (clinical profile extensions), option 2 (CQL aggregation layer), and option 3 (ETL for metadata). The StructureMaps provided here cover the **primary-case-related part**; the population of quality indicator values is a separate aggregation step.

### OncoBox Specification

The transformation is based on the **OncoBox Brust Specification N1.1.1**:

- **Specification**: N1.1.1 (Excel workbook with 25+ sheets)
- **Logical Model**: [OncoBoxBrustMeldung](StructureDefinition-oncobox-brust-meldung.html) -- maps the XML structure as a FHIR StructureDefinition
- **Data fields**: Sheet "Datenfelder-XML" (91 data fields with type, code, description)
- **Structural validation**: Sheet "Strukturval." (148 validation rules)
- **Primary case types**: Sheet "Primaerfallarten" (103 rows; OnkoZert classification of case types)
- **Quality indicators**: Sheets KB-1 to KB-20 (numerator/denominator/target per indicator)
- **Official source**: [OnkoZert XML OncoBox Brustzentren](https://xml-oncobox.de/de/Zentren/BrustZentren)
- **Scope**: OncoBox Brust N1.1.1 + OncoBox 2.0 FM extension (J03-J05) -- not OncoBox Colon/Prostate/Lung

> **Note**: The OncoBox specification is regularly updated by OnkoZert/DKG. The structure reflected here corresponds to specification N1.1.1. When the specification is updated, the Logical Model and StructureMaps must be versioned accordingly. The source Excel file is located at `input/data/oncobox-brust/OncoBoxBrust_N1.1.1_Spec.xlsx`.

### Demarcation from oBDS, IRegG, and IQTIG

The four reporting formats serve different regulatory purposes and contain overlapping but non-identical data points:

| Format | Purpose | Recipient | Timing |
|---|---|---|---|
| **oBDS** | Cancer registry report | Clinical cancer registry | Per clinical event (diagnosis, therapy, follow-up, death) |
| **IRegG** | Implant registry report | BfArM / Implant Register | Per implantation procedure |
| **IQTIG 18.1** | External quality assurance (SGB V § 136) | IQTIG / G-BA | Per treatment case in breast surgery |
| **OncoBox Brust** | DKG breast centre certification | OnkoZert (DKG) | Annual, aggregated over reporting period |

The Senology FHIR profiles form the shared clinical data basis; the four transformation pipelines (StructureMaps) each extract the fields required for the target format. Where possible (e.g. TNM, receptor status, residual status, lymph nodes), the maps use identical source patterns -- with different output mappings only where target key systems differ.

### Execution

The transformation is executed analogously to the oBDS, IRegG, and IQTIG transformations via [Matchbox](https://github.com/ahdis/matchbox) as a local ETL pipeline.

**Transformation:**

```
POST http://localhost:8080/fhir/StructureMap/$transform
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "source",
      "resource": { /* FHIR Bundle mit Senologie-Ressourcen */ }
    },
    {
      "name": "source",
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust"
    }
  ]
}
```

The result is an instance of the OncoBox Logical Model. A downstream XML serialiser generates from it the OncoBox Breast XML file in format N1.1.1, which can be submitted to OnkoZert.

### Validation of Transformation Results

{:.stu-note}
The following mandatory fields are not populated by the StructureMaps and must be supplemented by the local HIS or the ETL pipeline.

| Missing Mandatory Field | Cause | To Be Supplied By |
|---|---|---|
| `zentrum.zentrumId` | Centre ID for OnkoZert | HIS / centre administration |
| `zentrum.berichtszeitraumBeginn/Ende` | Reporting period of the annual submission | ETL configuration |
| `zentrum.meldungsdatum` | Time of report generation | ETL pipeline (automatic) |
| `primaerfall.fall` | Case reference (Encounter) | HIS / case management |
| `primaerfall.diagnose.seitenlokalisation` | Laterality of diagnosis | Map extension needed (bodySite → side) |
| `primaerfall.diagnose.bildgebung.methode` | Imaging method (mammography, ultrasound, MRI) | Map extension needed (DiagnosticReport.code) |
| `primaerfall.operation.seitenlokalisation` | Laterality of surgery | Map extension needed (Procedure.bodySite) |
| `primaerfall.tumorkonferenz.typ` | Type of tumour board (pre-/post-operative) | Profile extension needed |
| `primaerfall.verlauf.vitalstatus` | Alive/deceased at time of report | Map extension needed (Patient.deceased) |
| `kennzahl.kennzahlId` | 20x indicator IDs (KB-1 to KB-20) | Map uses `id` instead of `kennzahlId` -- field name correction needed |
