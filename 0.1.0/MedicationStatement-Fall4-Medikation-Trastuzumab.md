# Fall 4: Trastuzumab, Zyklus 1, Tag 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Trastuzumab, Zyklus 1, Tag 1**

## Example MedicationStatement: Fall 4: Trastuzumab, Zyklus 1, Tag 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 1

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall4-Systemtherapie-Neoadjuvant.md)

**status**: completed

**medication**: Trastuzumab

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**effective**: 2025-03-10 --> 2025-03-10

**dateAsserted**: 2025-03-10

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall4-Diagnose-Mammakarzinom.md)

> **dosage****timing**: Events: 2025-03-10 

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 8 mg/kg (Details: UCUM codemg/kg = 'mg/kg') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall4-Medikation-Trastuzumab",
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
    "reference" : "Procedure/Fall4-Systemtherapie-Neoadjuvant"
  }],
  "status" : "completed",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "784176009",
      "display" : "Trastuzumab-containing product"
    }],
    "text" : "Trastuzumab"
  },
  "subject" : {
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "effectivePeriod" : {
    "start" : "2025-03-10",
    "end" : "2025-03-10"
  },
  "dateAsserted" : "2025-03-10",
  "reasonReference" : [{
    "reference" : "Condition/Fall4-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "timing" : {
      "event" : ["2025-03-10"]
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 8,
        "unit" : "mg/kg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/kg"
      }
    }]
  }]
}

```
