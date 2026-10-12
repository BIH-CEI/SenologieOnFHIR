# Fall 15: Mammakarzinom rechts C50.4 cT1c - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Fall 15: Mammakarzinom rechts C50.4 cT1c**

## Example Condition: Fall 15: Mammakarzinom rechts C50.4 cT1c

-------

**English**

-------

Profile: [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md)

**Condition Asserted Date**: 2020-02-16

**clinicalStatus**: Active

**verificationStatus**: Confirmed

**category**: Ersterkrankung, Neoplastic disease

**code**: Mammakarzinom

**bodySite**: Rechts

**subject**: [Michaela van Musterfrau (official) Female, DoB: 1950-10-15 ( http://fhir.de/sid/gkv/kvid-10#NamingSystemKVID#T221038567)](Patient-Fall15-Patient-Michaela-Musterfrau.md)

**onset**: 2020-02-16

**recordedDate**: 2020-02-16



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Fall15-Diagnose-Mammakarzinom",
  "meta" : {
    "profile" : ["https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/condition-assertedDate",
    "valueDateTime" : "2020-02-16"
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
      "code" : "7"
    }]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "255217005",
      "display" : "Ersterkrankung"
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
      "system" : "http://snomed.info/sct",
      "code" : "254837009",
      "display" : "Mammakarzinom"
    },
    {
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "version" : "10 2020 GM",
      "code" : "C50.4",
      "display" : "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
    }]
  },
  "bodySite" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "24028007",
      "display" : "Rechts"
    },
    {
      "system" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation",
      "code" : "R",
      "display" : "Rechts"
    }]
  }],
  "subject" : {
    "reference" : "Patient/Fall15-Patient-Michaela-Musterfrau"
  },
  "onsetDateTime" : "2020-02-16",
  "recordedDate" : "2020-02-16"
}

```
