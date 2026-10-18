# CS Senologie Bildgebung Custom - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CS Senologie Bildgebung Custom**

## CodeSystem: CS Senologie Bildgebung Custom 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/CodeSystem/bildgebung-custom | **:0.10.0 |
| Draft | **:CS_Senologie_Bildgebung_Custom |

 
Custom Codes für radiologische Befunde der Senologie (LK-Status, Standort, Beurteilbarkeit, US-DEGUM) ohne passendes SNOMED-Mapping. 

* [VS Senologie Beurteilbarkeit](ValueSet-vs-senologie-beurteilbarkeit.md)
* [VS Senologie LK-Status (Bildgebung)](ValueSet-vs-senologie-lk-status-bildgebung.md)
* [VS Senologie Mikrokalk-Triage](ValueSet-vs-senologie-mikrokalk-triage.md)
* [VS Senologie Standort (intern / extern)](ValueSet-vs-senologie-standort.md)
* [VS Senologie US-DEGUM Klassifikation](ValueSet-vs-senologie-us-degum.md)

-------

 . 



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-senologie-bildgebung-custom",
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
  "url" : "https://www.senologie.org/fhir/CodeSystem/bildgebung-custom",
  "version" : "0.10.0",
  "name" : "CS_Senologie_Bildgebung_Custom",
  "title" : "CS Senologie Bildgebung Custom",
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
  "description" : "Custom Codes für radiologische Befunde der Senologie (LK-Status, Standort, Beurteilbarkeit, US-DEGUM) ohne passendes SNOMED-Mapping.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 22,
  "concept" : [{
    "code" : "lk-unauffaellig",
    "display" : "LK unauffällig"
  },
  {
    "code" : "lk-unklar",
    "display" : "LK unklar"
  },
  {
    "code" : "lk-suspekt",
    "display" : "LK suspekt"
  },
  {
    "code" : "lk-kein-abgebildet",
    "display" : "kein LK abgebildet"
  },
  {
    "code" : "standort-intern",
    "display" : "intern (eigene Klinik)"
  },
  {
    "code" : "standort-extern",
    "display" : "extern (externe Praxis/Klinik)"
  },
  {
    "code" : "beurteilbarkeit-gut",
    "display" : "gut beurteilbar"
  },
  {
    "code" : "beurteilbarkeit-eingeschraenkt",
    "display" : "eingeschränkt beurteilbar"
  },
  {
    "code" : "us-degum-0",
    "display" : "DEGUM 0 — unklare Beurteilung"
  },
  {
    "code" : "us-degum-1",
    "display" : "DEGUM 1 — wahrscheinlich kein malignes Korrelat"
  },
  {
    "code" : "us-degum-2",
    "display" : "DEGUM 2 — eindeutig benigne"
  },
  {
    "code" : "us-degum-3",
    "display" : "DEGUM 3 — wahrscheinlich benigne"
  },
  {
    "code" : "us-degum-4",
    "display" : "DEGUM 4 — abklärungsbedürftig / suspekt"
  },
  {
    "code" : "us-degum-5",
    "display" : "DEGUM 5 — hochsuspekt auf Malignität"
  },
  {
    "code" : "us-degum-6",
    "display" : "DEGUM 6 — histologisch gesichert maligne"
  },
  {
    "code" : "mikrokalk-ja-suspekt",
    "display" : "Ja, suspekt"
  },
  {
    "code" : "mikrokalk-ja-nicht-suspekt",
    "display" : "Ja, nicht suspekt"
  },
  {
    "code" : "mikrokalk-nein",
    "display" : "Nein"
  },
  {
    "code" : "herdbefund-ja",
    "display" : "Ja"
  },
  {
    "code" : "herdbefund-nein",
    "display" : "Nein"
  },
  {
    "code" : "axilla-suspekt-ja",
    "display" : "Axilla suspekt: Ja"
  },
  {
    "code" : "axilla-suspekt-nein",
    "display" : "Axilla suspekt: Nein"
  }]
}

```
