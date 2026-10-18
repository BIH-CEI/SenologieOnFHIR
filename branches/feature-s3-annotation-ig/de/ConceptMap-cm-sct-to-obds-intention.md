# SNOMED CT to oBDS Intention - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SNOMED CT to oBDS Intention**

## ConceptMap: SNOMED CT to oBDS Intention 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-intention | **:0.10.0 |
| Draft | **: |

 
Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-sct-to-obds-intention",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-intention",
  "version" : "0.10.0",
  "title" : "SNOMED CT to oBDS Intention",
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
  "description" : "Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X)",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention",
    "element" : [{
      "code" : "373808002",
      "display" : "Curative - procedure intent (qualifier value)",
      "target" : [{
        "code" : "K",
        "display" : "kurativ",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "363676003",
      "display" : "Palliative - procedure intent (qualifier value)",
      "target" : [{
        "code" : "P",
        "display" : "palliativ",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "261004008",
      "display" : "Diagnostic intent (qualifier value)",
      "target" : [{
        "code" : "D",
        "display" : "diagnostisch",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "255231005",
      "display" : "Revision - value (qualifier value)",
      "target" : [{
        "code" : "R",
        "display" : "Revision/Komplikation",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "74964007",
      "display" : "Other (qualifier value)",
      "target" : [{
        "code" : "S",
        "display" : "Sonstiges",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "1287211007",
      "display" : "No information available (qualifier value)",
      "target" : [{
        "code" : "X",
        "display" : "fehlende Angabe",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
