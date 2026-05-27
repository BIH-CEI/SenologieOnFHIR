// ============================================================
// Questionnaire: Pathologie Befund
// Ziele:
//   - DiagnosticReport (Gesamtbefund)
//   - Specimen (Präparat)
//   - Observation (Histologie)
//   - Observation (Immunhistochemie / Rezeptorstatus)
// Extraktion: SDC Template-based Extraction mit contained
//   Ressourcen-Templates pro Zieltyp.
// ============================================================

// --- Contained template: DiagnosticReport ---
Instance: patho-report-template
InstanceOf: DiagnosticReport
Usage: #inline
* id = "patho-report-template"
* status = #final
* code = $LOINC#60568-3 "Pathology synoptic report"
* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// --- Contained template: Specimen ---
Instance: patho-specimen-template
InstanceOf: Specimen
Usage: #inline
* id = "patho-specimen-template"
* status = #available
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-pathologie-praeparat"

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// Specimen.type ← praeparat-art (Stanzbiopsie/Vakuum/Punch/Resektat/Zytologie/FNA)
// Treibt zugleich den oBDS-Diagnosesicherungs-Code für Update der Condition
* type.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* type.coding[=].extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-art').answer.valueCoding"
* type.coding[=].system = $SCT

// Specimen.collection.collectedDateTime ← Entnahmedatum
* collection.collectedDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* collection.collectedDateTime.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-entnahmedatum').answer.valueDate"

// Specimen.collection.bodySite.coding ← Seite (SCT)
* collection.bodySite.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* collection.bodySite.coding[=].extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-seite').answer.valueCoding"
* collection.bodySite.coding[=].system = $SCT

// Specimen.collection.bodySite.extension[R5-bodySite-Ref] → BodyStructure (Tumor-Entität)
// HL7 Cross-Version Extension (forward-kompatibel zu R5 CodeableReference)
* collection.bodySite.extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Specimen.collection.bodySite"
* collection.bodySite.extension[=].valueReference.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* collection.bodySite.extension[=].valueReference.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"

// --- Contained template: Observation (Histologie) ---
Instance: patho-histo-template
InstanceOf: Observation
Usage: #inline
* id = "patho-histo-template"
* status = #final
* code = $LOINC#33731-1 "Histology type in Cancer specimen"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// --- Contained template: Observation (IHC / Rezeptorstatus) ---
// ER-Status Template — erzeugt Senologie_ER_Status Observation
Instance: patho-er-template
InstanceOf: Observation
Usage: #inline
* id = "patho-er-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-er-status"
* status = #final
* code = $LOINC#40556-3 "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
// Components: % positiv, IRS, Allred, Intensitaet
* component[+].code = $SCT#1234806008 "Percent of cells with estrogen receptor"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-prozent').answer.valueInteger"
* component[+].code = $CS_Senologie_Biomarker#irs-score "IRS (Remmele-Stegner)"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-irs').answer.valueInteger"
* component[+].code = $CS_Senologie_Biomarker#allred-score "Allred Score"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-allred').answer.valueInteger"
* component[+].code = $SCT#1236874005 "Intensity of stain of estrogen receptor"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-er-intensitaet').answer.valueCoding"

// PR-Status Template — erzeugt Senologie_PR_Status Observation
Instance: patho-pr-template
InstanceOf: Observation
Usage: #inline
* id = "patho-pr-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-pr-status"
* status = #final
* code = $LOINC#85339-0 "Progesterone receptor [Interpretation] in Tissue by Immune stain"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
// Components: % positiv, IRS, Allred, Intensitaet
* component[+].code = $SCT#1234803000 "Percent of cells with progesterone receptor"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-prozent').answer.valueInteger"
* component[+].code = $CS_Senologie_Biomarker#irs-score "IRS (Remmele-Stegner)"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-irs').answer.valueInteger"
* component[+].code = $CS_Senologie_Biomarker#allred-score "Allred Score"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-allred').answer.valueInteger"
* component[+].code = $SCT#1237278006 "Intensity of stain of progesterone receptor"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pr-intensitaet').answer.valueCoding"

// HER2-Status Template — erzeugt Senologie_HER2_Status Observation
Instance: patho-her2-template
InstanceOf: Observation
Usage: #inline
* id = "patho-her2-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-her2-status"
* status = #final
* code = $LOINC#48676-1 "HER2 [Interpretation] in Tissue"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
// HER2-Gesamtstatus nach Leitlinie (positiv/low/ultralow/negativ/equivocal)
* valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-gesamt').answer.valueCoding"
// Components: IHC-Score, FISH/ISH, ISH-Methode, Ratio
* component[+].code = $LOINC#85319-2 "HER2 [Presence] in Breast cancer specimen"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-score').answer.valueCoding"
* component[+].code = $LOINC#85318-4 "ERBB2 gene duplication"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-fish').answer.valueCoding"
* component[+].code = $CS_Senologie_Biomarker#ish-methode "ISH-Methode (FISH/CISH/DISH/SISH)"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-ish-methode').answer.valueCoding"
* component[+].code = $CS_Senologie_Biomarker#her2-ratio "HER2/CEP17 Ratio"
* component[=].valueQuantity.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueQuantity.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-her2-ratio').answer.valueDecimal"

// Ki-67 Template — erzeugt Senologie_Ki67_Proliferationsindex Observation
Instance: patho-ki67-template
InstanceOf: Observation
Usage: #inline
* id = "patho-ki67-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-ki67-proliferationsindex"
// Ki67-Wert = Prozent positive Zellen
* valueQuantity.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueQuantity.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-ki67').answer.valueInteger"
* status = #final
* code = $LOINC#29593-1 "Cells.Ki-67 nuclear Ag/cells in Tissue by Immune stain"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// PD-L1 Template — erzeugt Senologie_PDL1_Status Observation
// Korrigierter LOINC-Code: 96338-2 PD-L1 (war versehentlich HER2-Code 85318-4)
Instance: patho-pdl1-template
InstanceOf: Observation
Usage: #inline
* id = "patho-pdl1-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-pdl1-status"
* status = #final
* code = $LOINC#96338-2 "PD-L1 expression in Tissue by Immune stain"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
// Components: TPS, CPS, IC (Pflicht-Trio bei PD-L1)
* component[+].code = $LOINC#95046-2 "PD-L1 expression cell number in Tissue by Immune stain"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pdl1-tps').answer.valueInteger"
* component[+].code = $LOINC#96337-4 "Combined positive score"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pdl1-cps').answer.valueInteger"
* component[+].code = $SCT#737023007 "Tumor-infiltrating lymphocytes"
* component[=].valueInteger.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueInteger.extension.valueString = "%resource.item.where(linkId='ihc').item.where(linkId='ihc-pdl1-ic').answer.valueInteger"

// --- Contained template: pT-Kategorie Observation (MII Onko, cp-praefix=p) ---
Instance: patho-pt-template
InstanceOf: Observation
Usage: #inline
* id = "patho-pt-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-t-kategorie"
* status = #final
* code = $SCT#384625004 "pT category (observable entity)"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='pt').answer.valueCoding"
* valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// --- Contained template: pN-Kategorie Observation ---
Instance: patho-pn-template
InstanceOf: Observation
Usage: #inline
* id = "patho-pn-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-n-kategorie"
* status = #final
* code = $SCT#277206009 "pN category (observable entity)"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='pn').answer.valueCoding"
* valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// --- Contained template: pM-Kategorie Observation ---
Instance: patho-pm-template
InstanceOf: Observation
Usage: #inline
* id = "patho-pm-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-m-kategorie"
* status = #final
* code = $SCT#371497001 "pM category (observable entity)"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='pm').answer.valueCoding"
* valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// --- Contained template: L-Kategorie Observation (Lymphangiosis) ---
Instance: patho-l-template
InstanceOf: Observation
Usage: #inline
* id = "patho-l-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-l-kategorie"
* status = #final
* code = $SCT#395715009 "Lymph node invasion finding"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='l-kategorie').answer.valueCoding"
* valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// --- Contained template: V-Kategorie Observation (Vasoinvasion) ---
Instance: patho-v-template
InstanceOf: Observation
Usage: #inline
* id = "patho-v-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-v-kategorie"
* status = #final
* code = $SCT#371493002 "Vascular invasion finding"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='v-kategorie').answer.valueCoding"
* valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// --- Contained template: Pn-Kategorie Observation (Perineuralinvasion) ---
Instance: patho-pn-perineural-template
InstanceOf: Observation
Usage: #inline
* id = "patho-pn-perineural-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-pn-kategorie"
* status = #final
* code = $SCT#371513001 "Perineural invasion finding"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='pn-perineural').answer.valueCoding"
* valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// --- Contained template: R-Status Observation (Residualtumor) ---
Instance: patho-r-template
InstanceOf: Observation
Usage: #inline
* id = "patho-r-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-r-symbol"
* status = #final
* code = $LOINC#101659-1 "Residual tumor"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='ptnm').item.where(linkId='r-status').answer.valueCoding"
* valueCodeableConcept.coding[=].system = $SCT

// --- Contained template: B-Klassifikations-Observation ---
// Discrete Observation pro Specimen mit Histo-Befund (B0..B5b)
// focus → BodyStructure (Tumor-Entität die beurteilt wurde)
// specimen → Specimen (das Material des Befunds)
Instance: patho-b-klassifikation-template
InstanceOf: Observation
Usage: #inline
* id = "patho-b-klassifikation-template"
* status = #final
* code = $LOINC#33731-1 "Histology type in Cancer specimen"
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"
* specimen.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* specimen.extension.valueString = "%NewSpecimenId"
// value[x] = B-Klassifikation (B0/B1/B2/B3/B4/B5a/B5b) → SCT-Mapping
* valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='histologie').item.where(linkId='b-klassifikation').answer.valueCoding"
* valueCodeableConcept.coding[=].system = $SCT

// --- Contained template: BodyStructure-MORPHOLOGY-UPDATE ---
// PUT-Update auf existierende BodyStructure (picked aus Bildgebung) — setzt
// morphology auf das aktuelle B-Klassifikations-Ergebnis. Bundle.entry.fullUrl
// evaluiert zu "BodyStructure/<id>" (relative URL) → SDC-Engine erzeugt PUT.
Instance: patho-bs-morphology-update-template
InstanceOf: BodyStructure
Usage: #inline
* id = "patho-bs-morphology-update-template"
* active = true
* patient.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.reference.extension.valueString = "%resource.subject.reference"
// morphology ← B-Klassifikation-Ergebnis (gleiche Quelle wie Observation)
* morphology.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* morphology.coding[=].extension.valueString = "%resource.item.where(linkId='histologie').item.where(linkId='b-klassifikation').answer.valueCoding"
* morphology.coding[=].system = $SCT

// --- Questionnaire ---
Instance: senologie-pathologie
InstanceOf: Questionnaire
Title: "Fragebogen: Pathologie Befund"
Description: "Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie"
* name = "QuestPathologieBefund"
* title = "Fragebogen: Pathologie Befund"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained templates
* contained[+] = patho-report-template
* contained[+] = patho-specimen-template
* contained[+] = patho-histo-template
* contained[+] = patho-er-template
* contained[+] = patho-pr-template
* contained[+] = patho-her2-template
* contained[+] = patho-ki67-template
* contained[+] = patho-pdl1-template
* contained[+] = patho-b-klassifikation-template
* contained[+] = patho-bs-morphology-update-template
* contained[+] = patho-pt-template
* contained[+] = patho-pn-template
* contained[+] = patho-pm-template
* contained[+] = patho-l-template
* contained[+] = patho-v-template
* contained[+] = patho-pn-perineural-template
* contained[+] = patho-r-template

// Variable for cross-template Specimen-Reference
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/variable"
* extension[=].valueExpression.name = "NewSpecimenId"
* extension[=].valueExpression.language = #text/fhirpath
* extension[=].valueExpression.expression = "'urn:uuid:' + uuid()"

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient


// Launch Context: Diagnose (Condition als Anker für Pre-Population)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #diagnosis
* extension[=].extension[=].valueCoding.display = "Diagnose (Anker-Condition)"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Condition
* extension[=].extension[+].url = "description"
* extension[=].extension[=].valueString = "Anker-Diagnose (Condition) für Pre-Population. Vom Frontend nach Diagnose-Choice gesetzt."
// ============================================================
// Group 1: Präparat (Specimen)
// ============================================================
* item[+].linkId = "praeparat"
* item[=].text = "Präparat"
* item[=].type = #group
* item[=].required = true

// SDC templateExtract → contained Specimen template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-specimen-template)

// Art des Präparats (dotbase-aligned, 8 Choices)
// Diese Auswahl treibt den oBDS-Diagnosesicherungs-Code (Code 5/7/8) der
// auf die Condition.verificationStatus[primaertumorDiagnosesicherung]-Slice
// geschrieben werden soll (via Update auf launchContext.diagnosis).
* item[=].item[+].linkId = "praeparat-art"
* item[=].item[=].text = "Art des Präparats"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-praeparat-art"

// Entnahmedatum
* item[=].item[+].linkId = "praeparat-entnahmedatum"
* item[=].item[=].text = "Entnahmedatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Seite (korrigierte SCT-Codes)
* item[=].item[+].linkId = "praeparat-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Lokalisation / Quadrant
* item[=].item[+].linkId = "praeparat-quadrant"
* item[=].item[=].text = "Lokalisation / Quadrant"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-quadrant-mamma"

// Tumor-Entität (BodyStructure aus Bildgebung) — User-Choice
// SDC candidateExpression querriert existierende BodyStructures des Patienten
// Specimen.collection.bodySite.extension[R5-Ref] wird damit befüllt
* item[=].item[+].linkId = "praeparat-tumor-entitaet"
* item[=].item[=].text = "Tumor-Entität (aus Bildgebung)"
* item[=].item[=].type = #reference
* item[=].item[=].required = false
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].item[=].extension[=].valueExpression.expression = "BodyStructure?patient={{%patient.id}}&active=true"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].item[=].extension[=].extension[+].url = "path"
* item[=].item[=].extension[=].extension[=].valueString = "location.coding.first().display"
* item[=].item[=].extension[=].extension[+].url = "label"
* item[=].item[=].extension[=].extension[=].valueString = "Lokalisation"
* item[=].item[=].extension[=].extension[+].url = "forDisplay"
* item[=].item[=].extension[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].item[=].extension[=].extension[+].url = "path"
* item[=].item[=].extension[=].extension[=].valueString = "locationQualifier.first().coding.first().display"
* item[=].item[=].extension[=].extension[+].url = "label"
* item[=].item[=].extension[=].extension[=].valueString = "Seite"
* item[=].item[=].extension[=].extension[+].url = "forDisplay"
* item[=].item[=].extension[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].item[=].extension[=].extension[+].url = "path"
* item[=].item[=].extension[=].extension[=].valueString = "description"
* item[=].item[=].extension[=].extension[+].url = "label"
* item[=].item[=].extension[=].extension[=].valueString = "Details"
* item[=].item[=].extension[=].extension[+].url = "forDisplay"
* item[=].item[=].extension[=].extension[=].valueBoolean = true

// ============================================================
// Group 2: Histologie (Observation)
// ============================================================
* item[+].linkId = "histologie"
* item[=].text = "Histologie"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → contained Histologie template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-histo-template)

// SDC templateExtract → B-Klassifikations-Observation (POST, neue Resource)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-b-klassifikation-template)

// SDC templateExtract → BodyStructure MORPHOLOGY UPDATE (PUT)
// fullUrl = picked BS-Ref (relative URL → SDC-Engine erzeugt PUT-Entry)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-bs-morphology-update-template)
* item[=].extension[=].extension[+].url = "fullUrl"
* item[=].extension[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].extension[=].valueExpression.expression = "%resource.item.where(linkId='praeparat').item.where(linkId='praeparat-tumor-entitaet').answer.valueReference.reference"

// B-Klassifikation (NHSBSP B0-B5b, dotbase "Histologie allgemein")
// Mapping SCT-Codes:
//   B0 → 87100004 "Specimen unsatisfactory"
//   B1 → 76752008 "Breast structure"  (normales Brustgewebe; technisch eine Lokalisation, hier als "Normalbefund")
//   B2 → 53076004 "Benign neoplasm of breast"
//   B3 → 269497004 "Neoplasm of uncertain behaviour of breast"
//   B4 → 1145403004 "Cytologic findings indicative of breast malignancy" (näherungsweise)
//   B5a → 109889007 "Carcinoma in situ of breast"
//   B5b → 254837009 "Malignant tumor of breast"
* item[=].item[+].linkId = "b-klassifikation"
* item[=].item[=].text = "Histologie allgemein (NHSBSP B-Klassifikation)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-b-klassifikation"

// Histologischer Typ
* item[=].item[+].linkId = "histo-typ"
* item[=].item[=].text = "Histologischer Typ"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-histologie-typ"

// Grading
* item[=].item[+].linkId = "histo-grading"
* item[=].item[=].text = "Grading (Elston-Ellis)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#371469007 "Histologic grade"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-grading-mamma"

// Tumorgröße in mm
* item[=].item[+].linkId = "histo-tumorgroesse"
* item[=].item[=].text = "Tumorgröße (mm)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#21889-1 "Size Tumor"

// Invasive Tumorgröße in mm
* item[=].item[+].linkId = "histo-invasive-groesse"
* item[=].item[=].text = "Invasive Tumorgröße (mm)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#33728-7 "Size.maximum dimension in Tumor"

// DCIS-Anteil
* item[=].item[+].linkId = "histo-dcis-anteil"
* item[=].item[=].text = "DCIS-Anteil"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Resektionsrand
* item[=].item[+].linkId = "histo-resektionsrand"
* item[=].item[=].text = "Resektionsrand"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#395536008 "Surgical margin finding"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status-patho"

// Sentinel-LK Anzahl
* item[=].item[+].linkId = "histo-sentinel-anzahl"
* item[=].item[=].text = "Sentinel-LK untersucht"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85347-3 "Sentinel lymph nodes examined [#]"

// Sentinel-LK befallen
* item[=].item[+].linkId = "histo-sentinel-befallen"
* item[=].item[=].text = "Sentinel-LK befallen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#92832-5 "Sentinel lymph nodes with metastasis [#]"

// ============================================================
// Group 2b: pTNM + Invasionsachsen (L/V/Pn) + R-Status
// Jedes Feld erzeugt eine eigene MII-Onko-konforme Observation
// (T/N/M-Kategorie, L/V/Pn-Kategorie, R-Symbol) — focus → BodyStructure
// ============================================================
* item[+].linkId = "ptnm"
* item[=].text = "pTNM + Invasion + Resektionsstatus"
* item[=].type = #group
* item[=].required = false

// templateExtract für 7 separate Observations
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-pt-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-pn-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-pm-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-l-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-v-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-pn-perineural-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-r-template)

// pT (postoperatives T)
* item[=].item[+].linkId = "pt"
* item[=].item[=].text = "pT"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-t-kategorie-mamma"

// pN (postoperatives N)
* item[=].item[+].linkId = "pn"
* item[=].item[=].text = "pN"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-n-kategorie-mamma"

// pM (postoperatives M)
* item[=].item[+].linkId = "pm"
* item[=].item[=].text = "pM"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-m-kategorie-mamma"

// L-Kategorie (Lymphangiosis)
* item[=].item[+].linkId = "l-kategorie"
* item[=].item[=].text = "L (Lymphangiosis carcinomatosa)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-l-kategorie"

// V-Kategorie (Vasoinvasion)
* item[=].item[+].linkId = "v-kategorie"
* item[=].item[=].text = "V (Venöse Invasion)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-v-kategorie"

// Pn-Kategorie (Perineuralinvasion)
* item[=].item[+].linkId = "pn-perineural"
* item[=].item[=].text = "Pn (Perineuralinvasion)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-pn-kategorie"

// R-Status (Resektionsstatus, SCT-codiert)
* item[=].item[+].linkId = "r-status"
* item[=].item[=].text = "R-Status (Resektionsstatus)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-r-status"

// ============================================================
// Group 3: Immunhistochemie / Rezeptorstatus (Observation)
// ============================================================
* item[+].linkId = "ihc"
* item[=].text = "Immunhistochemie / Rezeptorstatus"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → drei contained Templates (ER, PR, HER2)
//   Jeder Template erzeugt eine eigene Observation mit dem entsprechenden
//   Senologie-Profil. Beim Submit des QR werden also drei Observations
//   pro Pathologie-Befund extrahiert (sofern die Q-Items befüllt sind).
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-er-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-pr-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-her2-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-ki67-template)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-pdl1-template)

// ER Prozent positiv → component[AnteilPositiveZellen].valueQuantity
* item[=].item[+].linkId = "ihc-er-prozent"
* item[=].item[=].text = "ER Prozent positiv (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#1234804006 "Percent of cells with estrogen receptor"

// ER IRS Score → component[irsScore].valueQuantity
* item[=].item[+].linkId = "ihc-er-irs"
* item[=].item[=].text = "ER IRS Score (0–12, Remmele-Stegner, DE-Standard)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $CS_Senologie_Biomarker#irs-score "IRS (Remmele-Stegner)"

// ER Allred Score → component[allredScore].valueQuantity
* item[=].item[+].linkId = "ihc-er-allred"
* item[=].item[=].text = "ER Allred Score (0–8, international)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $CS_Senologie_Biomarker#allred-score "Allred Score"

// ER Färbeintensität → component[Faerbeintensitaet].valueCodeableConcept
* item[=].item[+].linkId = "ihc-er-intensitaet"
* item[=].item[=].text = "ER Färbeintensität"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#1236874005 "Intensity of stain of estrogen receptor"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ihc-intensitaet"

// PR Prozent positiv → component[AnteilPositiveZellen].valueQuantity
* item[=].item[+].linkId = "ihc-pr-prozent"
* item[=].item[=].text = "PR Prozent positiv (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#1234803000 "Percent of cells with progesterone receptor"

// PR IRS Score → component[irsScore].valueQuantity
* item[=].item[+].linkId = "ihc-pr-irs"
* item[=].item[=].text = "PR IRS Score (0–12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $CS_Senologie_Biomarker#irs-score "IRS (Remmele-Stegner)"

// PR Allred Score → component[allredScore].valueQuantity
* item[=].item[+].linkId = "ihc-pr-allred"
* item[=].item[=].text = "PR Allred Score (0–8)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $CS_Senologie_Biomarker#allred-score "Allred Score"

// PR Färbeintensität → component[Faerbeintensitaet].valueCodeableConcept
* item[=].item[+].linkId = "ihc-pr-intensitaet"
* item[=].item[=].text = "PR Färbeintensität"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#1237278006 "Intensity of stain of progesterone receptor"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ihc-intensitaet"

// HER2 IHC Score → component[IHCScore].valueCodeableConcept
* item[=].item[+].linkId = "ihc-her2-score"
* item[=].item[=].text = "HER2 IHC Score"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85319-2 "HER2 [Presence] in Breast cancer specimen"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-ihc-score"

// HER2-Gesamtstatus nach Leitlinie → value[x].coding[DefinitionLeitlinie]
* item[=].item[+].linkId = "ihc-her2-gesamt"
* item[=].item[=].text = "HER2-Gesamtstatus (Leitlinie, inkl. HER2-low / HER2-ultralow)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-gesamt"

// HER2 ISH/FISH (bei HER2 IHC = 2+) → component[ISHResult].valueCodeableConcept
* item[=].item[+].linkId = "ihc-her2-fish"
* item[=].item[=].text = "HER2 ISH/FISH"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85318-4 "ERBB2 gene duplication"
* item[=].item[=].enableWhen[+].question = "ihc-her2-score"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score#2 "2+"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-her2-fish"

// HER2 ISH-Methode (FISH/CISH/DISH/SISH) — Senologie-Erweiterung
* item[=].item[+].linkId = "ihc-her2-ish-methode"
* item[=].item[=].text = "HER2 ISH-Methode"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "ihc-her2-fish"
* item[=].item[=].enableWhen[=].operator = #exists
* item[=].item[=].enableWhen[=].answerBoolean = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ish-methode"

// HER2/CEP17 Ratio (quantitativ aus ISH) — Senologie-Erweiterung, im MII MTB modelliert
* item[=].item[+].linkId = "ihc-her2-ratio"
* item[=].item[=].text = "HER2/CEP17 Ratio (FISH/CISH, Cutoff ≥ 2.0 = amplifiziert)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "ihc-her2-fish"
* item[=].item[=].enableWhen[=].operator = #exists
* item[=].item[=].enableWhen[=].answerBoolean = true

// HER2 Kopienzahl pro Zelle — Senologie-Erweiterung
* item[=].item[+].linkId = "ihc-her2-kopienzahl"
* item[=].item[=].text = "HER2-Kopienzahl pro Zelle (Cutoff ≥ 6 = amplifiziert)"
* item[=].item[=].type = #decimal
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "ihc-her2-fish"
* item[=].item[=].enableWhen[=].operator = #exists
* item[=].item[=].enableWhen[=].answerBoolean = true

// Ki-67 Index % → valueQuantity
* item[=].item[+].linkId = "ihc-ki67"
* item[=].item[=].text = "Ki-67 Index (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#29593-1 "Ki-67 [Percentile] in Tissue"

// PD-L1 TPS (Tumor Proportion Score)
* item[=].item[+].linkId = "ihc-pdl1-tps"
* item[=].item[=].text = "PD-L1 TPS (Tumor Proportion Score, %)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// PD-L1 CPS (Combined Positive Score)
* item[=].item[+].linkId = "ihc-pdl1-cps"
* item[=].item[=].text = "PD-L1 CPS (Combined Positive Score)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// PD-L1 IC (Immune Cell Score)
* item[=].item[+].linkId = "ihc-pdl1-ic"
* item[=].item[=].text = "PD-L1 IC (Immune Cell Score, %)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 4: Gesamtbeurteilung (DiagnosticReport)
// ============================================================
* item[+].linkId = "beurteilung"
* item[=].text = "Gesamtbeurteilung"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → contained DiagnosticReport template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-report-template)

// pTNM Staging
* item[=].item[+].linkId = "beurteilung-ptnm"
* item[=].item[=].text = "pTNM"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Gesamtbeurteilung Freitext
* item[=].item[+].linkId = "beurteilung-freitext"
* item[=].item[=].text = "Gesamtbeurteilung (Freitext)"
* item[=].item[=].type = #text
* item[=].item[=].required = false
