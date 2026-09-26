The **BIH Senologie Geplante Systemtherapie** profile captures a planned systemic therapy — such as a chemotherapy, targeted therapy, or endocrine therapy regimen — that has been decided upon in a multidisciplinary tumor board or treatment planning context but not yet actively prescribed or administered.

This profile constrains the base FHIR [`MedicationRequest`](https://hl7.org/fhir/R4/medicationrequest.html) resource. `MedicationRequest` is the appropriate choice because it models the intent to prescribe or administer a medication; the fixed values `status = #draft` and `intent = #plan` unambiguously signal that the record represents a planning artefact rather than an active order, distinguishing it from medication orders issued during the course of treatment.

The following elements are marked **Must Support** or carry noteworthy constraints:

- `status` — fixed to `#draft`; indicates that the therapy plan is not yet active.
- `intent` — fixed to `#plan`; signals a treatment planning record rather than a finalized order.
- `medicationCodeableConcept` — the planned substance or drug; structured coding of individual agents or regimen components.
- `subject` — restricted to a `Patient` reference; no other subject types are permitted.
- `reasonReference` — reference to the associated `Condition` resource (the breast cancer diagnosis) that drives the therapy decision.
- `courseOfTherapyType` — encodes the planned therapy protocol or schema (e.g., AC-T, EC-D, CMF); replaces a former custom extension.
- `dosageInstruction` — supports structured dosage including planned administration rhythm (`timing`) and planned dose (`doseAndRate`).
- `extension[therapyLine]` — a Senologie-specific extension recording the therapy line (first-line, second-line, etc.), relevant for metastatic settings.
- `reasonCode` — captures the therapeutic intention (neoadjuvant, adjuvant, palliative, curative) as a coded or free-text value.

In the breast cancer care pathway, this profile sits at the intersection of tumor board decision-making and clinical execution. It is populated when the multidisciplinary team agrees on a systemic treatment plan — typically after staging and receptor profiling — and serves as the upstream source for downstream `MedicationRequest` (active order) or `MedicationAdministration` resources. Linking the plan to the diagnosis via `reasonReference` and to the therapy line via the `therapyLine` extension enables traceability across the full treatment history, from initial neoadjuvant intent through adjuvant completion and into palliative lines.
