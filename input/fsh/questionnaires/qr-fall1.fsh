// ============================================================
// QuestionnaireResponses — Fall 1 Erika Neumann
// Roundtrip-Test: $extract soll die in example-fall1-erika-neumann.fsh
// hand-kodierten Ressourcen reproduzieren.
//
// Fall 1: Mammakarzinom links OAQ, C50.4, cT1c cN0 cM0 UICC IA,
// NST G2, ER+ IRS 12, PR+ IRS 8, HER2- 1+, Ki-67 15%
// BET + SLNB links, R0, Sentinel 0/2, RT 50 Gy + Boost 10 Gy,
// Letrozol 2,5 mg adjuvant.
// ============================================================

Alias: $FH    = https://www.senologie.org/fhir/CodeSystem/form-helper
Alias: $CFC   = https://www.senologie.org/fhir/CodeSystem/clinical-findings-custom
Alias: $BC    = https://www.senologie.org/fhir/CodeSystem/bildgebung-custom
Alias: $BIOM  = https://www.senologie.org/fhir/CodeSystem/cs-senologie-biomarker
Alias: $TBE   = https://www.senologie.org/fhir/CodeSystem/tumorboard-empfehlung
Alias: $FU    = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up
Alias: $TNM   = https://www.uicc.org/resources/tnm
Alias: $MIIINT = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention
Alias: $MIIHER2 = https://www.medizininformatik-initiative.de/fhir/ext/modul-mtb/CodeSystem/mii-cs-mtb-her2-ihc-score

// ============================================================
// QR 1 — Diagnose Mammakarzinom links, gesichert
// → Condition/Fall1-Diagnose-Mammakarzinom
// ============================================================
Instance: QR-Diagnose-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Diagnose"
Description: "Antworten auf senologie-diagnose fuer Fall 1 (C50.4 links OAQ, gesichert)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

* item[+].linkId = "patient-ref"
* item[=].answer.valueReference = Reference(Patient/Fall1-Patient-Erika-Neumann)

* item[+].linkId = "diagnose-gruppe"
* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].answer.valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[+].linkId = "diagnose-sicherheit"
* item[=].item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Gesichert"
* item[=].item[+].linkId = "diagnose-details"
* item[=].item[=].answer.valueString = "Invasives Mammakarzinom NST links, oberer aeusserer Quadrant (ICD-10 C50.4). UICC IA, cT1c cN0 cM0, G2."

* item[+].linkId = "lokalisation-zeit"
* item[=].item[+].linkId = "diagnose-seite"
* item[=].item[=].answer.valueCoding = $SCT#7771000 "Links"
* item[=].item[+].linkId = "diagnose-datum"
* item[=].item[=].answer.valueDate = "2025-01-15"


// ============================================================
// QR 2 — Erstanamnese (Vorstellung, Gyn, Familienanamnese)
// → Observation (Gyn) + FamilyMemberHistory + (ggf. ECOG/Rauch)
// ============================================================
Instance: QR-Erstanamnese-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Erstanamnese"
Description: "Allgemeine + Gyn + Familienanamnese fuer Fall 1 (Erstvorstellung, postmenopausal, Mutter Mammakarzinom 52J)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-erstanamnese"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

* item[+].linkId = "allgemeine-anamnese"
* item[=].item[+].linkId = "datum-vorstellung"
* item[=].item[=].answer.valueDate = "2025-01-15"
* item[=].item[+].linkId = "vorstellungsgrund"
* item[=].item[=].answer.valueCoding = $FH#vorstellung-erstvorstellung "Erstvorstellung"
* item[=].item[+].linkId = "groesse"
* item[=].item[=].answer.valueInteger = 168
* item[=].item[+].linkId = "gewicht"
* item[=].item[=].answer.valueInteger = 72
* item[=].item[+].linkId = "ecog"
* item[=].item[=].answer.valueCoding = $LOINC#LA9622-7 "0 - Normale Aktivitaet"

* item[+].linkId = "raucherstatus"
* item[=].item[+].linkId = "raucherstatus-wert"
* item[=].item[=].answer.valueCoding = $LOINC#LA18978-9 "Nie geraucht"

* item[+].linkId = "gynaekologische-anamnese"
* item[=].item[+].linkId = "menarchealter"
* item[=].item[=].answer.valueInteger = 13
* item[=].item[+].linkId = "menopausenstatus"
* item[=].item[=].answer.valueCoding = $SCT#76498008 "Postmenopausal"
* item[=].item[+].linkId = "gravida"
* item[=].item[=].answer.valueInteger = 2
* item[=].item[+].linkId = "para"
* item[=].item[=].answer.valueInteger = 2
* item[=].item[+].linkId = "hormonersatztherapie"
* item[=].item[=].answer.valueCoding = $SCT#373067005 "Nein"
* item[=].item[+].linkId = "orale-kontrazeption"
* item[=].item[=].answer.valueCoding = $FH#kontrazeption-frueher "Frueher"

* item[+].linkId = "familienanamnese"
* item[=].item[+].linkId = "familienmitglied"
* item[=].item[=].item[+].linkId = "verwandtschaftsgrad"
* item[=].item[=].item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "Mutter"
* item[=].item[=].item[+].linkId = "erkrankung"
* item[=].item[=].item[=].answer.valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[=].item[+].linkId = "erkrankungsalter"
* item[=].item[=].item[=].answer.valueInteger = 52


// ============================================================
// QR 3 — Klinische Untersuchung
// → Observation/Fall1-Klinische-Untersuchung
// ============================================================
Instance: QR-KlinUntersuchung-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Klinische Untersuchung"
Description: "Klinische Untersuchung Fall 1: tastbarer Knoten OAQ links, Inspektion unauffaellig, cT1c cN0 cM0 IA."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-klinische-untersuchung"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

* item[+].linkId = "patient-ref"
* item[=].answer.valueReference = Reference(Patient/Fall1-Patient-Erika-Neumann)
* item[+].linkId = "datum"
* item[=].answer.valueDate = "2025-01-15"
* item[+].linkId = "detailliert"
* item[=].answer.valueBoolean = true

* item[+].linkId = "inspektion"
* item[=].item[+].linkId = "inspektion-mamma-rechts-vorhanden"
* item[=].item[=].answer.valueBoolean = true
* item[=].item[+].linkId = "inspektion-mamma-rechts"
* item[=].item[=].answer.valueCoding = $SCT#17621005 "unauffaellig"
* item[=].item[+].linkId = "inspektion-mamma-links-vorhanden"
* item[=].item[=].answer.valueBoolean = true
* item[=].item[+].linkId = "inspektion-mamma-links"
* item[=].item[=].answer.valueCoding = $SCT#17621005 "unauffaellig"
* item[=].item[+].linkId = "symmetrie"
* item[=].item[=].answer.valueCoding = $SCT#290064007 "Symmetrisch"
* item[=].item[+].linkId = "inspektion-details"
* item[=].item[=].answer.valueString = "Mamillen beidseits eingezogen-frei. Keine Hautveraenderungen, keine Sekretion."

* item[+].linkId = "palpation"
* item[=].item[+].linkId = "palpation-mamma-rechts"
* item[=].item[=].answer.valueCoding = $SCT#17621005 "unauffaellig"
* item[=].item[+].linkId = "palpation-mamma-links"
* item[=].item[=].answer.valueCoding = $SCT#263654008 "auffaellig"
* item[=].item[+].linkId = "palpation-axilla-rechts"
* item[=].item[=].answer.valueCoding = $SCT#17621005 "unauffaellig"
* item[=].item[+].linkId = "palpation-axilla-links"
* item[=].item[=].answer.valueCoding = $SCT#17621005 "unauffaellig"
* item[=].item[+].linkId = "palpation-details"
* item[=].item[=].answer.valueString = "Tastbarer Knoten OAQ links, ca. 2 cm, derb, verschieblich. Axillaere LK beidseits klinisch unauffaellig."

* item[+].linkId = "klinisches-tnm"
* item[=].item[+].linkId = "ct"
* item[=].item[=].answer.valueCoding = $TNM#T1c "T1c"
* item[=].item[+].linkId = "cn"
* item[=].item[=].answer.valueCoding = $TNM#N0 "N0"
* item[=].item[+].linkId = "cm"
* item[=].item[=].answer.valueCoding = $TNM#M0 "M0"
* item[=].item[+].linkId = "ctnm-uicc"
* item[=].item[=].answer.valueCoding = $TNM#IA "Stadium IA"

* item[+].linkId = "zusammenfassung"
* item[=].item[+].linkId = "tumornachweis"
* item[=].item[=].answer.valueCoding = $CFC#tumornachweis-erstdiagnose-bc "Erstdiagnose Mammakarzinom"
* item[=].item[+].linkId = "zusammenfassung-text"
* item[=].item[=].answer.valueString = "Klinischer Verdacht auf Mammakarzinom links OAQ, klinisches Stadium cT1c cN0 cM0 UICC IA. Empfehlung: Stanzbiopsie."


// ============================================================
// QR 4 — Bildgebung Mammographie bilateral
// → DiagnosticReport + Observation (BI-RADS 5 links)
// ============================================================
Instance: QR-Bildgebung-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Bildgebung"
Description: "Mammographie bilateral 2025-01-15, BI-RADS 5 links OAQ, ACR C, kein Mikrokalk, LK unauffaellig."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-bildgebung"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-15"

* item[+].linkId = "untersuchung"
* item[=].item[+].linkId = "untersuchung-datum"
* item[=].item[=].answer.valueDate = "2025-01-15"
* item[=].item[+].linkId = "bildgebungsart"
* item[=].item[=].answer.valueCoding = $SCT#43204002 "Mammographie beidseits"
* item[=].item[+].linkId = "untersuchung-standort"
* item[=].item[=].answer.valueCoding = $BC#standort-intern "intern"
* item[=].item[+].linkId = "befundender-arzt"
* item[=].item[=].answer.valueString = "Dr. med. Radiologin"

* item[+].linkId = "lokalisation"
* item[=].item[+].linkId = "lokalisation-seite"
* item[=].item[=].answer.valueCoding = $SCT#7771000 "Links"
* item[=].item[+].linkId = "lokalisation-quadrant"
* item[=].item[=].answer.valueCoding = $SCT#76365002 "Oberer aeusserer Quadrant"

* item[+].linkId = "befund"
* item[=].item[+].linkId = "birads-kategorie"
* item[=].item[=].answer.valueCoding = $SCT#397145000 "BI-RADS 5 - Hochverdaechtig"
* item[=].item[+].linkId = "acr-brustdichte"
* item[=].item[=].answer.valueCoding = $SCT#129718006 "C - Heterogen dicht"
* item[=].item[+].linkId = "herdbefund-groesse"
* item[=].item[=].answer.valueInteger = 18
* item[=].item[+].linkId = "herdbefund-beschreibung"
* item[=].item[=].answer.valueString = "Suspekter Herdbefund OAQ links, 18 mm, unscharf begrenzt, sternfoermige Auslaeufer."
* item[=].item[+].linkId = "mikrokalk"
* item[=].item[=].answer.valueCoding = $BC#mikrokalk-nein "Nein"
* item[=].item[+].linkId = "lk-status"
* item[=].item[=].answer.valueCoding = $BC#lk-unauffaellig "unauffaellig"
* item[=].item[+].linkId = "beurteilbarkeit"
* item[=].item[=].answer.valueCoding = $BC#beurteilbarkeit-gut "gut"

* item[+].linkId = "zusammenfassung"
* item[=].item[+].linkId = "gesamtbeurteilung"
* item[=].item[=].answer.valueString = "BI-RADS 5 links OAQ, BI-RADS 1 rechts. Dringender V.a. Mammakarzinom links OAQ."
* item[=].item[+].linkId = "empfehlung"
* item[=].item[=].answer.valueString = "Histologische Sicherung durch sonographisch gefuehrte Stanzbiopsie empfohlen."


// ============================================================
// QR 5 — Pathologie Stanzbiopsie (NST G2, ER+/PR+/HER2- 1+, Ki67 15%)
// → DiagnosticReport + Specimen + Observations
// ============================================================
Instance: QR-Pathologie-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Pathologie"
Description: "Stanzbiopsie 2025-01-20: NST G2, ER+ IRS 12, PR+ IRS 8, HER2- 1+, Ki67 15%, pT1c pN0(sn) (postoperative pTNM)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-pathologie"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-23"

* item[+].linkId = "praeparat"
* item[=].item[+].linkId = "praeparat-art"
* item[=].item[=].answer.valueCoding = $SCT#9911007 "Stanzbiopsie"
* item[=].item[+].linkId = "praeparat-entnahmedatum"
* item[=].item[=].answer.valueDate = "2025-01-20"
* item[=].item[+].linkId = "praeparat-seite"
* item[=].item[=].answer.valueCoding = $SCT#7771000 "Links"
* item[=].item[+].linkId = "praeparat-quadrant"
* item[=].item[=].answer.valueCoding = $SCT#76365002 "Oberer aeusserer Quadrant"

* item[+].linkId = "histologie"
* item[=].item[+].linkId = "b-klassifikation"
* item[=].item[=].answer.valueCoding = $FH#b-5b "B5b - Maligne invasiv"
* item[=].item[+].linkId = "histo-typ"
* item[=].item[=].answer.valueCoding = $SCT#82711006 "Invasives Karzinom NST"
* item[=].item[+].linkId = "histo-grading"
* item[=].item[=].answer.valueCoding = $SCT#1663004 "G2 - maessig differenziert"
* item[=].item[+].linkId = "histo-tumorgroesse"
* item[=].item[=].answer.valueInteger = 18
* item[=].item[+].linkId = "histo-invasive-groesse"
* item[=].item[=].answer.valueInteger = 15
* item[=].item[+].linkId = "histo-dcis-anteil"
* item[=].item[=].answer.valueString = "Kein begleitendes DCIS"
* item[=].item[+].linkId = "histo-resektionsrand"
* item[=].item[=].answer.valueCoding = $FH#r-0 "R0"
* item[=].item[+].linkId = "histo-sentinel-anzahl"
* item[=].item[=].answer.valueInteger = 2
* item[=].item[+].linkId = "histo-sentinel-befallen"
* item[=].item[=].answer.valueInteger = 0

* item[+].linkId = "ptnm"
* item[=].item[+].linkId = "pt"
* item[=].item[=].answer.valueCoding = $TNM#T1c "T1c"
* item[=].item[+].linkId = "pn"
* item[=].item[=].answer.valueCoding = $TNM#N0 "N0"
* item[=].item[+].linkId = "pm"
* item[=].item[=].answer.valueCoding = $TNM#M0 "M0"
* item[=].item[+].linkId = "l-kategorie"
* item[=].item[=].answer.valueCoding = $TNM#L0 "L0"
* item[=].item[+].linkId = "v-kategorie"
* item[=].item[=].answer.valueCoding = $TNM#V0 "V0"
* item[=].item[+].linkId = "pn-perineural"
* item[=].item[=].answer.valueCoding = $TNM#Pn0 "Pn0"
* item[=].item[+].linkId = "r-status"
* item[=].item[=].answer.valueCoding = $FH#r-0 "R0"
* item[=].item[+].linkId = "ptnm-uicc"
* item[=].item[=].answer.valueCoding = $TNM#IA "Stadium IA"

* item[+].linkId = "ihc"
* item[=].item[+].linkId = "ihc-er-prozent"
* item[=].item[=].answer.valueInteger = 90
* item[=].item[+].linkId = "ihc-er-irs"
* item[=].item[=].answer.valueInteger = 12
* item[=].item[+].linkId = "ihc-er-intensitaet"
* item[=].item[=].answer.valueCoding = $BIOM#intensity-strong "strong"
* item[=].item[+].linkId = "ihc-pr-prozent"
* item[=].item[=].answer.valueInteger = 60
* item[=].item[+].linkId = "ihc-pr-irs"
* item[=].item[=].answer.valueInteger = 8
* item[=].item[+].linkId = "ihc-pr-intensitaet"
* item[=].item[=].answer.valueCoding = $BIOM#intensity-moderate "moderate"
* item[=].item[+].linkId = "ihc-her2-score"
* item[=].item[=].answer.valueCoding = $MIIHER2#1 "1+"
* item[=].item[+].linkId = "ihc-her2-gesamt"
* item[=].item[=].answer.valueCoding = $BIOM#her2-negativ "HER2-negativ"
* item[=].item[+].linkId = "ihc-ki67"
* item[=].item[=].answer.valueInteger = 15

* item[+].linkId = "beurteilung"
* item[=].item[+].linkId = "beurteilung-ptnm"
* item[=].item[=].answer.valueString = "pT1c pN0(sn)(0/2) cM0, G2, L0 V0 Pn0, R0"
* item[=].item[+].linkId = "beurteilung-freitext"
* item[=].item[=].answer.valueString = "Invasives Mammakarzinom NST, G2 (Elston-Ellis), 18 mm. ER+ IRS 12, PR+ IRS 8, HER2- (IHC 1+), Ki-67 15%. R0-Resektion. Sentinel-LK negativ (0/2). Luminal A."


// ============================================================
// QR 6 — OP-Planung (BET + SLNB links, kurativ)
// → ServiceRequest/Fall1-OP-Planung
// ============================================================
Instance: QR-OPPlanung-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR OP-Planung"
Description: "OP-Planung Fall 1: BET links + Sentinel-LK-Biopsie, kurativ, 90 min, Drahtmarkierung."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-28"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)
* item[+].linkId = "op-art"
* item[=].answer.valueString = "BET links + Sentinel-LK-Biopsie"
* item[+].linkId = "seitenlokalisation"
* item[=].answer.valueCoding = $SCT#7771000 "Links"
* item[+].linkId = "intention"
* item[=].answer.valueString = "Kurative Resektion (Indexlaesion + Sentinel-Staging)"
* item[+].linkId = "op-dauer-min"
* item[=].answer.valueInteger = 90
* item[+].linkId = "tumor-conference-consent"
* item[=].answer.valueBoolean = true
* item[+].linkId = "pre-op-markierung"
* item[=].answer.valueCoding = $FH#markierung-draht "Drahtmarkierung"
* item[+].linkId = "notes"
* item[=].answer.valueString = "BET links OAQ, Sentinel-LK-Biopsie links. Praeoperative Drahtmarkierung sono-/mammographiegesteuert. Geplantes OP-Datum 2025-02-05."
* item[+].linkId = "pre-op-blutabnahme"
* item[=].answer.valueBoolean = true


// ============================================================
// QR 7 — PostOP (BET + SLNB, R0, Sentinel 0/2)
// → Procedure/Fall1-Operation-BET
// ============================================================
Instance: QR-PostOP-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR PostOP"
Description: "PostOP Fall 1: BET + SLNB links 2025-02-05, R0, Sentinel 0/2, keine Komplikation."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-postop"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-02-05"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

* item[+].linkId = "operation"
* item[=].item[+].linkId = "op-kategorie"
* item[=].item[=].answer.valueCoding = $SCT#392022002 "BET - Brusterhaltende Therapie"
* item[=].item[+].linkId = "op-seite"
* item[=].item[=].answer.valueCoding = $SCT#7771000 "Links"
* item[=].item[+].linkId = "op-datum"
* item[=].item[=].answer.valueDate = "2025-02-05"
* item[=].item[+].linkId = "op-code-text"
* item[=].item[=].answer.valueString = "BET links OAQ + Sentinel-LK-Biopsie axillaer links"
* item[=].item[+].linkId = "op-intention"
* item[=].item[=].answer.valueCoding = $MIIINT#K "kurativ"
* item[=].item[+].linkId = "op-r-status"
* item[=].item[=].answer.valueCoding = $FH#r-0 "R0 - kein Residualtumor"
* item[=].item[+].linkId = "op-sentinel-anzahl-befallen"
* item[=].item[=].answer.valueString = "0/2"
* item[=].item[+].linkId = "followup-drainage"
* item[=].item[=].answer.valueString = "Redon-Drainage 10 Ch fuer 48h"
* item[=].item[+].linkId = "followup-verband"
* item[=].item[=].answer.valueString = "Kompressionsverband"
* item[=].item[+].linkId = "followup-mobilisation"
* item[=].item[=].answer.valueString = "Mobilisation am OP-Tag erlaubt, Schonung Arm links"


// ============================================================
// QR 8 — Tumorboard Empfehlung (BET + RT + Endokrin, keine Chemo)
// → CarePlan/Fall1-Tumorboard
// ============================================================
Instance: QR-Tumorboard-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Tumorboard"
Description: "Tumorboard 2025-01-28: BET + SLNB empfohlen, adjuvante RT empfohlen, endokrine Therapie empfohlen, Chemotherapie nicht empfohlen (Oncotype DX RS 18)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-01-28"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)
* item[+].linkId = "tumorboard-datum"
* item[=].answer.valueDate = "2025-01-28"
* item[+].linkId = "tumorboard-titel"
* item[=].answer.valueString = "Praetherapeutisches Tumorboard - Erika Neumann"
* item[+].linkId = "tumorboard-beschreibung"
* item[=].answer.valueString = "Mammakarzinom links OAQ, cT1c cN0 cM0 UICC IA, NST G2, Luminal A. Empfehlung: BET + Sentinel-LK-Biopsie, adjuvante Ganzbrustbestrahlung + Boost, endokrine Therapie (AI). Chemotherapie aufgrund Oncotype DX RS 18 (low-risk) nicht empfohlen."

* item[+].linkId = "empfehlung-op-group"
* item[=].item[+].linkId = "empfehlung-op-status"
* item[=].item[=].answer.valueCoding = $TBE#empfohlen "Empfohlen"
* item[=].item[+].linkId = "empfehlung-op-begruendung"
* item[=].item[=].answer.valueString = "BET links + Sentinel-LK-Biopsie."

* item[+].linkId = "empfehlung-strahlentherapie-group"
* item[=].item[+].linkId = "empfehlung-strahlentherapie-status"
* item[=].item[=].answer.valueCoding = $TBE#empfohlen "Empfohlen"
* item[=].item[+].linkId = "empfehlung-strahlentherapie-begruendung"
* item[=].item[=].answer.valueString = "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 10 Gy."

* item[+].linkId = "empfehlung-endokrin-group"
* item[=].item[+].linkId = "empfehlung-endokrin-status"
* item[=].item[=].answer.valueCoding = $TBE#empfohlen "Empfohlen"
* item[=].item[+].linkId = "empfehlung-endokrin-begruendung"
* item[=].item[=].answer.valueString = "Aromatasehemmer (Letrozol) postmenopausal, 5-10 Jahre."

* item[+].linkId = "empfehlung-chemotherapie-group"
* item[=].item[+].linkId = "empfehlung-chemotherapie-status"
* item[=].item[=].answer.valueCoding = $TBE#nicht-empfohlen "Nicht empfohlen"
* item[=].item[+].linkId = "empfehlung-chemotherapie-begruendung"
* item[=].item[=].answer.valueString = "Keine Chemotherapie indiziert (Oncotype DX RS 18, low-risk)."


// ============================================================
// QR 9 — Strahlentherapie (adjuvant, 50 Gy + Boost 10 Gy)
// → Procedure/Fall1-Strahlentherapie
// ============================================================
Instance: QR-Strahlentherapie-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Strahlentherapie"
Description: "Adjuvante Strahlentherapie 2025-03-10 bis 2025-04-18: Ganzbrust 50 Gy (25 Fraktionen) + Boost 10 Gy (5 Fraktionen)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-strahlentherapie"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-04-18"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

* item[+].linkId = "therapie-rahmen"
* item[=].item[+].linkId = "rt-intention"
* item[=].item[=].answer.valueCoding = $SCT#373846009 "Adjuvant"
* item[=].item[+].linkId = "rt-startdatum"
* item[=].item[=].answer.valueDate = "2025-03-10"
* item[=].item[+].linkId = "rt-enddatum"
* item[=].item[=].answer.valueDate = "2025-04-18"
* item[=].item[+].linkId = "rt-seite"
* item[=].item[=].answer.valueCoding = $SCT#7771000 "Links"
* item[=].item[+].linkId = "rt-simultane-rct"
* item[=].item[=].answer.valueBoolean = false

* item[+].linkId = "bestrahlungsplan"
* item[=].item[+].linkId = "rt-zielvolumen"
* item[=].item[=].answer.valueCoding = $SCT#76752008 "Ganze Brust"
* item[=].item[+].linkId = "rt-applikationsart"
* item[=].item[=].answer.valueCoding = $SCT#441783000 "3D-konformale Bestrahlung"
* item[=].item[+].linkId = "rt-gesamtdosis"
* item[=].item[=].answer.valueDecimal = 50.0
* item[=].item[+].linkId = "rt-einzeldosis"
* item[=].item[=].answer.valueDecimal = 2.0
* item[=].item[+].linkId = "rt-fraktionen"
* item[=].item[=].answer.valueInteger = 25

* item[+].linkId = "boost"
* item[=].item[+].linkId = "rt-boost"
* item[=].item[=].answer.valueBoolean = true
* item[=].item[+].linkId = "rt-boost-dosis"
* item[=].item[=].answer.valueDecimal = 10.0
* item[=].item[+].linkId = "rt-boost-fraktionen"
* item[=].item[=].answer.valueInteger = 5

* item[+].linkId = "ergebnis"
* item[=].item[+].linkId = "rt-nebenwirkungen"
* item[=].item[=].answer.valueString = "Leichte Radiodermatitis Grad I links, spontan regredient."
* item[=].item[+].linkId = "rt-therapiestatus"
* item[=].item[=].answer.valueCoding = $FH#therapie-abgeschlossen "Abgeschlossen"


// ============================================================
// QR 10 — Systemtherapie (endokrine adjuvante Therapie, Letrozol)
// → Procedure + MedicationRequest
// ============================================================
Instance: QR-Systemtherapie-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Systemtherapie"
Description: "Endokrine adjuvante Therapie ab 2025-04-25: Letrozol 2,5 mg oral, laufend."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-04-25"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

* item[+].linkId = "therapie-rahmen"
* item[=].item[+].linkId = "therapieart"
* item[=].item[=].answer.valueCoding = $SCT#169413002 "Endokrine Therapie"
* item[=].item[+].linkId = "intention"
* item[=].item[=].answer.valueCoding = $SCT#373846009 "Adjuvant"
* item[=].item[+].linkId = "protokoll"
* item[=].item[=].answer.valueString = "Letrozol 2,5 mg 1x taeglich p.o. fuer 5-10 Jahre"
* item[=].item[+].linkId = "startdatum"
* item[=].item[=].answer.valueDate = "2025-04-25"
* item[=].item[+].linkId = "therapiestatus"
* item[=].item[=].answer.valueCoding = $FH#therapie-laufend "Laufend"

* item[+].linkId = "medikamentengabe"
* item[=].item[+].linkId = "substanz"
* item[=].item[=].answer.valueCoding = $SCT#108774000 "Letrozol"
* item[=].item[+].linkId = "dosis"
* item[=].item[=].answer.valueDecimal = 2.5
* item[=].item[+].linkId = "dosis-einheit"
* item[=].item[=].answer.valueCoding = http://unitsofmeasure.org#mg "mg"
* item[=].item[+].linkId = "gabe-datum"
* item[=].item[=].answer.valueDate = "2025-04-25"
* item[=].item[+].linkId = "applikationsart"
* item[=].item[=].answer.valueCoding = $SCT#26643006 "Oral"

* item[+].linkId = "syst-anmerkungen"
* item[=].answer.valueString = "Aromatasehemmer postmenopausal entsprechend Tumorboard-Empfehlung. Adhaerenzkontrolle in 3 Monaten."


// ============================================================
// QR 11 — Verlauf 6-Monats-Kontrolle (kein Tumornachweis)
// → Senologie_FollowUp + Observations
// ============================================================
Instance: QR-Verlauf-Fall1
InstanceOf: QuestionnaireResponse
Title: "Fall 1 — QR Verlauf 6-Monats-Kontrolle"
Description: "6-Monats-Kontrolle 2025-07-15: aktive Nachsorge, AZ gut, Lokalbefund unauffaellig, kein Lymphoedem, kein Rezidiv, keine Fernmetastasen."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-verlauf"
* status = #completed
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* authored = "2025-07-15"

* item[+].linkId = "kontrolltermin"
* item[=].item[+].linkId = "kontrolltermin-datum"
* item[=].item[=].answer.valueDate = "2025-07-15"
* item[=].item[+].linkId = "kontrolltermin-art"
* item[=].item[=].answer.valueCoding = $CFC#kontrolle-6-monate "6-Monats-Kontrolle"
* item[=].item[+].linkId = "kontrolltermin-art-nachsorge"
* item[=].item[=].answer.valueCoding = $FH#nachsorge-aktiv "Aktiv"
* item[=].item[+].linkId = "kontrolltermin-monate-seit-ed"
* item[=].item[=].answer.valueInteger = 6

* item[+].linkId = "klinischer-status"
* item[=].item[+].linkId = "klinisch-allgemeinzustand"
* item[=].item[=].answer.valueCoding = $FH#ag-gut "Gut"
* item[=].item[+].linkId = "klinisch-lokalbefund"
* item[=].item[=].answer.valueCoding = $SCT#17621005 "unauffaellig"
* item[=].item[+].linkId = "klinisch-lokalbefund-beschreibung"
* item[=].item[=].answer.valueString = "BET-Narbe links reizlos, kein tastbarer Rezidivtumor."
* item[=].item[+].linkId = "klinisch-lymphoedem"
* item[=].item[=].answer.valueCoding = $FH#lymphoedem-0 "Kein Lymphoedem"
* item[=].item[+].linkId = "klinisch-armumfangsdifferenz"
* item[=].item[=].answer.valueDecimal = 0.0
* item[=].item[+].linkId = "klinisch-schmerzen"
* item[=].item[=].answer.valueBoolean = false

* item[+].linkId = "tumorstatus"
* item[=].item[+].linkId = "tumorstatus-gesamtbeurteilung"
* item[=].item[=].answer.valueCoding = $SCT#103338009 "In full remission"
* item[=].item[+].linkId = "tumorstatus-lokalrezidiv"
* item[=].item[=].answer.valueBoolean = false
* item[=].item[+].linkId = "tumorstatus-fernmetastasen"
* item[=].item[=].answer.valueBoolean = false

* item[+].linkId = "weiteres-vorgehen"
* item[=].item[+].linkId = "vorgehen-naechster-termin"
* item[=].item[=].answer.valueDate = "2026-01-15"
* item[=].item[+].linkId = "vorgehen-empfehlung"
* item[=].item[=].answer.valueString = "Letrozol weiterfuehren. Naechste Kontrolle in 6 Monaten mit Mammographie bilateral."
