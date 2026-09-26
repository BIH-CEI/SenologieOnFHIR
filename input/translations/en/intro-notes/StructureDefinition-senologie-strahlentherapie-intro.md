The **BIH Senologie Strahlentherapie** profile captures a completed radiotherapy procedure administered as part of breast cancer treatment, including loco-regional irradiation, boost irradiation, and any simultaneous radiochemotherapy.

This profile constrains the German MII Oncology parent profile [`MII_PR_Onko_Strahlentherapie_Bestrahlung_Strahlentherapie`](https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/), which itself derives from the base FHIR [`Procedure`](https://hl7.org/fhir/R4/procedure.html) resource. `Procedure` is the appropriate resource type because radiotherapy is an active therapeutic intervention with a defined time period, target site, and dosimetric parameters — all of which map naturally to Procedure's structure. The MII parent supplies the core oncology extensions for total dose, boost, and application method; this profile inherits those and adds breast-cancer-specific constraints and extensions for the senology data model.

The following elements are marked **Must Support** or carry notable constraints:

- `status` — fixed to `#completed`; only fully delivered radiation courses are documented in this profile.
- `code` — identifies the radiotherapy type (e.g., external beam, brachytherapy); free-text description via `.text` is also supported.
- `subject` — mandatory reference to the patient.
- `bodySite` — records the irradiated region (e.g., breast, chest wall, lymph node regions); laterality is captured via the inherited `bodySite` extension `Seitenlokalisation`.
- `reasonReference` — links the procedure to the underlying oncological diagnosis.
- `partOf` — enables grouping of individual fraction-level records under a parent radiotherapy session.
- Extension `Intention` (MII) — treatment intent: adjuvant, neoadjuvant, or palliative.
- Extension `sessionCount` (Senologie) — total number of fractions delivered.
- Extension `einzeldosis` (Senologie) — dose per fraction in Gy, corresponding to OncoBox field H10.
- Extension `simultaneRadiochemotherapie` (Senologie) — boolean flag indicating concurrent systemic chemotherapy, corresponding to OncoBox field H03.

In the breast cancer care pathway, this profile is used in the treatment and follow-up phases. It supports documentation of post-operative adjuvant radiotherapy to the breast or chest wall, nodal irradiation, and — where applicable — neoadjuvant or palliative regimens. Together with the systemic therapy and surgery profiles, it provides a complete procedural record for multidisciplinary tumor board review, quality indicator reporting, and longitudinal outcomes research.
