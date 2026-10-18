# S3-Leitlinien-Abdeckung - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* [**Terminologie**](terminologie-uebersicht.md)
* **S3-Leitlinien-Abdeckung**

## S3-Leitlinien-Abdeckung

### S3-Leitlinien-Abdeckung

Der Kerndatensatz Senologie orientiert sich inhaltlich an der **S3-Leitlinie Mammakarzinom** (AWMF 032-045OL, Langversion 5.0, Dezember 2025). Die Empfehlungen der Leitlinie wurden systematisch annotiert: pro Empfehlung sind die geforderten Datenobjekte, ihre Terminologie und ihr Bezug zu den FHIR-Profilen erfasst.

Diese Seite ist der Einstieg in die Annotation. Die vollständige Annotation pro Empfehlung steht auf den Kapitelseiten (unten verlinkt), die kodierten Begriffe im [Glossar (SNOMED + S3)](glossar-s3-snomed.md), das Datenmodell der Annotation im [Annotations-Schema](leitlinien-annotation-schema.md).

Die Annotation ist **Review-Gegenstand, keine Festlegung.** Mappings mit `mapping_quelle: vorschlag` sind von uns zugewiesen und fachlich noch nicht bestätigt; die Bewertung `mapped` / `partial` / `gap` ist eine Selbsteinschätzung des Projekts. Rückmeldungen sind ausdrücklich erwünscht (siehe [Offene Fragen](offene-fragen.md)).

#### Umfang der Analyse

| | |
| :--- | :--- |
| Analysierte Kapitel | 11 (Kap. 3–8) |
| Annotierte Empfehlungen und Qualitätsindikatoren | 376 |
| Erfasste Datenobjekte | 821 |
| Davon mit Terminologie-Code | 150 (141 nach Zusammenführung gleicher Begriffe) |
| Davon ohne Code (Mapping-Lücke) | 671 |

Nicht annotiert sind Kap. 1 (Leitlinien-Metadaten), Kap. 2 (Methodik), Kap. 4.7 (beeinflussbare Lebensstilfaktoren), Kap. 9 (Forschungsfragen) und Kap. 10 (Anhänge).

#### FHIR-Mapping-Status

Jede annotierte Empfehlung trägt eine Einschätzung, wie weit ihre Datenobjekte in den Profilen abgebildet sind:

| | | | |
| :--- | :--- | :--- | :--- |
| `mapped` | vollständig in bestehenden Profilen abgebildet | 23 | 6 % |
| `partial` | teilweise abgebildet, Ergänzung nötig | 185 | 49 % |
| `gap` | kein passendes Profil, neues Profil/Extension nötig | 169 | 45 % |

Diese Verteilung ist aus den Annotationsblöcken ausgezählt und ersetzt die früher auf dieser Seite genannte Schätzung von „~70 % abgedeckt“, die sich nicht aus der Annotation ableiten ließ. Zu beachten: `partial` ist der häufigste Fall — die klinischen Domänen sind weitgehend modelliert, aber selten in der Detailtiefe, die die Leitlinie fordert. Die Verteilung zählt Empfehlungen, nicht Datenobjekte.

#### Annotation pro Kapitel

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [3](s3-kap-3-allgemeines.md) | Risikofaktoren, Früherkennung, Genetik | 43 | 55 | 29 | Teilweise — Familienanamnese und Genexpressionstests vorhanden; Risikokalkulation (IBIS, BOADICEA) nicht abgebildet |
| [4.1](s3-kap-4-1-diagnostik.md) | Diagnostik (Bildgebung, Biopsie, Staging) | 16 | 54 | 2 | Gut — Bildgebung, Pathologie, BI-RADS, Staging via TNM; Biopsie-Details (Steuerung, Nadel, B-Klassifikation) offen |
| [4.2–4.3](s3-kap-4-2-4-3-dcis-risikolaesionen.md) | DCIS und Risikoläsionen (B3) | 17 | 71 | 12 | Gut — Diagnose Maligne (DCIS), Diagnose Benigne (B3), Vakuumbiopsie, Nachresektion |
| [4.4](s3-kap-4-4-operative-therapie.md) | Operative Therapie | 21 | 77 | 3 | Sehr gut — BET, Mastektomie, Axilla, Rekonstruktion, Implantat, Komplikation; SLN-Befunddifferenzierung und TAD offen |
| [4.5](s3-kap-4-5-pathologie.md) | Pathologie, Biomarker, Prognose | 13 | 54 | 18 | Sehr gut — Befund/Präparat, IHC (ER/PR/HER2/Ki-67), Grading, Morphologie; HER2-low/ultralow und Präanalytik offen |
| [4.6](s3-kap-4-6-strahlentherapie.md) | Adjuvante Strahlentherapie | 36 | 93 | 11 | Gut — Dosis, Boost, Fraktionierung; Zielgebiete und Bestrahlungstechnik offen |
| [4.8](s3-kap-4-8-systemische-therapie.md) | Systemische Therapie, frühes Mammakarzinom | 40 | 88 | 21 | Gut — Procedure + Medikation, Medikamenten-ValueSets; MedicationRequest/-Administration fehlen |
| [5](s3-kap-5-rezidiv-metastasiert.md) | Rezidiv und metastasierte Erkrankung | 69 | 95 | 41 | Teilweise — Verlaufs-Observations, Fernmetastasen, Progression vorhanden; Therapielinien und lokale Metastasentherapie offen |
| [6](s3-kap-6-betreuung.md) | Betreuung (Psychoonkologie, Reha, Nachsorge) | 34 | 90 | 7 | Lückenhaft — Psychoonkologie und Rehabilitation nicht im Senologie-Scope; Nachsorge über Verlaufs-Observations |
| [7](s3-kap-7-spezielle-situationen.md) | Spezielle Situationen | 69 | 70 | 5 | Teilweise — männliches Mammakarzinom abgebildet; Fertilität, Geriatrie, seltene Entitäten offen |
| [8](s3-kap-8-qualitaetsindikatoren.md) | Qualitätsindikatoren | 18 | 74 | 1 | Gut — 17 QI als CQL-Measures, Kennzahlen über OncoBox-Mapping |

Die Spalte „kodiert“ zählt Datenobjekte mit Terminologie-Code; die Codes selbst stehen im [Glossar](glossar-s3-snomed.md). Ein niedriger Wert bedeutet nicht fehlende Abdeckung, sondern dass die Empfehlung überwiegend strukturelle statt kodierte Angaben fordert (z. B. Kap. 4.4: Operationsverfahren sind über OPS/SNOMED in den Profilen gebunden, nicht in der Annotation wiederholt).

#### Gut abgedeckte Bereiche

Die folgenden klinischen Domänen sind durch Senologie-Profile oder referenzierte MII-Profile vollständig oder weitgehend abgebildet:

* **Diagnostik**: Mammographie, Sonographie, MRT, Stanzbiopsie, Vakuumbiopsie, BI-RADS, ACR
* **Pathologie**: ICD-O-3 Morphologie, Grading, Rezeptorstatus (ER/PR/HER2), Ki-67, Lymphknotenstatus, B3-Läsionen
* **TNM-Staging**: Klinisch (cTNM), pathologisch (pTNM), nach Neoadjuvanz (ypTNM), Rezidiv (rTNM), mit allen Kategorien (T/N/M/L/V/Pn/UICC)
* **Operative Therapie**: BET, Mastektomie, Axilladissektion, SLNB, Rekonstruktion, Implantat, Subprozeduren, R-Status, Clavien-Dindo-Komplikation
* **Systemische Therapie**: Chemotherapie, endokrine Therapie, zielgerichtete Therapie (Trastuzumab, Pertuzumab), Immuntherapie (Pembrolizumab), Zyklustracking
* **Strahlentherapie**: Dosis, Boost, Fraktionierung, Applikationsart, Nebenwirkungen (CTCAE)
* **Tumorkonferenz**: Interdisziplinäre Empfehlungen mit Therapieart-Slices
* **Genexpressionstests**: Oncotype DX, MammaPrint, Prosigna, EndoPredict mit Score und Risikoklasse
* **Qualitätsindikatoren**: 17 S3-QI als CQL-Library, 20 DKG-Kennzahlen über OncoBox-Mapping

#### Bekannte Lücken

Die kapitelübergreifend konsolidierte Auswertung steht auf der Seite [Konsolidierte Gap-Analyse](leitlinien-gap-analyse.md) — dort nach Priorität sortiert, mit den betroffenen Empfehlungen. Die wichtigsten Punkte im Überblick:

| | | |
| :--- | :--- | :--- |
| Medikamentöse Therapie | Kein Profil | MedicationRequest/MedicationAdministration fehlen; ~60 Medikamente mit ATC-Codes sind annotiert, aber nicht modelliert |
| Psychoonkologische Versorgung | Kein Profil | Screening (PHQ, GAD), Interventionen — nicht senologiespezifisch, ggf. über PRO-Modul |
| Rehabilitation | Kein Profil | Reha-Ziele, Nachsorge-Schema — außerhalb des Senologie-Scope |
| Palliative Versorgung | Kein Profil | Palliativmedizinische Dokumentation — eigenständiges Thema |
| Komplementärmedizin | Kein Profil | Kap. 6 der S3-Leitlinie — bewusst nicht abgebildet |
| Risikokalkulation (IBIS, BOADICEA) | Kein Profil | Rechnerische Risikomodelle — RiskAssessment vorhanden (Genexpressionstest), aber nicht für polygene Risiko-Scores |
| Schwangerschafts-assoziiertes MaCa | Teilweise | Gynäkologische Anamnese und Schwangerschaftsstatus über IPS, therapiespezifische Anpassungen nicht modelliert |
| Mammakarzinom im Alter | Teilweise | Geriatrisches Assessment nicht im Scope; Therapieentscheidungen über Tumorboard abbildbar |
| Nachsorge-Schema | Teilweise | Verlaufs-Observations vorhanden, aber kein strukturiertes Nachsorge-Protokoll (PlanDefinition) |

#### Weiterentwicklung

Die Leitlinien-Annotation wird mit jeder Version des Kerndatensatzes aktualisiert; bei Aktualisierung der S3-Leitlinie werden die Annotationen überprüft und angepasst. Nächste Schritte:

1. **Review**der annotierten Kapitel durch klinische Fachexpertinnen und -experten
1. **Terminologie-Validierung**aller`vorschlag`-Mappings sowie der 18 kodierten Begriffe ohne Herkunftsangabe
1. **AGO-Empfehlungen**abgleichen und ergänzen
1. **FHIR-Profile ableiten**aus den Gaps der Priorität 1 und 2
1. **QI-basierte Profil-Validierung**— sind alle 17 QI aus den Profilen berechenbar?

Die Annotation liegt als Markdown mit YAML-Blöcken im Repository unter `input/pagecontent/s3-kap-*.md`; die kodierten Begriffe stehen zusätzlich maschinenlesbar in `exports/glossar-s3-snomed.csv`.

