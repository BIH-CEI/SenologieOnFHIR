### ConceptMap Audit: SNOMED CT as Common Data Model

The FHIR layer is **SNOMED-centric**. CQL and validation operate on SNOMED, LOINC, and HGNC. Output mappings translate to proprietary codes (oBDS numbers, OncoBox strings, IQTIG codes, IRegG keys) only at export time.

#### Existing ConceptMaps

| Source | Target | File | Status |
|---|---|---|---|
| SNOMED CT | oBDS lateral localisation (Seitenlokalisation) | obds-conceptmaps-reverse.fsh | ✓ |
| SNOMED CT | oBDS intention (Intention) | dito | ✓ |
| SNOMED CT | oBDS grading | dito | ✓ |
| SNOMED CT | oBDS residual status (Residualstatus) | dito | ✓ |
| SNOMED CT | oBDS therapy intent (Therapie-Stellung) | dito | ✓ |
| SNOMED CT | oBDS therapy type (Therapieart) | dito | ✓ |
| SNOMED CT | oBDS distant metastasis localisation (Fernmetastasen-Lokalisation) | dito | ✓ |
| SNOMED CT | oBDS overall disease course assessment (Verlauf-Gesamtbeurteilung) | dito | ✓ |
| SNOMED CT | oBDS diagnosis verification (Diagnosesicherung) (biopsy) | cm-sct-to-obds-diagnosesicherung.fsh | ✓ NEW |
| SNOMED CT (quadrant) | ICD-O-3 topography | obds-cm-quadrant-icdo3.fsh | ✓ |
| SNOMED CT | ATC (medication) | cm-senologie-medikation-sct-atc.fsh | ✓ |
| SNOMED CT | ASK (medication) | cm-senologie-medikation-sct-ask.fsh | ✓ |
| OncoBox endocrine substance class | ATC | cm-oncobox-endokrine-substanz-atc.fsh | ✓ |
| MII overall disease course assessment | OncoBox course event (Verlauf-Ereignis) | cm-oncobox-verlauf-gesamtbeurteilung-ereignis.fsh | ✓ |

#### Gaps (to be added)

**SNOMED → oBDS (5 gaps):**
- ❌ SNOMED HER2 IHC codes → oBDS HER2 (P/N/U)
- ❌ SNOMED ER/PR status → oBDS hormone receptor status (Hormonrezeptor) (P/N/U)
- ❌ SNOMED histology → ICD-O-3 (morphology 8xxx/3)
- ❌ SNOMED surgery → oBDS OPS codes (not yet available; OPS is the primary surgery code, oBDS-specific only for "intention")
- ❌ SNOMED complications → oBDS complication abbreviations (Komplikations-Kürzel)

**SNOMED → OncoBox Breast 2.0 (complete pipeline):**
- ❌ SNOMED histology (lobular, NST, etc.) → OncoBox tumour type (ICD-O-3 code)
- ❌ SNOMED surgery codes → OncoBox surgery codes (only available indirectly via OPS)
- ❌ SNOMED HER2 → OncoBox Her2neuStatus
- ❌ SNOMED ER/PR → OncoBox HormonrezeptorStatus
- ❌ SNOMED grading → OncoBox grading (1–5)
- ❌ SNOMED therapy type → OncoBox Systemtherapie_Therapieart (CHT/HO/IM/ZS)
- ❌ SNOMED complications → OncoBox OP_Komplikationen_Art

**SNOMED → IQTIG QS 18.1 (complete pipeline):**
- ❌ SNOMED complications → IQTIG QS complication key (Komplikations-Schlüssel)
- ❌ SNOMED marking type (Markierungsart) → IQTIG BRUST:DRAHT (M/S/T/N)
- ❌ SNOMED histology → IQTIG O:HISTMORPH
- ❌ SNOMED grading → IQTIG O:GRADING
- ❌ SNOMED multifocality (Multifokalität) → IQTIG O:MULTIFOK

**SNOMED → IRegG V4.1.1 (complete pipeline):**
- ❌ SNOMED implant type → IRegG ABI_ArtikelTypSchluessel
- ❌ SNOMED surgery type (OP-Art) → IRegG OperationsTypSchluessel

#### Strategy

1. **Check whether output maps use hard-coded value mappings or ConceptMap calls.** Where values are hard-coded (e.g. `where code = '...P'`), these should be refactored to `translate(...)` calls via ConceptMaps.

2. **Create missing ConceptMaps.** In particular, a mandatory set per target:
   - oBDS: diagnosis verification, HER2, ER/PR, histology
   - OncoBox: histology, HER2/ER/PR, therapy type
   - IQTIG: complications, markings, histology/grading
   - IRegG: implant type

3. **CQL defines on SNOMED-first pattern**: SNOMED primary, OPS/LOINC as fallback (see `QualitaetsindikatorenLeitlinie.cql` v0.4.0, QI-2 as reference implementation).

#### Pipeline Consistency Check

For each output target, maps should ideally read **only** via SNOMED codes (from the Bundle) and write to the target format via ConceptMap `translate()`:

```fml
val.coding as c where system = 'http://snomed.info/sct'
  -> tgt.her2neuStatus = translate(c, 'cm-sct-to-obds-her2', 'code')
```

This keeps maps low-maintenance: code updates happen in the ConceptMap, not in the map file.
