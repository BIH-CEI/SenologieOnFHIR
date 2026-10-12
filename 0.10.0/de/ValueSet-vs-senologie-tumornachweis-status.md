# VS Senologie Tumornachweis-Status - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Tumornachweis-Status**

## ValueSet: VS Senologie Tumornachweis-Status 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ValueSet/vs-senologie-tumornachweis-status | **:0.10.0 |
| Draft | **:VS_Senologie_Tumornachweis_Status |

 
Diagnostische Stati + RECIST-Response-Assessment für die klinische Untersuchung. Mischung aus Diagnose-Stage (Abklärungsbedürftig, Erstdiagnose) und Verlaufs-Response-Werten (SD/PR/CR/PD/Mixed). 

 **References** 

* [Fragebogen: Klinische Untersuchung Mamma](Questionnaire-senologie-klinische-untersuchung.md)

### Logical Definition (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-tumornachweis-status",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"]
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
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "computable"
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
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-topic",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl",
        "code" : "C4872",
        "display" : "Breast Carcinoma"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-author",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "email",
        "value" : "thomas.debertshaeuser@charite.de"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-editor",
    "valueContactDetail" : {
      "name" : "Berlin Institute of Health at Charité (BIH)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.bihealth.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-reviewer",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-endorser",
    "valueContactDetail" : {
      "name" : "Deutsche Gesellschaft für Senologie (DGS)",
      "telecom" : [{
        "system" : "url",
        "value" : "https://www.senologie.org"
      }]
    }
  }],
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumornachweis-status",
  "version" : "0.10.0",
  "name" : "VS_Senologie_Tumornachweis_Status",
  "title" : "VS Senologie Tumornachweis-Status",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-10-12",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "_publisher" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Berlin Institute of Health at Charité (BIH)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Diagnostische Stati + RECIST-Response-Assessment für die klinische Untersuchung. Mischung aus Diagnose-Stage (Abklärungsbedürftig, Erstdiagnose) und Verlaufs-Response-Werten (SD/PR/CR/PD/Mixed).",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "134405005",
        "display" : "Abklärungsbedürftiger Befund (Malignant neoplasm of breast suspected)"
      },
      {
        "code" : "260388006",
        "display" : "Verlauf — Stable disease (SD)"
      },
      {
        "code" : "551001000124108",
        "display" : "Verlauf — Partielle Remission (PR)"
      },
      {
        "code" : "550991000124107",
        "display" : "Verlauf — Komplettremission (CR)"
      },
      {
        "code" : "419835002",
        "display" : "Verlauf — Progressive Disease (PD)"
      }]
    },
    {
      "system" : "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom",
      "concept" : [{
        "code" : "tumornachweis-erstdiagnose-bc",
        "display" : "Erstdiagnose Mammakarzinom"
      },
      {
        "code" : "tumornachweis-gemischtes-ansprechen",
        "display" : "Verlauf — Gemischtes Ansprechen (Mixed)"
      }]
    }]
  }
}

```
