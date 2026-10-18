# Fall 14: Adjuvante endokrine Therapie - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Adjuvante endokrine Therapie**

##  Procedure: Fall 14: Adjuvante endokrine Therapie

-------

**German**

-------

Profil: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**code**: Hormone therapy (procedure)

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**performed**: 2025-02-24 --> (ongoing)



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall14-Systemtherapie",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-systemische-therapie-intention",
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
      "system" : "http://snomed.info/sct",
      "code" : "169413002",
      "display" : "Hormone therapy (procedure)"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "performedPeriod" : {
    "start" : "2025-02-24"
  }
}

```
