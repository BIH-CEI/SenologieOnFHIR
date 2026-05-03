# Semantische Annotation - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Terminologie**](terminologie-uebersicht.md)
* **Semantische Annotation**

## Semantische Annotation

### Semantische Annotation

Diese Seite listet tabellarisch alle Datenelemente auf, die in den Senologie-Profilen mit semantischen Codes annotiert sind. Die Tabelle ist direkt aus den FSH-Profildefinitionen ableitbar.

#### Legende

| | |
| :--- | :--- |
| **Datenelement** | Klinisches Konzept (Slice- oder Elementname) |
| **Profil** | FHIR-Profil, in dem das Element definiert ist |
| **FHIR-Pfad** | Pfad zum Element innerhalb der Ressource |
| **Code-System** | Terminologie-System (SNOMED CT, LOINC, RadLex, etc.) |
| **Code** | Semantischer Code |
| **Display** | Anzeigename des Codes |

-------

#### Klinische Untersuchung

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Brustuntersuchung | Klinische Untersuchung | `code` | LOINC | `32422-8` | Physical findings of Breast |
| Palpationsbefund | Klinische Untersuchung | `component[palpationsbefund].code` | SNOMED CT | `118242002` | Finding by palpation |
| Hautveränderungen | Klinische Untersuchung | `component[hautveraenderungen].code` | SNOMED CT | `115951000119105` | Breast symptom of change in skin |
| Mamillenbefund | Klinische Untersuchung | `component[mamillenbefund].code` | SNOMED CT | `248819006` | Nipple finding |
| Lymphknotenstatus | Klinische Untersuchung | `component[lymphknotenstatus].code` | SNOMED CT | `301782006` | Finding of lymph node of axillary region |

#### Gynäkologische Anamnese

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Gyn. Anamnese (gesamt) | Gynäkologische Anamnese | `code` | LOINC | `89221-6` | Gynecology History and physical note |
| Menarche-Alter | Gynäkologische Anamnese | `component[menarche].code` | LOINC | `42798-9` | Age at menarche |
| Menopause-Alter | Gynäkologische Anamnese | `component[menopause].code` | LOINC | `42802-9` | Age at menopause |
| Schwangerschaften | Gynäkologische Anamnese | `component[schwangerschaften].code` | LOINC | `11996-6` | Number of pregnancies |
| Hormonersatztherapie | Gynäkologische Anamnese | `component[hormonersatztherapie].code` | SNOMED CT | `266717002` | Hormone replacement therapy |

#### Bildgebung — Befundbericht

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Kategorie (Radiologie) | Bildgebung Befund | `category` | v2-0074 | `RAD` | Radiology |
| Mammographie | Bildgebung Befund | `code.coding[mammography]` | LOINC | `18781-5` | Mammography of bilateral breasts |
| Sonographie | Bildgebung Befund | `code.coding[ultrasound]` | LOINC | `18740-1` | Ultrasound of bilateral breasts |
| MRT | Bildgebung Befund | `code.coding[mri]` | LOINC | `36581-3` | MRI of breast |
| Tomosynthese | Bildgebung Befund | `code.coding[tomosynthesis]` | RadLex | `RID40755` | Digital breast tomosynthesis |

#### Bildgebung — Einzelbefund (Observation)

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| BI-RADS (LOINC) | Bildgebung Observation | `code.coding[biRadsLoinc]` | LOINC | `72018-2` | BI-RADS Category |
| BI-RADS (SNOMED) | Bildgebung Observation | `code.coding[biRadsSnomed]` | SNOMED CT | `241736003` | BI-RADS Classification |
| ACR-Dichte (LOINC) | Bildgebung Observation | `code.coding[acrDensityLoinc]` | LOINC | `18794-8` | ACR Breast Density |
| ACR-Dichte (RadLex) | Bildgebung Observation | `code.coding[acrDensityRadlex]` | RadLex | `RID28536` | ACR Breast Density |
| Herdbefund (SNOMED) | Bildgebung Observation | `code.coding[herdbefundSnomed]` | SNOMED CT | `300886002` | Mass/Lesion |
| Herdbefund (RadLex) | Bildgebung Observation | `code.coding[herdbefundRadlex]` | RadLex | `RID3933` | Mass/Lesion |
| Mikrokalk (SNOMED) | Bildgebung Observation | `code.coding[mikrokalkSnomed]` | SNOMED CT | `373945005` | Microcalcification |
| Mikrokalk (RadLex) | Bildgebung Observation | `code.coding[mikrokalkRadlex]` | RadLex | `RID4002` | Microcalcification |
| Lymphknoten (SNOMED) | Bildgebung Observation | `code.coding[lymphknotenSnomed]` | SNOMED CT | `301782006` | Lymph Node Status |
| Lymphknoten (RadLex) | Bildgebung Observation | `code.coding[lymphknotenRadlex]` | RadLex | `RID58844` | Lymph Node Status |

#### Bildgebung — Sonstige

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Kategorie (Radiologie) | Bildgebung Sonstige | `category` | v2-0074 | `RAD` | Radiology |

#### Diagnose (maligne)

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Metastasen-Stadium | Diagnose | `stage[metastasis].type` | SNOMED CT | `385349001` | Clinical stage (observable entity) |

#### Familienanamnese

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Mammakarzinom | Familienanamnese | `condition[mammakarzinom].code` | SNOMED CT | `254837009` | Malignant neoplasm of breast |
| Ovarialkarzinom | Familienanamnese | `condition[ovarialkarzinom].code` | SNOMED CT | `363443007` | Malignant tumor of ovary |

#### Operative Komplikation

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Clavien-Dindo | Operative Komplikation | `code.coding` | SNOMED CT | `789279006` | Clavien-Dindo classification grade |
| Komplikationsart | Operative Komplikation | `component[komplikationsart].code` | SNOMED CT | `116224001` | Complication of procedure |

#### Brust-Operation (Nachsorge)

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Drainage | Brust-Operation | `followUp[drainage]` | SNOMED CT | `122462000` | Drainage procedure |
| Verband | Brust-Operation | `followUp[verband]` | SNOMED CT | `182531007` | Dressing of wound |
| Antibiotika | Brust-Operation | `followUp[antibiotika]` | SNOMED CT | `281789004` | Antibiotic therapy (procedure) |
| Mobilisation | Brust-Operation | `followUp[mobilisation]` | SNOMED CT | `183040004` | Mobilization (procedure) |
| Laborkontrolle | Brust-Operation | `followUp[laborkontrolle]` | SNOMED CT | `15220000` | Laboratory test (procedure) |

#### Systemtherapie

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Kategorie | Systemtherapie Procedure | `category` | SNOMED CT | `18629005` | Administration of medication |

#### Genexpressions-Score

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Kategorie (Labor) | Genexpressions-Score | `category[laboratory]` | observation-category | `laboratory` | Laboratory |

#### Tumorboard-Empfehlung

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Operative Therapie | Tumorboard Empfehlung | `activity[operativeTherapy].detail.code` | SNOMED CT | `387713003` | Surgical procedure (procedure) |
| Chemotherapie | Tumorboard Empfehlung | `activity[chemotherapy].detail.code` | SNOMED CT | `385786002` | Chemotherapy care (regime/therapy) |
| Strahlentherapie | Tumorboard Empfehlung | `activity[radiotherapy].detail.code` | SNOMED CT | `108290001` | Radiation oncology AND/OR radiotherapy |
| Endokrine Therapie | Tumorboard Empfehlung | `activity[endocrineTherapy].detail.code` | SNOMED CT | `169413002` | Hormone therapy (procedure) |
| Zielgerichtete Therapie | Tumorboard Empfehlung | `activity[targetedTherapy].detail.code` | SNOMED CT | `416608005` | Drug therapy |
| Immuntherapie | Tumorboard Empfehlung | `activity[immunotherapy].detail.code` | SNOMED CT | `76334006` | Immunotherapy (procedure) |
| Antiresorptive Therapie | Tumorboard Empfehlung | `activity[antiresorptiveTherapy].detail.code` | SNOMED CT | `870370003` | Antiresorptive therapy (procedure) |
| Weitere Diagnostik | Tumorboard Empfehlung | `activity[furtherDiagnostics].detail.code` | SNOMED CT | `165197003` | Diagnostic assessment (procedure) |
| Weitere Intervention | Tumorboard Empfehlung | `activity[furtherIntervention].detail.code` | SNOMED CT | `71388002` | Procedure (procedure) |
| Genetische Untersuchung | Tumorboard Empfehlung | `activity[genetics].detail.code` | SNOMED CT | `405825005` | Molecular genetic test |
| Klinische Studie | Tumorboard Empfehlung | `activity[clinicalTrial].detail.code` | SNOMED CT | `110465008` | Clinical trial (procedure) |
| Follow-up/Nachsorge | Tumorboard Empfehlung | `activity[followUp].detail.code` | SNOMED CT | `390906007` | Follow-up encounter (procedure) |

#### Studienteilnahme

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Screeningstatus: nicht zutreffend | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `385432009` | Not applicable (qualifier value) |
| Screeningstatus: geprüft | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `709491003` | Assessed (qualifier value) |
| Screeningstatus: geeignet | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `1304144001` | Eligible for clinical trial |
| Screeningstatus: nicht geeignet | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `385646003` | Not eligible (qualifier value) |
| Screeningstatus: negativ | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `260385009` | Negative (qualifier value) |

-------

#### Zusammenfassung Code-Systeme

| | | |
| :--- | :--- | :--- |
| **SNOMED CT** | `http://snomed.info/sct` | Klinische Befunde, Prozeduren, Diagnosen, Tumorboard-Empfehlungen |
| **LOINC** | `http://loinc.org` | Laborwerte, Bildgebungsmodalitäten, Anamnese-Instrumente |
| **RadLex** | `http://radlex.org` | Radiologische Befundkategorien (ACR, Tomosynthese) |
| **ICD-10-GM** | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | Diagnose-Codierung (benigne Befunde) |
| **v2-0074** | `http://terminology.hl7.org/CodeSystem/v2-0074` | Diagnostik-Kategorie (Radiologie) |
| **observation-category** | `http://terminology.hl7.org/CodeSystem/observation-category` | Observation-Kategorie (Labor) |
| **Senologie lokal** | `https://www.senologie.org/fhir/CodeSystem/...` | Projektspezifische Codes (Diagnosen, Studiennamen) |

