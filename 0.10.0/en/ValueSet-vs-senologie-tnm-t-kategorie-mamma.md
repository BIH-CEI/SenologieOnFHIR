# VS Senologie TNM T-Kategorie (Mamma) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie TNM T-Kategorie (Mamma)**

## ValueSet: VS Senologie TNM T-Kategorie (Mamma) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-t-kategorie-mamma | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:VS_Senologie_TNM_T_Kategorie_Mamma |

 
T-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). Schließt T1c1-T1c3, T1d, Tis(LAMN/LCIS/pu/pd) und andere nicht-mammarelevante Codes der MII-Onko-Liste aus. Tis(LCIS) wird in TNM 8 für Mamma nicht mehr als Tis kodiert. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-tnm-t-kategorie-mamma",
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
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-t-kategorie-mamma",
  "version" : "0.10.0",
  "name" : "VS_Senologie_TNM_T_Kategorie_Mamma",
  "title" : "VS Senologie TNM T-Kategorie (Mamma)",
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
  "description" : "T-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). Schließt T1c1-T1c3, T1d, Tis(LAMN/LCIS/pu/pd) und andere nicht-mammarelevante Codes der MII-Onko-Liste aus. Tis(LCIS) wird in TNM 8 für Mamma nicht mehr als Tis kodiert.",
  "compose" : {
    "include" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "concept" : [{
        "code" : "TX",
        "display" : "TX — Primärtumor kann nicht beurteilt werden"
      },
      {
        "code" : "T0",
        "display" : "T0 — Kein Anhalt für Primärtumor"
      },
      {
        "code" : "Tis",
        "display" : "Tis — Carcinoma in situ"
      },
      {
        "code" : "Tis(DCIS)",
        "display" : "Tis (DCIS) — Ductales Carcinoma in situ"
      },
      {
        "code" : "Tis(Paget)",
        "display" : "Tis (Paget) — M. Paget der Mamille ohne nachweisbaren Tumor"
      },
      {
        "code" : "T1",
        "display" : "T1 — Tumor ≤ 2 cm"
      },
      {
        "code" : "T1mi",
        "display" : "T1mi — Mikroinvasion ≤ 0,1 cm"
      },
      {
        "code" : "T1a",
        "display" : "T1a — > 0,1 cm und ≤ 0,5 cm"
      },
      {
        "code" : "T1b",
        "display" : "T1b — > 0,5 cm und ≤ 1 cm"
      },
      {
        "code" : "T1c",
        "display" : "T1c — > 1 cm und ≤ 2 cm"
      },
      {
        "code" : "T2",
        "display" : "T2 — > 2 cm und ≤ 5 cm"
      },
      {
        "code" : "T3",
        "display" : "T3 — > 5 cm"
      },
      {
        "code" : "T4",
        "display" : "T4 — jede Größe mit Ausdehnung auf Brustwand/Haut"
      },
      {
        "code" : "T4a",
        "display" : "T4a — Ausdehnung auf Brustwand"
      },
      {
        "code" : "T4b",
        "display" : "T4b — Hautulzeration / -ödem / Satellitenmetastasen"
      },
      {
        "code" : "T4c",
        "display" : "T4c — T4a + T4b"
      },
      {
        "code" : "T4d",
        "display" : "T4d — Inflammatorisches Karzinom"
      }]
    }]
  }
}

```
