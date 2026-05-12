// ============================================================
// Questionnaire: Diagnose Mamma
// Ziele:
//   - Condition (Senologie_Diagnose_Maligne oder _Benigne)
// Extraktion: SDC Template-based Extraction
// ============================================================

// --- Contained template: Condition (maligne Diagnose) ---
Instance: diagnose-maligne-template
InstanceOf: Condition
Usage: #inline
* id = "diagnose-maligne-template"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
// Slice: condition-ver-status (FHIR standard)
* verificationStatus.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* verificationStatus.coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sicherheit').answer.valueCoding"
* verificationStatus.coding[=].system = "http://terminology.hl7.org/CodeSystem/condition-ver-status"

// Slice: primaertumorDiagnosesicherung (oBDS 5.7)
* verificationStatus.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* verificationStatus.coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sicherung-methode').answer.valueCoding"
* verificationStatus.coding[=].system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung"

// subject ← QuestionnaireResponse.subject (gesetzt durch Aidbox beim Ausfüllen)
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%qr.subject.reference"

// code.coding (SNOMED) ← diagnose-sct
* code.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* code.coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-sct').answer.valueCoding"
* code.coding[=].system = $SCT

// ICD-10-GM: nicht per Template extrahierbar (String → Coding geht nicht), muss post-processing erfolgen

// bodySite ← diagnose-seite
* bodySite.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* bodySite.coding[=].extension.valueString = "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-seite').answer.valueCoding"
* bodySite.coding[=].system = $SCT

// assertedDate ← diagnose-datum
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
* extension[=].valueDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* extension[=].valueDateTime.extension.valueString = "%resource.item.where(linkId='lokalisation-zeit').item.where(linkId='diagnose-datum').answer.valueDate"

// category (Tumormanifestation) ← diagnose-typ
* category[+].coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* category[=].coding[=].extension.valueString = "%resource.item.where(linkId='diagnose-gruppe').item.where(linkId='diagnose-typ').answer.valueCoding"
* category[=].coding[=].system = $SCT

// --- Questionnaire ---
Instance: senologie-diagnose
InstanceOf: Questionnaire
Title: "Fragebogen: Diagnose Mamma"
Description: "Fragebogen zur Erfassung der senologischen Diagnose. Unterstützt das gesamte Spektrum von invasivem Karzinom über DCIS und B3-Läsionen bis hin zu benignen Befunden. Nutzt SDC Template-based Extraction zur Erzeugung einer Condition-Ressource."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose"
* name = "QuestDiagnose"
* title = "Fragebogen: Diagnose Mamma"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained template
* contained[+] = diagnose-maligne-template

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// SDC templateExtract → contained Condition template
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(diagnose-maligne-template)

// ============================================================
// Hidden: Patient-Referenz (vorbefüllt aus Launch-Context)
// ============================================================
* item[+].linkId = "patient-ref"
* item[=].text = "Patient"
* item[=].type = #reference
* item[=].required = true
* item[=].readOnly = true
* item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].extension[=].valueBoolean = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%patient"

// ============================================================
// Group 1: Diagnose
// ============================================================
* item[+].linkId = "diagnose-gruppe"
* item[=].text = "Diagnose Mamma"
* item[=].type = #group
* item[=].required = true

// Erstdiagnose oder Rezidiv
* item[=].item[+].linkId = "diagnose-typ"
* item[=].item[=].text = "Falltyp"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#255217005 "Ersterkrankung"
* item[=].item[=].answerOption[+].valueCoding = $SCT#246455001 "Rezidiv"
* item[=].item[=].answerOption[+].valueCoding = $SCT#14799000 "Metastasierte Erkrankung"

// Diagnose (SNOMED CT)
* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].text = "Diagnose"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[=].answerOption[+].valueCoding = $SCT#109889007 "Carcinoma in situ (DCIS)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#439401001 "B3-Läsion"
* item[=].item[=].answerOption[+].valueCoding = $SCT#254845004 "Fibroadenom"
* item[=].item[=].answerOption[+].valueCoding = $SCT#27431007 "Fibrozystische Mastopathie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#53430007 "Mastodynie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#4754008 "Gynäkomastie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#83620003 "Mastitis non-puerperalis"
* item[=].item[=].answerOption[+].valueCoding = $SCT#399123008 "Einfache Mammazyste"
* item[=].item[=].answerOption[+].valueCoding = $SCT#449837001 "Komplexe Mammazyste"
* item[=].item[=].answerOption[+].valueCoding = $SCT#718220008 "Genetische Hochrisikosituation"

// ICD-10-GM Code
* item[=].item[+].linkId = "diagnose-icd10"
* item[=].item[=].text = "ICD-10-GM Code"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ICD-10-GM Display
* item[=].item[+].linkId = "diagnose-icd10-display"
* item[=].item[=].text = "ICD-10-GM Bezeichnung"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Details B3 (enableWhen Diagnose = B3-Läsion)
* item[=].item[+].linkId = "diagnose-b3-detail"
* item[=].item[=].text = "Details B3-Läsion"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "diagnose-sct"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#439401001
* item[=].item[=].answerOption[+].valueCoding = $SCT#427785007 "ADH — Atypische duktale Hyperplasie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#860895001 "FEA — Flache epitheliale Atypie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#99571000119102 "Papillom ohne Atypie"
* item[=].item[=].answerOption[+].valueCoding = $SCT#1144917006 "Atypisches Papillom"
* item[=].item[=].answerOption[+].valueCoding = $SCT#390787006 "Radiäre Narbe / komplex sklerosierende Läsion"
* item[=].item[=].answerOption[+].valueCoding = $SCT#450697004 "LIN — ALH (Atypische lobuläre Hyperplasie)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#444739008 "LIN — klassisches LCIS"
* item[=].item[=].answerOption[+].valueCoding = $SCT#444591006 "LIN — nicht-klassisches (pleomorphes) LCIS"

// Diagnosesicherheit (verificationStatus)
* item[=].item[+].linkId = "diagnose-sicherheit"
* item[=].item[=].text = "Diagnosestatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Gesichert"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional "Verdacht"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#differential "Differentialdiagnose"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#unconfirmed "Nicht gesichert"

// Diagnosesicherung (Methode, oBDS 5.7)
* item[=].item[+].linkId = "diagnose-sicherung-methode"
* item[=].item[=].text = "Diagnosesicherung (oBDS)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#1 "klinisch"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#2 "klinische Diagnostik"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#4 "spezifische Tumor-Marker"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#5 "Zytologie"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#6 "histologische Untersuchung einer Metastase"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#8 "Zytogenetisch und/oder molekularer Test"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#9 "unbekannt"

// Freitext Sonstiges
* item[=].item[+].linkId = "diagnose-sonstiges"
* item[=].item[=].text = "Details Sonstiges"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 2: Lokalisation & Zeitpunkt
// ============================================================
* item[+].linkId = "lokalisation-zeit"
* item[=].text = "Lokalisation & Zeitpunkt"
* item[=].type = #group
* item[=].required = true

// Seite
* item[=].item[+].linkId = "diagnose-seite"
* item[=].item[=].text = "Seitenlokalisation"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#24028007 "Rechts"
* item[=].item[=].answerOption[+].valueCoding = $SCT#7771000 "Links"
* item[=].item[=].answerOption[+].valueCoding = $SCT#51440002 "Beidseits"

// Erstdiagnosedatum
* item[=].item[+].linkId = "diagnose-datum"
* item[=].item[=].text = "Erstdiagnosedatum"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// ============================================================
// Group 3: Staging (nur bei malignen Diagnosen)
// ============================================================
* item[+].linkId = "staging"
* item[=].text = "Staging"
* item[=].type = #group
* item[=].required = false

// cT
* item[=].item[+].linkId = "staging-ct"
* item[=].item[=].text = "cT"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-tnm-t-kategorie-werte"

// cN
* item[=].item[+].linkId = "staging-cn"
* item[=].item[=].text = "cN"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-tnm-n-kategorie-werte"

// cM
* item[=].item[+].linkId = "staging-cm"
* item[=].item[=].text = "cM"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-tnm-m-kategorie-werte"

// UICC Stadium
* item[=].item[+].linkId = "staging-uicc"
* item[=].item[=].text = "UICC-Stadium"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-tnm-uicc-stadium"

// Grading
* item[=].item[+].linkId = "staging-grading"
* item[=].item[=].text = "Grading"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-grading"
