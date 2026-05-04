// ============================================================
// Fall 3: Sabine Weber — HR+/HER2-, Stadium IIA, N1
// Invasives Karzinom NST rechts, cT2 pN1a(2/12) cM0, UICC IIA
// ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%
// Mastektomie rechts + Axilladissektion → R0
// Adjuvant RT Thoraxwand 50 Gy + Anastrozol
// ============================================================

// --- Patient ---
Instance: Fall3-Patient-Sabine-Weber
InstanceOf: Patient
Title: "Fall 3: Patientin Sabine Weber"
Description: "Synthetische Testpatientin — HR+/HER2- Mammakarzinom, Stadium IIA, N1"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-003"
* name.family = "Weber"
* name.given = "Sabine"
* gender = #female
* birthDate = "1953-07-15"
* address.city = "Berlin"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall3-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 3: Mammakarzinom rechts, cT2 pN1a cM0"
Description: "Invasives Mammakarzinom NST der rechten Brust, UICC IIA, HR+/HER2-"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.9
* code.coding[icd10-gm].display = "Bösartige Neubildung: Brustdrüse, nicht näher bezeichnet"
* code.text = "Invasives Mammakarzinom NST rechts"

* bodySite.coding = $SCT#73056007 "Right breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-03-10"
* onsetDateTime = "2025-03-10"

* stage[+].summary.text = "UICC IIA (cT2 pN1a(2/12) cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)
* recordedDate = "2025-03-10"


// --- Bildgebung Mammographie ---
Instance: Fall3-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 3: Mammographie bilateral"
Description: "Mammographie bilateral mit suspektem Herdbefund rechts BI-RADS 4"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #24606-6
* code.coding[mammography].display = "MG Breast Screening"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)
* effectiveDateTime = "2025-03-10"

* result[+] = Reference(Observation/Fall3-BiRADS-Rechts)

* conclusion = "BI-RADS 4 rechts, 28 mm Herdbefund, unscharf begrenzt. BI-RADS 1 links."


// --- BI-RADS Observation ---
Instance: Fall3-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 3: BI-RADS 4 rechts"
Description: "BI-RADS 4 Befund der rechten Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)
* effectiveDateTime = "2025-03-10"

* bodySite = $SCT#73056007 "Right breast structure"

* valueCodeableConcept.coding = $SCT#397144001 "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
* valueCodeableConcept.text = "BI-RADS 4 — suspekt"

* note.text = "Herdbefund rechts, 28 mm, unscharf begrenzt, Verdacht auf Malignität"


// --- Pathologie Befund ---
Instance: Fall3-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 3: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-"
Description: "Pathologischer Befund: invasives Karzinom NST, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-000789"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-03-15"
* issued = "2025-03-18T14:00:00+01:00"

* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

* specimen = Reference(Specimen/Fall3-Pathologie-Praeparat-Stanze)

* result[diagnostic-conclusion] = Reference(Observation/Fall3-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%"


Instance: Fall3-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 3: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)
* effectiveDateTime = "2025-03-18"
* valueString = "Invasives Karzinom NST, G2, pT2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%"


// --- Pathologie Präparat Stanzbiopsie ---
Instance: Fall3-Pathologie-Praeparat-Stanze
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 3: Stanzbiopsie-Präparat rechts"
Description: "Stanzbiopsie aus der rechten Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-000789-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust"
* collection.collectedDateTime = "2025-03-15"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Pathologie Befund OP-Präparat ---
Instance: Fall3-Pathologie-Befund-OP
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 3: Pathologie OP-Präparat — pT2 pN1a(2/12)"
Description: "Pathologischer Befund des Mastektomie-Präparats mit Axilladissektion"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-000790"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* basedOn.display = "Anforderung Histologie — Mastektomie-Präparat"

* effectiveDateTime = "2025-04-08"
* issued = "2025-04-11T10:00:00+02:00"

* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

* specimen = Reference(Specimen/Fall3-Pathologie-Praeparat-OP)

* result[diagnostic-conclusion] = Reference(Observation/Fall3-Patho-Conclusion-OP)

* conclusion = "Mastektomie: Invasives Karzinom NST, pT2, pN1a (2/12 LK), G2, R0. ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12%."


Instance: Fall3-Patho-Conclusion-OP
InstanceOf: Observation
Title: "Fall 3: Pathologische Diagnose OP-Präparat"
Description: "Diagnostische Schlussfolgerung OP-Präparat"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)
* effectiveDateTime = "2025-04-11"
* valueString = "Invasives Karzinom NST, pT2, pN1a (2/12 LK positiv), G2, R0"


// --- Pathologie Präparat OP ---
Instance: Fall3-Pathologie-Praeparat-OP
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 3: Mastektomie-Präparat rechts"
Description: "Mastektomie-Resektat rechte Brust mit Axilla-Lymphknoten"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-000790-A"

* status = #available

* type.coding[sct] = $SCT#122600000 "Specimen from breast obtained by modified radical mastectomy"
* type.text = "Mastektomie-Präparat"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust, Mastektomie mit Axilladissektion"
* collection.collectedDateTime = "2025-04-08"
* collection.method = $SCT#5884001 "Mastectomy"


// --- Operation ---
Instance: Fall3-Operation-Mastektomie
InstanceOf: Senologie_Operation
Title: "Fall 3: Mastektomie rechts + Axilladissektion"
Description: "Mastektomie rechts mit Axilladissektion Level I-II, R0, pN1a(2/12)"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#172043006 "Simple mastectomy"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-872
* code.coding[=].display = "(Modifizierte radikale) Mastektomie"
* code.text = "Mastektomie rechts"

* bodySite = $SCT#73056007 "Right breast structure"

* performedDateTime = "2025-04-08"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* reasonReference = Reference(Condition/Fall3-Diagnose-Mammakarzinom)

* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 12 Ch x2"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband Thoraxwand"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "R0-Resektion, pT2"


// --- Axilladissektion (Sub-Prozedur) ---
Instance: Fall3-Operation-Axilladissektion
InstanceOf: Senologie_Operation
Title: "Fall 3: Axilladissektion rechts Level I-II"
Description: "Axilladissektion als Subprozedur der Mastektomie"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#234262008 "Excision of axillary lymph node"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-402.11
* code.coding[=].display = "Regionale Lymphadenektomie (Ausräumung mehrerer Lymphknoten einer Region) als selbständiger Eingriff: Axillär: Level 1"
* code.text = "Axilladissektion Level I-II"

* bodySite = $SCT#73056007 "Right breast structure"
* performedDateTime = "2025-04-08"
* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)
* reasonReference = Reference(Condition/Fall3-Diagnose-Mammakarzinom)

// Sub-procedure of main OP
* partOf = Reference(Procedure/Fall3-Operation-Mastektomie)

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "pN1a (2/12 LK positiv)"


// --- Strahlentherapie ---
Instance: Fall3-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 3: Adjuvante Bestrahlung Thoraxwand 50 Gy"
Description: "Adjuvante Bestrahlung der Thoraxwand rechts nach Mastektomie"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* performedPeriod.start = "2025-05-12"
* performedPeriod.end = "2025-06-13"

* bodySite.coding[+] = $SCT#78904004 "Chest wall structure"
* bodySite.text = "Thoraxwand rechts"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall3-Diagnose-Mammakarzinom)

* note.text = "Thoraxwand rechts 50 Gy in 25 Fraktionen, kein Boost (nach Mastektomie)"


// --- Begleitmedikation Anastrozol ---
Instance: Fall3-Begleitmedikation-Anastrozol
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 3: Endokrine Therapie Anastrozol 1 mg"
Description: "Anastrozol 1 mg/d als adjuvante endokrine Therapie"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#386910003 "Anastrozole"
* medicationCodeableConcept.text = "Anastrozol 1 mg"

* subject = Reference(Patient/Fall3-Patient-Sabine-Weber)

* effectivePeriod.start = "2025-06-20"

* dateAsserted = "2025-06-20"

* dosage.text = "1x täglich"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d
* dosage.doseAndRate.doseQuantity.value = 1
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg
