### Guideline Annotation Schema

> Version: 0.1.0-pilot | As of: 2026-02-17
> Based on: S3 guideline on breast cancer v5.0 (December 2025), AWMF reg. 032-045OL

#### Purpose

This schema defines how guideline recommendations are annotated with medical data objects, versioned terminologies and a FHIR reference. The goal is a machine-readable data dictionary that makes the guideline usable as the normative basis of the FHIR specification.

#### Recommendation types in the S3 guideline

| Type | Description | Grade | Evidence level |
|---|---|---|---|
| Evidence-based recommendation | Systematic literature review | A (shall) / B (should) / 0 (may) | Oxford 1–5 or GRADE |
| Consensus-based recommendation (EK) | Expert consensus | — (follows from the wording shall/should/may) | — |
| Statement | Statement without a call to action | — | Oxford 1–5 or GRADE |

Consensus strength: strong consensus > 95 %, consensus > 75–95 %, majority agreement > 50–75 %.

#### Annotation per recommendation

Each recommendation is one YAML block on its chapter page, carrying the recommendation's metadata and original German text, a list of `datenobjekte` (data objects) with their terminology, and the FHIR mapping:

```yaml
id: "S3-5.0-4.73"
kapitel: "4.5.4"
empfehlung_nr: "4.73"
typ: "Evidenzbasiert"            # Evidenzbasiert | Konsensbasiert (EK) | Statement
empfehlungsgrad: "A"             # A | B | 0 | EK | -
text: ""                         # original wording, always in German

datenobjekte:
  - name: ""                     # the data object, in clinical language
    datentyp: ""                 # CodeableConcept | Quantity | string | boolean | ...
    terminologie:
      system: ""                 # e.g. SNOMED CT, LOINC, ICD-O-3
      version: ""                # e.g. 2025-01-31
      code: ""
      display: ""
      mapping_quelle: ""         # leitlinie | mii-kds | standard | vorschlag
      validiert: false           # true once confirmed by a clinical expert
    verpflichtung: ""            # obligat | empfohlen | optional

fhir_mapping:
  profil: ""                     # e.g. Senologie_Pathologie_Befund
  element: ""                    # e.g. Observation.valueCodeableConcept
  status: ""                     # mapped | partial | gap
```

The quality indicators in chapter 8 differ: there, `datenobjekte` sit under `zaehler` (numerator) and `nenner` (denominator) instead of at the top level.

#### Where the terminology comes from

The guideline supplies **clinical classifications**, but **no digital terminology codes**. It names TNM (8th edition), the WHO tumour classification (5th edition), BI-RADS (5th edition), ASCO/CAP HER2 scoring, Elston/Ellis grading, the B classification and ICD-10-GM codes; the SNOMED CT, LOINC and ICD-O-3 codes are added by us and have to be validated.

| mapping_quelle | Meaning | Review |
|---|---|---|
| `leitlinie` | Code/system is named explicitly in the guideline (e.g. ICD-10-GM C50) | not needed |
| `mii-kds` | Code comes from the MII core dataset for oncology (already validated) | not needed |
| `standard` | Established standard mapping (e.g. LOINC for ER/PR/HER2 biomarkers) | recommended |
| `vorschlag` | Assigned by us — **must still be validated** | **required** |

#### Conventions

1. **Recommendation ID**: `S3-5.0-{no}`, or `AGO-2025-{chapter}-{no}`
2. **Terminology versions**: always state the version valid at the time of the guideline
3. **Obligation** follows from the recommendation grade: grade A / "shall" = obligat, grade B / "should" = empfohlen, grade 0 / "may" = optional
4. **FHIR mapping status**: `mapped` = fully represented, `partial` = partly represented, `gap` = new profile/extension needed
5. **Language**: the recommendation text stays in the German original
6. **Terminology transparency**: every mapping states a `mapping_quelle`; all `vorschlag` mappings require review

#### File structure

The annotation lives as IG pages in `input/pagecontent/`, one page per chapter:

```
input/pagecontent/
  leitlinien-abdeckung.md               # Entry point: scope, chapter table, mapping status
  leitlinien-annotation-schema.md       # This document
  leitlinien-gap-analyse.md             # Consolidated gap analysis
  glossar-s3-snomed.md                  # Generated: coded terms
  s3-kap-3-allgemeines.md               # Annotation per chapter
  s3-kap-4-1-diagnostik.md
  ...
scripts/generate-glossar.py             # Reads the YAML blocks, writes glossary + CSV
exports/glossar-s3-snomed.csv           # Machine-readable, including terms without a code
```

The glossary and the CSV export are generated from the YAML blocks. After changing an annotation, run `python3 scripts/generate-glossar.py`; the page `glossar-s3-snomed.md` is never edited by hand.

{:.stu-note}
The chapter pages themselves are **German only**, since they quote the S3 guideline verbatim. Their links on the [S3 Guideline Coverage](leitlinien-abdeckung.html) page point to the German site.
