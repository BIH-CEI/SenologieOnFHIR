# BIH Senologie Bildgebung Befund - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Bildgebung Befund**

## Resource Profile: BIH Senologie Bildgebung Befund 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-befund | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Bildgebung_Befund |

 
DiagnosticReport für Befunde bildgebender Verfahren (Mammographie, Sonographie, MRT, Tomosynthese, etc.) 

**Usages:**

* Use this Profile: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profile: [DiagnosticReport/Example-Bildgebung-Mammographie](DiagnosticReport-Example-Bildgebung-Mammographie.md), [DiagnosticReport/Fall1-Bildgebung-Mammographie](DiagnosticReport-Fall1-Bildgebung-Mammographie.md), [DiagnosticReport/Fall10-Bildgebung-Mammographie](DiagnosticReport-Fall10-Bildgebung-Mammographie.md), [DiagnosticReport/Fall11-Bildgebung-Mammographie](DiagnosticReport-Fall11-Bildgebung-Mammographie.md)... Show 17 more, [DiagnosticReport/Fall11-Bildgebung-Sonographie](DiagnosticReport-Fall11-Bildgebung-Sonographie.md), [DiagnosticReport/Fall12-Bildgebung-Mammographie](DiagnosticReport-Fall12-Bildgebung-Mammographie.md), [DiagnosticReport/Fall2-Bildgebung-MRT](DiagnosticReport-Fall2-Bildgebung-MRT.md), [DiagnosticReport/Fall2-Bildgebung-Mammographie](DiagnosticReport-Fall2-Bildgebung-Mammographie.md), [DiagnosticReport/Fall2-Bildgebung-Sonographie](DiagnosticReport-Fall2-Bildgebung-Sonographie.md), [DiagnosticReport/Fall3-Bildgebung-Mammographie](DiagnosticReport-Fall3-Bildgebung-Mammographie.md), [DiagnosticReport/Fall4-Bildgebung-Mammographie](DiagnosticReport-Fall4-Bildgebung-Mammographie.md), [DiagnosticReport/Fall4-Bildgebung-Sonographie](DiagnosticReport-Fall4-Bildgebung-Sonographie.md), [DiagnosticReport/Fall5-Bildgebung-MRT](DiagnosticReport-Fall5-Bildgebung-MRT.md), [DiagnosticReport/Fall5-Bildgebung-Mammographie](DiagnosticReport-Fall5-Bildgebung-Mammographie.md), [DiagnosticReport/Fall5-Bildgebung-Sonographie](DiagnosticReport-Fall5-Bildgebung-Sonographie.md), [DiagnosticReport/Fall6-Bildgebung-Mammographie](DiagnosticReport-Fall6-Bildgebung-Mammographie.md), [DiagnosticReport/Fall7-Bildgebung-Mammographie](DiagnosticReport-Fall7-Bildgebung-Mammographie.md), [DiagnosticReport/Fall7-Bildgebung-Sonographie](DiagnosticReport-Fall7-Bildgebung-Sonographie.md), [DiagnosticReport/Fall8-Bildgebung-Mammographie](DiagnosticReport-Fall8-Bildgebung-Mammographie.md), [DiagnosticReport/Fall8-Bildgebung-Sonographie](DiagnosticReport-Fall8-Bildgebung-Sonographie.md) and [DiagnosticReport/Fall9-Bildgebung-Mammographie](DiagnosticReport-Fall9-Bildgebung-Mammographie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-bildgebung-befund.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-bildgebung-befund.csv), [Excel](../StructureDefinition-senologie-bildgebung-befund.xlsx), [Schematron](../StructureDefinition-senologie-bildgebung-befund.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-bildgebung-befund",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-befund",
  "version" : "0.10.0",
  "name" : "Senologie_Bildgebung_Befund",
  "title" : "BIH Senologie Bildgebung Befund",
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
  "description" : "DiagnosticReport für Befunde bildgebender Verfahren (Mammographie, Sonographie, MRT, Tomosynthese, etc.)",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: BildgebungMamma"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DiagnosticReport",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport"
    },
    {
      "id" : "DiagnosticReport.extension",
      "path" : "DiagnosticReport.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "DiagnosticReport.extension:examinationLocation",
      "path" : "DiagnosticReport.extension",
      "sliceName" : "examinationLocation",
      "short" : "Standort der bildgebenden Untersuchung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-examination-location"]
      }],
      "mapping" : [{
        "identity" : "lm",
        "map" : "BildgebungMamma.Standort"
      }]
    },
    {
      "id" : "DiagnosticReport.basedOn",
      "path" : "DiagnosticReport.basedOn",
      "short" : "Veranlasste ImagingStudy"
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Abschlossener Befundbericht",
      "fixedCode" : "final"
    },
    {
      "id" : "DiagnosticReport.category",
      "path" : "DiagnosticReport.category",
      "short" : "Diagnostik / Bildgebung",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0074",
          "code" : "RAD",
          "display" : "Radiology"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.code",
      "path" : "DiagnosticReport.code",
      "comment" : "Modalität: (Mammographie, Sonographie, MRT, Tomosynthese) mit LOINC/RADLEX Codes",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "BildgebungMamma.Art"
      }]
    },
    {
      "id" : "DiagnosticReport.code.coding",
      "path" : "DiagnosticReport.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "rules" : "open"
      },
      "short" : "Art der Bildgebung"
    },
    {
      "id" : "DiagnosticReport.code.coding:mammography",
      "path" : "DiagnosticReport.code.coding",
      "sliceName" : "mammography",
      "short" : "MG Breast Screening",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "24606-6"
      }
    },
    {
      "id" : "DiagnosticReport.code.coding:ultrasound",
      "path" : "DiagnosticReport.code.coding",
      "sliceName" : "ultrasound",
      "short" : "US Breast",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "24601-7"
      }
    },
    {
      "id" : "DiagnosticReport.code.coding:mri",
      "path" : "DiagnosticReport.code.coding",
      "sliceName" : "mri",
      "short" : "MRI of breast",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "30794-2"
      }
    },
    {
      "id" : "DiagnosticReport.code.coding:tomosynthesis",
      "path" : "DiagnosticReport.code.coding",
      "sliceName" : "tomosynthesis",
      "short" : "Digital breast tomosynthesis",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID40755"
      }
    },
    {
      "id" : "DiagnosticReport.subject",
      "path" : "DiagnosticReport.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.effective[x]",
      "path" : "DiagnosticReport.effective[x]",
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
      "id" : "DiagnosticReport.effective[x]:effectiveDateTime",
      "path" : "DiagnosticReport.effective[x]",
      "sliceName" : "effectiveDateTime",
      "short" : "Datum der Untersuchung",
      "comment" : "Datum: pro Modalität",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "BildgebungMamma.Datum"
      }]
    },
    {
      "id" : "DiagnosticReport.resultsInterpreter",
      "path" : "DiagnosticReport.resultsInterpreter",
      "short" : "Befundender Arzt"
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Einzel-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status)",
      "comment" : "References zu einzelnen Observation-Ressourcen für Herdbefund, Mikrokalk, LK-Status, BI-RADS, ACR pro Seite",
      "mapping" : [{
        "identity" : "lm",
        "map" : "BildgebungMamma.BIRADS | BildgebungMamma.ACRDichte | BildgebungMamma.Herdbefund | BildgebungMamma.Mikrokalk | BildgebungMamma.LymphknotenBildgebung"
      }]
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Gesamtzusammenfassung des Befundes",
      "comment" : "Details (ausführlich): Freitext",
      "mapping" : [{
        "identity" : "lm",
        "map" : "BildgebungMamma.Befundtext"
      }]
    },
    {
      "id" : "DiagnosticReport.presentedForm",
      "path" : "DiagnosticReport.presentedForm",
      "short" : "Befund als Document/Text"
    }]
  }
}

```
