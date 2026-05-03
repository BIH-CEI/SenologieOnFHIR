# Fall 2: Carboplatin AUC5, Zyklus 1, Tag 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Carboplatin AUC5, Zyklus 1, Tag 1**

## Example MedicationStatement: Fall 2: Carboplatin AUC5, Zyklus 1, Tag 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 1

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall2-Systemtherapie-Neoadjuvant.md)

**status**: completed

**medication**: Carboplatin

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**effective**: 2025-03-01 --> 2025-03-01

**dateAsserted**: 2025-03-01

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

### Dosages

| | |
| :--- | :--- |
| - | **Text** |
| * | Carboplatin AUC 5 |



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall2-Medikation-Carboplatin",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-medikation"]
  },
  "extension" : [{
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-cycle",
    "valueInteger" : 1
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle",
    "valueInteger" : 1
  }],
  "partOf" : [{
    "reference" : "Procedure/Fall2-Systemtherapie-Neoadjuvant"
  }],
  "status" : "completed",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "386905002",
      "display" : "Carboplatin"
    }],
    "text" : "Carboplatin"
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "effectivePeriod" : {
    "start" : "2025-03-01",
    "end" : "2025-03-01"
  },
  "dateAsserted" : "2025-03-01",
  "reasonReference" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "text" : "Carboplatin AUC 5"
  }]
}

```
