// ============================================================
// Questionnaire: Senologie Diagnose Maligne
// Quelle: dotbase Codebook Section "Diagnose Mamma"
// Ziel: Senologie_Diagnose_Maligne (Condition) über Definition-based Extraction
// ============================================================

Instance: QuestDiagnoseMaligne
InstanceOf: Questionnaire
Title: "Fragebogen: Senologie Diagnose Maligne"
Description: "Fragebogen zur strukturierten Erfassung einer Mamma-Diagnose. Nutzt SDC Definition-based Extraction mit dem Senologie_Diagnose_Maligne-Profil als Ziel."
Usage: #definition

* url = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-diagnose-maligne"
* name = "QuestDiagnoseMaligne"
* title = "Fragebogen: Senologie Diagnose Maligne"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- SDC Extraction Context ----------
// Ziel-Profil für Definition-based Extraction
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "Condition"

// Launch Context (Patient)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ---------- Items ----------

// SNOMED CT Diagnose
* item[+].linkId = "diagnose-sct"
* item[=].text = "Diagnose (SNOMED CT)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "http://fhir.bih-charite.de/kds-senologie/ValueSet/vs-senologie-diagnose-sct"
* item[=].code[+] = $SCT#439401001 "Diagnosis"

// ICD-10-GM Diagnose
* item[+].linkId = "diagnose-icd10"
* item[=].text = "ICD-10-GM Code"
* item[=].type = #string
* item[=].required = true

* item[+].linkId = "diagnose-icd10-display"
* item[=].text = "ICD-10-GM Klartext"
* item[=].type = #string
* item[=].required = false

// Freitext-Beschreibung der Diagnose
* item[+].linkId = "diagnose-text"
* item[=].text = "Klartextbeschreibung der Diagnose"
* item[=].type = #string
* item[=].required = false

// Seitenlokalisation
* item[+].linkId = "seitenlokalisation"
* item[=].text = "Seitenlokalisation"
* item[=].type = #choice
* item[=].required = true
* item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].answerOption[+].valueCoding = $SCT#63762007 "Breast structure"
* item[=].code[+] = $SCT#272741003 "Laterality"

// Feststellungsdatum
* item[+].linkId = "feststellungsdatum"
* item[=].text = "Feststellungsdatum der Diagnose"
* item[=].type = #date
* item[=].required = true

// Recorded Date
* item[+].linkId = "recorded-date"
* item[=].text = "Datum der Dokumentation"
* item[=].type = #date
* item[=].required = false

// Diagnosesicherung
* item[+].linkId = "diagnosesicherung"
* item[=].text = "Diagnosesicherung (Primärtumor)"
* item[=].type = #choice
* item[=].required = true
* item[=].answerValueSet = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/ValueSet/mii-vs-onko-primaertumor-diagnosesicherung"

// Stadium (Freitext, passt zu stage.summary.text im Profil)
* item[+].linkId = "stadium-summary"
* item[=].text = "UICC-Stadium (Freitext, z.B. \"UICC IA (cT1c cN0 cM0)\")"
* item[=].type = #string
* item[=].required = false

// Metastasierung (Slice stage:metastasis)
* item[+].linkId = "metastasen-summary"
* item[=].text = "Metastasierung (Freitext, z.B. \"cM0\")"
* item[=].type = #string
* item[=].required = false

// Clinical Status
* item[+].linkId = "clinical-status"
* item[=].text = "Klinischer Status"
* item[=].type = #choice
* item[=].required = false
* item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#recurrence "Recurrence"
* item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#remission "Remission"
* item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#resolved "Resolved"

// Onset
* item[+].linkId = "onset"
* item[=].text = "Beginn der Erkrankung"
* item[=].type = #date
* item[=].required = false
