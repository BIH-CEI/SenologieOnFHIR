# Fall 14: BET + Sentinel-LK-Biopsie links - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: BET + Sentinel-LK-Biopsie links**

##  Procedure: Fall 14: BET + Sentinel-LK-Biopsie links

-------

**German**

-------

Profil: [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md)

**MII EX Onko Operation Intention**: Kurativ

**status**: Completed

**code**: BET mit primärer Wundnaht

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**performed**: 2025-02-08

### Performers

| | | |
| :--- | :--- | :--- |
| - | **Function** | **Actor** |
| * | Surgeon (occupation) | Synthetischer Erstoperateur (Quelle: OncoBox-Beispiel, nicht spezifiziert) |

**bodySite**: Links



## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall14-Operation-BET",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-operation"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-operation-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "K",
        "display" : "Kurativ"
      }]
    }
  }],
  "status" : "completed",
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/ops",
      "version" : "2025",
      "code" : "5-870.91",
      "display" : "BET mit primärer Wundnaht"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "performedDateTime" : "2025-02-08",
  "performer" : [{
    "function" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "304292004",
        "display" : "Surgeon (occupation)"
      }]
    },
    "actor" : {
      "display" : "Synthetischer Erstoperateur (Quelle: OncoBox-Beispiel, nicht spezifiziert)"
    }
  }],
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "7771000",
      "display" : "Links"
    }]
  }]
}

```
