// ============================================================
// QuestionnaireResponses — Fall 10 Christina Becker
// Ausgefuellte Formulare zum durchgaengigen Beispiel Chemotherapie + Implantat.
// Aliase ($FH, $TBE) aus qr-fall1.fsh.
// ============================================================

// Die Diagnose wird ZWEIMAL dokumentiert: am Tag der Bildgebung als Verdacht,
// nach dem Pathologiebefund als gesichert. Das zweite Formular aktualisiert
// dieselbe Condition (verificationStatus provisional -> confirmed).

Instance: QR-Diagnose-Fall10-Verdacht
InstanceOf: QuestionnaireResponse
Title: "Fall 10 — QR Diagnose (Verdacht)"
Description: "Antworten auf senologie-diagnose am Tag der Bildgebung: Verdacht auf Mammakarzinom rechts (BI-RADS 4c), vor der histologischen Sicherung."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose"
* status = #completed
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* authored = "2025-05-20"

* item[+].linkId = "patient-ref"
* item[=].answer.valueReference = Reference(Patient/Fall10-Patient-Christina-Becker)

* item[+].linkId = "diagnose-gruppe"
* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].answer.valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[+].linkId = "diagnose-sicherheit"
* item[=].item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#provisional "Verdacht auf"
* item[=].item[+].linkId = "diagnose-details"
* item[=].item[=].answer.valueString = "Unscharf begrenzter Herdbefund 18 mm rechts, oberer aeusserer Quadrant, BI-RADS 4c. Stanzbiopsie veranlasst."

* item[+].linkId = "lokalisation-zeit"
* item[=].item[+].linkId = "diagnose-seite"
* item[=].item[=].answer.valueCoding = $SCT#24028007 "Rechts"
* item[=].item[+].linkId = "diagnose-datum"
* item[=].item[=].answer.valueDate = "2025-05-20"


Instance: QR-Diagnose-Fall10
InstanceOf: QuestionnaireResponse
Title: "Fall 10 — QR Diagnose (gesichert)"
Description: "Antworten auf senologie-diagnose nach dem Pathologiebefund: Mammakarzinom rechts gesichert (C50.4, triple-negativ, G3)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-diagnose"
* status = #completed
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* authored = "2025-05-28"

* item[+].linkId = "patient-ref"
* item[=].answer.valueReference = Reference(Patient/Fall10-Patient-Christina-Becker)

* item[+].linkId = "diagnose-gruppe"
* item[=].item[+].linkId = "diagnose-sct"
* item[=].item[=].answer.valueCoding = $SCT#254837009 "Mammakarzinom"
* item[=].item[+].linkId = "diagnose-sicherheit"
* item[=].item[=].answer.valueCoding = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Gesichert"
* item[=].item[+].linkId = "diagnose-details"
* item[=].item[=].answer.valueString = "Invasives Mammakarzinom NST rechts, oberer aeusserer Quadrant (ICD-10 C50.4). Triple-negativ, G3, cT1c cN0 cM0."

* item[+].linkId = "lokalisation-zeit"
* item[=].item[+].linkId = "diagnose-seite"
* item[=].item[=].answer.valueCoding = $SCT#24028007 "Rechts"
* item[=].item[+].linkId = "diagnose-datum"
* item[=].item[=].answer.valueDate = "2025-05-20"


Instance: QR-Tumorboard-Fall10
InstanceOf: QuestionnaireResponse
Title: "Fall 10 — QR Tumorboard"
Description: "Tumorboard 2025-06-03: Mastektomie mit Sofortrekonstruktion und adjuvante Chemotherapie empfohlen, Bestrahlung empfohlen, endokrine Therapie nicht empfohlen (hormonrezeptor-negativ)."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-tumorboard"
* status = #completed
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* authored = "2025-06-03"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)
* item[+].linkId = "tumorboard-datum"
* item[=].answer.valueDate = "2025-06-03"
* item[+].linkId = "tumorboard-typ"
* item[=].answer.valueCoding = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ#praeth "prätherapeutische Tumorkonferenz (Festlegung der Therapiestrategie)"
* item[+].linkId = "tumorboard-titel"
* item[=].answer.valueString = "Praetherapeutisches Tumorboard - Christina Becker"
* item[+].linkId = "tumorboard-beschreibung"
* item[=].answer.valueString = "Triple-negatives Mammakarzinom rechts OAQ, cT1c cN0 cM0, NST G3, PALB2-Keimbahnmutation. Empfehlung: Mastektomie rechts + SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion; adjuvante Chemotherapie."

* item[+].linkId = "empfehlung-op-group"
* item[=].item[+].linkId = "empfehlung-op-status"
* item[=].item[=].answer.valueCoding = $TBE#empfohlen "Empfohlen"
* item[=].item[+].linkId = "empfehlung-op-begruendung"
* item[=].item[=].answer.valueString = "Mastektomie rechts + SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten."

* item[+].linkId = "empfehlung-strahlentherapie-group"
* item[=].item[+].linkId = "empfehlung-strahlentherapie-status"
* item[=].item[=].answer.valueCoding = $TBE#empfohlen "Empfohlen"
* item[=].item[+].linkId = "empfehlung-strahlentherapie-begruendung"
* item[=].item[=].answer.valueString = "Bestrahlung der Thoraxwand nach Abschluss der Chemotherapie."

* item[+].linkId = "empfehlung-endokrin-group"
* item[=].item[+].linkId = "empfehlung-endokrin-status"
* item[=].item[=].answer.valueCoding = $TBE#nicht-empfohlen "Nicht empfohlen"
* item[=].item[+].linkId = "empfehlung-endokrin-begruendung"
* item[=].item[=].answer.valueString = "Hormonrezeptor-negativ (ER 0 %, PR 0 %)."

* item[+].linkId = "empfehlung-chemotherapie-group"
* item[=].item[+].linkId = "empfehlung-chemotherapie-status"
* item[=].item[=].answer.valueCoding = $TBE#empfohlen "Empfohlen"
* item[=].item[+].linkId = "empfehlung-chemotherapie-begruendung"
* item[=].item[=].answer.valueString = "Adjuvant Carboplatin + Paclitaxel, 6 Zyklen (triple-negativ, G3, Ki-67 55 %)."


Instance: QR-Systemtherapie-Fall10
InstanceOf: QuestionnaireResponse
Title: "Fall 10 — QR Systemtherapie"
Description: "Adjuvante Chemotherapie ab 2025-07-21: Carboplatin + Paclitaxel, 6 Zyklen, abgeschlossen 2025-11-10."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-systemtherapie"
* status = #completed
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* authored = "2025-11-10"

* item[+].linkId = "bezugsdiagnose"
* item[=].answer.valueReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

* item[+].linkId = "therapie-rahmen"
* item[=].item[+].linkId = "therapieart"
* item[=].item[=].answer.valueCoding = $SCT#385786002 "Chemotherapie"
* item[=].item[+].linkId = "intention"
* item[=].item[=].answer.valueCoding = $SCT#373846009 "Adjuvant"
* item[=].item[+].linkId = "protokoll"
* item[=].item[=].answer.valueString = "Carboplatin AUC5 q3w + Paclitaxel 175 mg/m2 q3w"
* item[=].item[+].linkId = "startdatum"
* item[=].item[=].answer.valueDate = "2025-07-21"
* item[=].item[+].linkId = "enddatum"
* item[=].item[=].answer.valueDate = "2025-11-10"
* item[=].item[+].linkId = "geplante-zyklen"
* item[=].item[=].answer.valueInteger = 6
* item[=].item[+].linkId = "durchgefuehrte-zyklen"
* item[=].item[=].answer.valueInteger = 6
* item[=].item[+].linkId = "therapiestatus"
* item[=].item[=].answer.valueCoding = $FH#therapie-abgeschlossen "Abgeschlossen"

* item[+].linkId = "medikamentengabe"
* item[=].item[+].linkId = "substanz"
* item[=].item[=].answer.valueCoding = $SCT#386905002 "Carboplatin"
* item[=].item[+].linkId = "zyklus-nummer"
* item[=].item[=].answer.valueInteger = 1
* item[=].item[+].linkId = "tag-im-zyklus"
* item[=].item[=].answer.valueInteger = 1
* item[=].item[+].linkId = "gabe-datum"
* item[=].item[=].answer.valueDate = "2025-07-21"
* item[=].item[+].linkId = "applikationsart"
* item[=].item[=].answer.valueCoding = $SCT#47625008 "Intravenous route"

* item[+].linkId = "syst-anmerkungen"
* item[=].answer.valueString = "Nausea CTCAE Grad 2 im zweiten Zyklus, antiemetische Therapie angepasst. Alle 6 Zyklen planmaessig gegeben."
