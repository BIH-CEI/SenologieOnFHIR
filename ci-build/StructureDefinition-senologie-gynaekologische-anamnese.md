# BIH Senologie Gynäkologische Anamnese - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Gynäkologische Anamnese**

## Resource Profile: BIH Senologie Gynäkologische Anamnese 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Gynaekologische_Anamnese |

 
Observation für gynäkologische Anamnese (Menarche, Menopause, Schwangerschaften, HRT) aus dotbase Questionnaire 'Gynäkologische Anamnese' 

**Usages:**

* Examples for this Profile: [Observation/Fall1-Gynaekologische-Anamnese](Observation-Fall1-Gynaekologische-Anamnese.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-gynaekologische-anamnese)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-gynaekologische-anamnese.csv), [Excel](StructureDefinition-senologie-gynaekologische-anamnese.xlsx), [Schematron](StructureDefinition-senologie-gynaekologische-anamnese.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-gynaekologische-anamnese",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese",
  "version" : "0.1.0",
  "name" : "Senologie_Gynaekologische_Anamnese",
  "title" : "BIH Senologie Gynäkologische Anamnese",
  "status" : "draft",
  "date" : "2026-05-04T08:11:13+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Observation für gynäkologische Anamnese (Menarche, Menopause, Schwangerschaften, HRT) aus dotbase Questionnaire 'Gynäkologische Anamnese'",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
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
      "short" : "Gynäkologische Anamnese",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "89221-6",
          "display" : "Gynecology History and physical note"
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
      "short" : "Datum der Anamneseerhebung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
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
      "id" : "Observation.component:menarche",
      "path" : "Observation.component",
      "sliceName" : "menarche",
      "short" : "Alter bei Menarche",
      "comment" : "Aus dotbase: Menarche-Alter in Jahren",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:menarche.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "42798-9",
          "display" : "Age at menarche"
        }]
      }
    },
    {
      "id" : "Observation.component:menarche.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Observation.component:menarche.value[x].system",
      "path" : "Observation.component.value[x].system",
      "fixedUri" : "http://unitsofmeasure.org"
    },
    {
      "id" : "Observation.component:menarche.value[x].code",
      "path" : "Observation.component.value[x].code",
      "fixedCode" : "a"
    },
    {
      "id" : "Observation.component:menopause",
      "path" : "Observation.component",
      "sliceName" : "menopause",
      "short" : "Menopausenstatus / Alter bei Menopause",
      "comment" : "Aus dotbase: prä-/postmenopausal, Alter bei Menopause",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:menopause.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "42802-9",
          "display" : "Age at menopause"
        }]
      }
    },
    {
      "id" : "Observation.component:menopause.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "Quantity"
      },
      {
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Observation.component:schwangerschaften",
      "path" : "Observation.component",
      "sliceName" : "schwangerschaften",
      "short" : "Anzahl Schwangerschaften",
      "comment" : "Aus dotbase: Gravida",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:schwangerschaften.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "11996-6",
          "display" : "[#] Pregnancies"
        }]
      }
    },
    {
      "id" : "Observation.component:schwangerschaften.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Observation.component:hormonersatztherapie",
      "path" : "Observation.component",
      "sliceName" : "hormonersatztherapie",
      "short" : "Hormonersatztherapie (HRT)",
      "comment" : "Aus dotbase: HRT ja/nein, Art der HRT",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Observation.component:hormonersatztherapie.code",
      "path" : "Observation.component.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "266717002",
          "display" : "Hormone replacement therapy"
        }]
      }
    },
    {
      "id" : "Observation.component:hormonersatztherapie.value[x]",
      "path" : "Observation.component.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "boolean"
      }]
    }]
  }
}

```
