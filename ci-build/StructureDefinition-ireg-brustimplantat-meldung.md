# IRegG Brustimplantat Meldung (Logical Model) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **IRegG Brustimplantat Meldung (Logical Model)**

## Logical Model: IRegG Brustimplantat Meldung (Logical Model) 

| | |
| :--- | :--- |
| *Official URL*:https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung | *Version*:0.1.0 |
| Draft as of 2026-05-04 | *Computable Name*:IRegBrustimplantatMeldung |

 
Logisches Modell der GEMeldung fuer Brustimplantate gemaess IRegD XML-Spezifikation V4.1.1. 
Dieses Modell bildet die Hierarchie der XML-Nachricht ab, beschraenkt auf den Brustimplantat-Anteil (ohne Endoprothese und Aortenklappe). Es dient als StructureMap-Target fuer die Erzeugung von IRegG-XML-Meldungen aus FHIR-Ressourcen. 
Mapping-Uebersicht: 
* Meldung (MEL_*) -> MessageHeader + Organization
* Fall (FAL_*) -> Encounter
* PatientenaufnahmeBrustimplantat (PAT_* + PAB_*) -> Patient + Observations
* Operation (OPE_* + OBI_*) -> Procedure
* Artikelidentifikation (ARI_* + ARB_* + ABI_*) -> Device
* Zubehoer (ZUB_* + ZBI_*) -> Device
* Entlassung (ENT_* + DBI_*) -> Encounter.hospitalization + Condition
 

**Usages:**

* This Logical Model is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/kds-senologie|current/StructureDefinition/ireg-brustimplantat-meldung)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ireg-brustimplantat-meldung.csv), [Excel](StructureDefinition-ireg-brustimplantat-meldung.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ireg-brustimplantat-meldung",
  "url" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
  "version" : "0.1.0",
  "name" : "IRegBrustimplantatMeldung",
  "title" : "IRegG Brustimplantat Meldung (Logical Model)",
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
  "description" : "Logisches Modell der GEMeldung fuer Brustimplantate gemaess IRegD XML-Spezifikation V4.1.1.\n\nDieses Modell bildet die Hierarchie der XML-Nachricht ab, beschraenkt auf den\nBrustimplantat-Anteil (ohne Endoprothese und Aortenklappe). Es dient als\nStructureMap-Target fuer die Erzeugung von IRegG-XML-Meldungen aus FHIR-Ressourcen.\n\nMapping-Uebersicht:\n- Meldung (MEL_*) -> MessageHeader + Organization\n- Fall (FAL_*) -> Encounter\n- PatientenaufnahmeBrustimplantat (PAT_* + PAB_*) -> Patient + Observations\n- Operation (OPE_* + OBI_*) -> Procedure\n- Artikelidentifikation (ARI_* + ARB_* + ABI_*) -> Device\n- Zubehoer (ZUB_* + ZBI_*) -> Device\n- Entlassung (ENT_* + DBI_*) -> Encounter.hospitalization + Condition",
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.senologie.org/fhir/StructureDefinition/ireg-brustimplantat-meldung",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ireg-brustimplantat-meldung",
      "path" : "ireg-brustimplantat-meldung",
      "short" : "IRegG Brustimplantat Meldung (Logical Model)",
      "definition" : "Logisches Modell der GEMeldung fuer Brustimplantate gemaess IRegD XML-Spezifikation V4.1.1.\n\nDieses Modell bildet die Hierarchie der XML-Nachricht ab, beschraenkt auf den\nBrustimplantat-Anteil (ohne Endoprothese und Aortenklappe). Es dient als\nStructureMap-Target fuer die Erzeugung von IRegG-XML-Meldungen aus FHIR-Ressourcen.\n\nMapping-Uebersicht:\n- Meldung (MEL_*) -> MessageHeader + Organization\n- Fall (FAL_*) -> Encounter\n- PatientenaufnahmeBrustimplantat (PAT_* + PAB_*) -> Patient + Observations\n- Operation (OPE_* + OBI_*) -> Procedure\n- Artikelidentifikation (ARI_* + ARB_* + ABI_*) -> Device\n- Zubehoer (ZUB_* + ZBI_*) -> Device\n- Entlassung (ENT_* + DBI_*) -> Encounter.hospitalization + Condition"
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung",
      "path" : "ireg-brustimplantat-meldung.meldung",
      "short" : "Meldung",
      "definition" : "Meldungskopf einer GEMeldung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.idEinrichtung",
      "path" : "ireg-brustimplantat-meldung.meldung.idEinrichtung",
      "short" : "MEL_IrdIdGesundheitseinrichtung",
      "definition" : "IRD-GE-Kennung (Format: IRD-GE-[0-9]{8})",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.standortId",
      "path" : "ireg-brustimplantat-meldung.meldung.standortId",
      "short" : "MEL_StandortId",
      "definition" : "Standort-ID",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.bsnr",
      "path" : "ireg-brustimplantat-meldung.meldung.bsnr",
      "short" : "MEL_Bsnr",
      "definition" : "Betriebsstaettennummer (BSNR)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.irdSpezVersion",
      "path" : "ireg-brustimplantat-meldung.meldung.irdSpezVersion",
      "short" : "MEL_IrdSpezVersion",
      "definition" : "Version der IRD-Spezifikation (Format: N.N.N)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.swName",
      "path" : "ireg-brustimplantat-meldung.meldung.swName",
      "short" : "MEL_SwName",
      "definition" : "Name der Software (max. 120 Zeichen)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.swHersteller",
      "path" : "ireg-brustimplantat-meldung.meldung.swHersteller",
      "short" : "MEL_SwHersteller",
      "definition" : "Name des Software-Herstellers (max. 120 Zeichen)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.meldung.swVersion",
      "path" : "ireg-brustimplantat-meldung.meldung.swVersion",
      "short" : "MEL_SwVersion",
      "definition" : "Version der Software (max. 120 Zeichen)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall",
      "path" : "ireg-brustimplantat-meldung.fall",
      "short" : "Fall",
      "definition" : "Behandlungsfall",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.aufnahmedatum",
      "path" : "ireg-brustimplantat-meldung.fall.aufnahmedatum",
      "short" : "FAL_Aufnahmedatum",
      "definition" : "Aufnahmedatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.artAufenthaltSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.artAufenthaltSchluessel",
      "short" : "FAL_ArtAufenthaltSchluessel",
      "definition" : "Art des Aufenthalts (enum_0065)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.transfernummer",
      "path" : "ireg-brustimplantat-meldung.fall.transfernummer",
      "short" : "FAL_Transfernummer",
      "definition" : "Transfernummer der Vertrauensstelle (64-stellig, [a-z0-9]{64})",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.datumZeitSatzErstellung",
      "path" : "ireg-brustimplantat-meldung.fall.datumZeitSatzErstellung",
      "short" : "FAL_DatumZeitSatzErstellung",
      "definition" : "Zeitstempel der Datensatzerstellung",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.versionsnummer",
      "path" : "ireg-brustimplantat-meldung.fall.versionsnummer",
      "short" : "FAL_Versionsnummer",
      "definition" : "Versionsnummer des Datensatzes (max. 10 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.ausloeser",
      "path" : "ireg-brustimplantat-meldung.fall.ausloeser",
      "short" : "Ausloeser",
      "definition" : "Ausloesende OPS-Prozedur",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.ausloeser.prozedurenSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.ausloeser.prozedurenSchluessel",
      "short" : "ALR_ProzedurenSchluessel",
      "definition" : "OPS-Kode, z.B. 5-870.a1",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme",
      "short" : "Patientenaufnahme",
      "definition" : "Demografische und klinische Patientendaten bei Aufnahme",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.alter",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.alter",
      "short" : "PAT_Alter",
      "definition" : "Alter in Jahren",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.groesse",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.groesse",
      "short" : "PAT_Groesse",
      "definition" : "Koerpergroesse in cm",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.gewicht",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.gewicht",
      "short" : "PAT_Gewicht",
      "definition" : "Koerpergewicht in kg",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.geschlechtSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.geschlechtSchluessel",
      "short" : "PAT_GeschlechtSchluessel",
      "definition" : "Geschlecht (enum_0070)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat",
      "short" : "PatientenaufnahmeBrustimplantat",
      "definition" : "Brustimplantat-spezifische Patientendaten bei Aufnahme",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat.autoimmunerkrankungSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat.autoimmunerkrankungSchluessel",
      "short" : "PAB_AutoimmunerkrankungSchluessel",
      "definition" : "Autoimmunerkrankung (enum_0122)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat.verlaufAutoimmunerkrankungSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat.verlaufAutoimmunerkrankungSchluessel",
      "short" : "PAB_VerlaufAutoimmunerkrankungSchluessel",
      "definition" : "Verlauf der Autoimmunerkrankung seit Implantation (enum_0123)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat.geschlechtGeburtSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.patientenaufnahme.brustimplantat.geschlechtGeburtSchluessel",
      "short" : "PAB_GeschlechtGeburtSchluessel",
      "definition" : "Biologisches Geschlecht bei Geburt (enum_0170)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation",
      "path" : "ireg-brustimplantat-meldung.fall.operation",
      "short" : "Operation",
      "definition" : "Operativer Eingriff",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.laufendeNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.laufendeNummer",
      "short" : "OPE_LaufendeNummer",
      "definition" : "Sequenznummer der Operation (1-999)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.datum",
      "path" : "ireg-brustimplantat-meldung.fall.operation.datum",
      "short" : "OPE_Datum",
      "definition" : "Operationsdatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.seitenLokalisationSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.seitenLokalisationSchluessel",
      "short" : "OPE_SeitenLokalisationSchluessel",
      "definition" : "Seitenlokalisation (enum_0050)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.asaSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.asaSchluessel",
      "short" : "OPE_AsaSchluessel",
      "definition" : "ASA-Klassifikation (enum_0044)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.implantattypSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.implantattypSchluessel",
      "short" : "OPE_ImplantattypSchluessel",
      "definition" : "Implantattyp (enum_0080)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat",
      "short" : "OperationBrustimplantat",
      "definition" : "Brustimplantat-spezifische Angaben zum Eingriff",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.artEingriffSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.artEingriffSchluessel",
      "short" : "OBI_ArtEingriffSchluessel",
      "definition" : "Art des Eingriffs (enum_0100)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.grundPrimaerEingriffSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.grundPrimaerEingriffSchluessel",
      "short" : "OBI_GrundPrimaerEingriffSchluessel",
      "definition" : "Grund des Primaereingriffs (enum_0102)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.grundAustauschSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.grundAustauschSchluessel",
      "short" : "OBI_GrundAustauschSchluessel",
      "definition" : "Grund der Revision/Austausch (enum_0104)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.grundRevisionExplantationSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.grundRevisionExplantationSchluessel",
      "short" : "OBI_GrundRevisionExplantationSchluessel",
      "definition" : "Grund der Explantation (enum_0106)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.lageSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.lageSchluessel",
      "short" : "OBI_LageSchluessel",
      "definition" : "Lage des neuen Implantats (enum_0112)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.zugangSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.zugangSchluessel",
      "short" : "OBI_ZugangSchluessel",
      "definition" : "Operationszugang (enum_0118)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.entfernungAdmNetzSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.entfernungAdmNetzSchluessel",
      "short" : "OBI_EntfernungAdmNetzSchluessel",
      "definition" : "Entfernung des ADM/Netzes (enum_0114)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.verfahrenswechselSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.verfahrenswechselSchluessel",
      "short" : "OBI_VerfahrenswechselSchluessel",
      "definition" : "Verfahrenswechsel (enum_0111)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.vorbehandlung",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.vorbehandlung",
      "short" : "VorbehandlungBrustimplantat",
      "definition" : "Brustimplantat-spezifische Vorbehandlung",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.vorbehandlung.behandlungLokalSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.vorbehandlung.behandlungLokalSchluessel",
      "short" : "VBI_BehandlungLokalSchluessel",
      "definition" : "Lokale Vorbehandlung (enum_0110)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.vorbehandlung.behandlungSystemischSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.vorbehandlung.behandlungSystemischSchluessel",
      "short" : "VBI_BehandlungSystemischSchluessel",
      "definition" : "Systemische Vorbehandlung (enum_0113)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.massnahme",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.massnahme",
      "short" : "MassnahmeBrustimplantat",
      "definition" : "Brustimplantat-spezifische Massnahme",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.massnahme.massnahmeSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.massnahme.massnahmeSchluessel",
      "short" : "MAB_MassnahmeSchluessel",
      "definition" : "Operationsmassnahme (enum_0116)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail",
      "short" : "OperationsdetailBrustimplantat",
      "definition" : "Brustimplantat-spezifische Operationsdetails",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail.operationsdetailPrimaerEingriffSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail.operationsdetailPrimaerEingriffSchluessel",
      "short" : "ODB_OperationsdetailPrimaerEingriffSchluessel",
      "definition" : "Operationsdetail Primaereingriff (enum_0103)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail.operationsdetailAustauschSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail.operationsdetailAustauschSchluessel",
      "short" : "ODB_OperationsdetailAustauschSchluessel",
      "definition" : "Operationsdetail Austausch (enum_0105)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail.operationsdetailRevisionSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.operationsdetail.operationsdetailRevisionSchluessel",
      "short" : "ODB_OperationsdetailRevisionSchluessel",
      "definition" : "Operationsdetail Revision (enum_0107)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.befund",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.befund",
      "short" : "BefundBrustimplantat",
      "definition" : "Befund bei Revision/Explantation",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.befund.befundSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.befund.befundSchluessel",
      "short" : "BEB_BefundSchluessel",
      "definition" : "Befund bei Revision/Explantation (enum_0121)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.befund.befundAustauschSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.befund.befundAustauschSchluessel",
      "short" : "BEB_BefundAustauschSchluessel",
      "definition" : "Befund bei Austausch Expander gegen Implantat (enum_0120)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.prozedurenSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.prozedurenSchluessel",
      "short" : "ProzedurenSchluesselBrustimplantat",
      "definition" : "OPS-Kodes fuer den Brustimplantat-Eingriff",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.prozedurenSchluessel.opsKode",
      "path" : "ireg-brustimplantat-meldung.fall.operation.operationBrustimplantat.prozedurenSchluessel.opsKode",
      "short" : "PBI_ProzedurenSchluessel",
      "definition" : "OPS-Kode",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation",
      "short" : "Artikelidentifikation",
      "definition" : "Implantierter/explantierter Artikel",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.laufendeNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.laufendeNummer",
      "short" : "ARI_LaufendeNummer",
      "definition" : "Sequenznummer des Artikels (1-999)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.irdNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.irdNummer",
      "short" : "ARI_IrdNummer",
      "definition" : "IRD-Artikelnummer aus der Produktdatenbank (max. 16 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelkennzeichen",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelkennzeichen",
      "short" : "ARI_Artikelkennzeichen",
      "definition" : "UDI oder herstellerspezifische REF/Katalognummer (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelkennzeichenUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelkennzeichenUnbekannt",
      "short" : "ARI_ArtikelkennzeichenUnbekannt",
      "definition" : "Artikelkennzeichen ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.kennzeichenTypSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.kennzeichenTypSchluessel",
      "short" : "ARI_KennzeichenTypSchluessel",
      "definition" : "Typ des Artikelkennzeichens: UDI oder REF (enum_0068)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.sonderstatusJNSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.sonderstatusJNSchluessel",
      "short" : "ARI_SonderstatusJNSchluessel",
      "definition" : "Sonderzulassung / Spezialanfertigung (enum_0060)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelArtSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelArtSchluessel",
      "short" : "ARI_ArtikelArtSchluessel",
      "definition" : "Implantat/Explantat (enum_0067)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelArtFunktionSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelArtFunktionSchluessel",
      "short" : "ARI_ArtikelArtFunktionSchluessel",
      "definition" : "Implantat/Explantat Funktion (enum_0071)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung",
      "short" : "Artikelbeschreibung",
      "definition" : "Beschreibende Daten zum Artikel",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.lotNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.lotNummer",
      "short" : "ARB_LotNummer",
      "definition" : "Chargen-/LOT-Nummer (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.lotNummerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.lotNummerUnbekannt",
      "short" : "ARB_LotNummerUnbekannt",
      "definition" : "Chargen-/LOT-Nummer ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.serienNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.serienNummer",
      "short" : "ARB_SerienNummer",
      "definition" : "Seriennummer (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.serienNummerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.serienNummerUnbekannt",
      "short" : "ARB_SerienNummerUnbekannt",
      "definition" : "Seriennummer ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumVerfall",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumVerfall",
      "short" : "ARB_DatumVerfall",
      "definition" : "Verfalldatum (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumVerfallUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumVerfallUnbekannt",
      "short" : "ARB_DatumVerfallUnbekannt",
      "definition" : "Verfalldatum ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelbezeichnung",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelbezeichnung",
      "short" : "ARB_Artikelbezeichnung",
      "definition" : "Artikelbezeichnung (max. 250 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.barcode",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.barcode",
      "short" : "ARB_Barcode",
      "definition" : "Barcode (max. 250 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumImplantierungExplantat",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumImplantierungExplantat",
      "short" : "ARB_DatumImplantierungExplantat",
      "definition" : "Datum der Implantation des vorherigen Implantats (Format: JJJJ[-MM[-TT]])",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumImplantierungExplantatUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.datumImplantierungExplantatUnbekannt",
      "short" : "ARB_DatumImplantierungExplantatUnbekannt",
      "definition" : "Implantationsdatum des vorherigen Implantats unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat",
      "short" : "ArtikelBrustimplantat",
      "definition" : "Brustimplantat-spezifische Artikeleigenschaften",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.herstellerSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.herstellerSchluessel",
      "short" : "ABI_HerstellerSchluessel",
      "definition" : "Hersteller (7-stelliger Katalogkode)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.herstellerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.herstellerUnbekannt",
      "short" : "ABI_HerstellerUnbekannt",
      "definition" : "Hersteller ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.herstellerSonstiger",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.herstellerSonstiger",
      "short" : "ABI_HerstellerSonstiger",
      "definition" : "Sonstiger Hersteller Freitext (max. 250 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.artikelTypSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.artikelTypSchluessel",
      "short" : "ABI_ArtikelTypSchluessel",
      "definition" : "Artikeltyp (enum_0190)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.formSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.formSchluessel",
      "short" : "ABI_FormSchluessel",
      "definition" : "Form des Implantats (enum_0126)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.formUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.formUnbekannt",
      "short" : "ABI_FormUnbekannt",
      "definition" : "Form ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.oberflaecheSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.oberflaecheSchluessel",
      "short" : "ABI_OberflaecheSchluessel",
      "definition" : "Oberflaeche des Implantats (enum_0128)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.oberflaecheUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.oberflaecheUnbekannt",
      "short" : "ABI_OberflaecheUnbekannt",
      "definition" : "Oberflaeche ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.fuellungSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.fuellungSchluessel",
      "short" : "ABI_FuellungSchluessel",
      "definition" : "Fuellung des Implantats (enum_0124)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.fuellungUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.fuellungUnbekannt",
      "short" : "ABI_FuellungUnbekannt",
      "definition" : "Fuellung ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.volumen",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.volumen",
      "short" : "ABI_Volumen",
      "definition" : "Volumen in ml (1-99999)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.volumenUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.volumenUnbekannt",
      "short" : "ABI_VolumenUnbekannt",
      "definition" : "Volumen ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.intraoperativesVolumen",
      "path" : "ireg-brustimplantat-meldung.fall.operation.artikelidentifikation.artikelbeschreibung.artikelBrustimplantat.intraoperativesVolumen",
      "short" : "ABI_IntraoperativesVolumen",
      "definition" : "Intraoperatives Volumen in ml (0-99999)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer",
      "short" : "Zubehoer",
      "definition" : "Zubehoer (ADM/Netz) zum Eingriff",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.laufendeNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.laufendeNummer",
      "short" : "ZUB_LaufendeNummer",
      "definition" : "Sequenznummer des Zubehoers (1-999)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "positiveInt"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerArtSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerArtSchluessel",
      "short" : "ZUB_ZubehoerArtSchluessel",
      "definition" : "Implantat/Explantat (enum_0069)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.artikelNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.artikelNummer",
      "short" : "ZUB_ArtikelNummer",
      "definition" : "Artikelnummer (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.artikelNummerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.artikelNummerUnbekannt",
      "short" : "ZUB_ArtikelNummerUnbekannt",
      "definition" : "Artikelnummer ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.lotNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.lotNummer",
      "short" : "ZUB_LotNummer",
      "definition" : "Chargen-/LOT-Nummer (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.lotNummerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.lotNummerUnbekannt",
      "short" : "ZUB_LotNummerUnbekannt",
      "definition" : "Chargen-/LOT-Nummer ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.serienNummer",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.serienNummer",
      "short" : "ZUB_SerienNummer",
      "definition" : "Seriennummer (max. 20 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.serienNummerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.serienNummerUnbekannt",
      "short" : "ZUB_SerienNummerUnbekannt",
      "definition" : "Seriennummer ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.artikelbezeichnung",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.artikelbezeichnung",
      "short" : "ZUB_Artikelbezeichnung",
      "definition" : "Artikelbezeichnung (max. 250 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat",
      "short" : "ZubehoerBrustimplantat",
      "definition" : "Brustimplantat-spezifische Zubehoerdaten",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.herstellerSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.herstellerSchluessel",
      "short" : "ZBI_HerstellerSchluessel",
      "definition" : "Hersteller (enum_0131)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.herstellerUnbekannt",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.herstellerUnbekannt",
      "short" : "ZBI_HerstellerUnbekannt",
      "definition" : "Hersteller ist unbekannt (Wert 1)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.herstellerSonstiger",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.herstellerSonstiger",
      "short" : "ZBI_HerstellerSonstiger",
      "definition" : "Sonstiger Hersteller Freitext (max. 250 Zeichen)",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.zubehoerTypSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.operation.zubehoer.zubehoerBrustimplantat.zubehoerTypSchluessel",
      "short" : "ZBI_ZubehoerTypSchluessel",
      "definition" : "Zubehoertyp (enum_0191)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.entlassung",
      "path" : "ireg-brustimplantat-meldung.fall.entlassung",
      "short" : "Entlassung",
      "definition" : "Entlassungsdaten",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.entlassung.datum",
      "path" : "ireg-brustimplantat-meldung.fall.entlassung.datum",
      "short" : "ENT_Datum",
      "definition" : "Entlassungsdatum",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.entlassung.grundSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.entlassung.grundSchluessel",
      "short" : "ENT_GrundSchluessel",
      "definition" : "Entlassungs-/Verlegungsgrund (2-stellig, [0-9]{2})",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.entlassung.diagnoseBrustimplantat",
      "path" : "ireg-brustimplantat-meldung.fall.entlassung.diagnoseBrustimplantat",
      "short" : "DiagnoseBrustimplantat",
      "definition" : "Brustimplantat-spezifische Entlassungsdiagnose (ICD-10-GM)",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "BackboneElement"
      }]
    },
    {
      "id" : "ireg-brustimplantat-meldung.fall.entlassung.diagnoseBrustimplantat.icdSchluessel",
      "path" : "ireg-brustimplantat-meldung.fall.entlassung.diagnoseBrustimplantat.icdSchluessel",
      "short" : "DBI_IcdSchluessel",
      "definition" : "ICD-10-GM Kode (Format: [a-zA-Z][0-9]{2}(.[0-9]{1,2})?(:[RLB])?)",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
