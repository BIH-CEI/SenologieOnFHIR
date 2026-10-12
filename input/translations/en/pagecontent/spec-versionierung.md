### Spec Versioning for Exports

Each StructureMap targets a **specific version** of an external specification.
Spec updates ⇒ new/parallel StructureMap.

#### Current Target Spec Versions (Senologie IG 0.9.0)

| StructureMap | Target Spec | XSD file in repo |
|---|---|---|
| `SenologieToObdsMeldung` | **oBDS XML v3.0.5** (22.09.2025) — backwards-compatible with v3.0.1 | `input/data/obds-testdaten/oBDS_v3.0.5.xsd` |
| `SenologieToOncoBoxBrust` | **OncoBox Brust 2.0 v2.1.1** (audit year 2026) | `input/data/oncobox-brust-2.0/oncobox-brust-2.0.xsd` |
| `SenologieToIqtigMammachirurgie181` | **IQTIG QS base specification Spez 2026 V06**, module 18n1 | `input/data/iqtig-schema/interface_LE/2026_lqs_iv_1.0_Export.xsd` |
| `SenologieToIRegMeldung` | **IRegG XML spec V4.1.1** | `input/data/iregg-schema-v4.1.1/IRD_XML_Spezifikation.xsd` |

These versions are documented in the header of each map as a `targetSpec:` comment.

#### Procedure for Spec Updates

**Minor update (additive, no breaking changes):**

1. Replace the schema file (`input/data/<target>/.../*.xsd`)
2. Update the `targetSpec:` comment in the map
3. Regenerate the snapshot — if unchanged: OK
4. For new fields: extend the map accordingly

**Major update (breaking changes such as OncoBox 1.0 → 2.0):**

1. **Archive the old map** as `<Name>-v1.x.map` (or mark as deprecated with a comment)
2. **Create a new map** for the new version in parallel
3. Both are published in the IG under distinct URL versions
4. **Logical Models (LM)** may likewise need to be maintained in parallel (`obds-meldung-v3` / `obds-meldung-v4`)
5. Snapshots are maintained separately per version

Example naming convention for multi-version coexistence:
```
SenologieToOncoBoxBrust            (always the current default version)
SenologieToOncoBoxBrust-v1-n111    (legacy 1.0/N1.1.1)
SenologieToOncoBoxBrust-v2-211     (current)
```

#### FHIR Versioning Mechanics

| Resource | Version field | Who sets it |
|---|---|---|
| StructureMap | implicitly via IG `PR_CS_VS_Version` RuleSet | jointly with Senologie IG |
| ConceptMap | `^version` via insert block | jointly with Senologie IG |
| Library (CQL) | in the `library X version 'Y'` statement | manually per CQL file |
| Measure | `^version` | manually |
| `translate()` calls | loose by default (URL without version) | strict when required: `'url\|0.9.0'` |

**Convention:** Within an IG release, all Senologie artefacts are published together under the IG version (e.g. `0.9.0`). Third-party consumers import the complete IG bundle and thereby receive a consistently versioned collection.

#### Loading External Specs (gitignored)

The proprietary Excel spec files (oBDS PDF, OncoBox XLSX, IQTIG spec bundle) are excluded via `.gitignore` — only XSDs and XML test data reside in the repository. Download URLs are documented in `input/data/README.md`.
