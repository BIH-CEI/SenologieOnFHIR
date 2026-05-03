# Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen**

## Example Procedure: Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**Anzahl Bestrahlungssitzungen**: 25 Sitzungen

**Einzeldosis pro Fraktion**: 2 Gy (Details: UCUM codeGy = 'Gy')

**status**: Completed

**category**: Radiotherapy (procedure)

**code**: Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**performed**: 2024-06-03 --> 2024-07-04

**reasonReference**: [Condition Malignant neoplasm of breast](Condition-Example-Diagnose-Mammakarzinom.md)

**bodySite**: Left breast structure



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Example-Strahlentherapie",
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
  },
  {
    "url" : "https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis",
    "valueQuantity" : {
      "value" : 2,
      "unit" : "Gy",
      "system" : "http://unitsofmeasure.org",
      "code" : "Gy"
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
    "reference" : "Patient/example-patient"
  },
  "performedPeriod" : {
    "start" : "2024-06-03",
    "end" : "2024-07-04"
  },
  "reasonReference" : [{
    "reference" : "Condition/Example-Diagnose-Mammakarzinom"
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }]
}

```
