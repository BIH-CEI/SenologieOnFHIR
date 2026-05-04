# Fall 7: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1**

## Example MedicationStatement: Fall 7: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 1

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall7-Systemtherapie-Neoadjuvant.md)

**status**: completed

**medication**: Paclitaxel

**subject**: [Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007)](Patient-Fall7-Patient-Kathrin-Mueller.md)

**effective**: 2025-03-24 --> 2025-03-24

**dateAsserted**: 2025-03-24

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall7-Diagnose-Mammakarzinom.md)

> **dosage****timing**: Events: 2025-03-24 

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 80 mg/m2 (Details: UCUM codemg/m2 = 'mg/m2') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall7-Medikation-Paclitaxel",
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
    "reference" : "Procedure/Fall7-Systemtherapie-Neoadjuvant"
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
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "effectivePeriod" : {
    "start" : "2025-03-24",
    "end" : "2025-03-24"
  },
  "dateAsserted" : "2025-03-24",
  "reasonReference" : [{
    "reference" : "Condition/Fall7-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "timing" : {
      "event" : ["2025-03-24"]
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
