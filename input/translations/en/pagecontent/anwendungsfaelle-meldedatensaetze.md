### Use Case: Reporting Datasets (Meldedatensätze)

#### Overview

A key benefit of structured FHIR documentation is the automated derivation of regulatory reports. Instead of capturing data multiple times, the clinical FHIR resources are used as a single source of truth and the reporting datasets are generated from them.

#### Reporting Obligations

Certified breast centres (Brustzentren) are subject to several mandatory reporting obligations:

| Report | Recipient | Legal Basis | Frequency |
|---|---|---|---|
| Cancer registry report (oBDS) | Clinical cancer registry (Klinisches Krebsregister) | State cancer registry laws (Landeskrebsregistergesetze) | At diagnosis, therapy, follow-up, death |
| Implant registry report (IRegG) | BfArM / Implant registry (Implantateregister) | Implant Registry Act (IRegG) | At implantation, explantation, revision |
| OncoBox Brust (N1.1.1) | OnkoZert (DKG) | DKG certification regulations | Annually |
| Quality assurance (QS 18.1 Mammachirurgie) | IQTIG / G-BA | SGB V §136 | Per case |

#### Cancer Registry Report (oBDS)

The Oncological Core Dataset (Onkologischer Basisdatensatz, oBDS) is the standard for cancer registry reports in Germany. The senology module maps all oBDS-relevant data points:

##### Mapping: FHIR Profiles → oBDS Reporting Triggers

| oBDS Reporting Trigger | FHIR Profile | Relevant Elements |
|---|---|---|
| **Diagnosis** | Senologie_Diagnose_Maligne | ICD-10-GM, date of diagnosis, laterality, diagnostic certainty, TNM |
| **Histology** | Senologie_Pathologie_Befund | Histological type (ICD-O-3 morphology), grading |
| **Surgery** | Senologie_Operation | OPS code, date of surgery, intention, residual status |
| **Radiotherapy** | Senologie_Strahlentherapie | Start/end, target volume, dose, intention |
| **Systemic therapy** | Senologie_Systemtherapie_Procedure + _Medikation | Substance, start/end, intention, protocol |
| **Follow-up** | Senologie_Diagnose_Maligne (recurrence) | Recurrence diagnosis, metastasis stage |
| **Death** | *(MII Kerndatensatz Person)* | Date of death, cause of death |

##### oBDS Compatibility

The profiles ensure oBDS compatibility through:

- Inherits from `MII_PR_Onko_Diagnose_Primaertumor` with the complete oBDS diagnosis structure
- Diagnostic certainty (Diagnosesicherung) according to the oBDS key (1–9)
- Metastasis status as a standalone CodeSystem (non-metastatic / primary metastatic / secondary metastatic)
- TNM staging via referenced MII oncology profiles
- Residual classification (R0/R1/R2) for surgical procedures

#### Implant Registry Report

The Implant Registry Act (Implantateregistergesetz, IRegG) mandates reporting upon placement, exchange, or removal of breast implants.

##### Mapping: FHIR Profiles → Implant Registry

| Reporting Data Element | FHIR Profile | Element |
|---|---|---|
| Implant type | Senologie_Implantat (Device) | `Device.type` |
| Manufacturer | Senologie_Implantat (Device) | `Device.manufacturer` |
| Article number (REF) | Senologie_Implantat (Device) | `Device.lotNumber` |
| Serial number (UDI) | Senologie_Implantat (Device) | `Device.serialNumber` |
| Date of implantation | Senologie_Operation (Procedure) | `Procedure.performed` |
| Indication | Senologie_Diagnose_Maligne (Condition) | `Condition.code` |
| Type of procedure | Senologie_Operation (Procedure) | `Procedure.code` |
| Complications | Senologie_Operative_Komplikation (Observation) | Clavien-Dindo, type |

#### DKG Quality Indicators / OncoBox Brust (OnkoZert)

The annual collection of DKG quality indicators for breast centre certification is submitted via the **OncoBox Brust XML format (specification N1.1.1)** transmitted to [OnkoZert](https://xml-oncobox.de/de/Zentren/BrustZentren). The OncoBox report covers primary case data as well as 20 aggregated quality indicators (KB-1 to KB-20). See [OncoBox Brust Transformation](meldung-oncobox.html) and [Evaluation: Quality Indicators](anwendungsfaelle-auswertung.html).

#### Architecture: Report Generation

```
FHIR Resources           Transformer             Report
      │                       │                     │
      ├── Condition ─────────►│                     │
      ├── Procedure ─────────►│  oBDS-XML ─────────►│ Cancer registry
      ├── DiagnosticReport ──►│                     │
      │                       │                     │
      ├── Device ────────────►│  IRegG format ─────►│ BfArM
      ├── Procedure ─────────►│                     │
      │                       │                     │
      ├── all profiles ──────►│  Indicators ───────►│ DKG
      │                       │                     │
```

The transformer is **not** part of this IG but is implemented as a standalone component. The IG defines the source data structure and ensures that all data points required for the reports are contained within the profiles.

#### Completeness Check

For each reporting obligation it can be verified whether the required data are complete:

| Check | Method |
|---|---|
| oBDS mandatory fields present | Profile validation (cardinality 1..1 / 1..*) |
| ICD-10-GM coded | Binding validation on the diagnosis profile |
| Diagnostic certainty specified | Required binding on the oBDS Diagnosesicherung VS |
| Implant data complete | Device profile with mandatory fields |

Missing data are detected by FHIR validation and can be supplemented before submission.

#### Technical Implementation: XML Reports and Future Outlook

Both the cancer registry (oBDS) and the implant registry (BfArM) currently still receive reports in **XML format**. The FHIR resources from this IG must therefore be transformed into the respective XML schemas.

For the transition there are two approaches:

- **Short-term**: An adapter transforms the FHIR resources into the respective XML reporting format. This adapter must be maintained whenever the reporting formats change.
- **Medium-term**: A migration of cancer and implant registries to FHIR-based reporting is likely. In that case, the transformation can be performed using open-source tooling — for example via [FHIR StructureMaps](http://hl7.org/fhir/mapping-language.html) in combination with a [Matchbox](https://github.com/ahdis/matchbox) Docker container as a local ETL pipeline. This approach is standards-compliant, transparent, and independent of proprietary software.
