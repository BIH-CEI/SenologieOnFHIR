# Home - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ImplementationGuide/kds-senologie | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:SenologieKDS |

### Core Dataset Senology (Kerndatensatz Senologie)

The **Core Dataset Senology** defines FHIR profiles for the structured documentation of breast cancer care at certified breast centres (Brustzentren) and beyond. It covers the entire care pathway from initial presentation through diagnostics, treatment, and follow-up to longitudinal documentation.

![](dgs-logo.png)

### Who is this IG for?

| | | |
| :--- | :--- | :--- |
| **Clinicians** | Which data are captured, which terminologies are used | [Data Model](datenmodell.md),[Test Patients](testpatientinnen.md) |
| **IT / Developers** | FHIR profiles, questionnaires, extraction, technical interfaces | [Profiles](profilbeschreibungen.md),[Artifacts](artifacts.md) |
| **Quality Assurance** | Derivation of reporting datasets (oBDS, IQTIG, OncoBox, IRegG) | [Use Cases](anwendungsfaelle-uebersicht.md) |
| **Researchers** | Secondary use, terminologies, interoperability | [Terminology](terminologie-uebersicht.md),[Data Model](datenmodell.md) |

### Care Pathway (Versorgungspfad)

The dataset maps the clinical workflow of senology across the following domains:

| | | |
| :--- | :--- | :--- |
| **Diagnosis** | Initial diagnosis, recurrence, staging (cTNM), laterality | [Diagnosis](StructureDefinition-senologie-diagnose-maligne.md) |
| **Diagnostics** | Imaging (mammography, ultrasound, MRI), pathology, biomarkers | [Imaging](StructureDefinition-senologie-bildgebung-befund.md),[Pathology](StructureDefinition-senologie-pathologie-befund.md) |
| **Therapy** | Surgery, systemic therapy, radiotherapy | [Surgery](StructureDefinition-senologie-operation.md),[Systemic Therapy](StructureDefinition-senologie-systemtherapie-procedure.md) |
| **Tumour Board (Tumorkonferenz)** | Treatment recommendations, clinical disciplines | [Tumour Board](StructureDefinition-senologie-tumorboard-empfehlung.md) |
| **Follow-up (Nachsorge)** | Disease course, vital status, recurrence monitoring | [Follow-Up](StructureDefinition-senologie-follow-up.md) |

The detailed FHIR resource model is available under [Data Model](datenmodell.md).

### Objectives

1. **Standardised capture**of clinical data along the breast cancer (Mammakarzinom) care pathway
1. **Interoperable data exchange**between clinical systems, cancer registries, and research databases based on HL7 FHIR
1. **Secondary use**of care data for quality assurance, health services research, and clinical trials

### Classification

The Core Dataset uses existing MII Core Dataset profiles as its technical foundation, but is an independent dataset — not an MII module. Technical implementation is carried out by the **Berlin Institute of Health at Charité (BIH)**; content alignment is coordinated with the **[Deutsche Gesellschaft für Senologie (DGS)](https://www.senologie.org/)**, the **[Deutsche Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)](https://www.dggg.de/)**, and the **[Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)](https://www.ago-online.de/)**.

### Design Principle: Form-First (Formular-First)

Data capture is performed via **SDC Questionnaires** aligned with the clinical workflow. In the background, form data are transformed into FHIR resources via template-based extraction. See [Data Capture](anwendungsfaelle-erfassung.md).

### Dependencies

* Technical (FHIR packages): [MII Oncology](https://simplifier.net/medizininformatikinitiative-modulonkologie)
  * ?: Diagnosis, surgery, systemic therapy, radiotherapy
* Technical (FHIR packages): [MII Pathology](https://simplifier.net/medizininformatikinitiative-modulpathologie)
  * ?: Pathology report, specimen
* Technical (FHIR packages): [MII Imaging](https://simplifier.net/medizininformatikinitiative-modulbildgebung)
  * ?: Tumour localisation (BodyStructure)
* Technical (FHIR packages): [ISiK](https://simplifier.net/isik)
  * ?: Base profile compatibility
* Technical (FHIR packages): [HL7 SDC](http://hl7.org/fhir/uv/sdc/)
  * ?: Form-based data capture
* Technical (FHIR packages): Content (standards & guidelines)
* Technical (FHIR packages): **S3 Guideline Breast Cancer (S3-Leitlinie Mammakarzinom)**
  * ?: Clinical recommendations (AWMF 032-045OL)
* Technical (FHIR packages): **oBDS**
  * ?: Oncological Core Dataset (Onkologischer Basisdatensatz) — cancer registry reporting
* Technical (FHIR packages): **IQTIG QS 18/1**
  * ?: External inpatient quality assurance for breast surgery
* Technical (FHIR packages): **DKG Certification**
  * ?: Quality indicators for breast centres (OncoBox)
* Technical (FHIR packages): **IRegG**
  * ?: Implant register reporting obligation

### Overview

* [Data Model](datenmodell.md) — Logical model, resource model, and FHIR mapping
* [Profiles](profilbeschreibungen.md) — All FHIR profiles in detail
* [Test Patients](testpatientinnen.md) — Two end-to-end example cases (curative + palliative)
* [Use Cases](anwendungsfaelle-uebersicht.md) — Capture, exchange, analysis, reporting datasets
* [Terminology](terminologie-uebersicht.md) — ValueSets, CodeSystems, ConceptMaps
* [Open Questions](offene-fragen.md) — Ballot questions for comment
* [Artifacts](artifacts.md) — All FHIR artifacts

### Planned Future Developments

* **Implant Register Reporting (IRegG)** — StructureMaps for automatic derivation of implant register data
* **CQL-based Quality Indicators** — Formal definition of DKG metrics as [CQL](http://cql.hl7.org/) Measures
* **Synthetic Test Cohort** — Rule-based generated test data (100 patients) for SQL on FHIR and CQL
* **PRO Integration** — PRO-CTCAE and EORTC QLQ-BR23/BR45/BR42 for patient-reported outcomes

