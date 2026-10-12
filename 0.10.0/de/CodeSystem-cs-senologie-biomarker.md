# CS Senologie Biomarker Erweiterungen - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Biomarker Erweiterungen**

## CodeSystem: CS Senologie Biomarker Erweiterungen 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker | **:0.10.0 |
| Draft | **:CS_Senologie_Biomarker |

 
Codes für zusätzliche IHC-Components am MII Onko Mamma Rezeptorstatus (ER/PR): IRS (Remmele-Stegner) und Allred Score. Backport-Kandidaten für MII Onko. 

* [VS Senologie HER2 Gesamtbewertung (Leitlinie)](ValueSet-vs-senologie-her2-gesamt.md)
* [VS Senologie IHC-Färbeintensität](ValueSet-vs-senologie-ihc-intensitaet.md)
* [VS Senologie ISH-Methode](ValueSet-vs-senologie-ish-methode.md)

-------

 . 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-biomarker",
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
  "url" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker",
  "version" : "0.10.0",
  "name" : "CS_Senologie_Biomarker",
  "title" : "CS Senologie Biomarker Erweiterungen",
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
  "description" : "Codes für zusätzliche IHC-Components am MII Onko Mamma Rezeptorstatus (ER/PR): IRS (Remmele-Stegner) und Allred Score. Backport-Kandidaten für MII Onko.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 17,
  "concept" : [{
    "code" : "irs-score",
    "display" : "IRS (Remmele-Stegner)",
    "definition" : "Immunreaktiver Score nach Remmele-Stegner (0–12). Produkt aus Prozentscore (0–4) und Intensitätsscore (0–3). DE-Standard für ER/PR-Bewertung."
  },
  {
    "code" : "allred-score",
    "display" : "Allred Score",
    "definition" : "Allred Score (0–8). Summe aus Proportion Score (0–5) und Intensity Score (0–3). International gebräuchlich für ER/PR-Bewertung."
  },
  {
    "code" : "her2-positiv",
    "display" : "HER2-positiv"
  },
  {
    "code" : "her2-low",
    "display" : "HER2-low"
  },
  {
    "code" : "her2-ultralow",
    "display" : "HER2-ultralow"
  },
  {
    "code" : "her2-negativ",
    "display" : "HER2-negativ"
  },
  {
    "code" : "her2-equivocal",
    "display" : "HER2-equivocal"
  },
  {
    "code" : "fish",
    "display" : "FISH (Fluoreszenz-ISH)"
  },
  {
    "code" : "cish",
    "display" : "CISH (Chromogene ISH)"
  },
  {
    "code" : "dish",
    "display" : "DISH (Dual-ISH)"
  },
  {
    "code" : "sish",
    "display" : "SISH (Silver-ISH)"
  },
  {
    "code" : "intensity-negative",
    "display" : "negative"
  },
  {
    "code" : "intensity-weak",
    "display" : "weak"
  },
  {
    "code" : "intensity-moderate",
    "display" : "moderate"
  },
  {
    "code" : "intensity-strong",
    "display" : "strong"
  },
  {
    "code" : "ish-methode",
    "display" : "ISH-Methode (FISH/CISH/DISH/SISH)",
    "definition" : "Methodencode fuer die durchgefuehrte In-situ-Hybridisierung beim HER2-Reflex-Test."
  },
  {
    "code" : "her2-ratio",
    "display" : "HER2/CEP17 Ratio",
    "definition" : "Quantitatives Verhaeltnis HER2-Genkopien zu Chromosom-17-Zentromer (Cutoff >=2.0 = amplifiziert)."
  }]
}

```
