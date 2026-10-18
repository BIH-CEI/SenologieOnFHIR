### Konsolidierte Gap-Analyse

Diese Seite fasst die Lücken aus allen annotierten Kapiteln der S3-Leitlinie zusammen, nach Priorität sortiert. Umfang, Kapitelübersicht und Mapping-Status stehen auf der Seite [S3-Leitlinien-Abdeckung](leitlinien-abdeckung.html); die kodierten Begriffe im [Glossar (SNOMED + S3)](glossar-s3-snomed.html).

> Grundlage: S3-Leitlinie Mammakarzinom v5.0 (Dezember 2025), AWMF 032-045OL. Stand der Annotation: 2026-02-18.

{:.stu-note}
Die Priorisierung ist eine Projekteinschätzung und Review-Gegenstand. Sie sagt, wo nach unserer Lesart der Leitlinie Modellierungsarbeit fehlt — nicht, was verbindlich umzusetzen ist.

#### Prio 1: Fehlende FHIR-Ressourcentypen

| Gap | Betroffene Kapitel | Empfehlungen | Handlungsbedarf |
|-----|-------------------|-------------|-----------------|
| **MedicationRequest / MedicationAdministration** | 4.8, 5.2 | ~70 | Medikamentöse Therapie komplett unmodelliert. ~60 Medikamente mit ATC-Codes dokumentiert. |
| **Biopsie-Procedure-Profil** | 4.1 | 4.15-4.24 | Steuerung, Nadel, Proben, Marker, B-Klassifikation, Konkordanz |
| **CarePlan / Therapiesequenz** | 4.6, 4.8, 5, 6.3 | ~20 | Zeitliche Abfolge Chemo → OP → RT → Erhaltung + Nachsorge-Schema |
| **Genomics Reporting** | 3.3, 5.2 | ~15 | BRCA1/2, PIK3CA, ESR1, AKT1, PTEN - Genomics Reporting IG profilieren |
| **Nachsorge-CarePlan** | 6.3 | 6.13-6.24 | Nachsorge-Schema mit Intervallen, Follow-up-Untersuchungen |
| **Geriatrisches Assessment** | 7.2 | ~10 | G8-Screening, CGA - Questionnaire/QuestionnaireResponse |

#### Prio 2: Fehlende Extensions/Observations an bestehenden Profilen

| Gap | Profil | Betroffene Empfehlungen | Details |
|-----|--------|------------------------|---------|
| **HER2-low/ultralow** | Pathologie | 4.73, 5.2 | 4-stufig: positiv/low/ultralow/negativ - therapeutisch hochrelevant (T-DXd) |
| **PD-L1 IC + CPS** | Pathologie | 4.75, 5.2 | Observation für mTNBC mit Antikörperklon |
| **pCR-Status** | Pathologie/Therapie | 4.8, 5.1 | Therapiesteuerung post-NACT (→ T-DM1/Capecitabin/Olaparib) |
| **Fraktionierungsschema** | Strahlentherapie | 4.94-4.101 | Konventionell/moderat hypo/ultra-hypo |
| **Boost-Details** | Strahlentherapie | 4.102-4.106 | Dosis, Technik (SIB/sequentiell/IORT/Brachytherapie) |
| **Bestrahlungstechnik** | Strahlentherapie | 4.6 | IMRT/VMAT, Atemanhaltetechnik (DIBHT) |
| **SLN-Befund-Differenzierung** | Operation | 4.56-4.64 | Makro-/Mikrometastase/ITC |
| **TAD als OP-Verfahren** | Operation | 4.62 | Fehlt in ValueSet vs-senologie-operation-art |
| **Zielgebiet-ValueSet** | Strahlentherapie | 4.6.5-4.6.7 | Supraklavikulär, Mammaria interna, Axilla-Level |
| **ER/PR Färbeintensität** | Pathologie | 4.72 | 3-Stufen: schwach/mäßig/stark |
| **Präanalytik/Fixation** | Pathologie | 4.66 | Fixationsmittel, -dauer, kalte Ischämiezeit |
| **Therapielinie** | Systemtherapie | 5.2 | 1st/2nd/3rd-line + Vortherapie-Dokumentation |
| **Menopausenstatus** | Patient/Condition | 4.2, 5.2 | Stratifizierungsmerkmal für Systemtherapie |
| **Brustrekonstruktion-Details** | Brustimplantat | 7.5 | Einzeitig/zweizeitig, Platzhalter, BIA-ALCL |
| **Spezielle Tumorentitäten** | Diagnose_Maligne | 7.6 | Metaplastisch, Phylloidestumor, Angiosarkom, BIA-ALCL |

#### Prio 3: Konzeptionelle Gaps

| Gap | Beschreibung | Betroffene Kapitel |
|-----|-------------|-------------------|
| **Biomarker-definierter Tumortyp** | Abgeleiteter Parameter (Luminal A/B, HER2+, TNBC) | 4.5, 4.8, 5.2 |
| **Radiologisch-pathologische Korrelation** | Konkordanz Bildgebung ↔ Histologie | 4.1, 4.3 |
| **Active Surveillance (DCIS)** | Neues Behandlungskonzept | 4.2 |
| **Psychoonkologie-Screening** | Distress-Thermometer, PHQ-9, GAD-7 als Questionnaires | 6.1 |
| **Fertilitätserhalt / Kryokonservierung** | Kein FHIR-Profil | 7.1 |
| **Geschlechtsidentität** | Extension für Transgender-Kontext | 7.4 |
| **PROMs (BREAST-Q)** | Patient-Reported Outcomes nach Rekonstruktion | 7.5 |
| **Lokale Metastasentherapie** | RFA, TACE, SBRT, SIRT | 5.3 |

#### Verwendete Terminologien (kapitelübergreifend)

Die Versionsangaben beziehen sich auf den Stand der Leitlinie. Wie viele Begriffe je System tatsächlich kodiert sind, zählt das [Glossar](glossar-s3-snomed.html).

| System | Version | Verwendung | mapping_quelle |
|--------|---------|-----------|----------------|
| ICD-10-GM | 2025 | Diagnosen (C50, D05, D48.6) | leitlinie |
| ICD-O-3 | 2. Revision (2019) | Histologische Tumortypen | leitlinie |
| UICC TNM | 8. Auflage (2017) | Staging (pT, pN, cM, R) | leitlinie |
| WHO Tumorklassifikation | 5. Auflage | Histologische Typisierung | leitlinie |
| ACR BI-RADS | 5. Auflage (2013) | Bildgebungsbefunde | leitlinie |
| ASCO/CAP | 2023 | HER2-Scoring, ER/PR-Bewertung | leitlinie |
| Elston/Ellis (Nottingham) | - | Histologisches Grading | leitlinie |
| ACMG | 5-Klassen | Variantenklassifikation (Genetik) | leitlinie |
| ATC | 2025 | ~60 Medikamente (Kap. 4.8, 5.2) | standard |
| LOINC | 2.77 | Biomarker-Observations | standard |
| SNOMED CT | 2025-01-31 | Klinische Konzepte | vorschlag/standard |
| OPS | 2025 | Operative Prozeduren | mii-kds |
| HGNC | - | Gene (BRCA1/2, PIK3CA, ESR1 etc.) | standard |
| CTCAE | v5.0 | Nebenwirkungsgrade | standard |

#### Validierungsstatus

- **leitlinie**: Direkt aus der S3-Leitlinie referenziert - **kein Review nötig**
- **mii-kds**: Aus MII Kerndatensatz übernommen - **validiert**
- **standard**: Etablierte Standard-Mappings (LOINC, ATC etc.) - **Review empfohlen**
- **vorschlag**: Von uns zugewiesen - **Review erforderlich**

#### Qualitätsindikatoren als Profil-Validierung

Kapitel 8 definiert 17 QI mit Zähler/Nenner-Definitionen. Diese können als **Validierung der FHIR-Profile** genutzt werden: Wenn alle für einen QI nötigen Datenobjekte in den Profilen vorhanden sind, kann der QI berechnet werden.

Die nächsten Schritte zur Weiterentwicklung der Annotation stehen auf der Seite [S3-Leitlinien-Abdeckung](leitlinien-abdeckung.html#weiterentwicklung).
