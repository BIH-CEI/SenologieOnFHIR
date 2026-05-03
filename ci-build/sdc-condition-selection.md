# SDC Bezugsdiagnose-Auswahl - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Datenmodell**](datenmodell.md)
* **SDC Bezugsdiagnose-Auswahl**

## SDC Bezugsdiagnose-Auswahl

### SDC Condition-Auswahl (Bezugsdiagnose)

Bei Patientinnen mit **synchronen bilateralen Mammakarzinomen** existieren zwei aktive Condition-Ressourcen mit unterschiedlicher Seitenlokalisation (`bodySite`). Jede Therapie-Dokumentation (OP, Systemtherapie, Strahlentherapie, Tumorboard) muss die konkrete Bezugsdiagnose auswählen.

#### Pattern: SDC candidateExpression + choiceColumn

Das Pattern nutzt zwei SDC-Erweiterungen auf einem `reference`-Item:

1. **`sdc-questionnaire-candidateExpression`**: FHIR-Query, die alle aktiven Mamma-Conditions der Patientin liefert
1. **`sdc-questionnaire-choiceColumn`**: Spalten-Definition für die Auswahl-Darstellung (ICD-10-Code + Seite)

```
item: "bezugsdiagnose"
  type: reference
  extension: sdc-questionnaire-candidateExpression
    language: application/x-fhir-query
    expression: Condition?patient=&code=254837009&clinical-status=active
  extension: sdc-questionnaire-choiceColumn (ICD-10)
    path: code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code
    label: "ICD-10"
    forDisplay: false
  extension: sdc-questionnaire-choiceColumn (Seite)
    path: bodySite.coding.first().display
    label: "Seite"
    forDisplay: true

```

#### Anwendung in Questionnaires

Das Pattern ist in folgenden Questionnaires implementiert:

| | | |
| :--- | :--- | :--- |
| Postoperative Dokumentation | Procedure | `reasonReference` |
| OP Planung | ServiceRequest | `reasonReference` |
| Tumorboard | CarePlan | `addresses` |
| Klinische Untersuchung | Observation | `focus` |
| Systemtherapie | Procedure | `reasonReference` |

#### Template-based Extraction

Die ausgewählte Condition-Referenz wird via `sdc-questionnaire-templateExtractValue` in die contained Template-Ressource extrahiert:

```
reasonReference.reference = "placeholder"
reasonReference.reference.extension:
  url: sdc-questionnaire-templateExtractValue
  valueString: "item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

```

#### Verhalten bei unilateralem Karzinom

Bei nur einer aktiven Condition wird diese automatisch als einzige Option angeboten. Der Workflow bleibt identisch – keine Sonderbehandlung nötig.

#### SM-Kompatibilität (OncoBox Brust)

Der Orchestrator (`SenologieToOncoBoxBrust.map`) iteriert über alle Conditions mit ICD-10 C50/D05 und erzeugt pro Condition einen separaten Primaerfall-Block. Bei bilateralem Karzinom entstehen korrekt zwei Primaerfälle mit unterschiedlicher `seitenlokalisation`.

**Bekannte Einschränkung**: Die Sub-Maps (`MapPrimaerfall`) filtern Procedures/Observations aktuell nicht nach `reasonReference` auf die jeweilige Condition. Bei bilateralem Karzinom erscheinen daher alle Therapien unter beiden Primaerfällen. Eine zukünftige Erweiterung sollte die Zuordnung über `reasonReference` / `focus` einschränken.

