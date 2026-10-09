### Use Case: Data Exchange

#### Overview

The Senology module enables interoperable data exchange between the systems involved in breast cancer care. The FHIR profiles define a common language for data transfer — regardless of which system originally captured the data.

#### Exchange Scenarios

##### 1. Clinical Information System ↔ Documentation System

Data exchange between the hospital information system (KIS) and the documentation system is **bidirectional**:

- **KIS → Documentation system**: Master data (patient, case/encounter, insurance) are imported from the KIS and made available in the documentation system. This avoids duplicate entry and ensures consistency.
- **Documentation system → KIS**: Senology-specific data (diagnoses, surgical reports, findings, therapy courses) are transmitted back to the KIS as FHIR resources.

The technical interfaces for this exchange are governed by **ISiK** — in particular the ISiK modules for the base module (Patient, Encounter, Condition), document exchange, and appointment scheduling. This module defines only the senology-specific content, not the transport mechanisms.

##### 2. Clinical Information System ↔ Data Integration Centre (Datenintegrationszentrum)

The data integration centre (DIZ) receives the clinical data for preparation and research data provision. The senology profiles ensure that data are available in a uniform structure and coding.

- **Direction**: KIS → DIZ (ETL process)
- **Data**: Pseudonymised clinical data set
- **Use**: Research data repository, feasibility queries

##### 3. Cross-site Exchange (MII)

Cross-site queries are enabled via the data integration centres. The Senology module uses MII core data set profiles as its technical foundation to ensure structural compatibility with the MII infrastructure — it is, however, an independent senology core data set, not an MII module.

- **Direction**: DIZ ↔ DIZ (federated)
- **Data**: Aggregated or pseudonymised individual data
- **Infrastructure**: MII research data portal

##### 4. Clinic ↔ Cancer Registry

Structured notifications to clinical cancer registries. See [Notification Data Sets](anwendungsfaelle-meldedatensaetze.html).

#### Compatibility

The profiles are designed to be compatible with the following standards:

| Standard | Compatibility |
|---|---|
| **MII Core Data Set** | Profiles inherit from MII Oncology, Pathology, and Imaging |
| **ISiK 5.0** | Base compatibility for hospital systems |
| **oBDS** | Oncological Basic Data Set for cancer registry notifications |
| **HL7 SDC** | Form-based capture and extraction |

#### Data Flow

<div>
<img src="austausch-datenfluss.svg" alt="Datenaustausch im Kerndatensatz Senologie" style="width:100%"/>
<p><em>Data exchange — from the documentation system via KIS and DIZ to notification pathways and MII</em></p>
</div>

#### Terminology Mapping

Consistent terminology is essential for data exchange. The module provides [ConceptMaps](terminologie-medikation.html) that enable translations between the coding systems used:

- **SNOMED CT → ATC**: Medications for cancer registry notifications
- **SNOMED CT → ASK**: Medications for drug safety
- **SNOMED CT → ICD-10-GM**: Diagnoses (via existing MII mappings)
