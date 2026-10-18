# MII HER2 Leitlinien-Klassifikation zu oBDS/OncoBox/IQTIG P/N/U - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **MII HER2 Leitlinien-Klassifikation zu oBDS/OncoBox/IQTIG P/N/U**

## ConceptMap: MII HER2 Leitlinien-Klassifikation zu oBDS/OncoBox/IQTIG P/N/U 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-her2-leitlinie-to-obds | **:0.10.0 |
| Draft | **:CmHer2LeitlinieToObds |

 
Mapping: MII Her2neu-Leitlinien-Codes (positiv/low/ultralow/negativ/equivocal) → P/N/U. HER2-low und HER2-ultralow werden zu 'N' subsumiert (oBDS-Spec-Limitation). 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-her2-leitlinie-to-obds",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-her2-leitlinie-to-obds",
  "version" : "0.10.0",
  "name" : "CmHer2LeitlinieToObds",
  "title" : "MII HER2 Leitlinien-Klassifikation zu oBDS/OncoBox/IQTIG P/N/U",
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
  "description" : "Mapping: MII Her2neu-Leitlinien-Codes (positiv/low/ultralow/negativ/equivocal) → P/N/U. HER2-low und HER2-ultralow werden zu 'N' subsumiert (oBDS-Spec-Limitation).",
  "sourceUri" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
  "targetUri" : "urn:senologie:rezeptorstatus-pnu",
  "group" : [{
    "source" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie",
    "target" : "urn:senologie:rezeptorstatus-pnu",
    "element" : [{
      "code" : "positiv",
      "display" : "HER2-positiv",
      "target" : [{
        "code" : "P",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "low",
      "display" : "HER2-low",
      "target" : [{
        "code" : "N",
        "equivalence" : "wider",
        "comment" : "HER2-low → 'N' in oBDS (Information geht verloren)"
      }]
    },
    {
      "code" : "ultralow",
      "display" : "HER2-ultralow",
      "target" : [{
        "code" : "N",
        "equivalence" : "wider",
        "comment" : "HER2-ultralow → 'N' in oBDS (Information geht verloren)"
      }]
    },
    {
      "code" : "negativ",
      "display" : "HER2-negativ",
      "target" : [{
        "code" : "N",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "equivocal",
      "display" : "HER2 equivocal",
      "target" : [{
        "code" : "U",
        "equivalence" : "relatedto",
        "comment" : "Equivocal → unbekannt; oBDS kennt keine equivocal-Klasse"
      }]
    }]
  }]
}

```
