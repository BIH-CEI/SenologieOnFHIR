// ============================================================
// Questionnaire: Verlauf (Nachsorge / Follow-up)
// Quellen:
//   - MII_PR_Onko_Verlauf (Observation, SNOMED 396432002)
//   - MII_PR_Onko_Allgemeiner_Leistungszustand_ECOG (Observation, LOINC 89247-1)
// Ziele:
//   - Verlauf-Observation (Gesamtbeurteilung, PT-, LK-, FM-Status)
//   - ECOG-Observation (Allgemeiner Leistungszustand)
// Extraktion: SDC Definition-based Extraction pro Gruppe.
// ============================================================

Instance: senologie-verlauf
InstanceOf: Questionnaire
Title: "Fragebogen: Verlauf / Nachsorge"
Description: "Fragebogen zur strukturierten Verlaufsdokumentation (Nachsorge). Erfasst Gesamtbeurteilung, Primaertumorstatus, Lymphknotenstatus, Fernmetastasen-Status und ECOG-Leistungszustand. Nutzt SDC Definition-based Extraction mit zwei Observationen als Ziel (MII_PR_Onko_Verlauf, MII_PR_Onko_ECOG)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf"
* name = "QuestVerlauf"
* title = "Fragebogen: Verlauf / Nachsorge"
* status = #draft
* experimental = true
* subjectType = #Patient
* insert Version

// Launch Context
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[=].extension[+].url = "name"
* extension[=].extension[=].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient

// ============================================================
// Group 1: Verlauf-Observation (MII_PR_Onko_Verlauf)
// ============================================================
* item[+].linkId = "verlauf"
* item[=].text = "Verlaufsbeurteilung"
* item[=].type = #group
* item[=].required = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-verlauf"

// Verlauf-Datum
* item[=].item[+].linkId = "verlauf-datum"
* item[=].item[=].text = "Datum der Verlaufskontrolle"
* item[=].item[=].type = #date
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime"

// Gesamtbeurteilung (Tumorregression)
* item[=].item[+].linkId = "verlauf-gesamt"
* item[=].item[=].text = "Gesamtbeurteilung des Tumorstatus"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#V "Vollremission (complete remission, CR)"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#T "Teilremission (partial remission, PR)"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#K "keine Aenderung (no change, NC) = stable disease"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#P "Progression"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#D "Divergentes Geschehen"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#R "Rezidiv"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#U "unbekannt"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-gesamtbeurteilung#X "fehlende Angabe"

// --- Komponente: Primaertumorstatus ---
* item[=].item[+].linkId = "verlauf-pt"
* item[=].item[=].text = "Primaertumorstatus"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

// PT-Code (fixiert: SNOMED 445200009)
* item[=].item[=].item[+].linkId = "verlauf-pt-code"
* item[=].item[=].item[=].text = "Primaertumorstatus Code"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.code"
* item[=].item[=].item[=].initial.valueCoding = $SCT#445200009 "Status of residual neoplasm (observable entity)"

// PT-Wert
* item[=].item[=].item[+].linkId = "verlauf-pt-value"
* item[=].item[=].item[=].text = "Lokaler Tumorstatus"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#K "kein Tumor nachweisbar"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#T "Tumorreste (Residualtumor)"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#P "Progression"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#N "Kein Anhalt fuer Tumor (no change)"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#R "Lokalrezidiv"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#F "fraglich"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#U "unbekannt"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-primaertumor#X "fehlende Angabe"

// --- Komponente: Lymphknotenstatus ---
* item[=].item[+].linkId = "verlauf-lk"
* item[=].item[=].text = "Lymphknotenstatus"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

// LK-Code (fixiert: SNOMED 399656008)
* item[=].item[=].item[+].linkId = "verlauf-lk-code"
* item[=].item[=].item[=].text = "Lymphknotenstatus Code"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.code"
* item[=].item[=].item[=].initial.valueCoding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"

// LK-Wert
* item[=].item[=].item[+].linkId = "verlauf-lk-value"
* item[=].item[=].item[=].text = "Regionaerer Lymphknotenstatus"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#K "kein Lymphknotenbefall nachweisbar"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#T "Tumorreste (Residualtumor)"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#P "Progression"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#N "Kein Anhalt fuer Lymphknotenbefall (no change)"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#R "Regionaerrezidiv"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#F "fraglich"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#U "unbekannt"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-lymphknoten#X "fehlende Angabe"

// --- Komponente: Fernmetastasen-Status ---
* item[=].item[+].linkId = "verlauf-fm"
* item[=].item[=].text = "Fernmetastasen-Status"
* item[=].item[=].type = #group
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component"

// FM-Code (fixiert: SNOMED 399608002)
* item[=].item[=].item[+].linkId = "verlauf-fm-code"
* item[=].item[=].item[=].text = "Fernmetastasen-Status Code"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].readOnly = true
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.code"
* item[=].item[=].item[=].initial.valueCoding = $SCT#399608002 "Status of distant metastasis (observable entity)"

// FM-Wert
* item[=].item[=].item[+].linkId = "verlauf-fm-value"
* item[=].item[=].item[=].text = "Status Fernmetastasen"
* item[=].item[=].item[=].type = #choice
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.component.valueCodeableConcept"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#K "keine Fernmetastasen nachweisbar"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#T "Tumorreste (Residualtumor)"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#P "Fernmetastasen Progress"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#N "Fernmetastasen No Change"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#R "neue Fernmetastasen (Rezidiv)"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#F "fraglich"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#U "unbekannt"
* item[=].item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-verlauf-fernmetastasen#X "fehlende Angabe"

// ============================================================
// Group 2: ECOG-Leistungszustand (Observation)
// ============================================================
* item[+].linkId = "ecog"
* item[=].text = "Allgemeiner Leistungszustand (ECOG)"
* item[=].type = #group
* item[=].required = false
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "Observation?_profile=https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-allgemeiner-leistungszustand-ecog"

// ECOG-Score
* item[=].item[+].linkId = "ecog-score"
* item[=].item[=].text = "ECOG Performance Status"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.valueCodeableConcept"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog#0 "Normale, uneingeschraenkte Aktivitaet wie vor der Erkrankung"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog#1 "Einschraenkung bei koerperlicher Anstrengung, aber gehfaehig"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog#2 "Gehfaehig, Selbstversorgung moeglich, aber nicht arbeitsfaehig"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog#3 "Nur begrenzte Selbstversorgung moeglich, mehr als 50% der Wachzeit bettlaegerig"
* item[=].item[=].answerOption[+].valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-allgemeiner-leistungszustand-ecog#4 "Voellig pflegebeduertig, keinerlei Selbstversorgung moeglich"

// ECOG-Datum (uebernimmt Verlauf-Datum per Default, kann aber abweichen)
* item[=].item[+].linkId = "ecog-datum"
* item[=].item[=].text = "Datum ECOG-Erhebung"
* item[=].item[=].type = #date
* item[=].item[=].required = false
* item[=].item[=].definition = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.effectiveDateTime"
