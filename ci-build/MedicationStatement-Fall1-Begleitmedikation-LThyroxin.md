# Fall 1: Begleitmedikation L-Thyroxin 75 µg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Begleitmedikation L-Thyroxin 75 µg**

## Example MedicationStatement: Fall 1: Begleitmedikation L-Thyroxin 75 µg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: L-Thyroxin 75 µg

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2018-06-01 --> (ongoing)

**dateAsserted**: 2025-01-15

> **dosage****text**: 1x täglich morgens nüchtern**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 75 ug (Details: UCUM codeug = 'ug') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall1-Begleitmedikation-LThyroxin",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "768532006",
      "display" : "Levothyroxine-containing product"
    }],
    "text" : "L-Thyroxin 75 µg"
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectivePeriod" : {
    "start" : "2018-06-01"
  },
  "dateAsserted" : "2025-01-15",
  "dosage" : [{
    "text" : "1x täglich morgens nüchtern",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "d"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 75,
        "unit" : "ug",
        "system" : "http://unitsofmeasure.org",
        "code" : "ug"
      }
    }]
  }]
}

```
