# Beispiel: Mammakarzinom-Rezidiv - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Beispiel: Mammakarzinom-Rezidiv**

## Example Condition: Beispiel: Mammakarzinom-Rezidiv

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2024-11-08

**Condition Occurred Following**: [Condition Malignant neoplasm of breast](Condition-Example-Diagnose-Mammakarzinom.md)

**clinicalStatus**: Recurrence

**verificationStatus**: histologische Untersuchung eines Primärtumors

**code**: Lokalrezidiv Mammakarzinom links

**bodySite**: Left breast structure

**subject**: [Maria Musterfrau Female, DoB: 1965-03-12 ( http://fhir.bih-charite.de/sid/patient-id#SENO-2024-001)](Patient-example-patient.md)

**recordedDate**: 2024-11-08

### Stages

| | | |
| :--- | :--- | :--- |
| - | **Summary** | **Type** |
| * | M0 - keine Fernmetastasen | Clinical stage (observable entity) |



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Example-Diagnose-Rezidiv",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2024-11-08"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-occurredFollowing",
    "valueReference" : {
      "reference" : "Condition/Example-Diagnose-Mammakarzinom"
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
      "version" : "2024",
      "code" : "C50.4",
      "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
    }],
    "text" : "Lokalrezidiv Mammakarzinom links"
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
  "recordedDate" : "2024-11-08",
  "stage" : [{
    "summary" : {
      "text" : "M0 - keine Fernmetastasen"
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
