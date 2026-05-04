# Beispiel: Mammakarzinom links - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Mammakarzinom links**

## Example Condition: Beispiel: Mammakarzinom links

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2024-03-15

**clinicalStatus**: Active

**verificationStatus**: histologische Untersuchung eines Primärtumors

**category**: Primärtumor, Regionäre Lymphknotenmetastasen

**code**: Mammakarzinom links, oberer äußerer Quadrant

**bodySite**: Left breast structure

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**onset**: 2024-01-10

**recordedDate**: 2024-03-15

### Stages

| | | |
| :--- | :--- | :--- |
| - | **Summary** | **Type** |
| * | Stage 2 | Tumor staging |



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Example-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2024-03-15"
  }],
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
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
  "category" : [{
    "coding" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation",
      "code" : "primaertumor",
      "display" : "Primärtumor"
    }]
  },
  {
    "coding" : [{
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation",
      "code" : "regionaere-lk",
      "display" : "Regionäre Lymphknotenmetastasen"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Malignant neoplasm of breast"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2024",
      "code" : "C50.4",
      "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
    }],
    "text" : "Mammakarzinom links, oberer äußerer Quadrant"
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "80248007",
      "display" : "Left breast structure"
    }]
  }],
  "subject" : {
    "reference" : "Patient/example-patient"
  },
  "onsetDateTime" : "2024-01-10",
  "recordedDate" : "2024-03-15",
  "stage" : [{
    "summary" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "258219007",
        "display" : "Stage 2"
      }]
    },
    "type" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "254292007",
        "display" : "Tumor staging"
      }]
    }
  }]
}

```
