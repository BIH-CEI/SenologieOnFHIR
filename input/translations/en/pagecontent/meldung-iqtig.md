# IQTIG QS Transformation (QS Procedure 18.1 Mammary Surgery)

### Overview

Certified breast centres and hospitals performing mammary surgery are subject to external inpatient quality assurance under SGB V § 136. The relevant performance domain is **QS Procedure 18.1 Mammary Surgery (Mammachirurgie)** of the IQTIG (Institut für Qualitätssicherung und Transparenz im Gesundheitswesen). This transformation generates **IQTIG-compliant QS datasets from clinical FHIR data** based on the Senology profiles of this IG.

- **Source format**: FHIR Bundle with Senology profiles (this IG)
- **Target format**: IQTIG QS dataset 18.1 Mammary Surgery, **Specification 2024 V05**
- **Method**: FHIR StructureMaps (FML) with the IQTIG Logical Model as the target structure
- **Execution**: [Matchbox](https://github.com/ahdis/matchbox) as a local ETL pipeline
- **Scope**: **QS Procedure 18.1 Mammary Surgery only** -- not 18.2 (Ovary), not further IQTIG performance domains

### Architecture

The transformation follows the same pattern as the [oBDS](meldung-obds.html) and [IRegG transformation](meldung-ireg.html): FHIR resources are mapped via StructureMaps onto a Logical Model, which can then be serialised (CSV/XML according to the IQTIG data validation programme).

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
│  IQTIG Logical Model        │
│  (IQTIG_MaChi_181)          │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → IQTIG QS-Datensatz       │
│    (CSV/XML 2024 V05)       │
└─────────────────────────────┘
```

The IQTIG dataset consists of three partial datasets (Teildatensätze):

- **Partial dataset Base (B)** -- administrative and demographic case data
- **Partial dataset Breast (BRUST)** -- breast-specific diagnostic and findings data (one entry per treated side)
- **Partial dataset Surgery (O)** -- surgical data, histology, R-status (one entry per procedure)

### StructureMap Overview

| StructureMap | Purpose | Source Profiles | Target (Logical Model) |
|---|---|---|---|
| **SenologieToIqtigMammachirurgie181** | Orchestrator: dispatches to sub-maps | Bundle (all profiles) | IQTIGMammachirurgie181 |
| **SenologieToIqtigBasis** | Patient + Encounter + Organization | Patient, Encounter, Organization | teildatensatzBasis (B:*) |
| **SenologieToIqtigBrust** | Diagnosis + imaging + pre-operative findings | Condition, Observation, ServiceRequest | teildatensatzBrust (BRUST:*) |
| **SenologieToIqtigOperation** | Surgery + specimen + pathology | Procedure, Specimen, Observation | teildatensatzOperation (O:*) |

### Mapping Tables

#### Partial Dataset Base (B)

| IQTIG Field | FHIR Source | Note |
|---|---|---|
| B:IKNRKH | Organization.identifier (arge-ik/iknr) | Institution identifier, 9 digits |
| B:ENTLSTANDORT | Organization.identifier (standortnummer) | Site identifier |
| B:BSNR | Organization.identifier (kbv/bsnr) | Practice site number (outpatient) |
| B:VERSICHERTENIDNEU | Patient.identifier (gkv/kvid-10) | Insured person ID (pseudonymised) |
| B:VORGANGSNR | Encounter.identifier | Case / transaction number |
| B:DS_VERSION | fixed: 18.1_2024_V05 | Dataset version |
| B:GEBDATUM | Patient.birthDate | Date of birth |
| B:GESCHLECHT | Patient.gender | male=1, female=2, other=8, unknown=9 |
| B:PLZ | Patient.address.postalCode | Postal code |
| B:AUFNDATUM | Encounter.period.start | Admission date |
| B:ENTLDATUM | Encounter.period.end | Discharge date |
| B:AUFNGRUND | Encounter.extension (Aufnahmegrund) | § 301 SGB V (4-digit) |
| B:AUFNANLASS | Encounter.extension (ISiKAufnahmeanlass) | Referral, emergency, transfer |
| B:ENTLGRUND | Encounter.hospitalization.dischargeDisposition | § 301 SGB V |

#### Partial Dataset Breast (BRUST)

| IQTIG Field | FHIR Source | Note |
|---|---|---|
| BRUST:LNRBRUST | Senologie_Diagnose (sequence) | Sequential number 1..n |
| BRUST:SEITE | Condition.bodySite (SNOMED) | R=right, L=left, B=bilateral |
| BRUST:INDIKATION | Condition.code (ICD-10-GM) | C50.* =1 malignant, D05.* =2 DCIS, D24.* =3 benign, Z40.* =4 risk reduction, Z42.* =5 reconstruction |
| BRUST:DIAGICD | Condition.code.coding (ICD-10-GM) | Code + version |
| BRUST:DIAGDATUM | Condition.onsetDateTime | Diagnosis date |
| BRUST:TGROESSEKLIN | Observation (LOINC 44648-0) | Clinical tumour size in mm |
| BRUST:CT / CN / CM | Observations (LOINC 21905-5 / 21906-3 / 21907-1) | Clinical cTNM |
| BRUST:UICCKLIN | Observation (LOINC 21902-2) | Clinical UICC stage |
| BRUST:BILDGMETHODE | Senologie_Bildgebung.method (SNOMED) | Mammography=1, Ultrasound=2, MRI=3, Tomosynthesis=4 |
| BRUST:BIRADS | Observation (LOINC 72133-2) | BI-RADS 0–6 |
| BRUST:BEFUND | Senologie_Pathologie_Befund (B1–B5) | Pre-operative B-code |
| BRUST:HISTPRAEOP | Procedure (biopsy OPS) | Pre-operative histological confirmation |
| BRUST:DRAHT | Senologie_OP_Planung (preOpMarkierung) | M/S/T/N -> 1/2/3/0 |
| BRUST:NEOADJ | Senologie_Systemtherapie_Procedure (stellungOP=N) | Neoadjuvant therapy received |
| BRUST:TKPRAEOP | Senologie_Tumorboard_Empfehlung (type pre-therapeutic) | Pre-therapeutic tumour board (Tumorkonferenz) |

#### Partial Dataset Surgery (O)

| IQTIG Field | FHIR Source | Note |
|---|---|---|
| O:LNROP | Procedure (sequence) | Sequential surgery number |
| O:LNRBRUST | Procedure -> Condition (reasonReference) | Assignment to breast partial dataset |
| O:OPDATUM | Procedure.performedDateTime | Date of surgery |
| O:SEITE | Procedure.bodySite (SNOMED) | R/L/B |
| O:OPSCHLUESSEL | Procedure.code.coding (OPS) | OPS codes + version |
| O:OPART | Procedure.category or OPS derivation | BCS=1, simple mastectomy=2, SSM=3, NSM=4, revision=5, reconstruction=6 |
| O:DIGNITAET | Observation (frozen section, LOINC 22748-9) | malignant=1, benign=2, unclear=3 |
| O:SCHNELLSCHNITT | Specimen.processing (SNOMED 123038009) | 0/1 |
| O:PRAEPKONTROLLE | Specimen.processing.procedure (SNOMED) | QI-3: Mammography=1, Ultrasound=2 |
| O:HISTMORPH | Observation (LOINC 59847-4, ICD-O-3) | Morphology code + version |
| O:GRADING | Observation (LOINC 33732-9) | G1–G4, GX |
| O:TGROESSEINV | Observation (LOINC 33728-7) | Invasive size in mm |
| O:TGROESSEDCIS | Observation (LOINC 44648-0) | DCIS size in mm |
| O:MULTIFOK | Observation (LOINC 44638-1) | 0=no, 1=multifocal, 2=multicentric |
| O:PT / O:PN / O:PM | Observations (LOINC 21899-0 / 21900-6 / 21901-4) | Pathological pTNM |
| O:UICCPATHO | Observation (LOINC 21902-2, postop) | Pathological UICC stage |
| O:RSTATUSLOK / O:RSTATUSGES | Procedure.outcome (SNOMED R0–RX) | Residual tumour status |
| O:SENTINEL | Procedure.code (OPS 5-401.1*) | 0/1 |
| O:AXDISSEKTION | Procedure.code (OPS 5-402*) | 0/1 |
| O:LKUNTERSUCHT / LKBEFALLEN | Observations (LOINC 21894-1 / 21893-3) | Lymph nodes |
| O:SLKUNTERSUCHT / SLKBEFALLEN | Observations (LOINC 92832-5 / 92833-3) | Sentinel lymph nodes |
| O:ERSTATUS / PRSTATUS / HER2STATUS | MII-Onko-Observations (LOINC 85337-4 / 85339-0 / 85319-2) | P/N/U |
| O:KOMPL | Senologie_Operative_Komplikation | Abbreviation + ICD |
| O:REVISION | Procedure (revision type or sequence) | 0/1 |

### Code Translation

IQTIG datasets use their own key lists (numeric codes, letter abbreviations). Translation is performed within the StructureMaps:

| Data Element | FHIR Coding | IQTIG Key | Translation Method |
|---|---|---|---|
| Sex | Patient.gender | 1/2/8/9 | Direct assignment in FML |
| Laterality | SNOMED CT (24028007/7771000/51440002) | R/L/B | Direct assignment in FML |
| Indication | ICD-10-GM prefix (C50/D05/D24/Z40/Z42) | 1/2/3/4/5 | Prefix-based derivation |
| Type of surgery | OPS prefix (5-870/871/872/883/885) | 1/2/3/4/6 | Prefix-based derivation |
| ER/PR/HER2 status | SNOMED (10828004/260385009/261665006) | P/N/U | Identical to oBDS mapping |
| Residual tumour status | SNOMED (122538001 etc.) | R0/R1/R2/RX | Direct assignment in FML |
| Imaging modality | SNOMED (71651007/16310003/113091000) | 1/2/3/4 | Direct assignment in FML |

### Data Availability and Open Gaps

{:.stu-note}
Not all IQTIG mandatory fields can be derived from the Senology profiles. For a complete QS report, additional data sources must be integrated (HIS, administration, trust centre (Vertrauensstelle)).

| IQTIG Data Point | Source | Status |
|---|---|---|
| Surgery date, OPS codes, laterality | Senologie_Operation / _BrustOP | Available |
| ICD-10-GM diagnosis + date | Senologie_Diagnose_Maligne / _Benigne | Available |
| Histology (ICD-O-3), grading | Senologie_Pathologie_Befund | Available |
| Tumour size invasive / DCIS | Senologie_Pathologie_Befund (LOINC 33728-7) | Available |
| Residual tumour status R0/R1/R2 | Senologie_Operation.outcome | Available |
| Lymph node status (regional + sentinel) | Senologie_Pathologie_Befund | Available |
| Receptor status ER/PR/HER2 | MII-Onko-Observations | Available |
| Pre-operative wire localisation (Drahtmarkierung) | Senologie_OP_Planung (Extension preOpMarkierung) | Available |
| Intraoperative specimen radiography (QI-3) | Specimen.processing | Available |
| BI-RADS / imaging modality | Senologie_Bildgebung_Observation / _Befund | Available |
| Pre-operative B classification (B1–B5) | Senologie_Pathologie_Befund | **Partial** -- dedicated CodeSystem not yet finalised |
| Multifocality / multicentricity | Pathology findings | **Partial** -- currently free-text; requires coded Observation |
| Neoadjuvant therapy (yes/no) | Senologie_Systemtherapie_Procedure (stellungOP=N) | **Partial** -- derivable, but IQTIG binding missing |
| Pre-therapeutic tumour board (Tumorkonferenz) | Senologie_Tumorboard_Empfehlung | **Partial** -- type=pre-therapeutic must be coded |
| IKNR, site identifier, BSNR | Organization (HIS/master data) | **External source** -- not clinical |
| Admission reason / type (§ 301) | Encounter (HIS/ISiK) | **External source** -- ISiK extension |
| Discharge reason (§ 301) | Encounter.hospitalization.dischargeDisposition | **External source** -- ISiK |
| Consent trust centre / G-BA | Consent / HIS | **External source** -- administrative capture |
| Insured person ID (pseudonymised) | Patient.identifier (kvid-10) | **External source** -- pseudonymisation by trust centre (Vertrauensstelle) |
| Revision surgery during same admission | Procedure (sequence + type) | **Partial** -- derivable from surgery sequence |
| Perioperative complications with IQTIG abbreviation | Senologie_Operative_Komplikation | **Partial** -- IQTIG abbreviation binding still to be added |

#### Options for Action

Analogous to the IRegG transformation:

1. **Extend Senology profiles** -- B classification as a dedicated CodeSystem, multifocality as a coded Observation, neoadjuvant flag on the Procedure profile.

2. **Dedicated IQTIG capture form (SDC Questionnaire)** -- Administrative fields (admission type, consent, § 301 codes) are captured via a QS-specific questionnaire and supplement the clinical documentation.

3. **ETL pipeline** -- IKNR, site identifier, case identifiers, § 301 codes, and pseudonymised insured person ID are retrieved from the HIS and trust centre (Vertrauensstelle) and combined with the Senology data to produce a complete QS report.

**Recommendation**: Combination of option 1 (clinical profile extensions) and option 3 (ETL for administrative data). The QS dataset 18.1 contains a higher proportion of mandatory administrative fields than the oBDS; ETL integration is therefore particularly important here.

### IQTIG Specification

The transformation is based on the **IQTIG completion notes for QS Procedure 18.1 Mammary Surgery**:

- **Specification**: 2024 V05 (reporting year 2024)
- **Logical Model**: [IQTIGMammachirurgie181](StructureDefinition-iqtig-mammachirurgie-181.html) -- maps the partial dataset structure as a FHIR StructureDefinition
- **Official source**: [iqtig.org/downloads/erfassung/2024/v05/181/Ausfüllhinweise_18_1.html](https://iqtig.org/downloads/erfassung/2024/v05/181/Ausfüllhinweise_18_1.html)
- **Scope**: Performance domain 18.1 Mammary Surgery only (not 18.2 ovarian carcinoma, not further IQTIG domains)

> **Note**: The IQTIG specification is updated annually. The structure shown here corresponds to specification 2024 V05. When the specification is updated, the Logical Model and StructureMaps must be versioned accordingly.

### Distinction from oBDS and IRegG

The three reporting formats serve different regulatory purposes and contain overlapping but non-identical data points:

| Format | Purpose | Recipient | Timing |
|---|---|---|---|
| **oBDS** | Cancer registry report | Clinical cancer registry | Per clinical event (diagnosis, therapy, follow-up, death) |
| **IRegG** | Implant registry report | BfArM / Implant Registry | Per implantation procedure |
| **IQTIG 18.1** | External quality assurance (SGB V § 136) | IQTIG / G-BA | Per mammary surgery treatment case |

The Senology FHIR profiles form the shared clinical data foundation; the three transformation pipelines (StructureMaps) each extract the fields required for their respective target format.

### Execution

The transformation is executed analogously to the oBDS and IRegG transformation via [Matchbox](https://github.com/ahdis/matchbox) as a local ETL pipeline.

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
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181"
    }
  ]
}
```

The result is an instance of the IQTIG Logical Model, which can be exported via the IQTIG data validation programme (DPP) into the official QS format (CSV/XML) and transmitted to the federal evaluation body (IQTIG).

### Validation of Transformation Results

{:.stu-note}
The following mandatory fields are not populated by the StructureMaps and must be supplemented by the local HIS or the ETL pipeline.

| Missing Mandatory Field | Cause | To Be Supplied By |
|---|---|---|
| `teildatensatzBasis.institutionskennzeichen` | Institution identifier (IKNR) | HIS / institution master data |
| `teildatensatzBasis.pseudonymId` | Pseudonymised patient ID | Pseudonymisation service |
| `teildatensatzBasis.fallId` | Case identifier | HIS / case management |
| `teildatensatzBasis.aufnahmedatum` | Admission date of the case | HIS (Encounter.period.start) |
| `teildatensatzBasis.entlassungsdatum` | Discharge date | HIS (Encounter.period.end) |
| `teildatensatzBrust.seitenlokalisation` | Side of the disease | Map extension required (Condition.bodySite) |
| `teildatensatzOperation.seitenlokalisation` | Surgical side | Map extension required (Procedure.bodySite) |
| `teildatensatzOperation.operationsart` | Classification of surgery type | Map extension required (Procedure.category) |
