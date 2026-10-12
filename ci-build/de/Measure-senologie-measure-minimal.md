# Senologie Measure Minimal (Debug) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Senologie Measure Minimal (Debug)**

## Measure: Senologie Measure Minimal (Debug) () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/Measure/senologie-measure-minimal | **:0.10.0 |
| Active | **:SenologieMeasureMinimal |

 
Trivial-Measure für CR-Engine-Sanity-Check (alles true). 

-------

**German**

-------

* Knowledge Artifact Metadata: Name (machine-readable)
  * ?: SenologieMeasureMinimal
* Knowledge Artifact Metadata: Title (human-readable)
  * ?: Senologie Measure Minimal (Debug)
* Knowledge Artifact Metadata: Status
  * ?: Active
* Knowledge Artifact Metadata: Experimental
  * ?: true
* Knowledge Artifact Metadata: Description
  * ?: Trivial-Measure für CR-Engine-Sanity-Check (alles true).
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
* Knowledge Artifact Metadata: Measure Population Criteria (ID: minimal-group)
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: minimal-initial-population**Description**: No description provided**Logic Definition**:[InInitialPopulation](#minimalmeasurelib-ininitialpopulation)
* Knowledge Artifact Metadata: Denominator
  * ?: **ID**: minimal-denominator**Description**: No description provided**Logic Definition**:[InDenominator](#minimalmeasurelib-indenominator)
* Knowledge Artifact Metadata: Numerator
  * ?: **ID**: minimal-numerator**Description**: No description provided**Logic Definition**:[InNumerator](#minimalmeasurelib-innumerator)
* Knowledge Artifact Metadata: Measure Population Criteria (ID: bet-bei-mamma-ca)
* Knowledge Artifact Metadata: Initial Population
  * ?: **ID**: bet-ip**Description**: No description provided**Logic Definition**:[HasMammaCa](#minimalmeasurelib-hasmammaca)
* Knowledge Artifact Metadata: Denominator
  * ?: **ID**: bet-denominator**Description**: No description provided**Logic Definition**:[HasMammaCa](#minimalmeasurelib-hasmammaca)
* Knowledge Artifact Metadata: Numerator
  * ?: **ID**: bet-numerator**Description**: No description provided**Logic Definition**:[HasBET](#minimalmeasurelib-hasbet)
* Knowledge Artifact Metadata: Measure Logic
* Knowledge Artifact Metadata: Primary Library
  * ?: [Library: MinimalMeasureLib](Library-MinimalMeasureLib.md)
* Knowledge Artifact Metadata: Generated using version 0.4.6 of the sample-content-ig Liquid templates



## Resource Content

```json
{
  "resourceType" : "Measure",
  "id" : "senologie-measure-minimal",
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
  "url" : "https://www.senologie.org/fhir/Measure/senologie-measure-minimal",
  "version" : "0.10.0",
  "name" : "SenologieMeasureMinimal",
  "title" : "Senologie Measure Minimal (Debug)",
  "status" : "active",
  "experimental" : true,
  "date" : "2026-05-13",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Trivial-Measure für CR-Engine-Sanity-Check (alles true).",
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
  "library" : ["https://www.senologie.org/fhir/Library/MinimalMeasureLib"],
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
    "id" : "minimal-group",
    "population" : [{
      "id" : "minimal-initial-population",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "initial-population"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "InInitialPopulation"
      }
    },
    {
      "id" : "minimal-denominator",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "denominator"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "InDenominator"
      }
    },
    {
      "id" : "minimal-numerator",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "numerator"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "InNumerator"
      }
    }]
  },
  {
    "id" : "bet-bei-mamma-ca",
    "population" : [{
      "id" : "bet-ip",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "initial-population"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "HasMammaCa"
      }
    },
    {
      "id" : "bet-denominator",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "denominator"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "HasMammaCa"
      }
    },
    {
      "id" : "bet-numerator",
      "code" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/measure-population",
          "code" : "numerator"
        }]
      },
      "criteria" : {
        "language" : "text/cql-identifier",
        "expression" : "HasBET"
      }
    }]
  }]
}

```
