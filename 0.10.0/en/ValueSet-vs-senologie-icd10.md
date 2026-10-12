# ValueSet Senologie ICD-10-GM - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ValueSet Senologie ICD-10-GM**

## ValueSet: ValueSet Senologie ICD-10-GM 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-icd10 | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:VSSenologieICD10 |

 
ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook 

 **References** 

* [Fragebogen: Senologie Diagnose](Questionnaire-senologie-diagnose-maligne.md)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-icd10",
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
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-icd10",
  "version" : "0.10.0",
  "name" : "VSSenologieICD10",
  "title" : "ValueSet Senologie ICD-10-GM",
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
  "description" : "ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook",
  "compose" : {
    "include" : [{
      "system" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm",
      "concept" : [{
        "code" : "C50.0",
        "display" : "Brustwarze und Warzenhof"
      },
      {
        "code" : "C50.1",
        "display" : "Zentraler Drüsenkörper der Brustdrüse"
      },
      {
        "code" : "C50.2",
        "display" : "Oberer innerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.3",
        "display" : "Unterer innerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.4",
        "display" : "Oberer äußerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.5",
        "display" : "Unterer äußerer Quadrant der Brustdrüse"
      },
      {
        "code" : "C50.6",
        "display" : "Recessus axillaris der Brustdrüse"
      },
      {
        "code" : "C50.8",
        "display" : "Brustdrüse, mehrere Teilbereiche überlappend"
      },
      {
        "code" : "C50.9",
        "display" : "Brustdrüse, nicht näher bezeichnet"
      },
      {
        "code" : "D05.0",
        "display" : "Lobuläres Carcinoma in situ der Brustdrüse"
      },
      {
        "code" : "D05.1",
        "display" : "Intraduktales Carcinoma in situ der Brustdrüse"
      },
      {
        "code" : "D05.7",
        "display" : "Sonstiges Carcinoma in situ der Brustdrüse"
      },
      {
        "code" : "D05.9",
        "display" : "Carcinoma in situ der Brustdrüse, nicht näher bezeichnet"
      },
      {
        "code" : "D24",
        "display" : "Gutartige Neubildung der Brustdrüse"
      },
      {
        "code" : "D48.6",
        "display" : "Neubildung unsicheren oder unbekannten Verhaltens der Brustdrüse"
      },
      {
        "code" : "N60.0",
        "display" : "Solitäre Zyste der Mamma"
      },
      {
        "code" : "N60.1",
        "display" : "Diffuse zystische Mastopathie"
      },
      {
        "code" : "N60.2",
        "display" : "Fibroadenose der Mamma"
      },
      {
        "code" : "N60.3",
        "display" : "Fibrosklerose der Mamma"
      },
      {
        "code" : "N60.4",
        "display" : "Mammäre Duktektasie"
      },
      {
        "code" : "N60.8",
        "display" : "Sonstige gutartige Mammadysplasien"
      },
      {
        "code" : "N60.9",
        "display" : "Gutartige Mammadysplasie, nicht näher bezeichnet"
      },
      {
        "code" : "N61",
        "display" : "Entzündliche Krankheiten der Mamma"
      },
      {
        "code" : "N62",
        "display" : "Hypertrophie der Mamma"
      },
      {
        "code" : "N63",
        "display" : "Nicht näher bezeichnete Knoten in der Mamma"
      },
      {
        "code" : "N64.0",
        "display" : "Fissur und Fistel der Brustwarze"
      },
      {
        "code" : "N64.1",
        "display" : "Fettgewebsnekrose der Mamma"
      },
      {
        "code" : "N64.2",
        "display" : "Atrophie der Mamma"
      },
      {
        "code" : "N64.3",
        "display" : "Galaktorrhoe, nicht im Zusammenhang mit der Geburt"
      },
      {
        "code" : "N64.4",
        "display" : "Mastodynie"
      },
      {
        "code" : "N64.5",
        "display" : "Sonstige Symptome, die die Mamma betreffen"
      },
      {
        "code" : "N64.8",
        "display" : "Sonstige näher bezeichnete Krankheiten der Mamma"
      },
      {
        "code" : "N64.9",
        "display" : "Krankheit der Mamma, nicht näher bezeichnet"
      },
      {
        "code" : "T85.4",
        "display" : "Mechanische Komplikation durch Mammaprothese oder -implantat"
      }]
    }]
  }
}

```
