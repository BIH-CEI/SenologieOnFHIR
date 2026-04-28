# SNOMED CT Expo 2026 — Abstract Submission

**Deadline**: 27 April 2026
**Stream**: Demonstrating Implementation Excellence
**Presentation Type**: Oral Onsite (20 min + Q&A)

---

## Presentation Title

One Dataset, Four Registries: SNOMED CT as the Clinical Backbone for German Breast Centers

## Short Description

We present a SNOMED CT-native FHIR R4 Implementation Guide for breast cancer care in Germany — captured once, coded in SNOMED CT, exportable everywhere. Developed by the German Society for Senology (DGS) and the Berlin Institute of Health at Charité (BIH), the IG covers the complete clinical lifecycle from history through diagnosis, surgery, systemic therapy, radiation, pathology, and follow-up. Clinical data is captured via FHIR SDC Questionnaires where SNOMED CT coding is embedded in the forms, invisible to clinicians. The same data can be automatically transformed into four German registry formats — cancer registry (oBDS), implant registry (IRegG), quality assurance (IQTIG), and certification (DKG/OncoBox) — via StructureMaps and ConceptMaps. Unlike existing organ-agnostic oncology specifications, this IG models breast-specific clinical decision points (receptor subtyping, gene expression assays, BI-RADS, surgical taxonomy) in SNOMED CT. Even where structured data from imaging or pathology subsystems is not yet available, the IG enables treating clinicians to capture relevant findings in coded form — to be seamlessly replaced by subsystem data as structured reporting matures. The IG is modular, enters public review in May 2026 as a community platform for specialty societies, EHR vendors, and registries, and channels SNOMED CT content gaps back to the National Release Center.

## Abstract — Scope of project/implementation/research

Breast cancer care in Germany requires reporting to at least four separate registries — cancer registry (oBDS), implant registry (IRegG), quality assurance (IQTIG), and certification body (DKG/OncoBox) — each with its own data format and code systems. In addition, research networks and studies may require other distinct definitions of datapoints. Today, clinicians and documentarians enter largely the same information multiple times in different systems. The "Kerndatensatz Senologie" is a FHIR R4 Implementation Guide that eliminates this redundancy by establishing SNOMED CT as the single clinical terminology from which all registry reports can be derived automatically.

Developed by the German Society for Senology (DGS) and the Berlin Institute of Health at Charité (BIH), the IG was designed from the perspective of a certified breast center: what data do clinicians actually need to capture, and how can it be structured so that registry obligations are met automatically? The IG covers the complete clinical lifecycle of a breast cancer patient: clinical and gynecological history, risk assessment, clinical examination, imaging (BI-RADS), pathology (receptor status, grading, gene expression assays), tumor board decisions, surgical and systemic treatment, radiation therapy, complications, implant tracking, and follow-up. SNOMED CT serves as the primary terminology for diagnostic and therapeutic documentation, while complementary standards (LOINC, instrument-specific scoring systems) are used where established — for instance in patient-reported outcome instruments and parts of the clinical history. The underlying clinical dataset was annotated by domain experts from the DGS.

Beyond the technical specification, the IG serves as a community platform: by entering a public commenting phase in May 2026, it provides a shared foundation for medical specialty societies, EHR vendors, cancer registries, and breast centers to align on how breast cancer care should be documented in Germany. The SNOMED CT terminology choices embedded in the IG — which concepts to use, which translations are needed, which mappings to national code systems are correct — become a community discussion rather than an isolated decision. The IG is designed to be maintained continuously, serving as a reverse feedback loop: as the external registry specifications (oBDS, IRegG, IQTIG, DKG) evolve, the IG adapts its mappings and profiles accordingly — and any resulting terminology gaps are fed back to SNOMED International, creating a sustainable cycle between clinical practice, registry requirements, and terminology development.

While previous work — including existing German oncology specifications (MII Kerndatensatz Onkologie) and international efforts such as mCODE and SNOMED CT-based pathology synoptic reporting — has demonstrated SNOMED CT's value for individual clinical domains, these approaches are either organ-agnostic or limited to a single modality. This IG extends SNOMED CT coverage across the full multimodal breast cancer care pathway, including breast-specific clinical decision points (HER2/ER/PR receptor subtyping, Oncotype DX gene expression assays, BI-RADS assessment, breast-specific surgical taxonomy, Clavien-Dindo complication grading) that have not previously been terminologically bound in a German FHIR IG.

A key outcome is structured governance feedback: concepts missing from the SNOMED CT International Edition, German-language translations needed for clinical adoption, and mapping conflicts between SNOMED CT and national code systems. This feedback will be channeled to the German National Release Center and SNOMED International to inform future content development. Approximately 15% of clinical concepts required annotation using local code systems, as corresponding SNOMED CT concepts were either absent from the International Edition or lacked German translations. This excludes diagnoses and procedures — where SNOMED CT coverage was sufficient — as well as patient-reported outcomes, where LOINC annotations were available.

## Abstract — How SNOMED CT is used

Clinicians interact with SNOMED CT without seeing codes. The IG uses FHIR SDC (Structured Data Capture) Questionnaires where answer options are presented as human-readable clinical terms — "Brusterhaltende Therapie", "BI-RADS 4", "Clavien-Dindo Grad II" — while SNOMED CT codes are captured transparently in the background. This design removes the barrier of clinical coding and makes SNOMED CT adoption invisible to the end user. Because the questionnaire definitions are standard FHIR resources, any FHIR-capable system — whether a specialized breast center documentation tool, a hospital EHR, a clinical trial EDC, or a standalone app — can embed the same forms, render them for clinicians, and extract SNOMED CT-coded data in a uniform way. This moves interoperability from the data exchange layer to the point of data capture itself. Importantly, the IG is modular: systems can adopt the SNOMED CT-bound data model directly without using the questionnaires, use only the StructureMaps for registry transformation, or consume only the terminology artifacts (ValueSets, ConceptMaps) — allowing incremental adoption depending on each system's maturity and needs.

Behind the questionnaires, SNOMED CT serves as the primary coding system across all 24 clinical profiles. Diagnoses combine SNOMED CT (clinical semantics) with ICD-10-GM (statutory reporting). Procedures are dual-coded in SNOMED CT (semantic category, e.g., 392021009 |Lumpectomy of breast|) and OPS (billing granularity) where possible. Pathology findings — receptor status, HER2 scoring, grading, Ki-67 proliferation index, and gene expression results — all reference SNOMED CT concepts.

The transformation pipeline uses 8 ConceptMaps (SNOMED CT to oBDS, ICD-O-3, ATC) consumed by 30 FHIR StructureMaps that convert SNOMED CT-coded FHIR bundles into registry-specific logical models. A breast cancer diagnosis coded once in SNOMED CT is automatically mapped to an oBDS cancer registry XML message, an IQTIG quality report, an IRegG implant notification, and a DKG certification dataset — without re-entering or re-coding data.

CQL-based quality indicators derived from the German S3 breast cancer guideline (e.g., pre-therapeutic histological confirmation rate, radiation after breast-conserving surgery) query SNOMED CT-coded conditions and procedures to compute compliance rates across the patient cohort.

Where SNOMED CT concepts were not yet available in the International Edition or the German National Extension, we used a local CodeSystem as an interim measure and documented these gaps systematically for submission to the National Release Center. The same approach is applied for missing German translations of existing concepts.

## Abstract — Why SNOMED CT was selected

**Mapping hub and universality.** SNOMED CT is the only terminology expressive enough to serve as a single source for four different registry formats with four different code systems. Rather than maintaining separate coding workflows for each registry, clinicians document once in SNOMED CT, and StructureMaps with embedded ConceptMap lookups produce the correct oBDS, ICD-O-3, OPS, or ATC codes. This "document once, report everywhere" architecture is only possible because SNOMED CT provides the clinical granularity that legacy classification systems lack.

**Clinical expressiveness.** Breast cancer care requires fine-grained concepts that ICD-10-GM and OPS cannot represent: receptor subtypes driving therapy selection, gene expression assay results, imaging assessment scales (BI-RADS 0–6), surgical technique taxonomy (breast-conserving surgery variants, sentinel lymph node biopsy vs. axillary dissection levels), and complication classification (Clavien-Dindo grades I–V with sub-grades). SNOMED CT provides this granularity while maintaining formal ontological relationships that enable reasoning and analytics.

**European alignment.** The EU European Health Data Space (EHDS) regulation mandates SNOMED CT for cross-border health data exchange. Building on SNOMED CT now prepares German breast centers for EHDS compliance. The MII core data set profiles that form the foundation of this IG already provide SNOMED CT annotations, ensuring interoperability with 36 university hospital sites in Germany.

## Learning Objectives

At the end of the presentation, participants will be able to:

1. Understand how SNOMED CT can serve as a single semantic backbone for multi-registry reporting in oncology, eliminating redundant data capture through automated FHIR StructureMap transformations.
2. Learn practical patterns for integrating SNOMED CT with national code systems (ICD-10-GM, OPS, ICD-O-3) in a FHIR Implementation Guide using ConceptMaps and dual-coding strategies.
3. Identify common SNOMED CT content gaps encountered when modeling a complete specialty care pathway, and understand the process for documenting and submitting feedback to National Release Centers.

## Questions for moderator

1. How do you handle SNOMED CT concepts that exist in the International Edition but are not yet available in the German National Extension — and what is your strategy for requesting new concepts and translations?
2. How do clinicians interact with SNOMED CT in practice — do they see codes directly, or is the terminology hidden behind questionnaire-based data entry? How has this affected adoption?
3. Given that German breast centers currently don't use SNOMED CT, what is your adoption strategy — and is a specialty FHIR IG realistic without a national SNOMED CT mandate for clinical documentation?

## Target Audience

- Clinicians
- Implementers
- Terminologists
- Researchers and Knowledge Producers

## Keywords

- FHIR
- Oncology / Breast Cancer
- ConceptMaps / StructureMaps
- Registry Reporting
- Clinical Documentation
- Quality Indicators
- SDC Questionnaires
- EHDS
- Terminology Governance

## Authors and Affiliations

| Role | Title | First | Last | Presenting | Affiliation | City | Country |
|------|-------|-------|------|------------|-------------|------|---------|
| Author 1 | ... | Thomas | Debertshäuser | Yes | Berlin Institute of Health at Charité (BIH) | Berlin | Germany |
| Author 2 | ... | Therese | Pross | No | ... | ... | Germany |
| Author 3 | ... | Sophie | Klopfenstein | No | ... | ... | Germany |

## SNOMED in Action

**Contact Email**: (generic, e.g., info@bihealth.org)

**Organization Address**:
- Street: Anna-Louisa-Karsch-Str. 2
- City: Berlin
- Country: Germany
- Postal Code: 10178
