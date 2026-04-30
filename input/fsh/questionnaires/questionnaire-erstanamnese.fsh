// ============================================================
// Questionnaire: Erstanamnese (Initial History)
// Quellen (dotbase Codebook Sections):
//   - "Diagnose"
//   - "Gynäkologische Anamnese"
//   - "Familienanamnese"
// Ziele:
//   - Senologie_Diagnose_Maligne (Condition)
//   - Senologie_Gynaekologische_Anamnese (Observation)
//   - Senologie_Familienanamnese (FamilyMemberHistory)
// Extraktion: SDC Template-based Extraction mit contained
//   Templates fuer jede Zielressource. Items verwenden
//   definition-URLs auf die jeweiligen Senologie-Profile.
// ============================================================

// --- Contained template: Condition (Senologie_Diagnose_Maligne) ---
Instance: erstanamnese-diagnose-template
InstanceOf: Condition
Usage: #inline

* id = "erstanamnese-diagnose-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* subject.reference = "placeholder"

// --- Contained template: Observation (Senologie_Gynaekologische_Anamnese) ---
Instance: erstanamnese-gyn-template
InstanceOf: Observation
Usage: #inline

* id = "erstanamnese-gyn-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese"
* status = #final
* code = $LOINC#89221-6 "Gynecology History and physical note"
* subject.reference = "placeholder"

// --- Contained template: FamilyMemberHistory (Senologie_Familienanamnese) ---
Instance: erstanamnese-famhx-template
InstanceOf: FamilyMemberHistory
Usage: #inline

* id = "erstanamnese-famhx-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese"
* status = #completed
* patient.reference = "placeholder"
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#FAMMEMB "family member"

// --- Questionnaire ---
Instance: senologie-erstanamnese
InstanceOf: Questionnaire
Title: "Fragebogen: Erstanamnese"
Description: "Fragebogen zur Erstanamnese (Diagnose, gynaekologische Anamnese, Familienanamnese). Nutzt SDC Template-based Extraction mit drei contained Templates: Condition (Senologie_Diagnose_Maligne), Observation (Senologie_Gynaekologische_Anamnese), FamilyMemberHistory (Senologie_Familienanamnese)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* name = "QuestErstanamnese"
* title = "Fragebogen: Erstanamnese"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Contained templates
* contained[+] = erstanamnese-diagnose-template
* contained[+] = erstanamnese-gyn-template
* contained[+] = erstanamnese-famhx-template

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Group 1: Diagnose (Condition)
// ============================================================
* item[+].linkId = "diagnose"
* item[=].text = "Diagnose"
* item[=].type = #group
* item[=].required = true

// SDC templateExtract -> contained Condition template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].valueReference = Reference(erstanamnese-diagnose-template)

// SNOMED-Diagnose
* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].text = "Diagnose (SNOMED CT)"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.code.coding:sct"
* item[=].item[=].answerOption[+].valueCoding = $SCT#254837009 "Malignant neoplasm of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#109886000 "Overlapping malignant neoplasm of breast"
* item[=].item[=].answerOption[+].valueCoding = $SCT#93796005 "Ductal carcinoma in situ of breast"

// ICD-10-GM Code
* item[=].item[+].linkId = "diagnose-icd10"
* item[=].item[=].text = "ICD-10-GM Code"
* item[=].item[=].type = #string
* item[=].item[=].required = true
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.code.coding:icd10-gm.code"

// ICD-10 Display
* item[=].item[+].linkId = "diagnose-icd10-display"
* item[=].item[=].text = "ICD-10-GM Bezeichnung"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.code.coding:icd10-gm.display"

// Freitext-Diagnose
* item[=].item[+].linkId = "diagnose-text"
* item[=].item[=].text = "Diagnosetext (Freitext)"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.code.text"

// Seitenlokalisation
* item[=].item[+].linkId = "seitenlokalisation"
* item[=].item[=].text = "Seitenlokalisation"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.bodySite"
* item[=].item[=].answerOption[+].valueCoding = $SCT#80248007 "Left breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#73056007 "Right breast structure"
* item[=].item[=].answerOption[+].valueCoding = $SCT#63762007 "Both breasts"

// Feststellungsdatum
* item[=].item[+].linkId = "feststellungsdatum"
* item[=].item[=].text = "Feststellungsdatum (Erstdiagnose)"
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.extension:Feststellungsdatum.valueDateTime"

// Recorded Date
* item[=].item[+].linkId = "recorded-date"
* item[=].item[=].text = "Dokumentationsdatum"
* item[=].item[=].type = #date
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.recordedDate"

// Diagnosesicherung
* item[=].item[+].linkId = "diagnosesicherung"
* item[=].item[=].text = "Diagnosesicherung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.verificationStatus.coding"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primaertumors"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#6 "Histologie einer Metastase"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#5 "Zytologie"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#4 "spezifische Tumormarker"

// Stadium
* item[=].item[+].linkId = "stadium-summary"
* item[=].item[=].text = "Klinisches Stadium (Zusammenfassung)"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.stage.summary.text"

// Metastasen
* item[=].item[+].linkId = "metastasen-summary"
* item[=].item[=].text = "Metastasierungsstatus"
* item[=].item[=].type = #string
* item[=].item[=].required = false

// Clinical Status
* item[=].item[+].linkId = "clinical-status"
* item[=].item[=].text = "Klinischer Status"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.clinicalStatus"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#recurrence "Recurrence"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#remission "Remission"

// Onset
* item[=].item[+].linkId = "onset"
* item[=].item[=].text = "Symptombeginn"
* item[=].item[=].type = #date
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-diagnose-maligne#Condition.onsetDateTime"

// ============================================================
// Group 2: Gynaekologische Anamnese (Observation)
// ============================================================
* item[+].linkId = "gyn-anamnese"
* item[=].text = "Gynaekologische Anamnese"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract -> contained Observation template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].valueReference = Reference(erstanamnese-gyn-template)

// Datum der Anamneseerhebung
* item[=].item[+].linkId = "gyn-datum"
* item[=].item[=].text = "Datum der Anamneseerhebung"
* item[=].item[=].type = #date
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.effectiveDateTime"

// --- Komponente: Menarche ---
* item[=].item[+].linkId = "gyn-menarche"
* item[=].item[=].text = "Menarche"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:menarche"

* item[=].item[=].item[+].linkId = "gyn-menarche-alter"
* item[=].item[=].item[=].text = "Alter bei Menarche (Jahre)"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:menarche.valueQuantity.value"

// --- Komponente: Menopause ---
* item[=].item[+].linkId = "gyn-menopause"
* item[=].item[=].text = "Menopause"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:menopause"

* item[=].item[=].item[+].linkId = "gyn-menopause-alter"
* item[=].item[=].item[=].text = "Alter bei Menopause (Jahre)"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:menopause.valueQuantity.value"

// --- Komponente: Schwangerschaften ---
* item[=].item[+].linkId = "gyn-gravida"
* item[=].item[=].text = "Schwangerschaften"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:schwangerschaften"

* item[=].item[=].item[+].linkId = "gyn-gravida-anzahl"
* item[=].item[=].item[=].text = "Anzahl Schwangerschaften (Gravida)"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = false
* item[=].item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:schwangerschaften.valueQuantity.value"

// --- Komponente: HRT ---
* item[=].item[+].linkId = "gyn-hrt"
* item[=].item[=].text = "Hormonersatztherapie (HRT)"
* item[=].item[=].type = #string
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese#Observation.component:hormonersatztherapie.valueCodeableConcept.text"

// ============================================================
// Group 3: Familienanamnese (FamilyMemberHistory, repeating)
// ============================================================
* item[+].linkId = "familienanamnese"
* item[=].text = "Familienanamnese"
* item[=].type = #group
* item[=].required = false
* item[=].repeats = true

// SDC templateExtract -> contained FamilyMemberHistory template
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].valueReference = Reference(erstanamnese-famhx-template)

// Verwandtschaftsgrad
* item[=].item[+].linkId = "fam-verwandtschaft"
* item[=].item[=].text = "Verwandtschaftsgrad"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese#FamilyMemberHistory.relationship"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mutter"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#FTH "Vater"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#SIS "Schwester"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#DAUC "Tochter"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MGRMTH "Grossmutter muetterlicherseits"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#PGRMTH "Grossmutter vaeterlicherseits"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MAUNT "Tante muetterlicherseits"
* item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#PAUNT "Tante vaeterlicherseits"

// Erkrankung
* item[=].item[+].linkId = "fam-erkrankung"
* item[=].item[=].text = "Erkrankung"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese#FamilyMemberHistory.condition.code"
* item[=].item[=].answerOption[+].valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[=].answerOption[+].valueCoding = $SCT#363443007 "Ovarialkarzinom"

// Erkrankungsalter
* item[=].item[+].linkId = "fam-alter"
* item[=].item[=].text = "Erkrankungsalter (Jahre)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese#FamilyMemberHistory.condition.onsetAge.value"

// Anmerkungen
* item[=].item[+].linkId = "fam-note"
* item[=].item[=].text = "Anmerkungen"
* item[=].item[=].type = #text
* item[=].item[=].required = false
* item[=].item[=].definition = "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese#FamilyMemberHistory.note.text"
