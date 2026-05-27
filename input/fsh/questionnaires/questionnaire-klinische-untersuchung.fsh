// ============================================================
// Questionnaire: Klinische Untersuchung Mamma
// Quelle: konsentierter Senologie-Datensatz
// Ziele:
//   - Observation (Klinische Untersuchung mit Inspektion/Palpation/Klinisches TNM/
//     Tumornachweis-Status als Components, focus → Condition)
//   - BodyStructure-Refs ggfs. via launchContext (Tumor-Entität)
// Extraktion: SDC Template-based Extraction
//
// Bewusst NICHT enthalten: Sonographie/Bildgebung → senologie-bildgebung,
// Biopsie-Doku → senologie-pathologie.
// ============================================================

Alias: $CLIN_CUSTOM = https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom

// --- Contained template: Observation Klinische Untersuchung ---
Instance: klin-unt-obs-template
InstanceOf: Observation
Usage: #inline
* id = "klin-unt-obs-template"
* meta.profile = "https://www.senologie.org/fhir/StructureDefinition/senologie-klinische-untersuchung"
* status = #final
* code = $LOINC#32422-8 "Physical findings of Breast"
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam

* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"

// focus → Condition (launchContext.diagnosis)
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%diagnosis.reference"

* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "%resource.item.where(linkId='datum').answer.valueDate"

// ===== Inspektion =====

// component[+]: Mamma rechts vorhanden
* component[+].code = $SCT#76752008 "Breast structure"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#24028007 "Right"
* component[=].valueBoolean.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueBoolean.extension.valueString = "iif(%resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-rechts-vorhanden').answer.valueBoolean.exists(), %resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-rechts-vorhanden').answer.valueBoolean, true)"

// component[+]: Mamma rechts Befund (normal/abnormal SCT)
* component[+].code = $SCT#225289005 "Examination of breast"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#24028007 "Right"
* component[=].valueCodeableConcept.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-rechts').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Mamma links Befund
* component[+].code = $SCT#225289005 "Examination of breast"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#7771000 "Left"
* component[=].valueCodeableConcept.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='inspektion').item.where(linkId='inspektion-mamma-links').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Symmetrie
* component[+].code = $SCT#366348007 "Finding of symmetry of breasts"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='inspektion').item.where(linkId='symmetrie').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Asymmetrisch zugunsten (nur wenn asymmetrisch)
* component[+].code = $SCT#271691008 "Finding of asymmetry"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='inspektion').item.where(linkId='asymmetrisch-zugunsten').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Ptosis rechts
* component[+].code = $SCT#15955021000119100 "Ptosis of breast"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#24028007 "Right"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='inspektion').item.where(linkId='ptosis-rechts').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $CLIN_CUSTOM

// component[+]: Ptosis links
* component[+].code = $SCT#15955021000119100 "Ptosis of breast"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#7771000 "Left"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='inspektion').item.where(linkId='ptosis-links').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $CLIN_CUSTOM

// ===== Palpation =====

// component[+]: Palpation Mamma/Thoraxwand rechts
* component[+].code = $SCT#118242002 "Finding by palpation"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#24028007 "Right"
* component[=].valueCodeableConcept.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-mamma-rechts').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Palpation Mamma/Thoraxwand links
* component[+].code = $SCT#118242002 "Finding by palpation"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#7771000 "Left"
* component[=].valueCodeableConcept.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-mamma-links').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Palpation Axilla rechts
* component[+].code = $SCT#284429001 "Examination of axillary lymph nodes"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#24028007 "Right"
* component[=].valueCodeableConcept.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-axilla-rechts').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// component[+]: Palpation Axilla links
* component[+].code = $SCT#284429001 "Examination of axillary lymph nodes"
* component[=].code.coding[0].extension.url = "http://hl7.org/fhir/StructureDefinition/observation-bodyPosition"
* component[=].code.coding[0].extension.valueCodeableConcept = $SCT#7771000 "Left"
* component[=].valueCodeableConcept.coding[+].code.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].code.extension.valueString = "iif(%resource.item.where(linkId='palpation').item.where(linkId='palpation-axilla-links').answer.valueCoding.code = 'auffaellig', '263654008', '17621005')"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// ===== Klinisches TNM =====

// component[+]: cT (klinisch durch den Untersucher gesetzt)
* component[+].code = $SCT#399504009 "cT category (observable entity)"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// component[+]: cN
* component[+].code = $SCT#399534004 "cN category (observable entity)"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = "https://www.uicc.org/resources/tnm"

// ===== Tumornachweis-Status (Response Assessment) =====

* component[+].code = $SCT#363676003 "Status of disease (observable entity)"
* component[=].valueCodeableConcept.coding[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding[=].extension.valueString = "%resource.item.where(linkId='zusammenfassung').item.where(linkId='tumornachweis').answer.valueCoding"
* component[=].valueCodeableConcept.coding[=].system = $SCT

// note ← zusammenfassung-text
* note.text.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* note.text.extension.valueString = "%resource.item.where(linkId='zusammenfassung').item.where(linkId='zusammenfassung-text').answer.valueString"


// --- Contained template: cTNM-Aggregate (MII Onko TNM-Klassifikation) ---
// Klinisches Staging als eigene Observation parallel zum klin-unt-obs-template.
// Code LOINC 21908-9 "Stage group.clinical Cancer".
Instance: klin-unt-ctnm-template
InstanceOf: Observation
Usage: #inline
* id = "klin-unt-ctnm-template"
* meta.profile = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation"
* status = #final
* code = $LOINC#21908-9 "Stage group.clinical Cancer"
* category = http://terminology.hl7.org/CodeSystem/observation-category#exam
* subject.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* subject.reference.extension.valueString = "%resource.subject.reference"
* focus.reference.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* focus.reference.extension.valueString = "%diagnosis.reference"
* effectiveDateTime.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* effectiveDateTime.extension.valueString = "%resource.item.where(linkId='datum').answer.valueDate"
// valueCodeableConcept = cUICC-Gesamtstadium
* valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='ctnm-uicc').answer.valueCoding"
// Components: cT, cN, cM
* component[+].code = $LOINC#21905-5 "Primary tumor.pathology Cancer"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='ct').answer.valueCoding"
* component[+].code = $LOINC#21906-3 "Regional lymph nodes.pathology Cancer"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='cn').answer.valueCoding"
* component[+].code = $LOINC#21907-1 "Distant metastases.pathology Cancer"
* component[=].valueCodeableConcept.coding.extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtractValue"
* component[=].valueCodeableConcept.coding.extension.valueString = "%resource.item.where(linkId='klinisches-tnm').item.where(linkId='cm').answer.valueCoding"


// --- Questionnaire ---
Instance: senologie-klinische-untersuchung
InstanceOf: Questionnaire
Title: "Fragebogen: Klinische Untersuchung Mamma"
Description: "Klinische Inspektion, Palpation und klinisches TNM-Staging der Senologie. Bewusst ohne Sonographie/Bildgebung (→ Bildgebung-Form) und Biopsie-Doku (→ Pathologie-Form)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung"
* name = "QuestKlinischeUntersuchung"
* title = "Fragebogen: Klinische Untersuchung Mamma"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Contained template
* contained[+] = klin-unt-obs-template
* contained[+] = klin-unt-ctnm-template

// Launch Context: Patient
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// Launch Context: Diagnose (Condition)
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding.system = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* extension[=].extension[=].valueCoding.code = #diagnosis
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Condition

// SDC templateExtract → Observation
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* extension[=].extension[+].url = "template"
* extension[=].extension[=].valueReference = Reference(klin-unt-obs-template)

// ============================================================
// Hidden patient-ref (für späteren Subject-Resolve falls benötigt)
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

// Datum
* item[+].linkId = "datum"
* item[=].text = "Untersuchungsdatum"
* item[=].type = #date
* item[=].required = true

// Toggle Detailliert
* item[+].linkId = "detailliert"
* item[=].text = "Detailliert anlegen?"
* item[=].type = #boolean
* item[=].required = false

// ============================================================
// Group: Inspektion
// ============================================================
* item[+].linkId = "inspektion"
* item[=].text = "Inspektion"
* item[=].type = #group

// Mamma rechts vorhanden
* item[=].item[+].linkId = "inspektion-mamma-rechts-vorhanden"
* item[=].item[=].text = "Mamma rechts vorhanden"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Mamma rechts auffällig/unauffällig
* item[=].item[+].linkId = "inspektion-mamma-rechts"
* item[=].item[=].text = "Inspektion Mamma rechts"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"

// Mamma links vorhanden
* item[=].item[+].linkId = "inspektion-mamma-links-vorhanden"
* item[=].item[=].text = "Mamma links vorhanden"
* item[=].item[=].type = #boolean
* item[=].item[=].required = false

// Mamma links auffällig/unauffällig
* item[=].item[+].linkId = "inspektion-mamma-links"
* item[=].item[=].text = "Inspektion Mamma links"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"

// Symmetrie
* item[=].item[+].linkId = "symmetrie"
* item[=].item[=].text = "Symmetrie Mammae"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-symmetrie"

// Asymmetrisch zugunsten (enableWhen=Asymmetrisch)
* item[=].item[+].linkId = "asymmetrisch-zugunsten"
* item[=].item[=].text = "Asymmetrisch zugunsten"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].enableWhen[+].question = "symmetrie"
* item[=].item[=].enableWhen[=].operator = #=
* item[=].item[=].enableWhen[=].answerCoding = $SCT#31739005
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-seite-mamma"

// Ptosis rechts
* item[=].item[+].linkId = "ptosis-rechts"
* item[=].item[=].text = "Ptosis rechts (Regnault)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ptosis-grad"

// Ptosis links
* item[=].item[+].linkId = "ptosis-links"
* item[=].item[=].text = "Ptosis links (Regnault)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-ptosis-grad"

// Inspektion Details (Freitext)
* item[=].item[+].linkId = "inspektion-details"
* item[=].item[=].text = "Details Inspektion"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// ============================================================
// Group: Palpation
// ============================================================
* item[+].linkId = "palpation"
* item[=].text = "Palpation"
* item[=].type = #group

* item[=].item[+].linkId = "palpation-mamma-rechts"
* item[=].item[=].text = "Palpation Mamma/Thoraxwand rechts"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"

* item[=].item[+].linkId = "palpation-mamma-links"
* item[=].item[=].text = "Palpation Mamma/Thoraxwand links"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"

* item[=].item[+].linkId = "palpation-axilla-rechts"
* item[=].item[=].text = "Palpation Axilla/LAW rechts"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"

* item[=].item[+].linkId = "palpation-axilla-links"
* item[=].item[=].text = "Palpation Axilla/LAW links"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-auffaellig-unauffaellig"

* item[=].item[+].linkId = "palpation-details"
* item[=].item[=].text = "Details Palpation"
* item[=].item[=].type = #text
* item[=].item[=].required = false

// ============================================================
// Group: Klinisches TNM (optional, freie ärztliche Einschätzung)
// ============================================================
* item[+].linkId = "klinisches-tnm"
* item[=].text = "Klinisches TNM (Einschätzung des Untersuchers)"
* item[=].type = #group
* item[=].required = false

// templateExtract → cTNM-Aggregate-Observation (parallel zur klin-unt-obs)
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-templateExtract"
* item[=].extension[=].extension[+].url = "template"
* item[=].extension[=].extension[=].valueReference = Reference(klin-unt-ctnm-template)

* item[=].item[+].linkId = "ct"
* item[=].item[=].text = "cT"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-t-kategorie-mamma"

* item[=].item[+].linkId = "cn"
* item[=].item[=].text = "cN"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-n-kategorie-mamma"

* item[=].item[+].linkId = "cm"
* item[=].item[=].text = "cM"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tnm-m-kategorie-mamma"

* item[=].item[+].linkId = "ctnm-uicc"
* item[=].item[=].text = "cUICC-Gesamtstadium (klinisch)"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-uicc-stadium-mamma"

// ============================================================
// Group: Zusammenfassung + Tumornachweis-Status
// ============================================================
* item[+].linkId = "zusammenfassung"
* item[=].text = "Zusammenfassung"
* item[=].type = #group
* item[=].required = false

* item[=].item[+].linkId = "tumornachweis"
* item[=].item[=].text = "Tumornachweis"
* item[=].item[=].type = #choice
* item[=].item[=].required = false
* item[=].item[=].answerValueSet = "https://www.senologie.org/fhir/ValueSet/vs-senologie-tumornachweis-status"

* item[=].item[+].linkId = "zusammenfassung-text"
* item[=].item[=].text = "Zusammenfassung (Freitext)"
* item[=].item[=].type = #text
* item[=].item[=].required = false
