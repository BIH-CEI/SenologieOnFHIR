# Senologie Measure S3-QI-12: ER/PR-Bestimmung mit % und Intensität - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Senologie Measure S3-QI-12: ER/PR-Bestimmung mit % und Intensität**

## Measure: Senologie Measure S3-QI-12: ER/PR-Bestimmung mit % und Intensität 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-12 | *Version*:0.10.0 |
| Active as of 2026-05-13 | *Computable Name*:SenologieMeasureS3QI12 |

 
ER/PR-Bestimmung mit % und Intensität — S3 Mammakarzinom QI-12 

-------

**English**

-------

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SenologieMeasureS3QI12
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Senologie Measure S3-QI-12: ER/PR-Bestimmung mit % und Intensität
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: false
* Knowledge Artifact Metadata: Description
  * ?: ER/PR-Bestimmung mit % und Intensität — S3 Mammakarzinom QI-12
* Knowledge Artifact Metadata: Topic
  * ?: Breast Carcinoma
* Knowledge Artifact Metadata: Measure Developer
  * ?: Berlin Institute of Health at Charité (BIH):[thomas.debertshaeuser@charite.de](mailto:thomas.debertshaeuser@charite.de)
* Knowledge Artifact Metadata: Measure Editor
  * ?: Berlin Institute of Health at Charité (BIH):[https://www.bihealth.org](https://www.bihealth.org)
* Knowledge Artifact Metadata: Measure Reviewer
  * ?: Deutsche Gesellschaft für Senologie (DGS):[https://www.senologie.org](https://www.senologie.org)
* Knowledge Artifact Metadata: Measure Endorser
  * ?: Deutsche Gesellschaft für Senologie (DGS):[https://www.senologie.org](https://www.senologie.org)
* Knowledge Artifact Metadata: Measure Steward
  * ?: Berlin Institute of Health at Charité (BIH)
* Knowledge Artifact Metadata: Steward Contact Details
  * ?: Berlin Institute of Health at Charité (BIH):[https://www.bihealth.org](https://www.bihealth.org)
* Knowledge Artifact Metadata: Knowledge Capability
  * ?: shareable
* Knowledge Artifact Metadata: Knowledge Capability
  * ?: publishable
* Knowledge Artifact Metadata: Measure Metadata
* Knowledge Artifact Metadata: Version Number
  * ?: 0.10.0
* Knowledge Artifact Metadata: Measure Scoring
  * ?: Proportion
* Knowledge Artifact Metadata: Measure Type
  * ?: Process
* Knowledge Artifact Metadata: Measure Population Criteria (ID: qi-12-group)
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: qi-12-initial-population**Description**: No description provided**Logic Definition**:[HasInvasiveOrDCIS](#qualitaetsindikatorenleitlinie-hasinvasiveordcis)
* Knowledge Artifact Metadata: Denominator
  * ?: **ID**: qi-12-denominator**Description**: No description provided**Logic Definition**:[HasQI12Nenner](#qualitaetsindikatorenleitlinie-hasqi12nenner)
* Knowledge Artifact Metadata: Numerator
  * ?: **ID**: qi-12-numerator**Description**: No description provided**Logic Definition**:[HasQI12Zaehler](#qualitaetsindikatorenleitlinie-hasqi12zaehler)
* Knowledge Artifact Metadata: Measure Logic
* Knowledge Artifact Metadata: Primary Library
  * ?: [Library: QualitaetsindikatorenLeitlinie](Library-QualitaetsindikatorenLeitlinie.md)
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates



## Resource Content

```json
{
  "resourceType" : "Measure",
  "id" : "senologie-measure-s3-qi-12",
  "meta" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-license",
      "valueCode" : "CC-BY-4.0"
    },
    {
      "extension" : [{
        "url" : "packageId",
        "valueId" : "kds-senologie"
      },
      {
        "url" : "version",
        "valueString" : "0.10.0"
      },
      {
        "url" : "uri",
        "valueUri" : "https://www.senologie.org/fhir"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/package-source"
    }],
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablemeasure",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablemeasure"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "shareable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "publishable"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionPolicy",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/artifact-version-policy-codes",
        "version" : "3.0.0",
        "code" : "package",
        "display" : "Package"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
    }
  }],
  "url" : "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-12",
  "version" : "0.10.0",
  "name" : "SenologieMeasureS3QI12",
  "title" : "Senologie Measure S3-QI-12: ER/PR-Bestimmung mit % und Intensität",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-05-13",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "ER/PR-Bestimmung mit % und Intensität — S3 Mammakarzinom QI-12",
  "topic" : [{
    "coding" : [{
      "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
      "code" : "C4872",
      "display" : "Breast Carcinoma"
    }]
  }],
  "author" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "email",
      "value" : "thomas.debertshaeuser@charite.de"
    }]
  }],
  "editor" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "reviewer" : [{
    "name" : "Deutsche Gesellschaft für Senologie (DGS)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.senologie.org"
    }]
  }],
  "endorser" : [{
    "name" : "Deutsche Gesellschaft für Senologie (DGS)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.senologie.org"
    }]
  }],
  "library" : ["https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"],
  "scoring" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/measure-scoring",
      "code" : "proportion"
    }]
  },
  "type" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/measure-type",
      "code" : "process"
    }]
  }],
  "group" : [{
    "id" : "qi-12-group",
    "population" : [{
      "id" : "qi-12-initial-population",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "initial-population"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "HasInvasiveOrDCIS"
      }
    },
    {
      "id" : "qi-12-denominator",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "denominator"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "HasQI12Nenner"
      }
    },
    {
      "id" : "qi-12-numerator",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "numerator"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "HasQI12Zaehler"
      }
    }]
  }]
}

```
