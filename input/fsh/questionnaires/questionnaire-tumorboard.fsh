// ============================================================
// Questionnaire: Tumorboard Empfehlung
// Quelle: dotbase Codebook Section
//   "Brustzentrum Protokoll der interdisziplinaeren Tumorkonferenz /
//    Empfehlung der interdisziplinaeren Tumorkonferenz"
// Ziel: Senologie_Tumorboard_Empfehlung (CarePlan)
// Extraction: SDC Template-based Extraction
//
// Pro Therapie-Empfehlung wird ein Status (empfohlen / bedingt / nicht /
// nicht-diskutiert) erhoben + optionale Begruendung. Beides landet auf
// CarePlan.activity[X]:
//   - status (code) -> activity.detail.statusReason (CodeableConcept)
//   - begruendung   -> activity.detail.description (string)
// ============================================================

Instance: senologie-tumorboard
InstanceOf: Questionnaire
Title: "Fragebogen: Tumorboard Empfehlung"
Description: "Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinaeren Tumorkonferenz. Pro Therapie-Empfehlung mit Beschluss-Status (empfohlen/bedingt/nicht/nicht diskutiert) und Begruendung. SDC Template-based Extraction zu CarePlan."
Usage: #definition
* insert SenoCRMIQuestionnaire

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard"
* name = "QuestTumorboard"
* title = "Fragebogen: Tumorboard Empfehlung"
* insert Translation(title, en, [[Form: Tumour Board Recommendation]])
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// ---------- Contained CarePlan (Extraction Template) ----------
* contained = careplan-template

// ---------- SDC Extensions ----------
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// Launch Context: Diagnose (Condition als Anker fuer Pre-Population)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #diagnosis
* extension[=].extension[=].valueCoding.display = "Diagnose (Anker-Condition)"
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Condition

* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(careplan-template)

// ---------- Items ----------

// Bezugsdiagnose
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose (Seite)"
* insert Translation(item[=].text, en, [[Reference Diagnosis (Laterality)]])
* item[=].type = #reference
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-candidateExpression"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Condition?patient={{%patient.id}}&code=254837009&clinical-status=active"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "code.coding.where(system='http://fhir.de/CodeSystem/bfarm/icd-10-gm').first().code"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "ICD-10"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-choiceColumn"
* item[=].extension[=].extension[+].url = "path"
* item[=].extension[=].extension[=].valueString = "bodySite.coding.first().display"
* item[=].extension[=].extension[+].url = "label"
* item[=].extension[=].extension[=].valueString = "Seite"
* item[=].extension[=].extension[+].url = "forDisplay"
* item[=].extension[=].extension[=].valueBoolean = true

* item[+].linkId = "tumorboard-datum"
* item[=].text = "Datum des Tumorboards"
* insert Translation(item[=].text, en, [[Tumour Board Date]])
* item[=].type = #date
* item[=].required = true

* item[+].linkId = "tumorboard-typ"
* item[=].text = "Art der Tumorkonferenz"
* insert Translation(item[=].text, en, [[Type of Tumour Board]])
* item[=].type = #choice
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].extension[=].valueCode = #optionsOnly
* item[=].required = true
// Die vier Codes des MII-Onko-ValueSets mii-vs-onko-therapieplanung-typ, als
// answerOption ausgeschrieben (kein $expand eines fremden ValueSets noetig).
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ#praeth "prätherapeutische Tumorkonferenz (Festlegung der Therapiestrategie)"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ#postop "postoperative Tumorkonferenz (Planung der postoperativen Therapie, z. B. zur Frage adjuvante Therapie)"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ#postth "posttherapeutische Tumorkonferenz (manche Tumore werden nicht operiert)"
* item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ#ther "Therapieplanung ohne Tumorkonferenz"

* item[+].linkId = "tumorboard-titel"
* item[=].text = "Titel der Empfehlung"
* insert Translation(item[=].text, en, [[Recommendation Title]])
* item[=].type = #string
* item[=].required = false

* item[+].linkId = "tumorboard-beschreibung"
* item[=].text = "Zusammenfassung der Empfehlung"
* insert Translation(item[=].text, en, [[Recommendation Summary]])
* item[=].type = #text
* item[=].required = false

// --- Therapie-Empfehlungen: pro Bereich Status + Begruendung ---
// RuleSet-aehnliches Macro waere schoener, aber FSH unterstuetzt Inline-Groups gut

* item[+].linkId = "empfehlung-op-group"
* item[=].text = "Operative Therapie"
* insert Translation(item[=].text, en, [[Surgical Therapy]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-op-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
// Kodierte Mehrfachauswahl der empfohlenen Optionen; jede Auswahl wird eine eigene CarePlan.activity
* item[=].item[+].linkId = "empfehlung-op-optionen"
* item[=].item[=].text = "Empfohlene Verfahren"
* insert Translation(item[=].item[=].text, en, [[Recommended procedures]])
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "empfehlung-op-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen
* item[=].item[=].enableWhen[+].question = "empfehlung-op-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen
* item[=].item[=].enableBehavior = #any
* item[=].item[=].answerOption[+].valueCoding = $SCT#392021009 "Brusterhaltende Operation (BET)"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Lumpectomy of breast]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#172043006 "Mastektomie"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Simple mastectomy]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#428564008 "Hautsparende Mastektomie"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Skin sparing mastectomy]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#1380209001 "Nipple-sparing Mastektomie"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Nipple preserving subcutaneous mastectomy]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#406505007 "Modifiziert radikale Mastektomie"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Modified radical mastectomy]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#395165008 "Nachresektion"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Re-excision of breast for clearance of tumour margins]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#396487001 "Sentinel-Lymphknoten-Biopsie"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Sentinel lymph node biopsy]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#1396322000 "Targeted Axillary Dissection (TAD)"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Targeted axillary dissection]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#79544006 "Axilladissektion"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Complete axillary lymphadenectomy]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#302343007 "Rekonstruktion mit Implantat"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Insertion of prosthesis for breast]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#303445008 "Rekonstruktion mit Eigengewebe (Lappen)"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Reconstruction of breast with flap]])
* item[=].item[+].linkId = "empfehlung-op-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-strahlentherapie-group"
* item[=].text = "Strahlentherapie"
* insert Translation(item[=].text, en, [[Radiotherapy]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-strahlentherapie-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
// Kodierte Mehrfachauswahl der empfohlenen Optionen; jede Auswahl wird eine eigene CarePlan.activity
* item[=].item[+].linkId = "empfehlung-strahlentherapie-optionen"
* item[=].item[=].text = "Zielvolumen"
* insert Translation(item[=].item[=].text, en, [[Target volume]])
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "empfehlung-strahlentherapie-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen
* item[=].item[=].enableWhen[+].question = "empfehlung-strahlentherapie-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen
* item[=].item[=].enableBehavior = #any
* item[=].item[=].answerOption[+].valueCoding = $SCT#428923005 "Ganze Brust"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Radiotherapy to breast]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#428624002 "Brustwand"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Radiotherapy to chest wall]])
* item[=].item[=].answerOption[+].valueCoding = $SCT#429579007 "Axilla"
* insert Translation(item[=].item[=].answerOption[=].valueCoding.display, en, [[Radiotherapy to axilla]])
* item[=].item[+].linkId = "empfehlung-strahlentherapie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-endokrin-group"
* item[=].text = "Endokrine Therapie"
* insert Translation(item[=].text, en, [[Endocrine Therapy]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-endokrin-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
// Kodierte Mehrfachauswahl der empfohlenen Optionen; jede Auswahl wird eine eigene CarePlan.activity
* item[=].item[+].linkId = "empfehlung-endokrin-optionen"
* item[=].item[=].text = "Empfohlene Substanzen"
* insert Translation(item[=].item[=].text, en, [[Recommended agents]])
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "empfehlung-endokrin-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen
* item[=].item[=].enableWhen[+].question = "empfehlung-endokrin-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen
* item[=].item[=].enableBehavior = #any
* item[=].item[=].answerOption[+].valueCoding = $SCT#373345002 "Tamoxifen"
* item[=].item[=].answerOption[+].valueCoding = $SCT#386911004 "Letrozole"
* item[=].item[=].answerOption[+].valueCoding = $SCT#386910003 "Anastrozole"
* item[=].item[=].answerOption[+].valueCoding = $SCT#387017005 "Exemestane"
* item[=].item[=].answerOption[+].valueCoding = $SCT#385519002 "Fulvestrant"
* item[=].item[=].answerOption[+].valueCoding = $SCT#108771008 "Goserelin"
* item[=].item[=].answerOption[+].valueCoding = $SCT#397198002 "Leuprorelin"
* item[=].item[+].linkId = "empfehlung-endokrin-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-chemotherapie-group"
* item[=].text = "Chemotherapie"
* insert Translation(item[=].text, en, [[Chemotherapy]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-chemotherapie-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
// Kodierte Mehrfachauswahl der empfohlenen Optionen; jede Auswahl wird eine eigene CarePlan.activity
* item[=].item[+].linkId = "empfehlung-chemotherapie-optionen"
* item[=].item[=].text = "Empfohlene Substanzen"
* insert Translation(item[=].item[=].text, en, [[Recommended agents]])
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "empfehlung-chemotherapie-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen
* item[=].item[=].enableWhen[+].question = "empfehlung-chemotherapie-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen
* item[=].item[=].enableBehavior = #any
* item[=].item[=].answerOption[+].valueCoding = $SCT#417916005 "Epirubicin"
* item[=].item[=].answerOption[+].valueCoding = $SCT#372817009 "Doxorubicin"
* item[=].item[=].answerOption[+].valueCoding = $SCT#387420009 "Cyclophosphamide"
* item[=].item[=].answerOption[+].valueCoding = $SCT#387374002 "Paclitaxel"
* item[=].item[=].answerOption[+].valueCoding = $SCT#426653008 "Albumin bound paclitaxel"
* item[=].item[=].answerOption[+].valueCoding = $SCT#386918005 "Docetaxel"
* item[=].item[=].answerOption[+].valueCoding = $SCT#386905002 "Carboplatin"
* item[=].item[=].answerOption[+].valueCoding = $SCT#386906001 "Capecitabine"
* item[=].item[=].answerOption[+].valueCoding = $SCT#708166000 "Eribulin"
* item[=].item[+].linkId = "empfehlung-chemotherapie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-zielgerichtet-group"
* item[=].text = "Zielgerichtete Therapie"
* insert Translation(item[=].text, en, [[Targeted Therapy]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-zielgerichtet-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
// Kodierte Mehrfachauswahl der empfohlenen Optionen; jede Auswahl wird eine eigene CarePlan.activity
* item[=].item[+].linkId = "empfehlung-zielgerichtet-optionen"
* item[=].item[=].text = "Empfohlene Substanzen"
* insert Translation(item[=].item[=].text, en, [[Recommended agents]])
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "empfehlung-zielgerichtet-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen
* item[=].item[=].enableWhen[+].question = "empfehlung-zielgerichtet-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen
* item[=].item[=].enableBehavior = #any
* item[=].item[=].answerOption[+].valueCoding = $SCT#387003001 "Trastuzumab"
* item[=].item[=].answerOption[+].valueCoding = $SCT#704226002 "Pertuzumab"
* item[=].item[=].answerOption[+].valueCoding = $SCT#702836004 "Trastuzumab emtansine"
* item[=].item[=].answerOption[+].valueCoding = $SCT#838469001 "Trastuzumab deruxtecan"
* item[=].item[=].answerOption[+].valueCoding = $SCT#715958001 "Palbociclib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#732257004 "Ribociclib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#761851004 "Abemaciclib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#432162002 "Olaparib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#782199007 "Talazoparib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#871701001 "Sacituzumab govitecan"
* item[=].item[=].answerOption[+].valueCoding = $SCT#871698009 "Tucatinib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#425820005 "Lapatinib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#736632003 "Neratinib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#788050002 "Alpelisib"
* item[=].item[=].answerOption[+].valueCoding = $SCT#428698007 "Everolimus"
* item[=].item[+].linkId = "empfehlung-zielgerichtet-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-immuntherapie-group"
* item[=].text = "Immuntherapie"
* insert Translation(item[=].text, en, [[Immunotherapy]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-immuntherapie-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
// Kodierte Mehrfachauswahl der empfohlenen Optionen; jede Auswahl wird eine eigene CarePlan.activity
* item[=].item[+].linkId = "empfehlung-immuntherapie-optionen"
* item[=].item[=].text = "Empfohlene Substanzen"
* insert Translation(item[=].item[=].text, en, [[Recommended agents]])
* item[=].item[=].type = #choice
* item[=].item[=].repeats = true
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "empfehlung-immuntherapie-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#empfohlen
* item[=].item[=].enableWhen[+].question = "empfehlung-immuntherapie-status"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung#bedingt-empfohlen
* item[=].item[=].enableBehavior = #any
* item[=].item[=].answerOption[+].valueCoding = $SCT#716125002 "Pembrolizumab"
* item[=].item[=].answerOption[+].valueCoding = $SCT#719371003 "Atezolizumab"
* item[=].item[+].linkId = "empfehlung-immuntherapie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-diagnostik-group"
* item[=].text = "Weitere Diagnostik"
* insert Translation(item[=].text, en, [[Further Diagnostics]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-diagnostik-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-diagnostik-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-studie-group"
* item[=].text = "Klinische Studie"
* insert Translation(item[=].text, en, [[Clinical Trial]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-studie-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-studie-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-genetik-group"
* item[=].text = "Genetische Untersuchung"
* insert Translation(item[=].text, en, [[Genetic Testing]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-genetik-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-genetik-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-nachsorge-group"
* item[=].text = "Nachsorge"
* insert Translation(item[=].text, en, [[Follow-Up]])
* item[=].type = #group
* item[=].item[+].linkId = "empfehlung-nachsorge-status"
* item[=].item[=].text = "Status der Empfehlung"
* insert Translation(item[=].item[=].text, en, [[Recommendation Status]])
* item[=].item[=].type = #choice
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerConstraint"
* item[=].item[=].extension[=].valueCode = #optionsOnly
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumorboard-empfehlung-status"
* item[=].item[+].linkId = "empfehlung-nachsorge-begruendung"
* item[=].item[=].text = "Begruendung / Details (optional)"
* insert Translation(item[=].item[=].text, en, [[Rationale / Details (Optional)]])
* item[=].item[=].type = #text
* item[=].item[=].required = false

* item[+].linkId = "empfehlung-sonstiges"
* item[=].text = "Sonstige Anmerkungen"
* insert Translation(item[=].text, en, [[Other Remarks]])
* item[=].type = #text
* item[=].required = false


// ============================================================
// Contained CarePlan: Template fuer Template-based Extraction
// ============================================================

Instance: careplan-template
InstanceOf: CarePlan
Usage: #inline

* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-tumorboard-empfehlung"
* status = #active
* intent = #plan

// addresses -> Bezugsdiagnose (Condition) aus SDC Choice Selection
// Kein statischer Platzhalter neben templateExtractValue: Aidbox laesst ihn stehen
// und schreibt den extrahierten Wert in ein ungueltiges _-Feld (siehe se-3ul).
* addresses.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* addresses.reference.extension.valueString = "%resource.item.where(linkId='bezugsdiagnose').answer.valueReference.reference"

// category -> Art der Tumorkonferenz (Pflichtfeld im Profil, 1..1)
* category.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* category.coding.extension.valueString = "%resource.item.where(linkId='tumorboard-typ').answer.valueCoding"

* title.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* title.extension[=].valueString = "%resource.item.where(linkId='tumorboard-titel').answer.valueString"

* description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* description.extension.valueString = "%resource.item.where(linkId='tumorboard-beschreibung').answer.valueString"

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

* period.start.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* period.start.extension.valueString = "%resource.item.where(linkId='tumorboard-datum').answer.valueDate"

// --- Operative Therapie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Strahlentherapie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#1287742003 "Radiotherapy (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Endokrine Therapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Chemotherapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Zielgerichtete Therapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#416608005 "Drug therapy"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Immuntherapie ---
* activity[+].detail.kind = #MedicationRequest
* activity[=].detail.code = $SCT#76334006 "Immunotherapy (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Weitere Diagnostik ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#165197003 "Diagnostic assessment (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-diagnostik-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-diagnostik-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-diagnostik-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Klinische Studie ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#110465008 "Clinical trial (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-studie-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-studie-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-studie-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Genetische Untersuchung ---
* activity[+].detail.kind = #ServiceRequest
* activity[=].detail.code = $SCT#405825005 "Molecular genetic test"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-genetik-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-genetik-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-genetik-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Nachsorge ---
* activity[+].detail.kind = #Appointment
* activity[=].detail.code = $SCT#390906007 "Follow-up encounter (procedure)"
* activity[=].detail.statusReason.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.system.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-nachsorge-status').answer.valueCoding.system"
* activity[=].detail.statusReason.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.statusReason.coding.code.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-nachsorge-status').answer.valueCoding.code"
* activity[=].detail.description.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.description.extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-nachsorge-begruendung').answer.valueString"
* activity[=].detail.status = #not-started

// --- Sonstiges ---
* note.text.extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension[=].valueString = "%resource.item.where(linkId='empfehlung-sonstiges').answer.valueString"

// --- Je ausgewaehlter Option eine eigene activity (templateExtractContext iteriert ueber die Antworten).
// Die Therapieart-activities oben bleiben; Exporte lesen nur deren feste Codes.
* activity[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* activity[=].extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-op-optionen').answer.value"
* activity[=].detail.kind = #ServiceRequest
* activity[=].detail.code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.system.extension.valueString = "system"
* activity[=].detail.code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.code.extension.valueString = "code"
* activity[=].detail.code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.display.extension.valueString = "display"
* activity[=].detail.status = #not-started
* activity[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* activity[=].extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-strahlentherapie-optionen').answer.value"
* activity[=].detail.kind = #ServiceRequest
* activity[=].detail.code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.system.extension.valueString = "system"
* activity[=].detail.code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.code.extension.valueString = "code"
* activity[=].detail.code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.display.extension.valueString = "display"
* activity[=].detail.status = #not-started
* activity[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* activity[=].extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-chemotherapie-optionen').answer.value"
* activity[=].detail.kind = #MedicationRequest
* activity[=].detail.code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.system.extension.valueString = "system"
* activity[=].detail.code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.code.extension.valueString = "code"
* activity[=].detail.code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.display.extension.valueString = "display"
* activity[=].detail.status = #not-started
* activity[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* activity[=].extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-endokrin-optionen').answer.value"
* activity[=].detail.kind = #MedicationRequest
* activity[=].detail.code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.system.extension.valueString = "system"
* activity[=].detail.code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.code.extension.valueString = "code"
* activity[=].detail.code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.display.extension.valueString = "display"
* activity[=].detail.status = #not-started
* activity[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* activity[=].extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-zielgerichtet-optionen').answer.value"
* activity[=].detail.kind = #MedicationRequest
* activity[=].detail.code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.system.extension.valueString = "system"
* activity[=].detail.code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.code.extension.valueString = "code"
* activity[=].detail.code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.display.extension.valueString = "display"
* activity[=].detail.status = #not-started
* activity[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractContext"
* activity[=].extension.valueString = "%resource.item.descendants().where(linkId='empfehlung-immuntherapie-optionen').answer.value"
* activity[=].detail.kind = #MedicationRequest
* activity[=].detail.code.coding.system.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.system.extension.valueString = "system"
* activity[=].detail.code.coding.code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.code.extension.valueString = "code"
* activity[=].detail.code.coding.display.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* activity[=].detail.code.coding.display.extension.valueString = "display"
* activity[=].detail.status = #not-started
