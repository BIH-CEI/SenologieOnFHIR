# VS Senologie Diagnose - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie Diagnose**

## ValueSet: VS Senologie Diagnose () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose | **:0.10.0 |
| Draft | **:VS_Senologie_Diagnose |

 
Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes 

 **References** 

* [Fragebogen: Senologie Diagnose](Questionnaire-senologie-diagnose-maligne.md)

### Logical Definition (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-diagnose",
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
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose",
  "version" : "0.10.0",
  "name" : "VS_Senologie_Diagnose",
  "title" : "VS Senologie Diagnose",
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
  "description" : "Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes",
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "254837009",
        "display" : "Malignant neoplasm of breast"
      },
      {
        "code" : "109889007",
        "display" : "Ductal carcinoma in situ of breast"
      },
      {
        "code" : "254845004",
        "display" : "Fibroadenoma of breast"
      },
      {
        "code" : "27431007",
        "display" : "Fibrocystic disease of breast"
      },
      {
        "code" : "399123008",
        "display" : "Benign retention cyst of breast"
      },
      {
        "code" : "449837001",
        "display" : "Complex cyst of breast"
      },
      {
        "code" : "83620003",
        "display" : "Non-puerperal mastitis"
      },
      {
        "code" : "1287638006",
        "display" : "Puerperal mastitis"
      },
      {
        "code" : "16698000",
        "display" : "Non-puerperal breast abscess"
      },
      {
        "code" : "10745131000119107",
        "display" : "Abscess of breast associated with lactation"
      },
      {
        "code" : "237444008",
        "display" : "Granulomatous mastitis"
      },
      {
        "code" : "269497004",
        "display" : "Neoplasm of uncertain behavior of breast"
      },
      {
        "code" : "53430007",
        "display" : "Mastalgia"
      },
      {
        "code" : "237473006",
        "display" : "Ruptured breast implant"
      },
      {
        "code" : "4754008",
        "display" : "Gynecomastia"
      },
      {
        "code" : "718220008",
        "display" : "At high risk for hereditary breast and ovarian cancer syndrome"
      },
      {
        "code" : "1306515008",
        "display" : "Recurrent primary malignant neoplasm of breast"
      },
      {
        "code" : "372285001",
        "display" : "Gigantomastia"
      },
      {
        "code" : "290113009",
        "display" : "Bloody nipple discharge"
      },
      {
        "code" : "237474000",
        "display" : "Contracture of breast following insertion of breast implant"
      }]
    },
    {
      "system" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom",
      "concept" : [{
        "code" : "sonstiges",
        "display" : "Sonstiges"
      },
      {
        "code" : "mamillensekretion-nicht-blutig",
        "display" : "Nicht blutige Mamillensekretion"
      },
      {
        "code" : "anisomastie",
        "display" : "Anisomastie"
      }]
    }]
  }
}

```
