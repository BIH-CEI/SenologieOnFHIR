# SNOMED CT Diagnostik-Procedure zu oBDS Diagnosesicherung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT Diagnostik-Procedure zu oBDS Diagnosesicherung**

## ConceptMap: SNOMED CT Diagnostik-Procedure zu oBDS Diagnosesicherung 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-diagnosesicherung | **:0.10.0 |
| Draft | **:CmSctToObdsDiagnosesicherung |

 
Mapping: SNOMED CT Biopsie-Codes → oBDS-Diagnosesicherungscode (5.7). Stützt CQL-QI-2 mit Datenquellen-Agnostik. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-diagnosesicherung",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-diagnosesicherung",
  "version" : "0.10.0",
  "name" : "CmSctToObdsDiagnosesicherung",
  "title" : "SNOMED CT Diagnostik-Procedure zu oBDS Diagnosesicherung",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-05-13",
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
  "description" : "Mapping: SNOMED CT Biopsie-Codes → oBDS-Diagnosesicherungscode (5.7). Stützt CQL-QI-2 mit Datenquellen-Agnostik.",
  "sourceUri" : "http://snomed.info/sct",
  "targetUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung",
    "element" : [{
      "code" : "119738008",
      "display" : "Core biopsy of breast (procedure)",
      "target" : [{
        "code" : "7",
        "display" : "histologische Untersuchung eines Primärtumors",
        "equivalence" : "relatedto"
      }]
    },
    {
      "code" : "1188850001",
      "display" : "Vacuum-assisted biopsy of breast",
      "target" : [{
        "code" : "7",
        "display" : "histologische Untersuchung eines Primärtumors",
        "equivalence" : "relatedto"
      }]
    },
    {
      "code" : "122548005",
      "display" : "Biopsy of breast (procedure)",
      "target" : [{
        "code" : "7",
        "display" : "histologische Untersuchung eines Primärtumors",
        "equivalence" : "relatedto"
      }]
    },
    {
      "code" : "51632004",
      "display" : "Excisional biopsy",
      "target" : [{
        "code" : "8",
        "display" : "intraoperative histologische Untersuchung",
        "equivalence" : "relatedto"
      }]
    }]
  }]
}

```
