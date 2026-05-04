# BIH Senologie Pathologie Befund - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH Senologie Pathologie Befund**

## Resource Profile: BIH Senologie Pathologie Befund 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:Senologie_Pathologie_Befund |

 
DiagnosticReport für pathologische Befunde aus dotbase Questionnaire 'Pathologie'. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert. 

**Usages:**

* Examples for this Profile: [DiagnosticReport/Example-Pathologie-Befund](DiagnosticReport-Example-Pathologie-Befund.md), [DiagnosticReport/Fall1-Pathologie-Befund](DiagnosticReport-Fall1-Pathologie-Befund.md), [DiagnosticReport/Fall10-Pathologie-Befund](DiagnosticReport-Fall10-Pathologie-Befund.md), [DiagnosticReport/Fall11-Pathologie-Befund](DiagnosticReport-Fall11-Pathologie-Befund.md)... Show 11 more, [DiagnosticReport/Fall12-Pathologie-Befund-Nachresektion](DiagnosticReport-Fall12-Pathologie-Befund-Nachresektion.md), [DiagnosticReport/Fall12-Pathologie-Befund-Vakuumbiopsie](DiagnosticReport-Fall12-Pathologie-Befund-Vakuumbiopsie.md), [DiagnosticReport/Fall2-Pathologie-Befund](DiagnosticReport-Fall2-Pathologie-Befund.md), [DiagnosticReport/Fall3-Pathologie-Befund-OP](DiagnosticReport-Fall3-Pathologie-Befund-OP.md), [DiagnosticReport/Fall3-Pathologie-Befund](DiagnosticReport-Fall3-Pathologie-Befund.md), [DiagnosticReport/Fall4-Pathologie-Befund](DiagnosticReport-Fall4-Pathologie-Befund.md), [DiagnosticReport/Fall5-Pathologie-Befund](DiagnosticReport-Fall5-Pathologie-Befund.md), [DiagnosticReport/Fall6-Pathologie-Befund](DiagnosticReport-Fall6-Pathologie-Befund.md), [DiagnosticReport/Fall7-Pathologie-Befund](DiagnosticReport-Fall7-Pathologie-Befund.md), [DiagnosticReport/Fall8-Pathologie-Befund](DiagnosticReport-Fall8-Pathologie-Befund.md) and [DiagnosticReport/Fall9-Pathologie-Befund](DiagnosticReport-Fall9-Pathologie-Befund.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/senologie-pathologie-befund)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-senologie-pathologie-befund.csv), [Excel](StructureDefinition-senologie-pathologie-befund.xlsx), [Schematron](StructureDefinition-senologie-pathologie-befund.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "senologie-pathologie-befund",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-befund",
  "version" : "0.1.0",
  "name" : "Senologie_Pathologie_Befund",
  "title" : "BIH Senologie Pathologie Befund",
  "status" : "draft",
  "date" : "2026-05-04T07:50:36+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "DiagnosticReport für pathologische Befunde aus dotbase Questionnaire 'Pathologie'. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert.",
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "DiagnosticReport",
  "baseDefinition" : "https://www.medizininformatik-initiative.de/fhir/ext/modul-patho/StructureDefinition/mii-pr-patho-report",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "DiagnosticReport",
      "path" : "DiagnosticReport"
    },
    {
      "id" : "DiagnosticReport.status",
      "path" : "DiagnosticReport.status",
      "short" : "Abgeschlossener Pathologie-Bericht",
      "fixedCode" : "final"
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
      "comment" : "Aus dotbase: 'Datum Präparateentnahme'"
    },
    {
      "id" : "DiagnosticReport.issued",
      "path" : "DiagnosticReport.issued",
      "short" : "Datum der Befunderstellung",
      "mustSupport" : true
    },
    {
      "id" : "DiagnosticReport.performer",
      "path" : "DiagnosticReport.performer",
      "short" : "Pathologisches Institut / befundender Pathologe",
      "comment" : "Aus dotbase: 'Pathologisches Institut' (choice) — ersetzt ehemalige PathologyLab-Extension"
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
      "comment" : "Soll Senologie_Pathologie_Praeparat referenzieren — enthält Art, Lokalisation, Seite, Uhrzeitposition, Mamillenabstand und Entnahme-Zeitpunkt"
    },
    {
      "id" : "DiagnosticReport.result",
      "path" : "DiagnosticReport.result",
      "short" : "Detaillierte Befund-Komponenten",
      "comment" : "Erbt MII Patho Grouper-Slices (intraoperative, macroscopic, microscopic) — ER, PR, HER2, Ki-67, Histologie, B3-Läsion als Observations"
    },
    {
      "id" : "DiagnosticReport.conclusion",
      "path" : "DiagnosticReport.conclusion",
      "short" : "Gesamtbeurteilung des Pathologen",
      "comment" : "Aus dotbase: 'Details' (text)"
    },
    {
      "id" : "DiagnosticReport.presentedForm",
      "path" : "DiagnosticReport.presentedForm",
      "short" : "Befund als Document/Text"
    }]
  }
}

```
