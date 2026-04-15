// ============================================================
// Fall 9: Andrea Wolf — HR+/HER2-, Stadium IIIC, LK-positiv
// Invasives lobuläres Karzinom links, cT2 pN3a(12/18) cM0
// ER+ IRS 12, PR+ IRS 10, HER2-, Ki-67 20%
// Adjuvant Chemo EC×4 → Paclitaxel×12 wöchentlich
// BET links + Axilladissektion → R0
// Komplikation: Lymphödem Arm links, Clavien-Dindo Grad II
// Adjuvant RT 50 Gy + Boost + Lymphabfluss
// Endokrin: Tamoxifen → AI + GnRH
// ============================================================

// --- Patient ---
Instance: Fall9-Patient-Andrea-Wolf
InstanceOf: Patient
Title: "Fall 9: Patientin Andrea Wolf"
Description: "Synthetische Testpatientin — lobuläres Mammakarzinom links, UICC IIIC, LK-positiv, Komplikation"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-009"
* name.family = "Wolf"
* name.given = "Andrea"
* gender = #female
* birthDate = "1974-05-29"
* address.city = "Stuttgart"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall9-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 9: Lobuläres Mammakarzinom links, cT2 pN3a cM0"
Description: "Invasives lobuläres Mammakarzinom links, G2, UICC IIIC, pN3a(12/18)"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

// Diagnosekode
* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.4
* code.coding[icd10-gm].display = "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.text = "Invasives lobuläres Mammakarzinom links, oberer äußerer Quadrant"

// Seite
* bodySite.coding = $SCT#80248007 "Left breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2025-04-02"

// Onset
* onsetDateTime = "2025-04-02"

// Stadium — cT2 pN3a(12/18) cM0, UICC IIIC
* stage[+].summary.text = "UICC IIIC (cT2 pN3a(12/18) cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

// Patient
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* recordedDate = "2025-04-02"


// --- Bildgebung Mammographie ---
Instance: Fall9-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 9: Mammographie bilateral"
Description: "Mammographie bilateral mit Herdbefund links OAQ"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* effectiveDateTime = "2025-04-02"

* result[+] = Reference(Observation/Fall9-BiRADS-Links)

* conclusion = "BI-RADS 5 links OAQ, architekturgestörter Herdbefund 30 mm, BI-RADS 1 rechts"


// --- BI-RADS Observation ---
Instance: Fall9-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 9: BI-RADS 5 links"
Description: "BI-RADS 5 Befund der linken Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* effectiveDateTime = "2025-04-02"

* bodySite = $SCT#80248007 "Left breast structure"

* valueCodeableConcept.coding = $SCT#397143000 "BI-RADS assessment category 5"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Architekturgestörter Herdbefund links OAQ, 30 mm, lobulär imponierend, suspekte axilläre LK links"


// --- Pathologie Befund ---
Instance: Fall9-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 9: Pathologie — Invasives lobuläres Karzinom, G2, HR+/HER2-"
Description: "Pathologischer Befund: Invasives lobuläres Karzinom, G2, ER+ IRS 12, PR+ IRS 10, HER2-, Ki-67 20%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-000901"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-04-08"
* issued = "2025-04-11T10:00:00+02:00"

* performer.display = "Institut für Pathologie, Universitätsklinikum Stuttgart"

* specimen = Reference(Specimen/Fall9-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall9-Patho-Conclusion)

* conclusion = "Invasives lobuläres Karzinom, G2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%"


Instance: Fall9-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 9: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* effectiveDateTime = "2025-04-11"
* valueString = "Invasives lobuläres Karzinom, G2, pT2, ER+ IRS 12, PR+ IRS 10, HER2- Score 0, Ki-67 20%, E-Cadherin negativ"


// --- Pathologie Präparat ---
Instance: Fall9-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 9: Stanzbiopsie-Präparat links OAQ"
Description: "Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-000901-A"

* status = #available

* type.coding[sct] = $SCT#122573003 "Core needle biopsy specimen"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, oberer äußerer Quadrant"
* collection.collectedDateTime = "2025-04-08"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Tumorboard ---
Instance: Fall9-Tumorboard
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 9: Tumorboard-Empfehlung"
Description: "Empfehlung: adjuvante Chemotherapie EC→Paclitaxel, BET + Axilladissektion, RT, endokrine Therapie"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Andrea Wolf"
* description = "Empfehlung: Adjuvante Chemotherapie (EC x4 → Paclitaxel wöchentlich x12) aufgrund N3a-Befall, BET links + Axilladissektion Level I-III, adjuvante Strahlentherapie inkl. Lymphabfluss, endokrine Therapie Tamoxifen (prämenopausal)."

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* period.start = "2025-04-15"

* addresses = Reference(Condition/Fall9-Diagnose-Mammakarzinom)

// Chemotherapie
* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code.text = "Adjuvant: EC q3w x4 → Paclitaxel wöchentlich x12"
* activity[chemotherapy].detail.status = #scheduled

// Operative Therapie
* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code.text = "BET links + Axilladissektion Level I-III"
* activity[operativeTherapy].detail.status = #scheduled

// Strahlentherapie
* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code.text = "Adjuvante Bestrahlung Restbrust 50 Gy + Boost 10 Gy + Lymphabflusswege"
* activity[radiotherapy].detail.status = #scheduled

// Endokrine Therapie
* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code.text = "Tamoxifen (prämenopausal), nach 2 J. Umstellung auf AI + GnRH"
* activity[endocrineTherapy].detail.status = #scheduled


// --- Adjuvante Systemtherapie ---
Instance: Fall9-Systemtherapie-Adjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 9: Adjuvante Chemotherapie EC → Paclitaxel"
Description: "Adjuvante Chemotherapie EC q3w x4 → Paclitaxel wöchentlich x12"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-54
* code.coding[=].display = "Chemotherapie"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* performedPeriod.start = "2025-04-28"
* performedPeriod.end = "2025-09-15"

* outcome.text = "Chemotherapie planmäßig abgeschlossen"

* reasonReference = Reference(Condition/Fall9-Diagnose-Mammakarzinom)

* usedCode.text = "EC (Epirubicin/Cyclophosphamid) q3w x4, dann Paclitaxel 80 mg/m2 wöchentlich x12"


// --- Medikation: Epirubicin ---
Instance: Fall9-Medikation-Epirubicin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 9: Epirubicin, Zyklus 1, Tag 1"
Description: "Einzelgabe Epirubicin im Rahmen der adjuvanten EC-Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#387215009 "Epirubicin"
* medicationCodeableConcept.text = "Epirubicin"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* dateAsserted = "2025-04-28"
* effectivePeriod.start = "2025-04-28"
* effectivePeriod.end = "2025-04-28"

* partOf = Reference(Procedure/Fall9-Systemtherapie-Adjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.text = "Epirubicin 90 mg/m2"

* reasonReference = Reference(Condition/Fall9-Diagnose-Mammakarzinom)


// --- Medikation: Paclitaxel ---
Instance: Fall9-Medikation-Paclitaxel
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 9: Paclitaxel 80 mg/m2 wöchentlich, Woche 1"
Description: "Einzelgabe Paclitaxel im Rahmen der adjuvanten wöchentlichen Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#387374002 "Paclitaxel"
* medicationCodeableConcept.text = "Paclitaxel"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* dateAsserted = "2025-07-07"
* effectivePeriod.start = "2025-07-07"
* effectivePeriod.end = "2025-07-07"

* partOf = Reference(Procedure/Fall9-Systemtherapie-Adjuvant)

* extension[therapyCycle].valueInteger = 5
* extension[dayInCycle].valueInteger = 1

* dosage.doseAndRate.doseQuantity.value = 80
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

* reasonReference = Reference(Condition/Fall9-Diagnose-Mammakarzinom)


// --- Operation: BET + Axilladissektion ---
Instance: Fall9-Operation-BET
InstanceOf: Senologie_Operation
Title: "Fall 9: BET links + Axilladissektion Level I-III"
Description: "Brusterhaltende Therapie links + Axilladissektion Level I-III, R0, pN3a(12/18)"
Usage: #example

* status = #completed

// Intention
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Art der Operation
* category = $SCT#392022002 "Breast-conserving surgery"

// OPS-Code BET
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a1
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma: Lumpektomie mit axillärer Lymphknotenexzision"
// OPS-Code Axilladissektion
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-402.12
* code.coding[=].display = "Regionale Lymphadenektomie: Axillär: Level I-III"
* code.text = "BET links, Axilladissektion Level I-III"

// Lateralität
* bodySite = $SCT#80248007 "Left breast structure"

// Zeitpunkt
* performedDateTime = "2025-10-01"

// Patient
* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Fall9-Diagnose-Mammakarzinom)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage device"
* followUp[drainage].text = "Redon-Drainage 10 Ch x2 (Brust + Axilla)"
* followUp[verband].coding = $SCT#262171009 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

// Outcome
* outcome.text = "R0-Resektion, pN3a (12/18 LK befallen)"


// --- Operative Komplikation: Lymphödem ---
Instance: Fall9-Komplikation-Lymphoedem
InstanceOf: Senologie_Operative_Komplikation
Title: "Fall 9: Postoperative Komplikation — Lymphödem Arm links, Clavien-Dindo II"
Description: "Lymphödem Arm links nach Axilladissektion, Clavien-Dindo Grad II"
Usage: #example

* status = #final

* code.coding = $SCT#789279006 "Clavien-Dindo complication grade (observable entity)"

* valueCodeableConcept.text = "Clavien-Dindo Grad II"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)
* effectiveDateTime = "2025-10-20"

* method.text = "postoperativ, ambulant"

* focus = Reference(Procedure/Fall9-Operation-BET)

* component[komplikationsart].code = $SCT#116224001 "Complication of procedure"
* component[komplikationsart].valueCodeableConcept = $SCT#95321009 "Lymphedema of upper limb"
* component[komplikationsart].valueCodeableConcept.text = "Lymphödem Arm links"

* note.text = "Lymphödem Arm links nach Axilladissektion Level I-III (12/18 LK befallen). Konservative Therapie mit Kompressionswickelung und Lymphdrainage."


// --- Strahlentherapie ---
Instance: Fall9-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 9: Adjuvante Bestrahlung 50 Gy + Boost + Lymphabfluss"
Description: "Adjuvante Bestrahlung Restbrust links 50 Gy + Boost 10 Gy + Lymphabflusswege"
Usage: #example

* status = #completed

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger, intensitätsmodulierte Radiotherapie: Mit bildgestützter Bestrahlungsplanung"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* performedPeriod.start = "2025-11-03"
* performedPeriod.end = "2025-12-19"

* bodySite = $SCT#80248007 "Left breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 33
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall9-Diagnose-Mammakarzinom)

* note.text = "Restbrust links 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf Tumorbett + Lymphabflusswege (axillär, supraklavikulär) 50 Gy. 3 zusätzliche Fraktionen wegen Lymphabfluss."


// --- Begleitmedikation Tamoxifen ---
Instance: Fall9-Begleitmedikation-Tamoxifen
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 9: Endokrine Therapie Tamoxifen 20 mg (initial, prämenopausal)"
Description: "Tamoxifen 20 mg/d, prämenopausal, nach 2 Jahren Umstellung auf AI + GnRH geplant"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#373345002 "Tamoxifen"
* medicationCodeableConcept.text = "Tamoxifen 20 mg"

* subject = Reference(Patient/Fall9-Patient-Andrea-Wolf)

* effectivePeriod.start = "2026-01-05"

* dateAsserted = "2025-12-20"

* dosage.text = "1x täglich 20 mg, initial prämenopausal, nach 2 Jahren Umstellung auf Aromataseinhibitor + GnRH-Agonist geplant"
* dosage.doseAndRate.doseQuantity.value = 20
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg
