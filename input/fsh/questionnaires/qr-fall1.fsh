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

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose-maligne"
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

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung"
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

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-postop"
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

// Postoperative Anordnungen (jetzt im Operation-Gruppe)
* item[=].item[+].linkId = "followup-drainage"
* item[=].item[=].answer.valueString = "Redon-Drainage 10 Ch"

* item[=].item[+].linkId = "followup-verband"
* item[=].item[=].answer.valueString = "Kompressionsverband"

// Keine Komplikation fuer Fall 1 — Komplikations-Gruppe bleibt leer


// ------------------------------------------------------------
// QR 4: Tumorboard-Empfehlung (BET + SLNB + RT + Endokrin)
// → CarePlan/Fall1-Tumorboard
// ------------------------------------------------------------
Instance: QR-Tumorboard-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Tumorboard Empfehlung"
Description: "Antworten auf QuestTumorboard für Fall 1 Erika Neumann. Extraktion erzeugt CarePlan/Fall1-Tumorboard (BET + SLNB, adjuvante RT, endokrine Therapie, keine Chemotherapie)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard"
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

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung"
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


// ------------------------------------------------------------
// QR 6: Erstanamnese (Diagnose + Gyn-Anamnese + Familienanamnese)
// → Condition + Observation + FamilyMemberHistory
// ------------------------------------------------------------
Instance: QR-Erstanamnese-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Erstanamnese"
Description: "Antworten auf QuestErstanamnese fuer Fall 1 Erika Neumann. Extraktion erzeugt Condition (C50.4 links), Observation (Gyn-Anamnese: Menarche 13, Menopause 54, Gravida 2), FamilyMemberHistory (Mutter Mammakarzinom 52J)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

// --- Diagnose group ---
* item[+].linkId = "diagnose"

* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].answer.valueCoding = $SCT#254837009 "Malignant neoplasm of breast"

* item[=].item[+].linkId = "diagnose-icd10"
* item[=].item[=].answer.valueString = "C50.4"

* item[=].item[+].linkId = "diagnose-icd10-display"
* item[=].item[=].answer.valueString = "Boesartige Neubildung: Oberer aeusserer Quadrant der Brustdruese"

* item[=].item[+].linkId = "diagnose-text"
* item[=].item[=].answer.valueString = "Invasives Mammakarzinom NST links, oberer aeusserer Quadrant"

* item[=].item[+].linkId = "seitenlokalisation"
* item[=].item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[=].item[+].linkId = "feststellungsdatum"
* item[=].item[=].answer.valueDate = "2025-01-15"

* item[=].item[+].linkId = "recorded-date"
* item[=].item[=].answer.valueDate = "2025-01-15"

* item[=].item[+].linkId = "diagnosesicherung"
* item[=].item[=].answer.valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primaertumors"

* item[=].item[+].linkId = "stadium-summary"
* item[=].item[=].answer.valueString = "UICC IA (cT1c cN0 cM0)"

* item[=].item[+].linkId = "metastasen-summary"
* item[=].item[=].answer.valueString = "cM0"

* item[=].item[+].linkId = "clinical-status"
* item[=].item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"

* item[=].item[+].linkId = "onset"
* item[=].item[=].answer.valueDate = "2025-01-15"

// --- Gynaekologische Anamnese group ---
* item[+].linkId = "gyn-anamnese"

* item[=].item[+].linkId = "gyn-datum"
* item[=].item[=].answer.valueDate = "2025-01-15"

* item[=].item[+].linkId = "gyn-menarche"
* item[=].item[=].item[+].linkId = "gyn-menarche-alter"
* item[=].item[=].item[=].answer.valueInteger = 13

* item[=].item[+].linkId = "gyn-menopause"
* item[=].item[=].item[+].linkId = "gyn-menopause-alter"
* item[=].item[=].item[=].answer.valueInteger = 54

* item[=].item[+].linkId = "gyn-gravida"
* item[=].item[=].item[+].linkId = "gyn-gravida-anzahl"
* item[=].item[=].item[=].answer.valueInteger = 2

* item[=].item[+].linkId = "gyn-hrt"
* item[=].item[=].answer.valueString = "Keine HRT"

// --- Familienanamnese group ---
* item[+].linkId = "familienanamnese"

* item[=].item[+].linkId = "fam-verwandtschaft"
* item[=].item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mutter"

* item[=].item[+].linkId = "fam-erkrankung"
* item[=].item[=].answer.valueCoding = $SCT#254837009 "Malignant neoplasm of breast"

* item[=].item[+].linkId = "fam-alter"
* item[=].item[=].answer.valueInteger = 52


// ------------------------------------------------------------
// QR 7: Bildgebung Mamma (Mammographie bilateral, BI-RADS 5 links)
// → DiagnosticReport/Fall1-Bildgebung-Mammographie
//   + Observation/Fall1-BiRADS-Links
// ------------------------------------------------------------
Instance: QR-Bildgebung-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Bildgebung Mamma"
Description: "Antworten auf QuestBildgebung für Fall 1 Erika Neumann. Extraktion erzeugt DiagnosticReport/Fall1-Bildgebung-Mammographie (Mammographie bilateral) und Observation/Fall1-BiRADS-Links (BI-RADS 5 links)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

// --- Untersuchung group (DiagnosticReport) ---
* item[+].linkId = "untersuchung"

* item[=].item[+].linkId = "untersuchung-datum"
* item[=].item[=].answer.valueDate = "2025-01-15"

* item[=].item[+].linkId = "bildgebungsart"
* item[=].item[=].answer.valueCoding = $LOINC#24606-6 "MG Breast Screening"

* item[=].item[+].linkId = "seite"
* item[=].item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[=].item[+].linkId = "befundender-arzt"
* item[=].item[=].answer.valueString = "Dr. med. Radiologin"

// --- Befund group (Observation) ---
* item[+].linkId = "befund"

* item[=].item[+].linkId = "birads-kategorie"
* item[=].item[=].answer.valueCoding = $SCT#397145000 "Mammography assessment (Category 5) - Highly suggestive of malignancy"

* item[=].item[+].linkId = "acr-brustdichte"
* item[=].item[=].answer.valueString = "C – heterogen dicht"

* item[=].item[+].linkId = "herdbefund-beschreibung"
* item[=].item[=].answer.valueString = "Suspekter Herdbefund OAQ links, 18 mm, unscharf begrenzt, sternförmige Ausläufer"

* item[=].item[+].linkId = "mikrokalk"
* item[=].item[=].answer.valueBoolean = false

* item[=].item[+].linkId = "lymphknoten-auffaellig"
* item[=].item[=].answer.valueBoolean = false

// --- Zusammenfassung group ---
* item[+].linkId = "zusammenfassung"

* item[=].item[+].linkId = "gesamtbeurteilung"
* item[=].item[=].answer.valueString = "BI-RADS 5 links oben aussen, BI-RADS 1 rechts. Dringender V.a. Malignom links OAQ."

* item[=].item[+].linkId = "empfehlung"
* item[=].item[=].answer.valueString = "Histologische Sicherung durch Stanzbiopsie empfohlen."


// ------------------------------------------------------------
// QR 8: Pathologie Befund (Stanzbiopsie, NST G2, ER+/PR+/HER2-/Ki67 15%)
// → DiagnosticReport/Fall1-Pathologie-Befund
//   + Specimen/Fall1-Pathologie-Praeparat
//   + Observation (Histologie + IHC)
// ------------------------------------------------------------
Instance: QR-Pathologie-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Pathologie Befund"
Description: "Antworten auf QuestPathologieBefund für Fall 1 Erika Neumann. Extraktion erzeugt DiagnosticReport/Fall1-Pathologie-Befund, Specimen/Fall1-Pathologie-Praeparat, Observations für Histologie und IHC (NST G2, ER+ IRS 12, PR+ IRS 8, HER2- 1+, Ki-67 15%)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-23"

// --- Praeparat group (Specimen) ---
* item[+].linkId = "praeparat"

* item[=].item[+].linkId = "praeparat-art"
* item[=].item[=].answer.valueCoding = $SCT#86273004 "Biopsy"

* item[=].item[+].linkId = "praeparat-entnahmedatum"
* item[=].item[=].answer.valueDate = "2025-01-20"

* item[=].item[+].linkId = "praeparat-seite"
* item[=].item[=].answer.valueCoding = $SCT#80248007 "Left breast structure"

* item[=].item[+].linkId = "praeparat-quadrant"
* item[=].item[=].answer.valueCoding = $SCT#76365002 "Structure of upper outer quadrant of breast"

// --- Histologie group (Observation) ---
* item[+].linkId = "histologie"

* item[=].item[+].linkId = "histo-typ"
* item[=].item[=].answer.valueCoding = $SCT#82711006 "Infiltrating duct carcinoma"

* item[=].item[+].linkId = "histo-grading"
* item[=].item[=].answer.valueCoding = $SCT#1663004 "G2 grade"

* item[=].item[+].linkId = "histo-tumorgroesse"
* item[=].item[=].answer.valueInteger = 18

* item[=].item[+].linkId = "histo-invasive-groesse"
* item[=].item[=].answer.valueInteger = 15

* item[=].item[+].linkId = "histo-dcis-anteil"
* item[=].item[=].answer.valueString = "Kein begleitendes DCIS"

* item[=].item[+].linkId = "histo-resektionsrand"
* item[=].item[=].answer.valueCoding = $SCT#258254000 "Residual tumor stage R0"

* item[=].item[+].linkId = "histo-sentinel-anzahl"
* item[=].item[=].answer.valueInteger = 2

* item[=].item[+].linkId = "histo-sentinel-befallen"
* item[=].item[=].answer.valueInteger = 0

// --- Immunhistochemie group (Observation) ---
* item[+].linkId = "ihc"

* item[=].item[+].linkId = "ihc-er-prozent"
* item[=].item[=].answer.valueInteger = 90

* item[=].item[+].linkId = "ihc-er-irs"
* item[=].item[=].answer.valueInteger = 12

* item[=].item[+].linkId = "ihc-pr-prozent"
* item[=].item[=].answer.valueInteger = 60

* item[=].item[+].linkId = "ihc-pr-irs"
* item[=].item[=].answer.valueInteger = 8

* item[=].item[+].linkId = "ihc-her2-score"
* item[=].item[=].answer.valueString = "1+"

* item[=].item[+].linkId = "ihc-ki67"
* item[=].item[=].answer.valueInteger = 15

// --- Beurteilung group (DiagnosticReport) ---
* item[+].linkId = "beurteilung"

* item[=].item[+].linkId = "beurteilung-ptnm"
* item[=].item[=].answer.valueString = "pT1c pN0(sn)(0/2) cM0, G2"

* item[=].item[+].linkId = "beurteilung-freitext"
* item[=].item[=].answer.valueString = "Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%. R0-Resektion. Sentinel-LK negativ (0/2)."


// ------------------------------------------------------------
// QR 9: Strahlentherapie (adjuvant, 50 Gy + 10 Gy Boost)
// → Procedure/Fall1-Strahlentherapie
// ------------------------------------------------------------
Instance: QR-Strahlentherapie-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Strahlentherapie"
Description: "Antworten auf QuestStrahlentherapie für Fall 1 Erika Neumann. Extraktion erzeugt Procedure/Fall1-Strahlentherapie (adjuvant, Ganzbrust 50 Gy/25 Fraktionen + Boost 10 Gy/5 Fraktionen)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-04-18"

// --- Therapie-Rahmen group (Procedure) ---
* item[+].linkId = "therapie-rahmen"

* item[=].item[+].linkId = "rt-intention"
* item[=].item[=].answer.valueCoding = $SCT#373846009 "Adjuvant - intent"

* item[=].item[+].linkId = "rt-startdatum"
* item[=].item[=].answer.valueDate = "2025-03-10"

* item[=].item[+].linkId = "rt-enddatum"
* item[=].item[=].answer.valueDate = "2025-04-18"

* item[=].item[+].linkId = "rt-bezogene-op"
* item[=].item[=].answer.valueString = "BET links + SLNB (2025-02-05)"

// --- Bestrahlungsplan group ---
* item[+].linkId = "bestrahlungsplan"

* item[=].item[+].linkId = "rt-zielvolumen"
* item[=].item[=].answer.valueCoding = $SCT#76752008 "Breast structure"

* item[=].item[+].linkId = "rt-applikationsart"
* item[=].item[=].answer.valueCoding = $SCT#1163834000 "3D conformal radiation therapy"

* item[=].item[+].linkId = "rt-gesamtdosis"
* item[=].item[=].answer.valueDecimal = 50.0

* item[=].item[+].linkId = "rt-einzeldosis"
* item[=].item[=].answer.valueDecimal = 2.0

* item[=].item[+].linkId = "rt-fraktionen"
* item[=].item[=].answer.valueInteger = 25

// --- Boost group ---
* item[+].linkId = "boost"

* item[=].item[+].linkId = "rt-boost"
* item[=].item[=].answer.valueBoolean = true

* item[=].item[+].linkId = "rt-boost-dosis"
* item[=].item[=].answer.valueDecimal = 10.0

* item[=].item[+].linkId = "rt-boost-fraktionen"
* item[=].item[=].answer.valueInteger = 5

* item[=].item[+].linkId = "rt-boost-technik"
* item[=].item[=].answer.valueString = "Elektronen"

// --- Ergebnis group ---
* item[+].linkId = "ergebnis"

* item[=].item[+].linkId = "rt-nebenwirkungen"
* item[=].item[=].answer.valueString = "Leichte Radiodermatitis Grad I links, spontan regredient"

* item[=].item[+].linkId = "rt-therapiestatus"
* item[=].item[=].answer.valueString = "Abgeschlossen"


// ------------------------------------------------------------
// QR 10: Systemtherapie (endokrine Therapie Letrozol)
// → Procedure (Hormontherapie, adjuvant, Letrozol)
// ------------------------------------------------------------
Instance: QR-Systemtherapie-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Systemtherapie"
Description: "Antworten auf QuestSystemtherapie für Fall 1 Erika Neumann. Extraktion erzeugt Procedure (endokrine Therapie, adjuvant, Letrozol 2,5 mg, kurativ, laufend)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-04-25"

* item[+].linkId = "syst-therapieart"
* item[=].answer.valueCoding = $SCT#169413002 "Hormone therapy (procedure)"

* item[+].linkId = "syst-intention"
* item[=].answer.valueCoding = $SCT#373808002 "Curative - procedure intent (qualifier value)"

* item[+].linkId = "syst-stellung"
* item[=].answer.valueCoding = $SCT#352241000119100 "Adjuvant chemotherapy (procedure)"

* item[+].linkId = "syst-protokoll"
* item[=].answer.valueString = "Letrozol 2,5 mg 1x taeglich fuer 5-10 Jahre"

* item[+].linkId = "syst-substanz"
* item[=].answer.valueString = "Letrozol 2,5 mg"

* item[+].linkId = "syst-beginn"
* item[=].answer.valueDate = "2025-04-25"

* item[+].linkId = "syst-anmerkungen"
* item[=].answer.valueString = "Aromatasehemmer postmenopausal, entsprechend Tumorboard-Empfehlung. Keine Chemotherapie aufgrund Oncotype DX RS 18."


// ------------------------------------------------------------
// QR 11: Verlaufsdokumentation / Nachsorge (6-Monats-Kontrolle)
// → Observation (Klinischer Status) + Observation (Tumorstatus)
// ------------------------------------------------------------
Instance: QR-Verlauf-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Verlauf 6-Monats-Kontrolle"
Description: "Antworten auf QuestVerlauf für Fall 1 Erika Neumann. Extraktion erzeugt Observation (klinischer Status: gut, unauffaellig) und Observation/FollowUp (Tumorstatus: kein Anhalt fuer Tumor, kein Rezidiv)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-07-15"

// --- Kontrolltermin group ---
* item[+].linkId = "kontrolltermin"

* item[=].item[+].linkId = "kontrolltermin-datum"
* item[=].item[=].answer.valueDate = "2025-07-15"

* item[=].item[+].linkId = "kontrolltermin-art"
* item[=].item[=].answer.valueString = "6-Monats-Kontrolle"

* item[=].item[+].linkId = "kontrolltermin-monate-seit-ed"
* item[=].item[=].answer.valueInteger = 6

// --- Klinischer Status group (Observation) ---
* item[+].linkId = "klinischer-status"

* item[=].item[+].linkId = "klinisch-allgemeinzustand"
* item[=].item[=].answer.valueString = "Gut"

* item[=].item[+].linkId = "klinisch-lokalbefund"
* item[=].item[=].answer.valueString = "Unauffaellig"

* item[=].item[+].linkId = "klinisch-lymphoedem"
* item[=].item[=].answer.valueString = "Kein"

* item[=].item[+].linkId = "klinisch-schmerzen"
* item[=].item[=].answer.valueBoolean = false

// --- Tumorstatus group (FollowUp Observation) ---
* item[+].linkId = "tumorstatus"

* item[=].item[+].linkId = "tumorstatus-gesamtbeurteilung"
* item[=].item[=].answer.valueString = "Kein Anhalt fuer Tumor"

* item[=].item[+].linkId = "tumorstatus-lokalrezidiv"
* item[=].item[=].answer.valueBoolean = false

* item[=].item[+].linkId = "tumorstatus-fernmetastasen"
* item[=].item[=].answer.valueBoolean = false

// --- Weiteres Vorgehen group ---
* item[+].linkId = "weiteres-vorgehen"

* item[=].item[+].linkId = "vorgehen-naechster-termin"
* item[=].item[=].answer.valueDate = "2026-01-15"

* item[=].item[+].linkId = "vorgehen-empfehlung"
* item[=].item[=].answer.valueString = "Weiter Letrozol, naechste Kontrolle in 6 Monaten mit Mammographie bilateral."
