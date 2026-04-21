# S3-Leitlinien-Abdeckung

Der Kerndatensatz Senologie orientiert sich inhaltlich an der **S3-Leitlinie Mammakarzinom** (AWMF 032-045OL, Langversion 5.0, Dezember 2025). Die Empfehlungen der Leitlinie wurden systematisch auf ihre Abbildbarkeit in FHIR-Datenobjekten analysiert.

### Umfang der Analyse

| Kennzahl | Wert |
|---|---|
| Analysierte Kapitel | 11 (Kap. 3–8) |
| Annotierte Empfehlungen | 93 |
| Identifizierte FHIR-Mappings | 396 |
| Davon abgedeckt durch Senologie-Profile | ~70% |
| Davon abgedeckt über MII-Profile (referenziert) | ~15% |
| Noch nicht abgedeckt (Gaps) | ~15% |

### Abdeckung pro Kapitel

| Kapitel | Thema | Empfehlungen | FHIR-Mappings | Abdeckung |
|---|---|---|---|---|
| 3 | Risikofaktoren, Früherkennung, Genetik | 5 | 43 | Teilweise — Familienanamnese, Genexpressionstest vorhanden; Risikokalkulation (z.B. IBIS) nicht abgebildet |
| 4.1 | Diagnostik (Bildgebung, Biopsie, Staging) | 6 | 18 | Gut — Bildgebung Befund/Observation, Pathologie, BI-RADS, Staging via TNM |
| 4.2–4.3 | DCIS und Risikoläsionen (B3) | 15 | 17 | Gut — Diagnose Maligne (DCIS), Diagnose Benigne (B3), Vakuumbiopsie, Nachresektion |
| 4.4 | Operative Therapie | 6 | 21 | Sehr gut — Operation (BET, Mastektomie, Axilla, Rekonstruktion), Implantat, Komplikation, OP-Planung |
| 4.5 | Pathologie | 6 | 13 | Sehr gut — Pathologie Befund/Präparat, IHC (ER/PR/HER2/Ki-67), Grading, Morphologie |
| 4.6 | Strahlentherapie | 12 | 36 | Gut — Strahlentherapie-Profil, Dosis, Boost, Fraktionierung; Nebenwirkungen über MII Onko AdverseEvent |
| 4.8 | Systemische Therapie | 6 | 40 | Gut — Systemtherapie Procedure + Medikation, Geplante Systemtherapie, Medikamenten-ValueSets |
| 5 | Rezidiv und metastasierte Erkrankung | 4 | 69 | Teilweise — Verlaufs-Observations, Fernmetastasen, Progression vorhanden; palliative Versorgungspfade noch nicht modelliert |
| 6 | Betreuung (Psychoonko, Reha, Nachsorge) | 7 | 34 | Lückenhaft — Psychoonkologie und Rehabilitation nicht im Senologie-Scope; Nachsorge über Verlaufs-Observations |
| 7 | Spezielle Situationen | 7 | 69 | Teilweise — Männliches Mammakarzinom (Fall 8) abgebildet; Schwangerschaft, ältere Patientinnen, hereditäres Karzinom teilweise über Familienanamnese/BRCA (Fall 10) |
| 8 | Qualitätsindikatoren | 19 | 36 | Gut — 17 QIs als CQL-Measures, Kennzahlen via OncoBox-Mapping |

### Gut abgedeckte Bereiche

Die folgenden klinischen Domänen sind durch Senologie-Profile oder referenzierte MII-Profile vollständig oder weitgehend abgebildet:

- **Diagnostik**: Mammographie, Sonographie, MRT, Stanzbiopsie, Vakuumbiopsie, BI-RADS, ACR
- **Pathologie**: ICD-O-3 Morphologie, Grading, Rezeptorstatus (ER/PR/HER2), Ki-67, Lymphknotenstatus, B3-Läsionen
- **TNM-Staging**: Klinisch (cTNM), pathologisch (pTNM), nach Neoadjuvanz (ypTNM), Rezidiv (rTNM), mit allen Kategorien (T/N/M/L/V/Pn/UICC)
- **Operative Therapie**: BET, Mastektomie, Axilladissektion, SLNB, Rekonstruktion, Implantat, Subprozeduren, R-Status, Clavien-Dindo-Komplikation
- **Systemische Therapie**: Chemotherapie, endokrine Therapie, zielgerichtete Therapie (Trastuzumab, Pertuzumab), Immuntherapie (Pembrolizumab), Zyklustracking
- **Strahlentherapie**: Dosis, Boost, Fraktionierung, Applikationsart, Nebenwirkungen (CTCAE)
- **Tumorkonferenz**: Interdisziplinäre Empfehlungen mit Therapieart-Slices
- **Genexpressionstests**: Oncotype DX, MammaPrint, Prosigna, EndoPredict mit Score und Risikoklasse
- **Qualitätsindikatoren**: 17 S3-QIs als CQL-Library, 20 DKG-Kennzahlen über OncoBox-Mapping

### Bekannte Lücken

| Leitlinien-Bereich | Gap | Erläuterung |
|---|---|---|
| Psychoonkologische Versorgung | Kein Profil | Screening (PHQ, GAD), Interventionen — nicht senologiespezifisch, ggf. über PRO-Modul |
| Rehabilitation | Kein Profil | Reha-Ziele, Nachsorge-Schema — außerhalb des Senologie-Scope |
| Palliative Versorgung | Kein Profil | Palliativmedizinische Dokumentation — eigenständiges Thema |
| Komplementärmedizin | Kein Profil | Kap. 6 der S3-Leitlinie — bewusst nicht abgebildet |
| Risikokalkulation (IBIS, BOADICEA) | Kein Profil | Rechnerische Risikomodelle — RiskAssessment vorhanden (Genexpressionstest), aber nicht für polygene Risiko-Scores |
| Schwangerschafts-assoziiertes MaCa | Teilweise | Gynäkologische Anamnese + Schwangerschaftsstatus über IPS, therapiespezifische Anpassungen nicht modelliert |
| Mamma-Ca im Alter | Teilweise | Geriatrisches Assessment nicht im Scope; Therapieentscheidungen über Tumorboard abbildbar |
| Nachsorge-Schema | Teilweise | Verlaufs-Observations vorhanden, aber kein strukturiertes Nachsorge-Protokoll (PlanDefinition) |

### Weiterentwicklung

Die Leitlinien-Annotation wird mit jeder Version des Kerndatensatzes aktualisiert. Rückmeldungen zur Abdeckung — insbesondere zu den identifizierten Lücken — sind ausdrücklich erwünscht (siehe [Offene Fragen](offene-fragen.html)).

Bei Aktualisierung der S3-Leitlinie werden die Annotationen überprüft und angepasst. Die detaillierten Annotationen pro Empfehlung (YAML-Format mit Datenobjekten, Terminologien und Mapping-Status) sind im [GitHub-Repository](https://github.com/BIH-CEI/SenologieOnFHIR/tree/main/input/pagecontent/leitlinien-annotation) verfügbar.
