# CodeSystem Diagnosesicherung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CodeSystem Diagnosesicherung**

## CodeSystem: CodeSystem Diagnosesicherung 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung | **:0.10.0 |
| Draft | **:CSSenologieDiagnosesicherung |

 
Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz) 

* [ValueSet Diagnosesicherung](ValueSet-vs-senologie-diagnosesicherung.md)

-------

 . 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-diagnosesicherung",
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
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung",
  "version" : "0.10.0",
  "name" : "CSSenologieDiagnosesicherung",
  "title" : "CodeSystem Diagnosesicherung",
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
  "description" : "Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz)",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 12,
  "concept" : [{
    "code" : "1",
    "display" : "Klinisch ohne weitere Spezifizierung",
    "definition" : "Klinische Angaben (ohne die nachfolgenden Kategorien)"
  },
  {
    "code" : "2",
    "display" : "Klinische Diagnostik",
    "definition" : "Spezifische Diagnostik wie Endoskopie, bildgebende Verfahren, Ultraschall, explorative Eingriffe"
  },
  {
    "code" : "3",
    "display" : "Chirurgisch/Autopsie ohne Histologie",
    "definition" : "Chirurgische Eingriffe (wie Laparotomie) und Autopsie, aber ohne Gewebsuntersuchung"
  },
  {
    "code" : "4",
    "display" : "Spezifische Tumormarker",
    "definition" : "Biochemische und/oder immunologische Marker, die für einen bestimmten Tumorsitz spezifisch sind"
  },
  {
    "code" : "5",
    "display" : "Zytologie",
    "definition" : "Untersuchung von Zellen aus primärem oder sekundärem Sitz, einschließlich Aspiraten"
  },
  {
    "code" : "6",
    "display" : "Histologie einer Metastase",
    "definition" : "Histologische Untersuchung von Metastasengewebe"
  },
  {
    "code" : "7",
    "display" : "Histologie Primärtumor",
    "definition" : "Histologische Untersuchung eines Primärtumors"
  },
  {
    "code" : "7.1",
    "display" : "Histologie nach Operation",
    "definition" : "Histologische Untersuchung nach operativer Entfernung"
  },
  {
    "code" : "7.2",
    "display" : "Histologie nach Biopsie",
    "definition" : "Histologische Untersuchung nach Biopsie"
  },
  {
    "code" : "7.3",
    "display" : "Histologie nach Autopsie",
    "definition" : "Histologische Untersuchung nach Autopsie"
  },
  {
    "code" : "8",
    "display" : "Genetisch/Molekularbiologisch",
    "definition" : "Zytogenetische und/oder molekularbiologische Untersuchung"
  },
  {
    "code" : "9",
    "display" : "Unbekannt",
    "definition" : "Diagnosesicherung unbekannt"
  }]
}

```
