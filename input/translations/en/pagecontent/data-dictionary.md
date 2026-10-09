### Data Dictionary

This page documents the flat tables extracted from the Senologie profiles via SQL-on-FHIR ViewDefinitions.
Each table corresponds to a ViewDefinition under `validation/views/`. Columns are derived from the profiled resources via FHIRPath.

#### Export Paths

Three ways to produce the tables documented here:

1. **SQL-on-FHIR runner** (e.g. Pathling, Aidbox `$run` on ViewDefinition):
   - `./scripts/export-views-csv.sh exports/` exports all views as CSV against the running Aidbox instance.
2. **Aidbox direct SQL** via `/$sql` (Postgres JSONB) — pragmatic for ad-hoc queries, without a ViewDefinition runner:
   ```sql
   SELECT id AS condition_id,
          resource->'subject'->>'reference' AS patient_ref,
          jsonb_path_query_first(resource, '$.code.coding[*] ? (@.system == "http://snomed.info/sct").code')->>0 AS diagnose_sct
     FROM condition
    WHERE resource->'code'->'coding' @> '[{"system":"http://snomed.info/sct"}]';
   ```
3. **Pathling / DuckDB** against the NDJSON export — for offline analysis.

Column semantics (meaning, code system, binding) are identical across all three paths.

_Auto-generated with `scripts/generate-data-dictionary.py` from ViewDefinitions + StructureDefinitions. Do not edit manually — sources are `validation/views/*.json` and the profiles in `fsh-generated/resources/StructureDefinition-*.json`._

#### Senologie Biomarker Flat View

- **View ID:** `senologie-biomarker-flat`
- **Resource:** `Observation`
- **Description:** All IHC biomarker observations (ER/PR/HER2/Ki67/PD-L1) as a flat table. Filtered to the five relevant LOINC codes. Components with percentage/score/intensity are resolved as separate columns.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `observation_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `focus.first().id` |
| `biomarker_loinc` | code |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `biomarker_name` | string |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').display.first()` |
| `interpretation` | code |  | Primary interpretation as SCT code (positive/negative/low/equivocal). | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').code.first()` |
| `interpretation_display` | string |  |  | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').display.fi…` |
| `her2_gesamt` | code |  | HER2 overall status per guidelines (positive/low/ultralow/negative/equivocal). | CS: cs-senologie-biomarker | `valueCodeableConcept.coding.where(system='https://www.senologie.org/fhir/Code…` |
| `value_prozent` | string |  | Percentage of positive cells (TPS for PD-L1, % positive for ER/PR/Ki67). |  | `component.where(code.coding.where(code='1234803000' or code='85318-4' or code…` |
| `value_irs` | string |  |  |  | `component.where(code.coding.code='irs-score').valueQuantity.value.first()` |
| `value_allred` | string |  |  |  | `component.where(code.coding.code='allred-score').valueQuantity.value.first()` |
| `intensitaet` | code |  | Staining intensity (negative/weak/moderate/strong). |  | `component.where(code.coding.where(code='1236874005' or code='1237278006').exi…` |
| `ish_methode` | code |  |  |  | `component.where(code.coding.code='ish-methode').valueCodeableConcept.coding.c…` |
| `her2_ratio` | string |  |  |  | `component.where(code.coding.code='her2-ratio').valueQuantity.value.first()` |
| `status` | string |  |  |  | `status` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |

#### Senologie BodyStructure Flat View

- **View ID:** `senologie-bodystructure-flat`
- **Resource:** `BodyStructure`
- **Description:** Tumour entities as BodyStructures — the Senologie lifecycle anchor. One row per BodyStructure with patient, localisation (SCT + R5 backport extension for laterality/quadrant), morphology (updated per pathology-histology update), and active flag.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `bs_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `patient.getReferenceKey(Patient)` |
| `active` | string |  |  |  | `active` |
| `tumor_entity_id` | string |  |  | CS: tumor-entity | `identifier.where(system='https://www.senologie.org/fhir/sid/tumor-entity').va…` |
| `location_sct` | code |  | Generic body region (e.g. 76752008 Breast). Detail in sub-columns. | CS: SNOMED CT | `location.coding.where(system='http://snomed.info/sct').code.first()` |
| `laterality_sct` | code |  | R5 backport: right/left/bilateral (SCT). |  | `extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Bo…` |
| `quadrant_sct` | code |  | R5 backport: quadrant (upper-outer/inner/nipple/etc., SCT). |  | `extension.where(url='http://hl7.org/fhir/5.0/StructureDefinition/extension-Bo…` |
| `morphology_sct` | code |  | Overwritten by pathology form with histology code. | CS: SNOMED CT | `morphology.coding.where(system='http://snomed.info/sct').code.first()` |
| `morphology_icdo3` | code |  |  | CS: ICD-O-3 | `morphology.coding.where(system='http://terminology.hl7.org/CodeSystem/icd-o-3…` |
| `description` | string |  |  |  | `description` |

#### Senologie Diagnosis Flat View

- **View ID:** `senologie-diagnose-flat`
- **Resource:** `Condition`
- **Profile:** [senologie-diagnose-maligne](https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne)
- **Description:** Flat table of all senological diagnosis Conditions (one row per Condition with patient, SCT/ICD-10/laterality/date/status). Suitable for quick analyses and CSV export.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `condition_id` | string |  | Technical Condition ID (FHIR `Condition.id`). |  | `id` |
| `patient_id` | string |  | Patient ID (SQL-on-FHIR `getReferenceKey`). Join key for other flat views. Aidbox stores references as {id,resourceType} rather than {reference}, so `subject.reference` does not work — `getReferenceKey` is the SQL-on-FHIR standard function. |  | `subject.getReferenceKey(Patient)` |
| `diagnose_sct` | code | 1.. | SNOMED CT code of the diagnosis. Bound to VS senologie-diagnose-mamma (24 breast-specific codes, clinically sorted). | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `diagnose_display` | string |  | Diagnosis | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `diagnose_icd10` | code | 1.. | ICD-10-GM dual code (optional). Derived from ConceptMap cm-senologie-diagnose-sct-to-icd10. | CS: ICD-10-GM | `code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').code.fi…` |
| `diagnose_icd11` | code | 1.. | ICD-11 dual code (optional). WHO ICD-11 MMS. | CS: mms | `code.coding.where(system='http://id.who.int/icd11/mms').code.first()` |
| `tumormanifestation` | code | 0..* | Tumour manifestation (primary tumour/recurrence/lymph node/distant metastasis) | VS: vs-senologie-tumormanifestation | `category.coding.where(system='https://www.senologie.org/fhir/CodeSystem/cs-se…` |
| `diagnose_custom_code` | code | 1.. | Senologie-specific code (e.g. nipple discharge, bc-recurrence) where no suitable SCT code exists. | CS: Senologie Diagnose-Mamma-Custom | `code.coding.where(system='https://www.senologie.org/fhir/CodeSystem/cs-senolo…` |
| `seite_sct` | code |  | Laterality as SNOMED CT (24028007=right, 7771000=left, 51440002=bilateral). | CS: SNOMED CT | `bodySite.coding.where(system='http://snomed.info/sct').code.first()` |
| `seite_onko` | code |  | Laterality per MII Onko (R/L/B/M/T/U). For oBDS export. | CS: MII Onko Seitenlokalisation | `bodySite.coding.where(system='https://www.medizininformatik-initiative.de/fhi…` |
| `clinical_status` | code |  | Clinical status (active/recurrence/remission/resolved). `recurrence` = recurrence on the same Condition. |  | `clinicalStatus.coding.code.first()` |
| `verification_status` | code |  | FHIR verification status (confirmed/unconfirmed/provisional/differential). | CS: condition-ver-status | `verificationStatus.coding.where(system='http://terminology.hl7.org/CodeSystem…` |
| `diagnosesicherung_obds` | code |  | oBDS diagnosis verification 1–9 (1=clinical, 2=imaging, 5=cytology, 7=histology primary tumour, …). MII Onko CodeSystem. | CS: MII Onko Diagnosesicherung | `verificationStatus.coding.where(system='https://www.medizininformatik-initiat…` |
| `onset_date` | dateTime |  | Date of initial diagnosis (onset). NOT overwritten at recurrence. |  | `onsetDateTime` |
| `asserted_date` | dateTime |  | Date of assertion (e.g. recurrence confirmation). Oncology-compliant via condition-assertedDate extension. |  | `extension.where(url='http://hl7.org/fhir/StructureDefinition/condition-assert…` |
| `recorded_date` | dateTime |  | Date of entry into the system (documentation timestamp). |  | `recordedDate` |

#### Senologie Family History Flat View

- **View ID:** `senologie-familienanamnese-flat`
- **Resource:** `FamilyMemberHistory`
- **Description:** FamilyMemberHistory entries for hereditary predisposition. One row per family member with degree of relationship, condition, and age at diagnosis.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `fmh_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `patient.getReferenceKey(Patient)` |
| `relationship_code` | code |  |  |  | `relationship.coding.code.first()` |
| `relationship_display` | string |  |  |  | `relationship.coding.display.first()` |
| `sex_code` | code |  |  |  | `sex.coding.code.first()` |
| `status` | string |  |  |  | `status` |
| `deceased_boolean` | string |  |  |  | `deceasedBoolean` |
| `condition_code_sct` | code |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `condition_display` | string |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `onset_age_value` | string |  |  |  | `onsetAge.value` |
| `onset_string` | string |  |  |  | `onsetString` |

#### Senologie Pathology Report Flat View

- **View ID:** `senologie-pathologie-report-flat`
- **Resource:** `DiagnosticReport`
- **Description:** Pathology primary reports (DiagnosticReport) as a flat table. Links specimen, histology, IHC, and report text.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `report_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `report_code` | code |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `status` | string |  |  |  | `status` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |
| `issued` | instant |  |  |  | `issued` |
| `specimen_id` | string |  |  |  | `specimen.first().id` |
| `conclusion` | string |  |  |  | `conclusion` |

#### Senologie Patient Flat View

- **View ID:** `senologie-patient-flat`
- **Resource:** `Patient`
- **Description:** Flat table of all patients with master data (name, sex, date of birth/death, statutory health insurance ID (KVID), local patient ID). Basis for patient-level analyses and joins via patient_id.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `patient_id` | string |  | Technical patient ID (FHIR `Patient.id`). Join key for all other flat views (`*.patient_id`). |  | `id` |
| `kvid` | string |  | GKV KVID-10 (statutory health insurance number). System: http://fhir.de/sid/gkv/kvid-10. | CS: kvid-10 | `identifier.where(system='http://fhir.de/sid/gkv/kvid-10').value.first()` |
| `local_id` | string |  | Local patient ID (BIH/Charité). Optional, site-specific. | CS: patient-id | `identifier.where(system='http://fhir.bih-charite.de/sid/patient-id').value.fi…` |
| `family` | string |  | Surname (use=official). |  | `name.where(use='official').family.first()` |
| `given` | string |  | First name (use=official, first given name). |  | `name.where(use='official').given.first()` |
| `maiden_name` | string |  | Birth name (use=maiden), optional. |  | `name.where(use='maiden').family.first()` |
| `gender` | string |  | Administrative gender (FHIR AdministrativeGender: male/female/other/unknown). |  | `gender` |
| `birth_date` | string |  | Date of birth (ISO-8601, day precision). |  | `birthDate` |
| `deceased_date` | string |  | Date of death, if documented. Empty if the patient is alive. |  | `deceasedDateTime` |
| `city` | string |  | City of residence (first address). |  | `address.city.first()` |
| `postal_code` | string |  | Postal code (first address). |  | `address.postalCode.first()` |
| `country` | string |  | Country (ISO 3166). |  | `address.country.first()` |

#### Senologie Procedure Flat View

- **View ID:** `senologie-procedure-flat`
- **Resource:** `Procedure`
- **Description:** All Senologie procedures (surgery, radiotherapy, systemic therapy) as a flat table. One row per Procedure with patient, diagnosis reference, code (SCT + OPS sub-procedures as a second coding), date, status, R-status, and intent. Sub-procedures with partOf.exists()=true are included — for surgical report aggregation see downstream SQL.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `procedure_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `reasonReference.first().id` |
| `part_of_id` | string |  | If set = sub-procedure, otherwise main procedure. |  | `partOf.first().id` |
| `code_sct` | code |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').code.first()` |
| `code_sct_display` | string |  |  | CS: SNOMED CT | `code.coding.where(system='http://snomed.info/sct').display.first()` |
| `code_ops` | code |  |  | CS: ops | `code.coding.where(system='http://fhir.de/CodeSystem/bfarm/ops').code.first()` |
| `code_text` | string |  |  |  | `code.text` |
| `status` | string |  |  |  | `status` |
| `performed_date` | dateTime |  |  |  | `performedDateTime` |
| `performed_start` | string |  |  |  | `performedPeriod.start` |
| `performed_end` | string |  |  |  | `performedPeriod.end` |
| `outcome` | code |  | R-status or other outcome code (R0/R1/R2/RX). |  | `outcome.coding.code.first()` |
| `intention` | code |  |  |  | `extension.where(url='https://www.medizininformatik-initiative.de/fhir/ext/mod…` |
| `category` | code |  |  |  | `category.coding.code.first()` |
| `profile` | string |  | Which Senologie profile (operation/strahlentherapie/systemtherapie-procedure). |  | `meta.profile.first()` |

#### Senologie TNM Flat View

- **View ID:** `senologie-tnm-flat`
- **Resource:** `Observation`
- **Description:** TNM classification observations (clinical c / pathological p) as a flat table. One row per TNM observation with all components T/N/M/L/V/Pn/G and UICC stage. Based on the MII Onko TNM classification profile.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `observation_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `focus.first().id` |
| `tnm_typ` | code |  | 21908-9=cTNM, 21902-2=pTNM. | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `t_kategorie` | code |  |  |  | `component.where(code.coding.code='21905-5').valueCodeableConcept.coding.code.…` |
| `n_kategorie` | code |  |  |  | `component.where(code.coding.code='21906-3').valueCodeableConcept.coding.code.…` |
| `m_kategorie` | code |  |  |  | `component.where(code.coding.code='21907-1').valueCodeableConcept.coding.code.…` |
| `l_kategorie` | code |  |  |  | `component.where(code.coding.code='33739-4').valueCodeableConcept.coding.code.…` |
| `v_kategorie` | code |  |  |  | `component.where(code.coding.code='33740-2').valueCodeableConcept.coding.code.…` |
| `pn_kategorie` | code |  |  |  | `component.where(code.coding.code='92837-4').valueCodeableConcept.coding.code.…` |
| `r_symbol` | code |  |  |  | `component.where(code.coding.code='33742-8' or code.coding.code='r-symbol').va…` |
| `uicc_stage` | code |  |  | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').code.first()` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |
| `status` | string |  |  |  | `status` |

#### Senologie Tumour Board Flat View

- **View ID:** `senologie-tumorboard-flat`
- **Resource:** `CarePlan`
- **Description:** Tumour board (Tumorboard) recommendations (CarePlan) as a flat table. Each activity within a CarePlan is joined as its own row — this view is the header table; detail analysis via SQL JOIN on forEach activity.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `careplan_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `addresses.first().id` |
| `status` | string |  |  |  | `status` |
| `intent` | string |  |  |  | `intent` |
| `period_start` | string |  |  |  | `period.start` |
| `title` | string |  |  |  | `title` |
| `description` | string |  |  |  | `description` |
| `note_text` | string |  |  |  | `note.text.first()` |
| `activity_kind` | string |  |  |  | `detail.kind` |
| `activity_code_sct` | code |  |  | CS: SNOMED CT | `detail.code.coding.where(system='http://snomed.info/sct').code.first()` |
| `activity_code_display` | string |  |  | CS: SNOMED CT | `detail.code.coding.where(system='http://snomed.info/sct').display.first()` |
| `activity_status` | string |  |  |  | `detail.status` |
| `activity_empfehlung_status` | code |  | Recommended / conditionally recommended / not recommended / not discussed. | CS: tumorboard-empfehlung | `detail.statusReason.coding.where(system='https://www.senologie.org/fhir/CodeS…` |
| `activity_description` | string |  | Rationale of the tumour board. |  | `detail.description` |

#### Senologie Follow-Up Flat View

- **View ID:** `senologie-verlauf-flat`
- **Resource:** `Observation`
- **Description:** Follow-up observations (LOINC 88040-1 Response to cancer treatment) as a flat table. RECIST response + tumour evidence status + lymphoedema grade + performance status per follow-up visit.

| Column | Type | Card. | Meaning | Code System / Binding | FHIRPath |
|---|---|---|---|---|---|
| `observation_id` | string |  |  |  | `id` |
| `patient_id` | string |  |  |  | `subject.getReferenceKey(Patient)` |
| `diagnose_id` | string |  |  |  | `focus.first().id` |
| `code_loinc` | code |  |  | CS: LOINC | `code.coding.where(system='http://loinc.org').code.first()` |
| `response_sct` | code |  | RECIST response (CR/PR/SD/PD). | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').code.first()` |
| `response_display` | string |  |  | CS: SNOMED CT | `valueCodeableConcept.coding.where(system='http://snomed.info/sct').display.fi…` |
| `lokoregionaer_recurrence` | code |  |  |  | `component.where(code.coding.code='395709001').valueCodeableConcept.coding.cod…` |
| `metastasen_status` | code |  |  |  | `component.where(code.coding.code='373572006').valueCodeableConcept.coding.cod…` |
| `effective_date` | dateTime |  |  |  | `effectiveDateTime` |
| `status` | string |  |  |  | `status` |
