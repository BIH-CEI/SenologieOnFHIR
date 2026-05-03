// ============================================================
// Questionnaire: Pathologie Befund
// Quelle: dotbase Codebook Section "Pathologie"
// Ziele:
//   - DiagnosticReport (Gesamtbefund)
//   - Specimen (Praeparat)
//   - Observation (Histologie)
//   - Observation (Immunhistochemie / Rezeptorstatus)
// Extraktion: SDC Template-based Extraction mit contained
//   Ressourcen-Templates pro Zieltyp.
// =====================================================

Instance: senologie-pathologie
InstanceOf: Questionnaire
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie"
* name = "QuestPathologieBefund"
* title = "Fragebogen: Pathologie Befund"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained templates
// TODO: * contained[+] = patho-report-template
// TODO: * contained[+] = patho-specimen-template
// TODO: * contained[+] = patho-histo-template
// TODO: * contained[+] = patho-ihc-template

// SDC templateExtract -> contained templates
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[template].valueReference = Reference(TODO-patho-report-template)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[template].valueReference = Reference(TODO-patho-specimen-template)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[template].valueReference = Reference(TODO-patho-histo-template)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[template].valueReference = Reference(TODO-patho-ihc-template)

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Group 1: Praeparat (Specimen)
// ============================================================
* item[+].linkId = "praeparat"
* item[=].text = "Praeparat"
* item[=].type = #group
* item[=].required = true

// Art des Praeparats
* item[=].item[+].linkId = "praeparat-art"
* item[=].item[=].text = "Art des Praeparats"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.type"
* item[=].item[=].answerOption[+].valueCoding = $SCT#86273004 "Biopsy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#129300006 "Puncture - action"
* item[=].item[=].answerOption[+].valueCoding = $SCT#65801008 "Excision"
* item[=].item[=].answerOption[+].valueCoding = $SCT#392021009 "Lumpectomy of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#172043006 "Simple mastectomy"
* item[=].item[=].answerOption[+].valueString = "Nachresektat"

// Entnahmedatum
* item[=].item[+].linkId = "praeparat-entnahmedatum"
* item[=].item[=].text = "Entnahmedatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.collected[x]"

// Seite
* item[=].item[+].linkId = "praeparat-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Specimen#Specimen.collection.bodySite"
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"

// Lokalisation / Quadrant
* item[=].item[+].linkId = "praeparat-quadrant"
* item[=].item[=].text = "Lokalisation / Quadrant"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#246264006 "Site of lesion"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76365002 "Structure of upper outer quadrant of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#77831004 "Structure of upper inner quadrant of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#33564002 "Lower outer quadrant of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#19100000 "Lower inner quadrant of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#24142002 "Nipple structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#70925003 "Central portion of breast"

// ============================================================
// Group 2: Histologie (Observation)
// ============================================================
* item[+].linkId = "histologie"
* item[=].text = "Histologie"
* item[=].type = #group
* item[=].required = false

// Histologischer Typ
* item[=].item[+].linkId = "histo-typ"
* item[=].item[=].text = "Histologischer Typ"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.value[x]"
* item[=].item[=].answerOption[+].valueCoding = $SCT#82711006 "Infiltrating duct carcinoma"
* item[=].item[=].answerOption[+].valueCoding = $SCT#443451005 "Invasive lobular carcinoma of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#109889007 "Ductal carcinoma in situ of breast"
* item[=].item[=].answerOption[+].valueString = "Sonstiges"

// Grading (Bloom-Richardson)
* item[=].item[+].linkId = "histo-grading"
* item[=].item[=].text = "Grading (Bloom-Richardson)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#371469007 "Histologic grade"
* item[=].item[=].answerOption[+].valueCoding = $SCT#54102005 "G1 grade"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1663004 "G2 grade"
* item[=].item[=].answerOption[+].valueCoding = $SCT#61026006 "G3 grade"

// Tumorgroesse in mm
* item[=].item[+].linkId = "histo-tumorgroesse"
* item[=].item[=].text = "Tumorgroesse in mm"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#21889-1 "Size Tumor"

// Invasive Tumorgroesse in mm
* item[=].item[+].linkId = "histo-invasive-groesse"
* item[=].item[=].text = "Invasive Tumorgroesse in mm"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#33728-7 "Size.maximum dimension in Tumor"

// DCIS-Anteil
* item[=].item[+].linkId = "histo-dcis-anteil"
* item[=].item[=].text = "DCIS-Anteil"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#109889007 "Ductal carcinoma in situ of breast"

// Resektionsrand
* item[=].item[+].linkId = "histo-resektionsrand"
* item[=].item[=].text = "Resektionsrand"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $SCT#395536008 "Surgical margin finding"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258254000 "Residual tumor stage R0"
* item[=].item[=].answerOption[+].valueCoding = $SCT#278271003 "Residual tumor stage R1"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258253006 "Residual tumor stage RX"

// Sentinel-LK Anzahl
* item[=].item[+].linkId = "histo-sentinel-anzahl"
* item[=].item[=].text = "Sentinel-LK Anzahl"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85347-3 "Sentinel lymph nodes examined [#] in Cancer specimen by Light microscopy"

// Sentinel-LK befallen
* item[=].item[+].linkId = "histo-sentinel-befallen"
* item[=].item[=].text = "Sentinel-LK befallen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#92832-5 "Sentinel lymph nodes with metastasis [#] in Cancer specimen"

// ============================================================
// Group 3: Immunhistochemie / Rezeptorstatus (Observation)
// ============================================================
* item[+].linkId = "ihc"
* item[=].text = "Immunhistochemie / Rezeptorstatus"
* item[=].type = #group
* item[=].required = false

// ER Prozent positiv
* item[=].item[+].linkId = "ihc-er-prozent"
* item[=].item[=].text = "ER Prozent positiv"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"

// ER IRS Score
* item[=].item[+].linkId = "ihc-er-irs"
* item[=].item[=].text = "ER IRS Score (0-12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85310-1 "Estrogen receptor fluorescence intensity [Type] in Breast cancer specimen by Immune stain"

// PR Prozent positiv
* item[=].item[+].linkId = "ihc-pr-prozent"
* item[=].item[=].text = "PR Prozent positiv"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"

// PR IRS Score
* item[=].item[+].linkId = "ihc-pr-irs"
* item[=].item[=].text = "PR IRS Score (0-12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85331-7 "Progesterone receptor fluorescence intensity [Type] in Breast cancer specimen by Immune stain"

// HER2 IHC Score
* item[=].item[+].linkId = "ihc-her2-score"
* item[=].item[=].text = "HER2 IHC Score"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85319-2 "HER2 [Presence] in Breast cancer specimen by Immune stain"
* item[=].item[=].answerOption[+].valueString = "0"
* item[=].item[=].answerOption[+].valueString = "1+"
* item[=].item[=].answerOption[+].valueString = "2+"
* item[=].item[=].answerOption[+].valueString = "3+"

// HER2 ISH/FISH (bei HER2 IHC = 2+)
* item[=].item[+].linkId = "ihc-her2-fish"
* item[=].item[=].text = "HER2 ISH/FISH"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85318-4 "ERBB2 gene duplication [Presence] in Breast cancer specimen by FISH"
* item[=].item[=].enableWhen[+].question = "ihc-her2-score"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "2+"
* item[=].item[=].answerOption[+].valueString = "positiv"
* item[=].item[=].answerOption[+].valueString = "negativ"
* item[=].item[=].answerOption[+].valueString = "nicht durchgefuehrt"

// Ki-67 Index %
* item[=].item[+].linkId = "ihc-ki67"
* item[=].item[=].text = "Ki-67 Index (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.value[x]"
* item[=].item[=].code[+] = $LOINC#85330-9 "Cells.Ki-67 nuclear Ag/cells in Breast cancer specimen by Immune stain"

// =====================================================// ============================================================
* item[+].linkId = "beurteilung"
* item[=].text = "Gesamtbeurteilung"
* item[=].type = #group
* item[=].required = false

// pTNM Staging
* item[=].item[+].linkId = "beurteilung-ptnm"
* item[=].item[=].text = "pTNM Staging"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.conclusion"

// Gesamtbeurteilung Freitext
* item[=].item[+].linkId = "beurteilung-freitext"
* item[=].item[=].text = "Gesamtbeurteilung (Freitext)"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/DiagnosticReport#DiagnosticReport.presentedForm.data"
