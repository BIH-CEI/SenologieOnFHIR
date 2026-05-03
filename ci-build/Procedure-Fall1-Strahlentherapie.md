# Fall 1: Adjuvante Bestrahlung 50 Gy + 10 Gy Boost - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Adjuvante Bestrahlung 50 Gy + 10 Gy Boost**

## Example Procedure: Fall 1: Adjuvante Bestrahlung 50 Gy + 10 Gy Boost

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**Anzahl Bestrahlungssitzungen**: 30 Sitzungen

**status**: Completed

**category**: Radiotherapy (procedure)

**code**: Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**performed**: 2025-03-10 --> 2025-04-18

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall1-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure

**note**: 

> 

Ganzbrust 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf Tumorbett, Gesamtdosis 60 Gy




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall1-Strahlentherapie",
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
      "value" : 30,
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
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "performedPeriod" : {
    "start" : "2025-03-10",
    "end" : "2025-04-18"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall1-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "note" : [{
    "text" : "Ganzbrust 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf Tumorbett, Gesamtdosis 60 Gy"
  }]
}

```
