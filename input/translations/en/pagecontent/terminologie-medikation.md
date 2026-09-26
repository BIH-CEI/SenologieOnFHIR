### Terminology: Systemic Therapy Medication

This page documents the terminology decisions and mappings for the coding of systemic therapy agents in the Senology Core Dataset (Kerndatensatz Senologie).

#### Comparison of Coding Systems

Four systems were evaluated for coding oncological active substances in senology:

| System | URI | Publisher | Granularity | Suitability |
|--------|-----|-----------|-------------|-------------|
| **SNOMED CT** | `http://snomed.info/sct` | SNOMED International | Active substance + dosage form | Primary coding (selected) |
| **ATC** | `http://fhir.de/CodeSystem/bfarm/atc` | BfArM | Active substance (no dosage form) | Secondary (MII Onko parent) |
| **ASK** | `http://fhir.de/CodeSystem/ask` | BfArM | Active substance (no dosage form) | Reference mapping |
| **UNII** | `http://fdasis.nlm.nih.gov` | FDA/NLM | Active substance (no dosage form) | Secondary (MII Onko parent) |

#### Decision: SNOMED CT as Primary Coding

SNOMED CT was selected as the primary coding system because it is the only system that can distinguish **pegylated liposomal doxorubicin** (772118008) from conventional doxorubicin (372817009). In ATC, ASK, and UNII, both fall under the same code.

The MII Onko parent profile (`MII_PR_Onko_Systemische_Therapie_Medikation`) additionally provides ATC and UNII slices that can be used in parallel.

#### Active Substance Overview

| SNOMED CT | Active Substance | ATC | ASK | Group |
|-----------|-----------------|-----|-----|-------|
| 715958001 | Palbociclib | L01EF01 | 37539 | CDK4/6 inhibitor |
| 732257004 | Ribociclib | L01EF02 | 41432 | CDK4/6 inhibitor |
| 761851004 | Abemaciclib | L01EF03 | 41207 | CDK4/6 inhibitor |
| 387381009 | Methotrexate | L01BA01 | 00658 | Antimetabolite |
| 387172005 | Fluorouracil | L01BC02 | 07374 | Antimetabolite |
| 386920008 | Gemcitabine | L01BC05 | 26094 | Antimetabolite |
| 386906001 | Capecitabine | L01BC06 | 28663 | Antimetabolite |
| 372817009 | Doxorubicin | L01DB01 | 06459 | Anthracycline |
| 772118008 | Doxorubicin peg. lipo. | L01DB01* | 06459* | Anthracycline |
| 372715008 | Daunorubicin | L01DB02 | 07162 | Anthracycline |
| 417916005 | Epirubicin | L01DB03 | 22965 | Anthracycline |
| 372539000 | Idarubicin | L01DB06 | 22865 | Anthracycline |
| 386913001 | Mitoxantrone | L01DB07 | 23189 | Anthracycline |
| 386918005 | Docetaxel | L01CD02 | 26819 | Taxane |
| 387318005 | Cisplatin | L01XA01 | 15579 | Platinum compound |
| 386905002 | Carboplatin | L01XA02 | 23168 | Platinum compound |
| 387420009 | Cyclophosphamide | L01AA01 | 00533 | Alkylating agent |
| 387331000 | Mitomycin | L01DC03 | 07643 | Other |
| 708166000 | Eribulin | L01XX41 | 34925 | Other |

*\* ATC and ASK do not distinguish between conventional and pegylated liposomal doxorubicin (equivalence: `wider`)*

#### ConceptMaps

Two ConceptMaps formally document the mappings as FHIR resources:

- [SNOMED CT → ATC](ConceptMap-CM-Senologie-Medikation-SCT-ATC.html): Mapping to BfArM ATC classification 2026
- [SNOMED CT → ASK](ConceptMap-CM-Senologie-Medikation-SCT-ASK.html): Mapping to BfArM pharmaceutical substance catalogue (Arzneistoffkatalog) 2026

#### Mapping Quality

| Determinant (MapQual) | Assessment |
|-----------------------|------------|
| D4 — Equivalence published | 0 (published in ConceptMap) |
| D5 — Equivalence assessment | 0 (17/19 `equivalent`, 2/19 `wider`) |
| D7 — Purpose documented | 0 (clinical documentation of breast cancer therapy) |
| D12 — Validation method | 2 (individual validation via terminology server) |

All codes were validated against local terminology server instances:
- SNOMED CT: Snowstorm (International Edition 2025-12-01 + German Extension)
- ATC: BfArM ATC_DDD_GM 2026
- ASK: BfArM Arzneistoffkatalog 20260105

#### German SNOMED Translations

Of the 19 SNOMED codes, 17 have an official German translation in the SNOMED CT German Edition. The following two lack a German translation:
- 772118008 — Doxorubicin hydrochloride pegylated liposome
- 387381009 — Methotrexate

These have been flagged for submission to BfArM (SNOMED CT German Translation Group).
