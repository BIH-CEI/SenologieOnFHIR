# Erfassung - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Anwendungsfälle**](anwendungsfaelle-uebersicht.md)
* **Erfassung**

## Erfassung

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

| | | |
| :--- | :--- | :--- |
| OP-Dokumentation | Intra-/postoperative Dokumentation | Procedure, Device, Observation (Komplikation) |
| OP-Planung | Präoperative Planung | ServiceRequest |
| Diagnose | Primärdiagnose und Staging | Condition |
| Bildgebung | Mammographie, Sonographie, MRT | DiagnosticReport, Observation |

### Formular-First: Warum?

Der Formular-First-Ansatz löst ein zentrales Problem der FHIR-Profilierung in der klinischen Praxis:

* **Kliniker denken in Formularen**, nicht in FHIR-Ressourcen. Ein OP-Bericht ist ein zusammenhängendes Dokument, keine Sammlung von Procedures und Observations.
* **Formulare sichern Datenqualität** durch Validierung, Pflichtfelder und kontextabhängige Anzeigelogik (enableWhen).
* **Extraktion ist deterministisch** — die Definition-based Extraction bildet jedes Formularfeld eindeutig auf ein FHIR-Element ab.
* **Rückkanal**: Über `sdc-questionnaire-initialExpression` werden bestehende Patientendaten (z.B. Diagnose) beim Öffnen des Formulars vorbelegt.

### Operationsdokumentation als Beispiel

Eine OP-Dokumentation erzeugt mehrere FHIR-Ressourcen:

* **Hauptprozedur** (Procedure) — übergeordneter Eingriff
* **Subprozeduren** (Procedure) — z.B. Resektion links, Axilladissektion, Rekonstruktion
* **Implantat** (Device) — falls Implantat eingesetzt
* **Komplikation** (Observation) — mit Clavien-Dindo-Grad
* **Drainage, Verband** — als Nachsorge-Informationen

Die Subprozeduren referenzieren die Hauptprozedur über `Procedure.partOf`. Seitengetrennte Eingriffe werden als separate Prozeduren abgebildet.

### Technische Umsetzung

Die Questionnaires nutzen folgende SDC-Features:

| | |
| :--- | :--- |
| `sdc-questionnaire-launchContext` | Patient- und Encounter-Kontext beim Öffnen |
| `sdc-questionnaire-initialExpression` | Vorbelegung mit bestehenden Daten (FHIRPath) |
| `sdc-questionnaire-itemExtractionContext` | Ziel-Ressource für Extraction |
| `definition` | Mapping Formularfeld → FHIR-Element |
| `enableWhen`/`enableBehavior` | Kontextabhängige Anzeige |
| `answerValueSet` | Terminologiebindung |

### Quellsystem

Die Formulare werden aktuell im klinischen Dokumentationssystem **dotbase** gepflegt und als SDC-Questionnaires exportiert. Das Senologie-Modul definiert die FHIR-Zielstruktur, in die die Formulardaten extrahiert werden.

