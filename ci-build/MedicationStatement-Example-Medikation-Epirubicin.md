# Beispiel: Epirubicin 90 mg/m², Zyklus 1, Tag 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Epirubicin 90 mg/m², Zyklus 1, Tag 1**

## Example MedicationStatement: Beispiel: Epirubicin 90 mg/m², Zyklus 1, Tag 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 1

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Example-Systemtherapie-ECT.md)

**status**: completed

**medication**: Epirubicin

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**effective**: 2024-01-15 --> 2024-01-15

**dateAsserted**: 2024-01-15

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Example-Diagnose-Mammakarzinom.md)

> **dosage****timing**: Events: 2024-01-15 

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 90 mg/m2 (Details: UCUM codemg/m2 = 'mg/m2') |




## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Example-Medikation-Epirubicin",
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
    "reference" : "Procedure/Example-Systemtherapie-ECT"
  }],
  "status" : "completed",
  "medicationCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "417916005",
      "display" : "Epirubicin"
    }],
    "text" : "Epirubicin"
  },
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "effectivePeriod" : {
    "start" : "2024-01-15",
    "end" : "2024-01-15"
  },
  "dateAsserted" : "2024-01-15",
  "reasonReference" : [{
    "reference" : "Condition/Example-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "timing" : {
      "event" : ["2024-01-15"]
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 90,
        "unit" : "mg/m2",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/m2"
      }
    }]
  }]
}

```
