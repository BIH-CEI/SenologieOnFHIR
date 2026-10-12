### Starting Point

Certified breast centres document the care of their patients primarily to ensure continuous, safe, and traceable clinical treatment: from the very first presentation, findings, assessments, and recommendations are recorded in such a way that at every subsequent contact it is always clear which patient is involved, what diagnoses have been established, which interventions have already taken place, and which further steps are planned. This essential primary documentation then underpins the additional reporting obligations: DKG certification (OnkoZert), cancer registry notification (oBDS), statutory quality assurance (IQTIG), the implant registry, and clinical research. Although the substantive requirements of these reporting pathways overlap to a large extent, the data are frequently captured redundantly, held in different formats, and exported separately. Because the data requirements are each defined from the perspective of the receiving body, considerable effort arises in mapping and transforming clinical data into the respective target formats. On top of this come site-specific and multicentre studies, each bringing their own specific data requirements. The parallel maintenance of all these documentation streams leads to inconsistencies, error-proneness, and a workload that can barely be managed with the available resources.

### Objectives

<img src="senologie-meldewege-uebersicht.png" alt="Klinische Dokumentation → FHIR → Meldewege" style="max-width:100%"/>

This Implementation Guide defines a shared data model for the structured documentation of breast cancer care. The goal is to capture clinical information once and derive the various notifications and reports from it. Instead of maintaining a separate system for each reporting pathway, a shared model is created that covers the requirements of all stakeholders.

### Analysis of Reporting Pathways

A key contribution of this IG is the systematic comparison of the various reporting datasets. The requirements of oBDS, OncoBox, IQTIG, and the implant registry overlap in large parts, but differ in details — for example in codings, granularity, or mandatory fields. By explicitly documenting these differences, a foundation is created on which a stronger harmonisation of the reporting pathways can be pursued over the medium term.

### Further Perspectives

A cross-site uniform data model for senology (Senologie) opens up possibilities that go beyond mere mandatory reporting:

- **Clinical Decision Support**: Structured data enable automated support for clinical decisions, for example in therapy planning based on molecular subtypes.
- **Computable Clinical Guidelines**: Guideline recommendations (e.g. from the S3 guideline on mammary carcinoma) can be represented in machine-readable form and validated against the documented data.
- **Automated Quality Indicators**: DKG key figures and IQTIG indicators can be calculated directly from the data model, without manual aggregation.
- **Cross-Site Analyses**: Uniformly structured data are the prerequisite for health services research, registry studies, and benchmarking between centres.

### Target Audiences

This Implementation Guide is addressed to different user groups:

- **Clinical staff at breast centres**: Both the treating team and staff involved in notifications, documentation, and analyses. For them, a uniform data model creates the basis for reducing documentation effort and improving data quality.
- **Vendors of documentation and information systems**: The profiles, terminologies, and transformation rules defined here are available as an open specification and can be used as the basis for implementation in clinical systems.
- **Interoperability community**: This project aims to demonstrate how — from within the community, in collaboration with professional societies — foundational domain-specific specifications can emerge that complement and concretise the roadmap of the Interoperability Council (Interop Council).
- **Quality assurance and registration institutions**: For cancer registries, certification bodies, statutory quality assurance organisations, and guideline organisations, this project can serve as a concrete starting point for placing existing reporting pathways on a common FHIR-based foundation. In particular, agreement on uniform semantic annotations — that is, the consistent coding of clinical concepts using international terminologies such as SNOMED CT, LOINC, and ICD — would deliver substantial added value: it would not only simplify transformation between reporting pathways, but also ensure compatibility with the European Health Data Space (EHDS) and the European harmonisation of clinical datasets.

### Classification

This data model builds on the core dataset of the Medical Informatics Initiative (MII KDS Onkologie) and is compatible with the Information Technology Systems in Hospitals (ISiK) standard. Conformance with European standards (EHDS, European Patient Summary) is a stated objective.

### Content Supported By

| Person | Institution / Role |
|--------|----------------------|
| Prof. Dr. med. Wolfgang Janni | DGGG, Representative of the Working Group on Gynaecological Oncology (Arbeitsgemeinschaft Gynäkologische Onkologie) |
| Prof. Dr. med. Markus Wallwiener | DGGG, Chair of the Commission on Digital Medicine; AGO, Deputy Chair |
| Prof. Dr. med. Andreas Schneeweiß | DGS, Chair of the German Society for Senology (Deutsche Gesellschaft für Senologie) |
| Prof. Dr. med. Volkmar Müller | AGO, Chair of the Breast Commission (Kommission Mamma) |
| Prof. Dr. med. Achim Wöckel | S3 Guideline Coordination for Mammary Carcinoma |
| PD Dr. rer. nat. Christoph Kowalski | German Cancer Society (Deutsche Krebsgesellschaft), Health Services Research |
| Prof. Dr. med. Maria Margarete Karsten | Head of Breast Centre, Charité — Universitätsmedizin Berlin |
| Prof. Dr. med. Dipl.-Ing. Sylvia Thun | Berlin Institute of Health at Charité (BIH) |

### Note on Status

The present specification is not to be understood as a normative requirement, but as a scientific invitation to jointly and intersectorally develop a single medical specialty in its full granularity. Feedback, corrections, and proposals for extension are expressly welcome.
