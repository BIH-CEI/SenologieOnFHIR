This profile represents a benign breast diagnosis documented in the context of senological care, covering non-malignant conditions such as benign breast neoplasms (ICD-10-GM D24), fibrocystic and other non-inflammatory breast disorders (N60–N64), and inflammatory breast diseases.

The profile constrains the base FHIR `Condition` resource. `Condition` is the appropriate resource for diagnoses that are recorded, tracked, and communicated as part of a patient's clinical record. This profile is intentionally scoped to benign conditions and therefore omits constraints specific to oncology workflows — there is no staging, no cancer-registry confirmation level (`Diagnosesicherung`), and no oBDS mapping.

**Key must-support elements:**

- `code` (1..1 MS): The diagnosis code is mandatory and supports four named slices — ICD-10-GM (primary coding for German hospital systems), SNOMED CT (clinical terminology), ICD-11 (optional dual-coding for future readiness), and a Senologie-specific local code. At least one coding representation should be present.
- `subject` (1..1 MS): A direct reference to the `Patient` resource; no other subject types are permitted.
- `bodySite` (MS): Captures laterality (left / right breast), which is clinically essential even for benign findings.
- `clinicalStatus` and `verificationStatus` (MS): Indicate whether the condition is active, resolved, or provisional — important for differential diagnosis workflows in breast care units.
- `encounter` (MS): Links the diagnosis to the hospital encounter, enabling ISiK-compatible hospital interoperability.
- `onset[x]` and `recordedDate` (MS): Support temporal tracking of inflammatory or chronic conditions.

Within the breast cancer care pathway, this profile addresses the large subset of patients who are referred for breast imaging or biopsy but ultimately receive a benign diagnosis. It provides a lightweight, ISiK-compatible representation suitable for use in hospital information systems, discharge documentation, and cross-institutional data exchange where cancer-registry obligations do not apply. Systems handling malignant diagnoses should use the corresponding oncology-specific Condition profile from this Implementation Guide.
