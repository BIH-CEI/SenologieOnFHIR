# oBDS-Meldungstransformation

### Überblick

Die Krebsregistermeldung nach dem Onkologischen Basisdatensatz (oBDS) ist eine zentrale Meldepflicht zertifizierter Brustzentren. Ziel dieser Transformation ist die **automatische Ableitung von oBDS-konformen XML-Meldungen aus klinischen FHIR-Daten**, die auf den Senologie-Profilen dieses IGs basieren.

- **Qüllformat**: FHIR Bundle mit Senologie-Profilen (dieser IG)
- **Zielformat**: oBDS XML, Schema-Version **v3.0.5**
- **Methode**: FHIR StructureMaps (FML) mit oBDS Logical Model als Zielstruktur
- **Ausführung**: [Matchbox](https://github.com/ahdis/matchbox) als lokale ETL-Strecke

### Architektur

Die Transformation erfolgt in mehreren Schritten: Die klinischen FHIR-Ressourcen werden über StructureMaps (FHIR Mapping Language) auf ein oBDS Logical Model abgebildet. Matchbox serialisiert das Logical Model anschließend als oBDS-konformes XML.

```
┌─────────────────────────────┐
│  FHIR Bundle                │
│  (Senologie-Profile)        │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  StructureMap (FML)         │
│  pro Meldungstyp            │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  oBDS Logical Model         │
│  (FHIR StructureDefinition) │
└──────────┬──────────────────┘
           │
           ▼
┌─────────────────────────────┐
│  Matchbox $transform        │
│  → oBDS XML (v3.0.5)       │
└─────────────────────────────┘
```

### Mapping-Übersicht pro Meldungstyp

Jede oBDS-Meldung entspricht einem klinischen Ereignis (Diagnose, Therapie, Verlauf, Tod). Die folgende Tabelle zeigt die Zuordnung der Senologie-FHIR-Profile zu den oBDS-Meldungstypen und den zugehörigen StructureMaps.

| Meldungstyp | FHIR-Profil(e) | oBDS-Element | StructureMap |
|---|---|---|---|
| **Diagnose** | Senologie_Diagnose_Maligne + Observations (TNM, Rezeptorstatus) | `<Diagnose>` + `<cTNM>` + `<Modul_Mamma>` | `SenologieToObdsDiagnose` |
| **Operation** | Senologie_Operation + Specimen (Pathologie) | `<OP>` + `<TNM>` (pTNM) + `<Residualstatus>` | `SenologieToObdsOP` |
| **Systemtherapie** | Senologie_Systemtherapie_Procedure + _Medikation | `<SYST>` + `<Menge_Substanz>` | `SenologieToObdsSYST` |
| **Strahlentherapie** | Senologie_Strahlentherapie | `<ST>` + `<Menge_Bestrahlung>` | `SenologieToObdsST` |
| **Tumorkonferenz** | Senologie_Tumorboard_Empfehlung | `<Tumorkonferenz>` + `<Therapieempfehlung>` | `SenologieToObdsTumorkonferenz` |
| **Verlauf** | Senologie_Diagnose_Maligne (Rezidiv) + Observations | `<Verlauf>` + `<Menge_FM>` + `<TNM>` | `SenologieToObdsVerlauf` |
| **Tod** | Patient (deceased) + Condition (Todesursache) | `<Tod>` + `<Menge_Todesursachen>` | `SenologieToObdsTod` |

Jeder Meldungstyp wird von einer eigenen StructureMap abgebildet. Die Tumorzuordnung (`<Tumorzuordnung>`) mit ICD-10-GM, Diagnosedatum, Seitenlokalisation und ICD-O-3-Morphologie ist allen Meldungstypen gemeinsam und wird aus `Senologie_Diagnose_Maligne` abgeleitet.

### Modul Mamma

Der oBDS enthält ein mammaspezifisches Modul (`<Modul_Mamma>`), das bei Diagnose- und Verlaufsmeldungen übermittelt wird. Die folgenden Felder werden aus den Senologie-Observations abgeleitet:

| oBDS-Feld | Werte | FHIR-Qülle |
|---|---|---|
| `HormonrezeptorStatus_Östrogen` | P / N / U | Observation (Östrogenrezeptor-Status) |
| `HormonrezeptorStatus_Progesteron` | P / N / U | Observation (Progesteronrezeptor-Status) |
| `Her2neuStatus` | P / N / U | Observation (HER2-Status) |
| `PräoperativeMarkierung` | *(Kodierung nach oBDS)* | Senologie_Operation (Extension) |
| `Operationstyp` | *(Kodierung nach oBDS)* | Senologie_Operation (`Procedure.code`) |

Die Werte P (positiv), N (negativ) und U (unbekannt) entsprechen dem oBDS-Schlüssel und werden aus den codierten FHIR-Observations mit SNOMED-CT-Kodierung übersetzt.

### Code-Übersetzung

Die Senologie-Profile verwenden SNOMED CT als primäres Kodiersystem. Der oBDS erwartet eigene Schlüssel und Kodiersysteme. Die Übersetzung erfolgt über ConceptMaps, wobei die MII-Onkologie-Profile bereits viele relevante ConceptMaps bereitstellen.

| Datenelement | Richtung | Qülle → Ziel |
|---|---|---|
| Seitenlokalisation | SNOMED CT → oBDS | `L` / `R` / `B` / `T` |
| Intention | SNOMED CT → oBDS | `K` / `P` / `S` / `D` / `X` |
| Grading | SNOMED CT → oBDS | `1` / `2` / `3` / `4` / `X` / `L` / `M` / `H` / `B` / `U` |
| Residualstatus | SNOMED CT → oBDS | `R0` / `R1` / `R2` / `RX` |
| Therapieart (SYST) | SNOMED CT → oBDS | `CH` / `HO` / `IM` / `ZS` / `CI` |
| Stellung OP | SNOMED CT → oBDS | `O` / `A` / `N` / `I` / `S` |
| Medikation (Substanz) | SNOMED CT → ATC / ASK | [CM SCT→ATC](ConceptMap-CM-Senologie-Medikation-SCT-ATC.html), [CM SCT→ASK](ConceptMap-CM-Senologie-Medikation-SCT-ASK.html) |

Für die Medikamenten-Übersetzung stehen bereits ConceptMaps in diesem IG bereit (siehe [Terminologie: Medikation](terminologie-medikation.html)). Die übrigen Übersetzungen nutzen ConceptMaps aus dem [MII Onkologie-Modul](https://simplifier.net/medizininformatikinitiative-modulonkologie).

### Datenverfügbarkeit und offene Lücken

{:.stu-note}
Nicht alle oBDS-Pflichtfelder können vollständig aus den Senologie-Profilen abgeleitet werden. Für eine korrekte Krebsregistermeldung müssen zusätzliche Datenqüllen eingebunden werden.

| oBDS-Datenpunkt | Qülle | Status |
|---|---|---|
| ICD-10-GM, Diagnosedatum, Seitenlokalisation | Senologie_Diagnose_Maligne | Vorhanden |
| ICD-O-3 Morphologie + Version | Senologie_Pathologie_Befund | Vorhanden |
| Diagnosesicherung (oBDS 1–9) | Senologie_Diagnose_Maligne (verificationStatus) | Vorhanden |
| Grading (G1–G4) | Senologie_Pathologie_Befund | Vorhanden |
| TNM-Klassifikation (c/p, UICC) | MII Onko TNM-Profile (via Referenzen) | Vorhanden |
| OPS-Codes, OP-Datum, Intention | Senologie_Operation | Vorhanden |
| Residualstatus (R0/R1/R2) | Senologie_Operation (outcome) | Vorhanden |
| LK untersucht/befallen | Senologie_Pathologie_Befund | Vorhanden |
| Systemtherapie: Substanz, Beginn/Ende, Intention | Senologie_Systemtherapie_Procedure + _Medikation | Vorhanden |
| Strahlentherapie: Dosis, Zielgebiet, Applikationsart | Senologie_Strahlentherapie | Vorhanden |
| Tumorkonferenz: Datum, Typ, Empfehlungen | Senologie_Tumorboard_Empfehlung | Vorhanden |
| Modul Mamma: ER/PR/HER2 | Senologie_Pathologie_Befund | Vorhanden |
| Modul Mamma: Menopausenstatus | MII Onko (`mii-pr-onko-mamma-menopause-status`) | Vorhanden — SNOMED 309606002/309608001/309607006 → oBDS 1/3/U |
| Modul Mamma: Präoperative Drahtmarkierung (M/S/T/N/U) | Senologie_OP_Planung (`extension[preOpMarkierung]`) | Vorhanden — ServiceRequest-Extension, Coding M/S/T/N/U |
| Modul Mamma: Intraoperative Präparatkontrolle (QI-3) | Specimen.processing.procedure | Vorhanden — Indikator für QI-3 "Präparatkontrolle nach Drahtmarkierung" |
| Modul Mamma: TumorgrößeInvasiv / TumorgrößeDCIS | Senologie_Pathologie_Befund (LOINC 33728-7) | Vorhanden — strukturierte Tumorgröße in mm |
| Topographie ICD-O (C50.x) | Senologie_Tumorlokalisation (BodyStructure.locationQualifier[quadrant]) | **Vorhanden** — Quadrant → C50.0–C50.9 via [ConceptMap](ConceptMap-cm-sct-to-icdo3-mamma-topographie.html), Seite separat aus locationQualifier[seitenlokalisation] |
| Genexpressionstests (Oncotype DX, MammaPrint) → Menge_Weitere_Klassifikation | Senologie_Genexpressionstest (RiskAssessment) | Vorhanden — wird als `<Weitere_Klassifikation>` mit Name + Stadium/Score abgebildet |
| Frühere Tumorerkrankungen | MII Onko (`mii-pr-onko-frühere-tumorerkrankung`) | **Teilweise abbildbar** — MII-Profil vorhanden, aber aktüll nicht als Senologie-Testdatum; Datenlage im Brustzentrum meist anamnestisch → siehe OF-13 |
| Allgemeiner Leistungszustand (ECOG) | MII Onko (`mii-pr-onko-allgemeiner-leistungszustand-ecog`) | **Vorhanden** — MII Onko Profil, kein eigenes Senologie-Profil nötig. Testdaten: Fall 1, 2, 9 (Verlauf) |
| Absender/Melder-Daten (IKNR, Arzt, Anschrift, Bankdaten) | KIS / Verwaltung | **Externe Qülle** — administrative Daten |
| Meldebegründung, Eigene Leistung | KIS / Verwaltung | **Externe Qülle** |
| Sterbedatum, Todesursache | KIS / Standesamt | **Externe Qülle** |
| Nebenwirkungen Systemtherapie (CTCAE-Grad) | MII Onko (`mii-pr-onko-nebenwirkung-adverse-event`) | **Vorhanden** — AdverseEvent mit CTCAE-Art, Grad und Verursacher-Referenz |
| Nebenwirkungen Strahlentherapie (CTCAE) | MII Onko (`mii-pr-onko-nebenwirkung-adverse-event`) | **Vorhanden** — gleiches Profil, suspectEntity verweist auf RT-Procedure |
| Nebenwirkung Art: MedDRA-Code (alternativ zu Bezeichnung) | MII Onko AdverseEvent | **Vorhanden im LM** — in StructureMap noch nicht ausgeschrieben |
| Sozialdienstkontakt (Modul_Allgemein) | MII Onko (`mii-pr-onko-mamma-sozialdienst`) | **Teilweise abbildbar** — MII-Profil existiert, aber nicht im Senologie-Scope dokumentiert → siehe OF-14 |
| Strukturierte ycTNM / ypTNM bei neoadjuvanter Therapie (Fall 4, 5, 7) | MII Onko TNM-Profile | **Lücke in Testdaten** — aktüll nur narrativ in Procedure.outcome.text; benötigt TNM-Observations mit y-Symbol |

#### Handlungsoptionen

1. **CTCAE-Nebenwirkungen** — Über das bestehende MII Onko Profil `mii-pr-onko-nebenwirkung-adverse-event` (AdverseEvent) abbildbar. CTCAE-Art, Grad und CTCAE-Version sind als MS-Elemente definiert. Die `suspectEntity`-Referenz verknüpft die Nebenwirkung mit der verursachenden Therapie. Kein eigenes Senologie-Profil nötig.

2. **ICD-O-Topographie** — Wird aus der BodyStructure (Tumorlokalisation) abgeleitet: SNOMED-Quadrant → ICD-O-3 C50.x via ConceptMap. Seitenlokalisation separat. Die [ConceptMap SNOMED → ICD-O-3](ConceptMap-cm-sct-to-icdo3-mamma-topographie.html) deckt alle 7 Quadranten ab, mit Fallback auf C50.9.

3. **ECOG-Leistungszustand** — Über das bestehende MII Onko Profil (`mii-pr-onko-allgemeiner-leistungszustand-ecog`) abbildbar. Muss im Brustzentrum bei Diagnose und Verlauf dokumentiert und als Observation im Bundle mitgeliefert werden. Testdaten für Verlaufs-ECOG liegen für Fall 1, 2 und 9 vor.

4. **Mamma-spezifische Modulfelder (QI-3, Drahtmarkierung, Tumorgröße)** — Die Felder `PräopDrahtmarkierung`, `IntraopPraeparatkontrolle` (QI-3), `TumorgroesseInvasiv` und `TumorgroesseDCIS` sind im Logical Model ergänzt. Die Drahtmarkierung wird aus der OP-Planung (ServiceRequest-Extension `preOpMarkierung`) übernommen; die QI-3-Präparatkontrolle aus `Specimen.processing.procedure`; Tumorgröße aus der Pathologie (LOINC 33728-7).

5. **Genexpressionstests** — Oncotype DX, MammaPrint, Prosigna etc. werden als `<Weitere_Klassifikation>` (oBDS `Menge_Weitere_Klassifikation`) exportiert. Mapping aus `Senologie_Genexpressionstest` (RiskAssessment): `method.coding.display` → Name, `occurrenceDateTime` → Datum, `prediction.qualitativeRisk` → Stadium.

6. **Administrative Daten über ETL** — Absender, Melder, Bankdaten, Meldebegründung kommen aus dem KIS bzw. der Krankenhausverwaltung und werden in der ETL-Strecke ergänzt, in Abstimmung mit der GB IT.

**Empfehlung**: Die verbleibenden Lücken (Testdaten-ycTNM/ypTNM, Frühere Tumorerkrankungen, Sozialdienstkontakt) sind konzeptionell gelöst, benötigen aber Testdaten-Ergänzung bzw. Entscheidung im Zuge der Ballotierung (siehe OF-13, OF-14).

### Testdaten-Referenz

Als Referenz für die oBDS-Struktur dient der Testdatensatz der [Plattform §65c](https://plattform65c.atlassian.net/wiki/spaces/UMK/pages/189530203) (Testpatient Mamma).

**Testpatientin**: Michaela Musterfrau, geb. 15.10.1950

- **Diagnose**: C50.4 rechte Brust (oberer äußerer Quadrant), invasives duktales Karzinom (ICD-O-3: 8500/3), Grading G2
- **Staging**: cT1c cN0 cM0, UICC IA
- **Therapie**: 2 Operationen (Sentinel-LNE + Axilladissektion), Chemotherapie (Cisplatin), Hormontherapie (Anastrozol), Strahlentherapie (58,8 Gy)
- **Verlauf**: Rezidiv mit Fernmetastasen (Leber, Lunge), rT1c rN1 rM1, UICC IV
- **Tod**: 27.11.2021, tumorbedingt

Der Testdatensatz enthält **10 Meldungen** (1 Diagnose, 2 Operationen, 2 Systemtherapien, 1 Strahlentherapie, 2 Tumorkonferenzen, 1 Verlauf, 1 Tod) und deckt damit alle relevanten Meldungstypen ab.

> **Hinweis**: Die Testdaten verwenden oBDS-Schema v3.0.1. Die Zielversion dieser Transformation ist v3.0.5. Unterschiede zwischen den Versionen (insbesondere neü Pflichtfelder und erweiterte Module) müssen bei der StructureMap-Entwicklung berücksichtigt werden.

### Ausführung

Die Transformation wird über einen [Matchbox](https://github.com/ahdis/matchbox)-Docker-Container als lokale ETL-Strecke ausgeführt.

**Setup:**

```bash
docker run -d -p 8080:8080 eu.gcr.io/fhir-ch/matchbox:latest
```

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
      "valüUri": "https://www.senologie.org/fhir/StructureMap/SenologieToObdsDiagnose"
    }
  ]
}
```

Das Ergebnis ist eine Instanz des oBDS Logical Models, die als XML serialisiert und an das Krebsregister übermittelt werden kann.

**Perspektive**: Langfristig ist eine Umstellung der Krebsregister auf FHIR-basierte Meldungen wahrscheinlich. Die StructureMap-basierte Architektur ermöglicht einen fließenden Übergang: Sobald Krebsregister FHIR-Bundles akzeptieren, entfällt der XML-Serialisierungsschritt, und die Transformation reduziert sich auf ein Profil-Mapping.
