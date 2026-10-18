### Glossary (SNOMED CT + S3 Guideline)

This glossary lists the clinical terms that carry a terminology code in the [guideline annotation](leitlinien-abdeckung.html) — for each term the code, the S3 recommendation it comes from, and the FHIR element it is mapped to.

How this differs from the neighbouring pages:

- [Semantic Annotation](semantische-annotation.html) starts from the **profile**: which elements of the Senologie profiles are coded?
- This glossary starts from the **guideline**: which terms does the S3 guideline require, and how are they coded?

The two tables cannot be joined row by row: the annotation names data objects in clinical language, the profile table uses slice names.

{:.stu-note}
Mappings with `mapping_quelle: vorschlag` were **assigned by us and have not been clinically validated**. They are subject to review, not a decision. The provenance values are defined in the [annotation schema](leitlinien-annotation-schema.html).

The annotation chapters themselves are available in German only, so the links in the tables below point to the German site. The glossary itself is generated in both languages.

#### Scope

| Metric | Value |
|---|---|
| Annotated recommendations and quality indicators | 376 |
| Terms with a terminology code | 141 |
| Terms without a code (mapping gap) | 671 |
| Code systems used | 10 |

#### Code systems in the glossary

| Code system | Terms |
|---|---|
| SNOMED CT | 40 |
| ATC | 37 |
| LOINC | 37 |
| ICD-10-GM | 9 |
| HGNC | 5 |
| OPS | 4 |
| ICD-O-3 | 3 |
| UCUM | 3 |
| ACR BI-RADS | 2 |
| HL7 AdministrativeGender | 1 |

#### Mapping provenance

| mapping_quelle | Terms | Review needed |
|---|---|---|
| `standard` | 80 | recommended |
| `vorschlag` | 33 | **yes** |
| `(not stated)` | 18 | — |
| `leitlinie` | 10 | no — named in the guideline |

#### Terms

| Term | Code system | Code | Display | S3 rec. | FHIR profile | Element | Provenance |
|---|---|---|---|---|---|---|---|
| Abemaciclib | ATC | `L01EF03` | Abemaciclib | [4.149](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `standard` |
| ACMG-Klassifikation | LOINC | `53037-8` | Genetic disease assessed | [3.31](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| ADH-Diagnose | SNOMED CT | `427785007` | Atypical ductal hyperplasia of breast | [4.38](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Diagnose_Benigne + EX_Senologie_B… | `Condition.code (SNOMED 427785007)` | `standard` |
| Alpelisib | ATC | `L01EM03` | Alpelisib | [5.41](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Alter | LOINC | `30525-0` | Age | [3.7](../de/s3-kap-3-allgemeines.html) | Patient | `Patient.birthDate` | `standard` |
| Alter der Patientin | LOINC | `30525-0` | Age | [4.35](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html), [4.83](../de/s3-kap-4-5-pathologie.html) | Procedure (Strahlentherapie) + EX_Senologie… | — | `standard` |
| Angiosarkom-Typ | ICD-O-3 | `9120/3` | Angiosarkom | [7.66](../de/s3-kap-7-spezielle-situationen.html) | Senologie_Diagnose_Maligne / Senologie_Oper… | — | `leitlinie` |
| Anpassungsstoerung (ICD-10) | ICD-10-GM | `F43.2` | Anpassungsstoerungen | [6.11](../de/s3-kap-6-betreuung.html) | — | — | `leitlinie` |
| Anti-HER2-Therapie (Rezidiv) | ATC | `L01FD01` | Trastuzumab | [5.15](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Anzahl befallener axillaerer LK | LOINC | `21893-3` | Regional lymph nodes positive [#] Specimen | [4.113](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `ex-senologie-radiation-target` | `standard` |
| Anzahl befallener axillaerer Lymphknoten | LOINC | `21893-3` | Regional lymph nodes positive [#] Specimen | [4.110](../de/s3-kap-4-6-strahlentherapie.html), [QI-14](../de/s3-kap-8-qualitaetsindikatoren.html) | Senologie_Strahlentherapie + MII Onkologie … | — | `standard` |
| Anzahl befallener Lymphknoten | LOINC | `21893-3` | Regional lymph nodes positive [#] Specimen | [4.69](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund / MII Onkologie… | `Observation (TNM pN)` | — |
| Anzahl entfernter Lymphknoten | LOINC | `21894-1` | Regional lymph nodes examined [#] Specimen | [4.69](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund / MII Onkologie… | `Observation (TNM pN)` | — |
| Atezolizumab | ATC | `L01FF05` | Atezolizumab | [5.47](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Axillaere Lymphadenektomie durchgefuehrt | SNOMED CT | `234262008` | Excision of axillary lymph node (procedure) | [6.21](../de/s3-kap-6-betreuung.html) | — | — | `vorschlag` |
| Bestrahlungszielgebiet | SNOMED CT | `76752008` | Breast structure (body structure) | [4.94](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `Procedure.code + ex-senologie-radiation-target + …` | `vorschlag` |
| Bevacizumab | ATC | `L01FG01` | Bevacizumab | [5.53](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| BIA-ALCL Diagnose | ICD-O-3 | `9714/3` | Anaplastic large cell lymphoma, ALK negative | [7.69](../de/s3-kap-7-spezielle-situationen.html) | Senologie_Brustimplantat | — | `vorschlag` |
| Bildgebungsmodalität | SNOMED CT | `450566007` | Digital breast tomosynthesis (procedure) | [3.21](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Boost-Dosis | UCUM | `Gy` | — | [4.98](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `ex-senologie-boost-applied` | `standard` |
| BRCA-Mutationsstatus | HGNC | `HGNC:1100 (BRCA1), HGNC:1101 (BRCA2)` | — | [3.36](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| BRCA1-assoziierter Phänotyp | SNOMED CT | `706970001` | Triple negative malignant neoplasm of breast (disorder) | [3.33](../de/s3-kap-3-allgemeines.html) | Senologie_Pathologie_Befund | `Observation (Grading, ER, PR, HER2)` | `vorschlag` |
| BRCA1/2-Teststatus negativ | HGNC | `HGNC:1100 (BRCA1), HGNC:1101 (BRCA2)` | — | [3.40](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| Brust-MRT (Rezidivdiagnostik) | SNOMED CT | `241615005` | Magnetic resonance imaging of breast (procedure) | [5.3](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Bildgebung | — | `standard` |
| Brustkrebsrisiko-Bewertung | SNOMED CT | `395085008` | Assessment of risk for breast cancer (procedure) | [3.13](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Brustultraschall (Rezidivdiagnostik) | SNOMED CT | `16310003` | Ultrasonography of breast (procedure) | [5.2](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Bildgebung | — | `standard` |
| Capecitabin | ATC | `L01BC06` | Capecitabin | [4.155](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.code + ex-senologie-therapy-cycle + ex-…` | `standard` |
| Capivasertib | ATC | `L01EM04` | Capivasertib | [5.39](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `vorschlag` |
| Datopotamab Deruxtecan | ATC | `L01FX18` | Datopotamab deruxtecan | [5.45](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `vorschlag` |
| DCIS-Diagnose | ICD-10-GM | `D05.1` | Intraduktales Carcinoma in situ der Brustdruese | [4.29](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Diagnose_Maligne | `Condition.code (D05.1)` | `leitlinie` |
| DCIS-Groesse | LOINC | `21889-1` | Size Tumor | [4.30](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Diagnose_Maligne + Senologie_Path… | — | `standard` |
| Denosumab (Osteoporose-Dosis) | ATC | `M05BX04` | Denosumab | [4.172](../de/s3-kap-4-8-systemische-therapie.html) | — | — | `standard` |
| Distress-Thermometer Score | LOINC | `66736-3` | Distress Thermometer | [6.3](../de/s3-kap-6-betreuung.html) | — | — | `standard` |
| ECOG Performance Status | LOINC | `89247-1` | ECOG Performance Status | [5.49](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Einzeldosis pro Fraktion | UCUM | `Gy` | — | [4.95](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `ex-senologie-total-dose-gy + ex-senologie-session…` | `standard` |
| Elacestrant | ATC | `L02BA04` | Elacestrant | [5.38](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `vorschlag` |
| ER - Prozentsatz positive Tumorzellkerne | LOINC | `85325-9` | Cells.estrogen receptor/100 cells in Breast cancer specimen… | [4.72](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund | `Observation (contained/referenced)` | — |
| ER-Status (Metastase) | LOINC | `85337-4` | — | [4.71](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + Senologie_Gen… | — | — |
| ER-Status (Rezidiv) | LOINC | `85337-4` | Estrogen receptor Ag [Presence] in Breast cancer specimen b… | [5.7](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Pathologie_Befund | — | `standard` |
| ESR1-Mutationsstatus | HGNC | `HGNC:3467` | ESR1 | [5.38](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Everolimus | ATC | `L01EG02` | Everolimus | [5.40](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Exemestan | ATC | `L02BG06` | Exemestan | [5.40](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Familienanamnese Brust-/Eierstockkrebs | ICD-10-GM | `Z80.-, Z85.-` | Bösartige Neubildung in der Familien-/Eigenanamnese | [3.27](../de/s3-kap-3-allgemeines.html) | — | — | `leitlinie` |
| Familienanamnese Brustkrebs | ICD-10-GM | `Z80.-` | Bösartige Neubildung in der Familienanamnese | [3.11](../de/s3-kap-3-allgemeines.html) | — | — | `leitlinie` |
| FEA-Diagnose | SNOMED CT | `860895001` | Flat epithelial atypia of breast | [4.40](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Diagnose_Benigne + EX_Senologie_B… | `Condition.code (SNOMED 860895001)` | `standard` |
| Fixationsmittel | SNOMED CT | `431510009` | Formalin fixation (procedure) | [4.66](../de/s3-kap-4-5-pathologie.html) | — | — | — |
| Fulvestrant (Kombination mit Capivasertib) | ATC | `L02BA03` | Fulvestrant | [5.39](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Fulvestrant (Kombination) | ATC | `L02BA03` | Fulvestrant | [5.37](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `standard` |
| GAD-7 Score | LOINC | `70274-6` | Generalized anxiety disorder 7 item (GAD-7) total score | [6.3](../de/s3-kap-6-betreuung.html) | — | — | `standard` |
| Genetische Beratung nach Befunderhalt | SNOMED CT | `370995009` | Genetic counseling (procedure) | [3.32](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| Genetische Beratung vor Testung | SNOMED CT | `370995009` | Genetic counseling (procedure) | [3.32](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| Gesamtdosis | UCUM | `Gy` | — | [4.33](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html), [4.95](../de/s3-kap-4-6-strahlentherapie.html) | Procedure (Strahlentherapie) + Extensions /… | `EX_Senologie_TotalDoseGy, EX_Senologie_SessionCou…` | `standard` |
| Geschlecht des Patienten | HL7 AdministrativeGender | `male` | Male | [7.30](../de/s3-kap-7-spezielle-situationen.html) | Patient | — | `standard` |
| GnRH-Analoga-Gabe | ATC | `L02AE` | GnRH-Analoga | [7.2](../de/s3-kap-7-spezielle-situationen.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Grading | SNOMED CT | `54102005` | G3 grade (finding) | [3.33](../de/s3-kap-3-allgemeines.html) | Senologie_Pathologie_Befund | `Observation (Grading, ER, PR, HER2)` | `standard` |
| HER2 IHC Score | LOINC | `85319-2` | HER2 [Presence] in Breast cancer specimen by Immune stain | [4.73](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund | — | — |
| HER2 ISH-Ergebnis | LOINC | `85318-4` | HER2 [Presence] in Breast cancer specimen by FISH | [4.73](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund | — | — |
| HER2-low Status | LOINC | `85319-2` | — | [5.42](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| HER2-Status | LOINC | `85319-2` | HER2 [Presence] in Breast cancer specimen by Immune stain | [4.70](../de/s3-kap-4-5-pathologie.html), [4.157](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_Pathologie_Befund + MII Onkologie… | — | — |
| HER2-Status (Metastase) | LOINC | `85319-2` | — | [4.71](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + Senologie_Gen… | — | — |
| HER2-Status (Rezidiv) | LOINC | `85319-2` | HER2 [Presence] in Breast cancer specimen by Immune stain | [5.7](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Pathologie_Befund | — | `standard` |
| HER2-Status (Voraussetzung) | LOINC | `85319-2` | HER2 [Presence] in Breast cancer specimen by Immune stain | [5.24](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.code + Extension:therapy-line` | `standard` |
| Hirnmetastasen-Status | ICD-10-GM | `C79.3` | Sekundaere boesartige Neubildung des Gehirns und der Hirnha… | [5.28](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `leitlinie` |
| Hormonrezeptor-Status | LOINC | `85337-4` | Estrogen receptor Ag [Presence] in Breast cancer specimen b… | [4.140](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_Geplante_Systemtherapie + Senolog… | `ServiceRequest.code / Procedure.code` | `standard` |
| Inavolisib | ATC | `L01EM05` | Inavolisib | [5.37](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `vorschlag` |
| Inflammatorisches Mammakarzinom | ICD-10-GM | `C50.9 + Zusatz` | — | [4.51](../de/s3-kap-4-4-operative-therapie.html) | Senologie_Operation | `Procedure.code + Procedure.reasonCode` | `leitlinie` |
| Inflammatorisches Mammakarzinom | ICD-O-3 | `8530/3` | Inflammatory carcinoma | [4.122](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `ex-senologie-treatment-intention` | `standard` |
| Informationsbedarf Langzeitüberlebende | SNOMED CT | `390866009` | Assessment of information needs (procedure) | [3.4](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Intensivierte Früherkennung (iFE) | SNOMED CT | `268547008` | Screening for malignant neoplasm of breast (procedure) | [3.35](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Kapseldurchbruch | SNOMED CT | `371153006` | Extranodal extension of tumor (finding) | [4.69](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund / MII Onkologie… | `Observation (TNM pN)` | — |
| Kardiale Funktion (LVEF) | LOINC | `10230-1` | Left ventricular Ejection fraction | [4.164](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.period` | `standard` |
| Ki67 postendokrin | LOINC | `85336-6` | MIB-1 (Ki-67) [Percentile] in Breast cancer specimen by Imm… | [4.145](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_Pathologie_Befund | `Observation (Ki67)` | `standard` |
| Ki67-Proliferationsindex | LOINC | `85336-6` | MIB-1 (Ki-67) [Percentile] in Breast cancer specimen by Imm… | [4.70](../de/s3-kap-4-5-pathologie.html), [4.74](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + MII Onkologie… | — | — |
| Klinische Brustuntersuchung | SNOMED CT | `185712003` | Clinical breast examination (procedure) | [3.14](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Klinische Brustuntersuchung | SNOMED CT | `185712006` | Clinical breast examination (procedure) | [4.1](../de/s3-kap-4-1-diagnostik.html) | Senologie_Bildgebung_Befund + Senologie_Bil… | — | — |
| Knochendichtemessung (DXA) | LOINC | `38269-7` | DXA Bone density | [4.168](../de/s3-kap-4-8-systemische-therapie.html) | — | — | `standard` |
| Kontralaterale prophylaktische Mastektomie | OPS | `5-870` | Exzision Mamma | [3.39](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Lateralitaet Tumor | SNOMED CT | `80248007` | Left breast structure (body structure) | [4.97](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | — | `vorschlag` |
| Lymphoedem diagnostiziert | ICD-10-GM | `I97.2` | Lymphoedem nach Mastektomie | [6.28](../de/s3-kap-6-betreuung.html) | — | — | `vorschlag` |
| Lymphoedem vorhanden | ICD-10-GM | `I97.2` | Lymphoedem nach Mastektomie | [6.21](../de/s3-kap-6-betreuung.html) | — | — | `vorschlag` |
| Mammographie (Rezidivdiagnostik) | SNOMED CT | `71651007` | Mammography (procedure) | [5.2](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Bildgebung | — | `standard` |
| Mammographie-Screening | SNOMED CT | `241055006` | Mammography screening (procedure) | [3.16](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| Mammographische Dichte | ACR BI-RADS | `A\|B\|C\|D` | Breast composition categories | [3.25](../de/s3-kap-3-allgemeines.html) | — | — | `leitlinie` |
| Mammographische Dichte (ACR) | ACR BI-RADS | `A\|B\|C\|D` | Breast composition categories | [3.21](../de/s3-kap-3-allgemeines.html) | — | — | `leitlinie` |
| Maximaler Tumordurchmesser | LOINC | `21889-1` | Size Tumor | [4.70](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + MII Onkologie… | — | — |
| Menopausenstatus | SNOMED CT | `161712005` | Menopause, function (observable entity) | [4.36](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | MedicationStatement / CarePlan | — | `vorschlag` |
| Männlicher Brustkrebs | ICD-10-GM | `C50` | Bösartige Neubildung der Brustdrüse | [3.28](../de/s3-kap-3-allgemeines.html) | — | — | `leitlinie` |
| Nachsorge-Mammographie | SNOMED CT | `71651007` | Mammography (procedure) | [S3-5.0-4.2.6-Hintergrund](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | CarePlan / Encounter (Nachsorge) | — | `standard` |
| Neratinib | ATC | `L01EH04` | Neratinib | [4.166](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.code + ex-senologie-therapy-line` | `standard` |
| Oestrogenrezeptor-Status DCIS | LOINC | `85337-4` | Estrogen receptor Ag [Presence] in Breast cancer specimen b… | [4.36](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | MedicationStatement / CarePlan | — | `standard` |
| Olaparib | ATC | `L01XK01` | Olaparib | [4.150](../de/s3-kap-4-8-systemische-therapie.html), [4.156](../de/s3-kap-4-8-systemische-therapie.html), [5.46](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Operationstyp | SNOMED CT | `392021009` | Lumpectomy of breast (procedure) | [4.94](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `Procedure.code + ex-senologie-radiation-target + …` | `vorschlag` |
| Palbociclib (Kombination) | ATC | `L01EF01` | Palbociclib | [5.37](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `standard` |
| Papillom-Diagnose | SNOMED CT | `99571000119102` | Intraductal papilloma of breast without atypia | [4.42](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Diagnose_Benigne + EX_Senologie_B… | `Condition.code` | `standard` |
| PARP-Inhibitor-Indikation | ATC | `L01XK01 (Olaparib), L01XK04 (Talazoparib)` | PARP-Inhibitoren | [3.36](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| Pathologische Fraktur | SNOMED CT | `268029009` | Pathological fracture (disorder) | [4.174](../de/s3-kap-4-8-systemische-therapie.html) | — | — | `vorschlag` |
| Pembrolizumab | ATC | `L01FF02` | Pembrolizumab | [4.154](../de/s3-kap-4-8-systemische-therapie.html), [5.47](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.code + ex-senologie-therapy-cycle` | `standard` |
| Pertuzumab | ATC | `L01FD02` | Pertuzumab | [4.161](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.code + ex-senologie-therapy-protocol` | `standard` |
| Pertuzumab (Erstlinie HER2+) | ATC | `L01FD02` | Pertuzumab | [5.25](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Extension:therapy-line + Extension:therapy-protoc…` | `standard` |
| PET-CT (Rezidivdiagnostik) | SNOMED CT | `443897008` | Combined positron emission tomography and computed tomograp… | [5.6](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Bildgebung | — | `standard` |
| PHQ-9 Score | LOINC | `44261-6` | Patient Health Questionnaire 9 item (PHQ-9) total score | [6.3](../de/s3-kap-6-betreuung.html) | — | — | `standard` |
| PIK3CA-Mutationsstatus | HGNC | `HGNC:8975` | PIK3CA | [5.37](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `standard` |
| Postoperative Tumorkonferenz | SNOMED CT | `708004003` | Multidisciplinary review (procedure) | [3.43](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| PR - Prozentsatz positive Tumorzellkerne | LOINC | `85329-1` | Cells.progesterone receptor/100 cells in Breast cancer spec… | [4.72](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund | `Observation (contained/referenced)` | — |
| PR-Status (Metastase) | LOINC | `85339-0` | — | [4.71](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + Senologie_Gen… | — | — |
| PR-Status (Rezidiv) | LOINC | `85339-0` | Progesterone receptor Ag [Presence] in Breast cancer specim… | [5.7](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Pathologie_Befund | — | `standard` |
| Progesteronrezeptor-Status (PR) | LOINC | `85339-0` | Progesterone receptor Ag [Presence] in Breast cancer specim… | [4.70](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + MII Onkologie… | — | — |
| Prophylaktische bilaterale Adnexektomie bei Erkrankten | OPS | `5-652` | Ovariektomie | [3.39](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Prophylaktische bilaterale Mastektomie (BRRM) | OPS | `5-870` | Partielle (brusterhaltende) Exzision der Mamma und Destrukt… | [3.37](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Prophylaktische bilaterale Salpingo-Oophorektomie (BRRSO) | OPS | `5-652` | Ovariektomie | [3.38](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Prätherapeutische Tumorkonferenz | SNOMED CT | `708004003` | Multidisciplinary review (procedure) | [3.43](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| PV-Status BRCA1/BRCA2 | HGNC | `HGNC:1100 (BRCA1), HGNC:1101 (BRCA2)` | — | [3.35](../de/s3-kap-3-allgemeines.html) | — | — | `standard` |
| Re-Staging bei Rezidiv | SNOMED CT | `254292007` | Tumor staging (tumor staging) | [5.5](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Diagnose_Maligne | — | `standard` |
| Resektionsrand-Status DCIS | SNOMED CT | `371487001` | Surgical margin finding (finding) | [4.30](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Diagnose_Maligne + Senologie_Path… | — | `vorschlag` |
| Resektionsrandstatus | SNOMED CT | `395536008` | Surgical margin finding (finding) | [4.45](../de/s3-kap-4-4-operative-therapie.html) | Senologie_Operation / Senologie_Pathologie_… | `Observation (Resektionsrand)` | `vorschlag` |
| Ribociclib | ATC | `L01EF02` | Ribociclib | [4.149](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `standard` |
| Risikofaktoren-Anamnese | SNOMED CT | `408942007` | Assessment of risk factors (procedure) | [3.11](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Sacituzumab Govitecan (HR+/HER2-) | ATC | `L01FX17` | Sacituzumab govitecan | [5.44](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Sacituzumab Govitecan (TNBC) | ATC | `L01FX17` | Sacituzumab govitecan | [5.48](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Schwangerschaftsstatus | LOINC | `82810-3` | Pregnancy status | [7.10](../de/s3-kap-7-spezielle-situationen.html) | — | — | `standard` |
| Sentinel-Node-Biopsie durchgefuehrt | SNOMED CT | `396487001` | Sentinel lymph node biopsy (procedure) | [4.31](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | Senologie_Pathologie_Befund / Procedure | — | `standard` |
| Symptomstatus Patientin | SNOMED CT | `84229001` | Fatigue (finding) | [5.1](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_Nachsorge | — | `vorschlag` |
| Systematische Brustsonographie | SNOMED CT | `16310003` | Ultrasonography of breast (procedure) | [4.10](../de/s3-kap-4-1-diagnostik.html) | Senologie_Bildgebung_Befund | — | — |
| Talazoparib | ATC | `L01XK04` | Talazoparib | [5.46](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Therapie-Setting | SNOMED CT | `neo-adjuvant - 373847000` | Neo-adjuvant - Loss of therapeutic intent (qualifier value) | [4.138](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_Geplante_Systemtherapie | `ServiceRequest.intent / ServiceRequest.category` | `vorschlag` |
| Therapieintention | SNOMED CT | `373846009` | Adjuvant - intent (qualifier value) | [4.94](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `Procedure.code + ex-senologie-radiation-target + …` | `vorschlag` |
| Trastuzumab | ATC | `L01FD01` | Trastuzumab | [4.157](../de/s3-kap-4-8-systemische-therapie.html), [4.161](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure + S… | `Procedure.code / ServiceRequest.code` | `standard` |
| Trastuzumab (Erstlinie HER2+) | ATC | `L01FD01` | Trastuzumab | [5.25](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Extension:therapy-line + Extension:therapy-protoc…` | `standard` |
| Trastuzumab Deruxtecan (Drittlinie HER2+) | ATC | `L01FD04` | Trastuzumab deruxtecan | [5.27](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Extension:therapy-line` | `standard` |
| Trastuzumab Deruxtecan (HER2-low) | ATC | `L01FD04` | Trastuzumab deruxtecan | [5.42](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Trastuzumab Deruxtecan (Hirnmetastasen) | ATC | `L01FD04` | Trastuzumab deruxtecan | [5.28](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure + S… | — | `standard` |
| Trastuzumab Deruxtecan (Zweitlinie HER2+) | ATC | `L01FD04` | Trastuzumab deruxtecan | [5.26](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Extension:therapy-line + Extension:therapy-protoc…` | `standard` |
| Trastuzumab Emtansin (Drittlinie HER2+) | ATC | `L01FD03` | Trastuzumab emtansine | [5.27](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Extension:therapy-line` | `standard` |
| Trastuzumab-Emtansin (T-DM1) | ATC | `L01FD03` | Trastuzumab emtansin | [4.165](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.code + ex-senologie-therapy-cycle` | `standard` |
| Trastuzumab-Therapiedauer | ATC | `L01FD01` | Trastuzumab | [4.164](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | `Procedure.period` | `standard` |
| Triple-negativer Brustkrebs | SNOMED CT | `706970001` | Triple negative malignant neoplasm of breast (disorder) | [3.28](../de/s3-kap-3-allgemeines.html) | — | — | `vorschlag` |
| Tucatinib (Drittlinie HER2+) | ATC | `L01EH03` | Tucatinib | [5.27](../de/s3-kap-5-rezidiv-metastasiert.html) | Senologie_SystemischeTherapie_Procedure | `Extension:therapy-line` | `standard` |
| Tumorgroesse | LOINC | `21889-1` | Size Tumor | [4.152](../de/s3-kap-4-8-systemische-therapie.html) | Senologie_SystemischeTherapie_Procedure | — | `standard` |
| Tumorgröße | LOINC | `21889-1` | Size Tumor | [4.48](../de/s3-kap-4-4-operative-therapie.html) | Senologie_Operation / Senologie_OP_Planung | `Procedure.bodySite + Condition` | `standard` |
| Zielgebiet Brustwand | SNOMED CT | `78904004` | Chest wall structure (body structure) | [4.109](../de/s3-kap-4-6-strahlentherapie.html) | Senologie_Strahlentherapie | `ex-senologie-radiation-target` | `vorschlag` |
| Östrogenrezeptor-Status (ER) | LOINC | `85337-4` | Estrogen receptor Ag [Presence] in Breast cancer specimen b… | [4.70](../de/s3-kap-4-5-pathologie.html) | Senologie_Pathologie_Befund + MII Onkologie… | — | — |

#### Terms without a terminology code

These data objects are derived from the guideline but not yet mapped to a code — either because no suitable concept exists or because the mapping is still open. They are all in the CSV export; the distribution per chapter:

| Chapter | Topic | Rec./QI | Terms without a code |
|---|---|---|---|
| [3](../de/s3-kap-3-allgemeines.html) | General aspects, early detection, familial risk | 43 | 26 |
| [4.1](../de/s3-kap-4-1-diagnostik.html) | Diagnostics, imaging, biopsy, staging | 16 | 52 |
| [4.2–4.3](../de/s3-kap-4-2-4-3-dcis-risikolaesionen.html) | DCIS and risk lesions (B3) | 17 | 59 |
| [4.4](../de/s3-kap-4-4-operative-therapie.html) | Surgical therapy | 21 | 74 |
| [4.5](../de/s3-kap-4-5-pathologie.html) | Pathology, biomarkers, prognosis | 13 | 36 |
| [4.6](../de/s3-kap-4-6-strahlentherapie.html) | Adjuvant radiotherapy | 36 | 82 |
| [4.8](../de/s3-kap-4-8-systemische-therapie.html) | Systemic therapy, early breast cancer | 40 | 67 |
| [5](../de/s3-kap-5-rezidiv-metastasiert.html) | Recurrent and metastatic disease | 69 | 54 |
| [6](../de/s3-kap-6-betreuung.html) | Supportive care, follow-up, palliative care | 34 | 83 |
| [7](../de/s3-kap-7-spezielle-situationen.html) | Special situations | 69 | 65 |
| [8](../de/s3-kap-8-qualitaetsindikatoren.html) | Quality indicators | 18 | 73 |

---

_Auto-generated by `scripts/generate-glossar.py` from the YAML blocks of the annotation chapters. Do not edit by hand — the sources are `input/pagecontent/s3-kap-*.md`. Machine-readable: `exports/glossar-s3-snomed.csv` (includes the terms without a code)._
