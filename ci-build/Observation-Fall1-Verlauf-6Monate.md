# Fall 1: Verlaufskontrolle 6 Monate postoperativ - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 1: Verlaufskontrolle 6 Monate postoperativ**

## Example Observation: Fall 1: Verlaufskontrolle 6 Monate postoperativ

Profile: [BIH Senologie Follow-Up (Verlaufsmeldung)](StructureDefinition-senologie-follow-up.md)

**status**: Final

**code**: Status of regression of tumor (observable entity)

**subject**: [Erika Neumann Female, DoB: 1966-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-001)](Patient-Fall1-Patient-Erika-Neumann.md)

**focus**: [Condition Malignant neoplasm of breast](Condition-Fall1-Diagnose-Mammakarzinom.md)

**effective**: 2025-08-15

**performer**: [Organization Brustzentrum Charité — Universitätsmedizin Berlin](Organization-Brustzentrum-Charite.md)

**value**: keine Änderung (no change, NC) = stable disease

> **component****code**: Status of residual neoplasm (observable entity)**value**: kein Tumor nachweisbar

> **component****code**: Presence of metastatic neoplasm in regional lymph node (observable entity)**value**: kein Lymphknotenbefall nachweisbar

> **component****code**: Status of distant metastasis (observable entity)**value**: keine Fernmetastasen nachweisbar

> **component****code**: Art der Nachsorge**value**: Aktive Nachsorge

> **component****code**: Vitalstatus**value**: Alive (finding)

> **component****code**: Zweittumor**value**: No (qualifier value)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall1-Verlauf-6Monate",
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
    "reference" : "Patient/Fall1-Patient-Erika-Neumann"
  },
  "focus" : [{
    "reference" : "Condition/Fall1-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2025-08-15",
  "performer" : [{
    "reference" : "Organization/Brustzentrum-Charite"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
      "code" : "K",
      "display" : "keine Änderung (no change, NC) = stable disease"
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
        "code" : "K",
        "display" : "kein Tumor nachweisbar"
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
        "code" : "nachsorge-art",
        "display" : "Art der Nachsorge"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
        "code" : "aktiv",
        "display" : "Aktive Nachsorge"
      }]
    }
  },
  {
    "code" : {
      "coding" : [{
        "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up",
        "code" : "vitalstatus",
        "display" : "Vitalstatus"
      }]
    },
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "438949009",
        "display" : "Alive (finding)"
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
