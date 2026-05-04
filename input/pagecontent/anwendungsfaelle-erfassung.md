# Anwendungsfall: Erfassung

### Überblick

Die Datenerfassung im Kerndatensatz Senologie folgt dem **Formular-First-Prinzip**: Klinische Dokumentation erfolgt über strukturierte SDC-Questionnaires, die den gewohnten klinischen Workflow abbilden. Im Hintergrund werden die Formulardaten über **Template-based Extraction** automatisch in domänenbasierte FHIR-Ressourcen überführt.

Jedes Formular enthält ein oder mehrere **Blueprints** — contained FHIR-Ressourcen, die als Vorlage für die Extraktion dienen. Ein einzelnes Formular kann so mehrere Ziel-Ressourcen gleichzeitig erzeugen (z.B. eine Procedure und eine Observation aus einer OP-Dokumentation).

### Klinischer Workflow

Die Erfassung folgt dem klinischen Versorgungspfad. Die Diagnose bildet den Ankerpunkt, an den alle weiteren Befundungen und Therapien geknüpft werden:

```
  ┌──────────────────────────────────────────────────────────────────────┐
  │                        1. Diagnose anlegen                         │
  │              Erstanamnese → Diagnose-Formular → Condition          │
  └──────────────────────┬─────────────────────────────────────────────┘
                         │
                         │ Bezugsdiagnose
                         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │                     2. Befundungen hinzufügen                      │
  │                                                                    │
  │   ┌─────────────────┐  ┌──────────────┐  ┌─────────────────────┐   │
  │   │ Klinische       │  │ Bildgebung   │  │ Pathologie          │   │
  │   │ Untersuchung    │  │              │  │                     │   │
  │   │ → Observation   │  │ → Diagnostic │  │ → DiagnosticReport  │   │
  │   │                 │  │   Report     │  │ → Observation       │   │
  │   │                 │  │ → Observation│  │ → Specimen          │   │
  │   └─────────────────┘  └──────────────┘  └─────────────────────┘   │
  └──────────────────────┬─────────────────────────────────────────────┘
                         │
                         │ Bezugsdiagnose / -operation
                         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │                    3. Therapie dokumentieren                        │
  │                                                                    │
  │   ┌──────────────┐  ┌────────────────┐  ┌───────────────────────┐  │
  │   │ OP-Planung   │  │ Postoperativ   │  │ Tumorboard            │  │
  │   │ → Service    │  │ → Procedure    │  │ → CarePlan            │  │
  │   │   Request    │  │ → Device       │  │                       │  │
  │   │              │  │ → Observation   │  │                       │  │
  │   └──────────────┘  └────────────────┘  └───────────────────────┘  │
  │                                                                    │
  │   ┌──────────────────────┐  ┌───────────────────────────────────┐  │
  │   │ Systemtherapie       │  │ Strahlentherapie                  │  │
  │   │ → Procedure          │  │ → Procedure                       │  │
  │   │ → MedicationStatement│  │                                   │  │
  │   └──────────────────────┘  └───────────────────────────────────┘  │
  └──────────────────────┬─────────────────────────────────────────────┘
                         │
                         ▼
  ┌──────────────────────────────────────────────────────────────────────┐
  │                       4. Verlauf / Nachsorge                       │
  │                   Tumorstatus, Follow-Up → Observation             │
  └──────────────────────────────────────────────────────────────────────┘
```

### Wie ein Formular funktioniert

Jedes Formular durchläuft beim Öffnen und Ausfüllen vier Phasen:

```
  ┌─────────────┐     ┌───────────────┐     ┌───────────────┐     ┌──────────────────┐
  │ 1. Kontext  │     │ 2. Vor-       │     │ 3. Formular   │     │ 4. Template-     │
  │    wählen   │────►│    befüllung   │────►│    ausfüllen   │────►│    based         │
  │             │     │               │     │               │     │    Extraction    │
  └─────────────┘     └───────────────┘     └───────────────┘     └──────────────────┘
        │                    │                     │                       │
  Bezugsdiagnose       initialExpression      enableWhen            Blueprints
  Bezugsoperation      aus bestehenden        answerValueSet        (contained
  Patient/Encounter    FHIR-Ressourcen        Validierung           Templates)
                                                                         │
                                                                         ▼
                                                                  ┌──────────────┐
                                                                  │ FHIR-        │
                                                                  │ Ressourcen   │
                                                                  │ (1..n)       │
                                                                  └──────────────┘
```

**Phase 1 — Kontextauswahl:** Beim Öffnen eines Formulars wird der Patient- und Encounter-Kontext übergeben (`launchContext`). Für Befundungen und Therapien wählt der Anwender die **Bezugsdiagnose** (und ggf. die Bezugsoperation) aus — damit ist jede Dokumentation eindeutig einer Diagnose zugeordnet.

**Phase 2 — Vorbefüllung:** Bestehende Patientendaten werden über `initialExpression` (FHIRPath) automatisch in das Formular geladen — z.B. Name, Geburtsdatum, bereits erfasste Diagnosen. Das vermeidet Doppeleingaben und sichert Konsistenz.

**Phase 3 — Ausfüllen:** Der Kliniker dokumentiert im Formular. Kontextabhängige Felder erscheinen dynamisch (`enableWhen`) — z.B. B3-Detailtyp nur bei B3-Läsion, Implantatabfrage nur bei Rekonstruktion. Terminologie-gebundene Auswahllisten (`answerValueSet`) sichern die korrekte Kodierung.

**Phase 4 — Template-based Extraction:** Beim Absenden werden die Formulardaten über **Blueprints** in FHIR-Ressourcen überführt. Ein Blueprint ist eine contained FHIR-Ressource im Questionnaire, die als Vorlage dient — mit Platzhaltern, die durch die Formularantworten ersetzt werden. Ein Formular kann mehrere Blueprints enthalten und so mehrere Ressourcen gleichzeitig erzeugen.

### Blueprints: Vom Formular zu FHIR-Ressourcen

Ein Blueprint ist ein **contained Template** innerhalb des Questionnaires. Er definiert die Struktur der Ziel-Ressource und verwendet `templateExtractValue`-Ausdrücke, um Formularantworten in die richtigen Felder zu übernehmen.

Beispiel: Der Fragebogen *Postoperative Dokumentation* enthält zwei Blueprints:

| Blueprint | Ziel-Ressource | Profil |
|---|---|---|
| `postop-procedure-template` | Procedure | [Senologie_Operation](StructureDefinition-senologie-operation.html) |
| `postop-komplikation-template` | Observation | [Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.html) |

Die Bezugsdiagnose wird aus der Kontextauswahl übernommen und automatisch als `Procedure.reasonReference` in die erzeugte Ressource geschrieben.

### Formulare

| Formular | Klinischer Kontext | Blueprints → Ressourcen |
|---|---|---|
| [Erstanamnese](Questionnaire-senologie-erstanamnese.html) | Aufnahme, Vorgeschichte, gynäkologische Anamnese | Patient, Observation, FamilyMemberHistory |
| [Diagnose](Questionnaire-senologie-diagnose.html) | Primärdiagnose, Staging, Lokalisation | Condition |
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
- **Formulare sichern Datenqualität** durch Validierung, Pflichtfelder und kontextabhängige Anzeigelogik.
- **Blueprints machen die Extraktion transparent** — die Zielstruktur ist als contained Ressource im Questionnaire sichtbar, nicht in externem Code versteckt.
- **Mehrere Ressourcen aus einem Formular** — ein einziger Dokumentationsschritt kann beliebig viele FHIR-Ressourcen erzeugen, ohne dass der Kliniker davon etwas mitbekommt.
- **Bezugsdiagnose als roter Faden** — alle Befundungen und Therapien referenzieren die Diagnose, die der Kliniker beim Öffnen des Formulars auswählt.

### Technische Umsetzung

Die Questionnaires nutzen folgende SDC-Features:

| Feature | Verwendung |
|---|---|
| `sdc-questionnaire-launchContext` | Patient- und Encounter-Kontext beim Öffnen |
| `sdc-questionnaire-initialExpression` | Vorbelegung mit bestehenden Daten (FHIRPath) |
| `sdc-questionnaire-templateExtract` | Verweis auf contained Blueprint(s) |
| `sdc-questionnaire-templateExtractValue` | Mapping Formularantwort → Feld im Blueprint |
| `enableWhen` / `enableBehavior` | Kontextabhängige Anzeige |
| `answerValueSet` | Terminologiebindung |

### Quellsystem

Die Formulare werden als SDC-Questionnaires definiert und können in beliebigen FHIR-fähigen Dokumentationssystemen eingesetzt werden. Der Kerndatensatz definiert die FHIR-Zielstruktur (Profile), die Blueprints (contained Templates) und die Terminologie (ValueSets) — das Zusammenspiel dieser drei Komponenten macht die Extraktion vollständig reproduzierbar.
