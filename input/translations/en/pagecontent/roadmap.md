### Roadmap & Future Developments

The following topics are planned for future versions of the Core Dataset Senology (Kerndatensatz Senologie).

#### ISiK Level 6 Integration

With the release of ISiK Level 6 (ISiK Stufe 6), deeper integration of the senology profiles with the ISiK base profiles is planned. This includes in particular the connection to the ISiK forms module for patient- and staff-completed questionnaires, as well as the use of ISiK profiles for patient master data and case assignment.

#### Patient-Reported Outcomes (PROMs)

The integration of PROMs is a central topic for further development. Preliminary work from the MII-PRO module provides the basis for validating data as QuestionnaireResponses and Observations against public definitions. Relevant instruments for senology include in particular:

- **EORTC QLQ-C30** (general quality of life)
- **EORTC QLQ-BR23 / BR45 / BR42** (breast cancer-specific quality of life)
- **PRO-CTCAE** (patient-reported adverse effects)

The German Cancer Society (DKG) is currently working on a PRO implementation for the Oncological Basic Screening (Onkologisches Basisscreening).

#### Implant Registry

The FHIR connection to the breast implant registry (IRegG — Implantateregister Deutschland) has been announced as part of the national health strategy. The existing Logical Model (`ireg-brustimplantat-meldung`) and the StructureMaps for the IRegG transformation provide the basis for future direct FHIR-based reporting.

#### Cancer Registry Reporting via FHIR

The existing StructureMaps for oBDS and OncoBox demonstrate the transformation of FHIR into proprietary reporting formats. Looking ahead, cancer registry reports could be transmitted directly as FHIR Bundles — provided the receiving side supports FHIR as an input format.

#### IPS Conformance

Ensuring compatibility with the International Patient Summary (IPS) enables the care of international patients. The goal is for a IPS-compliant patient summary to be automatically generated from the senology data — relevant for the European Health Data Space (EHDS) and cross-border care.

#### MII Oncology: Axillary Procedures

Axillary surgery (sentinel lymph node biopsy, axillary dissection) is currently not representable via the MII Oncology module. A corresponding extension has been accepted as a feature request and is planned to be available in future versions of the MII Core Dataset (MII KDS).

#### CQL-Based Quality Indicators

The formal definition of the DKG key figures (KB-1 to KB-20) and descriptive statistics as CQL Measures for automated evaluation. This would enable real-time quality assurance based on FHIR data.

#### Guideline Annotation

In the medium term, systematic annotation of guideline content is planned — mapping the recommendations of the S3 guideline on mammary carcinoma (S3-Leitlinie Mammakarzinom) to the concrete data elements of the data model. This creates the foundation for Computable Clinical Guidelines and automated guideline adherence checks.

#### Synthetic Test Cohort

Rule-based generated test data (100 patients with variation of subtypes, stages, and therapies) as a Docker container for SQL on FHIR and CQL evaluations.
