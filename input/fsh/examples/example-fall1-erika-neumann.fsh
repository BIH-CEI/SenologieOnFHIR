// ============================================================
// Fall 1: Erika Neumann — Frühes Stadium, kurativ
// Invasives Karzinom NST links OAQ, cT1c cN0 cM0, UICC IA
// ER+ PR+ HER2- Ki-67 15%, Oncotype DX RS 18
// BET + SLNB → adjuvante RT + endokrine Therapie
// ============================================================

// --- Patient ---
Instance: Fall1-Patient-Erika-Neumann
InstanceOf: Patient
Title: "Fall 1: Patientin Erika Neumann"
Description: "Synthetische Testpatientin — frühes Mammakarzinom, kurative Behandlung"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-001"
* name.family = "Neumann"
* name.given = "Erika"
* gender = #female
* birthDate = "1966-03-12"
* address.city = "Berlin"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall1-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 1: Mammakarzinom links OAQ, cT1c cN0 cM0"
Description: "Invasives Mammakarzinom NST der linken Brust, oberer äußerer Quadrant, UICC IA"
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
* code.text = "Invasives Mammakarzinom NST links, oberer äußerer Quadrant"

// Seite
* bodySite.coding = $SCT#80248007 "Left breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2025-01-15"

// Onset
* onsetDateTime = "2025-01-15"

// Stadium — cT1c cN0 cM0, UICC IA
* stage[+].summary.text = "UICC IA (cT1c cN0 cM0)"
* stage[=].type = $SCT#254292007 "Tumor staging"
* stage[metastasis].summary.text = "cM0"
* stage[metastasis].type = $SCT#385349001 "Clinical stage (observable entity)"

// Patient
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* recordedDate = "2025-01-15"


// --- Bildgebung Mammographie ---
Instance: Fall1-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 1: Mammographie bilateral"
Description: "Mammographie bilateral mit suspektem Herdbefund links BI-RADS 5"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-15"

* result[+] = Reference(Observation/Fall1-BiRADS-Links)

* conclusion = "BI-RADS 5 links oben außen, BI-RADS 1 rechts"


// --- BI-RADS Observation ---
Instance: Fall1-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 1: BI-RADS 5 links"
Description: "BI-RADS 5 Befund der linken Brust"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-15"

* bodySite = $SCT#80248007 "Left breast structure"

* valueCodeableConcept.coding = $SCT#397143000 "BI-RADS assessment category 5"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Suspekter Herdbefund OAQ links, 18 mm, unscharf begrenzt"


// --- Bildgebung Sonstige: Skelettszintigraphie ---
Instance: Fall1-Bildgebung-Skelettszintigraphie
InstanceOf: Senologie_Bildgebung_Sonstige
Title: "Fall 1: Skelettszintigraphie (Staging)"
Description: "Skelettszintigraphie im Rahmen des Stagings — kein Hinweis auf ossäre Metastasen"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[snomed] = http://snomed.info/sct#44491008 "Bone scan"
* code.coding[loinc] = http://loinc.org#39638-7 "Bone scan"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-18"

* conclusion = "Kein Hinweis auf ossäre Metastasen. Regelrechte Skelettszintigraphie."


// --- Pathologie Befund ---
Instance: Fall1-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 1: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-"
Description: "Pathologischer Befund der Stanzbiopsie: invasives Karzinom NST, G2, hormonrezeptor-positiv, HER2-negativ"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-000123"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-01-20"
* issued = "2025-01-23T10:00:00+01:00"

* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

* specimen = Reference(Specimen/Fall1-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall1-Patho-Conclusion)

* conclusion = "Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%"


Instance: Fall1-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 1: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-23"
* valueString = "Invasives Karzinom NST, G2, pT1c, ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15%"


// --- Pathologie Präparat ---
Instance: Fall1-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 1: Stanzbiopsie-Präparat links OAQ"
Description: "Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-000123-A"

* status = #available

* type.coding[sct] = $SCT#122573003 "Core needle biopsy specimen"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, oberer äußerer Quadrant"
* collection.collectedDateTime = "2025-01-20"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Klinische Untersuchung ---
Instance: Fall1-Klinische-Untersuchung
InstanceOf: Senologie_Klinische_Untersuchung
Title: "Fall 1: Klinische Brustuntersuchung"
Description: "Klinische Untersuchung mit tastbarem Knoten links OAQ"
Usage: #example

* status = #final

* code = $LOINC#32422-8 "Physical findings of Breast"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-15"

* bodySite.coding = $SCT#80248007 "Left breast structure"

* component[palpationsbefund].code = $SCT#118242002 "Finding by palpation"
* component[palpationsbefund].valueString = "Tastbarer Knoten OAQ links, ca. 2 cm, derb, verschieblich"

* component[hautveraenderungen].code = $SCT#115951000119105 "Breast symptom of change in skin"
* component[hautveraenderungen].valueString = "Keine Hautveränderungen"

* component[mamillenbefund].code = $SCT#248819006 "Nipple finding"
* component[mamillenbefund].valueString = "Mamille unauffällig, keine Sekretion"

* component[lymphknotenstatus].code = $SCT#248858001 "Axillary lymph node abnormality"
* component[lymphknotenstatus].valueString = "Axilläre Lymphknoten beidseits klinisch unauffällig"


// --- Gynäkologische Anamnese ---
Instance: Fall1-Gynaekologische-Anamnese
InstanceOf: Senologie_Gynaekologische_Anamnese
Title: "Fall 1: Gynäkologische Anamnese"
Description: "Postmenopausale Patientin, Menarche mit 13, Menopause mit 54"
Usage: #example

* status = #final

* code = $LOINC#89221-6 "Gynecology History and physical note"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-15"

* component[menarche].code = $LOINC#42798-9 "Age at menarche"
* component[menarche].valueQuantity.value = 13
* component[menarche].valueQuantity.unit = "Jahre"
* component[menarche].valueQuantity.system = "http://unitsofmeasure.org"
* component[menarche].valueQuantity.code = #a

* component[menopause].code = $LOINC#42802-9 "Age at menopause"
* component[menopause].valueQuantity.value = 54
* component[menopause].valueQuantity.unit = "Jahre"
* component[menopause].valueQuantity.system = "http://unitsofmeasure.org"
* component[menopause].valueQuantity.code = #a

* component[schwangerschaften].code = $LOINC#11996-6 "Number of pregnancies"
* component[schwangerschaften].valueQuantity.value = 2
* component[schwangerschaften].valueQuantity.unit = "Schwangerschaften"
* component[schwangerschaften].valueQuantity.system = "http://unitsofmeasure.org"
* component[schwangerschaften].valueQuantity.code = #1

* component[hormonersatztherapie].code = $SCT#266717002 "Hormone replacement therapy"
* component[hormonersatztherapie].valueCodeableConcept.text = "Keine HRT"


// --- Familienanamnese ---
Instance: Fall1-Familienanamnese
InstanceOf: Senologie_Familienanamnese
Title: "Fall 1: Familienanamnese — Mutter Mammakarzinom"
Description: "Mutter mit Mammakarzinom im Alter von 52 Jahren"
Usage: #example

* status = #completed

* patient = Reference(Patient/Fall1-Patient-Erika-Neumann)

* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#MTH "mother"

* condition[mammakarzinom].code = $SCT#254837009 "Malignant neoplasm of breast"
* condition[mammakarzinom].onsetAge.value = 52
* condition[mammakarzinom].onsetAge.unit = "Jahre"
* condition[mammakarzinom].onsetAge.system = "http://unitsofmeasure.org"
* condition[mammakarzinom].onsetAge.code = #a


// --- Genexpressions-Score ---
Instance: Fall1-Genexpressions-Score
InstanceOf: Senologie_Genexpressions_Score
Title: "Fall 1: Oncotype DX Recurrence Score 18"
Description: "Oncotype DX Recurrence Score von 18 (niedrig)"
Usage: #example

* status = #final

* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory

* code.coding[genexpressionstest] = http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-genexpressionstest#oncotype-dx "Oncotype DX"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2025-01-25"

* valueQuantity.value = 18
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #1
* valueQuantity.unit = "Score"


// --- Genexpressionstest (RiskAssessment) ---
Instance: Fall1-Genexpressionstest
InstanceOf: Senologie_Genexpressionstest
Title: "Fall 1: Oncotype DX Risikobewertung"
Description: "Oncotype DX: niedriges Risiko, 10-Jahres-Fernrezidivrisiko 12%"
Usage: #example

* status = #final

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* occurrenceDateTime = "2025-01-25"

* condition = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

* method = http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-genexpressionstest#oncotype-dx "Oncotype DX"

* basis = Reference(Observation/Fall1-Genexpressions-Score)

* prediction.outcome.text = "Fernrezidiv"
* prediction.qualitativeRisk = http://terminology.hl7.org/CodeSystem/risk-probability#low "Low likelihood"
* prediction.probabilityDecimal = 0.12
* prediction.whenRange.low.value = 0
* prediction.whenRange.low.unit = "Jahre"
* prediction.whenRange.low.system = "http://unitsofmeasure.org"
* prediction.whenRange.low.code = #a
* prediction.whenRange.high.value = 10
* prediction.whenRange.high.unit = "Jahre"
* prediction.whenRange.high.system = "http://unitsofmeasure.org"
* prediction.whenRange.high.code = #a


// --- Tumorboard ---
Instance: Fall1-Tumorboard
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 1: Tumorboard-Empfehlung"
Description: "Empfehlung: BET + SLNB, adjuvante RT, endokrine Therapie, keine Chemotherapie"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Erika Neumann"
* description = "Empfehlung: Brusterhaltende Therapie mit Sentinel-LK-Biopsie, adjuvante Strahlentherapie, endokrine Therapie (Aromatasehemmer). Keine Chemotherapie aufgrund Oncotype DX RS 18."

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)
* period.start = "2025-01-28"

* addresses = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

// Operative Therapie
* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code.text = "BET links + Sentinel-LK-Biopsie"
* activity[operativeTherapy].detail.status = #scheduled

// Strahlentherapie
* activity[radiotherapy].detail.kind = #ServiceRequest
* activity[radiotherapy].detail.code.text = "Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 10 Gy"
* activity[radiotherapy].detail.status = #scheduled

// Endokrine Therapie
* activity[endocrineTherapy].detail.kind = #MedicationRequest
* activity[endocrineTherapy].detail.code.text = "Aromatasehemmer (Letrozol) für 5-10 Jahre"
* activity[endocrineTherapy].detail.status = #scheduled

// Keine Chemotherapie
* activity[chemotherapy].detail.kind = #MedicationRequest
* activity[chemotherapy].detail.code.text = "Keine Chemotherapie empfohlen"
* activity[chemotherapy].detail.status = #not-started
* activity[chemotherapy].detail.doNotPerform = true


// --- OP Planung ---
Instance: Fall1-OP-Planung
InstanceOf: Senologie_OP_Planung
Title: "Fall 1: OP-Planung BET + SLNB"
Description: "Geplante brusterhaltende Therapie links mit Sentinel-LK-Biopsie"
Usage: #example

* status = #draft
* intent = #plan

* code.text = "BET links + Sentinel-LK-Biopsie"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

* bodySite.coding = $SCT#80248007 "Left breast structure"

* reasonCode.text = "Kurative Intention"

* note.text = "BET links OAQ, SLNB links. Präoperative Drahtmarkierung geplant."

* extension[operationsDuration].valueDuration.value = 90
* extension[operationsDuration].valueDuration.unit = "min"
* extension[operationsDuration].valueDuration.system = "http://unitsofmeasure.org"
* extension[operationsDuration].valueDuration.code = #min

* extension[tumorConferenceConsent].valueCodeableConcept.text = "Ja"

* extension[preOpMarkierung].valueCodeableConcept.text = "Drahtmarkierung"


// --- Operation ---
Instance: Fall1-Operation-BET
InstanceOf: Senologie_Operation
Title: "Fall 1: BET links + SLNB"
Description: "Brusterhaltende Therapie links mit Sentinel-LK-Biopsie, R0"
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
// OPS-Code SLNB
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Sentinel-Lymphonodektomie"
* code.text = "BET links, Sentinel-LK-Biopsie"

// Lateralität
* bodySite = $SCT#80248007 "Left breast structure"

// Zeitpunkt
* performedDateTime = "2025-02-05"

// Patient
* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage device"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#262171009 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

// Outcome
* outcome.text = "R0-Resektion, Sentinel negativ (0/2)"


// --- Strahlentherapie ---
Instance: Fall1-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 1: Adjuvante Bestrahlung 50 Gy + 10 Gy Boost"
Description: "Adjuvante Ganzbrustbestrahlung links 50 Gy in 25 Fraktionen + 10 Gy Boost"
Usage: #example

* status = #completed

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger, intensitätsmodulierte Radiotherapie: Mit bildgestützter Bestrahlungsplanung"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

* performedPeriod.start = "2025-03-10"
* performedPeriod.end = "2025-04-18"

* bodySite = $SCT#80248007 "Left breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 30
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall1-Diagnose-Mammakarzinom)

* note.text = "Ganzbrust 50 Gy in 25 Fraktionen + Boost 10 Gy in 5 Fraktionen auf Tumorbett, Gesamtdosis 60 Gy"


// --- Begleitmedikation Metoprolol ---
Instance: Fall1-Begleitmedikation-Metoprolol
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 1: Begleitmedikation Metoprolol 47,5 mg"
Description: "Metoprolol 47,5 mg 1x täglich wegen arterieller Hypertonie"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#372826007 "Metoprolol"
* medicationCodeableConcept.text = "Metoprolol 47,5 mg"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

* effectivePeriod.start = "2020-03-01"

* dateAsserted = "2025-01-15"

* dosage.text = "1x täglich morgens"
* dosage.doseAndRate.doseQuantity.value = 47.5
* dosage.doseAndRate.doseQuantity.unit = "mg"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #mg


// --- Begleitmedikation L-Thyroxin ---
Instance: Fall1-Begleitmedikation-LThyroxin
InstanceOf: Senologie_Begleitmedikation
Title: "Fall 1: Begleitmedikation L-Thyroxin 75 µg"
Description: "L-Thyroxin 75 µg 1x täglich wegen Hypothyreose"
Usage: #example

* status = #active

* medicationCodeableConcept.coding = $SCT#768532006 "Levothyroxine sodium"
* medicationCodeableConcept.text = "L-Thyroxin 75 µg"

* subject = Reference(Patient/Fall1-Patient-Erika-Neumann)

* effectivePeriod.start = "2018-06-01"

* dateAsserted = "2025-01-15"

* dosage.text = "1x täglich morgens nüchtern"
* dosage.doseAndRate.doseQuantity.value = 75
* dosage.doseAndRate.doseQuantity.unit = "ug"
* dosage.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosage.doseAndRate.doseQuantity.code = #ug
