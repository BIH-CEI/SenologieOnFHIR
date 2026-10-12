# CM Senologie Diagnose SCT → ICD-10-GM - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **CM Senologie Diagnose SCT → ICD-10-GM**

## ConceptMap: CM Senologie Diagnose SCT → ICD-10-GM () 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ConceptMap/cm-senologie-diagnose-sct-to-icd10 | **:0.10.0 |
| Draft | **: |

 
Mapping der Mamma-Diagnose-Choices (SNOMED CT + Senologie-Custom) zu ICD-10-GM-Codes. Eingesetzt im Diagnose-Questionnaire-Extract zur automatischen Befüllung der ICD-10-Slice. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "cm-senologie-diagnose-sct-to-icd10",
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
  "url" : "https://www.senologie.org/fhir/ConceptMap/cm-senologie-diagnose-sct-to-icd10",
  "version" : "0.10.0",
  "title" : "CM Senologie Diagnose SCT → ICD-10-GM",
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
  "description" : "Mapping der Mamma-Diagnose-Choices (SNOMED CT + Senologie-Custom) zu ICD-10-GM-Codes. Eingesetzt im Diagnose-Questionnaire-Extract zur automatischen Befüllung der ICD-10-Slice.",
  "sourceUri" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnose",
  "targetUri" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
  "group" : [{
    "source" : "http://snomed.info/sct",
    "target" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
    "element" : [{
      "code" : "254837009",
      "display" : "Mammakarzinom",
      "target" : [{
        "code" : "C50.9",
        "display" : "Bösartige Neubildung der Brustdrüse, nicht näher bezeichnet",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "109889007",
      "display" : "Carcinoma in situ (DCIS)",
      "target" : [{
        "code" : "D05.1",
        "display" : "Intraduktales Carcinoma in situ der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "269497004",
      "display" : "B3-Läsion (Neoplasm of uncertain behaviour of breast)",
      "target" : [{
        "code" : "D48.6",
        "display" : "Neubildung unsicheren oder unbekannten Verhaltens: Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "254845004",
      "display" : "Fibroadenom",
      "target" : [{
        "code" : "D24",
        "display" : "Gutartige Neubildung der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "27431007",
      "display" : "Fibrozystische Mastopathie",
      "target" : [{
        "code" : "N60.1",
        "display" : "Diffuse zystische Mastopathie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "53430007",
      "display" : "Mastodynie",
      "target" : [{
        "code" : "N64.4",
        "display" : "Mastodynie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "4754008",
      "display" : "Gynäkomastie",
      "target" : [{
        "code" : "N62",
        "display" : "Mammahypertrophie",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "83620003",
      "display" : "Mastitis non-puerperalis",
      "target" : [{
        "code" : "N61",
        "display" : "Entzündliche Krankheiten der Mamma",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "1287638006",
      "display" : "Mastitis puerperalis",
      "target" : [{
        "code" : "O91.2",
        "display" : "Nichteitrige Mastitis im Wochenbett",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "237444008",
      "display" : "Granulomatöse Mastitis",
      "target" : [{
        "code" : "N61",
        "display" : "Entzündliche Krankheiten der Mamma",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "16698000",
      "display" : "Abszess non-puerperalis der Mamma",
      "target" : [{
        "code" : "N61",
        "display" : "Entzündliche Krankheiten der Mamma",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "10745131000119107",
      "display" : "Abszess puerperalis der Mamma",
      "target" : [{
        "code" : "O91.1",
        "display" : "Mammaabszess im Wochenbett",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "399123008",
      "display" : "Einfache Mammazyste",
      "target" : [{
        "code" : "N60.0",
        "display" : "Solitäre Zyste der Mamma",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "449837001",
      "display" : "Komplexe Mammazyste",
      "target" : [{
        "code" : "N60.8",
        "display" : "Sonstige gutartige Mammadysplasie",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "718220008",
      "display" : "Genetische Hochrisikosituation",
      "target" : [{
        "code" : "Z80.3",
        "display" : "Bösartige Neubildung der Brustdrüse in der Familienanamnese",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "237474000",
      "display" : "Kapselfibrose",
      "target" : [{
        "code" : "T85.49",
        "display" : "Mechanische Komplikation durch Mammaimplantate",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "237473006",
      "display" : "Rupturiertes Mammaimplantat",
      "target" : [{
        "code" : "T85.43",
        "display" : "Mechanische Komplikation durch Mammaimplantate - Bruch",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnose-custom",
    "target" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
    "element" : [{
      "code" : "bc-recurrence",
      "display" : "Mammakarzinom Rezidiv",
      "target" : [{
        "code" : "C50.9",
        "display" : "Bösartige Neubildung der Brustdrüse",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "anisomastie",
      "display" : "Anisomastie",
      "target" : [{
        "code" : "N64.8",
        "display" : "Sonstige näher bezeichnete Krankheiten der Mamma",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "makromastie",
      "display" : "Makromastie",
      "target" : [{
        "code" : "N62",
        "display" : "Mammahypertrophie",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "mamillensekretion-blutig",
      "display" : "Blutige Mamillensekretion",
      "target" : [{
        "code" : "N64.5",
        "display" : "Sonstige Symptome der Mamma",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "mamillensekretion-nicht-blutig",
      "display" : "Nicht blutige Mamillensekretion",
      "target" : [{
        "code" : "N64.5",
        "display" : "Sonstige Symptome der Mamma",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "befund-unklarer-dignitaet",
      "display" : "Befund unklarer Dignität",
      "target" : [{
        "code" : "R92",
        "display" : "Abnorme Befunde bei bildgebender Diagnostik der Mamma",
        "equivalence" : "wider"
      }]
    }]
  }]
}

```
