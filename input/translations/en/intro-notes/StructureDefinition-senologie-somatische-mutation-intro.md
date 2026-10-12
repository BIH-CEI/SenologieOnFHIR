This profile represents the somatic mutation status of the tumor suppressor genes BRCA1, BRCA2, and PALB2 as determined from tumor tissue in the context of breast cancer diagnostics.

The profile constrains `MII_PR_Onko_Genetische_Variante`, the German MII oncology profile for genetic variants, which itself is derived from the HL7 FHIR `Observation` resource. Using `Observation` is appropriate here because somatic mutation testing yields a discrete laboratory finding — a gene-specific result with a defined interpretation — that is recorded at a specific point in time and linked to a biological specimen from the patient's tumor.

The following elements are marked Must Support and carry specific clinical meaning in this context:

- **`code`** — Fixed to LOINC 69548-6 ("Genetic variant assessment"), identifying this as a structured variant observation.
- **`component[gene-studied]`** — Specifies which gene was examined (BRCA1, BRCA2, or PALB2) using a coded value inherited from the parent profile.
- **`interpretation`** — Captures the result category: mutation detected (M), wildtype (W), indeterminate (N), or unknown (U).
- **`specimen`** — Links the result to the tumor sample, distinguishing somatic findings from germline findings recorded elsewhere in the IG.
- **`effectiveDateTime`** — Records when the test was performed, supporting longitudinal tracking across treatment phases.

Within the breast cancer care pathway, this profile is used during the molecular characterization phase following initial diagnosis or at disease progression. Somatic BRCA1/2 and PALB2 status from tumor tissue informs eligibility for PARP inhibitor therapy and complements germline variant data (represented by the `senologie-keimbahnmutation` profile). Implementers should link instances of this profile to the corresponding tumor specimen and to the patient's overall molecular panel using standard FHIR references.
