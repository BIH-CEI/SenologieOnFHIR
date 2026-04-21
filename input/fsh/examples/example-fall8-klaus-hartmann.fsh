// ============================================================
// Fall 8: Klaus Hartmann — Männliches Mammakarzinom, HR+/HER2-
// Invasives Karzinom NST rechts, cT2 pN0(sn)(0/3) cM0, UICC IIA
// ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%
// Mastektomie rechts + SLNB → R0
// Adjuvant RT Thoraxwand, Tamoxifen (Standard bei Männern)
// ============================================================

// --- Patient ---
Instance: Fall8-Patient-Klaus-Hartmann
InstanceOf: Patient
Title: "Fall 8: Patient Klaus Hartmann"
Description: "Synthetischer Testpatient — männliches Mammakarzinom rechts, HR+/HER2-, UICC IIA"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-008"
* name.family = "Hartmann"
* name.given = "Klaus"
* gender = #male
* birthDate = "1956-02-11"
* address.city = "Dresden"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall8-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 8: Mammakarzinom rechts, cT2 pN0(sn) cM0"
Description: "Invasives Mammakarzinom NST rechts, zentraler Drüsenkörper, männlich, UICC IIA"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

// Diagnosekode
* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.1
* code.coding[icd10-gm].display = "Bösartige Neubildung: Zentraler Drüsenkörper der Brustdrüse"
* code.text = "Invasives Mammakarzinom NST rechts, zentraler Drüsenkörper, männlich"

// Seite
* bodySite.coding = $SCT#73056007 "Right breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2025-06-10"

// Onset
* onsetDateTime = "2025-06-10"

// Stadium — cT2 pN0(sn)(0/3) cM0, UICC IIA
* stage[+].summary.text = "UICC IIA (cT2 pN0(sn)(0/3) cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

// Patient
* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)
* recordedDate = "2025-06-10"


// --- Bildgebung Mammographie ---
Instance: Fall8-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 8: Mammographie rechts"
Description: "Mammographie mit suspektem Herdbefund rechts BI-RADS 5"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)
* effectiveDateTime = "2025-06-10"

* result[+] = Reference(Observation/Fall8-BiRADS-Rechts)

* conclusion = "BI-RADS 5 rechts retromamillär, unscharf begrenzter Herdbefund 28 mm"


// --- BI-RADS Observation ---
Instance: Fall8-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 8: BI-RADS 5 rechts"
Description: "BI-RADS 5 Befund der rechten Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)
* effectiveDateTime = "2025-06-10"

* bodySite = $SCT#73056007 "Right breast structure"

* valueCodeableConcept.coding = $SCT#397145000 "Mammography assessment (Category 5) - Highly suggestive of malignancy"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Retromamillärer Herdbefund rechts, 28 mm, unscharf begrenzt, bei männlichem Patienten"


// --- Bildgebung Sonographie ---
Instance: Fall8-Bildgebung-Sonographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 8: Sonographie rechts"
Description: "Sonographie mit hypoechogenem Herdbefund rechts retromamillär"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[ultrasound].system = "http://loinc.org"
* code.coding[ultrasound].code = #18740-1
* code.coding[ultrasound].display = "Ultrasound of bilateral breasts"
* code.text = "Sonographie rechts"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)
* effectiveDateTime = "2025-06-10"

* conclusion = "Hypoechogener Herdbefund rechts retromamillär, 26 mm, unscharf begrenzt. Axilläre Lymphknoten rechts unauffällig."


// --- Pathologie Befund ---
Instance: Fall8-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 8: Pathologie — Invasives Karzinom NST, G2, HR+/HER2-"
Description: "Pathologischer Befund: Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-000801"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-06-15"
* issued = "2025-06-18T14:00:00+02:00"

* performer.display = "Institut für Pathologie, Universitätsklinikum Dresden"

* specimen = Reference(Specimen/Fall8-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall8-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%"


Instance: Fall8-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 8: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)
* effectiveDateTime = "2025-06-18"
* valueString = "Invasives Karzinom NST, G2, pT2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18%"


// --- Pathologie Präparat ---
Instance: Fall8-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 8: Stanzbiopsie-Präparat rechts retromamillär"
Description: "Stanzbiopsie aus dem retromamillären Bereich der rechten Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-000801-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust, retromamillär"
* collection.collectedDateTime = "2025-06-15"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Operation: Mastektomie rechts + SLNB ---
Instance: Fall8-Operation-Mastektomie
InstanceOf: Senologie_Operation
Title: "Fall 8: Mastektomie rechts + SLNB"
Description: "Mastektomie rechts (Standard bei männlichem Mammakarzinom) + Sentinel-LK-Biopsie, R0, pN0(sn)(0/3)"
Usage: #example

* status = #completed

// Intention
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Art der Operation
* category = $SCT#172043006 "Simple mastectomy"

// OPS-Code Mastektomie
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-872
* code.coding[=].display = "(Modifizierte radikale) Mastektomie"
* code.text = "Mastektomie rechts"

// Lateralität
* bodySite = $SCT#73056007 "Right breast structure"

// Zeitpunkt
* performedDateTime = "2025-07-01"

// Patient
* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Fall8-Diagnose-Mammakarzinom)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "R0-Resektion"


// --- SLNB (Sub-Prozedur) ---
Instance: Fall8-Operation-SLNB
InstanceOf: Senologie_Operation
Title: "Fall 8: Sentinel-Lymphknoten-Biopsie rechts"
Description: "SLNB als Subprozedur der Mastektomie"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#234262008 "Excision of axillary lymph node"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Mit Radionuklidmarkierung (Sentinel-Lymphonodektomie)"
* code.text = "Sentinel-Lymphknoten-Biopsie"

* bodySite = $SCT#73056007 "Right breast structure"
* performedDateTime = "2025-07-01"
* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)
* reasonReference = Reference(Condition/Fall8-Diagnose-Mammakarzinom)

// Sub-procedure of main OP
* partOf = Reference(Procedure/Fall8-Operation-Mastektomie)

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "Sentinel-LK negativ pN0(sn)(0/3)"


// --- Strahlentherapie ---
Instance: Fall8-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 8: Adjuvante Bestrahlung Thoraxwand rechts 50 Gy"
Description: "Adjuvante Thoraxwandbestrahlung rechts nach Mastektomie"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)

* performedPeriod.start = "2025-08-04"
* performedPeriod.end = "2025-09-05"

* bodySite.coding[+] = $SCT#78904004 "Chest wall structure"
* bodySite.text = "Thoraxwand rechts"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall8-Diagnose-Mammakarzinom)

* note.text = "Thoraxwand rechts 50 Gy in 25 Fraktionen"


// --- Begleitmedikation Tamoxifen ---
Instance: Fall8-Begleitmedikation-Tamoxifen
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 8: Endokrine Therapie Tamoxifen 20 mg"
Description: "Tamoxifen 20 mg/d — Standard bei männlichem Mammakarzinom (NICHT Aromataseinhibitor)"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#373345002 "Tamoxifen"
* medicationCodeableConcept.text = "Tamoxifen 20 mg"

* subject = Reference(Patient/Fall8-Patient-Klaus-Hartmann)

* effectivePeriod.start = "2025-09-15"

* dateAsserted = "2025-07-15"

* dosage.text = "1x täglich 20 mg, Dauer 5 Jahre (Standard bei männlichem Mammakarzinom)"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d
* dosage.doseAndRate.doseQuantity.value = 20
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg
