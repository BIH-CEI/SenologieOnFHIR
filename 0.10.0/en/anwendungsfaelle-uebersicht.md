# Use Cases - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* **Use Cases**

## Use Cases

The Senology module addresses four central application scenarios along the value chain of clinical data:

### Data Capture (Erfassung)

Form-based documentation at the point of care via SDC Questionnaires with automatic extraction into FHIR resources.

[More →](anwendungsfaelle-erfassung.md)

### Data Exchange (Austausch)

Interoperable data transfer between clinical systems, research databases, and cross-institutional infrastructures.

[More →](anwendungsfaelle-austausch.md)

### Analytics (Auswertung)

Secondary use for health services research, quality assurance, and clinical trials.

[More →](anwendungsfaelle-auswertung.md)

### Reporting Datasets (Meldedatensätze)

Automated derivation of cancer registry notifications, implant registry data, and other regulatory reports.

[More →](anwendungsfaelle-meldedatensaetze.md)

### Clinical Context

The use cases follow the care pathway of a certified breast centre (Brustzentrum):

1. **Initial Presentation**— History taking, clinical examination, imaging
1. **Diagnostics**— Biopsy, pathology, gene expression testing
1. **Tumour Board (Tumorkonferenz)**— Interdisciplinary treatment recommendation
1. **Treatment**— Surgery, systemic therapy, radiation therapy
1. **Follow-up**— Surveillance visits, complication documentation
1. **Reporting**— Cancer registry, implant registry, quality indicators

At each step, structured FHIR resources are created and shared across the various use cases.

### Actors

| | |
| :--- | :--- |
| Breast Centre (Brustzentrum) | Primary data capture and clinical care |
| Clinical Information System (KIS) | Data storage and provision |
| Data Integration Centre (DIZ) | Data preparation and research data provisioning |
| Clinical Cancer Registry (Klinisches Krebsregister) | Recipient of structured notifications |
| Implant Registry — DIMDI | Recipient of implant data |
| Research Network — MII | Cross-site secondary use |

