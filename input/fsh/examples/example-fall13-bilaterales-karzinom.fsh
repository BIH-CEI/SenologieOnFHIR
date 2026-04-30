// ============================================================
// Fall 13: Margarete Schreiber — Synchrones bilaterales Mammakarzinom
// Links: Invasives Karzinom NST, C50.4, pT1c pN0 cM0, ER+/PR+/HER2-, G2
// Rechts: Invasives Karzinom NST, C50.2, pT2 pN1a cM0, ER+/PR-/HER2+, G3
// Links: BET + SLNB → adjuvante RT + endokrine Therapie
// Rechts: Mastektomie + ALND → adjuvante Chemo (EC-Pac-H) + RT
// Demonstriert: Zwei separate Conditions mit seitenspezifischer
//   Procedure-Zuordnung über reasonReference
// ============================================================

// --- Patient ---
Instance: Fall13-Patient-Margarete-Schreiber
InstanceOf: Patient
Title: "Fall 13: Patientin Margarete Schreiber"
Description: "Synthetische Testpatientin — synchrones bilaterales Mammakarzinom"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-013"
* name.family = "Schreiber"
* name.given = "Margarete"
* gender = #female
* birthDate = "1960-08-22"
* address.city = "Berlin"
* address.country = "DE"


// ============================================================
// Diagnose LINKS: C50.4 links, pT1c pN0 cM0, ER+/PR+/HER2-, G2
// ============================================================
Instance: Fall13-Diagnose-Links
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 13: Mammakarzinom LINKS — pT1c pN0 cM0, ER+/PR+/HER2-, G2"
Description: "Invasives Karzinom NST der linken Brust, oberer äußerer Quadrant. Frühes Stadium, triple-positiv (HR+/HER2-)"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.4
* code.coding[icd10-gm].display = "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.text = "Invasives Mammakarzinom NST links, oberer äußerer Quadrant"

* bodySite.coding = $SCT#80248007 "Left breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-03-10"
* onsetDateTime = "2025-03-10"

* stage[+].summary.text = "pT1c pN0(sn) cM0 — UICC IA"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* recordedDate = "2025-03-10"


// ============================================================
// Diagnose RECHTS: C50.2 rechts, pT2 pN1a cM0, ER+/PR-/HER2+, G3
// ============================================================
Instance: Fall13-Diagnose-Rechts
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 13: Mammakarzinom RECHTS — pT2 pN1a cM0, ER+/PR-/HER2+, G3"
Description: "Invasives Karzinom NST der rechten Brust, oberer innerer Quadrant. Lokal fortgeschritten, HER2-positiv"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.2
* code.coding[icd10-gm].display = "Bösartige Neubildung: Oberer innerer Quadrant der Brustdrüse"
* code.text = "Invasives Mammakarzinom NST rechts, oberer innerer Quadrant"

* bodySite.coding = $SCT#73056007 "Right breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-03-10"
* onsetDateTime = "2025-03-10"

* stage[+].summary.text = "pT2 pN1a cM0 — UICC IIB"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* recordedDate = "2025-03-10"


// ============================================================
// Operation LINKS: BET + SLNB → R0
// ============================================================
Instance: Fall13-Operation-BET-Links
InstanceOf: Senologie_Operation
Title: "Fall 13: BET links + SLNB"
Description: "Brusterhaltende Therapie der linken Brust mit Sentinel-LK-Biopsie, R0"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#392022002 "Excision of mass"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a0
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma: Lokale Exzision"
* code.text = "BET links — Segmentresektion"

* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* performedDateTime = "2025-04-02"
* bodySite = $SCT#80248007 "Left breast structure"

// Korrekte Condition-Referenz: nur linke Diagnose
* reasonReference = Reference(Condition/Fall13-Diagnose-Links)

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "R0-Resektion"


// ============================================================
// Operation RECHTS: Mastektomie + ALND
// ============================================================
Instance: Fall13-Operation-Mastektomie-Rechts
InstanceOf: Senologie_Operation
Title: "Fall 13: Mastektomie rechts + ALND"
Description: "Hautschonende Mastektomie der rechten Brust mit axillärer Lymphknotendissektion, R0"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#172043006 "Total mastectomy"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-872
* code.coding[=].display = "Mastektomie mit Entfernung von axillären Lymphknoten"
* code.text = "SSM rechts mit ALND Level I-II"

* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* performedDateTime = "2025-04-02"
* bodySite = $SCT#73056007 "Right breast structure"

// Korrekte Condition-Referenz: nur rechte Diagnose
* reasonReference = Reference(Condition/Fall13-Diagnose-Rechts)

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "R0-Resektion"


// ============================================================
// Systemtherapie: EC-Pac-H (adjuvant, für rechte Seite — HER2+)
// ============================================================
Instance: Fall13-Systemtherapie-EC-Pac-H
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 13: Adjuvante Chemotherapie EC-Pac-H (rechts, HER2+)"
Description: "Adjuvante Chemotherapie EC gefolgt von Paclitaxel + Trastuzumab für HER2-positives Karzinom rechts"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* code.coding = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* code.text = "Adjuvante Chemotherapie EC-Pac-H"

* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* performedPeriod.start = "2025-05-05"
* performedPeriod.end = "2025-11-15"

// Primäre Indikation: rechte Seite (HER2+), aber Systemtherapie behandelt beide
* reasonReference[+] = Reference(Condition/Fall13-Diagnose-Rechts)
* reasonReference[+] = Reference(Condition/Fall13-Diagnose-Links)

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* outcome.text = "Abgeschlossen, gut vertragen"
* note.text = "4x EC q3w, gefolgt von 12x Paclitaxel weekly + Trastuzumab q3w (18 Zyklen gesamt). Indikation primär HER2+ rechts, Chemotherapie wirkt auf beide Seiten."


// ============================================================
// Encounter: Gemeinsamer stationärer Aufenthalt für beide OPs
// ============================================================
Instance: Fall13-Encounter-Stationaer
InstanceOf: Encounter
Title: "Fall 13: Stationärer Aufenthalt (bilaterale OP)"
Description: "Stationärer Aufenthalt für simultane bilaterale Operation"
Usage: #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* period.start = "2025-04-01"
* period.end = "2025-04-06"
* reasonReference[+] = Reference(Condition/Fall13-Diagnose-Links)
* reasonReference[+] = Reference(Condition/Fall13-Diagnose-Rechts)


// ============================================================
// QuestionnaireResponse: SDC Choice Selection Pattern
// Demonstriert wie Bezugsdiagnose bei bilateralem Karzinom ausgewählt wird
// ============================================================
Instance: Fall13-QR-Bezugsdiagnose-Selection
InstanceOf: QuestionnaireResponse
Title: "Fall 13: QR — Bezugsdiagnose-Auswahl (SDC Choice Selection)"
Description: "Demonstriert das SDC Choice Selection Pattern: Bei bilateralem Karzinom wählt der Arzt die Bezugsdiagnose (Seite) für eine Procedure aus einer candidateExpression-basierten Liste aktiver Mamma-Conditions."
Usage: #example

* questionnaire = "https://www.senologie.org/fhir/Questionnaire/senologie-op-planung"
* status = #completed
* subject = Reference(Patient/Fall13-Patient-Margarete-Schreiber)
* authored = "2025-03-28"

// Bezugsdiagnose: Arzt wählt aus 2 aktiven Conditions
// candidateExpression: Condition?patient=Fall13-Patient&code=254837009&clinical-status=active
// choiceColumn zeigt bodySite zur Unterscheidung
* item[+].linkId = "bezugsdiagnose"
* item[=].text = "Bezugsdiagnose (Seite)"
* item[=].answer[+].valueReference = Reference(Condition/Fall13-Diagnose-Rechts)
* item[=].answer[=].valueReference.display = "C50.2 rechts — pT2 pN1a cM0 (Right breast structure)"

* item[+].linkId = "op-art"
* item[=].text = "Geplante Operation"
* item[=].answer[+].valueString = "SSM rechts mit ALND Level I-II"

* item[+].linkId = "op-seite"
* item[=].text = "Seite"
* item[=].answer[+].valueCoding = $SCT#73056007 "Right breast structure"

* item[+].linkId = "op-datum"
* item[=].text = "Geplantes OP-Datum"
* item[=].answer[+].valueDate = "2025-04-02"
