# Datenbereitstellung und Testumgebungen

Der Kerndatensatz Senologie stellt neben den Profilen und Terminologien auch eine vollständige Testinfrastruktur bereit, um die Implementierung in realen Systemen zu erleichtern.

### Synthetische Testdaten

Die [12 synthetischen Testpatientinnen](testpatientinnen.html) (210+ FHIR-Instanzen) decken alle klinisch relevanten Szenarien ab: alle Brustkrebs-Subtypen, Stadien 0–IV, benigne und B3-Befunde, neoadjuvante und adjuvante Therapie, Komplikationen, Implantate, BRCA-Mutation, männliches Mammakarzinom. Jeder Fall enthält vollständig verknüpfte FHIR-Ressourcen (Patient → Diagnose → Bildgebung → Pathologie → Therapie → Verlauf).

Die Testdaten sind als FSH-Beispiele im IG enthalten und können direkt in einen FHIR-Server geladen werden.

### Verfügbare FHIR-Server

Für die Erprobung des Kerndatensatzes stehen drei Docker-basierte Testumgebungen bereit. Alle Docker-Compose-Dateien, Import-Skripte und Testdaten sind im [GitHub-Repository](https://github.com/BIH-CEI/SenologieOnFHIR) frei verfügbar.

| Server | Port | Lizenz | Schwerpunkt |
|---|---|---|---|
| **HAPI FHIR** | 8095 | **Open Source** (Apache-2.0), keine Registrierung | CQL-Auswertung (`$cql`, `$evaluate-measure`), Standard FHIR REST |
| **Pathling** | 8091 | **Open Source** (Apache-2.0), keine Registrierung | FHIRPath-basierte Analysen (`$extract`, `$aggregate`), Apache-Spark-Engine |
| **Aidbox** | 8888 | **Kostenlose Lizenz** erforderlich ([aidbox.app](https://aidbox.app/)) | SQL on FHIR ViewDefinitions (`$run`, `$materialize`), FHIR Schema Validierung |

{:.stu-note}
**HAPI FHIR** und **Pathling** können ohne Registrierung oder Lizenz direkt aus dem Repository gestartet werden. Für **Aidbox** ist eine individuelle (kostenlose) Lizenz erforderlich, die unter [aidbox.app](https://aidbox.app/) beantragt werden kann. Die Lizenzdatei (`.env`) ist nicht im Repository enthalten.

#### HAPI FHIR (Open Source, empfohlen für CQL)

```bash
git clone https://github.com/BIH-CEI/SenologieOnFHIR.git
cd SenologieOnFHIR
docker compose up -d hapi-fhir-server fhir-postgres
# Daten laden (Python 3 erforderlich):
python3 -c "
import json, glob, urllib.request
for f in sorted(glob.glob('fsh-generated/resources/*.json')):
    r = json.load(open(f))
    rt, rid = r.get('resourceType'), r.get('id')
    if rt and rid and 'Fall' in rid:
        urllib.request.urlopen(urllib.request.Request(
            f'http://localhost:8095/fhir/{rt}/{rid}',
            data=json.dumps(r).encode(), method='PUT',
            headers={'Content-Type': 'application/fhir+json'}))
"
```

#### Pathling (Open Source, empfohlen für Analysen)

```bash
docker compose -f docker-compose.pathling.yaml up -d
python3 scripts/load-to-pathling.py
```

#### Aidbox (SQL on FHIR ViewDefinitions, kostenlose Lizenz nötig)

```bash
# 1. Lizenz beantragen unter https://aidbox.app/
# 2. .env anlegen:
echo "AIDBOX_LICENSE=<ihr-jwt-token>" > .env
# 3. Starten:
docker compose up -d
```

Aidbox bietet nativen SQL-on-FHIR-Support: die ViewDefinitions aus `input/fsh/views/` können direkt über den `$run`-Endpunkt ausgeführt werden und liefern flache JSON/CSV-Tabellen.

Zugang zur Admin-UI: [http://localhost:8888](http://localhost:8888) (Login: admin/admin)

#### HAPI FHIR (empfohlen für CQL)

```bash
docker compose up -d hapi-fhir-server fhir-postgres
```

HAPI unterstützt die Ausführung von CQL-Expressions (`$cql`) und FHIR Measures (`$evaluate-measure`). Die [CQL-Library](https://github.com/BIH-CEI/SenologieOnFHIR/blob/main/input/cql/SenologieQualitaetsindikatoren.cql) mit den S3-Qualitätsindikatoren kann direkt gegen die geladenen Testdaten ausgeführt werden.

#### Pathling (empfohlen für analytische Abfragen)

```bash
docker compose -f docker-compose.pathling.yaml up -d
python3 scripts/load-to-pathling.py
```

Pathling basiert auf Apache Spark und eignet sich für analytische FHIRPath-Abfragen über größere Datenmengen. Der Datenimport erfolgt über NDJSON-Bulk-Import (`$import`).

Alternativ: Pathling als Python-Library ohne Docker:
```bash
pip install pathling
```

### Datenimport

Die Testdaten liegen als JSON-Ressourcen unter `fsh-generated/resources/`. Import-Skripte für die verschiedenen Server:

| Server | Skript | Methode |
|---|---|---|
| **Aidbox** | `scripts/import-to-aidbox.sh` | FHIR REST PUT (abhängigkeitsgeordnet) |
| **HAPI** | Python-Snippet (siehe unten) | FHIR REST PUT |
| **Pathling** | `scripts/load-to-pathling.py` | NDJSON-Bulk `$import` |

```python
# Generischer FHIR-Import (HAPI oder jeder FHIR R4 Server)
import json, glob, urllib.request
SERVER = "http://localhost:8095/fhir"
for f in sorted(glob.glob("fsh-generated/resources/*.json")):
    with open(f) as fh:
        r = json.load(fh)
    rt, rid = r.get("resourceType"), r.get("id")
    if rt and rid and "Fall" in rid:
        req = urllib.request.Request(f"{SERVER}/{rt}/{rid}",
            data=json.dumps(r).encode(), method='PUT',
            headers={'Content-Type': 'application/fhir+json'})
        urllib.request.urlopen(req)
```

### SQL on FHIR ViewDefinitions

Sechs ViewDefinitions für tabellarische Analysen liegen unter `input/fsh/views/`:

| View | Ressource | Spalten |
|---|---|---|
| **PatientKohorte** | Patient | id, gender, birthDate, familyName, givenName, city |
| **DiagnoseKohorte** | Condition | patientId, icd10Code, snomedCode, laterality, diagnosedatum, clinicalStatus |
| **OperationenKohorte** | Procedure | patientId, opsCode, datum, seite, outcomeText, intention |
| **PathologieKohorte** | DiagnosticReport | patientId, datum, conclusion |
| **SystemtherapieKohorte** | Procedure | patientId, datum, categoryCode, partOfId |
| **TumorboardKohorte** | CarePlan | patientId, datum, activityText, activityDisplay |

Ausführung über Aidbox:
```bash
curl -u root:secret -X POST "http://localhost:8888/fhir/ViewDefinition/\$run?_format=json" \
  -H "Content-Type: application/fhir+json" \
  -H "Accept: application/json" \
  -d @input/fsh/views/ViewDefinition-PatientKohorte.json
```

### Jupyter Notebook

Das Analyse-Notebook (`notebooks/senologie-analyse.ipynb`) verbindet sich mit einem der FHIR-Server und führt die ViewDefinitions aus. Es enthält 7 vordefinierte Analysen:

1. Fallzahl pro Subtyp (HR+/HER2-, HER2+, TNBC, DCIS)
2. BET-Rate (brusterhaltende Therapie vs. Mastektomie)
3. R0/R1/R2-Verteilung
4. Altersverteilung (Boxplot)
5. Therapie-Mix pro Subtyp
6. Time-to-Treatment (Diagnose → OP)
7. Crosstab Subtyp × OP-Art

Drei Ausführungsmodi stehen zur Verfügung:

| Modus | Server | Voraussetzung |
|---|---|---|
| `docker` | Aidbox auf :8888 | Docker + Lizenz |
| `python` | Pathling lokal (Spark) | `pip install pathling` |
| `custom` | HAPI auf :8095 / Pathling :8091 | Docker |

Siehe `notebooks/README.md` für die vollständige Anleitung.

### CQL-Auswertung

Die [CQL-Library](https://github.com/BIH-CEI/SenologieOnFHIR/blob/main/input/cql/SenologieQualitaetsindikatoren.cql) enthält S3-Qualitätsindikatoren (QI-2 bis QI-14) und deskriptive Statistiken. Ausführung gegen HAPI:

```bash
curl -X POST "http://localhost:8095/fhir/\$cql" \
  -H "Content-Type: application/fhir+json" \
  -d '{"resourceType":"Parameters","parameter":[{"name":"expression","valueString":"Count([Patient])"}]}'
```

### Meldungs-Transformation (StructureMaps)

Die [StructureMaps](anwendungsfaelle-meldedatensaetze.html) transformieren die FHIR-Daten in die vier Meldeformate. Für die Ausführung wird ein [Matchbox](https://github.com/ahdis/matchbox)-Container empfohlen, der die FML-Maps als `$transform`-Operation bereitstellt.

### Weiterentwicklung

Geplant für kommende Versionen:

- **Skalierung auf 100 synthetische Patientinnen** für statistisch aussagekräftigere Analysen
- **FHIR Measures** als formale Measure-Ressourcen für `$evaluate-measure`
- **Matchbox-Integration** in die Docker-Compose-Umgebung für StructureMap-Ausführung
- **Interaktives Dashboard** (Plotly/Dash) für Qualitätsindikatoren
