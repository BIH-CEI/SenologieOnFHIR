# BIH LM Senologie LogicalModel - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **BIH LM Senologie LogicalModel**

## Logical Model: BIH LM Senologie LogicalModel 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:BIH_LM_Senologie |

 
LogicalModel der BIH-Spezifikation des Moduls Senologie 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/LogicalModelSenologie)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-LogicalModelSenologie.csv), [Excel](StructureDefinition-LogicalModelSenologie.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "LogicalModelSenologie",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
  "version" : "0.1.0",
  "name" : "BIH_LM_Senologie",
  "title" : "BIH LM Senologie LogicalModel",
  "status" : "draft",
  "date" : "2026-05-04T06:44:52+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "LogicalModel der BIH-Spezifikation des Moduls Senologie",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Element",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "LogicalModelSenologie",
      "path" : "LogicalModelSenologie",
      "short" : "BIH LM Senologie LogicalModel",
      "definition" : "LogicalModel der BIH-Spezifikation des Moduls Senologie"
    },
    {
      "id" : "LogicalModelSenologie.Diagnose",
      "path" : "LogicalModelSenologie.Diagnose",
      "short" : "Diagnose Mamma",
      "definition" : "Diagnose Mamma",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.Diagnosekode",
      "path" : "LogicalModelSenologie.Diagnose.Diagnosekode",
      "short" : "Diagnose",
      "definition" : "Diagnosestellung nach SNOMED CT",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.DiagnoseB3SubTyp",
      "path" : "LogicalModelSenologie.Diagnose.DiagnoseB3SubTyp",
      "short" : "B3 Subtyp",
      "definition" : "Abgebildet im KDS Modul Biobank",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.Grad",
      "path" : "LogicalModelSenologie.Diagnose.Grad",
      "short" : "Grad",
      "definition" : "Grad der Mammaerkrankung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.Seite",
      "path" : "LogicalModelSenologie.Diagnose.Seite",
      "short" : "Seite",
      "definition" : "Seite der Mammaerkrankung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.DatumErstdiagnose",
      "path" : "LogicalModelSenologie.Diagnose.DatumErstdiagnose",
      "short" : "Datum der Erstdiagnose",
      "definition" : "Datum der Erstdiagnose der Mammaerkrankung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.Diagnosesicherung",
      "path" : "LogicalModelSenologie.Diagnose.Diagnosesicherung",
      "short" : "Diagnosesicherung",
      "definition" : "Diagnosesicherung der Mammaerkrankung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Diagnose.Metastasierungsstadium",
      "path" : "LogicalModelSenologie.Diagnose.Metastasierungsstadium",
      "short" : "Metastasierungsstadium",
      "definition" : "Metastasierungsstadium der Mammaerkrankung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Vorstellung",
      "path" : "LogicalModelSenologie.Vorstellung",
      "short" : "Vorstellungsgrund",
      "definition" : "Vorstellungsgrund",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Vorstellung.Typ",
      "path" : "LogicalModelSenologie.Vorstellung.Typ",
      "short" : "Art der Vorstellung",
      "definition" : "Erst- oder Verlaufsvorstellung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Vorstellung.Erstvorstellung",
      "path" : "LogicalModelSenologie.Vorstellung.Erstvorstellung",
      "short" : "Datum der Erstvorstellung",
      "definition" : "Datum der Erstvorstellung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.AllgemeineAnamnese",
      "path" : "LogicalModelSenologie.AllgemeineAnamnese",
      "short" : "Allgemeine Anamnese",
      "definition" : "Allgemeine Anamnese",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.AllgemeineAnamnese.EQ5D5L",
      "path" : "LogicalModelSenologie.AllgemeineAnamnese.EQ5D5L",
      "short" : "EQ5D5L",
      "definition" : "Gesundheitszustand nach EQ5D5L",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.GynaekologischeAnamnese",
      "path" : "LogicalModelSenologie.GynaekologischeAnamnese",
      "short" : "Gynäkologische Anamnese",
      "definition" : "Gynäkologische Anamnese",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.GynaekologischeAnamnese.Menarche",
      "path" : "LogicalModelSenologie.GynaekologischeAnamnese.Menarche",
      "short" : "Alter bei Menarche",
      "definition" : "Alter bei Menarche",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Familienanamnese",
      "path" : "LogicalModelSenologie.Familienanamnese",
      "short" : "Familienanamnese",
      "definition" : "Familienanamnese",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Familienanamnese.Alter",
      "path" : "LogicalModelSenologie.Familienanamnese.Alter",
      "short" : "Alter",
      "definition" : "aktuelles Alter der Angehörigen",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Medikation",
      "path" : "LogicalModelSenologie.Medikation",
      "short" : "Medikation",
      "definition" : "Medikation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Medikation.Medikationsname",
      "path" : "LogicalModelSenologie.Medikation.Medikationsname",
      "short" : "Name",
      "definition" : "Name des Medikaments",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Medikation.Medikationsname.Dosis",
      "path" : "LogicalModelSenologie.Medikation.Medikationsname.Dosis",
      "short" : "Dosis",
      "definition" : "Dosis des Medikaments",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Medikation.Medikationsname.Einheit",
      "path" : "LogicalModelSenologie.Medikation.Medikationsname.Einheit",
      "short" : "Einheit",
      "definition" : "Einheit/ Darreichungsform der Medikation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Medikation.Medikationsname.Dosierschema",
      "path" : "LogicalModelSenologie.Medikation.Medikationsname.Dosierschema",
      "short" : "Dosierschema",
      "definition" : "Dosierschema",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien",
      "path" : "LogicalModelSenologie.Studien",
      "short" : "Studien",
      "definition" : "Studien",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Studienname",
      "path" : "LogicalModelSenologie.Studien.Studienname",
      "short" : "Name",
      "definition" : "Name der Studie",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.StudiennameCode",
      "path" : "LogicalModelSenologie.Studien.StudiennameCode",
      "short" : "Name (kodiert)",
      "definition" : "Studienname aus Auswahlliste (OncoBox 2.0 K02)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Studienscreening",
      "path" : "LogicalModelSenologie.Studien.Studienscreening",
      "short" : "Screening",
      "definition" : "Screening zur Studienteilnahme durchgeführt (OncoBox 2.0 K03)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Screeningstatus",
      "path" : "LogicalModelSenologie.Studien.Screeningstatus",
      "short" : "Screeningstatus",
      "definition" : "Screeningstatus",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Studienarm",
      "path" : "LogicalModelSenologie.Studien.Studienarm",
      "short" : "Studienarm",
      "definition" : "Studienarm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Aufklaerungsdatum",
      "path" : "LogicalModelSenologie.Studien.Aufklaerungsdatum",
      "short" : "Aufklärungsdatum",
      "definition" : "Datum der Aufklärung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Teilnahmestatus",
      "path" : "LogicalModelSenologie.Studien.Teilnahmestatus",
      "short" : "Teilnahmestatus",
      "definition" : "Teilnahmestatus an der Studie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Studien.Kontakt",
      "path" : "LogicalModelSenologie.Studien.Kontakt",
      "short" : "Kontakt",
      "definition" : "Kontakt zur Studie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "ContactPoint"
      }]
    },
    {
      "id" : "LogicalModelSenologie.KlinischeUntersuchung",
      "path" : "LogicalModelSenologie.KlinischeUntersuchung",
      "short" : "Klinische Untersuchung",
      "definition" : "Klinische Untersuchung",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.KlinischeUntersuchung.MammaRechts",
      "path" : "LogicalModelSenologie.KlinischeUntersuchung.MammaRechts",
      "short" : "Untersuchung Mamma rechts",
      "definition" : "Untersuchung Mamma rechts",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.KlinischeUntersuchung.MammaRechts.MammaCABefund",
      "path" : "LogicalModelSenologie.KlinischeUntersuchung.MammaRechts.MammaCABefund",
      "short" : "Befund",
      "definition" : "Befund der Mamma rechts",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.BildgebungMamma",
      "path" : "LogicalModelSenologie.BildgebungMamma",
      "short" : "Bildgebung Mamma",
      "definition" : "Bildgebung Mamma",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.BildgebungMamma.Bildgebungsart",
      "path" : "LogicalModelSenologie.BildgebungMamma.Bildgebungsart",
      "short" : "Art der Bildgebung",
      "definition" : "Art der Bildgebung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.BildgebungSonstige",
      "path" : "LogicalModelSenologie.BildgebungSonstige",
      "short" : "Bildgebung Sonstige",
      "definition" : "Bildgebung Sonstige",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.BildgebungSonstige.Bildgebungsart",
      "path" : "LogicalModelSenologie.BildgebungSonstige.Bildgebungsart",
      "short" : "Art der Bildgebung",
      "definition" : "Art der Bildgebung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Pathologie",
      "path" : "LogicalModelSenologie.Pathologie",
      "short" : "Pathologie",
      "definition" : "Pathologie",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Pathologie.ArtPraeparat",
      "path" : "LogicalModelSenologie.Pathologie.ArtPraeparat",
      "short" : "Befund",
      "definition" : "Pathologischer Befund",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie",
      "path" : "LogicalModelSenologie.Therapie",
      "short" : "Therapie",
      "definition" : "Therapie",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Operation",
      "path" : "LogicalModelSenologie.Therapie.Operation",
      "short" : "Operation",
      "definition" : "Operation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Operation.Art",
      "path" : "LogicalModelSenologie.Therapie.Operation.Art",
      "short" : "Art der Operation",
      "definition" : "Art der Operation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Operation.Datum",
      "path" : "LogicalModelSenologie.Therapie.Operation.Datum",
      "short" : "Datum der Operation",
      "definition" : "Datum der Operation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Operation.Lokalisation",
      "path" : "LogicalModelSenologie.Therapie.Operation.Lokalisation",
      "short" : "Lokalisation",
      "definition" : "Lokalisation der Operation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Operation.Intention",
      "path" : "LogicalModelSenologie.Therapie.Operation.Intention",
      "short" : "Intention",
      "definition" : "Intent der Operation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie",
      "short" : "Systemische Therapie",
      "definition" : "Systemische Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Intention",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Intention",
      "short" : "Intention",
      "definition" : "Intention der systemischen Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Startdatum",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Startdatum",
      "short" : "Startdatum",
      "definition" : "Startdatum der systemischen Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Enddatum",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Enddatum",
      "short" : "Enddatum",
      "definition" : "Enddatum der systemischen Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Dosis",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Dosis",
      "short" : "Dosis",
      "definition" : "Dosis der systemischen Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Einheit",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Einheit",
      "short" : "Einheit",
      "definition" : "Einheit der systemischen Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Substanz",
      "path" : "LogicalModelSenologie.Therapie.SystemischeTherapie.Substanz",
      "short" : "Substanz",
      "definition" : "Substanz der systemischen Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Strahlentherapie",
      "path" : "LogicalModelSenologie.Therapie.Strahlentherapie",
      "short" : "Strahlentherapie",
      "definition" : "Strahlentherapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Strahlentherapie.Intention",
      "path" : "LogicalModelSenologie.Therapie.Strahlentherapie.Intention",
      "short" : "Intention",
      "definition" : "Intention der Strahlentherapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Strahlentherapie.Startdatum",
      "path" : "LogicalModelSenologie.Therapie.Strahlentherapie.Startdatum",
      "short" : "Startdatum",
      "definition" : "Startdatum der Strahlentherapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Strahlentherapie.Enddatum",
      "path" : "LogicalModelSenologie.Therapie.Strahlentherapie.Enddatum",
      "short" : "Enddatum",
      "definition" : "Enddatum der Strahlentherapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Strahlentherapie.Dosis",
      "path" : "LogicalModelSenologie.Therapie.Strahlentherapie.Dosis",
      "short" : "Dosis",
      "definition" : "Dosis der Strahlentherapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Therapie.Strahlentherapie.Einheit",
      "path" : "LogicalModelSenologie.Therapie.Strahlentherapie.Einheit",
      "short" : "Einheit",
      "definition" : "Einheit der Strahlentherapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.OperationsPlanung",
      "path" : "LogicalModelSenologie.OperationsPlanung",
      "short" : "Operationsplanung",
      "definition" : "Operationsplanung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.OperationsPlanung.Operationsdatum",
      "path" : "LogicalModelSenologie.OperationsPlanung.Operationsdatum",
      "short" : "Operationsdatum",
      "definition" : "Datum der geplanten Operation",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.WeitereTermine",
      "path" : "LogicalModelSenologie.WeitereTermine",
      "short" : "Weitere Termine",
      "definition" : "Weitere Termine",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.WeitereTermine.Termin",
      "path" : "LogicalModelSenologie.WeitereTermine.Termin",
      "short" : "Termin",
      "definition" : "Datum des Termins",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz",
      "path" : "LogicalModelSenologie.Tumorkonferenz",
      "short" : "Tumorkonferenz",
      "definition" : "Tumorkonferenz",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.Datum",
      "path" : "LogicalModelSenologie.Tumorkonferenz.Datum",
      "short" : "Datum",
      "definition" : "Datum der Tumorkonferenz",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.Ort",
      "path" : "LogicalModelSenologie.Tumorkonferenz.Ort",
      "short" : "Ort",
      "definition" : "Ort der Tumorkonferenz",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz",
      "short" : "Empfehlung",
      "definition" : "Empfehlung der Tumorkonferenz",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.EmpfehlungText",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.EmpfehlungText",
      "short" : "Empfehlungstext",
      "definition" : "Text der Empfehlung der Tumorkonferenz",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.Therapieempfehlung",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.Therapieempfehlung",
      "short" : "Therapieempfehlung",
      "definition" : "Therapieempfehlung der Tumorkonferenz",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.DiagnostischeEmpfehlung",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.DiagnostischeEmpfehlung",
      "short" : "Diagnostische Empfehlung",
      "definition" : "Diagnostische Empfehlung der Tumorkonferenz",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.Studienempfehlung",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.Studienempfehlung",
      "short" : "Studienempfehlung",
      "definition" : "Studienempfehlung der Tumorkonferenz",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.VorsorgeNachsorgeEmpfehlung",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.VorsorgeNachsorgeEmpfehlung",
      "short" : "Vorsorge- und Nachsorgeempfehlung",
      "definition" : "Vorsorge- und Nachsorgeempfehlung der Tumorkonferenz",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.Wiedervorstellung",
      "path" : "LogicalModelSenologie.Tumorkonferenz.EmpfehlungTumorkonferenz.Wiedervorstellung",
      "short" : "Wiedervorstellung",
      "definition" : "Datum der Wiedervorstellung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf",
      "path" : "LogicalModelSenologie.Verlauf",
      "short" : "Verlauf / Follow-Up",
      "definition" : "Verlauf / Follow-Up",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.Meldedatum",
      "path" : "LogicalModelSenologie.Verlauf.Meldedatum",
      "short" : "Meldedatum",
      "definition" : "Datum der Verlaufsmeldung (M01)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.Melder",
      "path" : "LogicalModelSenologie.Verlauf.Melder",
      "short" : "Melder",
      "definition" : "Meldende Einrichtung oder Person (M02)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.NachsorgeArt",
      "path" : "LogicalModelSenologie.Verlauf.NachsorgeArt",
      "short" : "Art der Nachsorge",
      "definition" : "Aktiv (Untersuchung) oder passiv (Akten/Register) (M03)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.Vitalstatus",
      "path" : "LogicalModelSenologie.Verlauf.Vitalstatus",
      "short" : "Vitalstatus",
      "definition" : "Lebend, verstorben oder unbekannt (M04)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.TumorstatusLokal",
      "path" : "LogicalModelSenologie.Verlauf.TumorstatusLokal",
      "short" : "Tumorstatus lokal",
      "definition" : "Lokaler Tumorstatus (M05)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.TumorstatusLK",
      "path" : "LogicalModelSenologie.Verlauf.TumorstatusLK",
      "short" : "Tumorstatus Lymphknoten",
      "definition" : "Lymphknoten-Tumorstatus (M06)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.TumorstatusFM",
      "path" : "LogicalModelSenologie.Verlauf.TumorstatusFM",
      "short" : "Tumorstatus Fernmetastasen",
      "definition" : "Fernmetastasen-Tumorstatus (M07)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.Zweittumor",
      "path" : "LogicalModelSenologie.Verlauf.Zweittumor",
      "short" : "Zweittumor",
      "definition" : "Zweittumor diagnostiziert ja/nein/unbekannt (M08)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.ZweitttumorICD",
      "path" : "LogicalModelSenologie.Verlauf.ZweitttumorICD",
      "short" : "Zweittumor ICD-10-GM",
      "definition" : "ICD-10-GM Diagnose des Zweittumors (M09)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "LogicalModelSenologie.Verlauf.ZweitttumorDatum",
      "path" : "LogicalModelSenologie.Verlauf.ZweitttumorDatum",
      "short" : "Zweittumor Diagnosedatum",
      "definition" : "Diagnosedatum des Zweittumors (M10)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    }]
  }
}

```
