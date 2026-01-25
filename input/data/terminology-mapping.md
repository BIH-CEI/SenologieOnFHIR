# Terminology Mapping: Dotbase → FHIR/SNOMED

## Diagnose Codes

### Already SNOMED-mapped (18/24)
| Dotbase Term | SNOMED CT |
|--------------|-----------|
| Mammakarzinom | 254837009 |
| Carcinoma in situ (DCIS) | 109889007 |
| Fibrozystische Mastopathie | 27431007 |
| Mastodynie | 53430007 |
| B3 Läsion | 439401001 |
| Fibroadenom | 254845004 |
| Gynäkomastie | 4754008 |
| Mastitis non-puerperalis | 83620003 |
| Abszess non-puerperalis der Mamma | 16698000 |
| Mastitis puerperalis | 1287638006 |
| Abszess puerperalis der Mamma | 10745131000119107 |
| Genetische Hochrisikosituation | 718220008 |
| Rupturiertes Mammaimplantat | 237473006 |
| Einfache Mammazyste | 399123008 |
| Komplexe Mammazyste | 449837001 |
| Granulomatöse Mastitis | 237444008 |

### Needs SNOMED Mapping (6/24)
| Dotbase Term | Local Code | Proposed SNOMED |
|--------------|------------|-----------------|
| Mammakarzinom Rezidiv | bz-diagnose-bc-recurrence | 254837009 + clinicalStatus=recurrence |
| Kapselfibrose | 23747a4000 (typo?) | 449868002 (Capsular contracture of breast) |
| Sonstiges | bz-diagnose-sonstiges | Keep as local + text |
| Makromastie | bz-markomastie | 34911000 (Macromastia) |
| Nicht blutige Mamillensekretion | bz-mamillensekretion_nicht_blutig | 290076002 (Non-bloody nipple discharge) |
| Blutige Mamillensekretion | bz-mamillensekretion-blutig | 289909001 (Bloody nipple discharge) |
| Befund unklarer Dignität | bz-befund-unklarer-dignitaet | 169229003 (Finding of uncertain significance) |
| Anisomastie | bz-anistomastie | 22970007 (Asymmetry of breasts) |

## Seite (Laterality)
| Dotbase | Dotbase SNOMED | Correct SNOMED |
|---------|----------------|----------------|
| Rechts | 24028007 | 24028007 (Right) ✓ |
| Links | 7771000 | 7771000 (Left) ✓ |
| (missing) Beidseits | - | 51440002 (Bilateral) |

## Grad (Grading)
Dotbase uses simple 1-4, needs MII Onkologie grading codes:
| Dotbase | MII Onkologie |
|---------|---------------|
| 1 | mii-cs-onko-grading#1 |
| 2 | mii-cs-onko-grading#2 |
| 3 | mii-cs-onko-grading#3 |
| 4 | mii-cs-onko-grading#4 |

## Diagnostische Sicherheit
Dotbase terms → MII Diagnosesicherung mapping:
| Dotbase | MII Code | Description |
|---------|----------|-------------|
| Verdacht auf | 2 | klinisch |
| Gesichert | 7 | histologisch |
| Ausschluss | (verificationStatus=refuted) | |
| Zustand nach | (clinicalStatus=resolved) | |

## Metastasierung (M-Status)
| Dotbase | Proposed SNOMED |
|---------|-----------------|
| nicht metastasiert | 1229901006 (M0) |
| primär metastasiert | 1229903009 (M1) |
| sekundär metastasiert | 1229903009 (M1) + note |

## B3 Läsion Details
All already have SNOMED codes ✓
