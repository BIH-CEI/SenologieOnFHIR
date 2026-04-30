# OncoBox-Brust-Transformation (OnkoZert / DKG-Brustzentrum-Zertifizierung)

### Ueberblick

Zertifizierte Brustzentren uebermitteln jaehrlich ihre Fall- und Qualitaetsindikatordaten in Form einer **OncoBox-Brust-XML-Meldung** an [OnkoZert](https://xml-oncobox.de/de/Zentren/BrustZentren), die Zertifizierungsstelle der Deutschen Krebsgesellschaft (DKG). Diese Transformation erzeugt **OncoBox-Brust-konforme Meldungen aus klinischen FHIR-Daten**, die auf den Senologie-Profilen dieses IGs basieren.

- **Quellformat**: FHIR Bundle mit Senologie-Profilen (dieser IG)
- **Zielformat**: OncoBox Brust, Spezifikation **N1.1.1**
- **Methode**: FHIR StructureMaps (FML) mit OncoBox Logical Model als Zielstruktur
- **Ausfuehrung**: [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke
- **Scope**: **Nur OncoBox Brust N1.1.1** -- nicht OncoBox 2.0, nicht OncoBox Darm/Prostata/Lunge

### Architektur

Die Transformation folgt dem gleichen Muster wie die [oBDS-](meldung-obds.html), [IRegG-](meldung-ireg.html) und [IQTIG-Transformation](meldung-iqtig.html): FHIR-Ressourcen werden ueber StructureMaps auf ein Logical Model abgebildet, das anschliessend als XML serialisiert wird (OncoBox-Exportformat).

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
│  OncoBox Logical Model      │
│  (OncoBoxBrustMeldung)      │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → OncoBox XML (N1.1.1)     │
└─────────────────────────────┘
```

Die OncoBox-Brust-Meldung besteht aus:

- **Zentrum**  -- OnkoZert-Zentrumskennung, Berichtszeitraum
- **Primaerfall** (1..*) -- ein Eintrag je Patientin/Fall mit Diagnose, Therapie, Verlauf
- **Kennzahlen KB-1 bis KB-20** -- aggregierte DKG-Qualitaetsindikatoren (Zaehler/Nenner)

### StructureMap-Uebersicht

| StructureMap | Aufgabe | Quell-Profile | Ziel (Logical Model) |
|---|---|---|---|
| **SenologieToOncoBoxBrust** | Orchestrator: dispatcht an Teil-Maps | Bundle (alle Profile) | OncoBoxBrustMeldung |
| **SenologieToOncoBoxBrustZentrum** | Organization + Metadaten | Organization | zentrum |
| **SenologieToOncoBoxBrustPrimaerfall** | Patient + Condition + Encounter + Diagnose-Block | Patient, Condition, Encounter, Observation, CarePlan, ResearchSubject | primaerfall |
| **SenologieToOncoBoxBrustOperation** | OP + Specimen + Pathologie | Procedure, Specimen, Observation | primaerfall.operation |
| **SenologieToOncoBoxBrustTherapie** | Systemtherapie + Strahlentherapie | Procedure (Senologie_Systemtherapie, _Strahlentherapie) | primaerfall.systemtherapie / .strahlentherapie |
| **SenologieToOncoBoxBrustKennzahlen** | Shell-Eintraege KB-1 bis KB-20 | Bundle (Aggregation) | kennzahl |

### Mapping-Tabellen

#### Zentrum (Meldungsmetadaten)

| OncoBox-Feld | FHIR-Quelle | Anmerkung |
|---|---|---|
| OncoBox_Version | fest: N1.1.1 | Spezifikationsversion |
| Zentrum_ID | Organization.identifier (onkozert-zentrum-id) | OnkoZert-Kennung; Fallback: IKNR |
| Zentrum_Name | Organization.name | Name des Brustzentrums |
| IKNR | Organization.identifier (arge-ik/iknr) | Institutionskennzeichen |
| Standort_ID | Organization.identifier (standortnummer) | Standort |
| Berichtszeitraum | Transformationsparameter | i.d.R. 01.07.Vorjahr -- 30.06.lfd.Jahr |
| Meldungsdatum | Bundle.timestamp | Zeitpunkt der Meldungserstellung |

#### Primaerfall -- Patient + Fall

| OncoBox-Feld | FHIR-Quelle | Anmerkung |
|---|---|---|
| Fall_ID | Condition.id | Pseudonymisiert |
| Patient_Pseudonym | Patient.id | Zentrumsinternes Pseudonym |
| Primaerfallart | Condition.code (ICD-10-GM Prefix) | C50=1, D05=2, Z40=7, Z42=8, D24=9 |
| Patient_Geburtsdatum | Patient.birthDate | |
| Patient_Geschlecht | Patient.gender | W/M/D/U |
| Patient_PLZ | Patient.address.postalCode | |
| Patient_Menopausenstatus | Observation (LOINC 86805-9) | 1=prae, 2=peri, 3=post |
| Fall_Typ | Encounter.class | 1=stat, 2=amb, 3=teilstat |
| Fall_Aufnahmedatum / Fall_Entlassungsdatum | Encounter.period | |

#### Primaerfall -- Diagnose

| OncoBox-Feld | FHIR-Quelle | Anmerkung |
|---|---|---|
| Diagnose_Datum | Condition.onsetDateTime | |
| Diagnose_ICD | Condition.code (ICD-10-GM) | Code + Version |
| Diagnose_Dignitaet | ICD-10-GM-Prefix | C50=1 maligne, D05=2 in-situ, D24=4 benigne |
| Diagnose_Seite | Condition.bodySite (SNOMED) | R/L/B |
| Diagnose_ICDO | Observation (LOINC 59847-4) | ICD-O-3 Morphologie |
| Diagnose_Grading | Observation (LOINC 33732-9) | G1-G4, GX |
| Bildgebung | Observation (Senologie_Bildgebung_Observation) | Methode, BI-RADS, Datum |
| cTNM | Observation (LOINC 21908-9 + Komponenten) | cT/cN/cM/UICC |
| pTNM | Observation (LOINC 21902-2 + Komponenten) | pT/pN/pM/L/V/Pn/UICC |
| Lymphknoten | Observations (LOINC 21894-1 / 21893-3 / 92832-5 / 92833-3) | untersucht/befallen + Sentinel |
| Rezeptorstatus ER/PR/HER2 | Observations (LOINC 85337-4 / 85339-0 / 85319-2) | P/N/U |

#### Primaerfall -- Operation

| OncoBox-Feld | FHIR-Quelle | Anmerkung |
|---|---|---|
| Op_Datum | Procedure.performed | |
| Op_Seite | Procedure.bodySite (SNOMED) | R/L/B |
| Op_OPS | Procedure.code.coding (OPS) | |
| Op_Art | Procedure.code (OPS-Prefix) | BET (5-870)=1, Mast einfach (5-871)=2, SSM (5-872)=3, NSM (5-883)=4, Rekon (5-885)=6, Axilla (5-402)=7, SLNB (5-401.1)=8 |
| Op_Drahtmarkierung | Senologie_OP_Planung.extension preOpMarkierung | N=0, S=1, M=2, T=3 |
| Op_Sentinel | OPS 5-401.1* | 0/1 |
| Op_Axdissektion | OPS 5-402* | 0/1 |
| Op_Schnellschnitt | Specimen.processing (SNOMED 123038009) | 0/1 |
| Op_Praeparatkontrolle | Specimen.processing.procedure (SNOMED) | Mammo=1, Sono=2 |
| Op_R_Lokal / Op_R_Gesamt | Procedure.outcome (SNOMED) | R0-RX |
| Op_Komplikation | Senologie_Operative_Komplikation | Kuerzel + ICD |

#### Primaerfall -- Therapie

| OncoBox-Feld | FHIR-Quelle | Anmerkung |
|---|---|---|
| Systemtherapie | Senologie_Systemtherapie_Procedure | Art, Stellung, Protokoll, Zeitraum |
| Syst_Trastuzumab | Procedure.note enthaelt "Trastuzumab" | KB-7-relevantes Flag |
| Syst_Stellung | Procedure.extension therapiestellung | N/A/P |
| Endokrine_Therapie | Senologie_Systemtherapie_Procedure (endokrin) | Tamoxifen, AI, GnRH |
| Strahlentherapie | Senologie_Strahlentherapie | Beginn/Ende, Zielgebiet, Stellung |
| Tumorkonferenz | CarePlan (Senologie_Tumorboard) | Typ: praetherapeutisch / postoperativ / Rezidiv |
| Psychoonkologie | Procedure / Observation | erfolgt 0/1 |
| Sozialdienst | Procedure / Observation | erfolgt 0/1 |
| Studienteilnahme | ResearchSubject | teilgenommen 0/1 |
| Stud_Name_Code (K02) | ResearchSubject.extension[StudiennameCode] | OncoBox 2.0: Studienname aus Auswahlliste |
| Stud_Screening (K03) | ResearchSubject.extension[Studienscreening] | OncoBox 2.0: Screening zur Studienteilnahme 0/1 |

### DKG-Kennzahlen (KB-1 bis KB-20)

Die OncoBox erwartet pro Kennzahl einen **Zaehler/Nenner-Block** gemaess DKG-Erhebungsbogen. Die 20 Kennzahlen sind in der Excel-Spezifikation (`OncoBoxBrust_N1.1.1_Spec.xlsx`) jeweils als eigenes Sheet KB-1 bis KB-20 definiert mit Einschlusskriterien fuer Nenner, Erfuellungskriterium fuer Zaehler und Sollwert.

| KB | Bezeichnung | FHIR-Datenquellen | Zaehler | Nenner | Sollwert |
|---|---|---|---|---|---|
| KB-1 | Postop. Fallbesprechung | CarePlan (Typ=postoperativ) | Postop. Tumorkonferenz vorhanden | Alle Primaerfaelle mit OP | >=95% |
| KB-2 | Praeth. Fallbesprechung | CarePlan (Typ=praetherapeutisch) | Praetherap. Tumorkonferenz vorhanden | Invasive Primaerfaelle | >=95% |
| KB-3 | Fallbespr. Rezidiv/Metas. | CarePlan (Typ=rezidiv) | Tumorkonferenz vorhanden | Rezidive + Metastasen | >=90% |
| KB-4 | Adj. Chemo (invasiv) | Senologie_Systemtherapie (adj. Chemo) | Adj. Chemo erhalten | Indizierte pT1c+N+/pT2+/Hochrisiko | >=80% |
| KB-5 | Adj. Chemo (DCIS) | -- | Bei DCIS keine Chemo | DCIS-Faelle | >=95% |
| KB-6 | Endokrine Therapie | Senologie_Systemtherapie (endokrin) | Endokrine Therapie erhalten | HR+ invasive Primaerfaelle | >=85% |
| KB-7 | Trastuzumab | Senologie_Systemtherapie (Trastuzumab) | Trastuzumab erhalten | HER2+ Primaerfaelle pT1c+ | >=95% |
| KB-8 | First-Line-Therapie | Senologie_Systemtherapie (palliativ, FirstLine) | First-Line eingeleitet | Primaer metastasierte Faelle | >=80% |
| KB-9 | Psychoonkologie | Procedure/Observation (Psychoonko) | Psychoonkol. Kontakt | Alle Primaerfaelle | >=80% |
| KB-10 | Sozialdienst | Procedure/Observation (Sozialdienst) | Sozialdienstkontakt | Alle Primaerfaelle | >=80% |
| KB-11 | Studien | ResearchSubject | In Studie eingeschrieben | Alle Primaerfaelle | >=5% |
| KB-12 | Histol. Sicherung | Biopsie-Procedure vor OP-Datum | Praeop. B-Biopsie vorhanden | Invasive Primaerfaelle | >=90% |
| KB-13 | Fallzahl | -- | Primaerfaelle + Rezidive + Metas. | Berichtszeitraum | >=100 Primaerfaelle |
| KB-14 | Eingriffe bis R0 | Anzahl OPs je Fall | <=2 Eingriffe bis R0 | Alle operierten Faelle | >=90% |
| KB-15 | BET-Rate pT1 | Procedure.code (OPS 5-870*) | BET durchgefuehrt | pT1-Primaerfaelle | >=70% |
| KB-16 | Mastektomien | Procedure.code (OPS 5-871/872/883*) | Mastektomie | Alle operierten Faelle | keine |
| KB-17 | LK-Entfernung | Observation (LK untersucht) | >=10 LK untersucht | Invasive pT1+ mit ALND | >=95% |
| KB-18 | Drahtmarkierung | Senologie_OP_Planung.extension preOpMarkierung | Markierung erfolgt | Nicht-tastbare Befunde | >=95% |
| KB-19 | Revisionsop. | Procedure.reasonCode "Revision" | Keine Revision | Alle operierten Faelle | >=95% |
| KB-20 | Checkliste | -- | Organisatorisch | -- | -- |

#### Aggregationsmodell

Die 20 Kennzahlen werden nicht durch ein 1:1-Mapping erzeugt, sondern durch **Aggregation aller Primaerfaelle des Berichtszeitraums**. Zwei Umsetzungsoptionen:

1. **Shell-Mapping + Auswerteschicht** (dieser IG): Der Orchestrator legt pro KB einen Shell-Eintrag (ID + Bezeichnung, Zaehler=0, Nenner=0) an. Die Zaehler/Nenner-Werte werden von einer nachgelagerten CQL-basierten Auswerteschicht aggregiert und in die OncoBox-Meldung geschrieben. Siehe [Anwendungsfall Auswertung](anwendungsfaelle-auswertung.html) und `input/cql/`.

2. **Pre-Aggregation durch das Zentrum**: Das Zentrum erzeugt die KB-Werte bereits vor der Transformation (z.B. im Dashboard) und uebergibt sie als Parameter oder als vorgefertigte FHIR MeasureReports. Die StructureMap mappt die MeasureReport-Werte direkt in den Kennzahl-Block.

### Crosswalk zu anderen Meldeformaten

Viele OncoBox-Datenpunkte ueberlappen konzeptionell mit oBDS-, IQTIG- und S3-Leitlinien-Qualitaetsindikatoren. Die Senologie-FHIR-Profile bilden die **gemeinsame klinische Datenbasis**; die Transformationen ziehen jeweils die fuer das Zielformat erforderlichen Felder.

| Datenelement | oBDS | IQTIG 18.1 | OncoBox N1.1.1 | S3-Leitlinie QI |
|---|---|---|---|---|
| OP-Datum, OPS-Kodes | Ja (Operation) | Ja (O:OPSCHLUESSEL) | Ja (Op_OPS) | -- |
| ICD-10-GM Diagnose | Ja (Diagnose) | Ja (BRUST:DIAGICD) | Ja (Diagnose_ICD) | -- |
| Histologie (ICD-O-3) | Ja | Ja (O:HISTMORPH) | Ja (Diagnose_ICDO) | -- |
| pTNM / Grading | Ja (pTNM) | Ja | Ja | QI5, QI6 |
| Rezeptorstatus ER/PR/HER2 | Ja (Modul_Mamma) | Ja (O:ERSTATUS etc.) | Ja (Rezeptorstatus) | QI12, QI13 |
| Residualstatus R0/R1/R2 | Ja (Residualstatus) | Ja (O:RSTATUSLOK/GES) | Ja (Op_R_Lokal/Gesamt) | -- |
| Lymphknoten (untersucht/befallen) | Ja (Histologie) | Ja | Ja (Lymphknoten) | KB-17 = S3 QI zur LK |
| Drahtmarkierung | -- | Ja (BRUST:DRAHT) | Ja (Op_Drahtmarkierung) | KB-18 = S3 QI7 |
| Tumorkonferenz | Ja (Tumorkonferenz) | Ja (BRUST:TKPRAEOP) | Ja (Tumorkonferenz) | KB-1, KB-2 = S3 QI1, QI2 |
| Trastuzumab bei HER2+ | Ja (Systemtherapie) | -- | Ja (Syst_Trastuzumab) | KB-7 = S3 QI14 |
| Adjuvante endokrine Therapie | Ja (Systemtherapie) | -- | Ja (Endokrine_Therapie) | KB-6 = S3 QI15 |
| Psychoonkologie | -- | -- | Ja (Psychoonkologie) | KB-9 |
| Sozialdienst | -- | -- | Ja (Sozialdienst) | KB-10 |
| Studienteilnahme | Ja (Studie) | -- | Ja (Studienteilnahme) | KB-11 |

Fuer Felder, die auch in der IQTIG-Meldung enthalten sind, verwenden die OncoBox-Maps dieselbe FHIR-Quelle wie `SenologieToIqtigBrust` / `SenologieToIqtigOperation`. Die Code-Uebersetzung kann aufgrund unterschiedlicher Zielschluessel (IQTIG numerisch vs. OncoBox gemischt) abweichen.

### Code-Uebersetzung

Die OncoBox-Brust-Meldung verwendet eigene Schluessel, die sich zum Teil an oBDS und DKG-Konventionen orientieren:

| Datenelement | FHIR-Kodierung | OncoBox-Schluessel | Uebersetzungsmethode |
|---|---|---|---|
| Geschlecht | Patient.gender | W/M/D/U | Direkte Zuordnung in FML |
| Seitenlokalisation | SNOMED CT | R/L/B | Direkte Zuordnung in FML |
| Primaerfallart | ICD-10-GM Prefix | 1-9 (C50, D05, D24, Z40, Z42, ...) | Prefix-basiert |
| Operationsart | OPS Prefix | 1-9 (BET, Mast einfach, SSM, NSM, Rekon, ...) | Prefix-basiert |
| Residualstatus | SNOMED CT (122538001 etc.) | R0/R1/R2/RX | Direkte Zuordnung in FML |
| Bildgebende Methode | SNOMED CT | 1-9 (Mammo, Sono, MRT, Tomo, ...) | Direkte Zuordnung in FML |
| Therapiestellung | Senologie-Extension | N/A/P (neo/adj/pall) | Direkte Zuordnung in FML |
| Rezeptorstatus | SNOMED CT (10828004/260385009/261665006) | P/N/U | Direkte Zuordnung in FML |

### Datenverfuegbarkeit und offene Luecken

{:.stu-note}
Nicht alle OncoBox-Pflichtfelder koennen aus den Senologie-Profilen abgeleitet werden. Insbesondere die Kennzahlen-Aggregation erfordert eine dedizierte Auswerteschicht. Die folgende Tabelle zeigt den Status je Datenpunkt.

| OncoBox-Datenpunkt | Quelle | Status |
|---|---|---|
| Zentrum_ID, IKNR, Standort | Organization (KIS/Stammdaten) | **Externe Quelle** -- nicht klinisch |
| Berichtszeitraum | Transformationsparameter | **Externe Quelle** -- meldungsspezifisch |
| Primaerfallart (feingranular) | Ableitung aus ICD + Verlauf | **Teilweise** -- OnkoZert-Systematik (Sheet "Primaerfallarten") nicht 1:1 abbildbar |
| OP-Datum, OPS, Seitenlokalisation | Senologie_Operation / _BrustOP | Vorhanden |
| ICD-10-GM, Diagnosedatum | Senologie_Diagnose_Maligne / _Benigne | Vorhanden |
| Histologie ICD-O-3, Grading | Senologie_Pathologie_Befund | Vorhanden |
| cTNM / pTNM | Senologie_Pathologie_Befund / MII-Onko | Vorhanden |
| Rezeptorstatus ER/PR/HER2, Ki-67 | MII-Onko-Observations | Vorhanden |
| Lymphknotenstatus (regionaer + Sentinel) | Senologie_Pathologie_Befund | Vorhanden |
| Drahtmarkierung | Senologie_OP_Planung (Extension preOpMarkierung) | Vorhanden |
| Residualstatus R0/R1/R2 | Senologie_Operation.outcome | Vorhanden |
| BI-RADS, bildgebende Methode | Senologie_Bildgebung_Observation / _Befund | Vorhanden |
| Praeoperative histologische Sicherung (Biopsie-Typ) | Procedure (Biopsie-OPS) | **Teilweise** -- KB-12-Binding fehlt |
| Trastuzumab-Flag | Senologie_Systemtherapie_Procedure.note / Medikation | **Teilweise** -- aktuell Freitext-basiert, Binding ueber ATC L01FD01 empfohlen |
| First-Line-Therapie bei Metastasierung | Senologie_Systemtherapie_Procedure (Stellung=palliativ + erste) | **Teilweise** -- Ordnung muss abgeleitet werden |
| Menopausenstatus | Observation (Modul Mamma) | **Teilweise** -- Observation-Binding fehlt in Senologie-Profilen |
| Psychoonkologie / Sozialdienst | Procedure / Observation | **Teilweise** -- eigene Profile nicht vorhanden; ableitbar ueber CarePlan oder Procedure.category |
| Studienteilnahme | ResearchSubject / Senologie_Studienteilnahme | Vorhanden |
| Studienname Auswahlliste (K02) | ResearchSubject.extension[StudiennameCode] | **Vorhanden** -- OncoBox 2.0 |
| Screening Studienteilnahme (K03) | ResearchSubject.extension[Studienscreening] | **Vorhanden** -- OncoBox 2.0 |
| Anzahl Eingriffe bis R0 (KB-14) | Aggregation Procedure (pro Fall) | **Aggregationsschritt** -- CQL erforderlich |
| BET-Rate bei pT1 (KB-15) | Aggregation (Op_Art + pTNM) | **Aggregationsschritt** -- CQL erforderlich |
| Tumorkonferenz-Typ (prae/post/rezidiv) | CarePlan.category | **Teilweise** -- CodeSystem fuer Typ zu ergaenzen |
| Kennzahlen KB-1 bis KB-20 (Zaehler/Nenner) | Aggregationsschicht | **Extern / CQL** -- siehe Aggregationsmodell |

#### Handlungsoptionen

Analog zur IQTIG-Transformation gilt:

1. **Senologie-Profile erweitern** -- Tumorkonferenz-Typ als CodeSystem, Psychoonko-/Sozialdienst-Profile ergaenzen, Trastuzumab-Binding ueber ATC, First-Line-Flag am Systemtherapie-Profil.

2. **Eigene OncoBox-Aggregationsschicht (CQL)** -- Die 20 Kennzahlen werden in CQL-Measure-Definitionen abgebildet und ueber eine FHIR-Measure-Evaluation aggregiert. Die Ergebnisse (MeasureReports) werden in die OncoBox-Kennzahl-Blocks gemappt. S3-Leitlinien-QI und KB-Kennzahlen ueberlappen zu grossen Teilen -- entsprechende Wiederverwendung zwischen Leitlinien-QI-Measures und KB-Measures ist angestrebt.

3. **ETL-Strecke** -- Zentrum-ID, Berichtszeitraum und administrative Metadaten werden aus der OnkoZert-Konfiguration nachgezogen. Die ETL kombiniert FHIR-Primaerfaelle + CQL-MeasureReports + administrative Metadaten zu einer vollstaendigen OncoBox-XML-Meldung.

**Empfehlung**: Kombination aus Option 1 (klinische Profil-Erweiterungen), Option 2 (CQL-Aggregationsschicht) und Option 3 (ETL fuer Metadaten). Die hier bereitgestellten StructureMaps decken den **primaerfallbezogenen Teil** ab; die Kennzahlen-Befuellung ist ein separater Aggregationsschritt.

### OncoBox-Spezifikation

Die Transformation basiert auf der **OncoBox Brust Spezifikation N1.1.1**:

- **Spezifikation**: N1.1.1 (Excel-Workbook mit 25+ Sheets)
- **Logical Model**: [OncoBoxBrustMeldung](StructureDefinition-oncobox-brust-meldung.html) -- bildet die XML-Struktur als FHIR-StructureDefinition ab
- **Datenfelder**: Sheet "Datenfelder-XML" (91 Datenfelder mit Typ, Kode, Beschreibung)
- **Strukturvalidierung**: Sheet "Strukturval." (148 Validierungsregeln)
- **Primaerfallarten**: Sheet "Primaerfallarten" (103 Zeilen; OnkoZert-Klassifikation der Fallarten)
- **Kennzahlen**: Sheets KB-1 bis KB-20 (Zaehler/Nenner/Sollwert je Indikator)
- **Offizielle Quelle**: [OnkoZert XML OncoBox Brustzentren](https://xml-oncobox.de/de/Zentren/BrustZentren)
- **Scope**: Nur OncoBox Brust N1.1.1 -- nicht OncoBox 2.0, nicht OncoBox Darm/Prostata/Lunge

> **Hinweis**: Die OncoBox-Spezifikation wird durch OnkoZert/DKG regelmaessig aktualisiert. Die hier abgebildete Struktur entspricht der Spezifikation N1.1.1. Bei Aktualisierung der Spezifikation sind Logical Model und StructureMaps entsprechend zu versionieren. Die Quell-Excel-Datei liegt unter `input/data/oncobox-brust/OncoBoxBrust_N1.1.1_Spec.xlsx`.

### Abgrenzung zu oBDS, IRegG und IQTIG

Die vier Meldeformate decken unterschiedliche regulatorische Zwecke ab und enthalten ueberlappende, aber nicht identische Datenpunkte:

| Format | Zweck | Empfaenger | Zeitpunkt |
|---|---|---|---|
| **oBDS** | Krebsregistermeldung | Klinisches Krebsregister | Pro klinisches Ereignis (Diagnose, Therapie, Verlauf, Tod) |
| **IRegG** | Implantatregistermeldung | BfArM / Implantateregister | Pro Implantationseingriff |
| **IQTIG 18.1** | Externe Qualitaetssicherung (SGB V Paragraph 136) | IQTIG / G-BA | Pro Behandlungsfall Mammachirurgie |
| **OncoBox Brust** | DKG-Brustzentrum-Zertifizierung | OnkoZert (DKG) | Jaehrlich, aggregiert ueber Berichtszeitraum |

Die Senologie-FHIR-Profile bilden die gemeinsame klinische Datenbasis; die vier Transformations-Pipelines (StructureMaps) ziehen daraus jeweils die fuer das Zielformat erforderlichen Felder. Wo moeglich (z.B. TNM, Rezeptorstatus, Residualstatus, Lymphknoten) verwenden die Maps identische Quell-Muster -- bei abweichenden Zielschluesseln lediglich mit unterschiedlichem Output-Mapping.

### Ausfuehrung

Die Transformation wird analog zur oBDS-, IRegG- und IQTIG-Transformation ueber [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke ausgefuehrt.

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
      "valueUri": "https://www.senologie.org/fhir/StructureMap/SenologieToOncoBoxBrust"
    }
  ]
}
```

Das Ergebnis ist eine Instanz des OncoBox Logical Models. Ein nachgelagerter XML-Serialisierer erzeugt daraus die OncoBox-Brust-XML-Datei im Format N1.1.1, die an OnkoZert uebermittelt werden kann.
