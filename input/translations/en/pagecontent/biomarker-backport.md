### Senology Biomarker Extensions — Backport Proposal for MII Oncology

This page documents the senology extensions to the MII Oncology breast receptor status / HER2 status profiles and proposes them as a backport into the MII Oncology core dataset (Kerndatensatz).

#### Background

From a clinical perspective, the binary positive/negative classification (oBDS slice) is insufficient to document current therapeutic subgroups such as **ER-low** and **HER2-low** (DESTINY-Breast04) in an evaluable way. International data on these subgroups are available from the USA and Sweden; comparable German analyses are not possible given the granularity of oBDS.

MII Oncology has partially recognised this problem and already provides a **guideline slice** as a second coding dimension:

| Profile | oBDS slice | Guideline slice |
|---|---|---|
| `MII_PR_Onko_Mamma_Rezeptorstatus_Estrogen` | positive / negative / unknown | positive / **low-positive** / negative |
| `MII_PR_Onko_Mamma_Rezeptorstatus_Progesteron` | positive / negative / unknown | positive / **low-positive** / negative |
| `MII_PR_Onko_Mamma_Her2neu_Status` | P / N / U | positive / **HER2-low** / **HER2-ultralow** / negative / equivocal |

→ ER-low and HER2-low are therefore **already representable in MII Oncology**, but not in the oBDS slice. We recommend marking the guideline slice as preferred (Must-Support in the senology profiles).

#### Senology Extensions Beyond MII Oncology

The following values are not currently provided in the MII Oncology receptor status profiles but are clinically relevant. The senology profiles add them as additional `Observation.component` slices and propose them as a backport:

| Component code (`CS_Senologie_Biomarker`) | Data type | Profile | Purpose |
|---|---|---|---|
| `irs-score` | Quantity (0–12, `{score}`) | ER, PR | Immunoreactive score (Remmele-Stegner; German standard) |
| `allred-score` | Quantity (0–8, `{score}`) | ER, PR | Allred score (international; S3 guideline) |

#### HER2 ISH Reflex Testing — Already Covered by MII MTB

Quantitative ISH reflex testing (FISH/CISH/DISH) is conceptually part of HER2 status, but in FHIR terms it belongs to the **MII Module MTB** (Molecular Tumour Board), not Oncology. MII MTB already provides a dedicated profile:

`MII_PR_MTB_INSITUHYBRIDIZATION_HER2` (based on LOINC panel 74885-5):
- `value[x]:valueRatio` → HER2/CEP17 ratio
- `component:target-signals` → ERBB2 signals per nucleus
- `component:reference-signals` → CEP17 signals per nucleus
- `component:cells-counted` → number of nuclei counted
- `component:gene-studied` → HGNC HER2/ERBB2

→ Senology defines **no** separate profile here — the HER2 IHC finding (`Senologie_HER2_Status`) references the MII MTB ISH observation via `Observation.hasMember` when a reflex test is performed following an IHC 2+ result.

#### Resulting Senology Profiles

- `Senologie_ER_Status` ← inherits `MII_PR_Onko_Mamma_Rezeptorstatus_Estrogen` (+ IRS, Allred)
- `Senologie_PR_Status` ← inherits `MII_PR_Onko_Mamma_Rezeptorstatus_Progesteron` (+ IRS, Allred)
- `Senologie_HER2_Status` ← inherits `MII_PR_Onko_Mamma_Her2neu_Status` (IHC component; references MII MTB ISH via `hasMember` when reflex testing is performed)

#### Backport Recommendations for MII Oncology

1. **Make the `AnteilPositiveZellen` component mandatory** when the guideline slice is used (otherwise ER-low cannot be derived).
2. **Add `IRS` and `Allred` components** to the MII Oncology receptor status profiles (analogous to the senology component slices).
3. **Mark the guideline slice as Must-Support** and recommend it as preferred in the profile documentation.
4. **Document the link to MII MTB ISH** in the MII Oncology HER2 profile documentation (workflow: IHC 0/1+/3+ → complete; IHC 2+ → ISH reflex via MII MTB).

These proposals were initiated by clinicians and are substantiated by clinical use cases (HER2-low T-DXd therapy, ER-low studies).
