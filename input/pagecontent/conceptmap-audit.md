### ConceptMap-Audit: SNOMED CT als Common Data Model

Die FHIR-Schicht ist **SNOMED-zentriert**. CQL und Validation arbeiten auf SNOMED, LOINC und HGNC. Output-Mappings übersetzen erst beim Export in proprietäre Codes (oBDS-Ziffern, OncoBox-Strings, IQTIG-Codes, IRegG-Schlüssel).

#### Vorhandene ConceptMaps

| Quelle | Ziel | Datei | Stand |
|---|---|---|---|
| SNOMED CT | oBDS Seitenlokalisation | obds-conceptmaps-reverse.fsh | ✓ |
| SNOMED CT | oBDS Intention | dito | ✓ |
| SNOMED CT | oBDS Grading | dito | ✓ |
| SNOMED CT | oBDS Residualstatus | dito | ✓ |
| SNOMED CT | oBDS Therapie-Stellung | dito | ✓ |
| SNOMED CT | oBDS Therapieart | dito | ✓ |
| SNOMED CT | oBDS Fernmetastasen-Lokalisation | dito | ✓ |
| SNOMED CT | oBDS Verlauf-Gesamtbeurteilung | dito | ✓ |
| SNOMED CT | oBDS Diagnosesicherung (Biopsie) | cm-sct-to-obds-diagnosesicherung.fsh | ✓ NEU |
| SNOMED CT (Quadrant) | ICD-O-3 Topographie | obds-cm-quadrant-icdo3.fsh | ✓ |
| SNOMED CT | ATC (Medikation) | cm-senologie-medikation-sct-atc.fsh | ✓ |
| SNOMED CT | ASK (Medikation) | cm-senologie-medikation-sct-ask.fsh | ✓ |
| OncoBox Endokrine Substanzklasse | ATC | cm-oncobox-endokrine-substanz-atc.fsh | ✓ |
| MII Verlauf Gesamtbeurteilung | OncoBox Verlauf-Ereignis | cm-oncobox-verlauf-gesamtbeurteilung-ereignis.fsh | ✓ |

#### Lücken (zu ergänzen)

**SNOMED → oBDS (5 Lücken):**
- ❌ SNOMED HER2-IHC-Codes → oBDS HER2 (P/N/U)
- ❌ SNOMED ER/PR-Status → oBDS Hormonrezeptor (P/N/U)
- ❌ SNOMED Histologie → ICD-O-3 (Morphologie 8xxx/3)
- ❌ SNOMED Operation → oBDS OPS-Codes (gibt's bisher noch nicht; OPS ist primärer Operation-Code, oBDS-spezifisch nur "Intention")
- ❌ SNOMED Komplikationen → oBDS Komplikations-Kürzel

**SNOMED → OncoBox Brust 2.0 (komplette Linie):**
- ❌ SNOMED Histologie (Lobular, NST, etc.) → OncoBox Tumortyp (ICD-O-3-Code)
- ❌ SNOMED Operation-Codes → OncoBox OP-Codes (gibt es nur indirekt über OPS)
- ❌ SNOMED HER2 → OncoBox Her2neuStatus
- ❌ SNOMED ER/PR → OncoBox HormonrezeptorStatus
- ❌ SNOMED Grading → OncoBox Grading (1-5)
- ❌ SNOMED Therapie-Typ → OncoBox Systemtherapie_Therapieart (CHT/HO/IM/ZS)
- ❌ SNOMED Komplikationen → OncoBox OP_Komplikationen_Art

**SNOMED → IQTIG QS 18.1 (komplette Linie):**
- ❌ SNOMED Komplikationen → IQTIG QS Komplikations-Schlüssel
- ❌ SNOMED Markierungsart → IQTIG BRUST:DRAHT (M/S/T/N)
- ❌ SNOMED Histologie → IQTIG O:HISTMORPH
- ❌ SNOMED Grading → IQTIG O:GRADING
- ❌ SNOMED Multifokalität → IQTIG O:MULTIFOK

**SNOMED → IRegG V4.1.1 (komplette Linie):**
- ❌ SNOMED Implantat-Typ → IRegG ABI_ArtikelTypSchluessel
- ❌ SNOMED OP-Art → IRegG OperationsTypSchluessel

#### Strategie

1. **Output-Maps prüfen ob Wert-Mappings hart-codiert sind oder ConceptMap-Calls.** Bei hart-codierten Werten (z.B. `where code = '...P'`) sollten wir auf `translate(...)`-Calls über ConceptMaps umstellen.

2. **Fehlende ConceptMaps anlegen.** Insbesondere ein Pflichtbestand pro Target:
   - oBDS: Diagnosesicherung, HER2, ER/PR, Histologie  
   - OncoBox: Histologie, HER2/ER/PR, Therapie-Typ
   - IQTIG: Komplikationen, Markierungen, Histologie/Grading
   - IRegG: Implantat-Typ

3. **CQL-Defines auf SNOMED-First-Pattern**: SNOMED primary, OPS/LOINC als Fallback (siehe `QualitaetsindikatorenLeitlinie.cql` v0.4.0 für QI-2 als Vorbild).

#### Pipeline-Konsistenz-Check

Pro Output-Target sollten die Maps idealerweise **nur** über SNOMED-Codes (im Bundle) lesen und über ConceptMap-`translate()` auf das Zielformat schreiben:

```fml
val.coding as c where system = 'http://snomed.info/sct'
  -> tgt.her2neuStatus = translate(c, 'cm-sct-to-obds-her2', 'code')
```

Das macht die Maps wartungsarm: Code-Updates passieren in der ConceptMap, nicht im Map-File.
