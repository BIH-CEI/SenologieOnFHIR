# Fall 7: Adjuvante Bestrahlung 50 Gy + Boost 16 Gy - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 7: Adjuvante Bestrahlung 50 Gy + Boost 16 Gy**

## Example Procedure: Fall 7: Adjuvante Bestrahlung 50 Gy + Boost 16 Gy

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**Anzahl Bestrahlungssitzungen**: 33 Sitzungen

**status**: Completed

**category**: Radiotherapy (procedure)

**code**: Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung

**subject**: [Kathrin Mueller Female, DoB: 1977-06-17 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-007)](Patient-Fall7-Patient-Kathrin-Mueller.md)

**performed**: 2025-10-06 --> 2025-11-21

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall7-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**note**: 

> 

Ganzbrust rechts 50 Gy in 25 Fraktionen + Boost 16 Gy in 8 Fraktionen auf ehemaliges Tumorbett, Gesamtdosis 66 Gy




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall7-Strahlentherapie",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "K",
        "display" : "kurativ"
      }]
    }
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-session-count",
    "valueQuantity" : {
      "value" : 33,
      "unit" : "Sitzungen"
    }
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "1287742003",
      "display" : "Radiotherapy (procedure)"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "8-522.d1",
      "display" : "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall7-Patient-Kathrin-Mueller"
  },
  "performedPeriod" : {
    "start" : "2025-10-06",
    "end" : "2025-11-21"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall7-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "note" : [{
    "text" : "Ganzbrust rechts 50 Gy in 25 Fraktionen + Boost 16 Gy in 8 Fraktionen auf ehemaliges Tumorbett, Gesamtdosis 66 Gy"
  }]
}

```
