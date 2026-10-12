# BIH Senologie Bildgebung Observation - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Bildgebung Observation**

## : BIH Senologie Bildgebung Observation 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation | **:0.10.0 |
| Draft | **:Senologie_Bildgebung_Observation |

 
Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status) 

**Usages:**

* Examples for this Profil: [Observation/Example-Bildgebung-BiRADS-Links](Observation-Example-Bildgebung-BiRADS-Links.md), [Observation/Example-Bildgebung-BiRADS-Rechts](Observation-Example-Bildgebung-BiRADS-Rechts.md), [Observation/Fall1-BiRADS-Links](Observation-Fall1-BiRADS-Links.md), [Observation/Fall10-BiRADS-Rechts](Observation-Fall10-BiRADS-Rechts.md)... Show 10 more, [Observation/Fall11-BiRADS-Links](Observation-Fall11-BiRADS-Links.md), [Observation/Fall12-BiRADS-Links](Observation-Fall12-BiRADS-Links.md), [Observation/Fall2-BiRADS-Rechts](Observation-Fall2-BiRADS-Rechts.md), [Observation/Fall3-BiRADS-Rechts](Observation-Fall3-BiRADS-Rechts.md), [Observation/Fall4-BiRADS-Links](Observation-Fall4-BiRADS-Links.md), [Observation/Fall5-BiRADS-Rechts](Observation-Fall5-BiRADS-Rechts.md), [Observation/Fall6-BiRADS-Links](Observation-Fall6-BiRADS-Links.md), [Observation/Fall7-BiRADS-Rechts](Observation-Fall7-BiRADS-Rechts.md), [Observation/Fall8-BiRADS-Rechts](Observation-Fall8-BiRADS-Rechts.md) and [Observation/Fall9-BiRADS-Links](Observation-Fall9-BiRADS-Links.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-bildgebung-observation.json)

### 

 . 

*   
*   
*   
*   
*   

#### Terminology Bindings

#### Constraints

#### Constraints

#### Terminology Bindings

#### Constraints

#### Terminology Bindings

#### Constraints

#### Constraints

 **View** 

#### Terminology Bindings

#### Constraints

 

 ,  



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-bildgebung-observation",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation",
  "version" : "0.10.0",
  "name" : "Senologie_Bildgebung_Observation",
  "title" : "BIH Senologie Bildgebung Observation",
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
  "description" : "Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status)",
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
      "path" : "Observation",
      "constraint" : [{
        "key" : "biRads-value",
        "severity" : "warning",
        "human" : "BI-RADS value muss aus BI-RADS ValueSet sein (0-6)",
        "expression" : "value.ofType(CodeableConcept).exists() implies value.ofType(CodeableConcept).coding.exists()",
        "source" : "https://www.senologie.org/fhir/StructureDefinition/senologie-bildgebung-observation"
      }]
    },
    {
      "id" : "Observation.partOf",
      "path" : "Observation.partOf",
      "short" : "Übergeordnete Untersuchung (falls relevant)",
      "comment" : "Die Verknüpfung zum DiagnosticReport erfolgt über DiagnosticReport.result, nicht über partOf."
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "short" : "Abgeschlossene Beobachtung",
      "fixedCode" : "final",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "mustSupport" : true
    },
    {
      "id" : "Observation.code.coding",
      "path" : "Observation.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "$this"
        }],
        "description" : "Slicing nach Art des Bildgebungs-Befunds",
        "rules" : "open"
      },
      "short" : "Art des Befund-Elements",
      "comment" : "SNOMED CT codes für BI-RADS, ACR-Density, Herdbefund, Mikrokalk, Lymphknoten-Status, etc."
    },
    {
      "id" : "Observation.code.coding:biRadsLoinc",
      "path" : "Observation.code.coding",
      "sliceName" : "biRadsLoinc",
      "short" : "BI-RADS Kategorie (LOINC)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "72018-2"
      }
    },
    {
      "id" : "Observation.code.coding:biRadsSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "biRadsSnomed",
      "short" : "BI-RADS Kategorie (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "146611000146107"
      }
    },
    {
      "id" : "Observation.code.coding:acrDensityLoinc",
      "path" : "Observation.code.coding",
      "sliceName" : "acrDensityLoinc",
      "short" : "ACR Brustdichte (LOINC)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://loinc.org",
        "code" : "18794-8"
      }
    },
    {
      "id" : "Observation.code.coding:acrDensityRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "acrDensityRadlex",
      "short" : "ACR Brustdichte (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID28536"
      }
    },
    {
      "id" : "Observation.code.coding:herdbefundSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "herdbefundSnomed",
      "short" : "Herdbefund/Läsion (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "290073004"
      }
    },
    {
      "id" : "Observation.code.coding:herdbefundRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "herdbefundRadlex",
      "short" : "Herdbefund/Läsion (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID3933"
      }
    },
    {
      "id" : "Observation.code.coding:mikrokalkSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "mikrokalkSnomed",
      "short" : "Mikrokalkifikation (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "44771000"
      }
    },
    {
      "id" : "Observation.code.coding:mikrokalkRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "mikrokalkRadlex",
      "short" : "Mikrokalkifikation (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID4002"
      }
    },
    {
      "id" : "Observation.code.coding:lymphknotenSnomed",
      "path" : "Observation.code.coding",
      "sliceName" : "lymphknotenSnomed",
      "short" : "Lymphknoten-Status (SNOMED)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://snomed.info/sct",
        "code" : "284429001"
      }
    },
    {
      "id" : "Observation.code.coding:lymphknotenRadlex",
      "path" : "Observation.code.coding",
      "sliceName" : "lymphknotenRadlex",
      "short" : "Lymphknoten-Status (RadLex)",
      "min" : 0,
      "max" : "1",
      "patternCoding" : {
        "system" : "http://radlex.org",
        "code" : "RID58844"
      }
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
      "short" : "Zeitpunkt der Beobachtung",
      "comment" : "Datum: der Bildgebung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.performer",
      "path" : "Observation.performer",
      "short" : "Befundender Arzt"
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "short" : "Befund-Wert",
      "comment" : "z.B. BI-RADS 3-5, ACR A-D, Herdbefund-Code, etc.",
      "type" : [{
        "code" : "Quantity"
      },
      {
        "code" : "CodeableConcept"
      },
      {
        "code" : "string"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.note",
      "path" : "Observation.note",
      "short" : "Freitext-Kommentare zum Befund",
      "comment" : "Details: Freitext pro Seite"
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "short" : "Seite/Region",
      "comment" : "Lateralität des Befunds (Links, Rechts, Beidseits)",
      "mustSupport" : true
    }]
  }
}

```
