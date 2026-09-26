# Use Case: Data Capture

### Overview

Data capture in the Senology Core Dataset follows the **Form-First principle**: clinical documentation is performed via structured SDC Questionnaires that reflect familiar clinical workflows. In the background, form data is automatically transformed into domain-based FHIR resources through **template-based extraction**.

Each form contains one or more **Blueprints** — contained FHIR resources that serve as templates for extraction. A single form can thus generate multiple target resources simultaneously (e.g. a Procedure and an Observation from a surgical report).

### Clinical Workflow

Documentation follows the clinical care pathway. The diagnosis serves as the anchor point to which all subsequent findings and therapies are linked:

<div>
<img src="erfassung-workflow.svg" alt="Klinischer Erfassungsworkflow" style="width:100%"/>
<p><em>Clinical documentation workflow — from diagnosis through findings and therapy to follow-up care</em></p>
</div>

### How a Form Works

Each form passes through four phases when opened and completed:

<div>
<img src="erfassung-formular-phasen.svg" alt="Vom Formular zu FHIR-Ressourcen: 4 Phasen" style="width:100%"/>
<p><em>From form to FHIR resources — context selection, pre-population, documentation, and template-based extraction</em></p>
</div>

**Phase 1 — Context Selection:** When a form is opened, the patient and encounter context is passed (`launchContext`). For findings and therapies, the user selects the **reference diagnosis** (and, if applicable, the reference procedure) — ensuring that every piece of documentation is unambiguously linked to a diagnosis.

**Phase 2 — Pre-population:** Existing patient data is automatically loaded into the form via `initialExpression` (FHIRPath) — e.g. name, date of birth, previously recorded diagnoses. This avoids duplicate data entry and ensures consistency.

**Phase 3 — Documentation:** The clinician documents within the form. Context-dependent fields appear dynamically (`enableWhen`) — e.g. B3 detail type only for B3 lesions, implant query only for reconstruction. Terminology-bound answer lists (`answerValueSet`) ensure correct coding.

**Phase 4 — Template-based Extraction:** On submission, form data is transformed into FHIR resources via **Blueprints**. A Blueprint is a contained FHIR resource within the Questionnaire that acts as a template — with placeholders that are replaced by the form responses. A form can contain multiple Blueprints and thereby generate multiple resources simultaneously.

### Blueprints: From Form to FHIR Resources

A Blueprint is a **contained template** within the Questionnaire. It defines the structure of the target resource and uses `templateExtractValue` expressions to map form responses into the appropriate fields.

Example: The questionnaire *Postoperative Documentation* contains two Blueprints:

| Blueprint | Target Resource | Profile |
|---|---|---|
| `postop-procedure-template` | Procedure | [Senologie_Operation](StructureDefinition-senologie-operation.html) |
| `postop-komplikation-template` | Observation | [Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.html) |

The reference diagnosis is taken from the context selection and automatically written as `Procedure.reasonReference` into the generated resource.

### Forms

| Form | Clinical Context | Blueprints → Resources |
|---|---|---|
| [Initial History](Questionnaire-senologie-erstanamnese.html) | Admission, medical history, gynaecological history | Patient, Observation, FamilyMemberHistory |
| [Diagnosis](Questionnaire-senologie-diagnose.html) | Primary diagnosis, staging, localisation | Condition |
| [Clinical Examination](Questionnaire-senologie-klinische-untersuchung.html) | Breast examination, palpation findings, lymph node status | Observation |
| [Imaging](Questionnaire-senologie-bildgebung.html) | Mammography, sonography, MRI | DiagnosticReport, Observation |
| [Pathology](Questionnaire-senologie-pathologie.html) | Histology, receptor status, grading | DiagnosticReport, Observation, Specimen |
| [Tumour Board](Questionnaire-senologie-tumorboard.html) | Therapy recommendation, interdisciplinary conference | CarePlan |
| [Surgical Planning](Questionnaire-senologie-op-planung.html) | Preoperative planning, marking | ServiceRequest |
| [Postoperative](Questionnaire-senologie-postop.html) | Intra-/postoperative documentation | Procedure, Device, Observation |
| [Systemic Therapy](Questionnaire-senologie-systemtherapie.html) | Chemo, immuno, endocrine therapy | Procedure, MedicationStatement |
| [Radiotherapy](Questionnaire-senologie-strahlentherapie-quest.html) | Irradiation, dosing | Procedure |
| [Follow-up](Questionnaire-senologie-verlauf.html) | Aftercare, tumour status, follow-up | Observation |

### Form-First: Why?

The Form-First approach addresses a central problem of FHIR profiling in clinical practice:

- **Clinicians think in forms**, not in FHIR resources. A surgical report is a coherent document, not a collection of Procedures and Observations.
- **Forms ensure data quality** through validation, mandatory fields, and context-dependent display logic.
- **Blueprints make extraction transparent** — the target structure is visible as a contained resource within the Questionnaire, not hidden in external code.
- **Multiple resources from a single form** — one documentation step can generate any number of FHIR resources without the clinician being aware of it.
- **Reference diagnosis as a common thread** — all findings and therapies reference the diagnosis the clinician selects when opening the form.

### Technical Implementation

The Questionnaires use the following SDC features:

| Feature | Usage |
|---|---|
| `sdc-questionnaire-launchContext` | Patient and encounter context on opening |
| `sdc-questionnaire-initialExpression` | Pre-population with existing data (FHIRPath) |
| `sdc-questionnaire-templateExtract` | Reference to contained Blueprint(s) |
| `sdc-questionnaire-templateExtractValue` | Mapping form response → field in Blueprint |
| `enableWhen` / `enableBehavior` | Context-dependent display |
| `answerValueSet` | Terminology binding |

### Source System

The forms are defined as SDC Questionnaires and can be used in any FHIR-capable documentation system. The Core Dataset defines the FHIR target structure (profiles), the Blueprints (contained templates), and the terminology (ValueSets) — the interplay of these three components makes extraction fully reproducible.
