# Fall 1: Gynäkologische Anamnese - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Gynäkologische Anamnese**

## Example Observation: Fall 1: Gynäkologische Anamnese

Profile: [BIH Senologie Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.md)

**status**: Final

**code**: Gynecology History and physical note

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2025-01-15

> **component****code**: Age at menarche**value**: 13 Jahre (Details: UCUM codea = 'a')

> **component****code**: Age at menopause**value**: 54 Jahre (Details: UCUM codea = 'a')

> **component****code**: [#] Pregnancies**value**: 2 Schwangerschaften (Details: UCUM code1 = '1')

> **component****code**: Hormone replacement therapy**value**: Keine HRT



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Gynaekologische-Anamnese",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "89221-6",
      "display" : "Gynecology History and physical note"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectiveDateTime" : "2025-01-15",
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "42798-9",
        "display" : "Age at menarche"
      }]
    },
    "valueQuantity" : {
      "value" : 13,
      "unit" : "Jahre",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "42802-9",
        "display" : "Age at menopause"
      }]
    },
    "valueQuantity" : {
      "value" : 54,
      "unit" : "Jahre",
      "system" : "http://unitsofmeasure.org",
      "code" : "a"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "11996-6",
        "display" : "[#] Pregnancies"
      }]
    },
    "valueQuantity" : {
      "value" : 2,
      "unit" : "Schwangerschaften",
      "system" : "http://unitsofmeasure.org",
      "code" : "1"
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "266717002",
        "display" : "Hormone replacement therapy"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "373067005",
        "display" : "No"
      }],
      "text" : "Keine HRT"
    }
  }]
}

```
