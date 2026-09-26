This profile represents a breast cancer follow-up (surveillance) report, capturing structured post-treatment status information as required by the German oncology data set (oBDS) and the BIH Senologie OncoBox data model (fields M01–M08).

The profile constrains `MII_PR_Onko_Verlauf` (the MII Oncology Follow-Up Observation), which itself derives from FHIR `Observation`. Basing the profile on that parent allows direct reuse of the MII-defined tumor-status components (local tumor, lymph node, and distant metastasis response) without re-defining the underlying slice logic, while extending it with breast-cancer-specific constraints for follow-up type and second primary tumor.

Key must-support elements include:

- **`effectiveDateTime`** (M01) — the examination or reporting date for the follow-up visit.
- **`performer`** (M02) — the reporting clinician or institution; constrained to `Practitioner` or `Organization`.
- **`method`** (M03) — the type of follow-up surveillance, bound (required) to `VS_Senologie_Nachsorge_Art`, distinguishing active (in-person) from passive (registry/record-based) follow-up.
- **`focus`** — a must-support reference to the associated `Senologie_Diagnose_Maligne` condition, linking the status report back to the primary breast cancer diagnosis; mandatory for bilateral cases to indicate laterality.
- **`valueCodeableConcept`** (D27) — the overall tumor response assessment (CR, PR, NC/SD, progression, etc.), inherited from the MII parent.
- **`component[Tumor_Verlauf]`**, **`component[Lymphknoten_Verlauf]`**, **`component[Fernmetastasen_Verlauf]`** (M05–M07) — organ-specific tumor-status components, inherited from `MII_PR_Onko_Verlauf` and marked must-support here.
- **`component[zweittumor]`** (M08) — a breast-cancer-specific extension slice indicating whether a second primary tumor was diagnosed (bound to `VS_Senologie_Zweittumor`). When affirmative, the tumor details (ICD code, date) are recorded as a separate `Condition` resource rather than inline.

In the breast cancer care pathway this profile sits in the post-definitive-therapy phase, covering both structured surveillance visits and end-of-treatment status assessments. Vital status (M04) is conveyed via `Patient.deceased[x]` rather than this Observation, and any confirmed second primary tumor (M09–M10) is documented as an independent `Condition`, keeping this resource focused solely on the periodic response evaluation.
