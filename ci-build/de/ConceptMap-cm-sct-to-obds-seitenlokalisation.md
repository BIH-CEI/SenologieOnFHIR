# SNOMED CT to oBDS Seitenlokalisation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Seitenlokalisation**

## ConceptMap: SNOMED CT to oBDS Seitenlokalisation 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation | **:0.10.0 |
| Draft | **: |

 
Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-seitenlokalisation",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-seitenlokalisation",
  "version" : "0.10.0",
  "title" : "SNOMED CT to oBDS Seitenlokalisation",
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
  "description" : "Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation",
    "element" : [{
      "code" : "24028007",
      "display" : "Right (qualifier value)",
      "target" : [{
        "code" : "R",
        "display" : "rechts",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "7771000",
      "display" : "Left (qualifier value)",
      "target" : [{
        "code" : "L",
        "display" : "links",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "51440002",
      "display" : "Right and left (qualifier value)",
      "target" : [{
        "code" : "B",
        "display" : "beidseitig",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "260528009",
      "display" : "Median (qualifier value)",
      "target" : [{
        "code" : "M",
        "display" : "Mittellinie/mittig",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "261665006",
      "display" : "Unknown (qualifier value)",
      "target" : [{
        "code" : "U",
        "display" : "unbekannt",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "385432009",
      "display" : "Not applicable (qualifier value)",
      "target" : [{
        "code" : "T",
        "display" : "trifft nicht zu",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
