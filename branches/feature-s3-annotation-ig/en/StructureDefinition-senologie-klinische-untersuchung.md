# BIH Senologie Klinische Untersuchung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Klinische Untersuchung**

## Resource Profile: BIH Senologie Klinische Untersuchung 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Klinische_Untersuchung |

 
Observation für klinische Brustuntersuchung (Mammabefund pro Seite) 

**Usages:**

* Examples for this Profile: [Observation/Fall1-Klinische-Untersuchung](Observation-Fall1-Klinische-Untersuchung.md) and [Observation/Fall11-Klinische-Untersuchung](Observation-Fall11-Klinische-Untersuchung.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-klinische-untersuchung.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-klinische-untersuchung.csv), [Excel](../StructureDefinition-senologie-klinische-untersuchung.xlsx), [Schematron](../StructureDefinition-senologie-klinische-untersuchung.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-klinische-untersuchung",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung",
  "version" : "0.10.0",
  "name" : "Senologie_Klinische_Untersuchung",
  "title" : "BIH Senologie Klinische Untersuchung",
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
  "description" : "Observation für klinische Brustuntersuchung (Mammabefund pro Seite)",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: KlinischeUntersuchung"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "short" : "Klinische Brustuntersuchung",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "32422-8",
          "display" : "Physical findings of Breast"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.subject",
      "path" : "Observation.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Observation.effective[x]:effectiveDateTime",
      "path" : "Observation.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Datum der Untersuchung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "KlinischeUntersuchung.Datum"
      }]
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "short" : "Untersuchte Seite (links/rechts)",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "KlinischeUntersuchung.Seite"
      }]
    },
    {
      "id" : "Observation.bodySite.coding",
      "path" : "Observation.bodySite.coding",
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite"
      }
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "code"
        }],
        "rules" : "open"
      },
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:palpationsbefund",
      "path" : "Observation.component",
      "sliceName" : "palpationsbefund",
      "short" : "Palpationsbefund",
      "comment" : "Tastbefund der Brust (Verhärtung, Knoten, etc.)",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "KlinischeUntersuchung.Palpationsbefund"
      }]
    },
    {
      "id" : "Observation.component:palpationsbefund.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "118242002",
          "display" : "Finding by palpation"
        }]
      }
    },
    {
      "id" : "Observation.component:palpationsbefund.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:hautveraenderungen",
      "path" : "Observation.component",
      "sliceName" : "hautveraenderungen",
      "short" : "Hautveränderungen",
      "comment" : "Hauteinziehung, Rötung, Orangenhaut etc.",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "KlinischeUntersuchung.Hautveraenderungen"
      }]
    },
    {
      "id" : "Observation.component:hautveraenderungen.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "115951000119105",
          "display" : "Breast symptom of change in skin"
        }]
      }
    },
    {
      "id" : "Observation.component:hautveraenderungen.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:mamillenbefund",
      "path" : "Observation.component",
      "sliceName" : "mamillenbefund",
      "short" : "Mamillenbefund",
      "comment" : "Mamillensekretion, Retraktion etc.",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "KlinischeUntersuchung.Mamillenbefund"
      }]
    },
    {
      "id" : "Observation.component:mamillenbefund.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "248819006",
          "display" : "Nipple finding"
        }]
      }
    },
    {
      "id" : "Observation.component:mamillenbefund.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:lymphknotenstatus",
      "path" : "Observation.component",
      "sliceName" : "lymphknotenstatus",
      "short" : "Klinischer Lymphknotenstatus",
      "comment" : "Tastbare axilläre Lymphknoten",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "KlinischeUntersuchung.Lymphknotenstatus"
      }]
    },
    {
      "id" : "Observation.component:lymphknotenstatus.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "284429001",
          "display" : "Examination of axillary lymph nodes"
        }]
      }
    },
    {
      "id" : "Observation.component:lymphknotenstatus.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:inspektion",
      "path" : "Observation.component",
      "sliceName" : "inspektion",
      "short" : "Inspektionsbefund Brust (per Seite via observation-bodyPosition)",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:inspektion.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "46662001",
          "display" : "Examination of breast"
        }]
      }
    },
    {
      "id" : "Observation.component:inspektion.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }]
    },
    {
      "id" : "Observation.component:symmetrie",
      "path" : "Observation.component",
      "sliceName" : "symmetrie",
      "short" : "Symmetrie der Brüste",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:symmetrie.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "366348007",
          "display" : "Finding of symmetry of breasts"
        }]
      }
    },
    {
      "id" : "Observation.component:symmetrie.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Observation.component:ptosis",
      "path" : "Observation.component",
      "sliceName" : "ptosis",
      "short" : "Ptosis-Grad (Regnault, pro Seite via observation-bodyPosition)",
      "min" : 0,
      "max" : "*",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:ptosis.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "248804005",
          "display" : "Ptotic breast"
        }]
      }
    },
    {
      "id" : "Observation.component:ptosis.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Observation.component:klinisches-ct",
      "path" : "Observation.component",
      "sliceName" : "klinisches-ct",
      "short" : "Klinisches cT (Einschätzung des Untersuchers)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:klinisches-ct.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "399504009",
          "display" : "cT category (observable entity)"
        }]
      }
    },
    {
      "id" : "Observation.component:klinisches-ct.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Observation.component:klinisches-cn",
      "path" : "Observation.component",
      "sliceName" : "klinisches-cn",
      "short" : "Klinisches cN (Einschätzung des Untersuchers)",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:klinisches-cn.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "399534004",
          "display" : "cN category (observable entity)"
        }]
      }
    },
    {
      "id" : "Observation.component:klinisches-cn.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Observation.component:tumornachweis-status",
      "path" : "Observation.component",
      "sliceName" : "tumornachweis-status",
      "short" : "Tumornachweis / Response Assessment",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:tumornachweis-status.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "363676003",
          "display" : "Status of disease (observable entity)"
        }]
      }
    },
    {
      "id" : "Observation.component:tumornachweis-status.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    }]
  }
}

```
