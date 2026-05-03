# Fall 2: Verlaufsmeldung bei Tod - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Verlaufsmeldung bei Tod**

## Example Observation: Fall 2: Verlaufsmeldung bei Tod

Profile: [BIH Senologie Follow-Up (Verlaufsmeldung)](StructureDefinition-senologie-follow-up.md)

**status**: Final

**code**: Status of regression of tumor (observable entity)

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann-Verstorben.md)

**focus**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

**effective**: 2026-09-20

**performer**: [Organization Brustzentrum Charité — Universitätsmedizin Berlin](Organization-Brustzentrum-Charite.md)

**value**: Progression

> **component****code**: Status of residual neoplasm (observable entity)**value**: kein Tumor nachweisbar

> **component****code**: Presence of metastatic neoplasm in regional lymph node (observable entity)**value**: kein Lymphknotenbefall nachweisbar

> **component****code**: Status of distant metastasis (observable entity)**value**: Progression

> **component****code**: Art der Nachsorge**value**: Passive Nachsorge

> **component****code**: Vitalstatus**value**: Dead (finding)

> **component****code**: Zweittumor**value**: No (qualifier value)



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "Fall2-Verlauf-Tod",
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
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann-Verstorben"
  },
  "focus" : [{
    "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
  }],
  "effectiveDateTime" : "2026-09-20",
  "performer" : [{
    "reference" : "Organization/Brustzentrum-Charite"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung",
      "code" : "P",
      "display" : "Progression"
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
        "code" : "P",
        "display" : "Progression"
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
        "code" : "passiv",
        "display" : "Passive Nachsorge"
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
        "code" : "419099009",
        "display" : "Dead (finding)"
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
