# Fall 10: Familienanamnese — Mutter Mammakarzinom 41 J. - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Familienanamnese — Mutter Mammakarzinom 41 J.**

## Example FamilyMemberHistory: Fall 10: Familienanamnese — Mutter Mammakarzinom 41 J.

Profile: [BIH Senologie Familienanamnese](StructureDefinition-senologie-familienanamnese.md)

**status**: Completed

**patient**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**relationship**: mother

### Conditions

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Onset[x]** |
| * | Malignant neoplasm of breast | 41 Jahre (Details: UCUM codea = 'a') |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "Fall10-Familienanamnese-Mutter",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese"]
  },
  "status" : "completed",
  "patient" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
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
      "value" : 41,
      "unit" : "Jahre",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  }]
}

```
