# Fall 13: Adjuvante Chemotherapie EC-Pac-H (rechts, HER2+) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: Adjuvante Chemotherapie EC-Pac-H (rechts, HER2+)**

## Example Procedure: Fall 13: Adjuvante Chemotherapie EC-Pac-H (rechts, HER2+)

Profile: [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md)

**MII EX Onko Systemische Therapie Intention**: kurativ

**status**: Completed

**category**: Administration of medication

**code**: Adjuvante Chemotherapie EC-Pac-H

**subject**: [Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)](Patient-Fall13-Patient-Margarete-Schreiber.md)

**performed**: 2025-05-05 --> 2025-11-15

**reasonReference**: 

* [Condition Malignant neoplasm of breast](Condition-Fall13-Diagnose-Rechts.md)
* [Condition Malignant neoplasm of breast](Condition-Fall13-Diagnose-Links.md)

**outcome**: Abgeschlossen, gut vertragen

**note**: 

> 

4x EC q3w, gefolgt von 12x Paclitaxel weekly + Trastuzumab q3w (18 Zyklen gesamt). Indikation primär HER2+ rechts, Chemotherapie wirkt auf beide Seiten.




## Resource Content

```json
{
  "resourceType" : "Procedure",
  "id" : "Fall13-Systemtherapie-EC-Pac-H",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-systemtherapie-procedure"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-systemische-therapie-intention",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
        "code" : "K",
        "display" : "kurativ"
      }]
    }
  }],
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "18629005",
      "display" : "Administration of medication"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "385786002",
      "display" : "Chemotherapy care (regime/therapy)"
    }],
    "text" : "Adjuvante Chemotherapie EC-Pac-H"
  },
  "subject" : {
    "reference" : "Patient/Fall13-Patient-Margarete-Schreiber"
  },
  "performedPeriod" : {
    "start" : "2025-05-05",
    "end" : "2025-11-15"
  },
  "reasonReference" : [{
    "reference" : "Condition/Fall13-Diagnose-Rechts"
  },
  {
    "reference" : "Condition/Fall13-Diagnose-Links"
  }],
  "outcome" : {
    "text" : "Abgeschlossen, gut vertragen"
  },
  "note" : [{
    "text" : "4x EC q3w, gefolgt von 12x Paclitaxel weekly + Trastuzumab q3w (18 Zyklen gesamt). Indikation primär HER2+ rechts, Chemotherapie wirkt auf beide Seiten."
  }]
}

```
