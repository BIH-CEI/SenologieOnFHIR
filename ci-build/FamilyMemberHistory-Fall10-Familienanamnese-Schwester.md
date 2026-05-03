# Fall 10: Familienanamnese — Schwester Ovarialkarzinom 39 J. - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Familienanamnese — Schwester Ovarialkarzinom 39 J.**

## Example FamilyMemberHistory: Fall 10: Familienanamnese — Schwester Ovarialkarzinom 39 J.

Profile: [BIH Senologie Familienanamnese](StructureDefinition-senologie-familienanamnese.md)

**status**: Completed

**patient**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**relationship**: sister

### Conditions

| | | |
| :--- | :--- | :--- |
| - | **Code** | **Onset[x]** |
| * | Malignant tumor of ovary | 39 Jahre (Details: UCUM codea = 'a') |



## Resource Content

```json
{
  "resourceType" : "FamilyMemberHistory",
  "id" : "Fall10-Familienanamnese-Schwester",
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
      "code" : "SIS",
      "display" : "sister"
    }]
  },
  "condition" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "363443007",
        "display" : "Malignant tumor of ovary"
      }]
    },
    "onsetAge" : {
      "value" : 39,
      "unit" : "Jahre",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  }]
}

```
