# Fall 5: TNM-Klassifikation cT3 cN1 cM0 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 5: TNM-Klassifikation cT3 cN1 cM0**

##  Observation: Fall 5: TNM-Klassifikation cT3 cN1 cM0

-------

**German**

-------

Profil: [MII PR Onkologie TNM-Klassifikation](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tnm-klassifikation.html)

**status**: Final

**code**: Clinical TNM stage grouping

**subject**: [Monika Braun Female, DoB: 1970-04-03 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-005)](Patient-Fall5-Patient-Monika-Braun.md)

**focus**: [Condition Invasives Mammakarzinom NST rechts, HR+/HER2+](Condition-Fall5-Diagnose-Mammakarzinom.md)

**effective**: 2025-01-20

**value**: Stadium IIIA — T0–2 N2 M0 oder T3 N1/2 M0

**method**: 8. Auflage

> **component****code**: Primary tumor.clinical [Class] Cancer**value**: T3 — > 5 cm

> **component****code**: Regional lymph nodes.clinical [Class] Cancer**value**: N1 — Bewegliche ipsilaterale axilläre LK Level I/II

> **component****code**: Distant metastases.clinical [Class] Cancer**value**: M0 — Keine Fernmetastasen



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall5-TNM-Klassifikation",
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
    "reference" : "Patient/Fall5-Patient-Monika-Braun"
  },
  "focus" : [{
    "reference" : "Condition/Fall5-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-01-20",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "code" : "IIIA",
      "display" : "Stadium IIIA — T0–2 N2 M0 oder T3 N1/2 M0"
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
