This page documents open design and modelling questions on which feedback is sought during the balloting process.

### How can I provide feedback?

Feedback on the open questions can be submitted via [GitHub Issues](https://github.com/BIH-CEI/SenologieOnFHIR/issues). Please reference the relevant question number.

---

### OF-1: Encounter Model and EpisodeOfCare

{:.stu-note}
Should the Senology module define its own Encounter profile or reference ISiK (ISiKKontaktGesundheitseinrichtung)?

Treatment at a breast centre typically encompasses **multiple contacts** of different types:

- Initial outpatient presentation (breast outpatient clinic)
- Imaging appointments
- Biopsy
- Tumour board (Tumorkonferenz)
- Inpatient stay (surgery)
- Day clinic (chemotherapy)
- Outpatient radiotherapy
- Follow-up appointments

These contacts carry different `Encounter.class` values (outpatient, inpatient, partial inpatient) and could be linked by an **EpisodeOfCare** ("breast carcinoma treatment episode") as an overarching umbrella.

**Open sub-questions:**
- Does the IG require an EpisodeOfCare profile, or does the diagnosis (Condition) serve as an implicit umbrella?
- Is ISiKKontaktGesundheitseinrichtung sufficient as an Encounter profile, supplemented by an extension for initial/follow-up presentation?
- ISiK does not define an EpisodeOfCare profile — is this a gap or a deliberate decision?

**Implication for the centre case / index case (OncoBox D01):**
OnkoZert certification requires classification of the **index case** (primary case vs. recurrence vs. centre case). Follow-up events (local recurrence, distant metastasis, second tumour) always refer to this index case. Without EpisodeOfCare, the explicit link between Encounter and the index Condition is missing. Currently, the primary case type in the tumour data set (SM) is derived from the ICD-10 prefix (C50 → invasive, D05 → DCIS), which is insufficient for recurrence cases (also coded C50).

**External project:** The modelling of EpisodeOfCare for oncology is currently being developed in a separate project. Once an EpisodeOfCare profile is available, it can be used as an umbrella for index case, follow-up, and centre-case assignment.

---

### OF-2: Outpatient Clinic Type and Billing Context

{:.stu-note}
Which billing context applies to breast outpatient clinics, and how does this affect Encounter modelling?

Breast centres frequently operate a breast outpatient clinic that may be organised differently depending on the institution:

- **University hospital outpatient clinic** (Hochschulambulanz, §117 SGB V)
- **Authorised outpatient clinic** (Ermächtigungsambulanz)
- **Ambulatory specialised care** (Ambulante Spezialfachärztliche Versorgung, ASV)
- **Institute outpatient clinic** (Institutambulanz)

Each type has its own billing rules and influences which `Encounter.class` and Account structures are used. This question needs to be clarified with the participating breast centres.

---

### OF-3: Medication Documentation — Profile Architecture and Scope Delimitation

{:.stu-note}
How should antineoplastic medication and concomitant medication be profiled, and which base profiles should they inherit from?

#### Clinical scope delimitation

The correct distinction is not "systemic therapy vs. concomitant medication" but rather:

- **Antineoplastic medication** — everything directed against the tumour: chemotherapy, endocrine therapy (tamoxifen, aromatase inhibitors), targeted therapy (trastuzumab), immunotherapy, antiresorptive therapy. This medication is **subject to oBDS reporting**, regardless of whether it is administered over months or years.
- **Other medication** — pre-existing conditions (antihypertensives, thyroid hormones), supportive therapy (antiemetics, G-CSF), and other long-term medication. Not subject to reporting.

#### Inheritance question

For antineoplastic medication, the current profile inherits from `MII_PR_Onko_Systemische_Therapie_Medikation` — this ensures oBDS conformance.

For other medication, the inheritance chain is unclear:

- **Option A)** Base FHIR MedicationStatement
- **Option B)** DE Base Profile Medication (DE Basisprofil Medikation)
- **Option C)** ISiK MedicationStatement
- **Option D)** No dedicated profile — concomitant medication is outside the scope of this module

**Open sub-questions:**
- Should the current `Systemtherapie_Medikation` profile be renamed to `Antineoplastische_Medikation`?
- Does supportive therapy (antiemetics, G-CSF) belong to antineoplastic or other medication?
- From which base profile should other medication inherit?

---

### OF-4: Gene Expression Tests — Coding as DeviceDefinition?

{:.stu-note}
Should gene expression tests (Oncotype DX, MammaPrint, Prosigna, EndoPredict) be modelled as DeviceDefinition rather than as a local CodeSystem?

These tests are **commercially regulated IVD medical devices** with a manufacturer, model designation, and potentially a UDI-DI. Currently the tests are coded via a local CodeSystem.

**Arguments for DeviceDefinition:**
- Clinically correct — IVD tests are medical devices
- Manufacturer and product information can be represented in a structured manner

**Arguments for the status quo (CodeSystem):**
- DeviceDefinition is at maturity level 0 in R4
- For the clinical use case (score + risk class), a code is sufficient

---

### OF-5: Drug Terminology and ASK Integration

{:.stu-note}
Is the ConceptMap SNOMED CT → ASK (Arzneistoffkatalog, German Drug Substance Catalogue) required?

The module contains ConceptMaps for SNOMED CT → ATC and SNOMED CT → ASK. The ASK integration was created as a proof of concept.

**Open sub-questions:**
- Is ASK required as a target terminology, or is ATC sufficient?
- Should the ConceptMaps be normative or informative?

---

### OF-6: PRO-CTCAE and CTCAE — Scope Delimitation

{:.stu-note}
How does patient-reported adverse event capture (PRO-CTCAE) relate to clinician-reported CTCAE documentation?

There is **no official mapping** from PRO-CTCAE to CTCAE grade. Clinician-reported CTCAE documentation is represented as a Senology profile (subject to oBDS reporting); PRO-CTCAE is covered through the MII PRO module. A mapping is outside the scope of this IG.

---

### OF-7: Prior Tumour Diseases — Scope and Profile Selection

{:.stu-note}
Should prior tumour diseases within the senology scope be explicitly represented?

Anamnestically recorded prior conditions are typically sourced from the general patient history (HIS) rather than from senology-specific documentation.

**Open sub-questions:**
- Should the IG reference the MII Onco profile `mii-pr-onko-fruehere-tumorerkrankung` or is this outside the scope?
- Should capture occur via a form field in the initial history or only as an ETL transfer from the HIS?

---

### OF-8: Neoadjuvant Therapy — Structured ycTNM and ypTNM

{:.stu-note}
How is the follow-up TNM classification recorded in a structured manner in the neoadjuvant setting?

In neoadjuvant systemic therapy, TNM classification with the `y` prefix is subject to reporting:

- **ycTNM**: clinical staging AFTER neoadjuvant therapy, BEFORE surgery
- **ypTNM**: pathological staging AFTER surgery (e.g. ypT0 ypN0 in the case of pCR)

**Open sub-questions:**
- Should the test data be supplemented with structured cTNM and ypTNM Observations?
- How is the sequence (cTNM → ycTNM → ypTNM) represented temporally when a Condition passes through multiple staging steps?

---

### OF-9: Structuring Radiotherapy Documentation

{:.stu-note}
Are there existing preparatory works for the structured representation of radiotherapy in the German context?

The current radiotherapy documentation in the Senology IG is limited to a simple Procedure profile containing total dose, single dose, number of fractions, and target volume. Radiotherapy is typically administered externally, and the data are not primarily available in structured form at the breast centre.

For more detailed structuring, the [HL7 CodeX Radiation Therapy IG](https://build.fhir.org/ig/HL7/codex-radiation-therapy/branches/master/en/overview.html) could serve as a reference. This US IG maps radiation treatment plans, phases, fractionation schemes, and dose distributions in detail.

**Open sub-questions:**
- Are there German preparatory works on FHIR-based radiotherapy documentation (e.g. in the MII context)?
- What level of detail is required for senology reporting vs. what is "nice to have"?
- Can the CodeX RT IG be adapted as an international reference, or are the requirements too different?
