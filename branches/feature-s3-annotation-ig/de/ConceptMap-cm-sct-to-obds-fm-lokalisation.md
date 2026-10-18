# SNOMED CT to oBDS Fernmetastasen-Lokalisation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Fernmetastasen-Lokalisation**

## ConceptMap: SNOMED CT to oBDS Fernmetastasen-Lokalisation 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation | **:0.10.0 |
| Draft | **: |

 
Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-fm-lokalisation",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableconceptmap",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableconceptmap"]
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-fm-lokalisation",
  "version" : "0.10.0",
  "title" : "SNOMED CT to oBDS Fernmetastasen-Lokalisation",
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
  "description" : "Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-fernmetastasen",
    "element" : [{
      "code" : "258332000",
      "display" : "PUL (body structure)",
      "target" : [{
        "code" : "PUL",
        "display" : "Lunge",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258333005",
      "display" : "OSS (body structure)",
      "target" : [{
        "code" : "OSS",
        "display" : "Knochen",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258334004",
      "display" : "HEP (body structure)",
      "target" : [{
        "code" : "HEP",
        "display" : "Leber",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "313367003",
      "display" : "BRA (body structure)",
      "target" : [{
        "code" : "BRA",
        "display" : "Hirn",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258336002",
      "display" : "LYM (body structure)",
      "target" : [{
        "code" : "LYM",
        "display" : "Lymphknoten",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "14016003",
      "display" : "Bone marrow structure (body structure)",
      "target" : [{
        "code" : "MAR",
        "display" : "Knochenmark",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258337006",
      "display" : "PLE (body structure)",
      "target" : [{
        "code" : "PLE",
        "display" : "Pleura",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258338001",
      "display" : "PER (body structure)",
      "target" : [{
        "code" : "PER",
        "display" : "Peritoneum",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258339009",
      "display" : "ADR (body structure)",
      "target" : [{
        "code" : "ADR",
        "display" : "Nebennieren",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258340006",
      "display" : "SKI (body structure)",
      "target" : [{
        "code" : "SKI",
        "display" : "Haut",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "258348004",
      "display" : "OTH (body structure)",
      "target" : [{
        "code" : "OTH",
        "display" : "andere Organe",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "405843009",
      "display" : "Widespread metastatic malignant neoplastic disease (disorder)",
      "target" : [{
        "code" : "GEN",
        "display" : "generalisierte Metastasierung",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
