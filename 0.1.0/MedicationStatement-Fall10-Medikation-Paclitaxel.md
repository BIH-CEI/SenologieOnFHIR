# Fall 10: Paclitaxel 175 mg/m2, Zyklus 1, Tag 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 10: Paclitaxel 175 mg/m2, Zyklus 1, Tag 1**

## Example MedicationStatement: Fall 10: Paclitaxel 175 mg/m2, Zyklus 1, Tag 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 1

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall10-Systemtherapie-Adjuvant.md)

**status**: completed

**medication**: Paclitaxel

**subject**: [Christina Becker Female, DoB: 1982-12-14 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-010)](Patient-Fall10-Patient-Christina-Becker.md)

**effective**: 2025-07-21 --> 2025-07-21

**dateAsserted**: 2025-07-21

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall10-Diagnose-Mammakarzinom.md)

> **dosage****timing**: Events: 2025-07-21 

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 175 mg/m2 (Details: UCUM codemg/m2 = 'mg/m2') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall10-Medikation-Paclitaxel",
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
    "reference" : "Procedure/Fall10-Systemtherapie-Adjuvant"
  }],
  "status" : "completed",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387374002",
      "display" : "Paclitaxel"
    }],
    "text" : "Paclitaxel"
  },
  "subject" : {
    "reference" : "Patient/Fall10-Patient-Christina-Becker"
  },
  "effectivePeriod" : {
    "start" : "2025-07-21",
    "end" : "2025-07-21"
  },
  "dateAsserted" : "2025-07-21",
  "reasonReference" : [{
    "reference" : "Condition/Fall10-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "timing" : {
      "event" : ["2025-07-21"]
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 175,
        "unit" : "mg/m2",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/m2"
      }
    }]
  }]
}

```
