# CS Senologie Clinical Findings Custom - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Clinical Findings Custom**

## CodeSystem: CS Senologie Clinical Findings Custom 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:CS_Senologie_Clinical_Findings_Custom |

 
Custom Codes für klinische Senologie-Befunde ohne direktes SNOMED-Mapping (Ptosis-Grad, Tumornachweis-Erstdiagnose-Mammakarzinom). 

This Code system is referenced in the definition of the following value sets:

* [VS Senologie Kontrolltermin-Art](ValueSet-vs-senologie-kontrolltermin-art.md)
* [VS Senologie Ptosis-Grad (Regnault)](ValueSet-vs-senologie-ptosis-grad.md)
* [VS Senologie RECIST-Response](ValueSet-vs-senologie-recist-response.md)
* [VS Senologie Tumornachweis-Status](ValueSet-vs-senologie-tumornachweis-status.md)

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-clinical-findings-custom",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablecodesystem",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablecodesystem"]
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
  "url" : "https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom",
  "version" : "0.10.0",
  "name" : "CS_Senologie_Clinical_Findings_Custom",
  "title" : "CS Senologie Clinical Findings Custom",
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
  "description" : "Custom Codes für klinische Senologie-Befunde ohne direktes SNOMED-Mapping (Ptosis-Grad, Tumornachweis-Erstdiagnose-Mammakarzinom).",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 11,
  "concept" : [{
    "code" : "ptosis-0",
    "display" : "Ptosis Grad 0 — keine Ptosis"
  },
  {
    "code" : "ptosis-i",
    "display" : "Ptosis Grad I — leichte Ptosis (Mamille auf Höhe Inframammarfalte)"
  },
  {
    "code" : "ptosis-ii",
    "display" : "Ptosis Grad II — moderate Ptosis (Mamille 1-3 cm unter Inframammarfalte)"
  },
  {
    "code" : "ptosis-iii",
    "display" : "Ptosis Grad III — schwere Ptosis (Mamille > 3 cm unter Inframammarfalte, kaudal-orientiert)"
  },
  {
    "code" : "tumornachweis-erstdiagnose-bc",
    "display" : "Erstdiagnose Mammakarzinom (klinisch festgestellt)"
  },
  {
    "code" : "tumornachweis-gemischtes-ansprechen",
    "display" : "Gemischtes Ansprechen (Mixed Response)"
  },
  {
    "code" : "kontrolle-6-monate",
    "display" : "6-Monats-Kontrolle"
  },
  {
    "code" : "kontrolle-12-monate",
    "display" : "12-Monats-Kontrolle"
  },
  {
    "code" : "kontrolle-ausserplan",
    "display" : "Außerplanmäßige Kontrolle"
  },
  {
    "code" : "kontrolle-abschluss",
    "display" : "Abschlusskontrolle"
  },
  {
    "code" : "kein-anhalt-tumor",
    "display" : "Kein Anhalt für Tumor"
  }]
}

```
