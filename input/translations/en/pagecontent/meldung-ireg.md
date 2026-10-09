### IRegG Report Transformation (Breast Implants)

#### Overview

The Implant Register Act (Implantateregistergesetz, IRegG) requires healthcare facilities to report the insertion, exchange, or removal of breast implants to the German Institute for Medical Documentation and Information (Deutsches Institut für Medizinische Dokumentation und Information, DIMDI). This transformation produces **IRegG-compliant XML reports from clinical FHIR data** based on the Senologie profiles of this IG.

- **Source format**: FHIR Bundle with Senologie profiles (this IG)
- **Target format**: IRegG XML (GEMeldung), specification **V4.1.1**
- **Method**: FHIR StructureMaps (FML) with IRegG Logical Model as target structure
- **Execution**: [Matchbox](https://github.com/ahdis/matchbox) as local ETL pipeline
- **Scope**: Breast implants only — no endoprostheses, no aortic valves

#### Architecture

The transformation follows the same pattern as the [oBDS transformation](meldung-obds.html): FHIR resources are mapped via StructureMaps onto a Logical Model, which is subsequently serialised as XML.

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
│  IRegG Logical Model        │
│  (Brustimplantat-Meldung)   │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → IRegG XML (V4.1.1)      │
└─────────────────────────────┘
```

In contrast to the oBDS transformation, the IRegG report produces **a single GEMeldung per treatment episode** (rather than multiple reports per clinical event). All relevant information (patient, procedure, implant, discharge) is consolidated in one report.

#### StructureMap Overview

| StructureMap | Purpose | Source Profiles | Target (Logical Model) |
|---|---|---|---|
| **SenologieToIRegMeldung** | Orchestrator: dispatches to sub-maps | Bundle (all profiles) | IRegBrustimplantatMeldung |
| **SenologieToIRegPatient** | Patient data at admission | Patient + Observations (height, weight) | Patient admission (PAT_* + PAB_*) |
| **SenologieToIRegOperation** | Procedure data + article identification | Procedure + Device | Operation (OPE_* + OBI_*) + Article identification (ARI_* + ARB_* + ABI_*) |
| **SenologieToIRegEntlassung** | Discharge + diagnoses | Encounter + Condition | Discharge (ENT_* + DBI_*) |

#### Mapping Table: FHIR Elements to IRegG XML

##### Report Header (MEL_*)

| IRegG Field | FHIR Source | Note |
|---|---|---|
| MEL_IrdIdGesundheitseinrichtung | Organization.identifier (system: ird/ge-kennung) | IRD facility identifier |
| MEL_StandortId | Organization.identifier | Site ID |
| MEL_Bsnr | Organization.identifier (BSNR) | Practice site number (Betriebsstättennummer) |
| MEL_IrdSpezVersion | fixed: 4.1.1 | Specification version |
| MEL_SwName / SwHersteller / SwVersion | Bundle.meta / fixed | Software identification |

##### Episode (FAL_*)

| IRegG Field | FHIR Source | Note |
|---|---|---|
| FAL_Aufnahmedatum | Encounter.period.start | |
| FAL_ArtAufenthaltSchluessel | Encounter.class | IMP=1, SS=2, AMB=3 |
| FAL_Transfernummer | Encounter.identifier | 64-character pseudonymised identifier |
| FAL_DatumZeitSatzErstellung | now() | Timestamp of transformation |
| ALR_ProzedurenSchluessel | Procedure.code.coding (OPS) | Triggering OPS procedure |

##### Patient Admission (PAT_* + PAB_*)

| IRegG Field | FHIR Source | Note |
|---|---|---|
| PAT_Alter | Patient.birthDate | Calculated (today − date of birth) |
| PAT_Groesse | Observation (LOINC 8302-2) | Body height in cm |
| PAT_Gewicht | Observation (LOINC 29463-7) | Body weight in kg |
| PAT_GeschlechtSchluessel | Patient.gender | male=1, female=2, other=3 |
| PAB_AutoimmunerkrankungSchluessel | Patient.extension (ireg-autoimmunerkrankung) | enum_0122 |
| PAB_VerlaufAutoimmunerkrankungSchluessel | Patient.extension (ireg-verlauf-autoimmunerkrankung) | enum_0123 |
| PAB_GeschlechtGeburtSchluessel | Patient.extension (patient-birthsex) | enum_0170 |

##### Procedure (OPE_* + OBI_*)

| IRegG Field | FHIR Source | Note |
|---|---|---|
| OPE_Datum | Procedure.performedDateTime | |
| OPE_SeitenLokalisationSchluessel | Procedure.bodySite (SNOMED CT) | right / left / bilateral |
| OPE_AsaSchluessel | Procedure.extension (ireg-asa-klassifikation) | enum_0044 |
| OPE_ImplantattypSchluessel | fixed: 3 (breast implant) | enum_0080 |
| OBI_ArtEingriffSchluessel | Procedure.category | enum_0100 |
| OBI_GrundPrimaerEingriffSchluessel | Procedure.extension | enum_0102 |
| OBI_GrundAustauschSchluessel | Procedure.extension | enum_0104 |
| OBI_GrundRevisionExplantationSchluessel | Procedure.extension | enum_0106 |
| OBI_LageSchluessel | Procedure.extension | enum_0112 |
| OBI_ZugangSchluessel | Procedure.extension | enum_0118 |
| PBI_ProzedurenSchluessel | Procedure.code.coding (OPS) | OPS codes |

##### Article Identification (ARI_* + ARB_* + ABI_*)

| IRegG Field | FHIR Source | Note |
|---|---|---|
| ARI_Artikelkennzeichen | Device.udiCarrier.deviceIdentifier | UDI or REF |
| ARI_KennzeichenTypSchluessel | derived (UDI present?) | enum_0068 |
| ARI_ArtikelArtSchluessel | Device.status | active = implant, inactive = explant |
| ARB_LotNummer | Device.lotNumber | Batch / LOT number |
| ARB_SerienNummer | Device.serialNumber | Serial number |
| ARB_Artikelbezeichnung | Device.deviceName | Article name |
| ARB_Barcode | Device.udiCarrier.carrierHRF | Barcode |
| ABI_HerstellerSchluessel / Sonstiger | Device.manufacturer | Manufacturer |
| ABI_ArtikelTypSchluessel | Device.type | enum_0190 |
| ABI_FormSchluessel | Device.extension (ireg-implantat-form) | enum_0126 |
| ABI_OberflaecheSchluessel | Device.extension (ireg-implantat-oberflaeche) | enum_0128 |
| ABI_FüllungSchluessel | Device.extension (ireg-implantat-füllung) | enum_0124 |
| ABI_Volumen | Device.extension (ireg-implantat-volumen) | in ml |

##### Discharge (ENT_* + DBI_*)

| IRegG Field | FHIR Source | Note |
|---|---|---|
| ENT_Datum | Encounter.period.end | Discharge date |
| ENT_GrundSchluessel | Encounter.hospitalization.dischargeDisposition | 2-digit code per § 301 SGB V |
| DBI_IcdSchluessel | Condition.code.coding (ICD-10-GM) | With optional laterality suffix (:R/:L/:B) |

#### Code Translation

The IRegG report uses its own enumerations (enum_0044, enum_0050, enum_0065, etc.) rather than SNOMED CT or other standard terminologies. Translation is performed directly within the StructureMaps:

| Data element | FHIR coding | IRegG enumeration | Translation method |
|---|---|---|---|
| Sex | Patient.gender (FHIR code) | enum_0070 | Direct mapping in FML |
| Laterality | SNOMED CT (24028007/7771000/51440002) | enum_0050 | Direct mapping in FML |
| Type of stay | HL7 ActEncounterCode (IMP/SS/AMB) | enum_0065 | Direct mapping in FML |
| Type of procedure | Senologie CodeSystem | enum_0100 | CodeSystem binding |
| Implant properties | Device extensions | enum_0124/0126/0128 | CodeSystem binding |

#### Data Availability and Open Gaps

{:.stu-note}
Not all mandatory IRegG fields can be derived from the Senologie profiles. Additional data sources must be integrated to produce a complete IRegG report.

The following table shows which IRegG data originate from which source:

| IRegG Data Point | Source | Status |
|---|---|---|
| Procedure date, OPS codes, laterality | Senologie_Operation | Available |
| Implant: type, manufacturer, LOT, serial number | Senologie_Implantat | Available (basic) |
| ICD-10-GM diagnosis | Senologie_Diagnose_Maligne / _Benigne | Available |
| Implant: UDI-DI, shape, surface, fill, volume | Senologie_Implantat | **Extension required** — profile currently too sparse |
| Implant position (submuscular / subfascial etc.) | Senologie_Operation | **Extension required** — no data element in profile |
| Access route (axillary / periareolar / inframammary etc.) | Senologie_Operation | **Extension required** |
| Procedure type (primary / exchange / revision / explantation) | Senologie_Operation | **Partial** — derivable from procedure type, but not IRegG-encoded |
| Reason for implantation (carcinoma / reconstruction / cosmetic) | Senologie_Diagnose | **Partial** — derivable via reasonReference |
| ASA classification | — | **Missing** — sourced from anaesthesia record |
| Transfer number (pseudonym) | Trusted third party (Vertrauensstelle) | **External source** — not clinical; assigned by the trusted service |
| Body height, weight, age | HIS / General history | **External source** — outside Senologie scope (→ IPS/KIS) |
| Birth sex | HIS / Patient | **External source** — Patient.extension |
| Discharge date and reason | HIS / Encounter | **External source** — ISiK Encounter |
| IRegG finding codes (infection, capsular contracture, BIA-ALCL etc.) | Senologie_Operative_Komplikation | **Partial** — mapping to enum_0121 required |

##### Options for Action

Three approaches exist for the missing data:

1. **Extend Senologie profiles** — add UDI-DI, shape, surface, fill, and volume to the implant profile; add position and access route to the procedure profile. Advantage: all data capturable in a single form. Disadvantage: implant profile becomes heavily IRegG-centric.

2. **Dedicated IRegG capture form** — a separate SDC Questionnaire specifically for the IRegG report, collecting the missing fields as a post-operative supplement to the clinical documentation. Advantage: clear separation between clinical and regulatory data. Disadvantage: risk of duplicate data entry.

3. **In-house ETL pipeline** — the missing data (ASA, vital signs, discharge, transfer number) are merged from HIS, anaesthesia system, and trusted third party and combined with the Senologie data to form a complete IRegG report. Advantage: leverages existing data sources. Disadvantage: site-specific integration required.

**Recommendation**: Combination of option 1 (profile extension for clinically relevant implant data) and option 3 (ETL for administrative data). Concrete requirements should be aligned with the facility's health IT department (GB IT).

#### IRegG Specification

The transformation is based on the IRegG specification V4.1.1 (XML schema):

- **XML schema**: `GEMeldung_V4.1.1.xsd`
- **Logical Model**: [IRegBrustimplantatMeldung](StructureDefinition-ireg-brustimplantat-meldung.html) — maps the XML hierarchy as a FHIR StructureDefinition
- **Scope**: Breast implant section only (no endoprostheses, no aortic valves)

> **Note**: The IRegG specification covers three product groups: breast implants, endoprostheses, and aortic valves. This IG exclusively covers the **breast implant section**. The remaining product groups are addressed by other IGs or extensions.

#### Execution

The transformation is executed analogously to the oBDS transformation via [Matchbox](https://github.com/ahdis/matchbox) as a local ETL pipeline.

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
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToIRegMeldung"
    }
  ]
}
```

The result is an instance of the IRegG Logical Model, which can be serialised as XML and submitted to DIMDI.

#### Validation of Transformation Results

{:.stu-note}
The following mandatory fields are not populated by the StructureMaps and must be supplemented by the local HIS or ETL pipeline.

| Missing mandatory field | Cause | To be supplied by |
|---|---|---|
| `fall` | Episode reference (Encounter with admission/discharge) | HIS / case management — test Bundle contains no Encounter with an IRegG-relevant implant procedure |
| `meldung.idEinrichtung` | Facility identifier (IKNR) | HIS / facility master data |
