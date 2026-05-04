# Fall 2: Begleitmedikation Ondansetron 8 mg - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Begleitmedikation Ondansetron 8 mg**

## Example MedicationStatement: Fall 2: Begleitmedikation Ondansetron 8 mg

Profile: [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md)

**status**: active

**medication**: Ondansetron 8 mg

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2025-03-01 --> (ongoing)

**dateAsserted**: 2025-02-20

> **dosage****text**: 8 mg i.v. vor Chemotherapie, ggf. 8 mg p.o. Folgetag**timing**: Once per 3 weeks

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 8 mg (Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall2-Begleitmedikation-Ondansetron",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-begleitmedikation"]
  },
  "status" : "active",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "372487007",
      "display" : "Ondansetron"
    }],
    "text" : "Ondansetron 8 mg"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectivePeriod" : {
    "start" : "2025-03-01"
  },
  "dateAsserted" : "2025-02-20",
  "dosage" : [{
    "text" : "8 mg i.v. vor Chemotherapie, ggf. 8 mg p.o. Folgetag",
    "timing" : {
      "repeat" : {
        "frequency" : 1,
        "period" : 3,
        "periodUnit" : "wk"
      }
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 8,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
