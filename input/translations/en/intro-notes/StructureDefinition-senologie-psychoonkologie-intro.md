This profile represents whether a breast cancer patient received psycho-oncological support during their care episode, corresponding to data element KB-9 in the BIH Senologie OncoBox dataset.

The profile constrains the base FHIR `Procedure` resource because psycho-oncological co-treatment is a clinical intervention that either occurred or was explicitly not performed — a distinction that `Procedure.status` captures naturally. A `status` of `completed` combined with a `performedDateTime` records that the patient was connected to psycho-oncological services; a `status` of `not-done` records that no such referral took place. The procedure code is fixed to SNOMED CT **75516001 "Psychotherapy (procedure)"** to ensure consistent identification across systems.

Key must-support elements are:

- **`status`** — required; `completed` signals that psycho-oncological support was provided (OncoBox value 1 = yes), `not-done` signals it was not (OncoBox value 0 = no).
- **`code`** — fixed to SCT#75516001; no other coding is expected.
- **`performedDateTime`** — the date of the patient's first psycho-oncological contact (OncoBox field `Psych_Datum`); only populated when `status = completed`.
- **`subject`** — constrained to `Patient`; links the procedure record to the patient under treatment.
- **`reasonReference`** — references the associated oncological diagnosis, enabling traceability back to the primary condition that prompted the referral.

Within the breast cancer care pathway this profile sits in the supportive-care domain alongside other psychosocial and rehabilitative interventions. Systems that ingest OncoBox export data should map the binary KB-9 flag to `Procedure.status` and, when the flag is positive, populate `performedDateTime` from `Psych_Datum` to preserve the timing of the initial contact.
