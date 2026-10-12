# Fall 14: Adjuvante Bestrahlung Brust links 40 Gy - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Adjuvante Bestrahlung Brust links 40 Gy**

## Example Procedure: Fall 14: Adjuvante Bestrahlung Brust links 40 Gy

-------

**English**

-------

Profile: [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)

**MII EX Onko Strahlentherapie Intention**: kurativ

**status**: Completed

**code**: Hochvoltstrahlentherapie

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**performed**: 2025-02-17 --> 2025-03-17

**bodySite**: Breast structure



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall14-Strahlentherapie",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "K"
      }]
    }
  }],
  "status" : "completed",
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "8-522.90",
      "display" : "Hochvoltstrahlentherapie"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "performedPeriod" : {
    "start" : "2025-02-17",
    "end" : "2025-03-17"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Breast structure"
    }]
  }]
}

```
