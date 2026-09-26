### Semantic Annotation

This page lists in tabular form all data elements that are annotated with semantic codes in the Senologie profiles. The table is directly derivable from the FSH profile definitions.

#### Legend

| Column | Meaning |
|--------|---------|
| **Data Element** | Clinical concept (slice or element name) |
| **Profile** | FHIR profile in which the element is defined |
| **FHIR Path** | Path to the element within the resource |
| **Code System** | Terminology system (SNOMED CT, LOINC, RadLex, etc.) |
| **Code** | Semantic code |
| **Display** | Display name of the code |

---

#### Clinical Examination (Klinische Untersuchung)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Breast examination | Klinische Untersuchung | `code` | LOINC | `32422-8` | Physical findings of Breast |
| Palpation finding | Klinische Untersuchung | `component[palpationsbefund].code` | SNOMED CT | `118242002` | Finding by palpation |
| Skin changes | Klinische Untersuchung | `component[hautveraenderungen].code` | SNOMED CT | `115951000119105` | Breast symptom of change in skin |
| Nipple finding | Klinische Untersuchung | `component[mamillenbefund].code` | SNOMED CT | `248819006` | Nipple finding |
| Lymph node status | Klinische Untersuchung | `component[lymphknotenstatus].code` | SNOMED CT | `301782006` | Finding of lymph node of axillary region |

#### Gynaecological History (Gynäkologische Anamnese)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Gyn. history (overall) | Gynäkologische Anamnese | `code` | LOINC | `89221-6` | Gynecology History and physical note |
| Age at menarche | Gynäkologische Anamnese | `component[menarche].code` | LOINC | `42798-9` | Age at menarche |
| Age at menopause | Gynäkologische Anamnese | `component[menopause].code` | LOINC | `42802-9` | Age at menopause |
| Pregnancies | Gynäkologische Anamnese | `component[schwangerschaften].code` | LOINC | `11996-6` | Number of pregnancies |
| Hormone replacement therapy | Gynäkologische Anamnese | `component[hormonersatztherapie].code` | SNOMED CT | `266717002` | Hormone replacement therapy |

#### Imaging — Diagnostic Report (Bildgebung — Befundbericht)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Category (Radiology) | Bildgebung Befund | `category` | v2-0074 | `RAD` | Radiology |
| Mammography | Bildgebung Befund | `code.coding[mammography]` | LOINC | `18781-5` | Mammography of bilateral breasts |
| Ultrasound | Bildgebung Befund | `code.coding[ultrasound]` | LOINC | `18740-1` | Ultrasound of bilateral breasts |
| MRI | Bildgebung Befund | `code.coding[mri]` | LOINC | `36581-3` | MRI of breast |
| Tomosynthesis | Bildgebung Befund | `code.coding[tomosynthesis]` | RadLex | `RID40755` | Digital breast tomosynthesis |

#### Imaging — Individual Finding (Observation)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| BI-RADS (LOINC) | Bildgebung Observation | `code.coding[biRadsLoinc]` | LOINC | `72018-2` | BI-RADS Category |
| BI-RADS (SNOMED) | Bildgebung Observation | `code.coding[biRadsSnomed]` | SNOMED CT | `241736003` | BI-RADS Classification |
| ACR density (LOINC) | Bildgebung Observation | `code.coding[acrDensityLoinc]` | LOINC | `18794-8` | ACR Breast Density |
| ACR density (RadLex) | Bildgebung Observation | `code.coding[acrDensityRadlex]` | RadLex | `RID28536` | ACR Breast Density |
| Mass/lesion (SNOMED) | Bildgebung Observation | `code.coding[herdbefundSnomed]` | SNOMED CT | `300886002` | Mass/Lesion |
| Mass/lesion (RadLex) | Bildgebung Observation | `code.coding[herdbefundRadlex]` | RadLex | `RID3933` | Mass/Lesion |
| Microcalcification (SNOMED) | Bildgebung Observation | `code.coding[mikrokalkSnomed]` | SNOMED CT | `373945005` | Microcalcification |
| Microcalcification (RadLex) | Bildgebung Observation | `code.coding[mikrokalkRadlex]` | RadLex | `RID4002` | Microcalcification |
| Lymph node (SNOMED) | Bildgebung Observation | `code.coding[lymphknotenSnomed]` | SNOMED CT | `301782006` | Lymph Node Status |
| Lymph node (RadLex) | Bildgebung Observation | `code.coding[lymphknotenRadlex]` | RadLex | `RID58844` | Lymph Node Status |

#### Imaging — Other (Bildgebung — Sonstige)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Category (Radiology) | Bildgebung Sonstige | `category` | v2-0074 | `RAD` | Radiology |

#### Diagnosis (malignant)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Metastasis stage | Diagnose | `stage[metastasis].type` | SNOMED CT | `385349001` | Clinical stage (observable entity) |

#### Family History (Familienanamnese)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Breast carcinoma | Familienanamnese | `condition[mammakarzinom].code` | SNOMED CT | `254837009` | Malignant neoplasm of breast |
| Ovarian carcinoma | Familienanamnese | `condition[ovarialkarzinom].code` | SNOMED CT | `363443007` | Malignant tumor of ovary |

#### Surgical Complication (Operative Komplikation)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Clavien-Dindo | Operative Komplikation | `code.coding` | SNOMED CT | `789279006` | Clavien-Dindo classification grade |
| Complication type | Operative Komplikation | `component[komplikationsart].code` | SNOMED CT | `116224001` | Complication of procedure |

#### Breast Surgery — Follow-up Care (Brust-Operation Nachsorge)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Drainage | Brust-Operation | `followUp[drainage]` | SNOMED CT | `122462000` | Drainage procedure |
| Dressing | Brust-Operation | `followUp[verband]` | SNOMED CT | `182531007` | Dressing of wound |
| Antibiotics | Brust-Operation | `followUp[antibiotika]` | SNOMED CT | `281789004` | Antibiotic therapy (procedure) |
| Mobilisation | Brust-Operation | `followUp[mobilisation]` | SNOMED CT | `183040004` | Mobilization (procedure) |
| Laboratory check | Brust-Operation | `followUp[laborkontrolle]` | SNOMED CT | `15220000` | Laboratory test (procedure) |

#### Systemic Therapy (Systemtherapie)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Category | Systemtherapie Procedure | `category` | SNOMED CT | `18629005` | Administration of medication |

#### Gene Expression Score (Genexpressions-Score)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Category (Laboratory) | Genexpressions-Score | `category[laboratory]` | observation-category | `laboratory` | Laboratory |

#### Tumour Board Recommendation (Tumorboard-Empfehlung)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Surgical therapy | Tumorboard Empfehlung | `activity[operativeTherapy].detail.code` | SNOMED CT | `387713003` | Surgical procedure (procedure) |
| Chemotherapy | Tumorboard Empfehlung | `activity[chemotherapy].detail.code` | SNOMED CT | `385786002` | Chemotherapy care (regime/therapy) |
| Radiotherapy | Tumorboard Empfehlung | `activity[radiotherapy].detail.code` | SNOMED CT | `108290001` | Radiation oncology AND/OR radiotherapy |
| Endocrine therapy | Tumorboard Empfehlung | `activity[endocrineTherapy].detail.code` | SNOMED CT | `169413002` | Hormone therapy (procedure) |
| Targeted therapy | Tumorboard Empfehlung | `activity[targetedTherapy].detail.code` | SNOMED CT | `416608005` | Drug therapy |
| Immunotherapy | Tumorboard Empfehlung | `activity[immunotherapy].detail.code` | SNOMED CT | `76334006` | Immunotherapy (procedure) |
| Antiresorptive therapy | Tumorboard Empfehlung | `activity[antiresorptiveTherapy].detail.code` | SNOMED CT | `870370003` | Antiresorptive therapy (procedure) |
| Further diagnostics | Tumorboard Empfehlung | `activity[furtherDiagnostics].detail.code` | SNOMED CT | `165197003` | Diagnostic assessment (procedure) |
| Further intervention | Tumorboard Empfehlung | `activity[furtherIntervention].detail.code` | SNOMED CT | `71388002` | Procedure (procedure) |
| Genetic testing | Tumorboard Empfehlung | `activity[genetics].detail.code` | SNOMED CT | `405825005` | Molecular genetic test |
| Clinical trial | Tumorboard Empfehlung | `activity[clinicalTrial].detail.code` | SNOMED CT | `110465008` | Clinical trial (procedure) |
| Follow-up care | Tumorboard Empfehlung | `activity[followUp].detail.code` | SNOMED CT | `390906007` | Follow-up encounter (procedure) |

#### Study Participation (Studienteilnahme)

| Data Element | Profile | FHIR Path | Code System | Code | Display |
|-------------|---------|-----------|-------------|------|---------|
| Screening status: not applicable | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `385432009` | Not applicable (qualifier value) |
| Screening status: assessed | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `709491003` | Assessed (qualifier value) |
| Screening status: eligible | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `1304144001` | Eligible for clinical trial |
| Screening status: not eligible | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `385646003` | Not eligible (qualifier value) |
| Screening status: negative | Studienteilnahme | `extension[Screeningstatus]` | SNOMED CT | `260385009` | Negative (qualifier value) |

---

#### Code System Summary

| Code System | URI | Usage |
|-------------|-----|-------|
| **SNOMED CT** | `http://snomed.info/sct` | Clinical findings, procedures, diagnoses, tumour board recommendations |
| **LOINC** | `http://loinc.org` | Laboratory values, imaging modalities, history instruments |
| **RadLex** | `http://radlex.org` | Radiological finding categories (ACR, tomosynthesis) |
| **ICD-10-GM** | `http://fhir.de/CodeSystem/bfarm/icd-10-gm` | Diagnosis coding (benign findings) |
| **v2-0074** | `http://terminology.hl7.org/CodeSystem/v2-0074` | Diagnostics category (Radiology) |
| **observation-category** | `http://terminology.hl7.org/CodeSystem/observation-category` | Observation category (Laboratory) |
| **Senologie local** | `https://www.senologie.org/fhir/CodeSystem/...` | Project-specific codes (diagnoses, study names) |
