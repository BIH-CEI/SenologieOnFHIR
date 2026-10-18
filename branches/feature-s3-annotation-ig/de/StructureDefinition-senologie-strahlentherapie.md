# BIH Senologie Strahlentherapie - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Strahlentherapie**

## : BIH Senologie Strahlentherapie 

| | |
| :--- | :--- |
| **:https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie | **:0.10.0 |
| Draft | **:Senologie_Strahlentherapie |

 
Procedure für Strahlentherapie. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung. 

**Usages:**

* Use this Profil: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profil: [Procedure/Example-Strahlentherapie](Procedure-Example-Strahlentherapie.md), [Procedure/Fall1-Strahlentherapie](Procedure-Fall1-Strahlentherapie.md), [Procedure/Fall14-Strahlentherapie](Procedure-Fall14-Strahlentherapie.md), [Procedure/Fall2-Strahlentherapie](Procedure-Fall2-Strahlentherapie.md)... Show 7 more, [Procedure/Fall3-Strahlentherapie](Procedure-Fall3-Strahlentherapie.md), [Procedure/Fall4-Strahlentherapie](Procedure-Fall4-Strahlentherapie.md), [Procedure/Fall5-Strahlentherapie](Procedure-Fall5-Strahlentherapie.md), [Procedure/Fall6-Strahlentherapie](Procedure-Fall6-Strahlentherapie.md), [Procedure/Fall7-Strahlentherapie](Procedure-Fall7-Strahlentherapie.md), [Procedure/Fall8-Strahlentherapie](Procedure-Fall8-Strahlentherapie.md) and [Procedure/Fall9-Strahlentherapie](Procedure-Fall9-Strahlentherapie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-strahlentherapie.json)

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
  "id" : "senologie-strahlentherapie",
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm",
    "valueCoding" : {
      "system" : "http://hl7.org/fhir/version-algorithm",
      "code" : "semver",
      "display" : "SemVer"
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
    "url" : "http://hl7.org/fhir/StructureDefinition/artifact-usage",
    "valueMarkdown" : "Use this profile as the technical FHIR representation of the corresponding element group of the Senologie core dataset logical model. The profile constrains a base FHIR resource for the documentation of breast cancer care by specifying how elements are used, which elements are required, and which extensions and terminology bindings apply. Implementers should produce and consume resource instances that conform to this profile when exchanging Senologie core dataset data."
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
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-approvalDate",
    "valueDate" : "2026-09-15"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/resource-effectivePeriod",
    "valuePeriod" : {
      "start" : "2027"
    }
  }],
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-strahlentherapie",
  "version" : "0.10.0",
  "name" : "Senologie_Strahlentherapie",
  "title" : "BIH Senologie Strahlentherapie",
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
  "description" : "Procedure für Strahlentherapie. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Strahlentherapie"
  },
  {
    "identity" : "oBDS",
    "name" : "Mapping FHIR zu oBDS"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Procedure",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-strahlentherapie-bestrahlung-strahlentherapie",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Procedure.extension:Intention",
      "path" : "Procedure.extension",
      "sliceName" : "Intention",
      "short" : "Behandlungsintention",
      "comment" : "Zeitpunkt: (adjuvant, neoadjuvant, palliativ)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-ex-onko-strahlentherapie-intention"]
      }]
    },
    {
      "id" : "Procedure.extension:sessionCount",
      "path" : "Procedure.extension",
      "sliceName" : "sessionCount",
      "short" : "Anzahl der Bestrahlungssitzungen",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-session-count"]
      }]
    },
    {
      "id" : "Procedure.extension:einzeldosis",
      "path" : "Procedure.extension",
      "sliceName" : "einzeldosis",
      "short" : "Einzeldosis pro Fraktion in Gy",
      "comment" : "OncoBox 2.0 H10: Einzeldosis pro Tag in Gy",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-einzeldosis"]
      }]
    },
    {
      "id" : "Procedure.extension:simultaneRadiochemotherapie",
      "path" : "Procedure.extension",
      "sliceName" : "simultaneRadiochemotherapie",
      "short" : "Simultane Radiochemotherapie (H03)",
      "comment" : "OncoBox 2.0 H03: Simultane Radiochemotherapie ja/nein",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://www.senologie.org/fhir/StructureDefinition/ex-senologie-simultane-radiochemotherapie"]
      }]
    },
    {
      "id" : "Procedure.partOf",
      "path" : "Procedure.partOf",
      "short" : "Zugehörige Strahlentherapie-Session"
    },
    {
      "id" : "Procedure.status",
      "path" : "Procedure.status",
      "short" : "Durchgeführt",
      "fixedCode" : "completed"
    },
    {
      "id" : "Procedure.code.coding",
      "path" : "Procedure.code.coding",
      "short" : "Strahlentherapie-Typ"
    },
    {
      "id" : "Procedure.code.text",
      "path" : "Procedure.code.text",
      "short" : "Bestrahlung"
    },
    {
      "id" : "Procedure.reasonReference",
      "path" : "Procedure.reasonReference",
      "short" : "Bezogene Diagnose"
    },
    {
      "id" : "Procedure.bodySite",
      "path" : "Procedure.bodySite",
      "short" : "Bestrahlungsregion"
    },
    {
      "id" : "Procedure.note",
      "path" : "Procedure.note",
      "short" : "Detaillierte Beschreibung"
    }]
  }
}

```
