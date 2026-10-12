# Fall 9: TNM-Klassifikation cT2 pN3a cM0 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 9: TNM-Klassifikation cT2 pN3a cM0**

## Example Observation: Fall 9: TNM-Klassifikation cT2 pN3a cM0

-------

**English**

-------

Profile: [MII PR Onkologie TNM-Klassifikation](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tnm-klassifikation.html)

**status**: Final

**code**: TNM stage grouping

**subject**: [Andrea Wolf Female, DoB: 1974-05-29 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-009)](Patient-Fall9-Patient-Andrea-Wolf.md)

**focus**: [Condition Invasives lobuläres Mammakarzinom links, oberer äußerer Quadrant](Condition-Fall9-Diagnose-Mammakarzinom.md)

**effective**: 2025-04-02

**value**: Stadium IIIC — Jedes T N3 M0

**method**: 8. Auflage

> **component****code**: Primary tumor.clinical [Class] Cancer**value**: T2 — > 2 cm und ≤ 5 cm

> **component****code**: Regional lymph nodes.pathology [Class] Cancer**value**: N3a — ≥ 10 axilläre LK oder infraklavikuläre LK

> **component****code**: Distant metastases.clinical [Class] Cancer**value**: M0 — Keine Fernmetastasen



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall9-TNM-Klassifikation",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "399390009",
      "display" : "TNM stage grouping"
    },
    {
      "system" : "http://loinc.org",
      "code" : "21908-9",
      "display" : "Stage group.clinical Cancer"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall9-Patient-Andrea-Wolf"
  },
  "focus" : [{
    "reference" : "Condition/Fall9-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-04-02",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "code" : "IIIC",
      "display" : "Stadium IIIC — Jedes T N3 M0"
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
        "code" : "21900-6",
        "display" : "Regional lymph nodes.pathology [Class] Cancer"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.uicc.org/resources/tnm",
        "code" : "N3a",
        "display" : "N3a — ≥ 10 axilläre LK oder infraklavikuläre LK"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1352618007",
        "display" : "pN3a (UICC)"
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
