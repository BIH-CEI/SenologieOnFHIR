### Quality Indicators via CQL & FHIR Measure

Structured data (diagnosis, surgery, biomarkers, follow-up) is exported via StructureMaps into oBDS/OncoBox/IQTIG/IRegG. **Quality indicators and metrics**, however, are *population aggregates* — they are calculated using **CQL** (Clinical Quality Language) and **FHIR Measure / MeasureReport**.

#### Architecture

```
FHIR Resources (Conditions, Procedures, Observations, …)
      │
      ▼
  ┌────────────────────────────────────────────┐
  │  Library (FHIR Resource)                   │
  │   content[].data = base64(CQL-Source)      │
  │   context Patient                          │
  │   define "HasMammaCa": exists([Condition]) │
  │   define "HasBET":     exists([Procedure]) │
  └─────────────┬──────────────────────────────┘
                │ referenced via .library
                ▼
  ┌────────────────────────────────────────────┐
  │  Measure (FHIR Resource)                   │
  │   group:                                   │
  │     initial-population: HasMammaCa         │
  │     denominator:        HasMammaCa         │
  │     numerator:          HasBET             │
  └─────────────┬──────────────────────────────┘
                │ POST /Measure/.../$evaluate-measure
                ▼
  ┌────────────────────────────────────────────┐
  │  MeasureReport                             │
  │   group.population.count                   │
  │   group.measureScore = numerator/denom     │
  └────────────────────────────────────────────┘
```

#### CQL Libraries in this IG

| Library | Content | Source |
|---|---|---|
| `QualitaetsindikatorenLeitlinie` | 17 quality indicators from the S3 Guideline Breast Cancer v5.0, Chapter 8 | evidence-based quality indicators |
| `OncoBoxBrustKennzahlen` | KB-1 … KB-20 | OncoBox Breast 2.0 specification (audit year 2026), DKG Breast Centre certification |
| `MinimalMeasureLib` | Trivial defines (always `true`) plus two real-world examples (`HasMammaCa`, `HasBET`) | debug entry point |

KB metrics reuse S3 quality indicator defines wherever possible (`include … called S3`).

#### Context: why `Patient`?

The CQL uses `context Patient`. This ensures that all `[Condition]`/`[Procedure]` queries are automatically filtered to the patient currently being evaluated, and the Measure engine can determine a Boolean answer per patient (in / not in the population).

**FHIR alternatives:**

| Context | Application | Status in Germany |
|---|---|---|
| `Patient` | one evaluation per patient | currently used ← |
| `EpisodeOfCare` | separate evaluation per disease episode (e.g. primary tumour vs. recurrence) | semantically cleaner, **but no normative EpisodeOfCare specification in Germany yet** (work in progress) |
| `Encounter` | per encounter (Aufenthalt) | of limited use for chronic diseases; **in particular, not reliably derivable from HL7 v2 ADT streams in the outpatient setting** (patient–encounter relationships are maintained consistently in many HIS only for inpatient and partial inpatient stays) |

Once a German standard for `EpisodeOfCare` is established, the CQL should be migrated to `context EpisodeOfCare`. This will allow multiple episodes for the same patient (primary disease 2020, local recurrence 2025) to be evaluated separately — rather than being combined patient-wide.

#### Running `$evaluate-measure`

Prerequisites:
- HAPI FHIR Server with Clinical Reasoning (`hapi.fhir.cr_enabled=true`) — see `docker-compose.hapi.yaml`
- Library, Measure, and Patient/Condition/Procedure resources loaded

```bash
# Population-wide evaluation across all patients
curl "http://localhost:8095/fhir/Measure/senologie-measure-minimal/\$evaluate-measure?\
periodStart=2025-01-01&periodEnd=2025-12-31&reportType=subject-list"

# Example output (abbreviated):
#   group bet-bei-mamma-ca:
#     initial-population: 9   (patients with breast cancer)
#     denominator:        9
#     numerator:          4   (of which with BET)
#     score:              0.44 (= 44 %)
```

> **Note:** With `reportType=population`, HAPI's CR engine currently returns
> a `count` of 1 instead of the actual population size. Workaround:
> use `reportType=subject-list` and count the number of entries in the
> referenced `List`.

#### Lessons Learned

- **`context Patient` is mandatory** — without it the engine does not filter to the current patient and all defines return results globally.
- **Define names without spaces or German keywords** (e.g. use `HasInvasiveOrDCIS` instead of `Has Invasive oder DCIS`) — URL encoding and the CQL parser are then robust.
- **Bump the Library version with every CQL change** — otherwise the server caches the old compiled ELM representation.
- **HAPI without a volume mount = in-memory** — a restart clears all data; Library, Measure, and Patient resources must be reloaded. For production evaluations, mount a volume or use Aidbox/Cosmos.
