# Fall 8: Endokrine Therapie Tamoxifen 20 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 8: Endokrine Therapie Tamoxifen 20 mg**

## Example MedicationStatement: Fall 8: Endokrine Therapie Tamoxifen 20 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Tamoxifen 20 mg

**subject**: [Klaus Hartmann Male, DoB: 1956-02-11 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-008)](Patient-Fall8-Patient-Klaus-Hartmann.md)

**effective**: 2025-09-15 --> (ongoing)

**dateAsserted**: 2025-07-15

> **dosage****text**: 1x täglich 20 mg, Dauer 5 Jahre (Standard bei männlichem Mammakarzinom)**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 20 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall8-Begleitmedikation-Tamoxifen",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "373345002",
      "display" : "Tamoxifen"
    }],
    "text" : "Tamoxifen 20 mg"
  },
  "subject" : {
    "reference" : "Patient/Fall8-Patient-Klaus-Hartmann"
  },
  "effectivePeriod" : {
    "start" : "2025-09-15"
  },
  "dateAsserted" : "2025-07-15",
  "dosage" : [{
    "text" : "1x täglich 20 mg, Dauer 5 Jahre (Standard bei männlichem Mammakarzinom)",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "d"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 20,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
