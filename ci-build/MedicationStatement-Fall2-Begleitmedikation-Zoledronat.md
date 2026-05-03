# Fall 2: Begleitmedikation Zoledronat 4 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Begleitmedikation Zoledronat 4 mg**

## Example MedicationStatement: Fall 2: Begleitmedikation Zoledronat 4 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Zoledronat 4 mg

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2025-03-01 --> (ongoing)

**dateAsserted**: 2025-02-20

> **dosage****text**: 4 mg i.v. alle 4 Wochen**timing**: Once per 4 weeks

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 4 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall2-Begleitmedikation-Zoledronat",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "395926009",
      "display" : "Zoledronic acid"
    }],
    "text" : "Zoledronat 4 mg"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectivePeriod" : {
    "start" : "2025-03-01"
  },
  "dateAsserted" : "2025-02-20",
  "dosage" : [{
    "text" : "4 mg i.v. alle 4 Wochen",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 4,
        "periodUnit" : "wk"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 4,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
