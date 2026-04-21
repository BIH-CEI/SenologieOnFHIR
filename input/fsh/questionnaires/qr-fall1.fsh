// ============================================================
// QuestionnaireResponses — Fall 1 Erika Neumann
// Ziel: Roundtrip-Test. $extract soll idealerweise die in
// example-fall1-erika-neumann.fsh hand-kodierten Ressourcen
// reproduzieren.
// ============================================================

// ------------------------------------------------------------
// QR 1: Diagnose Mammakarzinom links, cT1c cN0 cM0, UICC IA
// → Condition/Fall1-Diagnose-Mammakarzinom
// ------------------------------------------------------------
Instance: QR-Diagnose-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Diagnose Maligne"
Description: "Antworten auf QuestDiagnoseMaligne für Fall 1 Erika Neumann. Extraktion erzeugt Condition/Fall1-Diagnose-Mammakarzinom (C50.4 links, UICC IA)."
Usage: #example

* questionnaire = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-diagnose-maligne"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

* item[+].linkId = "diagnose-sct"
* item[=].answer.valueCoding = $SCT#254837009 "Malignant neoplasm of breast"

* item[+].linkId = "diagnose-icd10"
* item[=].answer.valueString = "C50.4"

* item[+].linkId = "diagnose-icd10-display"
* item[=].answer.valueString = "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"

* item[+].linkId = "diagnose-text"
* item[=].answer.valueString = "Invasives Mammakarzinom NST links, oberer äußerer Quadrant"

* item[+].linkId = "seitenlokalisation"
* item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[+].linkId = "feststellungsdatum"
* item[=].answer.valueDate = "2025-01-15"

* item[+].linkId = "recorded-date"
* item[=].answer.valueDate = "2025-01-15"

* item[+].linkId = "diagnosesicherung"
* item[=].answer.valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* item[+].linkId = "stadium-summary"
* item[=].answer.valueString = "UICC IA (cT1c cN0 cM0)"

* item[+].linkId = "metastasen-summary"
* item[=].answer.valueString = "cM0"

* item[+].linkId = "clinical-status"
* item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"

* item[+].linkId = "onset"
* item[=].answer.valueDate = "2025-01-15"


// ------------------------------------------------------------
// QR 2: OP Planung BET + SLNB
// → ServiceRequest/Fall1-OP-Planung
// ------------------------------------------------------------
Instance: QR-OPPlanung-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR OP Planung"
Description: "Antworten auf QuestOPPlanung für Fall 1 Erika Neumann. Extraktion erzeugt ServiceRequest/Fall1-OP-Planung (BET links + SLNB, 90 min, Drahtmarkierung)."
Usage: #example

* questionnaire = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-op-planung"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-28"

* item[+].linkId = "op-art"
* item[=].answer.valueString = "BET links + Sentinel-LK-Biopsie"

* item[+].linkId = "seitenlokalisation"
* item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[+].linkId = "intention"
* item[=].answer.valueString = "Kurative Intention"

* item[+].linkId = "op-dauer-min"
* item[=].answer.valueInteger = 90

* item[+].linkId = "tumor-conference-consent"
* item[=].answer.valueBoolean = true

* item[+].linkId = "pre-op-markierung"
* item[=].answer.valueString = "Drahtmarkierung"

* item[+].linkId = "notes"
* item[=].answer.valueString = "BET links OAQ, SLNB links. Präoperative Drahtmarkierung geplant."


// ------------------------------------------------------------
// QR 3: PostOP (BET links + SLNB, R0)
// → Procedure/Fall1-Operation-BET + postoperative Anordnungen
// ------------------------------------------------------------
Instance: QR-PostOP-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Postoperative Dokumentation"
Description: "Antworten auf QuestPostOPDokumentation für Fall 1 Erika Neumann. Extraktion erzeugt Procedure/Fall1-Operation-BET (BET + SLNB links, R0, 2025-02-05)."
Usage: #example

* questionnaire = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-postop"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-02-05"

// --- Operation group ---
* item[+].linkId = "operation"

* item[=].item[+].linkId = "op-kategorie"
* item[=].item[=].answer.valueCoding = $SCT#392022002 "Excision of mass"

* item[=].item[+].linkId = "op-seite"
* item[=].item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[=].item[+].linkId = "op-datum"
* item[=].item[=].answer.valueDate = "2025-02-05"

* item[=].item[+].linkId = "op-code-text"
* item[=].item[=].answer.valueString = "BET links, Sentinel-LK-Biopsie"

* item[=].item[+].linkId = "op-intention"
* item[=].item[=].answer.valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* item[=].item[+].linkId = "op-outcome"
* item[=].item[=].answer.valueString = "R0-Resektion, Sentinel negativ (0/2)"

// --- FollowUp group ---
* item[+].linkId = "followup"

* item[=].item[+].linkId = "followup-drainage"
* item[=].item[=].answer.valueString = "Redon-Drainage 10 Ch"

* item[=].item[+].linkId = "followup-verband"
* item[=].item[=].answer.valueString = "Kompressionsverband"

// Keine Komplikation für Fall 1 — Komplikations-Gruppe bleibt leer


// ------------------------------------------------------------
// QR 4: Tumorboard-Empfehlung (BET + SLNB + RT + Endokrin)
// → CarePlan/Fall1-Tumorboard
// ------------------------------------------------------------
Instance: QR-Tumorboard-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Tumorboard Empfehlung"
Description: "Antworten auf QuestTumorboard für Fall 1 Erika Neumann. Extraktion erzeugt CarePlan/Fall1-Tumorboard (BET + SLNB, adjuvante RT, endokrine Therapie, keine Chemotherapie)."
Usage: #example

* questionnaire = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-tumorboard"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-28"

* item[+].linkId = "tumorboard-datum"
* item[=].answer.valueDate = "2025-01-28"

* item[+].linkId = "tumorboard-titel"
* item[=].answer.valueString = "Tumorboard-Empfehlung Erika Neumann"

* item[+].linkId = "tumorboard-beschreibung"
* item[=].answer.valueString = "Empfehlung: Brusterhaltende Therapie mit Sentinel-LK-Biopsie, adjuvante Strahlentherapie, endokrine Therapie (Aromatasehemmer). Keine Chemotherapie aufgrund Oncotype DX RS 18."

* item[+].linkId = "empfehlung-op"
* item[=].answer.valueString = "BET links + Sentinel-LK-Biopsie"

* item[+].linkId = "empfehlung-strahlentherapie"
* item[=].answer.valueString = "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 10 Gy"

* item[+].linkId = "empfehlung-endokrin"
* item[=].answer.valueString = "Aromatasehemmer (Letrozol) für 5-10 Jahre"

* item[+].linkId = "empfehlung-chemotherapie"
* item[=].answer.valueString = "Keine Chemotherapie empfohlen"


// ------------------------------------------------------------
// QR 5: Klinische Untersuchung
// → Observation/Fall1-Klinische-Untersuchung
// ------------------------------------------------------------
Instance: QR-KlinUntersuchung-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Klinische Untersuchung"
Description: "Antworten auf QuestKlinischeUntersuchung für Fall 1 Erika Neumann. Extraktion erzeugt Observation/Fall1-Klinische-Untersuchung (links OAQ, tastbarer Knoten)."
Usage: #example

* questionnaire = "http://fhir.bih-charite.de/kds-senologie/Questionnaire/senologie-klinische-untersuchung"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

* item[+].linkId = "untersuchung-datum"
* item[=].answer.valueDate = "2025-01-15"

* item[+].linkId = "seitenlokalisation"
* item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[+].linkId = "palpationsbefund"
* item[=].answer.valueString = "Tastbarer Knoten OAQ links, ca. 2 cm, derb, verschieblich"

* item[+].linkId = "hautveraenderungen"
* item[=].answer.valueString = "Keine Hautveränderungen"

* item[+].linkId = "mamillenbefund"
* item[=].answer.valueString = "Mamille unauffällig, keine Sekretion"

* item[+].linkId = "lymphknotenstatus"
* item[=].answer.valueString = "Axilläre Lymphknoten beidseits klinisch unauffällig"
