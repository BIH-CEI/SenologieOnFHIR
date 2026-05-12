# Senologie Core Dataset — English Summary

> **Note:** The full Implementation Guide is published in German, reflecting its primary audience (German-certified breast cancer centres and their reporting context). This page summarises the specification for an international audience. All FHIR artefacts (profiles, ValueSets, examples) carry English titles and descriptions where applicable.

The **Senologie Core Dataset** defines FHIR R4 profiles for the structured documentation of breast cancer care at certified breast centres in Germany. It covers the entire care pathway — from initial presentation through diagnostics, therapy, and follow-up. The specification is developed by the **Berlin Institute of Health at Charité (BIH)** in coordination with the **German Society for Senology (DGS)**, **DGGG**, and **AGO**.

<div style="margin: 1.5em 0;">
<img src="versorgungspfad-uebersicht.svg" alt="Care pathway: Diagnosis ↔ Tumour Board ↔ Therapy → Follow-up" style="width:100%; max-width:900px;"/>
</div>

### Scope at a glance

| Domain | Description | Profile |
|---|---|---|
| **Diagnosis** | Initial diagnosis, recurrence, cTNM staging, laterality | [Diagnose](StructureDefinition-senologie-diagnose-maligne.html) |
| **Diagnostics** | Imaging (mammography, ultrasound, MRI), pathology, biomarkers | [Bildgebung](StructureDefinition-senologie-bildgebung-befund.html), [Pathologie](StructureDefinition-senologie-pathologie-befund.html) |
| **Therapy** | Surgery, systemic therapy, radiotherapy | [Operation](StructureDefinition-senologie-operation.html), [Systemtherapie](StructureDefinition-senologie-systemtherapie-procedure.html) |
| **Tumour board** | Treatment recommendations, multidisciplinary review | [Tumorboard](StructureDefinition-senologie-tumorboard-empfehlung.html) |
| **Follow-up** | Surveillance, vital status, recurrence monitoring | [Follow-Up](StructureDefinition-senologie-follow-up.html) |

### Design principles

- **Form-first capture.** Data is entered via SDC Questionnaires aligned with clinical workflow; FHIR resources are derived by SDC template-based extraction.
- **Built on MII profiles.** The dataset reuses the Medical Informatics Initiative (MII) core modules (Onkologie, Pathologie, Bildgebung) as its technical base rather than redefining them. It is a stand-alone dataset, not an MII module.
- **ISiK-compatible.** Profiles inherit from ISiK base profiles where applicable, so resources can flow into German hospital interoperability layers without rework.
- **Secondary use.** Captured data feeds quality reporting, registry submissions, and research without re-entry.

### German reporting datasets — context for international readers

A defining requirement for German breast centres is that the same clinical record must serve multiple mandatory reporting pipelines. The IG provides mappings from the FHIR resources to each of these. They are listed here so international readers understand the regulatory backdrop; full mapping details live on the [Meldedatensätze](anwendungsfaelle-meldedatensaetze.html) pages of the German IG.

| Dataset | Audience | What it covers |
|---|---|---|
| **oBDS** (Onkologischer Basisdatensatz) | Cancer registries (statutory) | The minimum oncology dataset all hospitals must submit to regional cancer registries. Covers diagnosis, treatment, course of disease, and tumour-related death. |
| **IQTIG QS 18/1 Mammachirurgie** | Federal quality assurance | External inpatient quality assurance for breast surgery. Captures perioperative process and outcome indicators (e.g. preoperative imaging, axillary staging, completeness of resection). |
| **OncoBox Brust** (DKG) | DKG certification (voluntary) | Indicator set used by the German Cancer Society (Deutsche Krebsgesellschaft) to certify breast centres. Tracks adherence to S3-guideline-based quality benchmarks. |
| **IRegG** | Federal implant registry (statutory) | Mandatory reporting of breast implants to the German Implant Registry (Implantateregister Deutschland), including device identification, indication, and revision status. |

The relevant **logical-model mappings** to these datasets are published as `Mapping` blocks on the [Logical Model](StructureDefinition-LogicalModelSenologie-mappings.html).

### Clinical guideline alignment

Clinical content follows the **S3 guideline for breast cancer** (AWMF 032-045OL), maintained jointly by the German Cancer Society (DKG), German Cancer Aid (DKH), and AWMF. ValueSets and required elements reflect the recommendations of the current guideline version.

### Where to look next

- **[Data model](datenmodell.html)** — Logical model and FHIR resource model
- **[Profiles](profilbeschreibungen.html)** — All FHIR profiles
- **[Use cases](anwendungsfaelle-uebersicht.html)** — Capture, exchange, secondary use, reporting
- **[Terminology](terminologie-uebersicht.html)** — ValueSets, CodeSystems, ConceptMaps
- **[Artifacts](artifacts.html)** — Full list of FHIR artefacts

For interoperability questions or international collaboration, see [Interoperability](interoperabilitaet.html) (covers MII KDS, ISiK, IPS, EU-EHDS alignment).

### Contact

- **Berlin Institute of Health at Charité (BIH)** — Core Unit eHealth & Interoperability
- GitHub: [BIH-CEI/SenologieOnFHIR](https://github.com/BIH-CEI/SenologieOnFHIR)
