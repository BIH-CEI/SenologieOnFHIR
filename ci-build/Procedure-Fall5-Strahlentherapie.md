# Fall 5: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy**

## Example Procedure: Fall 5: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**Anzahl Bestrahlungssitzungen**: 33 Sitzungen

**status**: Completed

**category**: Radiotherapy (procedure)

**code**: Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**performed**: 2025-08-18 --> 2025-10-03

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall5-Diagnose-Mammakarzinom.md)

**bodySite**: Right breast structure

**note**: 

> 

Ganzbrust rechts 50 Gy in 25 Fraktionen + Boost 16 Gy in 8 Fraktionen auf Tumorbett, Gesamtdosis 66 Gy




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall5-Strahlentherapie",
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
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "performedPeriod" : {
    "start" : "2025-08-18",
    "end" : "2025-10-03"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall5-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "note" : [{
    "text" : "Ganzbrust rechts 50 Gy in 25 Fraktionen + Boost 16 Gy in 8 Fraktionen auf Tumorbett, Gesamtdosis 66 Gy"
  }]
}

```
