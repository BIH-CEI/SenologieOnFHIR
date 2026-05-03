# Fall 9: Epirubicin, Zyklus 1, Tag 1 - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Epirubicin, Zyklus 1, Tag 1**

## Example MedicationStatement: Fall 9: Epirubicin, Zyklus 1, Tag 1

Profile: [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)

**Therapie-Zyklus**: 1

**Tag im Zyklus**: 1

**partOf**: [Procedure Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie](Procedure-Fall9-Systemtherapie-Adjuvant.md)

**status**: completed

**medication**: Epirubicin

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**effective**: 2025-04-28 --> 2025-04-28

**dateAsserted**: 2025-04-28

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall9-Diagnose-Mammakarzinom.md)

### Dosages

| | |
| :--- | :--- |
| - | **Text** |
| * | Epirubicin 90 mg/m2 |



## Resource Content

```json
{
  "resourceType" : "MedicationStatement",
  "id" : "Fall9-Medikation-Epirubicin",
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
    "reference" : "Procedure/Fall9-Systemtherapie-Adjuvant"
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "effectivePeriod" : {
    "start" : "2025-04-28",
    "end" : "2025-04-28"
  },
  "dateAsserted" : "2025-04-28",
  "reasonReference" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
  }],
  "dosage" : [{
    "text" : "Epirubicin 90 mg/m2"
  }]
}

```
