# Fall 4: Gesamtbeurteilung nach neoadjuvanter Chemotherapie (D27) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 4: Gesamtbeurteilung nach neoadjuvanter Chemotherapie (D27)**

## Example Observation: Fall 4: Gesamtbeurteilung nach neoadjuvanter Chemotherapie (D27)

Profile: [BIH Senologie Follow-Up (Verlaufsmeldung)](StructureDefinition-senologie-follow-up.md)

**status**: Final

**code**: Status of regression of tumor (observable entity)

**subject**: [Julia Fischer Female, DoB: 1987-11-22 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-004)](Patient-Fall4-Patient-Julia-Fischer.md)

**focus**: [Condition Malignant neoplasm of breast](Condition-Fall4-Diagnose-Mammakarzinom.md)

**effective**: 2025-06-10

**performer**: [Organization Brustzentrum Charité — Universitätsmedizin Berlin](Organization-Brustzentrum-Charite.md)

**value**: Teilremission (partial remission, PR)

**method**: Aktive Nachsorge

> **component****code**: Status of residual neoplasm (observable entity)**value**: Tumorreste (Residualtumor)

> **component****code**: Presence of metastatic neoplasm in regional lymph node (observable entity)**value**: kein Lymphknotenbefall nachweisbar

> **component****code**: Status of distant metastasis (observable entity)**value**: keine Fernmetastasen nachweisbar

> **component****code**: Zweittumor**value**: No (qualifier value)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall4-Verlauf-PostTherapie",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-follow-up"]
  },
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "396432002",
      "display" : "Status of regression of tumor (observable entity)"
    }]
  },
  "subject" : {
    "reference" : "Patient/Fall4-Patient-Julia-Fischer"
  },
  "focus" : [{
    "reference" : "Condition/Fall4-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-06-10",
  "performer" : [{
    "reference" : "Organization/Brustzentrum-Charite"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
      "code" : "T",
      "display" : "Teilremission (partial remission, PR)"
    }]
  },
  "method" : {
    "coding" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
      "code" : "aktiv",
      "display" : "Aktive Nachsorge"
    }]
  },
  "component" : [{
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "445200009",
        "display" : "Status of residual neoplasm (observable entity)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor",
        "code" : "T",
        "display" : "Tumorreste (Residualtumor)"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399656008",
        "display" : "Presence of metastatic neoplasm in regional lymph node (observable entity)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten",
        "code" : "K",
        "display" : "kein Lymphknotenbefall nachweisbar"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "399608002",
        "display" : "Status of distant metastasis (observable entity)"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen",
        "code" : "K",
        "display" : "keine Fernmetastasen nachweisbar"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
        "code" : "zweittumor",
        "display" : "Zweittumor"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "373067005",
        "display" : "No (qualifier value)"
      }]
    }
  }]
}

```
