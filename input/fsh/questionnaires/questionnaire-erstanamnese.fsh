// ============================================================
// Questionnaire: Erstanamnese / Anamnese
// Quellen (dotbase Codebook Sections):
//   - "Allgemeine Anamnese"
//   - "Gynäkologische Anamnese"
//   - "Familienanamnese"
// Ziele:
//   - Encounter / Observation (Allgemeine + Gynäkologische Anamnese)
//   - FamilyMemberHistory (Familienanamnese)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: senologie-erstanamnese
InstanceOf: Questionnaire
Title: "Fragebogen: Erstanamnese"
Description: "Fragebogen zur Erstanamnese (Allgemeine Anamnese, Gynäkologische Anamnese, Familienanamnese). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Observation, FamilyMemberHistory)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* name = "QuestErstanamnese"
* title = "Fragebogen: Erstanamnese"
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

// ============================================================
// Group 1: Allgemeine Anamnese
// ============================================================
* item[+].linkId = "allgemeine-anamnese"
* item[=].text = "Allgemeine Anamnese"
* item[=].type = #group
* item[=].required = true

// Datum Vorstellung
* item[=].item[+].linkId = "datum-vorstellung"
* item[=].item[=].text = "Datum der Vorstellung"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// Vorstellungsgrund
* item[=].item[+].linkId = "vorstellungsgrund"
* item[=].item[=].text = "Vorstellungsgrund"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#185387006 "New patient consultation"
* item[=].item[=].answerOption[+].valueCoding = $SCT#726007 "Pathology consultation, comprehensive, records and specimen with report"
* item[=].item[=].answerOption[+].valueCoding = $SCT#390906007 "Follow-up encounter"
* item[=].item[=].answerOption[+].valueCoding = $SCT#183620003 "Aftercare follow-up visit"

// Screeningstatus
* item[=].item[+].linkId = "screeningstatus"
* item[=].item[=].text = "Screeningstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#171176006 "Breast cancer screening"
* item[=].item[=].answerOption[+].valueCoding = $SCT#2471000175109 "Interval cancer detected"
* item[=].item[=].answerOption[+].valueCoding = $SCT#129434009 "Self-examination of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#261087003 "Incidental"

// ============================================================
// Group 2: Gynäkologische Anamnese (Observation)
// ============================================================
* item[+].linkId = "gynaekologische-anamnese"
* item[=].text = "Gynäkologische Anamnese"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation"

// Menarchealter
* item[=].item[+].linkId = "menarchealter"
* item[=].item[=].text = "Menarchealter (Jahre)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#42798-9 "Age at menarche"

// Menopausenstatus
* item[=].item[+].linkId = "menopausenstatus"
* item[=].item[=].text = "Menopausenstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#309606002 "Before menopause"
* item[=].item[=].answerOption[+].valueCoding = $SCT#307429007 "Perimenopausal"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76498008 "Postmenopausal state"

// Gravida
* item[=].item[+].linkId = "gravida"
* item[=].item[=].text = "Gravida (Anzahl Schwangerschaften)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#11996-6 "Pregnancies"

// Para
* item[=].item[+].linkId = "para"
* item[=].item[=].text = "Para (Anzahl Geburten)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#11977-6 "Parity"

// Hormonersatztherapie
* item[=].item[+].linkId = "hormonersatztherapie"
* item[=].item[=].text = "Hormonersatztherapie"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Orale Kontrazeption
* item[=].item[+].linkId = "orale-kontrazeption"
* item[=].item[=].text = "Orale Kontrazeption"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Stilldauer
* item[=].item[+].linkId = "stilldauer"
* item[=].item[=].text = "Stilldauer"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// ============================================================
// Group 3: Familienanamnese (FamilyMemberHistory)
// ============================================================
* item[+].linkId = "familienanamnese"
* item[=].text = "Familienanamnese"
* item[=].type = #group
* item[=].required = false

// Repeating group per family member
* item[=].item[+].linkId = "familienmitglied"
* item[=].item[=].text = "Familienmitglied"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].repeats = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].item[=].extension[=].valueExpression.expression = "FamilyMemberHistory"

// Verwandtschaftsgrad
* item[=].item[=].item[+].linkId = "verwandtschaftsgrad"
* item[=].item[=].item[=].text = "Verwandtschaftsgrad"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mother"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#SIS "Sister"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#DAUC "Daughter"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#GRMTH "Grandmother"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#AUNT "Aunt"

// Erkrankung
* item[=].item[=].item[+].linkId = "erkrankung"
* item[=].item[=].item[=].text = "Erkrankung"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#254837009 "Malignant neoplasm of breast"
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#363443007 "Malignant tumor of ovary"
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#74964007 "Other"

// Erkrankungsalter
* item[=].item[=].item[+].linkId = "erkrankungsalter"
* item[=].item[=].item[=].text = "Erkrankungsalter (Jahre)"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = false
