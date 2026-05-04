# Fall 2: Progression — hepatische Metastasen - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 2: Progression — hepatische Metastasen**

## Example Condition: Fall 2: Progression — hepatische Metastasen

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2026-08-10

**Condition Occurred Following**: [Condition Malignant neoplasm of breast](Condition-Fall2-Diagnose-Mammakarzinom.md)

**clinicalStatus**: Recurrence

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Progression: hepatische Metastasierung bei triple-negativem Mammakarzinom

**bodySite**: Right breast structure

**subject**: [Lena Hoffmann Female, DoB: 1980-09-28 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2025-002)](Patient-Fall2-Patient-Lena-Hoffmann.md)

**recordedDate**: 2026-08-10

### Stages

| | | |
| :--- | :--- | :--- |
| - | **Summary** | **Type** |
| * | M1 (HEP) — hepatische Metastasen | Clinical stage (observable entity) |



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall2-Diagnose-Progression",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2026-08-10"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-occurredFollowing",
    "valueReference" : {
      "reference" : "Condition/Fall2-Diagnose-Mammakarzinom"
    }
  }],
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "recurrence"
    }]
  },
  "verificationStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung",
      "code" : "7",
      "display" : "histologische Untersuchung eines Primärtumors"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Malignant neoplasm of breast"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "C50.1",
      "display" : "Bösartige Neubildung: Zentraler Drüsenkörper der Brustdrüse"
    }],
    "text" : "Progression: hepatische Metastasierung bei triple-negativem Mammakarzinom"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "73056007",
      "display" : "Right breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall2-Patient-Lena-Hoffmann"
  },
  "recordedDate" : "2026-08-10",
  "stage" : [{
    "summary" : {
      "text" : "M1 (HEP) — hepatische Metastasen"
    },
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "385349001",
        "display" : "Clinical stage (observable entity)"
      }]
    }
  }]
}

```
