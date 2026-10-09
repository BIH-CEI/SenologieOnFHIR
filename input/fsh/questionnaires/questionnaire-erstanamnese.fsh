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
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-gynaekologische-anamnese"
* status = #final
* code = $LOINC#89221-6 "Gynecology History and physical note"
* code.text = "Gynäkologische Anamnese"
* insert Translation(code.text, en, [[Gynaecological History]])
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// --- Contained template: Observation (Raucherstatus) ---
Instance: anamnese-raucher-template
InstanceOf: Observation
Usage: #inline
* id = "anamnese-raucher-template"
* meta.profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code.coding[+] = $LOINC#72166-2 "Tobacco smoking status"
* code.coding[+] = $SCT#77176002 "Smoker"
// Der Wert fehlte in der Vorlage: die Antwort wurde nicht extrahiert, obwohl
// ISiKRaucherStatus valueCodeableConcept verlangt (1..1).
* valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='raucherstatus').item.where(linkId='raucherstatus-wert').answer.valueCoding"
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// --- Contained template: FamilyMemberHistory ---
Instance: anamnese-familie-template
InstanceOf: FamilyMemberHistory
Usage: #inline
* id = "anamnese-familie-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-familienanamnese"
* status = #completed
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#FAMMEMB "family member"
* patient.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* patient.reference.extension.valueString = "%resource.subject.reference"

// --- Questionnaire ---
Instance: senologie-erstanamnese
InstanceOf: Questionnaire
Title: "Fragebogen: Erstanamnese"
Description: "Fragebogen zur Erstanamnese mit Allgemeiner Anamnese, Gynäkologischer Anamnese, Raucherstatus und Familienanamnese. Nutzt SDC Template-based Extraction."
Usage: #definition
* insert SenoCRMIQuestionnaire

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* name = "QuestErstanamnese"
* title = "Fragebogen: Erstanamnese"
* insert Translation(title, en, [[Form: Initial Anamnesis]])
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
* insert Translation(item[=].text, en, [[General Medical History]])
* item[=].type = #group
* item[=].required = true

* item[=].item[+].linkId = "datum-vorstellung"
* item[=].item[=].text = "Datum der Vorstellung"
* insert Translation(item[=].item[=].text, en, [[Date of Presentation]])
* item[=].item[=].type = #date
* item[=].item[=].required = true

* item[=].item[+].linkId = "vorstellungsgrund"
* item[=].item[=].text = "Vorstellungsgrund"
* insert Translation(item[=].item[=].text, en, [[Reason for Presentation]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = true
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-vorstellungsgrund"

* item[=].item[+].linkId = "screeningstatus"
* item[=].item[=].text = "Screeningstatus"
* insert Translation(item[=].item[=].text, en, [[Screening Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-detektion-modus"

// Größe (cm)
* item[=].item[+].linkId = "groesse"
* item[=].item[=].text = "Körpergröße (cm)"
* insert Translation(item[=].item[=].text, en, [[Height (cm)]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#8302-2 "Body height"

// Gewicht (kg)
* item[=].item[+].linkId = "gewicht"
* item[=].item[=].text = "Körpergewicht (kg)"
* insert Translation(item[=].item[=].text, en, [[Weight (kg)]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#29463-7 "Body weight"

// ECOG
* item[=].item[+].linkId = "ecog"
* item[=].item[=].text = "ECOG Leistungsstatus"
* insert Translation(item[=].item[=].text, en, [[ECOG Performance Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#89247-1 "ECOG Performance Status"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ecog"

// ============================================================
// Group 2: Raucherstatus → Observation (ISiK-kompatibel)
// ============================================================
* item[+].linkId = "raucherstatus"
* item[=].text = "Raucherstatus"
* insert Translation(item[=].text, en, [[Smoking Status]])
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → Raucherstatus Observation
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(anamnese-raucher-template)

* item[=].item[+].linkId = "raucherstatus-wert"
* item[=].item[=].text = "Raucherstatus"
* insert Translation(item[=].item[=].text, en, [[Smoking Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#72166-2 "Tobacco smoking status"
* item[=].item[=].definition = "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus#Observation.valueCodeableConcept"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-raucherstatus"

// ============================================================
// Group 3: Gynäkologische Anamnese → Observation
// ============================================================
* item[+].linkId = "gynaekologische-anamnese"
* item[=].text = "Gynäkologische Anamnese"
* insert Translation(item[=].text, en, [[Gynaecological History]])
* item[=].type = #group
* item[=].required = false

// SDC templateExtract → Gynäk. Anamnese Observation
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(anamnese-gynaek-template)

* item[=].item[+].linkId = "menarchealter"
* item[=].item[=].text = "Menarchealter (Jahre)"
* insert Translation(item[=].item[=].text, en, [[Menarche Age (Years)]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#42798-9 "Age at menarche"

* item[=].item[+].linkId = "menopausenstatus"
* item[=].item[=].text = "Menopausenstatus"
* insert Translation(item[=].item[=].text, en, [[Menopausal Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#42802-9 "Age at menopause"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-menopausenstatus-erweitert"

* item[=].item[+].linkId = "gravida"
* item[=].item[=].text = "Gravida (Schwangerschaften)"
* insert Translation(item[=].item[=].text, en, [[Gravida (Pregnancies)]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#11996-6 "Pregnancies"

* item[=].item[+].linkId = "para"
* item[=].item[=].text = "Para (Geburten)"
* insert Translation(item[=].item[=].text, en, [[Parity (Deliveries)]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false
* item[=].item[=].code[+] = $LOINC#11977-6 "Parity"

* item[=].item[+].linkId = "hormonersatztherapie"
* item[=].item[=].text = "Hormonersatztherapie (HRT)"
* insert Translation(item[=].item[=].text, en, [[Hormone Replacement Therapy (HRT)]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].code[+] = $SCT#266717002 "Hormone replacement therapy"
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ja-nein"

* item[=].item[+].linkId = "orale-kontrazeption"
* item[=].item[=].text = "Hormonelle Verhütung"
* insert Translation(item[=].item[=].text, en, [[Hormonal Contraception]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-kontrazeption-status"

* item[=].item[+].linkId = "stilldauer"
* item[=].item[=].text = "Stilldauer (Monate)"
* insert Translation(item[=].item[=].text, en, [[Breastfeeding Duration (Months)]])
* item[=].item[=].type = #integer
* item[=].item[=].required = false

// ============================================================
// Group 4: Familienanamnese → FamilyMemberHistory (repeating)
// ============================================================
* item[+].linkId = "familienanamnese"
* item[=].text = "Familienanamnese"
* insert Translation(item[=].text, en, [[Family History]])
* item[=].type = #group
* item[=].required = false

* item[=].item[+].linkId = "familienmitglied"
* item[=].item[=].text = "Familienmitglied"
* insert Translation(item[=].item[=].text, en, [[Family Member]])
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].repeats = true

// SDC templateExtract → FamilyMemberHistory (pro Eintrag)
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].item[=].extension[=].extension[+].url = "template"
* item[=].item[=].extension[=].extension[=].valueReference = Reference(anamnese-familie-template)

* item[=].item[=].item[+].linkId = "verwandtschaftsgrad"
* item[=].item[=].item[=].text = "Verwandtschaftsgrad"
* insert Translation(item[=].item[=].item[=].text, en, [[Degree of Relationship]])
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-verwandtschaftsgrad"

* item[=].item[=].item[+].linkId = "erkrankung"
* item[=].item[=].item[=].text = "Erkrankung"
* insert Translation(item[=].item[=].item[=].text, en, [[Condition]])
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-familien-erkrankung"

* item[=].item[=].item[+].linkId = "erkrankungsalter"
* item[=].item[=].item[=].text = "Erkrankungsalter (Jahre)"
* insert Translation(item[=].item[=].item[=].text, en, [[Age at Diagnosis (Years)]])
* item[=].item[=].item[=].type = #integer
* item[=].item[=].item[=].required = false
