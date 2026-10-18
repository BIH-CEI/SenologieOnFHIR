# Fall 13: TNM-Klassifikation pT2 pN1a cM0 - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 13: TNM-Klassifikation pT2 pN1a cM0**

## Example Observation: Fall 13: TNM-Klassifikation pT2 pN1a cM0

-------

**English**

-------

Profile: [MII PR Onkologie TNM-Klassifikation](https://medizininformatik-initiative.github.io/kerndatensatzmodul-onkologie/2027.0.0-ballot.1/StructureDefinition-mii-pr-onko-tnm-klassifikation.html)

**status**: Final

**code**: Pathologic TNM stage grouping

**subject**: [Margarete Schreiber Female, DoB: 1960-08-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-013)](Patient-Fall13-Patient-Margarete-Schreiber.md)

**focus**: [Condition Invasives Mammakarzinom NST rechts, oberer innerer Quadrant](Condition-Fall13-Diagnose-Rechts.md)

**effective**: 2025-03-10

**value**: Stadium IIB — T2 N1 M0 oder T3 N0 M0

**method**: 8. Auflage

> **component****code**: Primary tumor.pathology Cancer**value**: T2 — > 2 cm und ≤ 5 cm

> **component****code**: Regional lymph nodes.pathology [Class] Cancer**value**: N1a — 1–3 axilläre LK

> **component****code**: Distant metastases.clinical [Class] Cancer**value**: M0 — Keine Fernmetastasen



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall13-TNM-Klassifikation-Rechts",
  "meta" : {
    "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "399588009",
      "display" : "Pathologic TNM stage grouping"
    },
    {
      "system" : "http://loinc.org",
      "code" : "21902-2",
      "display" : "Stage group.pathology Cancer"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall13-Patient-Margarete-Schreiber"
  },
  "focus" : [{
    "reference" : "Condition/Fall13-Diagnose-Rechts"
  }],
  "effectiveDateTime" : "2025-03-10",
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
        "code" : "21899-0",
        "display" : "Primary tumor.pathology Cancer"
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
        "code" : "1352545001",
        "display" : "pT2 (UICC)"
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
