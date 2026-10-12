<img src="senologie-systemtherapie.png" alt="UML Systemtherapie" style="max-width:100%"/>

### Overview

Systemic therapy encompasses all pharmacological treatments for breast cancer. The choice of treatment is guided by the molecular subtype (HR+/HER2-, HER2+, triple-negative), disease stage, and clinical setting (neoadjuvant, adjuvant, palliative). The complexity lies in the fact that multiple treatment modalities are often combined, extend over months, and require documentation that captures both the recommendation and the actual administration.

### Therapy Types

| Type | Typical Agents | MII Onko Code | Indication |
|------|----------------|---------------|------------|
| Chemotherapy | Anthracyclines, taxanes, platinum | CH | All subtypes (esp. TNBC, HER2+) |
| Endocrine therapy (Hormontherapie) | Tamoxifen, aromatase inhibitors, GnRH | HO | HR+ |
| Targeted therapy (Zielgerichtete Therapie) | Trastuzumab, pertuzumab, CDK4/6i | ZS | HER2+, HR+/HER2- |
| Immunotherapy | Pembrolizumab | IM | TNBC (PD-L1+) |
| Combinations | Chemo + immuno, chemo + targeted | CI, CZ, CIZ | Protocol-dependent |

### Recommendation and Administration

Documentation of systemic therapy distinguishes between:

- **Recommendation** (tumour board (Tumorboard)): Which therapy is recommended? Which protocol? What is the intent?
- **Prescription** (planned systemic therapy): A concrete treatment plan specifying agents, cycles, and dosing
- **Administration** (therapy documentation): Agents actually administered per cycle and per day

This three-tier structure reflects clinical practice: not every recommendation is acted upon, and not every prescription is carried out as planned (dose reductions, treatment discontinuation due to adverse effects).

### Medication Coding

Agents are coded using ATC codes (BfArM ATC-DE). The MII Onko module provides a comprehensive value set containing more than 400 ATC codes for systemic tumour therapy, covering all relevant substance classes including endocrine therapy.

Protocol names (e.g. EC-Pac, TCHP, FEC-D) are not yet fully structured in clinical documentation. Proposals for standardisation are being developed within the MII Oncology Module.

### Endocrine Therapy — An Example of Classification Complexity

Endocrine (anti-hormonal) therapy illustrates the challenges of achieving a uniform representation. Depending on the perspective, it is classified differently:

| Perspective | Classification | Coding |
|-------------|----------------|--------|
| ATC classification | Separate main group L02 (endocrine therapy), distinct from L01 (antineoplastic agents) | L02BA, L02BG, L02AE |
| Cancer registry reporting (oBDS) | Systemic therapy with therapy type "hormonal therapy" | Type = HO |
| OPS (hospital coding) | Standalone OPS code | 8-543 Hormonal therapy for neoplasms |
| Clinical perception | Often treated as a distinct category alongside "chemotherapy" | — |
| DKG/OncoBox | Dedicated documentation block with substance classes (tamoxifen, AI, GnRH, fulvestrant, CDK4/6i) | Numeric codes 1–5 |

The same therapy — tamoxifen 20 mg daily for 5 years — is therefore classified and coded as endocrine therapy, hormonal therapy, systemic therapy, or a standalone procedure depending on the recipient system. For the patient and the treating team, it is simply "the tablet after surgery."

This complexity makes a unified representation all the more important: the data model captures endocrine therapy as part of systemic therapy (therapy type HO, agent coded via ATC) and uses ConceptMaps to ensure transformation into the respective target formats. The OncoBox-specific substance classification (1=tamoxifen, 2=aromatase inhibitor, 3=GnRH analogue, 4=fulvestrant, 5=CDK4/6 inhibitor) is mapped to the international ATC codes.

### Line of Therapy and First-Line Treatment

In metastatic disease, the line of therapy (1st, 2nd, 3rd line) is clinically relevant and is documented as an attribute of the therapy. The first-line flag (KB-8) identifies the first systemic therapy at the time of metastasis — it is relevant only in the palliative setting.

### Adverse Effects

Undesirable effects of systemic therapy are classified according to NCI CTCAE (Common Terminology Criteria for Adverse Events) grades 1–5 and documented as separate resources. They are relevant both for clinical care and for reporting to the cancer registry (oBDS).

### Associated Resources

| Type | Resource |
|------|----------|
| Profile | [Senologie_Systemtherapie_Procedure](StructureDefinition-senologie-systemtherapie-procedure.html) |
| Profile | [Senologie_Systemtherapie_Medikation](StructureDefinition-senologie-systemtherapie-medikation.html) |
| Profile | [Senologie_Geplante_Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.html) |
| Profile | [Senologie_Begleitmedikation](StructureDefinition-senologie-begleitmedikation.html) |
| Profile | [Senologie_Nebenwirkung](StructureDefinition-senologie-nebenwirkung.html) |
| Questionnaire | [Systemtherapie](Questionnaire-senologie-systemtherapie.html) |
| Terminology | [VS Systemtherapie Medikation](ValueSet-vs-senologie-systemtherapie-medikation.html) |
