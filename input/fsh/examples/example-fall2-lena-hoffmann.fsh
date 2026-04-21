// ============================================================
// Fall 2: Lena Hoffmann — Lokal fortgeschritten/metastasiert, palliativ
// Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS), UICC IV
// Neoadjuvante Chemo + Immuntherapie → Mastektomie + Axilladissektion
// Adjuvante RT + Pembrolizumab Maintenance
// Verlauf: hepatische Metastasen nach 18 Monaten
// ============================================================

// --- Patient ---
Instance: Fall2-Patient-Lena-Hoffmann
InstanceOf: Patient
Title: "Fall 2: Patientin Lena Hoffmann"
Description: "Synthetische Testpatientin — lokal fortgeschrittenes triple-negatives Mammakarzinom, palliativ"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-002"
* name.family = "Hoffmann"
* name.given = "Lena"
* gender = #female
* birthDate = "1980-09-28"
* address.city = "Berlin"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall2-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 2: Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS)"
Description: "Triple-negatives invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, G3, UICC IV"
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
* code.text = "Invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, triple-negativ"

// Seite
* bodySite.coding = $SCT#73056007 "Right breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2025-02-10"

// Onset
* onsetDateTime = "2025-02-10"

// Stadium — cT3 cN2a cM1(OSS), UICC IV
* stage[+].summary.text = "UICC IV (cT3 cN2a cM1)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM1 (OSS) — ossäre Metastase BWK 12"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

// Patient
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* recordedDate = "2025-02-10"


// --- Bildgebung Mammographie ---
Instance: Fall2-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 2: Mammographie bilateral"
Description: "Mammographie bilateral mit großem Herdbefund rechts BI-RADS 5"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-10"

* result[+] = Reference(Observation/Fall2-BiRADS-Rechts)

* conclusion = "BI-RADS 5 rechts zentral, große Raumforderung 5,5 cm mit Hautinfiltration. BI-RADS 1 links."


// --- BI-RADS Observation rechts ---
Instance: Fall2-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 2: BI-RADS 5 rechts"
Description: "BI-RADS 5 Befund der rechten Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-10"

* bodySite = $SCT#73056007 "Right breast structure"

* valueCodeableConcept.coding = $SCT#397145000 "BI-RADS assessment category 5"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Große Raumforderung zentral rechts, 55 mm, unscharf begrenzt, Hautinfiltration, vergrößerte axilläre LK rechts"


// --- Bildgebung Sonographie ---
Instance: Fall2-Bildgebung-Sonographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 2: Sonographie bilateral"
Description: "Sonographie bilateral mit Herdbefund rechts und suspekten axillären Lymphknoten"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[ultrasound].system = "http://loinc.org"
* code.coding[ultrasound].code = #18740-1
* code.coding[ultrasound].display = "Ultrasound of bilateral breasts"
* code.text = "Sonographie bilateral"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-10"

* conclusion = "Hypoechogener Herdbefund rechts zentral, 52 mm, unscharf begrenzt, dorsale Schallauslöschung. Multiple suspekte axilläre Lymphknoten rechts (Level I+II), größter 22 mm."


// --- Bildgebung MRT ---
Instance: Fall2-Bildgebung-MRT
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 2: MRT Mamma"
Description: "MRT der Brust zur Ausdehnungsbeurteilung"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mri].system = "http://loinc.org"
* code.coding[mri].code = #36581-3
* code.coding[mri].display = "MRI of breast"
* code.text = "MRT Mamma"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-12"

* conclusion = "Kontrastmittelanreichernde Raumforderung rechts zentral, 58 mm, Hautkontakt über 3 cm. Kein Nachweis multifokaler oder kontralateraler Herde. Multiple pathologische LK axillär rechts Level I-II."


// --- Bildgebung CT Thorax/Abdomen ---
Instance: Fall2-Bildgebung-CT
InstanceOf: Senologie_Bildgebung_Sonstige
Title: "Fall 2: CT Thorax/Abdomen (Staging)"
Description: "CT Thorax und Abdomen im Rahmen des Stagings"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[loinc] = http://loinc.org#87858-9 "CT Chest and Abdomen"
* code.coding[snomed] = http://snomed.info/sct#169069000 "CT of chest and abdomen"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-14"

* conclusion = "Kein Nachweis pulmonaler oder hepatischer Metastasen. Kein pathologischer Befund im Abdomen. Bekannte Mammatumor rechts."


// --- Bildgebung Skelettszintigraphie ---
Instance: Fall2-Bildgebung-Skelettszintigraphie
InstanceOf: Senologie_Bildgebung_Sonstige
Title: "Fall 2: Skelettszintigraphie — ossäre Metastase BWK 12"
Description: "Skelettszintigraphie mit Nachweis einer ossären Metastase BWK 12"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[snomed] = http://snomed.info/sct#44491008 "Bone scan"
* code.coding[loinc] = http://loinc.org#39638-7 "Bone scan"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-14"

* conclusion = "Fokale Mehranreicherung im BWK 12, hochverdächtig auf ossäre Metastase. Sonstige Skelettanteile unauffällig."

* conclusionCode = $SCT#94222008 "Secondary malignant neoplasm of bone"


// --- Pathologie Befund ---
Instance: Fall2-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 2: Pathologie — Invasiv-duktales Karzinom G3, triple-negativ"
Description: "Pathologischer Befund der Stanzbiopsie: invasiv-duktales Karzinom G3, triple-negativ, Ki-67 70%"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-000456"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-02-15"
* issued = "2025-02-18T16:00:00+01:00"

* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

* specimen = Reference(Specimen/Fall2-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall2-Patho-Conclusion)

* conclusion = "Invasiv-duktales Mammakarzinom, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 0), Ki-67 70%. Triple-negativ."


Instance: Fall2-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 2: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-02-18"
* valueString = "Invasiv-duktales Mammakarzinom, G3, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 70%, triple-negativ"


// --- Pathologie Präparat ---
Instance: Fall2-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 2: Stanzbiopsie-Präparat rechts zentral"
Description: "Stanzbiopsie aus dem zentralen Drüsenkörper der rechten Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-000456-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust, zentraler Drüsenkörper"
* collection.collectedDateTime = "2025-02-15"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Tumorboard 1: Initiales Tumorboard ---
Instance: Fall2-Tumorboard-Initial
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 2: Initiales Tumorboard"
Description: "Empfehlung: neoadjuvante Chemotherapie + Immuntherapie, dann Mastektomie + Axilladissektion, adjuvante RT, MTB-Überweisung"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Lena Hoffmann — Erstvorstellung"
* description = "Empfehlung: Neoadjuvante Chemotherapie (Carboplatin/Paclitaxel) + Pembrolizumab (KEYNOTE-522), dann modifiziert radikale Mastektomie rechts + Axilladissektion, adjuvante Thoraxwandbestrahlung + supraklavikulär, Pembrolizumab Maintenance, MTB-Überweisung für Genompanel."

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* period.start = "2025-02-20"

* addresses = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

// Chemotherapie
* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code.text = "Neoadjuvant: Carboplatin/Paclitaxel wöchentlich x12, dann AC q3w x4"
* activity[chemotherapy].detail.status = #scheduled

// Immuntherapie
* activity[immunotherapy].detail.kind = #MedicationRequest
* activity[immunotherapy].detail.code = $SCT#76334006 "Immunotherapy (procedure)"
* activity[immunotherapy].detail.code.text = "Pembrolizumab 200 mg q3w (KEYNOTE-522 Schema)"
* activity[immunotherapy].detail.status = #scheduled

// Operative Therapie
* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code.text = "Modifiziert radikale Mastektomie rechts + Axilladissektion Level I-III"
* activity[operativeTherapy].detail.status = #scheduled

// Strahlentherapie
* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code = $SCT#108290001 "Radiation oncology AND/OR radiotherapy (procedure)"
* activity[radiotherapy].detail.code.text = "Adjuvante Bestrahlung Thoraxwand + supraklavikulär 50 Gy"
* activity[radiotherapy].detail.status = #scheduled

// Klinische Studie
* activity[clinicalTrial].detail.kind = #ServiceRequest
* activity[clinicalTrial].detail.code = $SCT#110465008 "Clinical trial (procedure)"
* activity[clinicalTrial].detail.code.text = "Einschluss KEYNOTE-522"
* activity[clinicalTrial].detail.status = #scheduled


// --- Tumorboard 2: Progression ---
Instance: Fall2-Tumorboard-Progression
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 2: Tumorboard bei Progression"
Description: "Empfehlung: Palliativkonzept bei hepatischer Metastasierung"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Lena Hoffmann — Progression"
* description = "Hepatische Metastasen nach 18 Monaten. Empfehlung: Umstellung auf palliatives Therapiekonzept. Sacituzumab govitecan als Zweitlinientherapie. Best Supportive Care."

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* period.start = "2026-08-15"

* addresses = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

// Chemotherapie 2. Linie
* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code.text = "Sacituzumab govitecan (Trodelvy) 10 mg/kg d1,8 q3w"
* activity[chemotherapy].detail.status = #scheduled

// Follow-up / Palliativversorgung
* activity[followUp].detail.kind = #Appointment
* activity[followUp].detail.code = $SCT#390906007 "Follow-up encounter (procedure)"
* activity[followUp].detail.code.text = "Anbindung Palliativmedizin, psychoonkologische Betreuung"
* activity[followUp].detail.status = #scheduled

* note.text = "Palliativkonzept empfohlen. PD-L1-Retest empfohlen."


// --- Studienteilnahme ---
Instance: Fall2-ResearchStudy-KEYNOTE522
InstanceOf: ResearchStudy
Title: "Fall 2: KEYNOTE-522 Studie"
Description: "Fiktive klinische Studie KEYNOTE-522 für triple-negatives Mammakarzinom"
Usage: #example

* status = #active
* title = "KEYNOTE-522: Pembrolizumab + Chemotherapy vs. Placebo + Chemotherapy for Triple-Negative Breast Cancer"
* condition = $SCT#254837009 "Malignant neoplasm of breast"


Instance: Fall2-Studienteilnahme
InstanceOf: Senologie_Studienteilnahme
Title: "Fall 2: Studienteilnahme KEYNOTE-522"
Description: "Teilnahme an KEYNOTE-522, Interventionsarm (Pembrolizumab)"
Usage: #example

* status = #on-study-intervention

* study = Reference(ResearchStudy/Fall2-ResearchStudy-KEYNOTE522)
* study.display = "KEYNOTE-522"

* individual = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* individual.display = "Lena Hoffmann"

* period.start = "2025-03-01"

* assignedArm = "Interventionsarm: Pembrolizumab + Chemotherapie"

* consent.display = "Studieneinwilligung KEYNOTE-522 vom 2025-02-25"

* extension[Screeningstatus].valueCodeableConcept = $SCT#385645004 "Eligible (qualifier value)"
* extension[Kontakt].valueString = "Dr. med. Markus Weber, Studienzentrale Onkologie"
* extension[Aufklaerungsdatum].valueDate = "2025-02-25"


// --- Neoadjuvante Systemtherapie (übergeordnet) ---
Instance: Fall2-Systemtherapie-Neoadjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 2: Neoadjuvante Chemotherapie + Immuntherapie"
Description: "Neoadjuvante Therapie mit Carboplatin/Paclitaxel + Pembrolizumab"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-54
* code.coding[=].display = "Chemotherapie"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* performedPeriod.start = "2025-03-01"
* performedPeriod.end = "2025-07-15"

* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#E "reguläres Ende"
* outcome.text = "Therapie planmäßig abgeschlossen, klinisch gute Remission"

* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

* usedCode.text = "Carboplatin AUC5 + Paclitaxel 80 mg/m2 wöchentlich x12, dann AC (Doxorubicin/Cyclophosphamid) q3w x4, Pembrolizumab 200 mg q3w durchgehend"


// --- Medikation: Carboplatin ---
Instance: Fall2-Medikation-Carboplatin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 2: Carboplatin AUC5, Zyklus 1, Tag 1"
Description: "Einzelgabe Carboplatin im Rahmen der neoadjuvanten Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#386905006 "Carboplatin"
* medicationCodeableConcept.text = "Carboplatin"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* dateAsserted = "2025-03-01"
* effectivePeriod.start = "2025-03-01"
* effectivePeriod.end = "2025-03-01"

* partOf = Reference(Procedure/Fall2-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.text = "Carboplatin AUC 5"

* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)


// --- Medikation: Paclitaxel ---
Instance: Fall2-Medikation-Paclitaxel
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 2: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1"
Description: "Einzelgabe Paclitaxel im Rahmen der neoadjuvanten Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#387374002 "Paclitaxel"
* medicationCodeableConcept.text = "Paclitaxel"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* dateAsserted = "2025-03-01"
* effectivePeriod.start = "2025-03-01"
* effectivePeriod.end = "2025-03-01"

* partOf = Reference(Procedure/Fall2-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-03-01"
* dosage.doseAndRate.doseQuantity.value = 80
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)


// --- Medikation: Pembrolizumab (neoadjuvant) ---
Instance: Fall2-Medikation-Pembrolizumab
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 2: Pembrolizumab 200 mg, Zyklus 1, Tag 1"
Description: "Einzelgabe Pembrolizumab im Rahmen der neoadjuvanten Immuntherapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#716125002 "Pembrolizumab"
* medicationCodeableConcept.text = "Pembrolizumab"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* dateAsserted = "2025-03-01"
* effectivePeriod.start = "2025-03-01"
* effectivePeriod.end = "2025-03-01"

* partOf = Reference(Procedure/Fall2-Systemtherapie-Neoadjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-03-01"
* dosage.doseAndRate.doseQuantity.value = 200
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg

* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)


// --- Operation: Mastektomie + Axilladissektion ---
Instance: Fall2-Operation-Mastektomie
InstanceOf: Senologie_Operation
Title: "Fall 2: Mastektomie rechts + Axilladissektion"
Description: "Modifiziert radikale Mastektomie rechts mit Axilladissektion Level I-III, ypT1a ypN0(0/14) R0"
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
* code.coding[=].display = "Mastektomie"
* code.text = "Mastektomie rechts"

// Lateralität
* bodySite = $SCT#73056007 "Right breast structure"

// Zeitpunkt
* performedDateTime = "2025-08-05"

// Patient
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 12 Ch x2"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband Thoraxwand"

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "ypT1a R0, gutes Ansprechen auf neoadjuvante Therapie"

// Komplikation
* complication.text = "Serom postoperativ"


// --- Axilladissektion (Sub-Prozedur) ---
Instance: Fall2-Operation-Axilladissektion
InstanceOf: Senologie_Operation
Title: "Fall 2: Axilladissektion rechts Level I-III"
Description: "Axilladissektion als Subprozedur der Mastektomie"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* category = $SCT#234262008 "Excision of axillary lymph node"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-402.12
* code.coding[=].display = "Regionale Lymphadenektomie: Axillär: Level I-III"
* code.text = "Axilladissektion Level I-III"

* bodySite = $SCT#73056007 "Right breast structure"
* performedDateTime = "2025-08-05"
* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

// Sub-procedure of main OP
* partOf = Reference(Procedure/Fall2-Operation-Mastektomie)

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "ypN0 (0/14 LK negativ)"


// --- Operative Komplikation: Serom ---
Instance: Fall2-Komplikation-Serom
InstanceOf: Senologie_Operative_Komplikation
Title: "Fall 2: Postoperative Komplikation — Serom, Clavien-Dindo I"
Description: "Postoperatives Serom nach Mastektomie, Clavien-Dindo Grad I"
Usage: #example

* status = #final

* code.coding = $SCT#789279006 "Clavien-Dindo complication grade (observable entity)"

* valueCodeableConcept.text = "Clavien-Dindo Grad I"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* effectiveDateTime = "2025-08-10"

* method.text = "postoperativ, stationär"

* focus = Reference(Procedure/Fall2-Operation-Mastektomie)

* component[komplikationsart].code = $SCT#116224001 "Complication of procedure"
* component[komplikationsart].valueCodeableConcept = $SCT#87614002 "Seroma"
* component[komplikationsart].valueCodeableConcept.text = "Serom"

* note.text = "Serom axillär rechts, konservative Behandlung mit Punktion, kein operativer Eingriff erforderlich"


// --- Adjuvante Systemtherapie (Pembrolizumab Maintenance) ---
Instance: Fall2-Systemtherapie-Adjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 2: Adjuvante Pembrolizumab Maintenance"
Description: "Adjuvante Pembrolizumab Maintenance nach Operation"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-547.32
* code.coding[=].display = "Immuntherapie mit monoklonalen Antikörpern: PD-1-Antikörper"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* performedPeriod.start = "2025-10-01"
* performedPeriod.end = "2026-07-01"

* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#P "Abbruch wegen Progress"
* outcome.text = "Pembrolizumab Maintenance für 9 Zyklen, dann Abbruch wegen Progression"

* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

* usedCode.text = "Pembrolizumab 200 mg q3w, adjuvant Maintenance"


// --- Strahlentherapie ---
Instance: Fall2-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 2: Adjuvante Bestrahlung Thoraxwand + supraklavikulär 50 Gy"
Description: "Adjuvante Bestrahlung der Thoraxwand und supraklavikulärer Lymphabflusswege"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger, intensitätsmodulierte Radiotherapie: Mit bildgestützter Bestrahlungsplanung"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* performedPeriod.start = "2025-09-01"
* performedPeriod.end = "2025-10-03"

* bodySite.coding[+] = $SCT#78904004 "Chest wall structure"
* bodySite.text = "Thoraxwand rechts + supraklavikuläre Lymphabflusswege"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

* note.text = "Thoraxwand rechts + supraklavikuläre Lymphabflusswege rechts, 50 Gy in 25 Fraktionen"


// --- Verlauf: Progression / Rezidiv-Diagnose ---
Instance: Fall2-Diagnose-Progression
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 2: Progression — hepatische Metastasen"
Description: "Hepatische Metastasierung nach 18 Monaten, klinischer Status Rezidiv"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#recurrence
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.1
* code.coding[icd10-gm].display = "Bösartige Neubildung: Zentraler Drüsenkörper der Brustdrüse"
* code.text = "Progression: hepatische Metastasierung bei triple-negativem Mammakarzinom"

* bodySite.coding = $SCT#73056007 "Right breast structure"

* extension[Feststellungsdatum].valueDateTime = "2026-08-10"

// Verweis auf Erstdiagnose
* extension[occurredFollowing].valueReference = Reference(Condition/Fall2-Diagnose-Mammakarzinom)

// Metastasierungsstadium
* stage[metastasis].summary.text = "M1 (HEP) — hepatische Metastasen"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* recordedDate = "2026-08-10"


// --- Begleitmedikation: Zoledronat ---
Instance: Fall2-Begleitmedikation-Zoledronat
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 2: Begleitmedikation Zoledronat 4 mg"
Description: "Zoledronat 4 mg i.v. alle 4 Wochen wegen ossärer Metastase"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#395926009 "Zoledronic acid"
* medicationCodeableConcept.text = "Zoledronat 4 mg"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* effectivePeriod.start = "2025-03-01"

* dateAsserted = "2025-02-20"

* dosage.text = "4 mg i.v. alle 4 Wochen"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 4
* dosage.timing.repeat.periodUnit = #wk
* dosage.doseAndRate.doseQuantity.value = 4
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg


// --- Begleitmedikation: Ondansetron ---
Instance: Fall2-Begleitmedikation-Ondansetron
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 2: Begleitmedikation Ondansetron 8 mg"
Description: "Ondansetron 8 mg als Antiemetikum supportiv bei Chemotherapie"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#372487007 "Ondansetron"
* medicationCodeableConcept.text = "Ondansetron 8 mg"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)

* effectivePeriod.start = "2025-03-01"

* dateAsserted = "2025-02-20"

* dosage.text = "8 mg i.v. vor Chemotherapie, ggf. 8 mg p.o. Folgetag"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 3
* dosage.timing.repeat.periodUnit = #wk
* dosage.doseAndRate.doseQuantity.value = 8
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg
