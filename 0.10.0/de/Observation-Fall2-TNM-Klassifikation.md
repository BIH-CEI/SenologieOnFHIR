# Fall 2: TNM-Klassifikation cT3 cN2a cM1 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: TNM-Klassifikation cT3 cN2a cM1**

##  Observation: Fall 2: TNM-Klassifikation cT3 cN2a cM1

-------

**German**

-------

Profil: [MII PR Onkologie TNM-Klassifikation](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tnm-klassifikation.html)

**status**: Final

**code**: Clinical TNM stage grouping

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**focus**: [Condition Invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, triple-negativ](Condition-Fall2-Diagnose-Mammakarzinom.md)

**effective**: 2025-02-10

**value**: Stadium IV — Jedes T, jedes N, M1

**method**: 8. Auflage

> **component****code**: Primary tumor.clinical [Class] Cancer**value**: T3 — > 5 cm

> **component****code**: Regional lymph nodes.clinical [Class] Cancer**value**: N2a — 4–9 axilläre LK

> **component****code**: Distant metastases.clinical [Class] Cancer**value**: M1 — Fernmetastasen vorhanden



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-TNM-Klassifikation",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "399537006",
      "display" : "Clinical TNM stage grouping"
    },
    {
      "system" : "http://loinc.org",
      "code" : "21908-9",
      "display" : "Stage group.clinical Cancer"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "focus" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-02-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "code" : "IV",
      "display" : "Stadium IV — Jedes T, jedes N, M1"
    }]
  },
  "method" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-tnm-version",
      "code" : "8",
      "display" : "8. Auflage"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21905-5",
        "display" : "Primary tumor.clinical [Class] Cancer"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.uicc.org/resources/tnm",
        "code" : "T3",
        "display" : "T3 — > 5 cm"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1352966002",
        "display" : "cT3 (UICC)"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21906-3",
        "display" : "Regional lymph nodes.clinical [Class] Cancer"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.uicc.org/resources/tnm",
        "code" : "N2a",
        "display" : "N2a — 4–9 axilläre LK"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1353050006",
        "display" : "cN2a (UICC)"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "21907-1",
        "display" : "Distant metastases.clinical [Class] Cancer"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.uicc.org/resources/tnm",
        "code" : "M1",
        "display" : "M1 — Fernmetastasen vorhanden"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1352513006",
        "display" : "cM1 (UICC)"
      }]
    }
  }]
}

```
