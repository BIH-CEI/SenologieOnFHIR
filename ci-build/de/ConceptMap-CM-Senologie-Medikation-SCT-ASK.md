# ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie)**

## ConceptMap: ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie) 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/CM-Senologie-Medikation-SCT-ASK | **:0.10.0 |
| Draft | **: |

 
Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf Arzneistoffkatalog (ASK, BfArM 2026). Validiert über fhir-terminology MCP Server. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "CM-Senologie-Medikation-SCT-ASK",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/CM-Senologie-Medikation-SCT-ASK",
  "version" : "0.10.0",
  "title" : "ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie)",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-03-14",
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
  "description" : "Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf Arzneistoffkatalog (ASK, BfArM 2026). Validiert über fhir-terminology MCP Server.",
  "sourceUri" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-systemtherapie-medikation",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "http://fhir.de/CodeSystem/ask",
    "element" : [{
      "code" : "715958001",
      "display" : "Palbociclib",
      "target" : [{
        "code" : "37539",
        "display" : "Palbociclib",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "732257004",
      "display" : "Ribociclib",
      "target" : [{
        "code" : "41432",
        "display" : "Ribociclib",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "761851004",
      "display" : "Abemaciclib",
      "target" : [{
        "code" : "41207",
        "display" : "Abemaciclib",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "387381009",
      "display" : "Methotrexate",
      "target" : [{
        "code" : "00658",
        "display" : "Methotrexat",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "387172005",
      "display" : "Fluorouracil",
      "target" : [{
        "code" : "07374",
        "display" : "Fluorouracil",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "386920008",
      "display" : "Gemcitabine",
      "target" : [{
        "code" : "26094",
        "display" : "Gemcitabin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "386906001",
      "display" : "Capecitabine",
      "target" : [{
        "code" : "28663",
        "display" : "Capecitabin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "372817009",
      "display" : "Doxorubicin",
      "target" : [{
        "code" : "06459",
        "display" : "Doxorubicin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "772118008",
      "display" : "Doxorubicin hydrochloride pegylated liposome",
      "target" : [{
        "code" : "06459",
        "display" : "Doxorubicin",
        "equivalence" : "wider",
        "comment" : "ASK codiert auf Wirkstoffebene, nicht auf Darreichungsform-Ebene. Peg. lipo. Doxorubicin hat keinen eigenen ASK-Code."
      }]
    },
    {
      "code" : "372715008",
      "display" : "Daunorubicin",
      "target" : [{
        "code" : "07162",
        "display" : "Daunorubicin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "417916005",
      "display" : "Epirubicin",
      "target" : [{
        "code" : "22965",
        "display" : "Epirubicin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "372539000",
      "display" : "Idarubicin",
      "target" : [{
        "code" : "22865",
        "display" : "Idarubicin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "386913001",
      "display" : "Mitoxantrone",
      "target" : [{
        "code" : "23189",
        "display" : "Mitoxantron",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "386918005",
      "display" : "Docetaxel",
      "target" : [{
        "code" : "26819",
        "display" : "Docetaxel",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "387318005",
      "display" : "Cisplatin",
      "target" : [{
        "code" : "15579",
        "display" : "Cisplatin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "386905002",
      "display" : "Carboplatin",
      "target" : [{
        "code" : "23168",
        "display" : "Carboplatin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "387420009",
      "display" : "Cyclophosphamide",
      "target" : [{
        "code" : "00533",
        "display" : "Cyclophosphamid",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "387331000",
      "display" : "Mitomycin",
      "target" : [{
        "code" : "07643",
        "display" : "Mitomycin",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "708166000",
      "display" : "Eribulin",
      "target" : [{
        "code" : "34925",
        "display" : "Eribulin",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
