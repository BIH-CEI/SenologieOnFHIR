# Radiotherapy

## Overview

Radiotherapy is a central component of breast cancer (Mammakarzinom) treatment and is used in various settings depending on the clinical situation. Following breast-conserving surgery it is a standard element of adjuvant therapy, and it is also performed after mastectomy in defined high-risk constellations. In addition, it can be administered intraoperatively and may contribute to symptom control in the metastatic setting.

Treatment is generally carried out by a dedicated radiotherapy department or an external centre with its own documentation system. The corresponding data are frequently not captured as primary data at the breast centre, yet they are required for reporting to cancer registries (oBDS), certification requirements (DKG/OncoBox), and quality-assurance measures (IQTIG). The data model therefore defines the structure in which this information can be received, stored, and forwarded to the various reporting pathways.

## Relevant Data Points

| Data Point | Description | Reporting Pathway |
|-----------|-------------|----------|
| Start / End | Period of irradiation | oBDS, OncoBox |
| Target volume (Zielgebiet) | Breast, chest wall, lymphatic drainage, boost | oBDS, OncoBox |
| Total dose (Gy) | Cumulative dose | oBDS, OncoBox |
| Fraction dose (Gy) | Dose per fraction | OncoBox |
| Number of fractions | Total number of irradiation sessions | OncoBox |
| Relation to surgery (Stellung zur OP) | Adjuvant, neoadjuvant, palliative | oBDS, OncoBox |
| Simultaneous radiochemotherapy | Concurrent systemic therapy | OncoBox |
| Intention | Curative, palliative | oBDS |

## Profile Basis

The radiotherapy profile inherits from the MII Oncology Module and adds senology-specific fields such as fraction dose and the flag for simultaneous radiochemotherapy. The relation to surgery and the therapy intention are represented via MII Oncology extensions.

## Associated Resources

| Type | Resource |
|-----|-----------|
| Profile | [Senologie_Strahlentherapie](StructureDefinition-senologie-strahlentherapie.html) |
| Questionnaire | [Strahlentherapie](Questionnaire-senologie-strahlentherapie-quest.html) |
| Example | [Case 1 — Radiotherapy](Procedure-Fall1-Strahlentherapie.html) |
