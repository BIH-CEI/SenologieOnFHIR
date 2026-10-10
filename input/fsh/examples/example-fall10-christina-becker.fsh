// ============================================================
// Fall 10: Christina Becker — PALB2-Mutationsträgerin, TNBC Stadium IA
// Invasives Karzinom NST rechts, G3, ER- PR- HER2-, Ki-67 55%
// cT1c cN0 cM0, UICC IA
// PALB2-Keimbahnmutation, Mutter Mamma-Ca 41 J., Schwester Ovarial-Ca 39 J.
// Bilaterale Mastektomie (therapeutisch re + prophylaktisch li)
// Sofortrekonstruktion beidseits mit Brustimplantat
// Adjuvant: Carboplatin + Paclitaxel
// ============================================================

// --- Patient ---
Instance: Fall10-Patient-Christina-Becker
InstanceOf: Patient
Title: "Fall 10: Patientin Christina Becker"
Description: "Synthetische Testpatientin — PALB2-Mutationsträgerin, TNBC rechts, bilaterale Mastektomie mit Implantatrekonstruktion"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-010"
* name.family = "Becker"
* name.given = "Christina"
* gender = #female
* birthDate = "1982-12-14"
* address.city = "Berlin"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall10-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 10: TNBC rechts, cT1c cN0 cM0"
Description: "Triple-negatives invasives Mammakarzinom NST rechts, G3, UICC IA, PALB2-Mutationsträgerin"
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
* code.text = "Invasives Mammakarzinom NST rechts, triple-negativ, PALB2-Keimbahnmutation"

// Seite
* bodySite.coding = $SCT#73056007 "Right breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2025-05-20"

// Onset
* onsetDateTime = "2025-05-20"

// Stadium — cT1c cN0 cM0, UICC IA
* stage[+].summary.text = "UICC IA (cT1c cN0 cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

// Patient
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* recordedDate = "2025-05-20"


// --- Bildgebung Mammographie ---
Instance: Fall10-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 10: Mammographie bilateral"
Description: "Mammographie bilateral mit suspektem Herdbefund rechts BI-RADS 4c"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #24606-6
* code.coding[mammography].display = "MG Breast Screening"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-20"

* result[+] = Reference(Observation/Fall10-BiRADS-Rechts)

* conclusion = "BI-RADS 4c rechts OAQ, unscharf begrenzter Herdbefund 18 mm. BI-RADS 1 links."


// --- BI-RADS Observation ---
Instance: Fall10-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 10: BI-RADS 4c rechts"
Description: "BI-RADS 4c Befund der rechten Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-20"

* bodySite = $SCT#73056007 "Right breast structure"

* valueCodeableConcept.coding = $SCT#397144001 "Mammography assessment (Category 4) - Suspicious abnormality, biopsy should be considered"
* valueCodeableConcept.text = "BI-RADS 4c — hohe Malignitätswahrscheinlichkeit"

* note.text = "Unscharf begrenzter Herdbefund rechts OAQ, 18 mm, suspekt"


// --- Pathologie Befund ---
Instance: Fall10-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 10: Pathologie — Invasives Karzinom NST, G3, TNBC, Ki-67 55%"
Description: "Pathologischer Befund: Invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 55%, PALB2-Keimbahnmutation"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001001"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-05-25"
* issued = "2025-05-28T11:00:00+02:00"

* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

* specimen = Reference(Specimen/Fall10-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall10-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 1+, HER2-low), Ki-67 55%. PALB2-Keimbahnmutation bekannt."


Instance: Fall10-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 10: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-28"
* valueString = "Invasives Karzinom NST, G3, pT1c, ER- IRS 0, PR- IRS 0, HER2- Score 1+ (HER2-low), Ki-67 55%, triple-negativ"


// --- Pathologie Präparat ---
Instance: Fall10-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 10: Stanzbiopsie-Präparat rechts OAQ"
Description: "Stanzbiopsie aus dem oberen äußeren Quadranten der rechten Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-001001-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* collection.bodySite = $SCT#73056007 "Right breast structure"
* collection.bodySite.text = "Rechte Brust, oberer äußerer Quadrant"
* collection.collectedDateTime = "2025-05-25"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Familienanamnese: Mutter ---
Instance: Fall10-Familienanamnese-Mutter
InstanceOf: Senologie_Familienanamnese
Title: "Fall 10: Familienanamnese — Mutter Mammakarzinom 41 J."
Description: "Mutter mit Mammakarzinom im Alter von 41 Jahren"
Usage: #example

* status = #completed

* patient = Reference(Patient/Fall10-Patient-Christina-Becker)

* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"

* condition[mammakarzinom].code = $SCT#254837009 "Malignant neoplasm of breast"
* condition[mammakarzinom].onsetAge.value = 41
* condition[mammakarzinom].onsetAge.unit = "Jahre"
* condition[mammakarzinom].onsetAge.system = "http://unitsofmeasure.org"
* condition[mammakarzinom].onsetAge.code = #a


// --- Familienanamnese: Schwester ---
Instance: Fall10-Familienanamnese-Schwester
InstanceOf: Senologie_Familienanamnese
Title: "Fall 10: Familienanamnese — Schwester Ovarialkarzinom 39 J."
Description: "Schwester mit Ovarialkarzinom im Alter von 39 Jahren"
Usage: #example

* status = #completed

* patient = Reference(Patient/Fall10-Patient-Christina-Becker)

* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#SIS "sister"

* condition[ovarialkarzinom].code = $SCT#363443007 "Malignant tumor of ovary"
* condition[ovarialkarzinom].onsetAge.value = 39
* condition[ovarialkarzinom].onsetAge.unit = "Jahre"
* condition[ovarialkarzinom].onsetAge.system = "http://unitsofmeasure.org"
* condition[ovarialkarzinom].onsetAge.code = #a


// --- Operation: Therapeutische Mastektomie rechts + SLNB ---
Instance: Fall10-Operation-Mastektomie-Rechts
InstanceOf: Senologie_Operation
Title: "Fall 10: Therapeutische Mastektomie rechts + SLNB"
Description: "Therapeutische Mastektomie rechts mit SLNB, R0, pN0(sn)(0/2)"
Usage: #example

* status = #completed

// Intention
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

// Art der Operation
* category = $SCT#172043006 "Simple mastectomy"

// OPS-Code Mastektomie
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-872.1
* code.coding[=].display = "(Modifizierte radikale) Mastektomie: Mit Resektion der M. pectoralis-Faszie"
* code.text = "Therapeutische Mastektomie rechts"

// Lateralität
* bodySite = $SCT#73056007 "Right breast structure"

// Zeitpunkt
* performedDateTime = "2025-06-18"

// Patient
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#182531007 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "R0-Resektion, Sentinel negativ pN0(sn)(0/2), Sofortrekonstruktion mit Implantat"


// --- Operation: Prophylaktische Mastektomie links ---
Instance: Fall10-Operation-Mastektomie-Links
InstanceOf: Senologie_Operation
Title: "Fall 10: Prophylaktische Mastektomie links (risikoreduktiv)"
Description: "Prophylaktische kontralaterale Mastektomie links bei PALB2-Keimbahnmutation"
Usage: #example

* status = #completed

// Intention — prophylaktisch (kein oBDS-Code, daher S=Sonstiges)
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#S "sonstiges"

// Art der Operation
* category = $SCT#172043006 "Simple mastectomy"

// OPS-Code Mastektomie
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-872.1
* code.coding[=].display = "(Modifizierte radikale) Mastektomie: Mit Resektion der M. pectoralis-Faszie"
* code.text = "Prophylaktische Mastektomie links (risikoreduktiv bei PALB2)"

// Lateralität
* bodySite = $SCT#80248007 "Left breast structure"

// Zeitpunkt — gleicher Eingriff
* performedDateTime = "2025-06-18"

// Patient
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"

// Outcome — kein Residualstatus bei prophylaktischer OP (kein Tumor)


// --- SLNB rechts (Subprozedur der Mastektomie) ---
Instance: Fall10-Operation-SLNB
InstanceOf: Senologie_Operation
Title: "Fall 10: Sentinel-Lymphknoten-Biopsie rechts"
Description: "SLNB als Subprozedur der therapeutischen Mastektomie rechts"
Usage: #example

* status = #completed
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#234262008 "Excision of axillary lymph node"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Mit Radionuklidmarkierung (Sentinel-Lymphonodektomie)"
* code.text = "Sentinel-Lymphknoten-Biopsie rechts"

* bodySite = $SCT#73056007 "Right breast structure"
* performedDateTime = "2025-06-18"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* reasonReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

* partOf = Reference(Procedure/Fall10-Operation-Mastektomie-Rechts)

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "Kein Residualtumor"
* outcome.text = "Sentinel-LK negativ pN0(sn)(0/2)"


// --- Implantat rechts ---
Instance: Fall10-Implantat-Rechts
InstanceOf: Senologie_Implantat
Title: "Fall 10: Brustimplantat rechts (Sofortrekonstruktion)"
Description: "Brustimplantat rechts nach therapeutischer Mastektomie, Sofortrekonstruktion"
Usage: #example

* status = #active

* type = $SCT#465380004 "Silicone gel-filled breast implant"
* type.text = "Silikon-Brustimplantat"

* manufacturer = "Mentor"
* lotNumber = "REF-2025-RB-001"
* serialNumber = "IMP-2025-001-R"

* patient = Reference(Patient/Fall10-Patient-Christina-Becker)


// --- Implantat links ---
Instance: Fall10-Implantat-Links
InstanceOf: Senologie_Implantat
Title: "Fall 10: Brustimplantat links (Sofortrekonstruktion)"
Description: "Brustimplantat links nach prophylaktischer Mastektomie, Sofortrekonstruktion"
Usage: #example

* status = #active

* type = $SCT#465380004 "Silicone gel-filled breast implant"
* type.text = "Silikon-Brustimplantat"

* manufacturer = "Mentor"
* lotNumber = "REF-2025-LB-001"
* serialNumber = "IMP-2025-001-L"

* patient = Reference(Patient/Fall10-Patient-Christina-Becker)


// --- Rekonstruktion rechts (Implantat) ---
Instance: Fall10-Rekonstruktion-Rechts
InstanceOf: Senologie_Operation
Title: "Fall 10: Sofortrekonstruktion rechts mit Implantat"
Description: "Implantatrekonstruktion rechts als Subprozedur der therapeutischen Mastektomie"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#33496007 "Mammoplasty"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-886.40
* code.coding[=].display = "Andere plastische Rekonstruktion der Mamma: Primäre Rekonstruktion mit Alloprothese, subpektoral: Ohne gewebeverstärkendes Material"
* code.text = "Sofortrekonstruktion rechts mit Silikonimplantat"

* bodySite = $SCT#73056007 "Right breast structure"
* performedDateTime = "2025-06-18"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

// Subprozedur der Mastektomie
* partOf = Reference(Procedure/Fall10-Operation-Mastektomie-Rechts)

// Eingesetztes Implantat
* focalDevice[+].action = $SCT#129336009 "Implantation - action"
* focalDevice[=].manipulated = Reference(Device/Fall10-Implantat-Rechts)

// Outcome — kein Residualstatus bei Rekonstruktion


// --- Rekonstruktion links (Implantat) ---
Instance: Fall10-Rekonstruktion-Links
InstanceOf: Senologie_Operation
Title: "Fall 10: Sofortrekonstruktion links mit Implantat"
Description: "Implantatrekonstruktion links als Subprozedur der prophylaktischen Mastektomie"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#S "sonstiges"

* category = $SCT#33496007 "Mammoplasty"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-886.40
* code.coding[=].display = "Andere plastische Rekonstruktion der Mamma: Primäre Rekonstruktion mit Alloprothese, subpektoral: Ohne gewebeverstärkendes Material"
* code.text = "Sofortrekonstruktion links mit Silikonimplantat"

* bodySite = $SCT#80248007 "Left breast structure"
* performedDateTime = "2025-06-18"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

// Subprozedur der Mastektomie
* partOf = Reference(Procedure/Fall10-Operation-Mastektomie-Links)

// Eingesetztes Implantat
* focalDevice[+].action = $SCT#129336009 "Implantation - action"
* focalDevice[=].manipulated = Reference(Device/Fall10-Implantat-Links)

// Outcome — kein Residualstatus bei Rekonstruktion


// --- Adjuvante Systemtherapie ---
Instance: Fall10-Systemtherapie-Adjuvant
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 10: Adjuvante Chemotherapie Carboplatin + Paclitaxel"
Description: "Adjuvante Chemotherapie mit Carboplatin + Paclitaxel bei TNBC + PALB2"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-54
* code.coding[=].display = "Zytostatische Chemotherapie, Immuntherapie und antiretrovirale Therapie"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* performedPeriod.start = "2025-07-21"
* performedPeriod.end = "2025-11-10"

* outcome.coding = $MII_CS_Onko_Therapie_Ende_Grund#E "reguläres Ende"
* outcome.text = "Chemotherapie planmäßig abgeschlossen"

* reasonReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

* usedCode = $MII_CS_Onko_Protokolle#CarboTax "CarboTax"
* usedCode.text = "Carboplatin AUC5 q3w + Paclitaxel 175 mg/m2 q3w x6 Zyklen (TNBC + PALB2)"


// --- Medikation: Carboplatin ---
Instance: Fall10-Medikation-Carboplatin
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 10: Carboplatin AUC5, Zyklus 1, Tag 1"
Description: "Einzelgabe Carboplatin im Rahmen der adjuvanten Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#386905002 "Carboplatin"
* medicationCodeableConcept.text = "Carboplatin"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* dateAsserted = "2025-07-21"
* effectivePeriod.start = "2025-07-21"
* effectivePeriod.end = "2025-07-21"

* partOf = Reference(Procedure/Fall10-Systemtherapie-Adjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.text = "Carboplatin AUC 5"

* reasonReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)


// --- Medikation: Paclitaxel ---
Instance: Fall10-Medikation-Paclitaxel
InstanceOf: Senologie_Systemtherapie_Medikation
Title: "Fall 10: Paclitaxel 175 mg/m2, Zyklus 1, Tag 1"
Description: "Einzelgabe Paclitaxel im Rahmen der adjuvanten Therapie"
Usage: #example

* status = #completed

* medicationCodeableConcept.coding[sct] = $SCT#387374002 "Paclitaxel"
* medicationCodeableConcept.text = "Paclitaxel"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* dateAsserted = "2025-07-21"
* effectivePeriod.start = "2025-07-21"
* effectivePeriod.end = "2025-07-21"

* partOf = Reference(Procedure/Fall10-Systemtherapie-Adjuvant)

* extension[therapyCycle].valueInteger = 1
* extension[dayInCycle].valueInteger = 1

* dosage.timing.event = "2025-07-21"
* dosage.doseAndRate.doseQuantity.value = 175
* dosage.doseAndRate.doseQuantity.unit = "mg/m2"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg/m2

* reasonReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)


// --- Strahlentherapie ---
Instance: Fall10-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 10: Adjuvante Bestrahlung Thoraxwand rechts 50 Gy"
Description: "Adjuvante Thoraxwandbestrahlung rechts nach therapeutischer Mastektomie"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* performedPeriod.start = "2025-12-01"
* performedPeriod.end = "2026-01-09"

* bodySite.coding[+] = $SCT#78904004 "Chest wall structure"
* bodySite.text = "Thoraxwand rechts"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

* note.text = "Thoraxwand rechts 50 Gy in 25 Fraktionen. Nur therapeutische Seite bestrahlt."


// ============================================================
// Ergaenzungen 2026-10-10: Tumorboard, Nebenwirkung, Verlauf.
// Macht Fall 10 zum durchgaengigen Beispiel fuer Chemotherapie + Implantat
// (analog zu Fall 1 fuer BET + Strahlentherapie).
// ============================================================

// --- Tumorboard (praetherapeutisch) ---
Instance: Fall10-Tumorboard
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 10: Tumorboard-Empfehlung"
Description: "Empfehlung: Mastektomie rechts mit SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten, adjuvante Chemotherapie, keine endokrine Therapie"
Usage: #example

* status = #active
* intent = #plan
* category = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-therapieplanung-typ#praeth "prätherapeutische Tumorkonferenz (Festlegung der Therapiestrategie)"

* title = "Tumorboard-Empfehlung Christina Becker"
* description = "Triple-negatives Mammakarzinom rechts, cT1c cN0 cM0, G3, PALB2-Keimbahnmutation. Empfehlung: Mastektomie rechts mit Sentinel-LK-Biopsie, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten; adjuvante Chemotherapie Carboplatin + Paclitaxel. Keine endokrine Therapie (hormonrezeptor-negativ)."

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* period.start = "2025-06-03"

* addresses = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

// Operative Therapie
* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code.text = "Mastektomie rechts + SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten"
* activity[operativeTherapy].detail.status = #scheduled

// Chemotherapie
* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code = $SCT#385786002 "Chemotherapy care (regime/therapy)"
* activity[chemotherapy].detail.code.text = "Adjuvant Carboplatin + Paclitaxel, 6 Zyklen"
* activity[chemotherapy].detail.status = #scheduled

// Strahlentherapie
* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code = $SCT#1287742003 "Radiotherapy (procedure)"
* activity[radiotherapy].detail.code.text = "Bestrahlung der Thoraxwand nach Abschluss der Chemotherapie"
* activity[radiotherapy].detail.status = #scheduled

// Keine endokrine Therapie
* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code = $SCT#169413002 "Hormone therapy (procedure)"
* activity[endocrineTherapy].detail.code.text = "Keine endokrine Therapie (hormonrezeptor-negativ)"
* activity[endocrineTherapy].detail.status = #not-started
* activity[endocrineTherapy].detail.doNotPerform = true


// --- Nebenwirkung unter Chemotherapie ---
Instance: Fall10-Nebenwirkung-Nausea
InstanceOf: Senologie_Nebenwirkung
Title: "Fall 10: Nausea CTCAE Grad 2 unter Carboplatin + Paclitaxel"
Description: "Nausea Grad 2 (moderat) im zweiten Zyklus der adjuvanten Chemotherapie"
Usage: #example

* actuality = #actual

* event.coding[+].system = "https://www.meddra.org"
* event.coding[=].version = "Version 4"
* event.coding[=].code = #10028813
* event.coding[=].display = "Nausea"
* event.text = "Nausea Grad 2 unter Carboplatin + Paclitaxel"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* date = "2025-08-14"

* seriousness.coding.system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-nebenwirkung-ctcae-grad"
* seriousness.coding.code = #2
* seriousness.coding.display = "Moderat"
* seriousness.text = "CTCAE Grad 2 — Moderat"

* suspectEntity[+].instance = Reference(Procedure/Fall10-Systemtherapie-Adjuvant)


// --- Verlauf nach Abschluss der Therapie ---
Instance: Fall10-Verlauf-PostTherapie
InstanceOf: Senologie_FollowUp
Title: "Fall 10: Verlaufskontrolle nach Abschluss der Therapie"
Description: "Nachsorge-Untersuchung nach Mastektomie, Chemotherapie und Bestrahlung, kein Rezidivhinweis. Aktive Nachsorge, kein Zweittumor."
Usage: #example

* status = #final

* code.coding[+].system = "http://snomed.info/sct"
* code.coding[=].code = #396432002
* code.coding[=].display = "Status of regression of tumor (observable entity)"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* focus = Reference(Condition/Fall10-Diagnose-Mammakarzinom)
* effectiveDateTime = "2026-04-14"

* performer = Reference(Organization/Brustzentrum-Charite)

* valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Gesamt
* valueCodeableConcept.coding[=].code = #K
* valueCodeableConcept.coding[=].display = "keine Änderung (no change, NC) = stable disease"

* component[+].code.coding = $SCT#445200009 "Status of residual neoplasm (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Primaertumor
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Tumor nachweisbar"

* component[+].code.coding = $SCT#399656008 "Presence of metastatic neoplasm in regional lymph node (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Lymphknoten
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "kein Lymphknotenbefall nachweisbar"

* component[+].code.coding = $SCT#399608002 "Status of distant metastasis (observable entity)"
* component[=].valueCodeableConcept.coding[+].system = $MII_CS_Onko_Verlauf_Fernmetastasen
* component[=].valueCodeableConcept.coding[=].code = #K
* component[=].valueCodeableConcept.coding[=].display = "keine Fernmetastasen nachweisbar"

* method.coding[+].system = $CS_FU_EX
* method.coding[=].code = #aktiv
* method.coding[=].display = "Aktive Nachsorge"

* component[+].code.coding[+].system = $CS_FU_EX
* component[=].code.coding[=].code = #zweittumor
* component[=].code.coding[=].display = "Zweittumor"
* component[=].valueCodeableConcept.coding[+].system = "http://snomed.info/sct"
* component[=].valueCodeableConcept.coding[=].code = #373067005
* component[=].valueCodeableConcept.coding[=].display = "No (qualifier value)"


Instance: Fall10-ECOG-PostTherapie
InstanceOf: Observation
Title: "Fall 10: ECOG-Leistungszustand nach Abschluss der Therapie"
Description: "ECOG 0 — vollständig aktiv, keine Einschränkung"
Usage: #example

* meta.profile = $MII_PR_Onko_ECOG
* status = #final
* code.coding[+].system = "http://loinc.org"
* code.coding[=].code = #89247-1
* code.coding[=].display = "ECOG Performance Status score"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2026-04-14"
* valueCodeableConcept.coding[+].system = $MII_CS_Onko_ECOG
* valueCodeableConcept.coding[=].code = #0
* valueCodeableConcept.coding[=].display = "Normale, uneingeschränkte Aktivität wie vor der Erkrankung (90 - 100 % nach Karnofsky)"


Instance: Fall10-Vitalstatus-Lebend
InstanceOf: Observation
Title: "Fall 10: Vitalstatus — lebend"
Description: "Vitalstatus-Observation gemäß MII Person-Modul: Patientin Christina Becker lebt zum Zeitpunkt der Nachsorge."
Usage: #example

* meta.profile = $MII_PR_Person_Vitalstatus
* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/observation-category#survey
* code.coding = $LOINC#67162-8 "Patient Disposition"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2026-04-14"
* valueCodeableConcept.coding = $MII_CS_Person_Vitalstatus#L "Patient lebt"


// ============================================================
// Kodierter Rezeptorstatus, Ki-67 und Grading (bisher nur im Befundtext).
// HER2 IHC 1+: im oBDS-Slice 'negativ', im Leitlinien-Slice 'HER2-low'.
// ============================================================

Instance: Fall10-ER-Status
InstanceOf: Senologie_ER_Status
Title: "Fall 10: ER-Status — negativ, IRS 0"
Description: "Östrogenrezeptor negativ (0 % positive Zellen)."
Usage: #example

* status = #final
* code = $LOINC#40556-3 "Estrogen receptor Ag [Presence] in Tissue by Immune stain"
* subject = Reference(Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-28"
* valueCodeableConcept.coding[DefinitionOBDS] = $LOINC#LA6577-6 "Negative"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie#negativ "negativ"
* component[AnteilPositiveZellen].valueQuantity.value = 0
* component[AnteilPositiveZellen].valueQuantity.unit = "%"
* component[AnteilPositiveZellen].valueQuantity.system = "http://unitsofmeasure.org"
* component[AnteilPositiveZellen].valueQuantity.code = #%
* component[irsScore].valueQuantity.value = 0
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}


Instance: Fall10-PR-Status
InstanceOf: Senologie_PR_Status
Title: "Fall 10: PR-Status — negativ, IRS 0"
Description: "Progesteronrezeptor negativ (0 % positive Zellen)."
Usage: #example

* status = #final
* code = $LOINC#85339-0 "Progesterone receptor [Interpretation] in Tissue by Immune stain"
* subject = Reference(Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-28"
* valueCodeableConcept.coding[DefinitionOBDS] = $LOINC#LA6577-6 "Negative"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-rezeptorstatus-leitlinie#negativ "negativ"
* component[AnteilPositiveZellen].valueQuantity.value = 0
* component[AnteilPositiveZellen].valueQuantity.unit = "%"
* component[AnteilPositiveZellen].valueQuantity.system = "http://unitsofmeasure.org"
* component[AnteilPositiveZellen].valueQuantity.code = #%
* component[irsScore].valueQuantity.value = 0
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}


Instance: Fall10-HER2-Status
InstanceOf: Senologie_HER2_Status
Title: "Fall 10: HER2-Status — HER2-low (IHC 1+)"
Description: "HER2 IHC 1+. Im oBDS-Slice 'negativ' (damit triple-negativ im Register), im Leitlinien-Slice 'HER2-low'."
Usage: #example

* status = #final
* code = $LOINC#48676-1 "HER2 Ag [Interpretation] in Tissue"
* subject = Reference(Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-28"
* valueCodeableConcept.coding[DefinitionLeitlinie] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie#low "HER2-low"
* valueCodeableConcept.coding[DefinitionOBDS] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-obds#N "negativ"
* valueCodeableConcept.coding[2] = $SCT#1381317004 "Human epidermal growth factor receptor 2 low"
* component[IHCScore].valueCodeableConcept = $LOINC#LA11841-6 "1+"


Instance: Fall10-Ki67
InstanceOf: Senologie_Ki67_Proliferationsindex
Title: "Fall 10: Ki-67 55 %"
Usage: #example

* status = #final
* code.coding = $LOINC#85330-9 "Ki67 [Presence] in Tissue by Immune stain"
* subject = Reference(Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-28"
* valueQuantity.value = 55
* valueQuantity.unit = "%"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%


// --- Stationaerer Aufenthalt zur Operation (Ausloeser der Implantateregister-Meldung) ---
Instance: Fall10-Encounter-Stationaer
InstanceOf: Encounter
Title: "Fall 10: Stationärer Aufenthalt (Mastektomie mit Implantatrekonstruktion)"
Description: "Stationärer Aufenthalt für Mastektomie beidseits mit Sofortrekonstruktion durch Implantate"
Usage: #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* period.start = "2025-06-17"
* period.end = "2025-06-23"
* reasonReference[+] = Reference(Condition/Fall10-Diagnose-Mammakarzinom)

// --- TNM-Klassifikation (kodiert): UICC + SNOMED CT je Kategorie ---
Instance: Fall10-TNM-Klassifikation
InstanceOf: https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/StructureDefinition/mii-pr-onko-tnm-klassifikation
Title: "Fall 10: TNM-Klassifikation cT1c cN0 cM0"
Description: "TNM-Klassifikation cT1c cN0 cM0, UICC IA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent."
Usage: #example

* status = #final
* code.coding[0] = $SCT#399537006 "Clinical TNM stage grouping"
* code.coding[1] = $LOINC#21908-9 "Stage group.clinical Cancer"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* focus = Reference(Fall10-Diagnose-Mammakarzinom)
* effectiveDateTime = "2025-05-20"
* method = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-tnm-version#8 "8. Auflage"
* valueCodeableConcept = https://www.uicc.org/resources/tnm#IA "Stadium IA — T1 N0 M0"
* component[+].code = $LOINC#21905-5 "Primary tumor.clinical [Class] Cancer"
* component[=].valueCodeableConcept.coding[0] = https://www.uicc.org/resources/tnm#T1c "T1c — > 1 cm und ≤ 2 cm"
* component[=].valueCodeableConcept.coding[1] = $SCT#1352973007 "cT1c (UICC)"
* component[+].code = $LOINC#21906-3 "Regional lymph nodes.clinical [Class] Cancer"
* component[=].valueCodeableConcept.coding[0] = https://www.uicc.org/resources/tnm#N0 "N0 — Keine regionären LK-Metastasen"
* component[=].valueCodeableConcept.coding[1] = $SCT#1353041009 "cN0 (UICC)"
* component[+].code = $LOINC#21907-1 "Distant metastases.clinical [Class] Cancer"
* component[=].valueCodeableConcept.coding[0] = https://www.uicc.org/resources/tnm#M0 "M0 — Keine Fernmetastasen"
* component[=].valueCodeableConcept.coding[1] = $SCT#1352512001 "cM0 (UICC)"
