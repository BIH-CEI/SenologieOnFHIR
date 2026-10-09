# Known Errors and Limitations

This page documents known QA errors and validation limitations in the current build. The messages listed relate to **tooling and infrastructure constraints**, not to content errors in the profiles or test data. They are suppressed in the `ignoreWarnings.txt` file.

The sources of errors fall into the following categories:

| Category | Cause | Share |
|---|---|---|
| [TX Proxy](#tx-proxy-limitations) | Terminology server constraints | ~35% |
| [StructureMap Validation](#structuremap-validation) | IG Publisher cannot resolve Logical Model paths | ~15% |
| [SDC 4.0.0](#sdc-400-validation) | Stricter validation of contained resources and extensions | ~15% |
| [BCP-47 Language](#bcp-47-language-validation) | TX Proxy has no BCP-47 CodeSystem | ~10% |
| [OPS ValueSet](#ops-codes-not-in-mii-valueset) | MII ValueSet does not contain all OPS subcategories | ~10% |
| [Questionnaire LinkIds](#questionnaire-linkid-mismatch) | QR LinkIds reference the FSH Questionnaire instead of the JSON template | ~10% |
| [Miscellaneous](#miscellaneous-messages) | Slicing, FHIR version, IPS links | ~5% |

---

## TX Proxy Limitations

**Cause:** The build uses the MII Ontoserver via a local TX proxy (`localhost:3000`). Some validation requests fail because the Ontoserver has not fully loaded certain CodeSystems or ValueSets.

**Impact:** False-positive validation errors for correct codes. The codes themselves are correct and work in production systems.

{:.stu-note}
The following messages are caused by the TX proxy and do not represent content errors.

### Unknown Codes

SNOMED CT, LOINC, and RadLex codes that the TX proxy cannot resolve:

| Code | System | Clinical Meaning |
|---|---|---|
| `784163009` | SNOMED CT | Sentinel lymph node biopsy |
| `784176009` | SNOMED CT | Sentinel lymph node |
| `301782006` | SNOMED CT | Clinical staging |
| `285345009` | SNOMED CT | Mammography finding |
| `127465003` | SNOMED CT | Chemotherapy regimen |
| `119380005` | SNOMED CT | Tissue specimen |
| `241736003` | SNOMED CT | Imaging of the breast |
| `300886002` | SNOMED CT | BI-RADS classification |
| `373945005` | SNOMED CT | Radiation therapy |
| `183040004` | SNOMED CT | Follow-up care |
| `870370003` | SNOMED CT | Reference to another encounter |
| `72018-2` | LOINC | TNM staging |
| `39638-7` | LOINC | Histological grade |
| `87858-9` | LOINC | Gene expression test |
| `RID3933` | RadLex | Body structure |
| `RID58844` | RadLex | Body structure |

### DosageQuantity and UnitsOfTime

The TX proxy cannot validate the ValueSets `Dosage DoseQuantity ValueSet` and `UnitsOfTime`. The units used (`d`, `wk`) are correct UCUM codes.

### Senologie Side ValueSet

The coding is reported as not found in the ValueSet `VS Senologie Seite` — a TX proxy validation error.

---

## StructureMap Validation

**Cause:** The IG Publisher (v2.2.6) cannot resolve BackboneElement paths in Logical Models. The affected StructureMaps are correct and work in [Matchbox](https://www.matchbox.health/).

**Impact:** Errors of classes `SM_TARGET_PATH_INVALID`, `SM_SOURCE_PATH_INVALID`, `SM_RULEGROUP_NOT_FOUND`, and `SM_TARGET_CONTEXT_UNKNOWN` when validating StructureMaps that use logical models as source or target.

{:.stu-note}
These errors are a known issue with the IG Publisher. The StructureMaps have been successfully tested in Matchbox.

Additionally, the Publisher does not recognise `Bundle.entry.resource` as a concrete type (Condition, Procedure, etc.) when filtered via a `where()` clause. This produces messages of the form: *"The parameter 'src' refers to the variable '%…'"*.

---

## SDC 4.0.0 Validation

**Cause:** The upgrade to SDC 4.0.0 introduces stricter validation of contained resources, extensions, and template extraction mechanisms.

**Impact:** Validation errors for correct SDC constructs that were still accepted in SDC 3.0.0.

Affected areas:

- **templateExtractValue / extractResourceId extensions** — The validator does not correctly accept the types `[string]` and `[url]` respectively
- **templateExtract extension** — reported as empty type `[]`
- **Slicing constraints** — `Extension.extension:name` and `Extension.extension:template` are reported as missing even though they are present
- **Contained resource constraints** — `Extension.extension: minimum required = 1`, `Extension.value[x]: maximum allowed = 0`, `Constraint failed: sdc-lcext-1`
- **extractResourceId** — `inv-1` rule fails (SDC 3.0.0 extension in SDC 4.0.0 context)
- **Condition.extension:Feststellungsdatum** — template-driven slice assignment fails

{:.stu-note}
These errors are expected to be resolved by an update to the IG Publisher or SDC tooling. The SDC extraction logic has been functionally tested in Aidbox (see the following section).

---

## Extraction Templates (templateExtract)

**Cause:** The questionnaires create their FHIR resources through SDC template-based extraction. The templates (contained resources) are incomplete by design: values that come from form answers only exist after extraction. The IG Publisher nevertheless validates every template against the profile named in its `meta.profile`.

**Effect:** Messages on the templates such as *"No code provided, and a code is required from the value set …"*, *"minimum required = 1, but only found 0"* or *"a matching slice is required, but not found"*. They concern the template, not the extracted resource.

The templates deliberately contain **no static placeholders** next to a `templateExtractValue` expression. Placeholders would reduce these messages but break extraction in Aidbox: the placeholder stays in place and the extracted value ends up in an invalid `_` field.

### Notes for Implementers

Extraction was tested with Aidbox (versions 2605, stable and edge, October 2026) using the example QuestionnaireResponses of this IG. Matchbox only supports StructureMap-based extraction and cannot extract these questionnaires.

- **Pass the Questionnaire to `$extract`.** Aidbox refuses to store the radiotherapy and systemic therapy questionnaires because its evaluation of `per-1` fails on a period whose start and end are only filled during extraction. Extraction works when the Questionnaire is passed as the `questionnaire` parameter.
- **Clean the result before storing it.** If an optional question whose value goes into an extension or a coding is left unanswered, Aidbox leaves an extension without a value or a coding without a code. Currently affected: the reference to the tumour entity on the specimen, cycle and day in cycle on the medication administration, the intention of the surgery, and codings with a fixed `system`. These elements must be removed before storing.
- **Repeated extraction creates duplicates.** The templates set neither `resourceId` nor `ifNoneExist`.

---

## BCP-47 Language Validation

**Cause:** The MII Ontoserver does not have a BCP-47 CodeSystem (`urn:ietf:bcp:47`) loaded. SDC 4.0.0 validates `language` bindings more strictly than earlier versions.

**Impact:** False-positive errors for correct BCP-47 language codes:

- `de-DE` and `de` — German
- `en-US` and `en` — English

Messages: *"The specified value ('de-DE') is not in the ValueSet 'All Languages'"* and *"The system URI could not be resolved for the code de-DE"*.

---

## OPS Codes Not in MII ValueSet

**Cause:** The MII oncology ValueSet for procedures does not contain all OPS subcategories required for senological documentation.

**Impact:** Correct OPS codes are reported as not found in the ValueSet.

Affected codes:

| OPS Code | Meaning |
|---|---|
| `5-870.a0` | Partial mastectomy — segmental resection |
| `5-870.a1` | Partial mastectomy — segmental resection with axillary dissection |
| `5-870.91` | Partial mastectomy — quadrant resection |
| `5-872` | Mastectomy |
| `5-401.11` | Axillary lymphadenectomy — level I |
| `5-402.11` | Axillary lymphadenectomy — level I–II |
| `5-402.12` | Axillary lymphadenectomy — level I–III |
| `5-886.17` | Other plastic reconstruction of the breast |
| `8-547.32` | Chemotherapy — regimen specified |

Additionally, OPS displays are reported as incorrect (*"Wrong Display Name"*) because OPS has no English-language displays and the TX server expects `en-US`.

---

## Questionnaire LinkId Mismatch

**Cause:** The QuestionnaireResponse examples reference LinkIds from the FSH-generated Questionnaire. The diagnosis template (JSON) uses different LinkIds.

**Impact:** Messages of the form *"LinkId 'diagnose-sct' not found in Questionnaire"* when validating QuestionnaireResponses.

Affected LinkIds:

- `diagnose-sct`, `diagnose-icd10`, `diagnose-icd10-display`, `diagnose-text`
- `seitenlokalisation`, `feststellungsdatum`, `recorded-date`
- `diagnosesicherung`, `stadium-summary`, `metastasen-summary`
- `clinical-status`, `onset`

{:.stu-note}
This issue will be resolved by aligning the QuestionnaireResponses with the diagnosis template (see [se-9bu](https://github.com/BIH-CEI/SenologieOnFHIR/issues)).

---

## Miscellaneous Messages

### FHIR Version Mismatch (subscriptions-backport)

The package `hl7.fhir.uv.subscriptions-backport` is declared for a different FHIR version than this IG (4.0.1). This is a transitive dependency issue and has no functional impact.

### IPS ValueSet Link

The IPS target site ValueSet (`http://hl7.org/fhir/uv/ips/ValueSet/target-site-uv-ips`) is included transitively via MII Pathology/Imaging. The link is reported as invalid because the IPS package is not declared directly as a dependency.

### Specimen Slicing (MII Patho)

The slice definition for `Specimen.processing:lagerprozess.extension` has a minimum of 0, but the slices yield a minimum of 1. This is a constraint issue in the MII Pathology profile.

### Observation Slicing (MII Onko Verlauf)

The MII Onko Verlauf profile expects an `Observation.code.coding:snomed` slice. The Senologie profile uses LOINC as the primary code, causing the SNOMED slice to be reported as missing.

### Observation Slicing (LOINC Discriminator)

General slicing messages of the form *"Slicing cannot be evaluated: discriminator …"*. These occur when the validator cannot resolve the slicing discriminator.

### Condition.extension (Template-driven)

`Condition.extension: minimum required = 1, but only found 0` — arises from template-based extraction where extensions are set depending on context.
