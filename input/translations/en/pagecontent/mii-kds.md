# MII KDS Compatibility

## Core Principle

The profiles in this IG inherit directly from the profiles of the MII Core Dataset (Kerndatensatz, KDS) wherever possible. This ensures that senology data is automatically conformant with MII requirements and can be processed in the cross-site Data Integration Centres (Datenintegrationszentren, DIZ) of the Medical Informatics Initiative.

## MII Modules Used

| MII Module | Version | Usage in the Senology IG |
|-----------|---------|---------------------------|
| Oncology | 2026.0.3 | Diagnosis (primary tumour), TNM, surgery, systemic therapy, radiotherapy, follow-up, adverse events, genetic variant, ECOG |
| Molecular Tumour Board | 2026.0.1 | PD-L1 immunohistochemistry, molecular-pathological markers |
| Pathology | 2026.0.2 | DiagnosticReport, Specimen |
| Imaging | 2026.0.0 | BodyStructure (tumour localisation) |
| MolGen | — | Genetic variants (BRCA1/2, PALB2), genetic testing |
| Person | — | Vital status, cause of death |

## Profile Inheritance

| Senology Profile | Inherits from (MII KDS) |
|-----------------|-------------------|
| Senologie_Diagnose_Maligne | mii-pr-onko-diagnose-primaertumor |
| Senologie_Operation | mii-pr-onko-mamma-operation |
| Senologie_Systemtherapie_Procedure | mii-pr-onko-systemische-therapie |
| Senologie_Strahlentherapie | mii-pr-onko-strahlentherapie |
| Senologie_FollowUp | mii-pr-onko-verlauf |
| Senologie_Nebenwirkung | mii-pr-onko-nebenwirkung |
| Senologie_Somatische_Mutation | mii-pr-onko-genetische-variante |
| Senologie_Pathologie_Befund | mii-pr-patho-report |
| Senologie_Pathologie_Praeparat | mii-pr-patho-specimen |

## Extensions Beyond the MII KDS

Where the MII KDS does not provide specialty-specific requirements, the Senology IG defines its own profiles — e.g. for:

- Imaging findings (BI-RADS, ACR density)
- Gynaecological history (Anamnese)
- Gene expression tests (Oncotype DX, EndoPredict)
- Tumour board recommendation (CarePlan) (Tumorboard-Empfehlung)
- Clinical examination
- Concomitant medication (Begleitmedikation)
- Social work / psycho-oncology

These profiles are designed to remain compatible should they be incorporated into the MII KDS in the future.

## MII Core Dataset Overview

The MII Core Dataset covers the following areas across all modules. The Senology IG primarily uses the Oncology, Pathology, Imaging, and Person modules.

Further details: [MII Kerndatensatz Complete v2026.1.0](https://github.com/medizininformatik-initiative/kerndatensatz-complete/releases/tag/v2026.1.0)
