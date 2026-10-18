# OncoBox Endokrine Substanzklasse zu ATC - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OncoBox Endokrine Substanzklasse zu ATC**

## ConceptMap: OncoBox Endokrine Substanzklasse zu ATC (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ConceptMap/cm-oncobox-endokrine-substanz-atc | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*: |

 
Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor) 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-oncobox-endokrine-substanz-atc",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-oncobox-endokrine-substanz-atc",
  "version" : "0.10.0",
  "title" : "OncoBox Endokrine Substanzklasse zu ATC",
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
  "description" : "Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor)",
  "sourceUri" : "http://fhir.de/CodeSystem/bfarm/atc",
  "targetUri" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-endokrine-substanz",
  "group" : [{
    "source" : "http://fhir.de/CodeSystem/bfarm/atc",
    "target" : "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-endokrine-substanz",
    "element" : [{
      "code" : "L02BA01",
      "display" : "Tamoxifen",
      "target" : [{
        "code" : "1",
        "display" : "Tamoxifen",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "L02BG03",
      "display" : "Anastrozol",
      "target" : [{
        "code" : "2",
        "display" : "Aromatasehemmer",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02BG04",
      "display" : "Letrozol",
      "target" : [{
        "code" : "2",
        "display" : "Aromatasehemmer",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02BG06",
      "display" : "Exemestan",
      "target" : [{
        "code" : "2",
        "display" : "Aromatasehemmer",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02AE02",
      "display" : "Leuprorelin",
      "target" : [{
        "code" : "3",
        "display" : "GnRH-Analogon",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02AE03",
      "display" : "Goserelin",
      "target" : [{
        "code" : "3",
        "display" : "GnRH-Analogon",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L02BA03",
      "display" : "Fulvestrant",
      "target" : [{
        "code" : "4",
        "display" : "Fulvestrant",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "L01EF01",
      "display" : "Palbociclib",
      "target" : [{
        "code" : "5",
        "display" : "CDK4/6-Inhibitor",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L01EF02",
      "display" : "Ribociclib",
      "target" : [{
        "code" : "5",
        "display" : "CDK4/6-Inhibitor",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "L01EF03",
      "display" : "Abemaciclib",
      "target" : [{
        "code" : "5",
        "display" : "CDK4/6-Inhibitor",
        "equivalence" : "wider"
      }]
    }]
  }]
}

```
