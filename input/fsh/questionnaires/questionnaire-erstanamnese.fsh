// ============================================================
// Questionnaire: Erstanamnese / Anamnese
// Ziele:
//   - Observation (Gynäkologische Anamnese)
//   - Observation (Raucherstatus)
//   - FamilyMemberHistory (pro Familienmitglied)
// Extraktion: SDC Template-based Extraction
// ============================================================

// --- Contained template: Observation (Gynäkologische Anamnese) ---
Instance: anamnese-gynaek-template
InstanceOf: Observation
Usage: #inline
* id = "anamnese-gynaek-template"
* status = #final
* code = $LOINC#89221-6 "Gynecology History and physical note"
* code.text = "Gynäkologische Anamnese"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: Observation (Raucherstatus) ---
Instance: anamnese-raucher-template
InstanceOf: Observation
Usage: #inline
* id = "anamnese-raucher-template"
* status = #final
* code.coding[+] = $LOINC#72166-2 "Tobacco smoking status"
* code.coding[+] = $SCT#77176002 "Smoker"
* subject.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.extension.valueString = "%patient"

// --- Contained template: FamilyMemberHistory ---
Instance: anamnese-familie-template
InstanceOf: FamilyMemberHistory
Usage: #inline
* id = "anamnese-familie-template"
* status = #completed
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#FAMMEMB "family member"
* patient.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.extension.valueString = "%patient"

// --- Questionnaire ---
Instance: senologie-erstanamnese
InstanceOf: Questionnaire
Title: "Fragebogen: Erstanamnese"
Description: "Fragebogen zur Erstanamnese mit Allgemeiner Anamnese, Gynäkologischer Anamnese, Raucherstatus und Familienanamnese. Nutzt SDC Template-based Extraction."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* name = "QuestErstanamnese"
* title = "Fragebogen: Erstanamnese"
* status = #draft
* insert Version
* experimental = true
* subjectType = #Patient

// Contained templates
* contained[+] = anamnese-gynaek-template
* contained[+] = anamnese-raucher-template
* contained[+] = anamnese-familie-template

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Group 1: Allgemeine Anamnese
// Keine Extraction — Kontext und Vorstellungsgrund.
// ============================================================
* item[+].linkId = "allgemeine-anamnese"
* item[=].text = "Allgemeine Anamnese"
* item[=].type = #group
* item[=].required = true

* item[=].item[+].linkId = "datum-vorstellung"
* item[=].item[=].text = "Datum der Vorstellung"
* item[=].item[=].type = #date
* item[=].item[=].required = true

* item[=].item[+].linkId = "vorstellungsgrund"
* item[=].item[=].text = "Vorstellungsgrund"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].answerOption[+].valueCoding = $SCT#185387006 "Erstvorstellung"
* item[=].item[=].answerOption[+].valueCoding = $SCT#726007 "Zweitmeinung"
* item[=].item[=].answerOption[+].valueCoding = $SCT#390906007 "Nachsorge"
* item[=].item[=].answerOption[+].valueCoding = $SCT#183620003 "Wiedervorstellung"

* item[=].item[+].linkId = "screeningstatus"
* item[=].item[=].text = "Screeningstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#268547008 "Screening-detektiert"
* item[=].item[=].answerOption[+].valueCoding = $SCT#444589003 "Intervallkarzinom"
* item[=].item[=].answerOption[+].valueCoding = $SCT#129434009 "Selbstuntersuchung"
* item[=].item[=].answerOption[+].valueCoding = $SCT#261087003 "Zufallsbefund"

// Größe (cm)
* item[=].item[+].linkId = "groesse"
* item[=].item[=].text = "Körpergröße (cm)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#8302-2 "Body height"

// Gewicht (kg)
* item[=].item[+].linkId = "gewicht"
* item[=].item[=].text = "Körpergewicht (kg)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#29463-7 "Body weight"

// ECOG
* item[=].item[+].linkId = "ecog"
* item[=].item[=].text = "ECOG Leistungsstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#89247-1 "ECOG Performance Status"
* item[=].item[=].answerOption[+].valueString = "0 — Normale Aktivität"
* item[=].item[=].answerOption[+].valueString = "1 — Einschränkung bei Anstrengung"
* item[=].item[=].answerOption[+].valueString = "2 — Gehfähig, nicht arbeitsfähig"
* item[=].item[=].answerOption[+].valueString = "3 — Begrenzte Selbstversorgung"
* item[=].item[=].answerOption[+].valueString = "4 — Völlig pflegebedürftig"

// ============================================================
// Group 2: Raucherstatus → Observation (ISiK-kompatibel)
// ============================================================
* item[+].linkId = "raucherstatus"
* item[=].text = "Raucherstatus"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → Raucherstatus Observation
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(anamnese-raucher-template)

* item[=].item[+].linkId = "raucherstatus-wert"
* item[=].item[=].text = "Raucherstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $LOINC#LA18978-9 "Nie geraucht"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#LA15920-4 "Ehemaliger Raucher"
* item[=].item[=].answerOption[+].valueCoding = $LOINC#LA18976-3 "Aktueller Raucher"

// ============================================================
// Group 3: Gynäkologische Anamnese → Observation
// ============================================================
* item[+].linkId = "gynaekologische-anamnese"
* item[=].text = "Gynäkologische Anamnese"
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → Gynäk. Anamnese Observation
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(anamnese-gynaek-template)

* item[=].item[+].linkId = "menarchealter"
* item[=].item[=].text = "Menarchealter (Jahre)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#42798-9 "Age at menarche"

* item[=].item[+].linkId = "menopausenstatus"
* item[=].item[=].text = "Menopausenstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueCoding = $SCT#309606002 "Prämenopausal"
* item[=].item[=].answerOption[+].valueCoding = $SCT#161541000119104 "Perimenopausal"
* item[=].item[=].answerOption[+].valueCoding = $SCT#76498008 "Postmenopausal"

* item[=].item[+].linkId = "gravida"
* item[=].item[=].text = "Gravida (Schwangerschaften)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#11996-6 "Pregnancies"

* item[=].item[+].linkId = "para"
* item[=].item[=].text = "Para (Geburten)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#11977-6 "Parity"

* item[=].item[+].linkId = "hormonersatztherapie"
* item[=].item[=].text = "Hormonersatztherapie (HRT)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#266717002 "Hormone replacement therapy"
* item[=].item[=].answerOption[+].valueCoding = $SCT#373066001 "Ja"
* item[=].item[=].answerOption[+].valueCoding = $SCT#373067005 "Nein"

* item[=].item[+].linkId = "orale-kontrazeption"
* item[=].item[=].text = "Hormonelle Verhütung"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerOption[+].valueString = "Nie"
* item[=].item[=].answerOption[+].valueString = "Früher"
* item[=].item[=].answerOption[+].valueString = "Aktuell"

* item[=].item[+].linkId = "stilldauer"
* item[=].item[=].text = "Stilldauer (Monate)"
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 4: Familienanamnese → FamilyMemberHistory (repeating)
// ============================================================
* item[+].linkId = "familienanamnese"
* item[=].text = "Familienanamnese"
* item[=].type = #group
* item[=].required = false

* item[=].item[+].linkId = "familienmitglied"
* item[=].item[=].text = "Familienmitglied"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].repeats = true

// SDC templateExtract → FamilyMemberHistory (pro Eintrag)
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].item[=].extension[=].extension[+].url = "template"
* item[=].item[=].extension[=].extension[=].valueReference = Reference(anamnese-familie-template)

* item[=].item[=].item[+].linkId = "verwandtschaftsgrad"
* item[=].item[=].item[=].text = "Verwandtschaftsgrad"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mutter"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#SIS "Schwester"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#DAUC "Tochter"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#GRMTH "Großmutter"
* item[=].item[=].item[=].answerOption[+].valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#AUNT "Tante"

* item[=].item[=].item[+].linkId = "erkrankung"
* item[=].item[=].item[=].text = "Erkrankung"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#363443007 "Ovarialkarzinom"
* item[=].item[=].item[=].answerOption[+].valueCoding = $SCT#74964007 "Sonstiges"

* item[=].item[=].item[+].linkId = "erkrankungsalter"
* item[=].item[=].item[=].text = "Erkrankungsalter (Jahre)"
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = false
