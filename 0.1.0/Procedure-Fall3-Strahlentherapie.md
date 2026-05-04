# Fall 3: Adjuvante Bestrahlung Thoraxwand 50 Gy - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: Adjuvante Bestrahlung Thoraxwand 50 Gy**

## Example Procedure: Fall 3: Adjuvante Bestrahlung Thoraxwand 50 Gy

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**Anzahl Bestrahlungssitzungen**: 25 Sitzungen

**status**: Completed

**category**: Radiotherapy (procedure)

**code**: Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**performed**: 2025-05-12 --> 2025-06-13

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Fall3-Diagnose-Mammakarzinom.md)

**bodySite**: Thoraxwand rechts

**note**: 

> 

Thoraxwand rechts 50 Gy in 25 Fraktionen, kein Boost (nach Mastektomie)




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall3-Strahlentherapie",
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
      "value" : 25,
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
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "performedPeriod" : {
    "start" : "2025-05-12",
    "end" : "2025-06-13"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall3-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "78904004",
      "display" : "Chest wall structure"
    }],
    "text" : "Thoraxwand rechts"
  }],
  "note" : [{
    "text" : "Thoraxwand rechts 50 Gy in 25 Fraktionen, kein Boost (nach Mastektomie)"
  }]
}

```
