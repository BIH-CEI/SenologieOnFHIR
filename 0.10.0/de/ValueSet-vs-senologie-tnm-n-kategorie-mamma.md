# VS Senologie TNM N-Kategorie (Mamma) - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **VS Senologie TNM N-Kategorie (Mamma)**

## ValueSet: VS Senologie TNM N-Kategorie (Mamma) 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-n-kategorie-mamma | **:0.10.0 |
| Draft | **:VS_Senologie_TNM_N_Kategorie_Mamma |

 
N-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). N2c ist beim Mamma-Ca nicht vorgesehen und wurde ausgeschlossen. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### 

-------

 . 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-senologie-tnm-n-kategorie-mamma",
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
  "url" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-n-kategorie-mamma",
  "version" : "0.10.0",
  "name" : "VS_Senologie_TNM_N_Kategorie_Mamma",
  "title" : "VS Senologie TNM N-Kategorie (Mamma)",
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
  "description" : "N-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). N2c ist beim Mamma-Ca nicht vorgesehen und wurde ausgeschlossen.",
  "compose" : {
    "include" : [{
      "system" : "https://www.uicc.org/resources/tnm",
      "concept" : [{
        "code" : "NX",
        "display" : "NX — Regionäre LK können nicht beurteilt werden"
      },
      {
        "code" : "N0",
        "display" : "N0 — Keine regionären LK-Metastasen"
      },
      {
        "code" : "N1",
        "display" : "N1 — Bewegliche ipsilaterale axilläre LK Level I/II"
      },
      {
        "code" : "N1mi",
        "display" : "N1 (mi) — Mikrometastasen (> 0,2 mm und/oder > 200 Zellen, aber ≤ 2 mm)"
      },
      {
        "code" : "N1a",
        "display" : "N1a — 1–3 axilläre LK"
      },
      {
        "code" : "N1b",
        "display" : "N1b — Mammaria-interna-LK ohne axilläre"
      },
      {
        "code" : "N1c",
        "display" : "N1c — N1a + N1b"
      },
      {
        "code" : "N2",
        "display" : "N2 — Fixierte/verbackene axilläre oder klinisch erkennbare A. mammaria interna"
      },
      {
        "code" : "N2a",
        "display" : "N2a — 4–9 axilläre LK"
      },
      {
        "code" : "N2b",
        "display" : "N2b — Klinisch erkennbare Mammaria-interna-LK ohne axilläre"
      },
      {
        "code" : "N3",
        "display" : "N3 — Infraklavikuläre / supraklavikuläre / Kombinationen"
      },
      {
        "code" : "N3a",
        "display" : "N3a — ≥ 10 axilläre LK oder infraklavikuläre LK"
      },
      {
        "code" : "N3b",
        "display" : "N3b — Klinisch erkennbare A. mammaria interna + axilläre LK"
      },
      {
        "code" : "N3c",
        "display" : "N3c — Supraklavikuläre LK"
      }]
    }]
  }
}

```
