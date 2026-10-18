# SNOMED CT to oBDS Therapieart - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Therapieart**

## ConceptMap: SNOMED CT to oBDS Therapieart 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapieart | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*: |

 
Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-therapieart",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-therapieart",
  "version" : "0.10.0",
  "title" : "SNOMED CT to oBDS Therapieart",
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
  "description" : "Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapie-typ",
    "element" : [{
      "code" : "367336001",
      "display" : "Chemotherapy (procedure)",
      "target" : [{
        "code" : "CH",
        "display" : "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "169413002",
      "display" : "Hormone therapy (procedure)",
      "target" : [{
        "code" : "HO",
        "display" : "Hormontherapie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "897713009",
      "display" : "Immunotherapy (procedure)",
      "target" : [{
        "code" : "IM",
        "display" : "Immun-/Antikoerpertherapie",
        "equivalence" : "narrower",
        "comment" : "SNOMED 897713009 wird sowohl fuer IM als auch fuer CI und CIZ verwendet; hier wird IM als Standardziel gewaehlt"
      }]
    },
    {
      "code" : "1255831008",
      "display" : "Chemotherapy for malignant neoplastic disease using targeted agent (procedure)",
      "target" : [{
        "code" : "ZS",
        "display" : "zielgerichtete Substanzen",
        "equivalence" : "narrower",
        "comment" : "SNOMED 1255831008 wird sowohl fuer ZS als auch CZ verwendet; hier wird ZS als Standardziel gewaehlt"
      }]
    },
    {
      "code" : "1269349006",
      "display" : "Transplantation of stem cell (procedure)",
      "target" : [{
        "code" : "SZ",
        "display" : "Stammzelltransplantation (inkl. Knochenmarktransplantation)",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
