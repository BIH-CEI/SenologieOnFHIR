// ============================================================
// Fall 5: Monika Braun — HR+/HER2+, Stadium IIIA
// Invasives Karzinom NST rechts, cT3 cN1 cM0, UICC IIIA
// ER+ IRS 8, PR+ IRS 4, HER2+ (Score 3+), Ki-67 30%, G2
// Neoadjuvant EC → Docetaxel + Trastuzumab → BET + SLNB
// ypT1a ypN0(sn)(0/3), R0
// Adjuvant Trastuzumab 1 Jahr + RT + Letrozol
// ============================================================

// --- Patient ---
Instance: Fall5-Patient-Monika-Braun
InstanceOf: Patient
Title: "Fall 5: Patientin Monika Braun"
Description: "Synthetische Testpatientin — HR+/HER2+ Mammakarzinom, Stadium IIIA, neoadjuvant"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-005"
* name.family = "Braun"
* name.given = "Monika"
* gender = #female
* birthDate = "1970-04-03"
* address.city = "Hamburg"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall5-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 5: HR+/HER2+ Mammakarzinom rechts, cT3 cN1 cM0"
Description: "Invasives Mammakarzinom NST rechts, HR+/HER2+, UICC IIIA"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.9
* code.coding[icd10-gm].display = "Bösartige Neubildung: Brustdrüse, nicht näher bezeichnet"
* code.text = "Invasives Mammakarzinom NST rechts, HR+/HER2+"

* bodySite.coding = $SCT#73056007 "Right breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-01-20"
* onsetDateTime = "2025-01-20"

* stage[+].summary.text = "UICC IIIA (cT3 cN1 cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* recordedDate = "2025-01-20"


// --- Bildgebung Mammographie ---
Instance: Fall5-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 5: Mammographie bilateral"
Description: "Mammographie bilateral mit großem Herdbefund rechts BI-RADS 5"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #24606-6
* code.coding[mammography].display = "MG Breast Screening"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* effectiveDateTime = "2025-01-18"

* result[+] = Reference(Observation/Fall5-BiRADS-Rechts)

* conclusion = "BI-RADS 5 rechts, großer Herdbefund 48 mm, irregulär. BI-RADS 1 links."


// --- BI-RADS Observation ---
Instance: Fall5-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 5: BI-RADS 5 rechts"
Description: "BI-RADS 5 Befund der rechten Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* effectiveDateTime = "2025-01-18"

* bodySite = $SCT#73056007 "Right breast structure"

* valueCodeableConcept.coding = $SCT#397145000 "Mammography assessment (Category 5) - Highly suggestive of malignancy"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Großer Herdbefund rechts, 48 mm, irregulär begrenzt, suspekte axilläre LK rechts"


// --- Bildgebung Sonographie ---
Instance: Fall5-Bildgebung-Sonographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 5: Sonographie bilateral"
Description: "Sonographie bilateral mit Herdbefund rechts und suspekten axillären LK"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[ultrasound].system = "http://loinc.org"
* code.coding[ultrasound].code = #24601-7
* code.coding[ultrasound].display = "US Breast"
* code.text = "Sonographie bilateral"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* effectiveDateTime = "2025-01-18"

* conclusion = "Hypoechogener Herdbefund rechts, 45 mm, unscharf begrenzt, dorsale Schallauslöschung. Suspekter axillärer LK rechts, 15 mm."


// --- Bildgebung MRT ---
Instance: Fall5-Bildgebung-MRT
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 5: MRT Mamma"
Description: "MRT der Brust zur Ausdehnungsbeurteilung bei cT3"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mri].system = "http://loinc.org"
* code.coding[mri].code = #30794-2
* code.coding[mri].display = "MR Breast"
* code.text = "MRT Mamma"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* effectiveDateTime = "2025-01-22"

* conclusion = "KM-anreichernde Raumforderung rechts, 52 mm, unifokal. Kein Nachweis kontralateraler Herde. Suspekte axilläre LK rechts Level I."


// --- Pathologie Befund ---
Instance: Fall5-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 5: Pathologie — Invasives Karzinom NST, G2, HR+/HER2+"
Description: "Pathologischer Befund: invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001567"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-01-24"
* issued = "2025-01-27T09:00:00+01:00"

* performer.display = "Institut für Pathologie, UKE Hamburg"

* specimen = Reference(Specimen/Fall5-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall5-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%"


Instance: Fall5-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 5: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* effectiveDateTime = "2025-01-27"
* valueString = "Invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30%"


// --- Pathologie Präparat ---
Instance: Fall5-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 5: Stanzbiopsie-Präparat rechts"
Description: "Stanzbiopsie aus der rechten Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-001567-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust"
* collection.collectedDateTime = "2025-01-24"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Tumorboard 1: Neoadjuvant ---
Instance: Fall5-Tumorboard-Neoadjuvant
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 5: Tumorboard — Neoadjuvante Therapie"
Description: "Empfehlung: EC → Docetaxel + Trastuzumab neoadjuvant, dann OP, adjuvant Trastuzumab + RT + Letrozol"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Monika Braun — Erstvorstellung"
* description = "Empfehlung: Neoadjuvante Chemotherapie EC x4, dann Docetaxel + Trastuzumab x4. Anschließend BET rechts + SLNB. Adjuvant: Trastuzumab Erhaltung 1 Jahr, Ganzbrustbestrahlung, Letrozol."

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* period.start = "2025-01-30"

* addresses = Reference(Condition/Fall5-Diagnose-Mammakarzinom)

* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code.text = "Neoadjuvant: EC x4, dann Docetaxel + Trastuzumab x4"
* activity[chemotherapy].detail.status = #scheduled

* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code.text = "BET rechts + Sentinel-LK-Biopsie"
* activity[operativeTherapy].detail.status = #scheduled

* activity[targetedTherapy].detail.kind = #MedicationRequest
* activity[targetedTherapy].detail.code = $SCT#416608005 "Drug therapy"
* activity[targetedTherapy].detail.code.text = "Trastuzumab Erhaltung 1 Jahr"
* activity[targetedTherapy].detail.status = #scheduled

* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[radiotherapy].detail.code.text = "Adjuvante Ganzbrustbestrahlung"
* activity[radiotherapy].detail.status = #scheduled

* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[endocrineTherapy].detail.code.text = "Letrozol für 5 Jahre"
* activity[endocrineTherapy].detail.status = #scheduled


// --- Tumorboard 2: Postoperativ ---
Instance: Fall5-Tumorboard-Postoperativ
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 5: Tumorboard — Postoperativ"
Description: "Postoperative Tumorboard-Empfehlung: Bestätigung adjuvante Therapie"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Monika Braun — Postoperativ"
* description = "Postoperativ ypT1a ypN0(sn)(0/3) R0, gutes Ansprechen. Bestätigung: Trastuzumab Erhaltung fortsetzen, adjuvante RT, Letrozol starten."

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* period.start = "2025-07-20"

* addresses = Reference(Condition/Fall5-Diagnose-Mammakarzinom)

* activity[targetedTherapy].detail.kind = #MedicationRequest
* activity[targetedTherapy].detail.code = $SCT#416608005 "Drug therapy"
* activity[targetedTherapy].detail.code.text = "Trastuzumab Erhaltung fortsetzen bis 1 Jahr Gesamtdauer"
* activity[targetedTherapy].detail.status = #scheduled

* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[radiotherapy].detail.code.text = "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy"
* activity[radiotherapy].detail.status = #scheduled

* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[endocrineTherapy].detail.code.text = "Letrozol 2,5 mg/d starten"
* activity[endocrineTherapy].detail.status = #scheduled


// --- Neoadjuvante Systemtherapie ---
Instance: Fall5-Systemtherapie-Neoadjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 5: Neoadjuvante EC → Docetaxel + Trastuzumab"
Description: "Neoadjuvante Therapie: EC x4 gefolgt von Docetaxel + Trastuzumab x4"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-54
* code.coding[=].display = "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)

* performedPeriod.start = "2025-02-10"
* performedPeriod.end = "2025-06-30"

* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#E "reguläres Ende"
* outcome.text = "Therapie planmäßig abgeschlossen, klinisch partielle Remission"

* reasonReference = Reference(Condition/Fall5-Diagnose-Mammakarzinom)

* usedCode = $MII_CS_Onko_Protokolle#EC-D "EC-D"
* usedCode.text = "EC (Epirubicin 90 mg/m2 + Cyclophosphamid 600 mg/m2) q3w x4, dann Docetaxel 100 mg/m2 + Trastuzumab 6 mg/kg q3w x4"


// --- Operation ---
Instance: Fall5-Operation-BET
InstanceOf: Senologie_Operation
Title: "Fall 5: BET rechts + SLNB"
Description: "Brusterhaltende Therapie rechts mit SLNB, ypT1a ypN0(sn)(0/3), R0"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#392022002 "Excision of mass"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a1
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Defektdeckung durch Mobilisation und Adaptation von bis zu 25 % des Brustgewebes (bis zu 1 Quadranten)"
* code.text = "BET rechts"

* bodySite = $SCT#73056007 "Right breast structure"

* performedDateTime = "2025-07-15"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)

* reasonReference = Reference(Condition/Fall5-Diagnose-Mammakarzinom)

* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "ypT1a R0 — gutes Ansprechen auf neoadjuvante Therapie"


// --- SLNB (Sub-Prozedur) ---
Instance: Fall5-Operation-SLNB
InstanceOf: Senologie_Operation
Title: "Fall 5: Sentinel-Lymphknoten-Biopsie rechts"
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

* bodySite = $SCT#73056007 "Right breast structure"
* performedDateTime = "2025-07-15"
* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* reasonReference = Reference(Condition/Fall5-Diagnose-Mammakarzinom)

// Sub-procedure of main OP
* partOf = Reference(Procedure/Fall5-Operation-BET)

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "Sentinel-LK negativ ypN0(sn)(0/3)"


// --- Strahlentherapie ---
Instance: Fall5-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 5: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy"
Description: "Adjuvante Ganzbrustbestrahlung rechts nach BET"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)

* performedPeriod.start = "2025-08-18"
* performedPeriod.end = "2025-10-03"

* bodySite = $SCT#73056007 "Right breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 33
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall5-Diagnose-Mammakarzinom)

* note.text = "Ganzbrust rechts 50 Gy in 25 Fraktionen + Boost 16 Gy in 8 Fraktionen auf Tumorbett, Gesamtdosis 66 Gy"


// --- Begleitmedikation Letrozol ---
Instance: Fall5-Begleitmedikation-Letrozol
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 5: Endokrine Therapie Letrozol 2,5 mg"
Description: "Letrozol 2,5 mg/d als adjuvante endokrine Therapie"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#386911004 "Letrozole"
* medicationCodeableConcept.text = "Letrozol 2,5 mg"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)

* effectivePeriod.start = "2025-10-10"

* dateAsserted = "2025-10-10"

* dosage.text = "1x täglich"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #d
* dosage.doseAndRate.doseQuantity.value = 2.5
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg
