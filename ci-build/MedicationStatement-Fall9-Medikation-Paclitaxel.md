# Fall 9: Paclitaxel 80 mg/m2 wöchentlich, Woche 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Paclitaxel 80 mg/m2 wöchentlich, Woche 1**

## Example MedicationStatement: Fall 9: Paclitaxel 80 mg/m2 wöchentlich, Woche 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 5

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall9-Systemtherapie-Adjuvant.md)

**status**: completed

**medication**: Paclitaxel

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**effective**: 2025-07-07 --> 2025-07-07

**dateAsserted**: 2025-07-07

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall9-Diagnose-Mammakarzinom.md)

> **dosage****timing**: Events: 2025-07-07 

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 80 mg/m2 (Details: UCUM codemg/m2 = 'mg/m2') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall9-Medikation-Paclitaxel",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-medikation"]
  },
  "extension" : [{
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-therapy-cycle",
    "valueInteger" : 5
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-day-in-cycle",
    "valueInteger" : 1
  }],
  "partOf" : [{
    "reference" : "Procedure/Fall9-Systemtherapie-Adjuvant"
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectivePeriod" : {
    "start" : "2025-07-07",
    "end" : "2025-07-07"
  },
  "dateAsserted" : "2025-07-07",
  "reasonReference" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "timing" : {
      "event" : ["2025-07-07"]
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 80,
        "unit" : "mg/m2",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/m2"
      }
    }]
  }]
}

```
