# Use Cases

The Senology module addresses four central application scenarios along the value chain of clinical data:

<div style="display: flex; gap: 1em; flex-wrap: wrap; margin: 1.5em 0;">
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Data Capture (Erfassung)</h3>
<p>Form-based documentation at the point of care via SDC Questionnaires with automatic extraction into FHIR resources.</p>
<p><a href="anwendungsfaelle-erfassung.html">More &rarr;</a></p>
</div>
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Data Exchange (Austausch)</h3>
<p>Interoperable data transfer between clinical systems, research databases, and cross-institutional infrastructures.</p>
<p><a href="anwendungsfaelle-austausch.html">More &rarr;</a></p>
</div>
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Analytics (Auswertung)</h3>
<p>Secondary use for health services research, quality assurance, and clinical trials.</p>
<p><a href="anwendungsfaelle-auswertung.html">More &rarr;</a></p>
</div>
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Reporting Datasets (Meldedatensätze)</h3>
<p>Automated derivation of cancer registry notifications, implant registry data, and other regulatory reports.</p>
<p><a href="anwendungsfaelle-meldedatensaetze.html">More &rarr;</a></p>
</div>
</div>

### Clinical Context

The use cases follow the care pathway of a certified breast centre (Brustzentrum):

1. **Initial Presentation** — History taking, clinical examination, imaging
2. **Diagnostics** — Biopsy, pathology, gene expression testing
3. **Tumour Board (Tumorkonferenz)** — Interdisciplinary treatment recommendation
4. **Treatment** — Surgery, systemic therapy, radiation therapy
5. **Follow-up** — Surveillance visits, complication documentation
6. **Reporting** — Cancer registry, implant registry, quality indicators

At each step, structured FHIR resources are created and shared across the various use cases.

### Actors

| Actor | Role |
|---|---|
| Breast Centre (Brustzentrum) | Primary data capture and clinical care |
| Clinical Information System (KIS) | Data storage and provision |
| Data Integration Centre (DIZ) | Data preparation and research data provisioning |
| Clinical Cancer Registry (Klinisches Krebsregister) | Recipient of structured notifications |
| Implant Registry — DIMDI | Recipient of implant data |
| Research Network — MII | Cross-site secondary use |
