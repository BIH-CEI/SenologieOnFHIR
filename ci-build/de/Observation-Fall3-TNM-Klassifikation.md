# Fall 3: TNM-Klassifikation cT2 pN1a cM0 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 3: TNM-Klassifikation cT2 pN1a cM0**

##  Observation: Fall 3: TNM-Klassifikation cT2 pN1a cM0

-------

**German**

-------

Profil: [MII PR Onkologie TNM-Klassifikation](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tnm-klassifikation.html)

**status**: Final

**code**: TNM stage grouping

**subject**: [Sabine Weber Female, DoB: 1953-07-15 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-003)](Patient-Fall3-Patient-Sabine-Weber.md)

**focus**: [Condition Invasives Mammakarzinom NST rechts](Condition-Fall3-Diagnose-Mammakarzinom.md)

**effective**: 2025-03-10

**value**: Stadium IIA — T0/1 N1 M0 oder T2 N0 M0

**method**: 8. Auflage

> **component****code**: Primary tumor.clinical [Class] Cancer**value**: T2 — > 2 cm und ≤ 5 cm

> **component****code**: Regional lymph nodes.pathology [Class] Cancer**value**: N1a — 1–3 axilläre LK

> **component****code**: Distant metastases.clinical [Class] Cancer**value**: M0 — Keine Fernmetastasen



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall3-TNM-Klassifikation",
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
    "reference" : "Patient/Fall3-Patient-Sabine-Weber"
  },
  "focus" : [{
    "reference" : "Condition/Fall3-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-03-10",
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "code" : "IIA",
      "display" : "Stadium IIA — T0/1 N1 M0 oder T2 N0 M0"
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
        "code" : "N1a",
        "display" : "N1a — 1–3 axilläre LK"
      },
      {
        "system" : "http://snomed.info/sct",
        "code" : "1352619004",
        "display" : "pN1a (UICC)"
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
