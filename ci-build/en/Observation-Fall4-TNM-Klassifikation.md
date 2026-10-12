# Fall 4: TNM-Klassifikation cT2 cN1 cM0 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: TNM-Klassifikation cT2 cN1 cM0**

## Example Observation: Fall 4: TNM-Klassifikation cT2 cN1 cM0

-------

**English**

-------

Profile: [MII PR Onkologie TNM-Klassifikation](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tnm-klassifikation.html)

**status**: Final

**code**: Clinical TNM stage grouping

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**focus**: [Condition Invasives Mammakarzinom NST links, HER2-positiv (FISH amplifiziert)](Condition-Fall4-Diagnose-Mammakarzinom.md)

**effective**: 2025-02-20

**value**: Stadium IIB — T2 N1 M0 oder T3 N0 M0

**method**: 8. Auflage

> **component****code**: Primary tumor.clinical [Class] Cancer**value**: T2 — > 2 cm und ≤ 5 cm

> **component****code**: Regional lymph nodes.clinical [Class] Cancer**value**: N1 — Bewegliche ipsilaterale axilläre LK Level I/II

> **component****code**: Distant metastases.clinical [Class] Cancer**value**: M0 — Keine Fernmetastasen



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall4-TNM-Klassifikation",
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
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "focus" : [{
    "reference" : "Condition/Fall4-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-02-20",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "code" : "IIB",
      "display" : "Stadium IIB — T2 N1 M0 oder T3 N0 M0"
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
        "code" : "T2",
        "display" : "T2 — > 2 cm und ≤ 5 cm"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1352993004",
        "display" : "cT2 (UICC)"
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
        "code" : "N1",
        "display" : "N1 — Bewegliche ipsilaterale axilläre LK Level I/II"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1353043007",
        "display" : "cN1 (UICC)"
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
        "code" : "M0",
        "display" : "M0 — Keine Fernmetastasen"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1352512001",
        "display" : "cM0 (UICC)"
      }]
    }
  }]
}

```
