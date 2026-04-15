### Terminologie: Systemtherapie-Medikation

Diese Seite dokumentiert die Terminologie-Entscheidungen und Mappings für die Codierung von Systemtherapie-Medikamenten im Kerndatensatz Senologie.

#### Coding-Systeme im Vergleich

Für die Codierung onkologischer Wirkstoffe in der Senologie wurden vier Systeme evaluiert:

| System | URI | Herausgeber | Granularität | Eignung |
|--------|-----|-------------|--------------|---------|
| **SNOMED CT** | `http://snomed.info/sct` | SNOMED International | Wirkstoff + Darreichungsform | Primäres Coding (gewählt) |
| **ATC** | `http://fhir.de/CodeSystem/bfarm/atc` | BfArM | Wirkstoff (keine Darreichungsform) | Sekundär (MII Onko Parent) |
| **ASK** | `http://fhir.de/CodeSystem/ask` | BfArM | Wirkstoff (keine Darreichungsform) | Referenz-Mapping |
| **UNII** | `http://fdasis.nlm.nih.gov` | FDA/NLM | Wirkstoff (keine Darreichungsform) | Sekundär (MII Onko Parent) |

#### Entscheidung: SNOMED CT als primäres Coding

SNOMED CT wurde als primäres Coding-System gewählt, weil es als einziges System **pegyliert liposomales Doxorubicin** (772118008) von konventionellem Doxorubicin (372817009) unterscheiden kann. In ATC, ASK und UNII fallen beide unter denselben Code.

Das MII Onko Elternprofil (`MII_PR_Onko_Systemische_Therapie_Medikation`) stellt zusätzlich ATC- und UNII-Slices bereit, die parallel genutzt werden können.

#### Wirkstoff-Übersicht

| SNOMED CT | Wirkstoff | ATC | ASK | Gruppe |
|-----------|-----------|-----|-----|--------|
| 715958001 | Palbociclib | L01EF01 | 37539 | CDK4/6-Inhibitor |
| 732257004 | Ribociclib | L01EF02 | 41432 | CDK4/6-Inhibitor |
| 761851004 | Abemaciclib | L01EF03 | 41207 | CDK4/6-Inhibitor |
| 387381009 | Methotrexate | L01BA01 | 00658 | Antimetabolit |
| 387172005 | Fluorouracil | L01BC02 | 07374 | Antimetabolit |
| 386920008 | Gemcitabine | L01BC05 | 26094 | Antimetabolit |
| 386906001 | Capecitabine | L01BC06 | 28663 | Antimetabolit |
| 372817009 | Doxorubicin | L01DB01 | 06459 | Anthracyclin |
| 772118008 | Doxorubicin peg. lipo. | L01DB01* | 06459* | Anthracyclin |
| 372715008 | Daunorubicin | L01DB02 | 07162 | Anthracyclin |
| 417916005 | Epirubicin | L01DB03 | 22965 | Anthracyclin |
| 372539000 | Idarubicin | L01DB06 | 22865 | Anthracyclin |
| 386913001 | Mitoxantrone | L01DB07 | 23189 | Anthracyclin |
| 386918005 | Docetaxel | L01CD02 | 26819 | Taxan |
| 387318005 | Cisplatin | L01XA01 | 15579 | Platinverbindung |
| 386905002 | Carboplatin | L01XA02 | 23168 | Platinverbindung |
| 387420009 | Cyclophosphamide | L01AA01 | 00533 | Alkylanz |
| 387331000 | Mitomycin | L01DC03 | 07643 | Sonstiges |
| 708166000 | Eribulin | L01XX41 | 34925 | Sonstiges |

*\* ATC und ASK unterscheiden nicht zwischen konventionellem und pegyliert liposomalem Doxorubicin (equivalence: `wider`)*

#### ConceptMaps

Zwei ConceptMaps dokumentieren die Mappings formal als FHIR-Ressourcen:

- [SNOMED CT → ATC](ConceptMap-CM-Senologie-Medikation-SCT-ATC.html): Mapping auf BfArM ATC-Klassifikation 2026
- [SNOMED CT → ASK](ConceptMap-CM-Senologie-Medikation-SCT-ASK.html): Mapping auf BfArM Arzneistoffkatalog 2026

#### Mapping-Qualität

| Determinante (MapQual) | Bewertung |
|------------------------|-----------|
| D4 — Equivalence published | 0 (publiziert in ConceptMap) |
| D5 — Equivalence assessment | 0 (17/19 `equivalent`, 2/19 `wider`) |
| D7 — Purpose documented | 0 (klinische Dokumentation Brustkrebstherapie) |
| D12 — Validation method | 2 (Einzelvalidierung via Terminologieserver) |

Alle Codes wurden gegen lokale Terminologieserver-Instanzen validiert:
- SNOMED CT: Snowstorm (International Edition 2025-12-01 + German Extension)
- ATC: BfArM ATC_DDD_GM 2026
- ASK: BfArM Arzneistoffkatalog 20260105

#### Deutsche SNOMED-Übersetzungen

Von den 19 SNOMED-Codes haben 17 eine offizielle deutsche Übersetzung in der SNOMED CT German Edition. Ohne deutsche Übersetzung:
- 772118008 — Doxorubicin hydrochloride pegylated liposome
- 387381009 — Methotrexate

Diese wurden zur Einreichung beim BfArM (SNOMED CT German Translation Group) vorgemerkt.
