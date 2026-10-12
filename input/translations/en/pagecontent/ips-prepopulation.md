### IPS/EPS Pre-population

This chapter documents which data points of the senological documentation can potentially be pre-populated from an **International Patient Summary (IPS)** or **European Patient Summary (EPS)**.

#### Background

The general medical history (Allgemeine Anamnese) collected at a breast centre encompasses extensive data on pre-existing conditions, medication, allergies, and social background. For patients who already have a digital health record, much of this information is available in structured form — in particular through the IPS, which is standardised as a FHIR document (Bundle).

Pre-populating (Prepopulation) these fields can:
- **Reduce documentation burden** for clinicians and patients
- **Improve data quality** (coded diagnoses instead of free text)
- **Support international patients** whose prior findings are provided via the EPS

#### Pre-population Model

Pre-population is **non-deterministic** — it supplies suggestions that must be clinically confirmed or corrected:

- IPS data may be outdated or at varying levels of granularity
- The clinical question is often more specific than the IPS documentation (e.g. "hypertension" vs. "which cardiovascular condition exactly?")
- Coding systems may differ (IPS: ICD-10-WHO/SNOMED CT, documentation system: sometimes local codes)

Technically, pre-population can be implemented via `sdc-questionnaire-initialExpression` (FHIRPath) within an SDC Questionnaire.

#### Mapping: Anamnesis Fields → IPS Sections

##### Fully pre-populatable

| Anamnesis Data Point | IPS Section | IPS Resource | Note |
|---|---|---|---|
| Pre-existing conditions (cardiovascular, respiratory, vascular, neurology, gastrointestinal, dermatology, rheumatology, renal/urogenital, psychiatry, infections, cancer) | Past Illness History | Condition | IPS contains active and resolved diagnoses. Granularity may differ. |
| Allergies | Allergies and Intolerances | AllergyIntolerance | **Mandatory IPS section** — always present. |
| Regular medication (current medication) | Medications | MedicationStatement | **Mandatory IPS section**. In the ePA (German electronic patient record) available via the **ePA medication list (eML)**, the **federal medication plan (Bundesmedikationsplan, BMP)**, and aggregated **e-prescription dispensations**. Current medication (e.g. metoprolol, L-thyroxine) need not be recorded at the breast centre but can be imported from the ePA/HIS. |
| Prior surgeries | Procedure History | Procedure | Coded using SNOMED CT or OPS. |
| Pregnancy (current) | Pregnancy | Observation | IPS section with status and expected date of delivery. |
| Implants (metal, MRI compatibility) | Medical Devices | DeviceUseStatement | IPS section for active implants. |
| Height, weight, BMI | Vital Signs | Observation | IPS section. Check currency. |
| Smoking status | Social History | Observation | IPS section. Level of detail (pack-years, cigarettes per day) varies. |
| Advance directive / lasting power of attorney | Advance Directives | Consent | IPS section. Verify content and validity. |

##### Partially pre-populatable

| Anamnesis Data Point | IPS Section | Limitation |
|---|---|---|
| Alcohol consumption | Social History | IPS has Social History, but not AUDIT-C level of detail |
| Drug use | Social History | IPS has substance use, but not in specific detail |
| General condition (ECOG) | Functional Status | IPS has functional status, but not necessarily ECOG |
| Coagulation disorder | Past Illness History | Present as Condition, but detail questions (gum bleeding, post-procedural bleeding) are absent |
| Sex at birth | Patient | `Patient.gender` or birth-sex extension — semantics may differ |

##### Not pre-populatable (not in IPS)

| Anamnesis Data Point | Reason |
|---|---|
| Menopausal status | Not in IPS — captured in the senology module via the gynaecological history |
| Level of education | Sociodemographic, not in IPS |
| Relationship status | Sociodemographic, not in IPS |
| Living situation | Sociodemographic, not in IPS |
| Employment status | Sociodemographic, not in IPS |
| Care dependency level (Pflegegrad) | Germany-specific, not in IPS |
| Social stressors | Not standardised |
| Hearing/visual impairment | No dedicated IPS section |
| Detail questions (e.g. NYHA severity in heart failure, diabetic end-organ damage) | IPS provides the diagnosis, but not the clinical level of detail |

#### Implications for the IG

{:.stu-note}
The general medical history (Allgemeine Anamnese) is deliberately **out of scope** for profiling in this module. The data points are not senology-specific and should be sourced from overarching systems (IPS/EPS, HIS master data). The senology module defines only the **senology-specific** history profiles (gynaecological history, family history).

In the medium term, pre-population via IPS should be implemented as an SDC feature:

```
// Example: Pre-populating allergies from IPS
* item[+]
  * linkId = "allergien"
  * text = "Haben Sie Allergien?"
  * type = #choice
  * extension[sdc-questionnaire-initialExpression].valueExpression
    * language = #text/fhirpath
    * expression = "%patient.reverseResolve(AllergyIntolerance.patient).exists()"
```

#### Relevant Standards

Several sources are relevant for pre-population:

| Standard | Description | Relevance |
|---|---|---|
| **HL7 IPS** | International Patient Summary — global standard for patient summaries | International patients, research context |
| **European Patient Summary (EPS)** | EU-wide implementation via eHDSI/MyHealth@EU | European patients, cross-border care |
| **MIO Patientenkurzakte (PKA)** | German IPS implementation by KBV/mio42 for the ePA | **Primary source** for German patients — contains diagnoses, medication, allergies, procedures, implants |
| **ePA Medication List** | Federal medication plan within the ePA | Medication pre-population |
| **HL7 SDC Population** | SDC mechanisms for questionnaire pre-population | Technical implementation |

The MIO PKA (Patientenkurzakte / emergency data record) is specified as the German IPS implementation but has so far seen limited adoption in practice. ePA 3.0 (opt-out, from 2025 onwards) provides the infrastructural foundation, though broad population of the record by HIS and PVS systems is still lacking. For referred patients and new patients, the ePA would be the natural channel; in practice, prior findings currently arrive predominantly as physician-letter PDFs.

In the long term, the **DE Base Profiles**, **ISiK**, and the **ePA specification** will standardise pre-population. This module does not define its own pre-population logic but merely documents which fields are in principle pre-populatable — the technical implementation is governed by the overarching standards.

#### References

- [HL7 IPS Implementation Guide](http://hl7.org/fhir/uv/ips/)
- [European Patient Summary (EPS) — eHDSI](https://art-decor.ehdsi.eu/publication/epSOS/)
- [KBV MIO Patientenkurzakte](https://mio.kbv.de/display/PKA/)
- [HL7 SDC — Questionnaire Population](http://hl7.org/fhir/uv/sdc/populate.html)
