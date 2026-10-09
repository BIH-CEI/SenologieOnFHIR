### oBDS Reporting Transformation

#### Overview

Cancer registry reporting under the Oncological Core Dataset (Onkologischer Basisdatensatz, oBDS) is a mandatory obligation for certified breast centres. The goal of this transformation is the **automatic derivation of oBDS-compliant XML reports from clinical FHIR data** based on the Senologie profiles of this IG.

- **Source format**: FHIR Bundle with Senologie profiles (this IG)
- **Target format**: oBDS XML, schema version **v3.0.5**
- **Method**: FHIR StructureMaps (FML) with oBDS Logical Model as target structure
- **Execution**: [Matchbox](https://github.com/ahdis/matchbox) as local ETL pipeline

#### Architecture

The transformation proceeds in several steps: the clinical FHIR resources are mapped via StructureMaps (FHIR Mapping Language) onto an oBDS Logical Model. Matchbox then serialises the Logical Model as oBDS-compliant XML.

```
┌─────────────────────────────┐
│  FHIR Bundle                │
│  (Senologie-Profile)        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  StructureMap (FML)         │
│  pro Meldungstyp            │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  oBDS Logical Model         │
│  (FHIR StructureDefinition) │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → oBDS XML (v3.0.5)       │
└─────────────────────────────┘
```

#### Mapping Overview per Report Type

Each oBDS report corresponds to a clinical event (diagnosis, therapy, follow-up, death). The table below shows the assignment of Senologie FHIR profiles to oBDS report types and their associated StructureMaps.

| Report type | FHIR profile(s) | oBDS element | StructureMap |
|---|---|---|---|
| **Diagnosis** | Senologie_Diagnose_Maligne + Observations (TNM, receptor status) | `<Diagnose>` + `<cTNM>` + `<Modul_Mamma>` | `SenologieToObdsDiagnose` |
| **Surgery** | Senologie_Operation + Specimen (pathology) | `<OP>` + `<TNM>` (pTNM) + `<Residualstatus>` | `SenologieToObdsOP` |
| **Systemic therapy** | Senologie_Systemtherapie_Procedure + _Medikation | `<SYST>` + `<Menge_Substanz>` | `SenologieToObdsSYST` |
| **Radiotherapy** | Senologie_Strahlentherapie | `<ST>` + `<Menge_Bestrahlung>` | `SenologieToObdsST` |
| **Tumour board** (Tumorkonferenz) | Senologie_Tumorboard_Empfehlung | `<Tumorkonferenz>` + `<Therapieempfehlung>` | `SenologieToObdsTumorkonferenz` |
| **Follow-up** | Senologie_Diagnose_Maligne (recurrence) + Observations | `<Verlauf>` + `<Menge_FM>` + `<TNM>` | `SenologieToObdsVerlauf` |
| **Death** | Patient (deceased) + Condition (cause of death) | `<Tod>` + `<Menge_Todesursachen>` | `SenologieToObdsTod` |

Each report type is covered by a dedicated StructureMap. The tumour assignment (`<Tumorzuordnung>`) — comprising ICD-10-GM code, diagnosis date, laterality, and ICD-O-3 morphology — is common to all report types and is derived from `Senologie_Diagnose_Maligne`.

#### Mamma Module

The oBDS includes a breast-specific module (`<Modul_Mamma>`) that is transmitted with diagnosis and follow-up reports. The following fields are derived from the Senologie Observations:

| oBDS field | Values | FHIR source |
|---|---|---|
| `HormonrezeptorStatus_Östrogen` | P / N / U | Observation (oestrogen receptor status) |
| `HormonrezeptorStatus_Progesteron` | P / N / U | Observation (progesterone receptor status) |
| `Her2neuStatus` | P / N / U | Observation (HER2 status) |
| `PräoperativeMarkierung` | *(coding per oBDS)* | Senologie_Operation (Extension) |
| `Operationstyp` | *(coding per oBDS)* | Senologie_Operation (`Procedure.code`) |

The values P (positive), N (negative), and U (unknown) correspond to the oBDS key and are translated from coded FHIR Observations with SNOMED CT coding.

#### Code Translation

The Senologie profiles use SNOMED CT as their primary coding system. The oBDS expects its own keys and coding systems. Translation is performed via ConceptMaps; the MII Oncology profiles already provide many of the relevant ConceptMaps.

| Data element | Direction | Source → Target |
|---|---|---|
| Laterality (Seitenlokalisation) | SNOMED CT → oBDS | `L` / `R` / `B` / `T` |
| Intent (Intention) | SNOMED CT → oBDS | `K` / `P` / `S` / `D` / `X` |
| Grading | SNOMED CT → oBDS | `1` / `2` / `3` / `4` / `X` / `L` / `M` / `H` / `B` / `U` |
| Residual status | SNOMED CT → oBDS | `R0` / `R1` / `R2` / `RX` |
| Therapy type (SYST) | SNOMED CT → oBDS | `CH` / `HO` / `IM` / `ZS` / `CI` |
| Surgery relation (Stellung OP) | SNOMED CT → oBDS | `O` / `A` / `N` / `I` / `S` |
| Medication (substance) | SNOMED CT → ATC / ASK | [CM SCT→ATC](ConceptMap-CM-Senologie-Medikation-SCT-ATC.html), [CM SCT→ASK](ConceptMap-CM-Senologie-Medikation-SCT-ASK.html) |

ConceptMaps for medication translation are already provided in this IG (see [Terminology: Medication](terminologie-medikation.html)). The remaining translations use ConceptMaps from the [MII Oncology Module](https://simplifier.net/medizininformatikinitiative-modulonkologie).

#### Data Availability and Open Gaps

{:.stu-note}
Not all mandatory oBDS fields can be fully derived from the Senologie profiles. Additional data sources must be integrated for a complete cancer registry report.

| oBDS data point | Source | Status |
|---|---|---|
| ICD-10-GM, diagnosis date, laterality | Senologie_Diagnose_Maligne | Available |
| ICD-O-3 morphology + version | Senologie_Pathologie_Befund | Available |
| Diagnostic certainty (oBDS 1–9) | Senologie_Diagnose_Maligne (verificationStatus) | Available |
| Grading (G1–G4) | Senologie_Pathologie_Befund | Available |
| TNM classification (c/p, UICC) | MII Onco TNM profiles (via references) | Available |
| OPS codes, surgery date, intent | Senologie_Operation | Available |
| Residual status (R0/R1/R2) | Senologie_Operation (outcome) | Available |
| Lymph nodes examined/involved | Senologie_Pathologie_Befund | Available |
| Systemic therapy: substance, start/end, intent | Senologie_Systemtherapie_Procedure + _Medikation | Available |
| Radiotherapy: dose, target volume, application type | Senologie_Strahlentherapie | Available |
| Tumour board: date, type, recommendations | Senologie_Tumorboard_Empfehlung | Available |
| Mamma module: ER/PR/HER2 | Senologie_Pathologie_Befund | Available |
| Mamma module: menopausal status (Menopausenstatus) | MII Onco (`mii-pr-onko-mamma-menopause-status`) | Available — SNOMED 309606002/309608001/309607006 → oBDS 1/3/U |
| Mamma module: pre-operative wire localisation (Präoperative Drahtmarkierung) (M/S/T/N/U) | Senologie_OP_Planung (`extension[preOpMarkierung]`) | Available — ServiceRequest extension, coding M/S/T/N/U |
| Mamma module: intraoperative specimen check (QI-3) | Specimen.processing.procedure | Available — indicator for QI-3 "specimen check after wire localisation" |
| Mamma module: TumorgrößeInvasiv / TumorgrößeDCIS | Senologie_Pathologie_Befund (LOINC 33728-7) | Available — structured tumour size in mm |
| Topography ICD-O (C50.x) | Senologie_Tumorlokalisation (BodyStructure.locationQualifier[quadrant]) | **Available** — quadrant → C50.0–C50.9 via [ConceptMap](ConceptMap-cm-sct-to-icdo3-mamma-topographie.html), laterality separately from locationQualifier[seitenlokalisation] |
| Gene expression tests (Oncotype DX, MammaPrint) → Menge_Weitere_Klassifikation | Senologie_Genexpressionstest (RiskAssessment) | Available — exported as `<Weitere_Klassifikation>` with name + stage/score |
| Prior malignancies (Frühere Tumorerkrankungen) | MII Onco (`mii-pr-onko-frühere-tumorerkrankung`) | **Partially mappable** — MII profile available, but not currently used as Senologie test data; data in breast centres is usually anamnestic → see OF-13 |
| General performance status (ECOG) | MII Onco (`mii-pr-onko-allgemeiner-leistungszustand-ecog`) | **Available** — MII Onco profile, no dedicated Senologie profile required. Test data: cases 1, 2, 9 (follow-up) |
| Sender/reporter data (IKNR, physician, address, banking details) | HIS / administration | **External source** — administrative data |
| Reporting rationale, own service | HIS / administration | **External source** |
| Date of death, cause of death | HIS / registry office | **External source** |
| Systemic therapy adverse events (CTCAE grade) | MII Onco (`mii-pr-onko-nebenwirkung-adverse-event`) | **Available** — AdverseEvent with CTCAE type, grade, and causative reference |
| Radiotherapy adverse events (CTCAE) | MII Onco (`mii-pr-onko-nebenwirkung-adverse-event`) | **Available** — same profile, suspectEntity references the RT Procedure |
| Adverse event type: MedDRA code (alternative to free text) | MII Onco AdverseEvent | **Available in LM** — not yet implemented in StructureMap |
| Social work contact (Modul_Allgemein) | MII Onco (`mii-pr-onko-mamma-sozialdienst`) | **Partially mappable** — MII profile exists, but not documented in Senologie scope → see OF-14 |
| Structured ycTNM / ypTNM for neoadjuvant therapy (cases 4, 5, 7) | MII Onco TNM profiles | **Gap in test data** — currently narrative only in Procedure.outcome.text; requires TNM Observations with y-prefix |

##### Options for Action

1. **CTCAE adverse events** — Mappable via the existing MII Onco profile `mii-pr-onko-nebenwirkung-adverse-event` (AdverseEvent). CTCAE type, grade, and CTCAE version are defined as Must Support elements. The `suspectEntity` reference links the adverse event to the causative therapy. No dedicated Senologie profile required.

2. **ICD-O topography** — Derived from the BodyStructure (tumour localisation): SNOMED quadrant → ICD-O-3 C50.x via ConceptMap. Laterality is handled separately. The [ConceptMap SNOMED → ICD-O-3](ConceptMap-cm-sct-to-icdo3-mamma-topographie.html) covers all 7 quadrants with a fallback to C50.9.

3. **ECOG performance status** — Mappable via the existing MII Onco profile (`mii-pr-onko-allgemeiner-leistungszustand-ecog`). Must be documented at the breast centre at diagnosis and during follow-up and supplied as an Observation in the Bundle. Test data for follow-up ECOG are available for cases 1, 2, and 9.

4. **Breast-specific module fields (QI-3, wire localisation, tumour size)** — The fields `PräopDrahtmarkierung`, `IntraopPraeparatkontrolle` (QI-3), `TumorgroesseInvasiv`, and `TumorgroesseDCIS` are included in the Logical Model. Wire localisation is taken from the surgical planning (ServiceRequest extension `preOpMarkierung`); the QI-3 specimen check from `Specimen.processing.procedure`; tumour size from pathology (LOINC 33728-7).

5. **Gene expression tests** — Oncotype DX, MammaPrint, Prosigna, etc. are exported as `<Weitere_Klassifikation>` (oBDS `Menge_Weitere_Klassifikation`). Mapping from `Senologie_Genexpressionstest` (RiskAssessment): `method.coding.display` → name, `occurrenceDateTime` → date, `prediction.qualitativeRisk` → stage.

6. **Administrative data via ETL** — Sender, reporter, banking details, and reporting rationale originate from the hospital information system (HIS) or the hospital administration and are added in the ETL pipeline, in coordination with the IT department.

**Recommendation**: The remaining gaps (test data for ycTNM/ypTNM, prior malignancies, social work contact) are conceptually resolved but require supplementary test data and/or a decision during balloting (see OF-13, OF-14).

#### Test Data Reference

The test dataset of the [Plattform §65c](https://plattform65c.atlassian.net/wiki/spaces/UMK/pages/189530203) (test patient Mamma) serves as the reference for the oBDS structure.

**Test patient**: Michaela Musterfrau, born 15 October 1950

- **Diagnosis**: C50.4 right breast (upper outer quadrant), invasive ductal carcinoma (ICD-O-3: 8500/3), grading G2
- **Staging**: cT1c cN0 cM0, UICC IA
- **Therapy**: 2 surgeries (sentinel lymph node excision + axillary dissection), chemotherapy (cisplatin), hormone therapy (anastrozole), radiotherapy (58.8 Gy)
- **Follow-up**: recurrence with distant metastases (liver, lung), rT1c rN1 rM1, UICC IV
- **Death**: 27 November 2021, tumour-related

The test dataset comprises **10 reports** (1 diagnosis, 2 surgeries, 2 systemic therapies, 1 radiotherapy, 2 tumour board meetings, 1 follow-up, 1 death) and thereby covers all relevant report types.

> **Note**: The test data use oBDS schema v3.0.1. The target version of this transformation is v3.0.5. Differences between the versions (in particular new mandatory fields and extended modules) must be taken into account during StructureMap development.

#### Execution

The transformation is executed via a [Matchbox](https://github.com/ahdis/matchbox) Docker container as a local ETL pipeline.

**Setup:**

```bash
docker run -d -p 8080:8080 eu.gcr.io/fhir-ch/matchbox:latest
```

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
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToObdsDiagnose"
    }
  ]
}
```

The result is an instance of the oBDS Logical Model, which can be serialised as XML and submitted to the cancer registry.

**Outlook**: In the long term, a migration of cancer registries to FHIR-based reporting is likely. The StructureMap-based architecture enables a smooth transition: once cancer registries accept FHIR Bundles, the XML serialisation step becomes obsolete and the transformation reduces to a profile mapping.

#### Validation of Transformation Results

The transformation was tested with Matchbox `$transform` against the Case-1 Bundle (Erika Neumann). The output was subsequently validated against the oBDS Logical Model.

{:.stu-note}
The following mandatory fields of the oBDS Logical Model are **not** populated by the StructureMaps and must be supplemented by the local HIS or ETL pipeline. This applies in particular to administrative data and fields that are not currently documented in structured form at the breast centre.

| Missing mandatory field | Reason | To be supplied by |
|---|---|---|
| `melderID` | Administrative reporter identification (IKNR, BSNR) | HIS / ETL pipeline |
| `tumorzuordnung.tumorID` | Unique tumour ID within the reporting registry | HIS / cancer registry software |
| `st.intention` | Intent of radiotherapy (curative/palliative) | Currently not documented in structured form at the breast centre |
| `st.stellungOP` | Relation of radiotherapy to surgery (neoadjuvant/adjuvant) | Currently not documented in structured form at the breast centre |
| `st.nebenwirkungen` | CTCAE adverse events of radiotherapy | Currently not documented in structured form at the breast centre |
| `tumorkonferenz.typ` | Type of tumour board meeting (pre-/post-operative) | Map extension required — field is present in MII Onco tumour board (CarePlan.category) and must be read in the StructureMap |

**Successfully populated fields** (selection):
- Tumour assignment: ICD-10-GM C50.4, diagnosis date
- Diagnosis: free text, diagnostic certainty, ECOG performance status (0), gene expression test (Oncotype DX)
- Surgery: intent (K), date, OPS codes (5-870.a1, 5-401.11), residual status R0
- Radiotherapy: start/end, application type, target volume
- Tumour board: date, therapy recommendations (SNOMED codes)
