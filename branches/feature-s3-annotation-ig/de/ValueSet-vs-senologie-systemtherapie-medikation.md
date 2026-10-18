# VS Senologie Systemtherapie Medikation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Systemtherapie Medikation**

## ValueSet: VS Senologie Systemtherapie Medikation () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation | **:0.10.0 |
| Draft | **:VS_Senologie_Systemtherapie_Medikation |

 
Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01) 

 **References** 

* [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md)
* [Fragebogen: Systemische Therapie](Questionnaire-senologie-systemtherapie.md)

### Logical Definition (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-systemtherapie-medikation",
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
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation",
  "version" : "0.10.0",
  "name" : "VS_Senologie_Systemtherapie_Medikation",
  "title" : "VS Senologie Systemtherapie Medikation",
  "status" : "draft",
  "experimental" : true,
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
  "description" : "Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01)",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "715958001",
        "display" : "Palbociclib"
      },
      {
        "code" : "732257004",
        "display" : "Ribociclib"
      },
      {
        "code" : "761851004",
        "display" : "Abemaciclib"
      },
      {
        "code" : "387381009",
        "display" : "Methotrexate"
      },
      {
        "code" : "387172005",
        "display" : "Fluorouracil"
      },
      {
        "code" : "386920008",
        "display" : "Gemcitabine"
      },
      {
        "code" : "386906001",
        "display" : "Capecitabine"
      },
      {
        "code" : "372817009",
        "display" : "Doxorubicin"
      },
      {
        "code" : "772118008",
        "display" : "Doxorubicin hydrochloride pegylated liposome"
      },
      {
        "code" : "372715008",
        "display" : "Daunorubicin"
      },
      {
        "code" : "417916005",
        "display" : "Epirubicin"
      },
      {
        "code" : "372539000",
        "display" : "Idarubicin"
      },
      {
        "code" : "386913001",
        "display" : "Mitoxantrone"
      },
      {
        "code" : "386918005",
        "display" : "Docetaxel"
      },
      {
        "code" : "387318005",
        "display" : "Cisplatin"
      },
      {
        "code" : "386905002",
        "display" : "Carboplatin"
      },
      {
        "code" : "387420009",
        "display" : "Cyclophosphamide"
      },
      {
        "code" : "387331000",
        "display" : "Mitomycin"
      },
      {
        "code" : "708166000",
        "display" : "Eribulin"
      }]
    }]
  }
}

```
