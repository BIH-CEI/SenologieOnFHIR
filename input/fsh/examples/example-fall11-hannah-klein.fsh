// ============================================================
// Fall 11: Hannah Klein — Fibroadenom (benigne)
// Gutartiger Knoten links oben außen, 15 mm
// Mammographie BI-RADS 3, Sonographie glatt begrenzt
// Stanzbiopsie: Fibroadenom bestätigt, keine Atypie
// Keine OP, keine Therapie — Verlaufskontrolle in 6 Monaten
// ============================================================

// --- Patient ---
Instance: Fall11-Patient-Hannah-Klein
InstanceOf: Patient
Title: "Fall 11: Patientin Hannah Klein"
Description: "Synthetische Testpatientin — Fibroadenom der Brust (benigne), keine Therapie"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-011"
* name.family = "Klein"
* name.given = "Hannah"
* gender = #female
* birthDate = "1991-08-23"
* address.city = "Leipzig"
* address.country = "DE"


// --- Diagnose (Benigne) ---
Instance: Fall11-Diagnose-Fibroadenom
InstanceOf: Senologie_Diagnose_Benigne
Title: "Fall 11: Fibroadenom links oben außen"
Description: "Fibroadenom der linken Brust — benigne Diagnose, histologisch bestätigt"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

// Diagnosekode
* code.coding[sct] = $SCT#254845004 "Fibroadenoma of breast"
* code.coding[icd10gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10gm].version = "2025"
* code.coding[icd10gm].code = #D24
* code.coding[icd10gm].display = "Gutartige Neubildung der Brustdrüse [Mamma]"
* code.text = "Fibroadenom links oben außen, 15 mm"

// Seite
* bodySite.coding = $SCT#80248007 "Left breast structure"

// Onset
* onsetDateTime = "2025-09-01"

// Patient
* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)
* recordedDate = "2025-09-10"


// --- Bildgebung Mammographie ---
Instance: Fall11-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 11: Mammographie bilateral"
Description: "Mammographie bilateral mit BI-RADS 3 links"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)
* effectiveDateTime = "2025-09-01"

* result[+] = Reference(Observation/Fall11-BiRADS-Links)

* conclusion = "BI-RADS 3 links oben außen: ovaler, glatt begrenzter Herdbefund 15 mm, wahrscheinlich gutartig. BI-RADS 1 rechts."


// --- BI-RADS Observation ---
Instance: Fall11-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 11: BI-RADS 3 links"
Description: "BI-RADS 3 Befund der linken Brust — wahrscheinlich gutartig"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)
* effectiveDateTime = "2025-09-01"

* bodySite = $SCT#80248007 "Left breast structure"

* valueCodeableConcept.coding = $SCT#397143007 "Mammography assessment (Category 3) - Probably benign finding, short interval follow-up"
* valueCodeableConcept.text = "BI-RADS 3 — wahrscheinlich gutartig"

* note.text = "Ovaler, glatt begrenzter Herdbefund links oben außen, 15 mm, wahrscheinlich gutartig. Verlaufskontrolle empfohlen."


// --- Bildgebung Sonographie ---
Instance: Fall11-Bildgebung-Sonographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 11: Sonographie links"
Description: "Sonographie links mit glatt begrenztem, ovalem, echoarmem Knoten"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[ultrasound].system = "http://loinc.org"
* code.coding[ultrasound].code = #18740-1
* code.coding[ultrasound].display = "Ultrasound of bilateral breasts"
* code.text = "Sonographie links"

* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)
* effectiveDateTime = "2025-09-01"

* conclusion = "Glatt begrenzter, ovaler, echoarmer Knoten links oben außen, 14x9 mm, horizontale Ausrichtung, keine dorsale Schallauslöschung. Typisches Fibroadenom-Erscheinungsbild."


// --- Pathologie Befund ---
Instance: Fall11-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 11: Pathologie — Fibroadenom, keine Atypie"
Description: "Pathologischer Befund der Stanzbiopsie: Fibroadenom, keine Atypie, B2"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001101"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-09-05"
* issued = "2025-09-08T09:00:00+02:00"

* performer.display = "Institut für Pathologie, Universitätsklinikum Leipzig"

* specimen = Reference(Specimen/Fall11-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall11-Patho-Conclusion)

* conclusion = "Fibroadenom (perikanalikular), keine Atypie, B2-Kategorie. Kein Hinweis auf Malignität."


Instance: Fall11-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 11: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen — benigne"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)
* effectiveDateTime = "2025-09-08"
* valueString = "Fibroadenom (perikanalikular), keine Atypie, B2. Verlaufskontrolle in 6 Monaten empfohlen."


// --- Pathologie Präparat ---
Instance: Fall11-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 11: Stanzbiopsie-Präparat links oben außen"
Description: "Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-001101-A"

* status = #available

* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, oberer äußerer Quadrant"
* collection.collectedDateTime = "2025-09-05"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Klinische Untersuchung ---
Instance: Fall11-Klinische-Untersuchung
InstanceOf: Senologie_Klinische_Untersuchung
Title: "Fall 11: Klinische Brustuntersuchung"
Description: "Klinische Untersuchung mit tastbarem Knoten links oben außen, 15 mm, glatt begrenzt"
Usage: #example

* status = #final

* code = $LOINC#32422-8 "Physical findings of Breast"

* subject = Reference(Patient/Fall11-Patient-Hannah-Klein)
* effectiveDateTime = "2025-09-01"

* bodySite.coding = $SCT#80248007 "Left breast structure"

* component[palpationsbefund].code = $SCT#118242002 "Finding by palpation"
* component[palpationsbefund].valueString = "Tastbarer Knoten links oben außen, ca. 15 mm, glatt begrenzt, verschieblich, nicht druckschmerzhaft"

* component[hautveraenderungen].code = $SCT#115951000119105 "Breast symptom of change in skin"
* component[hautveraenderungen].valueString = "Keine Hautveränderungen"

* component[mamillenbefund].code = $SCT#248819006 "Nipple finding"
* component[mamillenbefund].valueString = "Mamille unauffällig, keine Sekretion"

* component[lymphknotenstatus].code = $SCT#301782006 "Finding of lymph node of axillary region"
* component[lymphknotenstatus].valueString = "Axilläre Lymphknoten beidseits unauffällig"
