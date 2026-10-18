# BIH Senologie Pathologie Befund - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Pathologie Befund**

## Resource Profile: BIH Senologie Pathologie Befund 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund | *Version*:0.10.0 |
| Draft as of 2026-10-12 | *Computable Name*:Senologie_Pathologie_Befund |

 
DiagnosticReport für pathologische Befunde. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert. 

**Usages:**

* Use this Profile: [Senologie Meldungs-Bundle](StructureDefinition-senologie-meldungs-bundle.md)
* Examples for this Profile: [DiagnosticReport/Example-Pathologie-Befund](DiagnosticReport-Example-Pathologie-Befund.md), [DiagnosticReport/Fall1-Pathologie-Befund](DiagnosticReport-Fall1-Pathologie-Befund.md), [DiagnosticReport/Fall10-Pathologie-Befund](DiagnosticReport-Fall10-Pathologie-Befund.md), [DiagnosticReport/Fall11-Pathologie-Befund](DiagnosticReport-Fall11-Pathologie-Befund.md)... Show 11 more, [DiagnosticReport/Fall12-Pathologie-Befund-Nachresektion](DiagnosticReport-Fall12-Pathologie-Befund-Nachresektion.md), [DiagnosticReport/Fall12-Pathologie-Befund-Vakuumbiopsie](DiagnosticReport-Fall12-Pathologie-Befund-Vakuumbiopsie.md), [DiagnosticReport/Fall2-Pathologie-Befund](DiagnosticReport-Fall2-Pathologie-Befund.md), [DiagnosticReport/Fall3-Pathologie-Befund-OP](DiagnosticReport-Fall3-Pathologie-Befund-OP.md), [DiagnosticReport/Fall3-Pathologie-Befund](DiagnosticReport-Fall3-Pathologie-Befund.md), [DiagnosticReport/Fall4-Pathologie-Befund](DiagnosticReport-Fall4-Pathologie-Befund.md), [DiagnosticReport/Fall5-Pathologie-Befund](DiagnosticReport-Fall5-Pathologie-Befund.md), [DiagnosticReport/Fall6-Pathologie-Befund](DiagnosticReport-Fall6-Pathologie-Befund.md), [DiagnosticReport/Fall7-Pathologie-Befund](DiagnosticReport-Fall7-Pathologie-Befund.md), [DiagnosticReport/Fall8-Pathologie-Befund](DiagnosticReport-Fall8-Pathologie-Befund.md) and [DiagnosticReport/Fall9-Pathologie-Befund](DiagnosticReport-Fall9-Pathologie-Befund.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/kds-senologie|current/StructureDefinition/StructureDefinition-senologie-pathologie-befund.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots, and their representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-senologie-pathologie-befund.csv), [Excel](../StructureDefinition-senologie-pathologie-befund.xlsx), [Schematron](../StructureDefinition-senologie-pathologie-befund.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-pathologie-befund",
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
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund",
  "version" : "0.10.0",
  "name" : "Senologie_Pathologie_Befund",
  "title" : "BIH Senologie Pathologie Befund",
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
  "description" : "DiagnosticReport für pathologische Befunde. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "lm",
    "uri" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
    "name" : "BIH LM Senologie",
    "comment" : "Bezugselement im Logischen Modell: Pathologie"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/StructureDefinition/mii-pr-patho-report",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Befundstatus (preliminary | final | amended | corrected)",
      "comment" : "final ist der Regelfall. preliminary bei Schnellschnitt, amended/corrected bei nachträglicher Korrektur."
    },
    {
      "id" : "DiagnosticReport.category",
      "path" : "DiagnosticReport.category",
      "short" : "Pathologie / Histopathologie"
    },
    {
      "id" : "DiagnosticReport.code.coding",
      "path" : "DiagnosticReport.code.coding",
      "short" : "Art der pathologischen Untersuchung"
    },
    {
      "id" : "DiagnosticReport.code.text",
      "path" : "DiagnosticReport.code.text",
      "patternString" : "Pathologischer Befund"
    },
    {
      "id" : "DiagnosticReport.effective[x]",
      "path" : "DiagnosticReport.effective[x]",
      "short" : "Datum der Präparateentnahme",
      "comment" : "'Datum Präparateentnahme'",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.DatumEntnahme"
      }]
    },
    {
      "id" : "DiagnosticReport.issued",
      "path" : "DiagnosticReport.issued",
      "short" : "Datum der Befunderstellung",
      "mustSupport" : true,
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.Datum"
      }]
    },
    {
      "id" : "DiagnosticReport.performer",
      "path" : "DiagnosticReport.performer",
      "short" : "Pathologisches Institut / befundender Pathologe",
      "comment" : "Pathologisches Institut: (choice) — ersetzt ehemalige PathologyLab-Extension",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.PathologischesInstitut"
      }]
    },
    {
      "id" : "DiagnosticReport.resultsInterpreter",
      "path" : "DiagnosticReport.resultsInterpreter",
      "short" : "Befundender Pathologe"
    },
    {
      "id" : "DiagnosticReport.specimen",
      "path" : "DiagnosticReport.specimen",
      "short" : "Pathologisches Präparat",
      "comment" : "Soll Senologie_Pathologie_Praeparat referenzieren — enthält Art, Lokalisation, Seite, Uhrzeitposition, Mamillenabstand und Entnahme-Zeitpunkt",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.Praeparat"
      }]
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Detaillierte Befund-Komponenten",
      "comment" : "Erbt MII Patho Grouper-Slices (intraoperative, macroscopic, microscopic) — ER, PR, HER2, Ki-67, Histologie, B3-Läsion als Observations",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.BefundInvasiv | Pathologie.BefundDCIS (je nach Observation-Code)"
      }]
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Gesamtbeurteilung des Pathologen",
      "comment" : "Details: (text)",
      "mapping" : [{
        "identity" : "lm",
        "map" : "Pathologie.Befundtext"
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
