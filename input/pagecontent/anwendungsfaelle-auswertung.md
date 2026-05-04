# Anwendungsfall: Auswertung

### Überblick

Die strukturierten FHIR-Daten des Kerndatensatz Senologie ermöglichen die Sekundärnutzung für Versorgungsforschung, Qualitätssicherung und klinische Studien. Die einheitliche Profilierung stellt sicher, dass Daten standortübergreifend vergleichbar und auswertbar sind.

<div>
<img src="auswertung-pipeline.svg" alt="Auswertungspipeline" style="width:100%"/>
<p><em>Auswertungspipeline — Kohortendefinition über Ein-/Ausschlusskriterien, tabellarische Projektion via ViewDefinitions, Kalkulation über CQL oder SQL</em></p>
</div>

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

Die kanonischen URLs folgen dem Schema `https://www.senologie.org/fhir/ViewDefinition/{Name}`. Ausführung z.B. über [Pathling](https://pathling.csiro.au/), [sof-js](https://github.com/FHIR/sql-on-fhir-v2/tree/master/sof-js) oder direkt gegen eine HAPI-Instanz.

### Ausführung mit Pathling

[Pathling](https://pathling.csiro.au/) ist die von CSIRO als Open Source (Apache-2.0) entwickelte SQL-on-FHIR-Engine. Sie wird im IG als **empfohlene** Laufzeit für die sechs ViewDefinitions unterstützt; eine kommerzielle Lizenz ist nicht erforderlich. Das Repository stellt dafür zwei Integrationsvarianten bereit:

**Variante A — Docker-Server (empfohlen für Teams / Shared Setup).**
Ein eigenständiges Compose-File `docker-compose.pathling.yaml` startet einen Pathling-FHIR-Server auf Port `8090`. Der Datenimport erfolgt über ein kleines Python-Skript, das die 177 Beispiel-Ressourcen aus `fsh-generated/resources/` per FHIR-REST in die Pathling-Instanz lädt:

```bash
docker compose -f docker-compose.pathling.yaml up -d
python3 scripts/load-to-pathling.py
```

Anschließend stehen die ViewDefinitions über die FHIR-Operation `POST /ViewDefinition/$run` zur Verfügung und können sowohl aus dem Jupyter-Notebook heraus als auch von BI-Tools oder CI-Pipelines abgefragt werden.

**Variante B — Python-Bibliothek (lokale Ausführung, ohne Docker).**
Für einzelne Analysen und reproduzierbare Notebooks genügt die Pathling-Python-Bibliothek, die ein eingebettetes Spark betreibt und die Bundles direkt aus dem Dateisystem liest:

```bash
pip install pathling pandas
```

```python
from pathling import PathlingContext

pc   = PathlingContext.create()
data = pc.read.bundles("../fsh-generated/resources/",
                       resource_types=["Patient", "Condition", "Procedure",
                                       "Observation", "DiagnosticReport", "CarePlan"])
for name, vd in VIEWS.items():
    df[name] = pc.view.execute(vd, data).toPandas()
```

Beide Varianten führen die **sechs** ViewDefinitions identisch aus; die im Notebook (`notebooks/senologie-analyse.ipynb`) gezeigten Auswertungen sind dadurch unverändert reproduzierbar, unabhängig von der gewählten Engine.

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

Das Notebook bietet drei austauschbare Ausführungsmodi, die oben über die Variable `EXECUTION_MODE` gewählt werden — die nachfolgenden Analysezellen sind modusunabhängig:

1. **`"docker"` — Pathling FHIR Server** *(empfohlen)*: die sechs ViewDefinitions werden per `POST /ViewDefinition/$run` gegen den mit `docker-compose.pathling.yaml` gestarteten Pathling-Container ausgeführt.
2. **`"python"` — Pathling Python-Bibliothek**: lokale Ausführung über `PathlingContext` mit eingebettetem Spark; es ist kein Docker nötig (`pip install pathling`).
3. **`"custom"` — eingebauter FHIRPath-Mini-Runner**: Fallback ohne Pathling/Spark, nutzt den HAPI-Testserver oder direkt die JSON-Ressourcen aus `fsh-generated/resources/`.

Für produktive Datenmengen wird der Einsatz von Pathling (Modus 1 oder 2) empfohlen; der Custom-Runner ist bewusst als leichtgewichtige Alternative für Demo- und CI-Szenarien erhalten. Die Schritt-für-Schritt-Anleitung für alle drei Modi findet sich unter [`notebooks/README.md`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/notebooks/README.md).

### Datenschutz und Governance

Die Sekundärnutzung erfolgt ausschließlich über die etablierten MII-Governance-Strukturen:

- Pseudonymisierung durch das Datenintegrationszentrum
- Nutzungsanträge über das MII-Forschungsdatenportal
- Broad Consent als Rechtsgrundlage
