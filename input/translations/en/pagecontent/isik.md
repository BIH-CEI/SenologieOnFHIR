# ISiK Compatibility

## Core Principle

The ISiK specification (Informationstechnische Systeme im Krankenhaus — IT Systems in Hospitals) published by gematik defines base profiles for the inpatient care context in Germany. ISiK is currently under public comment at Stage 6. The Senology IG uses ISiK-compatible profiles wherever they meet the clinical requirements. This covers both the exchange of patient master data and case assignment as well as the ISiK forms module for patient- and staff-completed questionnaires.

## ISiK-Compatible Elements

| Concept | ISiK Profile | Usage in the Senology IG |
|---------|-------------|--------------------------|
| Smoking status | ISiKRaucherStatus | Smoking-status Observation (C03) uses the ISiK profile with LOINC 72166-2 |
| Patient | ISiKPatient | Patient resources conform to the ISiK base requirements |
| Encounter | ISiKKontaktGesundheitseinrichtung | Inpatient and outpatient encounters |
| Condition | ISiKDiagnose | ICD-10-GM coding compatible |
| Procedure | ISiKProzedur | OPS coding compatible |

## Demarcation

ISiK deliberately defines generic profiles for broad use in hospital information systems (Krankenhausinformationssysteme). The domain-specific depth of senology — such as TNM staging, receptor status, or tumour board (Tumorboard) recommendations — goes beyond the ISiK scope. This is where the MII KDS profiles serve as the subject-specific extension.

Compatibility with ISiK ensures that senological data can be integrated into existing hospital IT infrastructures without compromising interoperability at the base level.
