This profile captures the numeric score result of a multigene expression assay used to guide adjuvant therapy decisions in early-stage, hormone receptor-positive breast cancer.

The profile constrains the base FHIR `Observation` resource because a gene expression test result is fundamentally a laboratory finding — a quantitative measurement derived from tumor tissue analysis. `Observation` provides the necessary structure for associating a coded test type, a numeric value with units, a specimen reference, and a reporting performer, all of which are required to represent these assay results unambiguously in a clinical information system.

Key must-support elements and constraints include:

- **`status`** is fixed to `#final`, ensuring only completed, validated results are exchanged.
- **`category`** is sliced to require the `laboratory` category code, classifying the observation within standard clinical workflows.
- **`code.coding`** carries two slices: a required local code from the `VS_Senologie_Genexpressionstest` value set identifying the specific assay (Oncotype DX, MammaPrint, Prosigna, or EndoPredict), and an optional LOINC code (e.g., LOINC 76544-6 for the Prosigna ROR Score where a standard code is available).
- **`valueQuantity`** is the only permitted value type; `valueQuantity.value` is required (1..1) and the unit is fixed to the UCUM dimensionless unit `{1}`, reflecting that each assay uses its own proprietary numeric scale (Oncotype DX 0–100, MammaPrint −1.0 to +1.0, Prosigna 0–100, EndoPredict continuous EPclin score).
- **`subject`** is required (1..1) and constrained to `Patient`.

Within the breast cancer care pathway, this profile sits in the post-surgery, pre-adjuvant-therapy decision phase. After primary surgical resection, gene expression profiling of the tumor specimen informs the multidisciplinary team's recommendation on chemotherapy benefit. Systems implementing this IG should link the `Observation` to the corresponding tumor specimen (`specimen`) and to the treatment plan resource that acts on the result.
