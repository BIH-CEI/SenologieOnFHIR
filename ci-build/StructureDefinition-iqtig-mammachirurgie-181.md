# IQTIG QS 18.1 Mammachirurgie (Logical Model) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **IQTIG QS 18.1 Mammachirurgie (Logical Model)**

## Logical Model: IQTIG QS 18.1 Mammachirurgie (Logical Model) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181 | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:IQTIGMammachirurgie181 |

 
Logisches Modell des IQTIG-Datensatzes fuer das QS-Verfahren 18.1 Mammachirurgie (Spezifikation 2024 V05). 
Der Datensatz besteht aus drei Teildatensaetzen: 
* Teildatensatz Basis (B): Patienten- und Falldaten
* Teildatensatz Brust (BRUST): Brustspezifische Diagnose- und Befunddaten
* Teildatensatz Operation (O): Operation, Histologie, Pathologie, Resektionsstatus
 
Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung einer IQTIG-konformen QS-Meldung aus einem Senologie-FHIR-Bundle. Die Serialisierung (CSV / XML) ist nicht Bestandteil dieses Modells. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/iqtig-mammachirurgie-181)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-iqtig-mammachirurgie-181.csv), [Excel](StructureDefinition-iqtig-mammachirurgie-181.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "iqtig-mammachirurgie-181",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181",
  "version" : "0.1.0",
  "name" : "IQTIGMammachirurgie181",
  "title" : "IQTIG QS 18.1 Mammachirurgie (Logical Model)",
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
  "description" : "Logisches Modell des IQTIG-Datensatzes fuer das QS-Verfahren 18.1 Mammachirurgie\n(Spezifikation 2024 V05).\n\nDer Datensatz besteht aus drei Teildatensaetzen:\n- Teildatensatz Basis (B): Patienten- und Falldaten\n- Teildatensatz Brust (BRUST): Brustspezifische Diagnose- und Befunddaten\n- Teildatensatz Operation (O): Operation, Histologie, Pathologie, Resektionsstatus\n\nDieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung\neiner IQTIG-konformen QS-Meldung aus einem Senologie-FHIR-Bundle. Die\nSerialisierung (CSV / XML) ist nicht Bestandteil dieses Modells.",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.senologie.org/fhir/StructureDefinition/iqtig-mammachirurgie-181",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "iqtig-mammachirurgie-181",
      "path" : "iqtig-mammachirurgie-181",
      "short" : "IQTIG QS 18.1 Mammachirurgie (Logical Model)",
      "definition" : "Logisches Modell des IQTIG-Datensatzes fuer das QS-Verfahren 18.1 Mammachirurgie\n(Spezifikation 2024 V05).\n\nDer Datensatz besteht aus drei Teildatensaetzen:\n- Teildatensatz Basis (B): Patienten- und Falldaten\n- Teildatensatz Brust (BRUST): Brustspezifische Diagnose- und Befunddaten\n- Teildatensatz Operation (O): Operation, Histologie, Pathologie, Resektionsstatus\n\nDieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung\neiner IQTIG-konformen QS-Meldung aus einem Senologie-FHIR-Bundle. Die\nSerialisierung (CSV / XML) ist nicht Bestandteil dieses Modells."
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis",
      "short" : "Teildatensatz Basis (B)",
      "definition" : "Patienten- und Falldaten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.institutionskennzeichen",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.institutionskennzeichen",
      "short" : "B:IKNRKH",
      "definition" : "Institutionskennzeichen (IKNR) der Einrichtung (9-stellig)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.entlassenderStandort",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.entlassenderStandort",
      "short" : "B:ENTLSTANDORT",
      "definition" : "Standortkennung des entlassenden Krankenhauses (Standort-ID)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.betriebsstaettennummer",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.betriebsstaettennummer",
      "short" : "B:BSNR",
      "definition" : "Betriebsstaettennummer (BSNR) bei ambulanter Leistung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.pseudonymId",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.pseudonymId",
      "short" : "B:VERSICHERTENIDNEU",
      "definition" : "Patientenpseudonym / Versicherten-ID (pseudonymisiert)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.fallId",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.fallId",
      "short" : "B:VORGANGSNR",
      "definition" : "Vorgangsnummer / Fall-ID (eindeutige Kennung pro Fall)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.datensatzVersion",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.datensatzVersion",
      "short" : "B:DS_VERSION",
      "definition" : "Version des Datensatzes (z.B. 18.1_2024_V05)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.geburtsdatum",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.geburtsdatum",
      "short" : "B:GEBDATUM",
      "definition" : "Geburtsdatum der Patientin / des Patienten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.geschlecht",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.geschlecht",
      "short" : "B:GESCHLECHT",
      "definition" : "Geschlecht: 1=maennlich, 2=weiblich, 8=X, 9=unbestimmt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.postleitzahl",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.postleitzahl",
      "short" : "B:PLZ",
      "definition" : "Postleitzahl des Wohnorts (5-stellig)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.aufnahmedatum",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.aufnahmedatum",
      "short" : "B:AUFNDATUM",
      "definition" : "Aufnahmedatum in die behandelnde Einrichtung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.aufnahmegrund",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.aufnahmegrund",
      "short" : "B:AUFNGRUND",
      "definition" : "Aufnahmegrund nach Paragraph 301 SGB V (4-stellig)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.aufnahmeanlass",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.aufnahmeanlass",
      "short" : "B:AUFNANLASS",
      "definition" : "Aufnahmeanlass: E=Einweisung, N=Notfall, V=Verlegung, G=Geburt, ...",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.einwilligungDatenuebermittlung",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.einwilligungDatenuebermittlung",
      "short" : "B:EINWLANDESGBA",
      "definition" : "Einwilligung zur Datenuebermittlung an Landesstelle/G-BA (0=nein, 1=ja, 9=unbekannt)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.entlassungsdatum",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.entlassungsdatum",
      "short" : "B:ENTLDATUM",
      "definition" : "Entlassungsdatum aus der Einrichtung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBasis.entlassungsgrund",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBasis.entlassungsgrund",
      "short" : "B:ENTLGRUND",
      "definition" : "Entlassungs-/Verlegungsgrund nach Paragraph 301 SGB V",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust",
      "short" : "Teildatensatz Brust (BRUST)",
      "definition" : "Brustspezifische Diagnose- und Befunddaten; ein Eintrag je behandelter Seite",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.laufendeNummer",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.laufendeNummer",
      "short" : "BRUST:LNRBRUST",
      "definition" : "Laufende Nummer des Brust-Teildatensatzes (Zuordnung zu Operation)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.seitenlokalisation",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.seitenlokalisation",
      "short" : "BRUST:SEITE",
      "definition" : "Seitenlokalisation: R=rechts, L=links, B=beidseits",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.indikation",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.indikation",
      "short" : "BRUST:INDIKATION",
      "definition" : "Indikation des Eingriffs: 1=maligne, 2=DCIS, 3=benigne, 4=Risikoreduktion, 5=Rekonstruktion, 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnoseICD",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnoseICD",
      "short" : "BRUST:DIAGICD",
      "definition" : "ICD-10-GM-Kodierung der Diagnose",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnoseICD.code",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnoseICD.code",
      "short" : "Code",
      "definition" : "ICD-10-GM-Code (z.B. C50.4)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnoseICD.version",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnoseICD.version",
      "short" : "Version",
      "definition" : "ICD-10-GM-Version",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnosedatum",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.diagnosedatum",
      "short" : "BRUST:DIAGDATUM",
      "definition" : "Datum der Erstdiagnose",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.tumorgroesseKlinisch",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.tumorgroesseKlinisch",
      "short" : "BRUST:TGROESSEKLIN",
      "definition" : "Praetherapeutische Tumorgroesse in mm (klinisch/bildgebend)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.cT",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.cT",
      "short" : "BRUST:CT",
      "definition" : "klinische T-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.cN",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.cN",
      "short" : "BRUST:CN",
      "definition" : "klinische N-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.cM",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.cM",
      "short" : "BRUST:CM",
      "definition" : "klinische M-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.uiccStadiumKlinisch",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.uiccStadiumKlinisch",
      "short" : "BRUST:UICCKLIN",
      "definition" : "klinisches UICC-Stadium",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.bildgebendeMethode",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.bildgebendeMethode",
      "short" : "BRUST:BILDGMETHODE",
      "definition" : "Eingesetzte bildgebende Methode: 1=Mammografie, 2=Sonografie, 3=MRT, 4=Tomosynthese, 9=sonstige",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.birads",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.birads",
      "short" : "BRUST:BIRADS",
      "definition" : "BI-RADS-Klassifikation (0-6)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.histologischeSicherungPraeop",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.histologischeSicherungPraeop",
      "short" : "BRUST:HISTPRAEOP",
      "definition" : "Praeoperative histologische Sicherung: 0=nein, 1=Stanzbiopsie, 2=Vakuumbiopsie, 3=FNA, 4=Exzisionsbiopsie, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.befundcode",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.befundcode",
      "short" : "BRUST:BEFUND",
      "definition" : "Praeoperativer Befundcode (Pathologie): B1-B5 analog UK-NHSBSP",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.drahtmarkierung",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.drahtmarkierung",
      "short" : "BRUST:DRAHT",
      "definition" : "Praeoperative Drahtmarkierung/Lokalisation: 0=keine, 1=Mammografie, 2=Sonografie, 3=MRT, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.neoadjuvanteTherapie",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.neoadjuvanteTherapie",
      "short" : "BRUST:NEOADJ",
      "definition" : "Neoadjuvante Therapie erhalten: 0=nein, 1=ja-Chemotherapie, 2=ja-endokrin, 3=ja-Antikoerper, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzBrust.tumorkonferenzPraeop",
      "path" : "iqtig-mammachirurgie-181.teildatensatzBrust.tumorkonferenzPraeop",
      "short" : "BRUST:TKPRAEOP",
      "definition" : "Praetherapeutische Tumorkonferenzempfehlung vorhanden: 0=nein, 1=ja, 9=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation",
      "short" : "Teildatensatz Operation (O)",
      "definition" : "Daten zur operativen Behandlung; ein Eintrag je Eingriff",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.laufendeNummer",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.laufendeNummer",
      "short" : "O:LNROP",
      "definition" : "Laufende Nummer des Operations-Teildatensatzes",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.bezugLnrBrust",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.bezugLnrBrust",
      "short" : "O:LNRBRUST",
      "definition" : "Zuordnung zu einem Brust-Teildatensatz (laufende Nummer)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.operationsdatum",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.operationsdatum",
      "short" : "O:OPDATUM",
      "definition" : "Datum der Operation",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.seitenlokalisation",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.seitenlokalisation",
      "short" : "O:SEITE",
      "definition" : "Seitenlokalisation der Operation: R=rechts, L=links, B=beidseits",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.prozeduren",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.prozeduren",
      "short" : "O:OPSCHLUESSEL",
      "definition" : "OPS-Prozedurenkodes des Eingriffs",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.prozeduren.code",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.prozeduren.code",
      "short" : "Code",
      "definition" : "OPS-Kode, z.B. 5-870.a1",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.prozeduren.version",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.prozeduren.version",
      "short" : "Version",
      "definition" : "OPS-Version (z.B. 2024)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.operationsart",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.operationsart",
      "short" : "O:OPART",
      "definition" : "Art des Eingriffs: 1=BET, 2=Mastektomie einfach, 3=Mastektomie hautsparend, 4=Mastektomie nippelsparend, 5=Revision, 6=Wiederaufbau, 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.dignitaetIntraop",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.dignitaetIntraop",
      "short" : "O:DIGNITAET",
      "definition" : "Dignitaet intraoperativ: 1=maligne, 2=benigne, 3=unklar",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.intraopSchnellschnitt",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.intraopSchnellschnitt",
      "short" : "O:SCHNELLSCHNITT",
      "definition" : "Intraoperativer Schnellschnitt durchgefuehrt: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.intraopPraeparatkontrolle",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.intraopPraeparatkontrolle",
      "short" : "O:PRAEPKONTROLLE",
      "definition" : "Intraoperative Praeparatkontrolle (QI-3): 0=nein, 1=Mammografie, 2=Sonografie, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.histologieICDO",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.histologieICDO",
      "short" : "O:HISTMORPH",
      "definition" : "ICD-O-3 Morphologie (Histologietyp)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.histologieICDO.code",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.histologieICDO.code",
      "short" : "Code",
      "definition" : "ICD-O-Morphologie-Code (z.B. 8500/3)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.histologieICDO.version",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.histologieICDO.version",
      "short" : "Version",
      "definition" : "ICD-O-Version",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.grading",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.grading",
      "short" : "O:GRADING",
      "definition" : "Histopathologisches Grading: 1=G1, 2=G2, 3=G3, 4=G4, X=GX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.tumorgroesseInvasiv",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.tumorgroesseInvasiv",
      "short" : "O:TGROESSEINV",
      "definition" : "Maximaler Durchmesser des invasiven Tumorherdes in mm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.tumorgroesseDCIS",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.tumorgroesseDCIS",
      "short" : "O:TGROESSEDCIS",
      "definition" : "Maximaler Durchmesser der DCIS-Komponente in mm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.multifokalitaet",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.multifokalitaet",
      "short" : "O:MULTIFOK",
      "definition" : "Multifokalitaet: 0=nein, 1=multifokal, 2=multizentrisch, 9=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.pT",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.pT",
      "short" : "O:PT",
      "definition" : "Pathologische T-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.pN",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.pN",
      "short" : "O:PN",
      "definition" : "Pathologische N-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.pM",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.pM",
      "short" : "O:PM",
      "definition" : "Pathologische M-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.ySymbol",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.ySymbol",
      "short" : "O:YSYMBOL",
      "definition" : "y-Symbol (nach neoadjuvanter Therapie): 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.uiccStadiumPatho",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.uiccStadiumPatho",
      "short" : "O:UICCPATHO",
      "definition" : "Pathologisches UICC-Stadium",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.l",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.l",
      "short" : "O:L",
      "definition" : "Lymphgefaessinvasion: L0, L1, LX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.v",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.v",
      "short" : "O:V",
      "definition" : "Veneninvasion: V0, V1, V2, VX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.pn",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.pn",
      "short" : "O:PN_PERI",
      "definition" : "Perineurale Invasion: Pn0, Pn1, PnX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.residualstatusLokal",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.residualstatusLokal",
      "short" : "O:RSTATUSLOK",
      "definition" : "Lokaler Residualstatus: R0, R1, R1is, R1cy, R2, RX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.residualstatusGesamt",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.residualstatusGesamt",
      "short" : "O:RSTATUSGES",
      "definition" : "Gesamtresidualstatus: R0, R1, R2, RX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.sentinelDurchgefuehrt",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.sentinelDurchgefuehrt",
      "short" : "O:SENTINEL",
      "definition" : "Sentinel-Lymphknoten-Biopsie durchgefuehrt: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.lkUntersucht",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.lkUntersucht",
      "short" : "O:LKUNTERSUCHT",
      "definition" : "Anzahl untersuchter Lymphknoten (ohne Sentinel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.lkBefallen",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.lkBefallen",
      "short" : "O:LKBEFALLEN",
      "definition" : "Anzahl befallener Lymphknoten (ohne Sentinel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.sentinelLkUntersucht",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.sentinelLkUntersucht",
      "short" : "O:SLKUNTERSUCHT",
      "definition" : "Anzahl untersuchter Sentinel-Lymphknoten",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.sentinelLkBefallen",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.sentinelLkBefallen",
      "short" : "O:SLKBEFALLEN",
      "definition" : "Anzahl befallener Sentinel-Lymphknoten",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.axillaDissektion",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.axillaDissektion",
      "short" : "O:AXDISSEKTION",
      "definition" : "Axilladissektion durchgefuehrt: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.hormonrezeptorStatusER",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.hormonrezeptorStatusER",
      "short" : "O:ERSTATUS",
      "definition" : "Oestrogenrezeptor: P=positiv, N=negativ, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.hormonrezeptorStatusPR",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.hormonrezeptorStatusPR",
      "short" : "O:PRSTATUS",
      "definition" : "Progesteronrezeptor: P=positiv, N=negativ, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.her2Status",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.her2Status",
      "short" : "O:HER2STATUS",
      "definition" : "HER2-Status: P=positiv, N=negativ, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.komplikationen",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.komplikationen",
      "short" : "O:KOMPL",
      "definition" : "Intra-/postoperative Komplikationen",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.komplikationen.kuerzel",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.komplikationen.kuerzel",
      "short" : "Kuerzel",
      "definition" : "Komplikationskuerzel (z.B. WUH=Wundheilungsstoerung, ABS=Abszess)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.komplikationen.icdCode",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.komplikationen.icdCode",
      "short" : "ICD",
      "definition" : "ICD-10-GM-Code der Komplikation (falls vorhanden)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "iqtig-mammachirurgie-181.teildatensatzOperation.revisionsoperation",
      "path" : "iqtig-mammachirurgie-181.teildatensatzOperation.revisionsoperation",
      "short" : "O:REVISION",
      "definition" : "Revisionsoperation waehrend des Aufenthalts: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    }]
  }
}

```
