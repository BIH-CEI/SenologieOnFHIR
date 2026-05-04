# Anwendungsfall: Erfassung

### Überblick

Die Datenerfassung im Senologie-Modul folgt dem **Formular-First-Prinzip**: Klinische Dokumentation erfolgt über strukturierte SDC-Questionnaires, die den gewohnten klinischen Workflow abbilden. Im Hintergrund werden die Formulardaten über **Definition-based Extraction** automatisch in domänenbasierte FHIR-Ressourcen überführt.

### Workflow

```
Kliniker                   SDC-Questionnaire              FHIR-Ressourcen
   │                            │                              │
   ├── füllt Formular aus ─────►│                              │
   │                            ├── Definition-based ─────────►│
   │                            │   Extraction                 │
   │                            │                              ├── Procedure
   │                            │                              ├── Observation
   │                            │                              ├── Device
   │                            │                              └── ...
```

### Formulare

Das Modul definiert SDC-Questionnaires für die zentralen Dokumentationsschritte:

| Formular | Klinischer Kontext | Extrahierte Ressourcen |
|---|---|---|
| [Erstanamnese](Questionnaire-senologie-erstanamnese.html) | Aufnahme, Vorgeschichte, gynäkologische Anamnese | Patient, Observation, FamilyMemberHistory |
| [Klinische Untersuchung](Questionnaire-senologie-klinische-untersuchung.html) | Brustuntersuchung, Tastbefund, LK-Status | Observation |
| [Bildgebung](Questionnaire-senologie-bildgebung.html) | Mammographie, Sonographie, MRT | DiagnosticReport, Observation |
| [Pathologie](Questionnaire-senologie-pathologie.html) | Histologie, Rezeptorstatus, Grading | DiagnosticReport, Observation, Specimen |
| [Tumorboard](Questionnaire-senologie-tumorboard.html) | Therapieempfehlung, interdisziplinäre Konferenz | CarePlan |
| [OP-Planung](Questionnaire-senologie-op-planung.html) | Präoperative Planung, Markierung | ServiceRequest |
| [Postoperativ](Questionnaire-senologie-postop.html) | Intra-/postoperative Dokumentation | Procedure, Device, Observation |
| [Systemtherapie](Questionnaire-senologie-systemtherapie.html) | Chemo, Immun, endokrine Therapie | Procedure, MedicationStatement |
| [Strahlentherapie](Questionnaire-senologie-strahlentherapie-quest.html) | Bestrahlung, Dosierung | Procedure |
| [Verlauf](Questionnaire-senologie-verlauf.html) | Nachsorge, Tumorstatus, Follow-Up | Observation |

### Formular-First: Warum?

Der Formular-First-Ansatz löst ein zentrales Problem der FHIR-Profilierung in der klinischen Praxis:

- **Kliniker denken in Formularen**, nicht in FHIR-Ressourcen. Ein OP-Bericht ist ein zusammenhängendes Dokument, keine Sammlung von Procedures und Observations.
- **Formulare sichern Datenqualität** durch Validierung, Pflichtfelder und kontextabhängige Anzeigelogik (enableWhen).
- **Extraktion ist deterministisch** — die Definition-based Extraction bildet jedes Formularfeld eindeutig auf ein FHIR-Element ab.
- **Rückkanal**: Über `sdc-questionnaire-initialExpression` werden bestehende Patientendaten (z.B. Diagnose) beim Öffnen des Formulars vorbelegt.

### Operationsdokumentation als Beispiel

Eine OP-Dokumentation erzeugt mehrere FHIR-Ressourcen:

- **Hauptprozedur** (Procedure) — übergeordneter Eingriff
- **Subprozeduren** (Procedure) — z.B. Resektion links, Axilladissektion, Rekonstruktion
- **Implantat** (Device) — falls Implantat eingesetzt
- **Komplikation** (Observation) — mit Clavien-Dindo-Grad
- **Drainage, Verband** — als Nachsorge-Informationen

Die Subprozeduren referenzieren die Hauptprozedur über `Procedure.partOf`. Seitengetrennte Eingriffe werden als separate Prozeduren abgebildet.

### Technische Umsetzung

Die Questionnaires nutzen folgende SDC-Features:

| Feature | Verwendung |
|---|---|
| `sdc-questionnaire-launchContext` | Patient- und Encounter-Kontext beim Öffnen |
| `sdc-questionnaire-initialExpression` | Vorbelegung mit bestehenden Daten (FHIRPath) |
| `sdc-questionnaire-itemExtractionContext` | Ziel-Ressource für Extraction |
| `definition` | Mapping Formularfeld → FHIR-Element |
| `enableWhen` / `enableBehavior` | Kontextabhängige Anzeige |
| `answerValueSet` | Terminologiebindung |

### Quellsystem

Die Formulare werden als SDC-Questionnaires definiert und können in beliebigen FHIR-fähigen Dokumentationssystemen eingesetzt werden. Das Senologie-Modul definiert die FHIR-Zielstruktur, in die die Formulardaten extrahiert werden.
