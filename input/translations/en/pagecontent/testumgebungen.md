### Data Provision and Test Environments

The Core Dataset Senology (Kerndatensatz Senologie) provides a complete test infrastructure in addition to profiles and terminologies.

#### Provided Components

| Component | Description | Audience |
|-----------|-------------|----------|
| **Implementation Guide** (GitHub Pages) | Profiles, Questionnaires, examples, documentation | All |
| **FHIR Package** | Installable profiles for validation and implementation | Implementers |
| **Matchbox Docker** | SDC `$extract` (Questionnaire extraction) + StructureMap `$transform` (report transformation) | Testers, Developers |
| **HAPI FHIR Docker** | Standard FHIR server + CQL `$cql` + `$evaluate-measure` | Testers, Analytics |
| **Pathling Docker** | SQL-on-FHIR ViewDefinitions, analytical FHIRPath queries | Research, BI |
| **Aidbox Docker** | FHIR server with schema validation, SQL on FHIR `$run` | Testers |
| **Jupyter Notebooks** | CQL evaluation, ViewDefinitions, cohort analyses | Data Scientists |
| **Bundles (JSON)** | 12 test patients as Transaction Bundles, [Download](Bundle-Fall1-Erika-Neumann.json) | All |

All Docker Compose files, import scripts, and test data are freely available in the [GitHub repository](https://github.com/BIH-CEI/SenologieOnFHIR).

#### Quickstart

```bash
# 1. Clone repository
git clone https://github.com/BIH-CEI/SenologieOnFHIR.git
cd SenologieOnFHIR

# 2. Configure environment
cp .env.example .env
# → Enter Aidbox licence in .env (https://aidbox.app/)

# 3. Start servers
docker compose up -d                                    # Aidbox (Port 8888)
docker compose -f docker-compose.matchbox.yaml up -d    # Matchbox (Port 8080)
docker compose -f docker-compose.pathling.yaml up -d    # Pathling (Port 8091)

# 4. Load test data
bash scripts/import-to-aidbox.sh                        # → Aidbox
python3 scripts/load-to-pathling.py                     # → Pathling

# 5. Test
# Render Questionnaire:    http://localhost:8888/fhir/Questionnaire/senologie-diagnose
# SDC $extract:            POST http://localhost:8080/fhir/QuestionnaireResponse/$extract
# StructureMap $transform: POST http://localhost:8080/fhir/StructureMap/$transform
# SQL-on-FHIR:            POST http://localhost:8091/fhir/ViewDefinition/$run
# CQL evaluation:         POST http://localhost:8888/fhir/$cql
# Jupyter Notebook:        jupyter notebook notebooks/senologie-analyse.ipynb
```

#### Default Ports

| Service | Port | URL |
|---------|------|-----|
| Aidbox | 8888 | [http://localhost:8888](http://localhost:8888) (admin/admin) |
| Matchbox | 8080 | [http://localhost:8080](http://localhost:8080) |
| Pathling | 8091 | [http://localhost:8091](http://localhost:8091) |
| Postgres (Aidbox) | 5437 | — |

Ports can be customised via the `.env` file or the respective Docker Compose files.

#### Synthetic Test Data

The [12 synthetic test patients](testpatientinnen.html) (210+ FHIR instances) cover all clinically relevant scenarios: all breast cancer subtypes, stages 0–IV, benign and B3 findings, neoadjuvant and adjuvant therapy, complications, implants, BRCA mutation, and male breast carcinoma. Each case contains fully linked FHIR resources (Patient → Diagnosis → Imaging → Pathology → Therapy → Follow-up).

The test data are included as FSH examples in the IG and can be loaded directly into a FHIR server.

#### Available FHIR Servers

Three Docker-based test environments are available for evaluating the Core Dataset. All Docker Compose files, import scripts, and test data are freely available in the [GitHub repository](https://github.com/BIH-CEI/SenologieOnFHIR).

| Server | Port | Licence | Focus |
|---|---|---|---|
| **HAPI FHIR** | 8095 | **Open Source** (Apache-2.0), no registration required | CQL evaluation (`$cql`, `$evaluate-measure`), standard FHIR REST |
| **Pathling** | 8091 | **Open Source** (Apache-2.0), no registration required | FHIRPath-based analytics (`$extract`, `$aggregate`), Apache Spark engine |
| **Aidbox** | 8888 | **Free licence** required ([aidbox.app](https://aidbox.app/)) | SQL on FHIR ViewDefinitions (`$run`, `$materialize`), FHIR schema validation |

{:.stu-note}
**HAPI FHIR** and **Pathling** can be started directly from the repository without registration or a licence. **Aidbox** requires an individual (free) licence that can be requested at [aidbox.app](https://aidbox.app/). The licence file (`.env`) is not included in the repository.

##### HAPI FHIR (Open Source, recommended for CQL)

```bash
git clone https://github.com/BIH-CEI/SenologieOnFHIR.git
cd SenologieOnFHIR
docker compose up -d hapi-fhir-server fhir-postgres
# Load data (Python 3 required):
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

##### Pathling (Open Source, recommended for analytics)

```bash
docker compose -f docker-compose.pathling.yaml up -d
python3 scripts/load-to-pathling.py
```

##### Aidbox (SQL on FHIR ViewDefinitions, free licence required)

```bash
# 1. Request licence at https://aidbox.app/
# 2. Create .env:
echo "AIDBOX_LICENSE=<your-jwt-token>" > .env
# 3. Start:
docker compose up -d
```

Aidbox provides native SQL-on-FHIR support: the ViewDefinitions from `input/fsh/views/` can be executed directly via the `$run` endpoint and return flat JSON/CSV tables.

Admin UI access: [http://localhost:8888](http://localhost:8888) (login: admin/admin)

##### HAPI FHIR (recommended for CQL)

```bash
docker compose up -d hapi-fhir-server fhir-postgres
```

HAPI supports execution of CQL expressions (`$cql`) and FHIR Measures (`$evaluate-measure`). The [CQL library](https://github.com/BIH-CEI/SenologieOnFHIR/blob/main/input/cql/QualitaetsindikatorenLeitlinie.cql) containing the S3 quality indicators can be run directly against the loaded test data.

##### Pathling (recommended for analytical queries)

```bash
docker compose -f docker-compose.pathling.yaml up -d
python3 scripts/load-to-pathling.py
```

Pathling is based on Apache Spark and is well suited for analytical FHIRPath queries over larger datasets. Data import is performed via NDJSON bulk import (`$import`).

Alternatively, Pathling can be used as a Python library without Docker:
```bash
pip install pathling
```

#### Data Import

Test data are available as JSON resources under `fsh-generated/resources/`. Import scripts for the various servers:

| Server | Script | Method |
|---|---|---|
| **Aidbox** | `scripts/import-to-aidbox.sh` | FHIR REST PUT (dependency-ordered) |
| **HAPI** | Python snippet (see below) | FHIR REST PUT |
| **Pathling** | `scripts/load-to-pathling.py` | NDJSON bulk `$import` |

```python
# Generic FHIR import (HAPI or any FHIR R4 server)
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

#### SQL on FHIR ViewDefinitions

Six ViewDefinitions for tabular analyses are located under `input/fsh/views/`:

| View | Resource | Columns |
|---|---|---|
| **PatientKohorte** | Patient | id, gender, birthDate, familyName, givenName, city |
| **DiagnoseKohorte** | Condition | patientId, icd10Code, snomedCode, laterality, diagnosedatum, clinicalStatus |
| **OperationenKohorte** | Procedure | patientId, opsCode, datum, seite, outcomeText, intention |
| **PathologieKohorte** | DiagnosticReport | patientId, datum, conclusion |
| **SystemtherapieKohorte** | Procedure | patientId, datum, categoryCode, partOfId |
| **TumorboardKohorte** | CarePlan | patientId, datum, activityText, activityDisplay |

Execution via Aidbox:
```bash
curl -u root:secret -X POST "http://localhost:8888/fhir/ViewDefinition/\$run?_format=json" \
  -H "Content-Type: application/fhir+json" \
  -H "Accept: application/json" \
  -d @input/fsh/views/ViewDefinition-PatientKohorte.json
```

#### Jupyter Notebook

The analysis notebook (`notebooks/senologie-analyse.ipynb`) connects to one of the FHIR servers and executes the ViewDefinitions. It contains 7 predefined analyses:

1. Case count by subtype (HR+/HER2-, HER2+, TNBC, DCIS)
2. Breast-conserving surgery rate (breast-conserving therapy vs. mastectomy)
3. R0/R1/R2 distribution
4. Age distribution (boxplot)
5. Therapy mix by subtype
6. Time-to-treatment (diagnosis to surgery)
7. Cross-tabulation subtype × surgery type

Three execution modes are available:

| Mode | Server | Prerequisite |
|---|---|---|
| `docker` | Aidbox on :8888 | Docker + licence |
| `python` | Pathling local (Spark) | `pip install pathling` |
| `custom` | HAPI on :8095 / Pathling :8091 | Docker |

See `notebooks/README.md` for the complete instructions.

#### CQL Evaluation

The [CQL library](https://github.com/BIH-CEI/SenologieOnFHIR/blob/main/input/cql/QualitaetsindikatorenLeitlinie.cql) contains S3 quality indicators (QI-2 to QI-14) and descriptive statistics. Execution against HAPI:

```bash
curl -X POST "http://localhost:8095/fhir/\$cql" \
  -H "Content-Type: application/fhir+json" \
  -d '{"resourceType":"Parameters","parameter":[{"name":"expression","valueString":"Count([Patient])"}]}'
```

#### Report Transformation (StructureMaps)

The [StructureMaps](anwendungsfaelle-meldedatensaetze.html) transform the FHIR data into the four reporting formats. A [Matchbox](https://github.com/ahdis/matchbox) container is recommended for execution, as it exposes the FML maps via the `$transform` operation.

#### Future Development

Planned for upcoming versions:

- **Scaling to 100 synthetic patients** for statistically more meaningful analyses
- **FHIR Measures** as formal Measure resources for `$evaluate-measure`
- **Matchbox integration** into the Docker Compose environment for StructureMap execution
- **Interactive dashboard** (Plotly/Dash) for quality indicators
