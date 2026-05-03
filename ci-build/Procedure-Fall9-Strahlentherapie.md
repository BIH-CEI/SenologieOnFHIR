# Fall 9: Adjuvante Bestrahlung 50 Gy + Boost + Lymphabfluss - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: Adjuvante Bestrahlung 50 Gy + Boost + Lymphabfluss**

## Example Procedure: Fall 9: Adjuvante Bestrahlung 50 Gy + Boost + Lymphabfluss

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**Anzahl Bestrahlungssitzungen**: 33 Sitzungen

**status**: Completed

**category**: Radiotherapy (procedure)

**code**: Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**performed**: 2025-11-03 --> 2025-12-19

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall9-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure

**note**: 

> 

Restbrust links 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf Tumorbett + Lymphabflusswege (axillär, supraklavikulär) 50 Gy. 3 zusätzliche Fraktionen wegen Lymphabfluss.




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall9-Strahlentherapie",
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
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "performedPeriod" : {
    "start" : "2025-11-03",
    "end" : "2025-12-19"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "note" : [{
    "text" : "Restbrust links 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf Tumorbett + Lymphabflusswege (axillär, supraklavikulär) 50 Gy. 3 zusätzliche Fraktionen wegen Lymphabfluss."
  }]
}

```
