# Fall 9: Endokrine Therapie Tamoxifen 20 mg (initial, prämenopausal) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Endokrine Therapie Tamoxifen 20 mg (initial, prämenopausal)**

## Example MedicationStatement: Fall 9: Endokrine Therapie Tamoxifen 20 mg (initial, prämenopausal)

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Tamoxifen 20 mg

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**effective**: 2026-01-05 --> (ongoing)

**dateAsserted**: 2025-12-20

> **dosage****text**: 1x täglich 20 mg, initial prämenopausal, nach 2 Jahren Umstellung auf Aromataseinhibitor + GnRH-Agonist geplant**timing**: Once per 1 day

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 20 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall9-Begleitmedikation-Tamoxifen",
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectivePeriod" : {
    "start" : "2026-01-05"
  },
  "dateAsserted" : "2025-12-20",
  "dosage" : [{
    "text" : "1x täglich 20 mg, initial prämenopausal, nach 2 Jahren Umstellung auf Aromataseinhibitor + GnRH-Agonist geplant",
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
