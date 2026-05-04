# Fall 1: Familienanamnese — Mutter Mammakarzinom - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Familienanamnese — Mutter Mammakarzinom**

## Example FamilyMemberHistory: Fall 1: Familienanamnese — Mutter Mammakarzinom

Profile: [BIH Senologie Familienanamnese](StructureDefinition-senologie-familienanamnese.md)

**status**: Completed

**patient**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**relationship**: mother

### Conditions

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Onset[x]** |
| * | Malignant neoplasm of breast | 52 Jahre (Details: UCUM codea = 'a') |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "Fall1-Familienanamnese",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "relationship" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
      "code" : "MTH",
      "display" : "mother"
    }]
  },
  "condition" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "254837009",
        "display" : "Malignant neoplasm of breast"
      }]
    },
    "onsetAge" : {
      "value" : 52,
      "unit" : "Jahre",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  }]
}

```
