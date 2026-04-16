# Anwendungsfall: Auswertung

### Überblick

Die strukturierten FHIR-Daten des Senologie-Moduls ermöglichen die Sekundärnutzung für Versorgungsforschung, Qualitätssicherung und klinische Studien. Die einheitliche Profilierung stellt sicher, dass Daten standortübergreifend vergleichbar und auswertbar sind.

### Auswertungsszenarien

#### 1. Qualitätsindikatoren (DKG-Zertifizierung)

Zertifizierte Brustzentren müssen jährlich Qualitätsindikatoren nach DKG-Vorgaben erheben. Die strukturierten Daten ermöglichen eine automatisierte Berechnung:

| Indikator | Datengrundlage (Profile) |
|---|---|
| Anteil brusterhaltender Operationen | Senologie_Operation (Procedure) |
| Rate an R0-Resektionen | Senologie_Pathologie_Befund (DiagnosticReport) |
| Hormonrezeptor-Bestimmungsrate | Senologie_Pathologie_Befund (ER, PR, HER2, Ki-67) |
| Anteil Tumorkonferenz-Vorstellung | Senologie_Tumorboard_Empfehlung (CarePlan) |
| Postoperative Komplikationsrate | Senologie_Operative_Komplikation (Observation) |
| Systemtherapie-Adhärenz | Senologie_Systemtherapie_Procedure (Procedure) |

#### 2. Versorgungsforschung

Die FHIR-Daten können über MII-Datenintegrationszentren für standortübergreifende Versorgungsforschung bereitgestellt werden:

- **Behandlungspfadanalysen**: Abgleich des tatsächlichen Versorgungspfads mit Leitlinienempfehlungen über die Sequenz von Diagnose → Tumorkonferenz → Therapie
- **Outcome-Analysen**: Verknüpfung von Therapiedaten (Operation, Systemtherapie, Strahlentherapie) mit Komplikationen und Verlaufsdiagnosen
- **Risikostratifizierung**: Korrelation von Genexpressionstestergebnissen mit Therapieentscheidungen und Outcomes
- **Zeitanalysen**: Time-to-treatment, Diagnoseverzögerungen, Therapiedauern

#### 3. Klinische Studien

Das Modul unterstützt die Rekrutierung und Datenbereitstellung für klinische Studien:

- **Machbarkeitsabfragen**: Identifikation geeigneter Patientinnen über strukturierte Einschlusskriterien (Diagnose, Stadium, Rezeptorstatus, Vortherapien)
- **Datenexport**: Bereitstellung studienrelevanter Daten in FHIR-Format
- **Studienteilnahme-Tracking**: Dokumentation über ResearchSubject *(geplant)*

#### 4. Leitlinien-Compliance

Durch die Annotation der S3-Leitlinie mit FHIR-Datenpunkten kann die Leitlinien-Adhärenz systematisch überprüft werden:

- Werden alle empfohlenen Diagnostikschritte durchgeführt?
- Entspricht die Therapieempfehlung der Tumorkonferenz den Leitlinien?
- Werden Genexpressionstests leitliniengerecht eingesetzt?

### Abfragemuster

Beispielhafte FHIR-Abfragen für typische Auswertungen:

```
# Alle Patientinnen mit triple-negativem Mammakarzinom
GET Condition?code=http://snomed.info/sct|254837009
  &_has:Observation:subject:code=http://loinc.org|85337-4  # ER-negativ
  &_has:Observation:subject:code=http://loinc.org|85339-0  # PR-negativ
  &_has:Observation:subject:code=http://loinc.org|85319-2  # HER2-negativ

# Alle Operationen mit Komplikationen Clavien-Dindo ≥ III
GET Observation?code=clavien-dindo
  &value-concept=clavien-dindo-III,clavien-dindo-IV,clavien-dindo-V
  &_include=Observation:focus  # zugehörige Prozedur
```

### Automatisierung durch CQL

Die Auswertungen (insbesondere Qualitätsindikatoren und Leitlinien-Compliance) können in zukünftigen Versionen dieses IGs durch die [Clinical Quality Language (CQL)](http://cql.hl7.org/) automatisiert werden. CQL ermöglicht die formale Definition von Qualitätsmaßen und Entscheidungslogik direkt auf FHIR-Ressourcen, sodass Kennzahlen reproduzierbar und maschinenlesbar berechnet werden können.

Eine erste CQL-Bibliothek mit den 17 Qualitätsindikatoren der S3-Leitlinie findet sich unter [`input/cql/SenologieQualitaetsindikatoren.cql`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/cql/SenologieQualitaetsindikatoren.cql). Sie ist gegen die synthetische 12-Patientinnen-Kohorte lauffähig (HAPI, Port 8095, Endpoint `POST /fhir/$cql`).

### SQL on FHIR ViewDefinitions

Ergänzend zu CQL stellt das IG sechs [SQL-on-FHIR v2](https://sql-on-fhir.org/) `ViewDefinition`-Ressourcen bereit. Sie definieren flache, tabellarische Projektionen (Spalten, `where`-Filter, `forEach`-Expansion) auf die Kerndatensätze und sind damit die Grundlage für Kohortenaufbau, Data-Lake-Persistierung (Parquet/Delta) und BI-Auswertungen (Superset, Metabase, Tableau).

| ViewDefinition | Ressourcen-Basis | Zweck |
|---|---|---|
| [`PatientKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-PatientKohorte.json) | Patient | Demographika (id, name, gender, birthDate, age, city) |
| [`DiagnoseKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-DiagnoseKohorte.json) | Condition | Diagnose inkl. ICD-10, SNOMED, Lateralität, UICC-Stadium |
| [`OperationenKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-OperationenKohorte.json) | Procedure | OP-Art (BET/Mastektomie/SNB/ALND), R-Status, Intention |
| [`PathologieKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-PathologieKohorte.json) | DiagnosticReport | Pathologie-Befunde mit IHC (ER, PR, HER2, Ki-67), Grading |
| [`SystemtherapieKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-SystemtherapieKohorte.json) | Procedure | Systemtherapien (CH/HO/IM/ZT), Intention, Beginn/Ende, Protokoll |
| [`TumorboardKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-TumorboardKohorte.json) | CarePlan | Tumorboard-Empfehlungen mit Aktivitäten (Therapieempfehlungen) |

Die kanonischen URLs folgen dem Schema `http://fhir.bih-charite.de/kds-senologie/ViewDefinition/{Name}`. Ausführung z.B. über [Pathling](https://pathling.csiro.au/), [sof-js](https://github.com/FHIR/sql-on-fhir-v2/tree/master/sof-js) oder direkt gegen eine HAPI-Instanz.

### Interaktive Analyse

Ein lauffähiges Jupyter-Notebook [`notebooks/senologie-analyse.ipynb`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/notebooks/senologie-analyse.ipynb) demonstriert die End-to-End-Auswertung der oben genannten ViewDefinitions gegen eine lokale HAPI-Instanz (Port 8095, 12 synthetische Patientinnen, 177 Ressourcen). Es zeigt 7 Beispielanalysen:

1. Fallzahl pro Subtyp (HR+/HER2-, HER2+, TNBC, DCIS)
2. BET-Rate (brusterhaltend vs. Mastektomie)
3. R0-Rate aus OP-Outcomes
4. Altersverteilung der Patientinnen (Boxplot)
5. Therapie-Mix pro Subtyp (Chemo / endokrin / zielgerichtet / Immun)
6. Time-to-Treatment (Diagnose → OP) Verteilung
7. Crosstab Subtyp × OP-Art

Verbindungsaufbau zu einem FHIR-Server aus Python heraus:

```python
import requests, pandas as pd

FHIR_BASE = 'http://localhost:8095/fhir'
bundle = requests.get(f'{FHIR_BASE}/Condition?_count=200',
                      headers={'Accept': 'application/fhir+json'}).json()
df = pd.json_normalize([e['resource'] for e in bundle.get('entry', [])])
```

Das Notebook ist so aufgebaut, dass es **keine externen Laufzeiten** (Pathling, Spark, kommerzielle Tools) benötigt — ein eingebauter, minimaler FHIRPath-Evaluator wendet die ViewDefinitions direkt auf die JSON-Ressourcen an und liefert `pandas.DataFrame`-Ausgaben. Für produktive Datenmengen wird der Einsatz einer vollwertigen SQL-on-FHIR-Runtime empfohlen.

### Datenschutz und Governance

Die Sekundärnutzung erfolgt ausschließlich über die etablierten MII-Governance-Strukturen:

- Pseudonymisierung durch das Datenintegrationszentrum
- Nutzungsanträge über das MII-Forschungsdatenportal
- Broad Consent als Rechtsgrundlage
