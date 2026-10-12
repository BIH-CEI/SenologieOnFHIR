# LOINC Rezeptorstatus zu oBDS/OncoBox/IQTIG P/N/U - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **LOINC Rezeptorstatus zu oBDS/OncoBox/IQTIG P/N/U**

## ConceptMap: LOINC Rezeptorstatus zu oBDS/OncoBox/IQTIG P/N/U 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-loinc-rezeptorstatus-to-obds | **:0.10.0 |
| Draft | **:CmLoincRezeptorstatusToObds |

 
Mapping: LOINC Answer-Codes LA6576-8/LA6577-6/LA4489-6 (Positive/Negative/Unknown) → P/N/U Single-Code (oBDS, OncoBox, IQTIG). 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-loinc-rezeptorstatus-to-obds",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-loinc-rezeptorstatus-to-obds",
  "version" : "0.10.0",
  "name" : "CmLoincRezeptorstatusToObds",
  "title" : "LOINC Rezeptorstatus zu oBDS/OncoBox/IQTIG P/N/U",
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
  "description" : "Mapping: LOINC Answer-Codes LA6576-8/LA6577-6/LA4489-6 (Positive/Negative/Unknown) → P/N/U Single-Code (oBDS, OncoBox, IQTIG).",
  "sourceUri" : "http://loinc.org",
  "targetUri" : "urn:senologie:rezeptorstatus-pnu",
  "group" : [{
    "source" : "http://loinc.org",
    "target" : "urn:senologie:rezeptorstatus-pnu",
    "element" : [{
      "code" : "LA6576-8",
      "display" : "Positive",
      "target" : [{
        "code" : "P",
        "display" : "positiv",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "LA6577-6",
      "display" : "Negative",
      "target" : [{
        "code" : "N",
        "display" : "negativ",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "LA4489-6",
      "display" : "Unknown",
      "target" : [{
        "code" : "U",
        "display" : "unbekannt",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
