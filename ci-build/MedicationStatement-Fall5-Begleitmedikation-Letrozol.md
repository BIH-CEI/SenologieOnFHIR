# Fall 5: Endokrine Therapie Letrozol 2,5 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Endokrine Therapie Letrozol 2,5 mg**

## Example MedicationStatement: Fall 5: Endokrine Therapie Letrozol 2,5 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Letrozol 2,5 mg

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**effective**: 2025-10-10 --> (ongoing)

**dateAsserted**: 2025-10-10

> **dosage****text**: 1x täglich**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 2.5 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall5-Begleitmedikation-Letrozol",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "386911004",
      "display" : "Letrozole"
    }],
    "text" : "Letrozol 2,5 mg"
  },
  "subject" : {
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "effectivePeriod" : {
    "start" : "2025-10-10"
  },
  "dateAsserted" : "2025-10-10",
  "dosage" : [{
    "text" : "1x täglich",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "d"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 2.5,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
