# Fall 1: Begleitmedikation Metoprolol 47,5 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Begleitmedikation Metoprolol 47,5 mg**

## Example MedicationStatement: Fall 1: Begleitmedikation Metoprolol 47,5 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Metoprolol 47,5 mg

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**effective**: 2020-03-01 --> (ongoing)

**dateAsserted**: 2025-01-15

> **dosage****text**: 1x täglich morgens**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 47.5 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall1-Begleitmedikation-Metoprolol",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "372826007",
      "display" : "Metoprolol"
    }],
    "text" : "Metoprolol 47,5 mg"
  },
  "subject" : {
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "effectivePeriod" : {
    "start" : "2020-03-01"
  },
  "dateAsserted" : "2025-01-15",
  "dosage" : [{
    "text" : "1x täglich morgens",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "d"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 47.5,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
