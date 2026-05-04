# OncoBox Brust N1.1.1 Meldung (Logical Model) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OncoBox Brust N1.1.1 Meldung (Logical Model)**

## Logical Model: OncoBox Brust N1.1.1 Meldung (Logical Model) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:OncoBoxBrustMeldung |

 
Logisches Modell einer OncoBox-Brust-Meldung gemaess OnkoZert-Spezifikation N1.1.1. 
Die OncoBox Brust ist das XML-basierte Exportformat fuer die jaehrliche Uebermittlung von Fall- und Qualitaetsindikatordaten zertifizierter Brustzentren an OnkoZert (DKG-Zertifizierung). Der Datensatz besteht aus folgenden Hauptkomponenten: 
* **Zentrum** – Kennung und Berichtszeitraum
* **Primaerfall** – Patienten- und Falldaten (Primaerfallarten nach OnkoZert-Systematik)
* **Diagnose** – Diagnoseinformationen (ICD-10-GM, TNM, Bildgebung, Histologie)
* **Therapie** – Operationen, Systemtherapie, Strahlentherapie, Hormontherapie, Trastuzumab
* **Tumorkonferenz** – Praetherapeutische und postoperative Fallbesprechung
* **Versorgungskette** – Psychoonkologie, Sozialdienst, Studienteilnahme
* **Nachsorge / Outcome** – Rezidiv, Metastasierung, Tod
* **Kennzahlen (KB-1 bis KB-20)** – DKG-Qualitaetsindikatoren
 
Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung einer OncoBox-Brust-konformen Meldung aus einem Senologie-FHIR-Bundle. Die Serialisierung (XML) ist nicht Bestandteil dieses Modells. 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/oncobox-brust-meldung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-oncobox-brust-meldung.csv), [Excel](StructureDefinition-oncobox-brust-meldung.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "oncobox-brust-meldung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
  "version" : "0.1.0",
  "name" : "OncoBoxBrustMeldung",
  "title" : "OncoBox Brust N1.1.1 Meldung (Logical Model)",
  "status" : "draft",
  "date" : "2026-05-04T07:30:32+00:00",
  "publisher" : "Berlin Institute of Health at Charité (BIH)",
  "contact" : [{
    "name" : "Berlin Institute of Health at Charité (BIH)",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.bihealth.org"
    }]
  }],
  "description" : "Logisches Modell einer OncoBox-Brust-Meldung gemaess OnkoZert-Spezifikation N1.1.1.\n\nDie OncoBox Brust ist das XML-basierte Exportformat fuer die jaehrliche Uebermittlung\nvon Fall- und Qualitaetsindikatordaten zertifizierter Brustzentren an OnkoZert\n(DKG-Zertifizierung). Der Datensatz besteht aus folgenden Hauptkomponenten:\n\n- **Zentrum**  -- Kennung und Berichtszeitraum\n- **Primaerfall** -- Patienten- und Falldaten (Primaerfallarten nach OnkoZert-Systematik)\n- **Diagnose** -- Diagnoseinformationen (ICD-10-GM, TNM, Bildgebung, Histologie)\n- **Therapie** -- Operationen, Systemtherapie, Strahlentherapie, Hormontherapie, Trastuzumab\n- **Tumorkonferenz** -- Praetherapeutische und postoperative Fallbesprechung\n- **Versorgungskette** -- Psychoonkologie, Sozialdienst, Studienteilnahme\n- **Nachsorge / Outcome** -- Rezidiv, Metastasierung, Tod\n- **Kennzahlen (KB-1 bis KB-20)** -- DKG-Qualitaetsindikatoren\n\nDieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung\neiner OncoBox-Brust-konformen Meldung aus einem Senologie-FHIR-Bundle.\nDie Serialisierung (XML) ist nicht Bestandteil dieses Modells.",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "oncobox-brust-meldung",
      "path" : "oncobox-brust-meldung",
      "short" : "OncoBox Brust N1.1.1 Meldung (Logical Model)",
      "definition" : "Logisches Modell einer OncoBox-Brust-Meldung gemaess OnkoZert-Spezifikation N1.1.1.\n\nDie OncoBox Brust ist das XML-basierte Exportformat fuer die jaehrliche Uebermittlung\nvon Fall- und Qualitaetsindikatordaten zertifizierter Brustzentren an OnkoZert\n(DKG-Zertifizierung). Der Datensatz besteht aus folgenden Hauptkomponenten:\n\n- **Zentrum**  -- Kennung und Berichtszeitraum\n- **Primaerfall** -- Patienten- und Falldaten (Primaerfallarten nach OnkoZert-Systematik)\n- **Diagnose** -- Diagnoseinformationen (ICD-10-GM, TNM, Bildgebung, Histologie)\n- **Therapie** -- Operationen, Systemtherapie, Strahlentherapie, Hormontherapie, Trastuzumab\n- **Tumorkonferenz** -- Praetherapeutische und postoperative Fallbesprechung\n- **Versorgungskette** -- Psychoonkologie, Sozialdienst, Studienteilnahme\n- **Nachsorge / Outcome** -- Rezidiv, Metastasierung, Tod\n- **Kennzahlen (KB-1 bis KB-20)** -- DKG-Qualitaetsindikatoren\n\nDieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung\neiner OncoBox-Brust-konformen Meldung aus einem Senologie-FHIR-Bundle.\nDie Serialisierung (XML) ist nicht Bestandteil dieses Modells."
    },
    {
      "id" : "oncobox-brust-meldung.zentrum",
      "path" : "oncobox-brust-meldung.zentrum",
      "short" : "Zentrum",
      "definition" : "Kennung des meldenden Brustzentrums",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.oncoBoxVersion",
      "path" : "oncobox-brust-meldung.zentrum.oncoBoxVersion",
      "short" : "OncoBox_Version",
      "definition" : "Version der OncoBox-Spezifikation (hier: N1.1.1)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.zentrumId",
      "path" : "oncobox-brust-meldung.zentrum.zentrumId",
      "short" : "Zentrum_ID",
      "definition" : "OnkoZert-Zentrumskennung (z.B. DKG-Brustzentrum-Nr.)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.zentrumName",
      "path" : "oncobox-brust-meldung.zentrum.zentrumName",
      "short" : "Zentrum_Name",
      "definition" : "Name des meldenden Brustzentrums",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.iknr",
      "path" : "oncobox-brust-meldung.zentrum.iknr",
      "short" : "IKNR",
      "definition" : "Institutionskennzeichen der fuehrenden Betriebsstaette",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.standortId",
      "path" : "oncobox-brust-meldung.zentrum.standortId",
      "short" : "Standort_ID",
      "definition" : "Standortkennung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.berichtszeitraumBeginn",
      "path" : "oncobox-brust-meldung.zentrum.berichtszeitraumBeginn",
      "short" : "Berichtszeitraum_Beginn",
      "definition" : "Start des Auditzeitraums (i.d.R. 01.07. Vorjahr)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.berichtszeitraumEnde",
      "path" : "oncobox-brust-meldung.zentrum.berichtszeitraumEnde",
      "short" : "Berichtszeitraum_Ende",
      "definition" : "Ende des Auditzeitraums (i.d.R. 30.06. laufendes Jahr)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.zentrum.meldungsdatum",
      "path" : "oncobox-brust-meldung.zentrum.meldungsdatum",
      "short" : "Meldungsdatum",
      "definition" : "Zeitpunkt der Meldungserstellung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall",
      "path" : "oncobox-brust-meldung.primaerfall",
      "short" : "Primaerfall",
      "definition" : "Primaerer Behandlungsfall im Berichtszeitraum",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.fallId",
      "path" : "oncobox-brust-meldung.primaerfall.fallId",
      "short" : "Fall_ID",
      "definition" : "Eindeutige Fallkennung im Zentrum (pseudonymisiert)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patientPseudonym",
      "path" : "oncobox-brust-meldung.primaerfall.patientPseudonym",
      "short" : "Patient_Pseudonym",
      "definition" : "Patienten-Pseudonym (zentrumsintern)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.primaerfallart",
      "path" : "oncobox-brust-meldung.primaerfall.primaerfallart",
      "short" : "Primaerfallart",
      "definition" : "Primaerfallart nach OnkoZert-Systematik (z.B. 1=invasiv, 2=DCIS, 3=Rezidiv, 4=Metastasiert primaer, 5=phylloides, 6=Sarkom, 7=Risikoreduktion, 8=Rekonstruktion, 9=sonstige)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.primaerfallSubtyp",
      "path" : "oncobox-brust-meldung.primaerfall.primaerfallSubtyp",
      "short" : "Primaerfall_Subtyp",
      "definition" : "Feinere Klassifikation (aus Sheet 'Primaerfallarten')",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patient",
      "path" : "oncobox-brust-meldung.primaerfall.patient",
      "short" : "Patient",
      "definition" : "Patientenbasisdaten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patient.geburtsdatum",
      "path" : "oncobox-brust-meldung.primaerfall.patient.geburtsdatum",
      "short" : "Patient_Geburtsdatum",
      "definition" : "Geburtsdatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patient.geschlecht",
      "path" : "oncobox-brust-meldung.primaerfall.patient.geschlecht",
      "short" : "Patient_Geschlecht",
      "definition" : "Geschlecht: W=weiblich, M=maennlich, D=divers, U=unbekannt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patient.postleitzahl",
      "path" : "oncobox-brust-meldung.primaerfall.patient.postleitzahl",
      "short" : "Patient_PLZ",
      "definition" : "Postleitzahl des Wohnorts",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patient.alterBeiDiagnose",
      "path" : "oncobox-brust-meldung.primaerfall.patient.alterBeiDiagnose",
      "short" : "Patient_Alter_Diagnose",
      "definition" : "Alter zum Diagnosezeitpunkt in Jahren",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.patient.menopausenstatus",
      "path" : "oncobox-brust-meldung.primaerfall.patient.menopausenstatus",
      "short" : "Patient_Menopausenstatus",
      "definition" : "Menopausenstatus: 1=praemenopausal, 2=perimenopausal, 3=postmenopausal, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.fall",
      "path" : "oncobox-brust-meldung.primaerfall.fall",
      "short" : "Fall",
      "definition" : "Behandlungsfall",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.fall.fallTyp",
      "path" : "oncobox-brust-meldung.primaerfall.fall.fallTyp",
      "short" : "Fall_Typ",
      "definition" : "Fallart: 1=stationaer, 2=ambulant, 3=teilstationaer",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.fall.aufnahmedatum",
      "path" : "oncobox-brust-meldung.primaerfall.fall.aufnahmedatum",
      "short" : "Fall_Aufnahmedatum",
      "definition" : "Aufnahmedatum (bei stationaer)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.fall.entlassungsdatum",
      "path" : "oncobox-brust-meldung.primaerfall.fall.entlassungsdatum",
      "short" : "Fall_Entlassungsdatum",
      "definition" : "Entlassungsdatum (bei stationaer)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose",
      "short" : "Diagnose",
      "definition" : "Diagnoseinformationen (primaere Tumordiagnose)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnosedatum",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnosedatum",
      "short" : "Diagnose_Datum",
      "definition" : "Datum der Erstdiagnose",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICD",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICD",
      "short" : "Diagnose_ICD",
      "definition" : "ICD-10-GM-Kodierung der Hauptdiagnose",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICD.code",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICD.code",
      "short" : "Diagnose_ICD_Code",
      "definition" : "ICD-10-GM Code (z.B. C50.4, D05.1)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICD.version",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICD.version",
      "short" : "Diagnose_ICD_Version",
      "definition" : "ICD-10-GM Version",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICDO",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICDO",
      "short" : "Diagnose_ICDO",
      "definition" : "ICD-O-3 Morphologie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICDO.code",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICDO.code",
      "short" : "Diagnose_ICDO_Code",
      "definition" : "ICD-O-Morphologie-Code (z.B. 8500/3)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICDO.version",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.diagnoseICDO.version",
      "short" : "Diagnose_ICDO_Version",
      "definition" : "ICD-O Version",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.seitenlokalisation",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.seitenlokalisation",
      "short" : "Diagnose_Seite",
      "definition" : "Seitenlokalisation: R=rechts, L=links, B=beidseits, U=unbekannt",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.dignitaet",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.dignitaet",
      "short" : "Diagnose_Dignitaet",
      "definition" : "Dignitaet: 1=maligne, 2=in-situ, 3=borderline, 4=benigne, 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.grading",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.grading",
      "short" : "Diagnose_Grading",
      "definition" : "Histopathologisches Grading: G1, G2, G3, G4, GX, GB (low-grade DCIS), GI (intermediate DCIS), GH (high-grade DCIS)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.histologischeSicherungPraeop",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.histologischeSicherungPraeop",
      "short" : "Diagnose_Histo_Praeop",
      "definition" : "Praeoperative histologische Sicherung: 0=nein, 1=Stanzbiopsie, 2=Vakuumbiopsie, 3=FNA, 4=offene Biopsie, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezidivtyp",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezidivtyp",
      "short" : "Diagnose_Rezidivtyp",
      "definition" : "Falls Rezidiv: 1=lokoregionaer, 2=kontralateral, 3=fern, 9=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung",
      "short" : "Bildgebung",
      "definition" : "Praeoperative bildgebende Diagnostik",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.methode",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.methode",
      "short" : "Bildgebung_Methode",
      "definition" : "Modalitaet: 1=Mammografie, 2=Sonografie, 3=MRT, 4=Tomosynthese, 5=Galaktografie, 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.datum",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.datum",
      "short" : "Bildgebung_Datum",
      "definition" : "Untersuchungsdatum",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.birads",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.birads",
      "short" : "Bildgebung_BIRADS",
      "definition" : "BI-RADS-Klassifikation: 0, 1, 2, 3, 4, 4a, 4b, 4c, 5, 6",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.befundText",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.bildgebung.befundText",
      "short" : "Bildgebung_Befund",
      "definition" : "Befund (Freitext, optional)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM",
      "short" : "cTNM",
      "definition" : "klinisches TNM (praetherapeutisch)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.cT",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.cT",
      "short" : "cTNM_T",
      "definition" : "klinische T-Kategorie (z.B. cT1, cT2)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.cN",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.cN",
      "short" : "cTNM_N",
      "definition" : "klinische N-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.cM",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.cM",
      "short" : "cTNM_M",
      "definition" : "klinische M-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.tnmVersion",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.tnmVersion",
      "short" : "cTNM_Version",
      "definition" : "TNM-Auflage (z.B. 8)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.uiccStadium",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.uiccStadium",
      "short" : "cTNM_UICC",
      "definition" : "klinisches UICC-Stadium",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.tumorgroesseKlinisch",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.cTNM.tumorgroesseKlinisch",
      "short" : "cTNM_Groesse_mm",
      "definition" : "praetherapeutische Tumorgroesse in mm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM",
      "short" : "pTNM",
      "definition" : "pathologisches TNM (postoperativ)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.ySymbol",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.ySymbol",
      "short" : "pTNM_ySymbol",
      "definition" : "y-Symbol (nach neoadjuvanter Therapie): 0=nein, y=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pT",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pT",
      "short" : "pTNM_T",
      "definition" : "pathologische T-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pN",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pN",
      "short" : "pTNM_N",
      "definition" : "pathologische N-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pM",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pM",
      "short" : "pTNM_M",
      "definition" : "pathologische M-Kategorie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.tnmVersion",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.tnmVersion",
      "short" : "pTNM_Version",
      "definition" : "TNM-Auflage",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.uiccStadium",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.uiccStadium",
      "short" : "pTNM_UICC",
      "definition" : "pathologisches UICC-Stadium",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.tumorgroesseInvasiv",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.tumorgroesseInvasiv",
      "short" : "pTNM_Groesse_Invasiv_mm",
      "definition" : "Groesse invasiver Anteil in mm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.tumorgroesseDCIS",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.tumorgroesseDCIS",
      "short" : "pTNM_Groesse_DCIS_mm",
      "definition" : "Groesse DCIS-Anteil in mm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.multifokalitaet",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.multifokalitaet",
      "short" : "pTNM_Multifokal",
      "definition" : "Multifokalitaet: 0=nein, 1=multifokal, 2=multizentrisch, 9=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.l",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.l",
      "short" : "pTNM_L",
      "definition" : "Lymphgefaessinvasion: L0, L1, LX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.v",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.v",
      "short" : "pTNM_V",
      "definition" : "Veneninvasion: V0, V1, V2, VX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pn",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.pTNM.pn",
      "short" : "pTNM_Pn",
      "definition" : "Perineurale Invasion: Pn0, Pn1, PnX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten",
      "short" : "Lymphknoten",
      "definition" : "Lymphknotenstatus",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.untersucht",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.untersucht",
      "short" : "LK_Untersucht",
      "definition" : "Anzahl untersuchter Lymphknoten (ohne Sentinel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.befallen",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.befallen",
      "short" : "LK_Befallen",
      "definition" : "Anzahl befallener Lymphknoten (ohne Sentinel)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.sentinelUntersucht",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.sentinelUntersucht",
      "short" : "SLK_Untersucht",
      "definition" : "Anzahl untersuchter Sentinel-Lymphknoten",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.sentinelBefallen",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.lymphknoten.sentinelBefallen",
      "short" : "SLK_Befallen",
      "definition" : "Anzahl befallener Sentinel-Lymphknoten",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus",
      "short" : "Rezeptorstatus",
      "definition" : "Hormon- und HER2-Rezeptorstatus",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.erStatus",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.erStatus",
      "short" : "ER_Status",
      "definition" : "Oestrogenrezeptor: P=positiv, N=negativ, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.erProzent",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.erProzent",
      "short" : "ER_Prozent",
      "definition" : "Anteil ER-positiver Zellen (%)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.prStatus",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.prStatus",
      "short" : "PR_Status",
      "definition" : "Progesteronrezeptor: P=positiv, N=negativ, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.prProzent",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.prProzent",
      "short" : "PR_Prozent",
      "definition" : "Anteil PR-positiver Zellen (%)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.her2Status",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.her2Status",
      "short" : "HER2_Status",
      "definition" : "HER2-Status: P=positiv, N=negativ, U=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.her2Score",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.her2Score",
      "short" : "HER2_Score",
      "definition" : "IHC-Score: 0, 1+, 2+, 3+",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.ki67",
      "path" : "oncobox-brust-meldung.primaerfall.diagnose.rezeptorstatus.ki67",
      "short" : "Ki67_Prozent",
      "definition" : "Ki-67-Proliferationsindex (%)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation",
      "path" : "oncobox-brust-meldung.primaerfall.operation",
      "short" : "Operation",
      "definition" : "Operativer Eingriff",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.lnr",
      "path" : "oncobox-brust-meldung.primaerfall.operation.lnr",
      "short" : "Op_LNR",
      "definition" : "Laufende Nummer der Operation im Fall",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.datum",
      "path" : "oncobox-brust-meldung.primaerfall.operation.datum",
      "short" : "Op_Datum",
      "definition" : "Operationsdatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.seitenlokalisation",
      "path" : "oncobox-brust-meldung.primaerfall.operation.seitenlokalisation",
      "short" : "Op_Seite",
      "definition" : "Seitenlokalisation: R/L/B",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.operationsart",
      "path" : "oncobox-brust-meldung.primaerfall.operation.operationsart",
      "short" : "Op_Art",
      "definition" : "Operationsart: 1=BET, 2=Mastektomie einfach, 3=Mastektomie hautsparend (SSM), 4=Mastektomie nippelsparend (NSM), 5=Revision, 6=Wiederaufbau, 7=Axilladissektion (isoliert), 8=SLNB (isoliert), 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.opsCodes",
      "path" : "oncobox-brust-meldung.primaerfall.operation.opsCodes",
      "short" : "Op_OPS",
      "definition" : "OPS-Kode(s) des Eingriffs",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.opsCodes.code",
      "path" : "oncobox-brust-meldung.primaerfall.operation.opsCodes.code",
      "short" : "Op_OPS_Code",
      "definition" : "OPS-Kode",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.opsCodes.version",
      "path" : "oncobox-brust-meldung.primaerfall.operation.opsCodes.version",
      "short" : "Op_OPS_Version",
      "definition" : "OPS-Version",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.drahtmarkierung",
      "path" : "oncobox-brust-meldung.primaerfall.operation.drahtmarkierung",
      "short" : "Op_Drahtmarkierung",
      "definition" : "Praeoperative Drahtmarkierung: 0=keine, 1=sonografisch, 2=mammografisch, 3=MRT, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.sentinel",
      "path" : "oncobox-brust-meldung.primaerfall.operation.sentinel",
      "short" : "Op_Sentinel",
      "definition" : "Sentinel-Lymphknoten-Biopsie durchgefuehrt: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.axillaDissektion",
      "path" : "oncobox-brust-meldung.primaerfall.operation.axillaDissektion",
      "short" : "Op_Axdissektion",
      "definition" : "Axilladissektion durchgefuehrt: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.intraopSchnellschnitt",
      "path" : "oncobox-brust-meldung.primaerfall.operation.intraopSchnellschnitt",
      "short" : "Op_Schnellschnitt",
      "definition" : "Intraoperativer Schnellschnitt: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.intraopPraeparatkontrolle",
      "path" : "oncobox-brust-meldung.primaerfall.operation.intraopPraeparatkontrolle",
      "short" : "Op_Praeparatkontrolle",
      "definition" : "Intraoperative Praeparatkontrolle: 0=nein, 1=Mammografie, 2=Sonografie, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.residualstatusLokal",
      "path" : "oncobox-brust-meldung.primaerfall.operation.residualstatusLokal",
      "short" : "Op_R_Lokal",
      "definition" : "Lokaler Residualstatus: R0, R1, R1is, R1cy, R2, RX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.residualstatusGesamt",
      "path" : "oncobox-brust-meldung.primaerfall.operation.residualstatusGesamt",
      "short" : "Op_R_Gesamt",
      "definition" : "Gesamtresidualstatus: R0, R1, R2, RX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.revisionsOp",
      "path" : "oncobox-brust-meldung.primaerfall.operation.revisionsOp",
      "short" : "Op_Revision",
      "definition" : "Revisionsoperation: 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.anzahlEingriffeR0",
      "path" : "oncobox-brust-meldung.primaerfall.operation.anzahlEingriffeR0",
      "short" : "Op_Anzahl_bis_R0",
      "definition" : "Anzahl Eingriffe bis zum Erreichen einer R0-Resektion (KB-14)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.komplikationen",
      "path" : "oncobox-brust-meldung.primaerfall.operation.komplikationen",
      "short" : "Op_Komplikation",
      "definition" : "Intra-/postoperative Komplikationen",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.komplikationen.kuerzel",
      "path" : "oncobox-brust-meldung.primaerfall.operation.komplikationen.kuerzel",
      "short" : "Komp_Kuerzel",
      "definition" : "Komplikations-Kuerzel (z.B. WUH, ABS)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.komplikationen.icdCode",
      "path" : "oncobox-brust-meldung.primaerfall.operation.komplikationen.icdCode",
      "short" : "Komp_ICD",
      "definition" : "ICD-10-GM-Code (falls zutreffend)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.operation.komplikationen.clavienDindo",
      "path" : "oncobox-brust-meldung.primaerfall.operation.komplikationen.clavienDindo",
      "short" : "Komp_Clavien",
      "definition" : "Clavien-Dindo-Grad",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie",
      "short" : "Systemtherapie",
      "definition" : "Systemische Tumortherapie (Chemo-, Immun-, zielgerichtete Therapie)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.lnr",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.lnr",
      "short" : "Syst_LNR",
      "definition" : "Laufende Nummer der Therapie",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.therapieart",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.therapieart",
      "short" : "Syst_Art",
      "definition" : "Therapieart: 1=Chemotherapie, 2=Immuntherapie, 3=zielgerichtete Therapie (u.a. Trastuzumab), 4=Kombination, 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.stellungZurOP",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.stellungZurOP",
      "short" : "Syst_Stellung",
      "definition" : "Stellung zur Operation: N=neoadjuvant, A=adjuvant, P=palliativ, S=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.beginn",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.beginn",
      "short" : "Syst_Beginn",
      "definition" : "Beginn der Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.ende",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.ende",
      "short" : "Syst_Ende",
      "definition" : "Ende der Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.protokoll",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.protokoll",
      "short" : "Syst_Protokoll",
      "definition" : "Protokollbezeichnung (z.B. EC-Pac, TCH)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.enthaeltTrastuzumab",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.enthaeltTrastuzumab",
      "short" : "Syst_Trastuzumab",
      "definition" : "Trastuzumab enthalten: 0=nein, 1=ja (KB-7 relevant)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.systemtherapie.firstLine",
      "path" : "oncobox-brust-meldung.primaerfall.systemtherapie.firstLine",
      "short" : "Syst_FirstLine",
      "definition" : "First-Line-Therapie bei Metastasierung: 0=nein, 1=ja (KB-8 relevant)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.endokrineTherapie",
      "path" : "oncobox-brust-meldung.primaerfall.endokrineTherapie",
      "short" : "Endokrine_Therapie",
      "definition" : "Endokrine Therapie (Tamoxifen, Aromatasehemmer, GnRH etc.)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.lnr",
      "path" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.lnr",
      "short" : "Endo_LNR",
      "definition" : "Laufende Nummer",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.substanz",
      "path" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.substanz",
      "short" : "Endo_Substanz",
      "definition" : "Substanzklasse: 1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6i, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.beginn",
      "path" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.beginn",
      "short" : "Endo_Beginn",
      "definition" : "Therapiebeginn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.ende",
      "path" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.ende",
      "short" : "Endo_Ende",
      "definition" : "Therapieende",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.stellungZurOP",
      "path" : "oncobox-brust-meldung.primaerfall.endokrineTherapie.stellungZurOP",
      "short" : "Endo_Stellung",
      "definition" : "Stellung zur OP: N=neoadjuvant, A=adjuvant, P=palliativ",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie",
      "short" : "Strahlentherapie",
      "definition" : "Strahlentherapie",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.lnr",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.lnr",
      "short" : "RT_LNR",
      "definition" : "Laufende Nummer",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.beginn",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.beginn",
      "short" : "RT_Beginn",
      "definition" : "Therapiebeginn",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.ende",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.ende",
      "short" : "RT_Ende",
      "definition" : "Therapieende",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.zielgebiet",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.zielgebiet",
      "short" : "RT_Zielgebiet",
      "definition" : "Zielgebiet: 1=Brust/Thorax, 2=LAW, 3=Boost, 4=Fernmetastase, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.gesamtdosisGy",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.gesamtdosisGy",
      "short" : "RT_Dosis_Gy",
      "definition" : "Gesamtdosis in Gy",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.einzeldosisGy",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.einzeldosisGy",
      "short" : "RT_Einzeldosis_Gy",
      "definition" : "Einzeldosis pro Fraktion in Gy",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.strahlentherapie.stellungZurOP",
      "path" : "oncobox-brust-meldung.primaerfall.strahlentherapie.stellungZurOP",
      "short" : "RT_Stellung",
      "definition" : "Stellung zur OP: N=neoadjuvant, A=adjuvant, P=palliativ",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tumorkonferenz",
      "path" : "oncobox-brust-meldung.primaerfall.tumorkonferenz",
      "short" : "Tumorkonferenz",
      "definition" : "Tumorkonferenz / Fallbesprechung",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.lnr",
      "path" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.lnr",
      "short" : "TK_LNR",
      "definition" : "Laufende Nummer",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.datum",
      "path" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.datum",
      "short" : "TK_Datum",
      "definition" : "Datum der Konferenz",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.typ",
      "path" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.typ",
      "short" : "TK_Typ",
      "definition" : "Typ: 1=praetherapeutisch (KB-2), 2=postoperativ (KB-1), 3=Rezidiv/Metastasen (KB-3)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.empfehlungText",
      "path" : "oncobox-brust-meldung.primaerfall.tumorkonferenz.empfehlungText",
      "short" : "TK_Empfehlung",
      "definition" : "Therapieempfehlung (Freitext)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.psychoonkologie",
      "path" : "oncobox-brust-meldung.primaerfall.psychoonkologie",
      "short" : "Psychoonkologie",
      "definition" : "Psychoonkologische Mitbetreuung (KB-9)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.psychoonkologie.erfolgt",
      "path" : "oncobox-brust-meldung.primaerfall.psychoonkologie.erfolgt",
      "short" : "Psych_Erfolgt",
      "definition" : "Psychoonkologische Anbindung erfolgt: 0=nein, 1=ja",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.psychoonkologie.datum",
      "path" : "oncobox-brust-meldung.primaerfall.psychoonkologie.datum",
      "short" : "Psych_Datum",
      "definition" : "Datum des ersten Kontakts",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.sozialdienst",
      "path" : "oncobox-brust-meldung.primaerfall.sozialdienst",
      "short" : "Sozialdienst",
      "definition" : "Sozialdienstliche Mitbetreuung (KB-10)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.sozialdienst.erfolgt",
      "path" : "oncobox-brust-meldung.primaerfall.sozialdienst.erfolgt",
      "short" : "Soz_Erfolgt",
      "definition" : "Sozialdienstliche Anbindung erfolgt: 0=nein, 1=ja",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.sozialdienst.datum",
      "path" : "oncobox-brust-meldung.primaerfall.sozialdienst.datum",
      "short" : "Soz_Datum",
      "definition" : "Datum des ersten Kontakts",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.studienteilnahme",
      "path" : "oncobox-brust-meldung.primaerfall.studienteilnahme",
      "short" : "Studienteilnahme",
      "definition" : "Teilnahme an klinischer Studie (KB-11)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.studienteilnahme.teilgenommen",
      "path" : "oncobox-brust-meldung.primaerfall.studienteilnahme.teilgenommen",
      "short" : "Stud_Teilgenommen",
      "definition" : "Studienteilnahme: 0=nein, 1=ja",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.studienteilnahme.studienKurzname",
      "path" : "oncobox-brust-meldung.primaerfall.studienteilnahme.studienKurzname",
      "short" : "Stud_Name",
      "definition" : "Kurzname der Studie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.studienteilnahme.studiennameCode",
      "path" : "oncobox-brust-meldung.primaerfall.studienteilnahme.studiennameCode",
      "short" : "Stud_Name_Code",
      "definition" : "Studienname aus Auswahlliste (K02, OncoBox 2.0)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.studienteilnahme.screening",
      "path" : "oncobox-brust-meldung.primaerfall.studienteilnahme.screening",
      "short" : "Stud_Screening",
      "definition" : "Screening zur Studienteilnahme durchgefuehrt (K03, OncoBox 2.0): 0=nein, 1=ja",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.studienteilnahme.art",
      "path" : "oncobox-brust-meldung.primaerfall.studienteilnahme.art",
      "short" : "Stud_Art",
      "definition" : "Art der Studie: 1=interventionell, 2=nicht-interventionell, 3=Beobachtung/Register, 9=sonstige",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf",
      "short" : "Verlauf",
      "definition" : "Verlaufsmeldung / Nachsorge (M01-M10 + Ereignisse)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.meldedatum",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.meldedatum",
      "short" : "Meldedatum",
      "definition" : "Datum der Verlaufsmeldung (M01)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.melder",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.melder",
      "short" : "Melder",
      "definition" : "Meldende Einrichtung / Person (M02)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.nachsorgeArt",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.nachsorgeArt",
      "short" : "Nachsorge_Art",
      "definition" : "Art der Nachsorge: aktiv=persoenlich untersucht, passiv=aus Akten/Registern (M03)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.vitalstatus",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.vitalstatus",
      "short" : "Vitalstatus",
      "definition" : "Vitalstatus: lebend, verstorben, unbekannt (M04)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.tumorstatusLokal",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.tumorstatusLokal",
      "short" : "Tumorstatus_Lokal",
      "definition" : "Lokaler Tumorstatus: K=kein Tumor, T=Tumorreste, P=Progress, N=No Change, R=Lokalrezidiv, F=fraglich, U=unbekannt, X=fehlend (M05)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.tumorstatusLK",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.tumorstatusLK",
      "short" : "Tumorstatus_LK",
      "definition" : "Lymphknoten-Tumorstatus: K, T, P, N, R, F, U, X (M06)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.tumorstatusFM",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.tumorstatusFM",
      "short" : "Tumorstatus_FM",
      "definition" : "Fernmetastasen-Tumorstatus: K, T, P, N, R, F, U, X (M07)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.zweittumor",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.zweittumor",
      "short" : "Zweittumor",
      "definition" : "Zweittumor diagnostiziert: ja, nein, unbekannt (M08)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.zweitttumorIcd",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.zweitttumorIcd",
      "short" : "Zweittumor_ICD",
      "definition" : "ICD-10-GM Diagnose des Zweittumors (M09)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.zweitttumorDatum",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.zweitttumorDatum",
      "short" : "Zweittumor_Datum",
      "definition" : "Diagnosedatum des Zweittumors (M10)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.ereignis",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.ereignis",
      "short" : "Verlauf_Ereignis",
      "definition" : "Ereignis: 1=Lokalrezidiv, 2=Regionaerrezidiv, 3=Fernmetastase, 4=kontralaterales Mamma-CA, 5=Zweitmalignom, 6=Progress",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmOperation",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmOperation",
      "short" : "FM_Operation",
      "definition" : "Operation bei Fernmetastasen (OncoBox 2.0 J03/J05)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmOperation.opDatum",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmOperation.opDatum",
      "short" : "FM_Op_Datum",
      "definition" : "J03: Datum der FM-Operation (z.B. Metastasenresektion)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmOperation.residualstatus",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmOperation.residualstatus",
      "short" : "FM_R_Status",
      "definition" : "J05: Residualstatus nach FM-Operation: R0, R1, R2, RX",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie",
      "short" : "FM_Therapie",
      "definition" : "Therapie bei Fernmetastasen (OncoBox 2.0 J04)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie.therapieart",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie.therapieart",
      "short" : "FM_Therapie_Art",
      "definition" : "Art der FM-Therapie: 1=Chemotherapie, 2=Immuntherapie, 3=zielgerichtete Therapie, 4=Strahlentherapie, 5=endokrine Therapie, 9=sonstige",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie.beginn",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie.beginn",
      "short" : "FM_Therapie_Beginn",
      "definition" : "Beginn der FM-Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie.ende",
      "path" : "oncobox-brust-meldung.primaerfall.verlauf.fmTherapie.ende",
      "short" : "FM_Therapie_Ende",
      "definition" : "Ende der FM-Therapie",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tod",
      "path" : "oncobox-brust-meldung.primaerfall.tod",
      "short" : "Tod",
      "definition" : "Tod der Patientin im Berichtszeitraum",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tod.sterbedatum",
      "path" : "oncobox-brust-meldung.primaerfall.tod.sterbedatum",
      "short" : "Tod_Datum",
      "definition" : "Sterbedatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tod.todesursache",
      "path" : "oncobox-brust-meldung.primaerfall.tod.todesursache",
      "short" : "Tod_Ursache",
      "definition" : "Todesursache (ICD-10-GM-Kode)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.primaerfall.tod.tumorbedingt",
      "path" : "oncobox-brust-meldung.primaerfall.tod.tumorbedingt",
      "short" : "Tod_Tumorbedingt",
      "definition" : "Tod tumorbedingt: 0=nein, 1=ja, 9=unbekannt",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl",
      "path" : "oncobox-brust-meldung.kennzahl",
      "short" : "Kennzahl",
      "definition" : "DKG-Qualitaetsindikator (KB-1 bis KB-20)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.kennzahlId",
      "path" : "oncobox-brust-meldung.kennzahl.kennzahlId",
      "short" : "KB_ID",
      "definition" : "Kennzahl-ID: KB-1 ... KB-20",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.bezeichnung",
      "path" : "oncobox-brust-meldung.kennzahl.bezeichnung",
      "short" : "KB_Bezeichnung",
      "definition" : "Kurzbezeichnung der Kennzahl",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.zaehler",
      "path" : "oncobox-brust-meldung.kennzahl.zaehler",
      "short" : "KB_Zaehler",
      "definition" : "Zaehler (Anzahl Faelle, die das Qualitaetskriterium erfuellen)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.nenner",
      "path" : "oncobox-brust-meldung.kennzahl.nenner",
      "short" : "KB_Nenner",
      "definition" : "Nenner (Gesamtanzahl einschlussfaehiger Faelle)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.ergebnisProzent",
      "path" : "oncobox-brust-meldung.kennzahl.ergebnisProzent",
      "short" : "KB_Ergebnis",
      "definition" : "Zaehler/Nenner in Prozent",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.sollwertProzent",
      "path" : "oncobox-brust-meldung.kennzahl.sollwertProzent",
      "short" : "KB_Sollwert",
      "definition" : "Zielwert gemaess DKG-Erhebungsbogen (in Prozent)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "decimal"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.sollwertErfuellt",
      "path" : "oncobox-brust-meldung.kennzahl.sollwertErfuellt",
      "short" : "KB_Erfuellt",
      "definition" : "Sollwert erfuellt: 0=nein, 1=ja, U=nicht bewertbar",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "oncobox-brust-meldung.kennzahl.kommentar",
      "path" : "oncobox-brust-meldung.kennzahl.kommentar",
      "short" : "KB_Kommentar",
      "definition" : "Kommentar / Begruendung (bei Nichterfuellung)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
