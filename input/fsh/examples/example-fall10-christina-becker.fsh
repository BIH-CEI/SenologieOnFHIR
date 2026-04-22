// ============================================================
// Fall 10: Christina Becker — BRCA1-Trägerin, TNBC Stadium IA
// Invasives Karzinom NST rechts, G3, ER- PR- HER2-, Ki-67 55%
// cT1c cN0 cM0, UICC IA
// BRCA1-Mutation, Mutter Mamma-Ca 41 J., Schwester Ovarial-Ca 39 J.
// Bilaterale Mastektomie (therapeutisch re + prophylaktisch li)
// Sofortrekonstruktion beidseits mit Brustimplantat
// Adjuvant: Carboplatin + Paclitaxel
// ============================================================

// --- Patient ---
Instance: Fall10-Patient-Christina-Becker
InstanceOf: Patient
Title: "Fall 10: Patientin Christina Becker"
Description: "Synthetische Testpatientin — BRCA1-Trägerin, TNBC rechts, bilaterale Mastektomie mit Implantatrekonstruktion"
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
Description: "Triple-negatives invasives Mammakarzinom NST rechts, G3, UICC IA, BRCA1-Trägerin"
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
* code.text = "Invasives Mammakarzinom NST rechts, triple-negativ, BRCA1-Mutation"

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
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
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
Description: "Pathologischer Befund: Invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 55%, BRCA1-positiv"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001001"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall10-Patient-Christina-Becker)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-05-25"
* issued = "2025-05-28T11:00:00+02:00"

* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

* specimen = Reference(Specimen/Fall10-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall10-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G3, ER negativ (IRS 0), PR negativ (IRS 0), HER2 negativ (Score 0), Ki-67 55%. BRCA1-Mutation bekannt."


Instance: Fall10-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 10: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall10-Patient-Christina-Becker)
* effectiveDateTime = "2025-05-28"
* valueString = "Invasives Karzinom NST, G3, pT1c, ER- IRS 0, PR- IRS 0, HER2- Score 0, Ki-67 55%, triple-negativ"


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
* code.coding[=].code = #5-872
* code.coding[=].display = "(Modifizierte radikale) Mastektomie"
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
Description: "Prophylaktische kontralaterale Mastektomie links bei BRCA1-Mutation"
Usage: #example

* status = #completed

// Intention — prophylaktisch (kein oBDS-Code, daher S=Sonstiges)
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#S "sonstiges"

// Art der Operation
* category = $SCT#172043006 "Simple mastectomy"

// OPS-Code Mastektomie
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-872
* code.coding[=].display = "(Modifizierte radikale) Mastektomie"
* code.text = "Prophylaktische Mastektomie links (risikoreduktiv bei BRCA1)"

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

* type.text = "Brustimplantat (Silikon)"
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

* type.text = "Brustimplantat (Silikon)"
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
* code.coding[=].code = #5-886.17
* code.coding[=].display = "Andere plastische Rekonstruktion der Mamma: Einsetzen eines Brustimplantates: nach Mastektomie"
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
* code.coding[=].code = #5-886.17
* code.coding[=].display = "Andere plastische Rekonstruktion der Mamma: Einsetzen eines Brustimplantates: nach Mastektomie"
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
Description: "Adjuvante Chemotherapie mit Carboplatin + Paclitaxel bei TNBC + BRCA1"
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

* usedCode.text = "Carboplatin AUC5 q3w + Paclitaxel 175 mg/m2 q3w x6 Zyklen (TNBC + BRCA1)"


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
