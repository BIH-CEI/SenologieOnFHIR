# BIH Senologie Tumorlokalisation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Tumorlokalisation**

## : BIH Senologie Tumorlokalisation 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation | **:0.10.0 |
| Draft | **:Senologie_Tumorlokalisation |

 
BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand) 

**Usages:**

* Use this Profil: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-tumorlokalisation.json)

### 

 . 

*   
*   
*   
*   
*   

#### Terminology Bindings

#### Constraints

#### Terminology Bindings (Differential)

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

#### Terminology Bindings (Differential)

 **View** 

#### Terminology Bindings

#### Constraints

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-tumorlokalisation",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorlokalisation",
  "version" : "0.10.0",
  "name" : "Senologie_Tumorlokalisation",
  "title" : "BIH Senologie Tumorlokalisation",
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
  "description" : "BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand)",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Tumorlokalisation"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "BodyStructure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-bildgebung/StructureDefinition/mii-pr-bildgebung-koerperstruktur",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "BodyStructure.location",
      "path" : "BodyStructure.location",
      "short" : "Brust (SNOMED)",
      "comment" : "SNOMED-Code für Brust als Lokalisation"
    },
    {
      "id" : "BodyStructure.locationQualifier",
      "path" : "BodyStructure.locationQualifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "BodyStructure.locationQualifier:seitenlokalisation",
      "path" : "BodyStructure.locationQualifier",
      "sliceName" : "seitenlokalisation",
      "short" : "Seite (Links/Rechts/Beidseits)",
      "comment" : "Seite: (Links/Rechts/Beidseits)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "BodyStructure.locationQualifier:quadrant",
      "path" : "BodyStructure.locationQualifier",
      "sliceName" : "quadrant",
      "short" : "Quadrant der Brust",
      "comment" : "Quadrant (z.B. oben-aussen, oben-innen, etc.)",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "BodyStructure.locationQualifier:uhrzeitposition",
      "path" : "BodyStructure.locationQualifier",
      "sliceName" : "uhrzeitposition",
      "short" : "Uhrzeitposition (12-Uhr-Einteilung)",
      "comment" : "Uhrzeitposition im Drüsenquadranten (12-Uhr-Position)",
      "min" : 0,
      "max" : "1",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-clockface-position"
      }
    },
    {
      "id" : "BodyStructure.description",
      "path" : "BodyStructure.description",
      "short" : "Freitext-Beschreibung inkl. Mamillenabstand",
      "comment" : "Kann Mamillenabstand in mm oder andere beschreibende Details enthalten",
      "mustSupport" : true
    }]
  }
}

```
