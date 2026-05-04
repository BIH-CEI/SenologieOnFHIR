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
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: Specimen ---
Instance: patho-specimen-template
InstanceOf: Specimen
Usage: #inline
* id = "patho-specimen-template"
* status = #available
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: Observation (Histologie) ---
Instance: patho-histo-template
InstanceOf: Observation
Usage: #inline
* id = "patho-histo-template"
* status = #final
* code = $LOINC#33731-1 "Histology type in Cancer specimen"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: Observation (IHC / Rezeptorstatus) ---
Instance: patho-ihc-template
InstanceOf: Observation
Usage: #inline
* id = "patho-ihc-template"
* status = #final
* code = $LOINC#85337-4 "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
* code.text = "Immunhistochemie / Rezeptorstatus"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

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
* contained[+] = patho-ihc-template

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

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

// Art des Präparats
* item[=].item[+].linkId = "praeparat-art"
* item[=].item[=].text = "Art des Präparats"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#86273004 "Biopsie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#129300006 "Punktion"
* item[=].item[=].answerOption[+].valueCoding = $SCT#65801008 "Exzision"
* item[=].item[=].answerOption[+].valueCoding = $SCT#392021009 "Brusterhaltende Exzision"
* item[=].item[=].answerOption[+].valueCoding = $SCT#172043006 "Mastektomie-Präparat"
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
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Links"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Rechts"

// Lokalisation / Quadrant
* item[=].item[+].linkId = "praeparat-quadrant"
* item[=].item[=].text = "Lokalisation / Quadrant"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#76365002 "Oberer äußerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#77831004 "Oberer innerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#33564002 "Unterer äußerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#19100000 "Unterer innerer Quadrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#24142002 "Mamille"
* item[=].item[=].answerOption[+].valueCoding = $SCT#70925003 "Zentral"

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

// Histologischer Typ
* item[=].item[+].linkId = "histo-typ"
* item[=].item[=].text = "Histologischer Typ"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#82711006 "Invasives Karzinom NST"
* item[=].item[=].answerOption[+].valueCoding = $SCT#443451005 "Invasives lobuläres Karzinom"
* item[=].item[=].answerOption[+].valueCoding = $SCT#109889007 "DCIS"
* item[=].item[=].answerOption[+].valueString = "Sonstiges"

// Grading
* item[=].item[+].linkId = "histo-grading"
* item[=].item[=].text = "Grading (Elston-Ellis)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#371469007 "Histologic grade"
* item[=].item[=].answerOption[+].valueCoding = $SCT#54102005 "G1"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1663004 "G2"
* item[=].item[=].answerOption[+].valueCoding = $SCT#61026006 "G3"

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
* item[=].item[=].answerOption[+].valueCoding = $SCT#258254000 "R0"
* item[=].item[=].answerOption[+].valueCoding = $SCT#278271003 "R1"
* item[=].item[=].answerOption[+].valueCoding = $SCT#258253006 "RX"

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
// Group 3: Immunhistochemie / Rezeptorstatus (Observation)
// ============================================================
* item[+].linkId = "ihc"
* item[=].text = "Immunhistochemie / Rezeptorstatus"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → contained IHC template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(patho-ihc-template)

// ER Prozent positiv
* item[=].item[+].linkId = "ihc-er-prozent"
* item[=].item[=].text = "ER Prozent positiv (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85337-4 "Estrogen receptor"

// ER IRS Score
* item[=].item[+].linkId = "ihc-er-irs"
* item[=].item[=].text = "ER IRS Score (0–12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// PR Prozent positiv
* item[=].item[+].linkId = "ihc-pr-prozent"
* item[=].item[=].text = "PR Prozent positiv (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85339-0 "Progesterone receptor"

// PR IRS Score
* item[=].item[+].linkId = "ihc-pr-irs"
* item[=].item[=].text = "PR IRS Score (0–12)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// HER2 IHC Score
* item[=].item[+].linkId = "ihc-her2-score"
* item[=].item[=].text = "HER2 IHC Score"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85319-2 "HER2 [Presence] in Breast cancer specimen"
* item[=].item[=].answerOption[+].valueString = "0"
* item[=].item[=].answerOption[+].valueString = "1+"
* item[=].item[=].answerOption[+].valueString = "2+"
* item[=].item[=].answerOption[+].valueString = "3+"

// HER2 ISH/FISH (bei HER2 IHC = 2+)
* item[=].item[+].linkId = "ihc-her2-fish"
* item[=].item[=].text = "HER2 ISH/FISH"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#85318-4 "ERBB2 gene duplication"
* item[=].item[=].enableWhen[+].question = "ihc-her2-score"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerString = "2+"
* item[=].item[=].answerOption[+].valueString = "positiv"
* item[=].item[=].answerOption[+].valueString = "negativ"
* item[=].item[=].answerOption[+].valueString = "nicht durchgeführt"

// Ki-67 Index %
* item[=].item[+].linkId = "ihc-ki67"
* item[=].item[=].text = "Ki-67 Index (%)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#29593-1 "Ki-67 [Percentile] in Tissue"

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
