### Use Case: Analysis

#### Overview

The structured FHIR data of the Core Dataset Senology (Kerndatensatz Senologie) enables secondary use for health services research, quality assurance, and clinical trials. The standardised profiling ensures that data are comparable and analysable across sites.

<div>
<img src="auswertung-pipeline.svg" alt="Auswertungspipeline" style="width:100%"/>
<p><em>Analysis pipeline — cohort definition via inclusion/exclusion criteria, tabular projection through ViewDefinitions, calculation via CQL or SQL</em></p>
</div>

#### Analysis Scenarios

##### 1. Quality Indicators (DKG Certification)

Certified breast centres must collect quality indicators annually in accordance with DKG (German Cancer Society) specifications. The structured data enable automated calculation:

| Indicator | Data Basis (Profiles) |
|---|---|
| Rate of breast-conserving surgery | Senologie_Operation (Procedure) |
| R0 resection rate | Senologie_Pathologie_Befund (DiagnosticReport) |
| Hormone receptor determination rate | Senologie_Pathologie_Befund (ER, PR, HER2, Ki-67) |
| Rate of tumour board (Tumorkonferenz) presentation | Senologie_Tumorboard_Empfehlung (CarePlan) |
| Postoperative complication rate | Senologie_Operative_Komplikation (Observation) |
| Systemic therapy adherence | Senologie_Systemtherapie_Procedure (Procedure) |

##### 2. Health Services Research

The FHIR data can be made available via MII Data Integration Centres (Datenintegrationszentren) for cross-site health services research:

- **Treatment pathway analyses**: Comparison of the actual care pathway with guideline recommendations across the sequence diagnosis → tumour board → therapy
- **Outcome analyses**: Linkage of therapy data (surgery, systemic therapy, radiotherapy) with complications and follow-up diagnoses
- **Risk stratification**: Correlation of gene expression test results with treatment decisions and outcomes
- **Time analyses**: Time-to-treatment, diagnostic delays, therapy durations

##### 3. Clinical Trials

The module supports recruitment and data provision for clinical trials:

- **Feasibility queries**: Identification of eligible patients via structured inclusion criteria (diagnosis, stage, receptor status, prior therapies)
- **Data export**: Provision of study-relevant data in FHIR format
- **Study participation tracking**: Documentation via ResearchSubject *(planned)*

##### 4. Guideline Compliance

By annotating the S3 guideline with FHIR data points, adherence to guidelines can be systematically assessed:

- Are all recommended diagnostic steps being performed?
- Does the tumour board treatment recommendation comply with the guidelines?
- Are gene expression tests used in accordance with guideline recommendations?

#### Query Patterns

Example FHIR queries for typical analyses:

```
# All patients with triple-negative breast carcinoma
GET Condition?code=http://snomed.info/sct|254837009
  &_has:Observation:subject:code=http://loinc.org|85337-4  # ER-negativ
  &_has:Observation:subject:code=http://loinc.org|85339-0  # PR-negativ
  &_has:Observation:subject:code=http://loinc.org|85319-2  # HER2-negativ

# All operations with complications Clavien-Dindo ≥ III
GET Observation?code=clavien-dindo
  &value-concept=clavien-dindo-III,clavien-dindo-IV,clavien-dindo-V
  &_include=Observation:focus  # zugehörige Prozedur
```

#### Automation via CQL

The analyses (in particular quality indicators and guideline compliance) can be automated in future versions of this IG using the [Clinical Quality Language (CQL)](http://cql.hl7.org/). CQL enables the formal definition of quality measures and decision logic directly on FHIR resources, allowing key metrics to be calculated in a reproducible and machine-readable manner.

A first CQL library containing the 17 quality indicators from the S3 guideline is available at [`input/cql/QualitaetsindikatorenLeitlinie.cql`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/cql/QualitaetsindikatorenLeitlinie.cql). It is executable against the synthetic 12-patient cohort (HAPI, port 8095, endpoint `POST /fhir/$cql`).

#### SQL on FHIR ViewDefinitions

In addition to CQL, the IG provides six [SQL-on-FHIR v2](https://sql-on-fhir.org/) `ViewDefinition` resources. These define flat, tabular projections (columns, `where` filters, `forEach` expansion) on the core datasets and thus serve as the foundation for cohort construction, data lake persistence (Parquet/Delta), and BI analyses (Superset, Metabase, Tableau).

| ViewDefinition | Resource Basis | Purpose |
|---|---|---|
| [`PatientKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-PatientKohorte.json) | Patient | Demographics (id, name, gender, birthDate, age, city) |
| [`DiagnoseKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-DiagnoseKohorte.json) | Condition | Diagnosis including ICD-10, SNOMED, laterality, UICC stage |
| [`OperationenKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-OperationenKohorte.json) | Procedure | Surgery type (BCS/mastectomy/SNB/ALND), R-status, intent |
| [`PathologieKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-PathologieKohorte.json) | DiagnosticReport | Pathology findings with IHC (ER, PR, HER2, Ki-67), grading |
| [`SystemtherapieKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-SystemtherapieKohorte.json) | Procedure | Systemic therapies (CH/HO/IM/ZT), intent, start/end, protocol |
| [`TumorboardKohorte`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/input/fsh/views/ViewDefinition-TumorboardKohorte.json) | CarePlan | Tumour board recommendations with activities (treatment recommendations) |

The canonical URLs follow the schema `https://www.senologie.org/fhir/ViewDefinition/{Name}`. Execution via e.g. [Pathling](https://pathling.csiro.au/), [sof-js](https://github.com/FHIR/sql-on-fhir-v2/tree/master/sof-js), or directly against a HAPI instance.

#### Execution with Pathling

[Pathling](https://pathling.csiro.au/) is the SQL-on-FHIR engine developed by CSIRO as open source (Apache-2.0). It is supported in this IG as the **recommended** runtime for the six ViewDefinitions; no commercial licence is required. The repository provides two integration variants for this purpose:

**Variant A — Docker server (recommended for teams / shared setup).**
A standalone Compose file `docker-compose.pathling.yaml` starts a Pathling FHIR server on port `8090`. Data import is performed via a small Python script that loads the 177 example resources from `fsh-generated/resources/` into the Pathling instance via FHIR REST:

```bash
docker compose -f docker-compose.pathling.yaml up -d
python3 scripts/load-to-pathling.py
```

The ViewDefinitions are then available via the FHIR operation `POST /ViewDefinition/$run` and can be queried from the Jupyter notebook as well as from BI tools or CI pipelines.

**Variant B — Python library (local execution, without Docker).**
For individual analyses and reproducible notebooks, the Pathling Python library is sufficient; it runs an embedded Spark instance and reads the bundles directly from the file system:

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

Both variants execute the **six** ViewDefinitions identically; the analyses shown in the notebook (`notebooks/senologie-analyse.ipynb`) are therefore reproducible without modification, regardless of the chosen engine.

#### Interactive Analysis

A runnable Jupyter notebook [`notebooks/senologie-analyse.ipynb`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/notebooks/senologie-analyse.ipynb) demonstrates the end-to-end analysis of the ViewDefinitions described above against a local HAPI instance (port 8095, 12 synthetic patients, 177 resources). It shows 7 example analyses:

1. Case count by subtype (HR+/HER2-, HER2+, TNBC, DCIS)
2. BCS rate (breast-conserving surgery vs. mastectomy)
3. R0 rate from surgical outcomes
4. Age distribution of patients (boxplot)
5. Therapy mix by subtype (chemo / endocrine / targeted / immunotherapy)
6. Time-to-treatment (diagnosis → surgery) distribution
7. Crosstab subtype × surgery type

Connecting to a FHIR server from Python:

```python
import requests, pandas as pd

FHIR_BASE = 'http://localhost:8095/fhir'
bundle = requests.get(f'{FHIR_BASE}/Condition?_count=200',
                      headers={'Accept': 'application/fhir+json'}).json()
df = pd.json_normalize([e['resource'] for e in bundle.get('entry', [])])
```

The notebook offers three interchangeable execution modes, selected at the top via the `EXECUTION_MODE` variable — the subsequent analysis cells are mode-independent:

1. **`"docker"` — Pathling FHIR Server** *(recommended)*: the six ViewDefinitions are executed via `POST /ViewDefinition/$run` against the Pathling container started with `docker-compose.pathling.yaml`.
2. **`"python"` — Pathling Python library**: local execution via `PathlingContext` with embedded Spark; no Docker required (`pip install pathling`).
3. **`"custom"` — built-in FHIRPath mini-runner**: fallback without Pathling/Spark, uses the HAPI test server or directly the JSON resources from `fsh-generated/resources/`.

For production data volumes, the use of Pathling (mode 1 or 2) is recommended; the custom runner is intentionally retained as a lightweight alternative for demo and CI scenarios. The step-by-step guide for all three modes is available at [`notebooks/README.md`](https://github.com/bih-charite/SenologieOnFHIR/blob/main/notebooks/README.md).

#### Data Protection and Governance

Secondary use takes place exclusively via the established MII governance structures:

- Pseudonymisation by the Data Integration Centre (Datenintegrationszentrum)
- Usage requests via the MII Research Data Portal (Forschungsdatenportal)
- Broad Consent as the legal basis
