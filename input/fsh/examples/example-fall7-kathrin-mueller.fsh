// ============================================================
// Fall 7: Kathrin Mueller — TNBC Stadium IIA, kurativ mit pCR
// Invasives Karzinom NST rechts, cT2 cN0 cM0, UICC IIA
// ER- PR- HER2-, Ki-67 65%, G3
// Neoadjuvant: Carboplatin + Paclitaxel wöchentlich, dann EC
// BET rechts + SLNB → ypT0 ypN0(sn)(0/2) = pCR, R0
// Adjuvant RT 50 Gy + Boost 16 Gy
// ============================================================

// --- Patient ---
Instance: Fall7-Patient-Kathrin-Mueller
InstanceOf: Patient
Title: "Fall 7: Patientin Kathrin Mueller"
Description: "Synthetische Testpatientin — TNBC, neoadjuvant, pCR"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-007"
* name.family = "Mueller"
* name.given = "Kathrin"
* gender = #female
* birthDate = "1977-06-17"
* address.city = "Köln"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall7-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 7: TNBC rechts, cT2 cN0 cM0"
Description: "Invasives Mammakarzinom NST rechts, triple-negativ, UICC IIA"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.9
* code.coding[icd10-gm].display = "Bösartige Neubildung: Brustdrüse, nicht näher bezeichnet"
* code.text = "Invasives Mammakarzinom NST rechts, triple-negativ"

* bodySite.coding = $SCT#73056007 "Right breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-03-05"
* onsetDateTime = "2025-03-05"

* stage[+].summary.text = "UICC IIA (cT2 cN0 cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* recordedDate = "2025-03-05"


// --- Bildgebung Mammographie ---
Instance: Fall7-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 7: Mammographie bilateral"
Description: "Mammographie bilateral mit Herdbefund rechts BI-RADS 5"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* effectiveDateTime = "2025-03-03"

* result[+] = Reference(Observation/Fall7-BiRADS-Rechts)

* conclusion = "BI-RADS 5 rechts, 28 mm Herdbefund, irregulär. BI-RADS 1 links."


// --- BI-RADS Observation ---
Instance: Fall7-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 7: BI-RADS 5 rechts"
Description: "BI-RADS 5 Befund der rechten Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* effectiveDateTime = "2025-03-03"

* bodySite = $SCT#73056007 "Right breast structure"

* valueCodeableConcept.coding = $SCT#397145000 "BI-RADS assessment category 5"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Herdbefund rechts, 28 mm, irregulär, kein Nachweis suspekter axillärer LK"


// --- Bildgebung Sonographie ---
Instance: Fall7-Bildgebung-Sonographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 7: Sonographie bilateral"
Description: "Sonographie bilateral mit Herdbefund rechts, keine suspekten LK"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[ultrasound].system = "http://loinc.org"
* code.coding[ultrasound].code = #18740-1
* code.coding[ultrasound].display = "Ultrasound of bilateral breasts"
* code.text = "Sonographie bilateral"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* effectiveDateTime = "2025-03-03"

* conclusion = "Hypoechogener Herdbefund rechts, 26 mm, unscharf begrenzt. Axilläre Lymphknoten beidseits unauffällig."


// --- Pathologie Befund ---
Instance: Fall7-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 7: Pathologie — Invasives Karzinom NST, G3, TNBC"
Description: "Pathologischer Befund: invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 65%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-003456"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-03-07"
* issued = "2025-03-10T14:00:00+01:00"

* performer.display = "Institut für Pathologie, Uniklinik Köln"

* specimen = Reference(Specimen/Fall7-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall7-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 1+), Ki-67 65%. Triple-negativ."


Instance: Fall7-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 7: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* effectiveDateTime = "2025-03-10"
* valueString = "Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2- Score 1+, Ki-67 65%, triple-negativ"


// --- Pathologie Präparat ---
Instance: Fall7-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 7: Stanzbiopsie-Präparat rechts"
Description: "Stanzbiopsie aus der rechten Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-003456-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust"
* collection.collectedDateTime = "2025-03-07"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Tumorboard ---
Instance: Fall7-Tumorboard
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 7: Tumorboard — Neoadjuvante Therapie empfohlen"
Description: "Empfehlung: neoadjuvante Carboplatin/Paclitaxel → EC, dann BET + SLNB, adjuvante RT"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Kathrin Mueller"
* description = "Empfehlung: Neoadjuvante Chemotherapie Carboplatin/Paclitaxel wöchentlich x12, dann EC q3w x4. Dann BET rechts + SLNB. Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy. Keine endokrine Therapie (triple-negativ)."

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)
* period.start = "2025-03-14"

* addresses = Reference(Condition/Fall7-Diagnose-Mammakarzinom)

* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code.text = "Neoadjuvant: Carboplatin/Paclitaxel weekly x12, dann EC q3w x4"
* activity[chemotherapy].detail.status = #scheduled

* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code.text = "BET rechts + Sentinel-LK-Biopsie"
* activity[operativeTherapy].detail.status = #scheduled

* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[radiotherapy].detail.code.text = "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy"
* activity[radiotherapy].detail.status = #scheduled

* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[endocrineTherapy].detail.code.text = "Keine endokrine Therapie (triple-negativ)"
* activity[endocrineTherapy].detail.status = #not-started
* activity[endocrineTherapy].detail.doNotPerform = true


// --- Neoadjuvante Systemtherapie ---
Instance: Fall7-Systemtherapie-Neoadjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 7: Neoadjuvante Carboplatin/Paclitaxel → EC"
Description: "Neoadjuvante Therapie: Carboplatin/Paclitaxel weekly x12, dann EC q3w x4"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-54
* code.coding[=].display = "Chemotherapie"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* performedPeriod.start = "2025-03-24"
* performedPeriod.end = "2025-08-10"

* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#E "reguläres Ende"
* outcome.text = "Therapie planmäßig abgeschlossen, klinisch komplette Remission"

* reasonReference = Reference(Condition/Fall7-Diagnose-Mammakarzinom)

* usedCode.text = "Carboplatin AUC2 + Paclitaxel 80 mg/m2 wöchentlich x12, dann Epirubicin 90 mg/m2 + Cyclophosphamid 600 mg/m2 q3w x4"


// --- Medikation: Carboplatin ---
Instance: Fall7-Medikation-Carboplatin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 7: Carboplatin, Zyklus 1, Tag 1"
Description: "Einzelgabe Carboplatin im Rahmen der neoadjuvanten Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#386905002 "Carboplatin"
* medicationCodeableConcept.text = "Carboplatin"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* dateAsserted = "2025-03-24"
* effectivePeriod.start = "2025-03-24"
* effectivePeriod.end = "2025-03-24"

* partOf = Reference(Procedure/Fall7-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.text = "Carboplatin AUC 2"

* reasonReference = Reference(Condition/Fall7-Diagnose-Mammakarzinom)


// --- Medikation: Paclitaxel ---
Instance: Fall7-Medikation-Paclitaxel
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 7: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1"
Description: "Einzelgabe Paclitaxel im Rahmen der neoadjuvanten Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#387374002 "Paclitaxel"
* medicationCodeableConcept.text = "Paclitaxel"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* dateAsserted = "2025-03-24"
* effectivePeriod.start = "2025-03-24"
* effectivePeriod.end = "2025-03-24"

* partOf = Reference(Procedure/Fall7-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-03-24"
* dosage.doseAndRate.doseQuantity.value = 80
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

* reasonReference = Reference(Condition/Fall7-Diagnose-Mammakarzinom)


// --- Medikation: Epirubicin (EC-Phase) ---
Instance: Fall7-Medikation-Epirubicin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 7: Epirubicin 90 mg/m2, Zyklus 1 (EC), Tag 1"
Description: "Einzelgabe Epirubicin im Rahmen der neoadjuvanten EC-Phase"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#417916005 "Epirubicin"
* medicationCodeableConcept.text = "Epirubicin"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* dateAsserted = "2025-06-23"
* effectivePeriod.start = "2025-06-23"
* effectivePeriod.end = "2025-06-23"

* partOf = Reference(Procedure/Fall7-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-06-23"
* dosage.doseAndRate.doseQuantity.value = 90
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

* reasonReference = Reference(Condition/Fall7-Diagnose-Mammakarzinom)


// --- Operation ---
Instance: Fall7-Operation-BET
InstanceOf: Senologie_Operation
Title: "Fall 7: BET rechts + SLNB"
Description: "Brusterhaltende Therapie rechts mit SLNB, ypT0 ypN0(sn)(0/2) = pCR, R0"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#392022002 "Excision of mass"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a1
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma: Lumpektomie mit axillärer Lymphknotenexzision"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Sentinel-Lymphonodektomie"
* code.text = "BET rechts, Sentinel-LK-Biopsie"

* bodySite = $SCT#73056007 "Right breast structure"

* performedDateTime = "2025-09-02"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* reasonReference = Reference(Condition/Fall7-Diagnose-Mammakarzinom)

* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "ypT0 ypN0(sn)(0/2) — pathologische Komplettremission (pCR), R0"


// --- Strahlentherapie ---
Instance: Fall7-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 7: Adjuvante Bestrahlung 50 Gy + Boost 16 Gy"
Description: "Adjuvante Ganzbrustbestrahlung rechts mit Boost auf Tumorbett"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger, intensitätsmodulierte Radiotherapie: Mit bildgestützter Bestrahlungsplanung"

* subject = Reference(Patient/Fall7-Patient-Kathrin-Mueller)

* performedPeriod.start = "2025-10-06"
* performedPeriod.end = "2025-11-21"

* bodySite = $SCT#73056007 "Right breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 33
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall7-Diagnose-Mammakarzinom)

* note.text = "Ganzbrust rechts 50 Gy in 25 Fraktionen + Boost 16 Gy in 8 Fraktionen auf ehemaliges Tumorbett, Gesamtdosis 66 Gy"
