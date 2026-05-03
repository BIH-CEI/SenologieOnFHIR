// ============================================================
// Fall 4: Julia Fischer — HER2+, Stadium IIB, neoadjuvant, pCR
// Invasives Karzinom NST links, cT2 cN1 cM0, UICC IIB
// ER- PR- HER2+ (FISH amplifiziert), Ki-67 45%, G3
// Neoadjuvant TCHP → BET + SLNB → ypT0 ypN0 (pCR), R0
// Adjuvant Trastuzumab + Pertuzumab + RT
// ============================================================

// --- Patient ---
Instance: Fall4-Patient-Julia-Fischer
InstanceOf: Patient
Title: "Fall 4: Patientin Julia Fischer"
Description: "Synthetische Testpatientin — HER2+ Mammakarzinom, neoadjuvant TCHP, pCR"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-004"
* name.family = "Fischer"
* name.given = "Julia"
* gender = #female
* birthDate = "1987-11-22"
* address.city = "München"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall4-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 4: HER2+ Mammakarzinom links, cT2 cN1 cM0"
Description: "Invasives Mammakarzinom NST links, HER2+, UICC IIB"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.9
* code.coding[icd10-gm].display = "Bösartige Neubildung: Brustdrüse, nicht näher bezeichnet"
* code.text = "Invasives Mammakarzinom NST links, HER2-positiv (FISH amplifiziert)"

* bodySite.coding = $SCT#80248007 "Left breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-02-20"
* onsetDateTime = "2025-02-20"

* stage[+].summary.text = "UICC IIB (cT2 cN1 cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* recordedDate = "2025-02-20"


// --- Bildgebung Mammographie ---
Instance: Fall4-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 4: Mammographie bilateral"
Description: "Mammographie bilateral mit Herdbefund links BI-RADS 5"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #24606-6
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* effectiveDateTime = "2025-02-18"

* result[+] = Reference(Observation/Fall4-BiRADS-Links)

* conclusion = "BI-RADS 5 links, 32 mm Herdbefund, irregulär. BI-RADS 1 rechts."


// --- BI-RADS Observation ---
Instance: Fall4-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 4: BI-RADS 5 links"
Description: "BI-RADS 5 Befund der linken Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* effectiveDateTime = "2025-02-18"

* bodySite = $SCT#80248007 "Left breast structure"

* valueCodeableConcept.coding = $SCT#397145000 "Mammography assessment (Category 5) - Highly suggestive of malignancy"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Herdbefund links, 32 mm, irregulär, suspekte axilläre LK links"


// --- Bildgebung Sonographie ---
Instance: Fall4-Bildgebung-Sonographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 4: Sonographie bilateral"
Description: "Sonographie bilateral mit Herdbefund links und suspekten axillären LK"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[ultrasound].system = "http://loinc.org"
* code.coding[ultrasound].code = #24601-7
* code.coding[ultrasound].display = "Ultrasound of bilateral breasts"
* code.text = "Sonographie bilateral"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* effectiveDateTime = "2025-02-18"

* conclusion = "Hypoechogener Herdbefund links, 30 mm, unscharf begrenzt. Suspekter axillärer LK links, 18 mm."


// --- Pathologie Befund ---
Instance: Fall4-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 4: Pathologie — Invasives Karzinom NST, G3, HER2+"
Description: "Pathologischer Befund: invasives Karzinom NST, G3, ER- PR- HER2+ (FISH amplifiziert), Ki-67 45%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001234"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-02-22"
* issued = "2025-02-25T11:00:00+01:00"

* performer.display = "Institut für Pathologie, LMU Klinikum München"

* specimen = Reference(Specimen/Fall4-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall4-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 positiv (Score 3+, FISH amplifiziert), Ki-67 45%"


Instance: Fall4-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 4: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* effectiveDateTime = "2025-02-25"
* valueString = "Invasives Karzinom NST, G3, ER- IRS 0, PR- IRS 0, HER2+ Score 3+ (FISH amplifiziert), Ki-67 45%"


// --- Pathologie Präparat ---
Instance: Fall4-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 4: Stanzbiopsie-Präparat links"
Description: "Stanzbiopsie aus der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-001234-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust"
* collection.collectedDateTime = "2025-02-22"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Tumorboard ---
Instance: Fall4-Tumorboard
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 4: Tumorboard — Neoadjuvante Therapie empfohlen"
Description: "Empfehlung: neoadjuvante TCHP, dann BET + SLNB, adjuvant Trastuzumab/Pertuzumab + RT"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Julia Fischer"
* description = "Empfehlung: Neoadjuvante Chemotherapie TCHP (Docetaxel, Carboplatin, Trastuzumab, Pertuzumab) x6 Zyklen. Dann BET + SLNB. Adjuvant: Trastuzumab/Pertuzumab Erhaltung 1 Jahr, Ganzbrustbestrahlung."

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* period.start = "2025-02-28"

* addresses = Reference(Condition/Fall4-Diagnose-Mammakarzinom)

* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code.text = "Neoadjuvant: TCHP (Docetaxel/Carboplatin/Trastuzumab/Pertuzumab) x6"
* activity[chemotherapy].detail.status = #scheduled

* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code.text = "BET links + Sentinel-LK-Biopsie"
* activity[operativeTherapy].detail.status = #scheduled

* activity[targetedTherapy].detail.kind = #MedicationRequest
* activity[targetedTherapy].detail.code = $SCT#416608005 "Drug therapy"
* activity[targetedTherapy].detail.code.text = "Trastuzumab + Pertuzumab Erhaltung 1 Jahr"
* activity[targetedTherapy].detail.status = #scheduled

* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[radiotherapy].detail.code.text = "Adjuvante Ganzbrustbestrahlung"
* activity[radiotherapy].detail.status = #scheduled


// --- Neoadjuvante Systemtherapie ---
Instance: Fall4-Systemtherapie-Neoadjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 4: Neoadjuvante TCHP"
Description: "Neoadjuvante Therapie mit Docetaxel, Carboplatin, Trastuzumab, Pertuzumab"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-54
* code.coding[=].display = "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* performedPeriod.start = "2025-03-10"
* performedPeriod.end = "2025-07-20"

* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#E "reguläres Ende"
* outcome.text = "Therapie planmäßig abgeschlossen, klinisch komplette Remission"

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)

* usedCode = $MII_CS_Onko_Protokolle#TCH "TCH"
* usedCode.text = "TCHP: Docetaxel 75 mg/m2 + Carboplatin AUC6 + Trastuzumab 6 mg/kg + Pertuzumab 420 mg, q3w x6 Zyklen"


// --- Medikation: Docetaxel ---
Instance: Fall4-Medikation-Docetaxel
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 4: Docetaxel 75 mg/m2, Zyklus 1, Tag 1"
Description: "Einzelgabe Docetaxel im Rahmen der neoadjuvanten TCHP"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#386918005 "Docetaxel"
* medicationCodeableConcept.text = "Docetaxel"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* dateAsserted = "2025-03-10"
* effectivePeriod.start = "2025-03-10"
* effectivePeriod.end = "2025-03-10"

* partOf = Reference(Procedure/Fall4-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-03-10"
* dosage.doseAndRate.doseQuantity.value = 75
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)


// --- Medikation: Carboplatin ---
Instance: Fall4-Medikation-Carboplatin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 4: Carboplatin AUC6, Zyklus 1, Tag 1"
Description: "Einzelgabe Carboplatin im Rahmen der neoadjuvanten TCHP"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#386905002 "Carboplatin"
* medicationCodeableConcept.text = "Carboplatin"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* dateAsserted = "2025-03-10"
* effectivePeriod.start = "2025-03-10"
* effectivePeriod.end = "2025-03-10"

* partOf = Reference(Procedure/Fall4-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.text = "Carboplatin AUC 6"

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)


// --- Medikation: Trastuzumab ---
Instance: Fall4-Medikation-Trastuzumab
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 4: Trastuzumab, Zyklus 1, Tag 1"
Description: "Einzelgabe Trastuzumab im Rahmen der neoadjuvanten TCHP"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#784176009 "Trastuzumab-containing product"
* medicationCodeableConcept.text = "Trastuzumab"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* dateAsserted = "2025-03-10"
* effectivePeriod.start = "2025-03-10"
* effectivePeriod.end = "2025-03-10"

* partOf = Reference(Procedure/Fall4-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-03-10"
* dosage.doseAndRate.doseQuantity.value = 8
* dosage.doseAndRate.doseQuantity.unit = "mg/kg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/kg

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)


// --- Medikation: Pertuzumab ---
Instance: Fall4-Medikation-Pertuzumab
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 4: Pertuzumab, Zyklus 1, Tag 1"
Description: "Einzelgabe Pertuzumab im Rahmen der neoadjuvanten TCHP"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#784163009 "Pertuzumab-containing product"
* medicationCodeableConcept.text = "Pertuzumab"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* dateAsserted = "2025-03-10"
* effectivePeriod.start = "2025-03-10"
* effectivePeriod.end = "2025-03-10"

* partOf = Reference(Procedure/Fall4-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-03-10"
* dosage.doseAndRate.doseQuantity.value = 840
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)


// --- Operation ---
Instance: Fall4-Operation-BET
InstanceOf: Senologie_Operation
Title: "Fall 4: BET links + SLNB nach neoadjuvanter Therapie"
Description: "Brusterhaltende Therapie links mit Sentinel-LK-Biopsie, ypT0 ypN0 (pCR), R0"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#392022002 "Excision of mass"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a1
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)"
* code.text = "BET links"

* bodySite = $SCT#80248007 "Left breast structure"

* performedDateTime = "2025-08-12"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)

* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "ypT0 R0 — pathologische Komplettremission (pCR)"


// --- SLNB (Sub-Prozedur) ---
Instance: Fall4-Operation-SLNB
InstanceOf: Senologie_Operation
Title: "Fall 4: Sentinel-Lymphknoten-Biopsie links"
Description: "SLNB als Subprozedur der BET"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#234262008 "Excision of axillary lymph node"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Mit Radionuklidmarkierung (Sentinel-Lymphonodektomie)"
* code.text = "Sentinel-Lymphknoten-Biopsie"

* bodySite = $SCT#80248007 "Left breast structure"
* performedDateTime = "2025-08-12"
* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)
* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)

// Sub-procedure of main OP
* partOf = Reference(Procedure/Fall4-Operation-BET)

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "Sentinel-LK negativ ypN0(sn)(0/3)"


// --- Strahlentherapie ---
Instance: Fall4-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 4: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost"
Description: "Adjuvante Ganzbrustbestrahlung links nach BET"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall4-Patient-Julia-Fischer)

* performedPeriod.start = "2025-09-15"
* performedPeriod.end = "2025-10-24"

* bodySite = $SCT#80248007 "Left breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 30
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall4-Diagnose-Mammakarzinom)

* note.text = "Ganzbrust links 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf ehemaliges Tumorbett"
