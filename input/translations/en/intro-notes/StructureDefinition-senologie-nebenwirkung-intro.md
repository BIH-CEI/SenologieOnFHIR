The **BIH Senologie Nebenwirkung** profile records an adverse event experienced by a breast cancer patient during systemic therapy, capturing the type of toxicity and its CTCAE severity grade.

This profile constrains the MII Oncology parent profile [`MII_PR_Onko_Nebenwirkung_Adverse_Event`](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-nebenwirkung-adverse-event), which itself derives from the base FHIR [`AdverseEvent`](https://hl7.org/fhir/R4/adverseevent.html) resource. `AdverseEvent` is the appropriate choice because it models unintended medical occurrences that are causally associated with a clinical intervention — precisely the pattern of treatment-related toxicities assessed during chemotherapy, targeted therapy, or other oncological systemic regimens. The profile inherits MedDRA coding of the adverse event type and CTCAE grade encoding from its MII parent, and adds Senologie-specific Must Support obligations and a mapping to the BIH Senologie Logical Model.

The following elements are marked **Must Support**:

- `actuality` — fixed to `#actual`; only documented, observed adverse events are recorded (not potential or theoretical risks).
- `event` — the adverse event type coded with MedDRA; identifies the specific toxicity (e.g., nausea, peripheral neuropathy, neutropenia).
- `subject` — mandatory reference to the affected `Patient`.
- `date` — the date on which the adverse event was assessed or recorded.
- `seriousness` — captures the CTCAE grade (1–5, U for unknown, K for not assessable), serving as the primary severity measure.
- `suspectEntity` and `suspectEntity.instance` — links the adverse event to the causative systemic therapy `Procedure`, enabling traceability from toxicity back to treatment.

In the breast cancer care pathway, this profile is relevant throughout the active treatment phase — particularly during neoadjuvant or adjuvant chemotherapy, targeted therapy (e.g., HER2-directed agents), and endocrine therapy. Structured toxicity documentation supports dose modification decisions, treatment discontinuation assessment, comparative effectiveness analyses across treatment cohorts, and longitudinal quality-of-care reporting.
