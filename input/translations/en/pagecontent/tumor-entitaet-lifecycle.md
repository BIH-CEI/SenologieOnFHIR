### Tumour Entity Lifecycle (BodyStructure Anchor)

The Senology IG uses `BodyStructure` resources as **stable anchors for
tumour entities** across the entire disease trajectory. This allows
findings, biopsies, surgery, therapy response assessments, and follow-up to
each be attributed to a **specific lesion** — rather than merely to a generic
diagnosis or a "side".

#### Why a Dedicated Resource per Tumour?

```
Patient
  │
  ├ Condition (breast carcinoma)              ← disease entity
  │
  ├ BodyStructure #1 (Tumor rechts UAQ)    ← tumour entity 1
  │   │ identifier = senologie/tumor-entity|uuid-1
  │   │ active     = true
  │   ├ ← Observation (imaging BI-RADS finding)
  │   ├ ← Specimen (core needle biopsy)
  │   ├ ← Procedure (surgery)
  │   └ ← Observation (follow-up: response assessment)
  │
  └ BodyStructure #2 (Lebermetastase)      ← tumour entity 2
      ...
```

Advantages:
- **RECIST-1.1-compliant per-lesion tracking** (each tumour has its own
  size trajectory and its own response assessment)
- **Reference stability**: all subsequent resources point to the same BS,
  even when the tumour location is described in greater detail
- **Multi-tumour consistency**: data modelling remains clean for multifocal
  or bilateral carcinomas
- **Forward compatibility R5**: The R4 `BodyStructure` with the
  R5 backport extension (`extension-BodyStructure.includedStructure`) can be
  seamlessly migrated to the R5-native model with `includedStructure`,
  `bodyLandmarkOrientation`, and `clockFacePosition`.

#### When Is a BodyStructure Created?

| Trigger Event | BodyStructure Action |
|---|---|
| **Imaging detects a focal lesion** | **NEW** — imaging form creates BS with localisation (side + quadrant + clock position + nipple distance) |
| **Core needle biopsy / vacuum-assisted biopsy** | remains unchanged (`active=true`) — the biopsy is only a specimen; the tumour persists |
| **Surgical resection R0** | `PUT active=false` — tumour completely removed |
| **Surgical resection R1 / R2** | remains `active=true` — residual tumour microscopically (R1) or macroscopically (R2) present |
| **Surgical resection RX** | remains `active=true` (status indeterminate; kept active as a precaution) |
| **ypT0** (complete pathological remission after neoadjuvant therapy) | `PUT active=false` — no tumour pathologically detectable |
| **Local recurrence at the original site** | **NEW** with `partOf` → old BS — biologically a new tumour (clonal selection), its own trajectory |
| **Detection of a metastasis** | **NEW** — its own anatomical localisation, its own anchor |

#### Persistence Mechanisms

```
identifier[tumor-entity]   = stable, opaque ID — persists even when active=false
_history                   = FHIR-native resource versioning — all state
                             transitions (active=true → false → true on later
                             update) remain auditably retrievable
partOf / derivedFrom       = explicit lineage for recurrence modelling
                             (new BS references the original)
```

#### Recurrence Modelling — `replaces`

```
BodyStructure-1            BodyStructure-2 (Lokalrezidiv 2026)
  identifier  uuid-1         identifier  uuid-2 (new)
  active      false  ◄────── replaces    Reference(BodyStructure/uuid-1)
  (resected 2024)            active      true
```

A **new BodyStructure** is created for the recurrence, with a `replaces`
reference (as an extension on the R4 BodyStructure) pointing to the original.
The recurrence is **biologically a new entity** (clonal selection) that
supersedes the old tumour concept in clinical management — hence `replaces`
rather than `partOf` or `derivedFrom`.

Advantages:
- Query "How many local recurrences at this site?" via the `replaces` chain length
- Its own trajectory for the recurrence (size, response, etc.)
- The quiescent phase between R0 and recurrence (BS-1 `active=false`) remains visible

Alternative `_history` reactivation (setting BS-1 back to `active=true`) **is
not recommended**, as it loses these properties.

#### R1/R2 + Re-excision — Specimen Sequence, Same BS

Each intervention produces its **own `Specimen`** with its own date and
procedure context. The `BodyStructure` remains the same tumour entity,
sampled by multiple specimens:

```
BodyStructure-1 (Tumor links UAQ)                ← 1 tumour entity
   ▲   ▲   ▲   (collection.bodySite.extension → BS-1)
   │   │   │
Specimen-1 (Stanze 03/2024)                       ← specimen sequence, N:1 to BS
Specimen-2 (BET-Resektat 05/2024) → R1            ← BS remains active=true
Specimen-3 (Nachresektat 06/2024) → R0            ← BS is then set to active=false
```

**Consequences:**
- **Resection margin status (R-status)** is documented per **Specimen** (pathology Observation `Senologie_Resektionsstatus` or as Procedure.outcome on the surgical procedure)
- **BS `active` flipping** does not occur at the R1 finding itself, but only
  at the **last specimen that yields R0** (or permanently `true` if
  re-excision was not clinically performed / R2 or managed palliatively)
- **No sub-BodyStructure for residual tumour** — the tumour entity is an
  identity, not an anatomical volume region

A re-excision specimen references the same `BodyStructure` as the primary
resection specimen. The BS description may optionally be extended after the
R1 finding ("…residual tumour at the superior margin…"), but this is not
required for FHIR logic.

#### Multi-Lesion Updates in a Single Intervention

On form submission (e.g. after surgery with resection of multiple foci), a
single transaction bundle is posted, atomically committing multiple BS PUT
updates and the new Procedure:

```json
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    { "request": {"method": "PUT", "url": "BodyStructure/uuid-1"},
      "resource": {"resourceType": "BodyStructure", "active": false, ...}},
    { "request": {"method": "PUT", "url": "BodyStructure/uuid-2"},
      "resource": {"resourceType": "BodyStructure", "active": false, ...}},
    { "request": {"method": "POST", "url": "Procedure"},
      "resource": {"resourceType": "Procedure", "...": "..."}}
  ]
}
```

#### Workflow in the IG

**1. Initial Detection** (imaging form):
- Form creates a new `BodyStructure` per detected lesion
- `identifier[tumor-entity]` = generated UUID
- Localisation (side + quadrant + clock position + nipple distance) via R5 backport
- `active = true`

**2. Biopsy / Pathology** (pathology form):
- User selects existing BodyStructure(s) via `candidateExpression`
  (`BodyStructure?patient={{%patient.id}}&active=true`)
- Specimen.collection.bodySite.extension references the BS
- BS remains `active=true`

**3. Surgery** (pre-operative planning + post-operative form):
- User selects the BS(s) to be operated on
- Procedure is created, referenced via `focalDevice` or a dedicated extension
- Post-operative form queries R-status per BS
- Template generates PUT update on each BS:
  - R0 → `active = false`
  - R1 / R2 / RX → `active = true`

**4. Follow-up / Restaging** (follow-up form):
- User selects the tumour(s) currently under assessment — `candidateExpression`
  filters on `active=true` (i.e. tumours still present)
- Per BS, a follow-up Observation with response status (CR/PR/SD/PD/Mixed)

**5. Recurrence Detection** (imaging form, repeated):
- User detects a new lesion at the original site
- Form creates a **new BodyStructure**, sets `partOf` to the old one (whose `active=false`)
- A new recurrence cycle begins

#### Implications for External Reporting Pathways

| Specification | Implication |
|---|---|
| **oBDS Modul-Mamma** | Read tumour position from the currently active BS; for recurrence reporting, traverse `partOf` back to the original diagnosis BS |
| **OncoBox Brust 2.0** | One BS reference per `Histologie` entry; multiple histologies = multiple BS |
| **IRegG (implant register)** | Implants are separate `Device` resources, **not** BodyStructure — a separate lifecycle model |
| **IQTIG Modul 18n1** | Lymph node status aggregatable per BS; quadrant distribution from locationQualifier/backport |

#### Reference Integrity

When a BS is set to `active=false`, **all existing resource references remain
valid** — Observations, Specimens, and Procedures from the past continue to
point to that BS (in the state it had at the time, accessible via `_history`).

New resource entries should no longer reference a deactivated BS — except for
update operations such as setting a `derivedFrom` from a new recurrence BS.
