# VS Senologie Diagnose Mamma (24 Choices) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Diagnose Mamma (24 Choices)**

## ValueSet: VS Senologie Diagnose Mamma (24 Choices) 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-mamma-24 | **:0.10.0 |
| Draft | **:VS_Senologie_Diagnose_Mamma |

 
24 Mamma-Diagnose-Choices entsprechend dem konsentierten Senologie-Datensatz (Mischung SNOMED + bz-* Custom-Codes), klinisch sortiert nach Häufigkeit. 

 **References** 

* [Fragebogen: Diagnose Mamma](Questionnaire-senologie-diagnose.md)

### Logical Definition (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-diagnose-mamma-24",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"]
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
    "url" : "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability",
    "valueCode" : "computable"
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
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose-mamma-24",
  "version" : "0.10.0",
  "name" : "VS_Senologie_Diagnose_Mamma",
  "title" : "VS Senologie Diagnose Mamma (24 Choices)",
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
  "description" : "24 Mamma-Diagnose-Choices entsprechend dem konsentierten Senologie-Datensatz (Mischung SNOMED + bz-* Custom-Codes), klinisch sortiert nach Häufigkeit.",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "254837009",
        "display" : "Mammakarzinom"
      },
      {
        "code" : "109889007",
        "display" : "Carcinoma in situ (DCIS)"
      },
      {
        "code" : "269497004",
        "display" : "B3-Läsion (Neoplasm of uncertain behaviour of breast)"
      },
      {
        "code" : "254845004",
        "display" : "Fibroadenom"
      },
      {
        "code" : "27431007",
        "display" : "Fibrozystische Mastopathie"
      },
      {
        "code" : "399123008",
        "display" : "Einfache Mammazyste"
      },
      {
        "code" : "449837001",
        "display" : "Komplexe Mammazyste"
      },
      {
        "code" : "53430007",
        "display" : "Mastodynie"
      },
      {
        "code" : "83620003",
        "display" : "Mastitis non-puerperalis"
      },
      {
        "code" : "1287638006",
        "display" : "Mastitis puerperalis"
      },
      {
        "code" : "16698000",
        "display" : "Abszess non-puerperalis der Mamma"
      },
      {
        "code" : "10745131000119107",
        "display" : "Abszess puerperalis der Mamma"
      },
      {
        "code" : "237444008",
        "display" : "Granulomatöse Mastitis"
      },
      {
        "code" : "237474000",
        "display" : "Kapselfibrose"
      },
      {
        "code" : "237473006",
        "display" : "Rupturiertes Mammaimplantat"
      },
      {
        "code" : "4754008",
        "display" : "Gynäkomastie"
      },
      {
        "code" : "718220008",
        "display" : "Genetische Hochrisikosituation"
      }]
    },
    {
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom",
      "concept" : [{
        "code" : "bc-recurrence",
        "display" : "Mammakarzinom Rezidiv"
      },
      {
        "code" : "mamillensekretion-blutig",
        "display" : "Blutige Mamillensekretion"
      },
      {
        "code" : "mamillensekretion-nicht-blutig",
        "display" : "Nicht blutige Mamillensekretion"
      },
      {
        "code" : "anisomastie",
        "display" : "Anisomastie"
      },
      {
        "code" : "makromastie",
        "display" : "Makromastie"
      },
      {
        "code" : "befund-unklarer-dignitaet",
        "display" : "Befund unklarer Dignität"
      },
      {
        "code" : "sonstiges",
        "display" : "Sonstiges"
      }]
    }]
  }
}

```
