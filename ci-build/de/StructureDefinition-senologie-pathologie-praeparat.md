# BIH Senologie Pathologisches Präparat - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Pathologisches Präparat**

## : BIH Senologie Pathologisches Präparat 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat | **:0.10.0 |
| Draft | **:Senologie_Pathologie_Praeparat |

 
Specimen für pathologische Präparate (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details 

**Usages:**

* Examples for this Profil: [Specimen/Example-Pathologie-Praeparat](Specimen-Example-Pathologie-Praeparat.md), [Specimen/Fall1-Pathologie-Praeparat](Specimen-Fall1-Pathologie-Praeparat.md), [Specimen/Fall10-Pathologie-Praeparat](Specimen-Fall10-Pathologie-Praeparat.md), [Specimen/Fall11-Pathologie-Praeparat](Specimen-Fall11-Pathologie-Praeparat.md)... Show 11 more, [Specimen/Fall12-Pathologie-Praeparat-Nachresektion](Specimen-Fall12-Pathologie-Praeparat-Nachresektion.md), [Specimen/Fall12-Pathologie-Praeparat-Vakuumbiopsie](Specimen-Fall12-Pathologie-Praeparat-Vakuumbiopsie.md), [Specimen/Fall2-Pathologie-Praeparat](Specimen-Fall2-Pathologie-Praeparat.md), [Specimen/Fall3-Pathologie-Praeparat-OP](Specimen-Fall3-Pathologie-Praeparat-OP.md), [Specimen/Fall3-Pathologie-Praeparat-Stanze](Specimen-Fall3-Pathologie-Praeparat-Stanze.md), [Specimen/Fall4-Pathologie-Praeparat](Specimen-Fall4-Pathologie-Praeparat.md), [Specimen/Fall5-Pathologie-Praeparat](Specimen-Fall5-Pathologie-Praeparat.md), [Specimen/Fall6-Pathologie-Praeparat](Specimen-Fall6-Pathologie-Praeparat.md), [Specimen/Fall7-Pathologie-Praeparat](Specimen-Fall7-Pathologie-Praeparat.md), [Specimen/Fall8-Pathologie-Praeparat](Specimen-Fall8-Pathologie-Praeparat.md) and [Specimen/Fall9-Pathologie-Praeparat](Specimen-Fall9-Pathologie-Praeparat.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-pathologie-praeparat.json)

### 

 . 

*   
*   
*   
*   
*   

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

 **View** 

#### Terminology Bindings

#### Constraints

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-pathologie-praeparat",
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
    "profile" : ["http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition",
    "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"]
  },
  "extension" : [{
    "url" : "https://www.medizininformatik-initiative.de/fhir/modul-meta/StructureDefinition/mii-ex-meta-license-codeable",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/spdx-license",
        "code" : "CC-BY-4.0",
        "display" : "Creative Commons Attribution 4.0 International"
      }]
    }
  },
  {
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
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat",
  "version" : "0.10.0",
  "name" : "Senologie_Pathologie_Praeparat",
  "title" : "BIH Senologie Pathologisches Präparat",
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
  "description" : "Specimen für pathologische Präparate (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Pathologie.Praeparat"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Specimen",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/StructureDefinition/mii-pr-patho-specimen",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Specimen",
      "path" : "Specimen"
    },
    {
      "id" : "Specimen.type",
      "path" : "Specimen.type",
      "short" : "Art des Präparats",
      "comment" : "Art des Präparats: (z.B. Biopsie, Resektat)",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.Praeparat.Art"
      }]
    },
    {
      "id" : "Specimen.collection.collected[x]",
      "path" : "Specimen.collection.collected[x]",
      "short" : "Datum der Präparateentnahme",
      "comment" : "'Datum Präparateentnahme'",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.DatumEntnahme | Pathologie.ZeitpunktEntnahme"
      }]
    },
    {
      "id" : "Specimen.collection.method",
      "path" : "Specimen.collection.method",
      "short" : "Entnahme-Methode / Timing",
      "comment" : "Zeitpunkt Präparatentnahme: (intraop, präop, etc.) als Methoden-Kontext",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.Praeparat.Entnahmemethode"
      }]
    },
    {
      "id" : "Specimen.collection.bodySite",
      "path" : "Specimen.collection.bodySite",
      "short" : "Lokalisation der Entnahme",
      "comment" : "Lokalisation inkl. Seite und Lagequalifikatoren via MII Patho extensions",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.Praeparat.Lokalisation | Pathologie.Praeparat.Seite"
      }]
    }]
  }
}

```
