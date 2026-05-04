# IQTIG QS (18.1 Mammachirurgie) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Meldewege**](anwendungsfaelle-meldedatensaetze.md)
* **IQTIG QS (18.1 Mammachirurgie)**

## IQTIG QS (18.1 Mammachirurgie)

# IQTIG-QS-Transformation (QS-Verfahren 18.1 Mammachirurgie)

### Überblick

Zertifizierte Brustzentren und Krankenhaeuser mit mammachirurgischer Leistung unterliegen der externen stationaeren Qualitätssicherung nach SGB V Paragraph 136. Der für das Thema relevante Leistungsbereich ist **QS-Verfahren 18.1 Mammachirurgie** des IQTIG (Institut für Qualitätssicherung und Transparenz im Gesundheitswesen). Diese Transformation erzeugt **IQTIG-konforme QS-Datensätze aus klinischen FHIR-Daten**, die auf den Senologie-Profilen dieses IGs basieren.

* **Qüllformat**: FHIR Bundle mit Senologie-Profilen (dieser IG)
* **Zielformat**: IQTIG QS-Datensatz 18.1 Mammachirurgie, **Spezifikation 2024 V05**
* **Methode**: FHIR StructureMaps (FML) mit IQTIG Logical Model als Zielstruktur
* **Ausführung**: [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke
* **Scope**: **Nur QS-Verfahren 18.1 Mammachirurgie** – nicht 18.2 (Ovar), nicht weitere IQTIG-Leistungsbereiche

### Architektur

Die Transformation folgt dem gleichen Muster wie die [oBDS-](meldung-obds.md) und [IRegG-Transformation](meldung-ireg.md): FHIR-Ressourcen werden über StructureMaps auf ein Logical Model abgebildet, das anschliessend serialisiert werden kann (CSV/XML gemaess IQTIG-Datenprüfprogramm).

```
┌─────────────────────────────┐
│  FHIR Bundle                │
│  (Senologie-Profile)        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  StructureMap (FML)         │
│  Orchestrator + Teil-Maps   │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  IQTIG Logical Model        │
│  (IQTIG_MaChi_181)          │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → IQTIG QS-Datensatz       │
│    (CSV/XML 2024 V05)       │
└─────────────────────────────┘

```

Der IQTIG-Datensatz besteht aus drei Teildatensätzen:

* **Teildatensatz Basis (B)** – administrative und demografische Falldaten
* **Teildatensatz Brust (BRUST)** – brustspezifische Diagnose- und Befunddaten (ein Eintrag je behandelter Seite)
* **Teildatensatz Operation (O)** – Operationsdaten, Histologie, R-Status (ein Eintrag je Eingriff)

### StructureMap-Übersicht

| | | | |
| :--- | :--- | :--- | :--- |
| **SenologieToIqtigMammachirurgie181** | Orchestrator: dispatcht an Teil-Maps | Bundle (alle Profile) | IQTIGMammachirurgie181 |
| **SenologieToIqtigBasis** | Patient + Encounter + Organization | Patient, Encounter, Organization | teildatensatzBasis (B:*) |
| **SenologieToIqtigBrust** | Diagnose + Bildgebung + Präopbefund | Condition, Observation, ServiceRequest | teildatensatzBrust (BRUST:*) |
| **SenologieToIqtigOperation** | OP + Specimen + Pathologie | Procedure, Specimen, Observation | teildatensatzOperation (O:*) |

### Mapping-Tabellen

#### Teildatensatz Basis (B)

| | | |
| :--- | :--- | :--- |
| B:IKNRKH | Organization.identifier (arge-ik/iknr) | Institutionskennzeichen 9-stellig |
| B:ENTLSTANDORT | Organization.identifier (standortnummer) | Standortkennung |
| B:BSNR | Organization.identifier (kbv/bsnr) | Betriebsstättennummer (ambulant) |
| B:VERSICHERTENIDNEU | Patient.identifier (gkv/kvid-10) | Versicherten-ID (pseudonymisiert) |
| B:VORGANGSNR | Encounter.identifier | Fall-/Vorgangsnummer |
| B:DS_VERSION | fest: 18.1_2024_V05 | Datensatzversion |
| B:GEBDATUM | Patient.birthDate | Geburtsdatum |
| B:GESCHLECHT | Patient.gender | male=1, female=2, other=8, unknown=9 |
| B:PLZ | Patient.address.postalCode | Postleitzahl |
| B:AUFNDATUM | Encounter.period.start | Aufnahmedatum |
| B:ENTLDATUM | Encounter.period.end | Entlassungsdatum |
| B:AUFNGRUND | Encounter.extension (Aufnahmegrund) | Paragraph 301 SGB V (4-stellig) |
| B:AUFNANLASS | Encounter.extension (ISiKAufnahmeanlass) | Einweisung, Notfall, Verlegung |
| B:ENTLGRUND | Encounter.hospitalization.dischargeDisposition | Paragraph 301 SGB V |

#### Teildatensatz Brust (BRUST)

| | | |
| :--- | :--- | :--- |
| BRUST:LNRBRUST | Senologie_Diagnose (Reihenfolge) | laufende Nummer 1..n |
| BRUST:SEITE | Condition.bodySite (SNOMED) | R=rechts, L=links, B=beidseits |
| BRUST:INDIKATION | Condition.code (ICD-10-GM) | C50.* =1 maligne, D05.* =2 DCIS, D24.* =3 benigne, Z40.* =4 Risikoreduktion, Z42.* =5 Rekonstruktion |
| BRUST:DIAGICD | Condition.code.coding (ICD-10-GM) | Code + Version |
| BRUST:DIAGDATUM | Condition.onsetDateTime | Diagnosedatum |
| BRUST:TGROESSEKLIN | Observation (LOINC 44648-0) | Tumorgroesse klinisch in mm |
| BRUST:CT / CN / CM | Observations (LOINC 21905-5 / 21906-3 / 21907-1) | klinisches cTNM |
| BRUST:UICCKLIN | Observation (LOINC 21902-2) | klinisches UICC-Stadium |
| BRUST:BILDGMETHODE | Senologie_Bildgebung.method (SNOMED) | Mammografie=1, Sono=2, MRT=3, Tomo=4 |
| BRUST:BIRADS | Observation (LOINC 72133-2) | BI-RADS 0-6 |
| BRUST:BEFUND | Senologie_Pathologie_Befund (B1-B5) | Präoperativer B-Kode |
| BRUST:HISTPRAEOP | Procedure (Biopsie-OPS) | Präoperative histologische Sicherung |
| BRUST:DRAHT | Senologie_OP_Planung (preOpMarkierung) | M/S/T/N -> 1/2/3/0 |
| BRUST:NEOADJ | Senologie_Systemtherapie_Procedure (stellungOP=N) | Neoadjuvante Therapie erhalten |
| BRUST:TKPRAEOP | Senologie_Tumorboard_Empfehlung (Typ präth) | Prätherapeutische Tumorkonferenz |

#### Teildatensatz Operation (O)

| | | |
| :--- | :--- | :--- |
| O:LNROP | Procedure (Reihenfolge) | laufende OP-Nummer |
| O:LNRBRUST | Procedure -> Condition (reasonReference) | Zuordnung zum Brust-Teildatensatz |
| O:OPDATUM | Procedure.performedDateTime | Operationsdatum |
| O:SEITE | Procedure.bodySite (SNOMED) | R/L/B |
| O:OPSCHLUESSEL | Procedure.code.coding (OPS) | OPS-Kodes + Version |
| O:OPART | Procedure.category oder OPS-Ableitung | BET=1, Mast einfach=2, SSM=3, NSM=4, Revision=5, Wiederaufbau=6 |
| O:DIGNITAET | Observation (Schnellschnitt, LOINC 22748-9) | maligne=1, benigne=2, unklar=3 |
| O:SCHNELLSCHNITT | Specimen.processing (SNOMED 123038009) | 0/1 |
| O:PRAEPKONTROLLE | Specimen.processing.procedure (SNOMED) | QI-3: Mammo=1, Sono=2 |
| O:HISTMORPH | Observation (LOINC 59847-4, ICD-O-3) | Morphologie-Code + Version |
| O:GRADING | Observation (LOINC 33732-9) | G1-G4, GX |
| O:TGROESSEINV | Observation (LOINC 33728-7) | invasiv in mm |
| O:TGROESSEDCIS | Observation (LOINC 44648-0) | DCIS in mm |
| O:MULTIFOK | Observation (LOINC 44638-1) | 0=nein, 1=multifokal, 2=multizentrisch |
| O:PT / O:PN / O:PM | Observations (LOINC 21899-0 / 21900-6 / 21901-4) | pathologisches pTNM |
| O:UICCPATHO | Observation (LOINC 21902-2, postop) | pathologisches UICC-Stadium |
| O:RSTATUSLOK / O:RSTATUSGES | Procedure.outcome (SNOMED R0-RX) | Residualstatus |
| O:SENTINEL | Procedure.code (OPS 5-401.1*) | 0/1 |
| O:AXDISSEKTION | Procedure.code (OPS 5-402*) | 0/1 |
| O:LKUNTERSUCHT / LKBEFALLEN | Observations (LOINC 21894-1 / 21893-3) | Lymphknoten |
| O:SLKUNTERSUCHT / SLKBEFALLEN | Observations (LOINC 92832-5 / 92833-3) | Sentinel-LK |
| O:ERSTATUS / PRSTATUS / HER2STATUS | MII-Onko-Observations (LOINC 85337-4 / 85339-0 / 85319-2) | P/N/U |
| O:KOMPL | Senologie_Operative_Komplikation | Kürzel + ICD |
| O:REVISION | Procedure (Revisionsart oder Seqünz) | 0/1 |

### Code-Übersetzung

Die IQTIG-Datensätze verwenden eigene Schluessel (numerische Kodierungen, Buchstabenkürzel). Die Übersetzung erfolgt innerhalb der StructureMaps:

| | | | |
| :--- | :--- | :--- | :--- |
| Geschlecht | Patient.gender | 1/2/8/9 | Direkte Zuordnung in FML |
| Seitenlokalisation | SNOMED CT (24028007/7771000/51440002) | R/L/B | Direkte Zuordnung in FML |
| Indikation | ICD-10-GM Prefix (C50/D05/D24/Z40/Z42) | 1/2/3/4/5 | Prefix-basierte Ableitung |
| Operationsart | OPS Prefix (5-870/871/872/883/885) | 1/2/3/4/6 | Prefix-basierte Ableitung |
| ER/PR/HER2-Status | SNOMED (10828004/260385009/261665006) | P/N/U | Identisch zum oBDS-Mapping |
| Residualstatus | SNOMED (122538001 etc.) | R0/R1/R2/RX | Direkte Zuordnung in FML |
| Bildgebende Methode | SNOMED (71651007/16310003/113091000) | 1/2/3/4 | Direkte Zuordnung in FML |

### Datenverfuegbarkeit und offene Luecken

Nicht alle IQTIG-Pflichtfelder koennen aus den Senologie-Profilen abgeleitet werden. Für eine vollständige QS-Meldung muessen zusätzliche Datenqüllen eingebunden werden (KIS, Verwaltung, Vertraünsstelle).

| | | |
| :--- | :--- | :--- |
| OP-Datum, OPS-Codes, Seitenlokalisation | Senologie_Operation / _BrustOP | Vorhanden |
| ICD-10-GM Diagnose + Datum | Senologie_Diagnose_Maligne / _Benigne | Vorhanden |
| Histologie (ICD-O-3), Grading | Senologie_Pathologie_Befund | Vorhanden |
| Tumorgroesse invasiv / DCIS | Senologie_Pathologie_Befund (LOINC 33728-7) | Vorhanden |
| Residualstatus R0/R1/R2 | Senologie_Operation.outcome | Vorhanden |
| Lymphknotenstatus (regionaer + Sentinel) | Senologie_Pathologie_Befund | Vorhanden |
| Rezeptorstatus ER/PR/HER2 | MII-Onko-Observations | Vorhanden |
| Präoperative Drahtmarkierung | Senologie_OP_Planung (Extension preOpMarkierung) | Vorhanden |
| Intraoperative Praeparatkontrolle (QI-3) | Specimen.processing | Vorhanden |
| BI-RADS / bildgebende Methode | Senologie_Bildgebung_Observation / _Befund | Vorhanden |
| Präoperative B-Klassifikation (B1-B5) | Senologie_Pathologie_Befund | **Teilweise**– eigenes CodeSystem noch nicht finalisiert |
| Multifokalität / Multizentrität | Pathologie-Befund | **Teilweise**– freitextlich, benoetigt codierte Observation |
| Neoadjuvante Therapie (ja/nein) | Senologie_Systemtherapie_Procedure (stellungOP=N) | **Teilweise**– ableitbar, aber IQTIG-Binding fehlt |
| Prätherapeutische Tumorkonferenz | Senologie_Tumorboard_Empfehlung | **Teilweise**– Typ=prätherapeutisch muss kodiert werden |
| IKNR, Standortkennung, BSNR | Organization (KIS/Stammdaten) | **Externe Quelle**– nicht klinisch |
| Aufnahmegrund / Aufnahmeanlass (Paragraph 301) | Encounter (KIS/ISiK) | **Externe Quelle**– ISiK-Extension |
| Entlassungsgrund (Paragraph 301) | Encounter.hospitalization.dischargeDisposition | **Externe Quelle**– ISiK |
| Einwilligung Landesstelle/G-BA | Consent / KIS | **Externe Quelle**– administrative Erfassung |
| Versicherten-ID (pseudonymisiert) | Patient.identifier (kvid-10) | **Externe Quelle**– Pseudonymisierung durch Vertraünsstelle |
| Revisionsoperation im selben Aufenthalt | Procedure (Seqünz + Art) | **Teilweise**– aus OP-Reihenfolge ableitbar |
| Perioperative Komplikationen mit IQTIG-Kürzel | Senologie_Operative_Komplikation | **Teilweise**– IQTIG-Kürzel-Binding noch zu ergänzen |

#### Handlungsoptionen

Analog zur IRegG-Transformation:

1. **Senologie-Profile erweitern** – B-Klassifikation als eigenes CodeSystem, Multifokalität als codierte Observation, Neoadjuvanz-Flag am Procedure-Profil.
1. **Eigener IQTIG-Erfassungsbogen (SDC Questionnaire)** – Die administrativen Felder (Aufnahmeanlass, Einwilligung, Paragraph 301-Codes) werden über einen QS-spezifischen Fragebogen erfasst und ergänzen die klinische Dokumentation.
1. **ETL-Strecke** – IKNR, Standort, Fallkennungen, Paragraph 301-Codes und pseudonymisierte Versicherten-ID werden aus KIS und Vertraünsstelle nachgezogen und mit den Senologie-Daten zu einer vollständigen QS-Meldung kombiniert.

**Empfehlung**: Kombination aus Option 1 (klinische Profil-Erweiterungen) und Option 3 (ETL für administrative Daten). Der QS-Datensatz 18.1 enthaelt ein hoeheres Mass an administrativen Pflichtfeldern als der oBDS, daher ist die ETL-Integration hier besonders wichtig.

### IQTIG-Spezifikation

Die Transformation basiert auf den **Ausfüllhinweisen des IQTIG für QS-Verfahren 18.1 Mammachirurgie**:

* **Spezifikation**: 2024 V05 (Erfassungsjahr 2024)
* **Logical Model**: [IQTIGMammachirurgie181](StructureDefinition-iqtig-mammachirurgie-181.md) – bildet die Teildatensatz-Struktur als FHIR-StructureDefinition ab
* **Offizielle Quelle**: [iqtig.org/downloads/erfassung/2024/v05/181/Ausfüllhinweise_18_1.html](https://iqtig.org/downloads/erfassung/2024/v05/181/Ausfüllhinweise_18_1.html)
* **Scope**: Nur Leistungsbereich 18.1 Mammachirurgie (nicht 18.2 Ovarialkarzinom, nicht weitere IQTIG-Bereiche)

> **Hinweis**: Die IQTIG-Spezifikation wird jaehrlich aktualisiert. Die hier abgebildete Struktur entspricht der Spezifikation 2024 V05. Bei Aktualisierung der Spezifikation sind das Logical Model und die StructureMaps entsprechend zu versionieren.

### Abgrenzung zu oBDS und IRegG

Die drei Meldeformate decken unterschiedliche regulatorische Zwecke ab und enthalten überlappende, aber nicht identische Datenpunkte:

| | | | |
| :--- | :--- | :--- | :--- |
| **oBDS** | Krebsregistermeldung | Klinisches Krebsregister | Pro klinisches Ereignis (Diagnose, Therapie, Verlauf, Tod) |
| **IRegG** | Implantatregistermeldung | BfArM / Implantateregister | Pro Implantationseingriff |
| **IQTIG 18.1** | Externe Qualitätssicherung (SGB V Paragraph 136) | IQTIG / G-BA | Pro Behandlungsfall Mammachirurgie |

Die Senologie-FHIR-Profile bilden die gemeinsame klinische Datenbasis; die drei Transformations-Pipelines (StructureMaps) ziehen daraus jeweils die für das Zielformat erforderlichen Felder.

### Ausführung

Die Transformation wird analog zur oBDS- und IRegG-Transformation über [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke ausgeführt.

**Transformation:**

```
POST http://localhost:8080/fhir/StructureMap/$transform
Content-Type: application/fhir+json

{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "source",
      "resource": { /* FHIR Bundle mit Senologie-Ressourcen */ }
    },
    {
      "name": "source",
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToIqtigMammachirurgie181"
    }
  ]
}

```

Das Ergebnis ist eine Instanz des IQTIG Logical Models, die über das IQTIG-Datenprüfprogramm (DPP) in das offizielle QS-Format (CSV/XML) exportiert und an die Bundesauswertungsstelle (IQTIG) übermittelt werden kann.

