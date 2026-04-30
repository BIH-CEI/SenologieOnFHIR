// ============================================================
// Questionnaire: Pathologie Befund
// Quelle: dotbase Codebook Section "Pathologie"
// Ziele:
//   - DiagnosticReport (Gesamtbefund)
//   - Specimen (Praeparat)
//   - Observation (Histologie, Immunhistochemie)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: senologie-pathologie
InstanceOf: Questionnaire
Title: "Fragebogen: Pathologie Befund"
Description: "Fragebogen zur strukturierten Dokumentation des pathologischen Befundes (Praeparat, Histologie, Immunhistochemie/Rezeptorstatus, Gesamtbeurteilung). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Specimen, Observation, DiagnosticReport)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie"
* name = "QuestPathologieBefund"
* title = "Fragebogen: Pathologie Befund"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// Top-level Extraction Context (DiagnosticReport)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "DiagnosticReport"

// ============================================================
// Group 1: Praeparat (Specimen)
// ============================================================
* item[+].linkId = "praeparat"
* item[=].text = "Praeparat"
* item[=].type = #group
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Specimen"

// Art des Praeparats
* item[=].item[+].linkId = "praeparat-art"
* item[=].item[=].text = "Art des Praeparats"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#86273004 "Biopsy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#129300006 "Puncture - Loss of vacuum"
* item[=].item[=].answerOption[+].valueCoding = $SCT#65801008 "Excision"
* item[=].item[=].answerOption[+].valueCoding = $SCT#392021009 "Lumpectomy of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#172043006 "Simple mastectomy"
* item[=].item[=].answerOption[+].valueString = "Nachresektat"

// Entnahmedatum
* item[=].item[+].linkId = "praeparat-entnahmedatum"
* item[=].item[=].text = "Entnahmedatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Seite
* item[=].item[+].linkId = "praeparat-seite"
* item[=].item[=].text = "Seite"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"

// Lokalisation / Quadrant
* item[=].item[+].linkId = "praeparat-quadrant"
* item[=].item[=].text = "Lokalisation / Quadrant"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#77831004 "Upper outer quadrant of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76365002 "Upper inner quadrant of breast"
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
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// Histologischer Typ
* item[=].item[+].linkId = "histo-typ"
* item[=].item[=].text = "Histologischer Typ"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#82711006 "Infiltrating duct carcinoma"
* item[=].item[=].answerOption[+].valueCoding = $SCT#443451005 "Invasive lobular carcinoma of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#109889007 "Intraductal carcinoma, noninfiltrating"
* item[=].item[=].answerOption[+].valueString = "Sonstiges"

// Grading (Bloom-Richardson)
* item[=].item[+].linkId = "histo-grading"
* item[=].item[=].text = "Grading (Bloom-Richardson)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#54102005 "G1 grade"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1663004 "G2 grade"
* item[=].item[=].answerOption[+].valueCoding = $SCT#61026006 "G3 grade"

// Tumorgroesse in mm
* item[=].item[+].linkId = "histo-tumorgroesse"
* item[=].item[=].text = "Tumorgroesse in mm"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Invasive Tumorgroesse in mm
* item[=].item[+].linkId = "histo-invasive-groesse"
* item[=].item[=].text = "Invasive Tumorgroesse in mm"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

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
* item[=].item[=].answerOption[+].valueCoding = $SCT#258254000 "R0 - no residual tumour"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258255004 "R1 - microscopic residual tumour"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258257007 "RX - presence of residual tumour cannot be assessed"

// Sentinel-LK Anzahl
* item[=].item[+].linkId = "histo-sentinel-anzahl"
* item[=].item[=].text = "Sentinel-LK Anzahl"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// Sentinel-LK befallen
* item[=].item[+].linkId = "histo-sentinel-befallen"
* item[=].item[=].text = "Sentinel-LK befallen"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 3: Immunhistochemie / Rezeptorstatus (Observation)
// ============================================================
* item[+].linkId = "ihc"
* item[=].text = "Immunhistochemie / Rezeptorstatus"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// ER Prozent positiv
* item[=].item[+].linkId = "ihc-er-prozent"
* item[=].item[=].text = "ER Prozent positiv"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"

// ER IRS Score
* item[=].item[+].linkId = "ihc-er-irs"
* item[=].item[=].text = "ER IRS Score (0-12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// PR Prozent positiv
* item[=].item[+].linkId = "ihc-pr-prozent"
* item[=].item[=].text = "PR Prozent positiv"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85339-0 "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"

// PR IRS Score
* item[=].item[+].linkId = "ihc-pr-irs"
* item[=].item[=].text = "PR IRS Score (0-12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// HER2 IHC Score
* item[=].item[+].linkId = "ihc-her2-score"
* item[=].item[=].text = "HER2 IHC Score"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85319-2 "HER2 [Interpretation] in Breast cancer specimen by Immune stain"
* item[=].item[=].answerOption[+].valueString = "0"
* item[=].item[=].answerOption[+].valueString = "1+"
* item[=].item[=].answerOption[+].valueString = "2+"
* item[=].item[=].answerOption[+].valueString = "3+"

// HER2 ISH/FISH (nur bei HER2 IHC = 2+)
* item[=].item[+].linkId = "ihc-her2-fish"
* item[=].item[=].text = "HER2 ISH/FISH"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85318-4 "HER2 [Presence] in Breast cancer specimen by FISH"
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
* item[=].item[=].code[+] = $LOINC#85331-7 "Ki-67 [Presence] in Breast cancer specimen by Immune stain"

// ============================================================
// Group 4: Gesamtbeurteilung
// ============================================================
* item[+].linkId = "beurteilung"
* item[=].text = "Gesamtbeurteilung"
* item[=].type = #group
* item[=].required = false

// pTNM Staging
* item[=].item[+].linkId = "beurteilung-ptnm"
* item[=].item[=].text = "pTNM Staging"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Gesamtbeurteilung Freitext
* item[=].item[+].linkId = "beurteilung-freitext"
* item[=].item[=].text = "Gesamtbeurteilung (Freitext)"
* item[=].item[=].type = #text
* item[=].item[=].required = false
