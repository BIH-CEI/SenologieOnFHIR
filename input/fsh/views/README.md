# SQL on FHIR ViewDefinitions

Dieses Verzeichnis enthält [SQL on FHIR v2](https://sql-on-fhir.org/) `ViewDefinition`-Ressourcen für den Senologie-Kerndatensatz. ViewDefinitions beschreiben flache, tabellarische Projektionen auf FHIR-Ressourcen und sind die Grundlage für Analytics-Workflows (Qualitätsindikatoren, Versorgungsforschung, Kohortenbildung).

## Views

| Datei | Ressource | Zweck |
|---|---|---|
| `ViewDefinition-PatientKohorte.json`       | Patient          | Basis-Demographika aller Patientinnen |
| `ViewDefinition-DiagnoseKohorte.json`      | Condition        | Mamma-Diagnosen mit Staging/Grading |
| `ViewDefinition-OperationenKohorte.json`   | Procedure        | Brust-OPs kategorisiert (BET/Mastektomie/SNB/ALND) mit R-Status |
| `ViewDefinition-PathologieKohorte.json`    | DiagnosticReport | Pathologie-Befunde mit IHC (ER/PR/HER2/Ki-67) |
| `ViewDefinition-SystemtherapieKohorte.json`| Procedure        | Systemtherapien (CH/HO/IM/ZT) mit Intention, Beginn/Ende |
| `ViewDefinition-TumorboardKohorte.json`    | CarePlan         | Tumorboard-Empfehlungen |

## Canonical URLs

```
http://fhir.bih-charite.de/kds-senologie/ViewDefinition/{PatientKohorte|DiagnoseKohorte|OperationenKohorte|PathologieKohorte|SystemtherapieKohorte|TumorboardKohorte}
```

## Hinweise zur Verwendung

- `ViewDefinition` ist ein FHIR R5 / SQL-on-FHIR IG Typ. In diesem Projekt (FHIR R4) werden sie als reine JSON-Artefakte ausgeliefert und **nicht** über SUSHI in das IG eingebunden (sie liegen unter `input/fsh/views/`, nicht unter `input/resources/`, damit der IG-Publisher sie nicht als unbekannten Typ ablehnt).
- Ausführung der Views:
  - [Pathling](https://pathling.csiro.au/) (Java/Spark)
  - [SQL-on-FHIR Reference Implementation](https://github.com/FHIR/sql-on-fhir-v2) (JavaScript/Python)
  - [`sof-js` / `pysof`](https://github.com/FHIR/sql-on-fhir-v2/tree/master/sof-js) — reine JavaScript/Python-Runner
- Beispielhafte Auswertung: siehe `notebooks/senologie-analyse.ipynb`.

## Heuristiken

Mehrere Spalten (`art` in Operationen, `outcome=R0/R1/R2`, `er/pr/her2/grading` in Pathologie) werden **heuristisch** aus OPS-Präfixen bzw. aus dem `conclusion`-Freitext abgeleitet, da die aktuell geladenen Testdaten keine strukturierten Observation-Komponenten für IHC und R-Status enthalten. In produktiven Datensätzen sollten diese Felder durch separate Observations ersetzt werden und die Views entsprechend angepasst werden.
