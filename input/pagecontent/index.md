# MII KDS Modul Senologie

Willkommen beim Implementation Guide für das **Kerndatensatz-Modul Senologie** der Medizininformatik-Initiative (MII).

Dieses Modul beschreibt die FHIR-Profile für die strukturierte Dokumentation der Brustkrebsversorgung (Senologie) am Berlin Institute of Health (BIH) der Charité.

### Ressourcenmodell

<div>
<img src="senologie-ressourcenmodell.png" alt="FHIR Ressourcenmodell Senologie" style="width:100%"/>
<p><em>FHIR Ressourcenmodell Senologie — Klinischer Versorgungspfad Mammakarzinom</em></p>
</div>

### Architektur: Vom Formular zur Analyse

Die Senologie-Spezifikation deckt den gesamten Datenpfad ab — von der klinischen Erfassung bis zur analytischen Auswertung:

```
dotbase Formular (Klinische Dokumentation)
        ↓
FHIR Questionnaire (SDC Template-Based)
        ↓  QuestionnaireResponse
Template-Based Extraction ($extract)
        ↓  Contained Resource als Template
FHIR Ressourcen (Condition, Procedure, Observation, ...)
        ↓
ViewDefinition (SQL-on-FHIR v2.0)
        ↓
Analytische Auswertung (SQL)
```

**Datenerfassung:** Die klinische Dokumentation erfolgt über [dotbase](https://dotbase.org)-Formulare. Jedes Formular wird als [SDC Questionnaire](https://hl7.org/fhir/uv/sdc/) mit Template-Based Extraction abgebildet — die Formularstruktur orientiert sich an den dotbase-Fragebögen, die Extraction erzeugt direkt die konformen FHIR-Ressourcen.

**FHIR-Profile:** Die erzeugten Ressourcen basieren wo möglich auf MII-Elternprofilen (Onkologie, Pathologie, Bildgebung). Nur dort, wo FHIR oder MII kein passendes Element bieten, werden eigene Extensions definiert (aktuell 10 Senologie-spezifische Extensions).

**Analyse:** Für jedes Profil wird eine [SQL-on-FHIR ViewDefinition](https://build.fhir.org/ig/FHIR/sql-on-fhir-v2/) bereitgestellt, die die verschachtelten FHIR-Strukturen in flache Tabellen projiziert.

### Klinische Domänen

| Domäne | FHIR-Ressource | Profil | dotbase Formular |
|---|---|---|---|
| Diagnose | Condition | Senologie Diagnose | Diagnose |
| Tumorlokalisation | BodyStructure | Senologie Tumorlokalisation | — (abgeleitet) |
| Bildgebung | DiagnosticReport, Observation | Senologie Bildgebung | Bildgebung Mamma V1.0 |
| Pathologie | DiagnosticReport, Specimen | Senologie Pathologie Befund | Pathologie |
| Operation | Procedure | Senologie Operation | — (OP-Dokumentation) |
| OP Planung | ServiceRequest | Senologie OP Planung | OP Planung ärztlich V1.0 |
| Komplikation | Observation | Senologie Operative Komplikation | Operative Komplikation(en) V2.0 |
| Strahlentherapie | Procedure | Senologie Strahlentherapie | Strahlentherapie ESP-PECS |
| Systemtherapie | Procedure, MedicationStatement | Senologie Systemtherapie | Systemtherapie |
| Geplante Therapie | MedicationRequest | Senologie Geplante Systemtherapie | Geplante Systemtherapie |
| Genexpression | RiskAssessment, Observation | Senologie Genexpressionstest | — |
| Tumorboard | ClinicalImpression | Senologie Tumorboard Empfehlung | Tumorkonferenz V2.0 |

### MII-Abhängigkeiten

Dieses Modul erbt Profile aus drei MII-Kerndatensatz-Modulen:

- **[MII Onkologie](https://simplifier.net/medizininformatikinitiative-modulonkologie)** — Strahlentherapie, Systemtherapie, Mamma-Operation, Diagnose
- **[MII Pathologie](https://simplifier.net/medizininformatikinitiative-modulpathologie)** — Patho Report, Patho Specimen
- **[MII Bildgebung](https://simplifier.net/medizininformatikinitiative-modulbildgebung)** — Körperstruktur (BodyStructure)

### Übersicht

- [Artifacts](artifacts.html) – Alle FHIR-Artefakte (Profile, Extensions, ValueSets, CodeSystems, Questionnaires)
