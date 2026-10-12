# Fall 14: Mammakarzinom links C50.3, cT2 cN0 cM0 → pT4b pN1a - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 14: Mammakarzinom links C50.3, cT2 cN0 cM0 → pT4b pN1a**

## Example Condition: Fall 14: Mammakarzinom links C50.3, cT2 cN0 cM0 → pT4b pN1a

-------

**English**

-------

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2025-01-15

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Problem List Item, Neoplastic disease

**code**: Bösartige Neubildung der unteren inneren Quadranten der Brustdrüse

**bodySite**: Links

**subject**: [Patient Test Male, DoB: 1946 ( http://fhir.bih-charite.de/sid/patient-id#Fall14-Patient-1)](Patient-Fall14-Patient-OncoBox-Beispiel.md)

**recordedDate**: 2025-01-15



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall14-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2025-01-15"
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
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-category",
      "code" : "problem-list-item"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "386661006"
    }]
  },
  {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "55342001",
      "display" : "Neoplastic disease"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "2025",
      "code" : "C50.3",
      "display" : "Bösartige Neubildung der unteren inneren Quadranten der Brustdrüse"
    }]
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "7771000",
      "display" : "Links"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall14-Patient-OncoBox-Beispiel"
  },
  "recordedDate" : "2025-01-15"
}

```
