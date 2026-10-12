### Core Dataset Senology (Kerndatensatz Senologie)

The **Core Dataset Senology** defines FHIR profiles for the structured documentation of breast cancer care at certified breast centres (Brustzentren) and beyond. It covers the entire care pathway from initial presentation through diagnostics, treatment, and follow-up to longitudinal documentation.

<div style="margin: 1.5em 0;">
<img src="versorgungspfad-uebersicht.svg" alt="Versorgungspfad Senologie: Diagnose, Tumorkonferenz, Therapie, Nachsorge" style="width:100%; max-width:900px;"/>
</div>

<div style="margin: 1em 0;">
<a href="https://www.senologie.org/"><img src="dgs-logo.png" alt="Deutsche Gesellschaft für Senologie" style="height:60px"/></a>
</div>

### Who is this IG for?

| Audience | What will I find here? | Starting point |
|---|---|---|
| **Clinicians** | Which data are captured, which terminologies are used | [Data Model](datenmodell.html), [Test Patients](testpatientinnen.html) |
| **IT / Developers** | FHIR profiles, questionnaires, extraction, technical interfaces | [Profiles](profilbeschreibungen.html), [Artifacts](artifacts.html) |
| **Quality Assurance** | Derivation of reporting datasets (oBDS, IQTIG, OncoBox, IRegG) | [Use Cases](anwendungsfaelle-uebersicht.html) |
| **Researchers** | Secondary use, terminologies, interoperability | [Terminology](terminologie-uebersicht.html), [Data Model](datenmodell.html) |

### Care Pathway (Versorgungspfad)

The dataset maps the clinical workflow of senology across the following domains:

| Domain | Description | Profiles |
|---|---|---|
| **Diagnosis** | Initial diagnosis, recurrence, staging (cTNM), laterality | [Diagnosis](StructureDefinition-senologie-diagnose-maligne.html) |
| **Diagnostics** | Imaging (mammography, ultrasound, MRI), pathology, biomarkers | [Imaging](StructureDefinition-senologie-bildgebung-befund.html), [Pathology](StructureDefinition-senologie-pathologie-befund.html) |
| **Therapy** | Surgery, systemic therapy, radiotherapy | [Surgery](StructureDefinition-senologie-operation.html), [Systemic Therapy](StructureDefinition-senologie-systemtherapie-procedure.html) |
| **Tumour Board (Tumorkonferenz)** | Treatment recommendations, clinical disciplines | [Tumour Board](StructureDefinition-senologie-tumorboard-empfehlung.html) |
| **Follow-up (Nachsorge)** | Disease course, vital status, recurrence monitoring | [Follow-Up](StructureDefinition-senologie-follow-up.html) |

The detailed FHIR resource model is available under [Data Model](datenmodell.html).

### Objectives

1. **Standardised capture** of clinical data along the breast cancer (Mammakarzinom) care pathway
2. **Interoperable data exchange** between clinical systems, cancer registries, and research databases based on HL7 FHIR
3. **Secondary use** of care data for quality assurance, health services research, and clinical trials

### Classification

The Core Dataset uses existing MII Core Dataset profiles as its technical foundation, but is an independent dataset — not an MII module. Technical implementation is carried out by the **Berlin Institute of Health at Charité (BIH)**; content alignment is coordinated with the **[Deutsche Gesellschaft für Senologie (DGS)](https://www.senologie.org/)**, the **[Deutsche Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)](https://www.dggg.de/)**, and the **[Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)](https://www.ago-online.de/)**.

### Design Principle: Form-First (Formular-First)

Data capture is performed via **SDC Questionnaires** aligned with the clinical workflow. In the background, form data are transformed into FHIR resources via template-based extraction. See [Data Capture](anwendungsfaelle-erfassung.html).

### Dependencies

<table>
<tr><th colspan="2">Technical (FHIR packages)</th></tr>
<tr><td><a href="https://simplifier.net/medizininformatikinitiative-modulonkologie">MII Oncology</a></td><td>Diagnosis, surgery, systemic therapy, radiotherapy</td></tr>
<tr><td><a href="https://simplifier.net/medizininformatikinitiative-modulpathologie">MII Pathology</a></td><td>Pathology report, specimen</td></tr>
<tr><td><a href="https://simplifier.net/medizininformatikinitiative-modulbildgebung">MII Imaging</a></td><td>Tumour localisation (BodyStructure)</td></tr>
<tr><td><a href="https://simplifier.net/isik">ISiK</a></td><td>Base profile compatibility</td></tr>
<tr><td><a href="http://hl7.org/fhir/uv/sdc/">HL7 SDC</a></td><td>Form-based data capture</td></tr>
<tr><th colspan="2">Content (standards &amp; guidelines)</th></tr>
<tr><td><strong>S3 Guideline Breast Cancer (S3-Leitlinie Mammakarzinom)</strong></td><td>Clinical recommendations (AWMF 032-045OL)</td></tr>
<tr><td><strong>oBDS</strong></td><td>Oncological Core Dataset (Onkologischer Basisdatensatz) — cancer registry reporting</td></tr>
<tr><td><strong>IQTIG QS 18/1</strong></td><td>External inpatient quality assurance for breast surgery</td></tr>
<tr><td><strong>DKG Certification</strong></td><td>Quality indicators for breast centres (OncoBox)</td></tr>
<tr><td><strong>IRegG</strong></td><td>Implant register reporting obligation</td></tr>
</table>

### Overview

- [Data Model](datenmodell.html) — Logical model, resource model, and FHIR mapping
- [Profiles](profilbeschreibungen.html) — All FHIR profiles in detail
- [Test Patients](testpatientinnen.html) — Two end-to-end example cases (curative + palliative)
- [Use Cases](anwendungsfaelle-uebersicht.html) — Capture, exchange, analysis, reporting datasets
- [Terminology](terminologie-uebersicht.html) — ValueSets, CodeSystems, ConceptMaps
- [Open Questions](offene-fragen.html) — Ballot questions for comment
- [Artifacts](artifacts.html) — All FHIR artifacts

### Planned Future Developments

- **Implant Register Reporting (IRegG)** — StructureMaps for automatic derivation of implant register data
- **CQL-based Quality Indicators** — Formal definition of DKG metrics as [CQL](http://cql.hl7.org/) Measures
- **Synthetic Test Cohort** — Rule-based generated test data (100 patients) for SQL on FHIR and CQL
- **PRO Integration** — PRO-CTCAE and EORTC QLQ-BR23/BR45/BR42 for patient-reported outcomes
