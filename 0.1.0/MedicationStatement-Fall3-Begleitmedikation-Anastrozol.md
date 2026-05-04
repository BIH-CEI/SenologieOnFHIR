# Fall 3: Endokrine Therapie Anastrozol 1 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Endokrine Therapie Anastrozol 1 mg**

## Example MedicationStatement: Fall 3: Endokrine Therapie Anastrozol 1 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Anastrozol 1 mg

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**effective**: 2025-06-20 --> (ongoing)

**dateAsserted**: 2025-06-20

> **dosage****text**: 1x täglich**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 1 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall3-Begleitmedikation-Anastrozol",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "386910003",
      "display" : "Anastrozole"
    }],
    "text" : "Anastrozol 1 mg"
  },
  "subject" : {
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "effectivePeriod" : {
    "start" : "2025-06-20"
  },
  "dateAsserted" : "2025-06-20",
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
        "value" : 1,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
