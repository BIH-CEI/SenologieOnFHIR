The **BIH Senologie Begleitmedikation** profile records the concomitant medication of a breast cancer patient — that is, current long-term and other medications that are **not** part of the oncological systemic therapy (e.g., antihypertensives, thyroid hormones, anticoagulants).

This profile constrains the base FHIR [`MedicationStatement`](https://hl7.org/fhir/R4/medicationstatement.html) resource. `MedicationStatement` is the appropriate choice because it captures a patient's reported or inferred use of a medication over time, without implying that the medication was prescribed or dispensed as part of the current episode of care — which matches the nature of pre-existing concomitant medication documented at initial assessment or during follow-up.

The following elements are marked **Must Support**:

- `status` — indicates whether the statement is active, completed, or entered-in-error.
- `medication[x]` — restricted to `CodeableConcept`; preferred coding uses SNOMED CT (pharmaceutical/biologic product hierarchy, `isa/373873005`, extensible binding); free-text description via `.text` is also Must Support.
- `subject` — mandatory (1..1) reference to the `Patient`; no other subject types are permitted.
- `effective[x]` — restricted to `Period` to capture the medication intake interval.
- `dosage` and `dosage.doseAndRate` — structured dosage information; free-text dosage schema via `dosage.text` is supported.
- `dateAsserted` — the date on which the medication statement was recorded.

In the breast cancer care pathway, this profile is relevant at every stage where a complete medication picture is needed: initial staging workup, pre-operative assessment, systemic therapy planning, and survivorship follow-up. Documenting concomitant medication is essential for identifying drug interactions with chemotherapy or endocrine therapy, assessing comorbidity burden, and ensuring continuity of care across treating disciplines.
