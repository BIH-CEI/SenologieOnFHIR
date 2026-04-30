// ============================================================
// Questionnaire: Erstanamnese
// Quelle: dotbase Codebook Sections
//   - "Allgemeine Anamnese" (Vorstellungsgrund, Diagnosetyp)
//   - "Gynäkologische Anamnese" (Menarche, Menopause, HRT)
// Ziel-Ressourcen:
//   - Senologie_Diagnose_Maligne (Condition) — Erstdiagnose oder Rezidiv
//   - Senologie_Gynaekologische_Anamnese (Observation)
// Extraction: SDC Template-based Extraction
//   Template: input/resources/Questionnaire-senologie-erstanamnese-template.json
// ============================================================

Instance: senologie-erstanamnese
InstanceOf: Questionnaire
Title: "Fragebogen: Erstanamnese"
Description: "Fragebogen zur strukturierten Erstanamnese in der Senologie. Umfasst Vorstellungsgrund, Diagnosetyp (Erstdiagnose/Rezidiv), gynäkologische Anamnese. Nutzt SDC Template-based Extraction."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* name = "QuestErstanamnese"
* title = "Fragebogen: Erstanamnese"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- SDC Launch Context ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ========== Group 1: Allgemeine Anamnese ==========
* item[+].linkId = "allgemeine-anamnese"
* item[=].text = "Allgemeine Anamnese"
* item[=].type = #group

// Vorstellungsgrund
* item[=].item[+].linkId = "vorstellungsgrund"
* item[=].item[=].text = "Vorstellungsgrund"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#185387006 "New patient consultation (procedure)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#185389009 "Follow-up visit (procedure)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#281036007 "Second opinion (procedure)"

// Diagnosetyp (Erstdiagnose vs. Rezidiv)
* item[=].item[+].linkId = "diagnose-typ"
* item[=].item[=].text = "Diagnosetyp"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#63161005 "Principal diagnosis (contextual qualifier) (qualifier value)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#255227004 "Recurrent (qualifier value)"

// Erstdiagnose-Datum (nur bei Rezidiv — Datum der ursprünglichen Erstdiagnose)
* item[=].item[+].linkId = "erstdiagnose-datum"
* item[=].item[=].text = "Datum der Erstdiagnose"
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].enableWhen[+].question = "diagnose-typ"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#255227004 "Recurrent (qualifier value)"

// Rezidivtyp (nur bei Rezidiv)
* item[=].item[+].linkId = "rezidivtyp"
* item[=].item[=].text = "Rezidivtyp"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].enableWhen[+].question = "diagnose-typ"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#255227004 "Recurrent (qualifier value)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#255470001 "Local recurrence of malignant tumor (disorder)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#277751004 "Regional recurrence of malignant tumor (disorder)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#260874000 "Distant recurrence of malignant tumor (disorder)"

// Bezug zur Ersterkrankung (nur bei Rezidiv)
* item[=].item[+].linkId = "bezug-ersterkrankung"
* item[=].item[=].text = "Bezug zur Ersterkrankung"
* item[=].item[=].type = #reference
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "diagnose-typ"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#255227004 "Recurrent (qualifier value)"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&code=254837009&clinical-status=remission,inactive"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].item[=].extension[=].extension[+].url = "path"
* item[=].item[=].extension[=].extension[=].valueString = "onset"
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].item[=].extension[=].extension[+].url = "path"
* item[=].item[=].extension[=].extension[=].valueString = "code.text"

// Anamnese-Datum
* item[=].item[+].linkId = "anamnese-datum"
* item[=].item[=].text = "Datum der Anamnese"
* item[=].item[=].type = #date
* item[=].item[=].required = true

// ========== Group 2: Gynäkologische Anamnese ==========
* item[+].linkId = "gynaekologische-anamnese"
* item[=].text = "Gynäkologische Anamnese"
* item[=].type = #group

// Menarche-Alter
* item[=].item[+].linkId = "menarche-alter"
* item[=].item[=].text = "Alter bei Menarche (Jahre)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity.value"

// Menopausenstatus
* item[=].item[+].linkId = "menopausenstatus"
* item[=].item[=].text = "Menopausenstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#309606002 "Before menopause (finding)"
* item[=].item[=].answerOption[+].valueCoding = $SCT#307429007 "After menopause (finding)"

// Schwangerschaften
* item[=].item[+].linkId = "schwangerschaften"
* item[=].item[=].text = "Anzahl Schwangerschaften (Gravida)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueQuantity.value"

// Hormonersatztherapie
* item[=].item[+].linkId = "hrt"
* item[=].item[=].text = "Hormonersatztherapie (HRT)"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueBoolean"
