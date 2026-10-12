### SDC Condition Selection (Reference Diagnosis)

In patients with **synchronous bilateral breast carcinomas**, two active Condition resources exist with different laterality (`bodySite`). Every therapy documentation (surgery, systemic therapy, radiotherapy, tumour board (Tumorboard)) must select the specific reference diagnosis.

#### Pattern: SDC candidateExpression + choiceColumn

The pattern uses two SDC extensions on a `reference` item:

1. **`sdc-questionnaire-candidateExpression`**: FHIR query returning all active breast Conditions for the patient
2. **`sdc-questionnaire-choiceColumn`**: Column definition for the selection display (ICD-10 code + laterality)

```
item: "bezugsdiagnose"
  type: reference
  extension: sdc-questionnaire-candidateExpression
    language: application/x-fhir-query
    expression: Condition?patient={{%patient.id}}&code=254837009&clinical-status=active
  extension: sdc-questionnaire-choiceColumn (ICD-10)
    path: code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code
    label: "ICD-10"
    forDisplay: false
  extension: sdc-questionnaire-choiceColumn (Seite)
    path: bodySite.coding.first().display
    label: "Seite"
    forDisplay: true
```

#### Usage in Questionnaires

The pattern is implemented in the following questionnaires:

| Questionnaire | Target Resource | Extraction Path |
|---|---|---|
| Postoperative Documentation | Procedure | `reasonReference` |
| Surgical Planning | ServiceRequest | `reasonReference` |
| Tumour Board (Tumorboard) | CarePlan | `addresses` |
| Clinical Examination | Observation | `focus` |
| Systemic Therapy | Procedure | `reasonReference` |

#### Template-based Extraction

The selected Condition reference is extracted into the contained template resource via `sdc-questionnaire-templateExtractValue`:

```
reasonReference.reference = "placeholder"
reasonReference.reference.extension:
  url: sdc-questionnaire-templateExtractValue
  valueString: "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"
```

#### Behaviour for Unilateral Carcinoma

When only one active Condition exists, it is automatically offered as the sole option. The workflow remains identical — no special handling required.

#### SM Compatibility (OncoBox Brust)

The orchestrator (`SenologieToOncoBoxBrust.map`) iterates over all Conditions with ICD-10 C50/D05 and generates a separate primary case block per Condition. For bilateral carcinoma, two primary cases with different `seitenlokalisation` are correctly produced.

**Known limitation**: The sub-maps (`MapPrimaerfall`) currently do not filter Procedures/Observations by `reasonReference` to the respective Condition. For bilateral carcinoma, all therapies therefore appear under both primary cases. A future extension should restrict the assignment via `reasonReference` / `focus`.
