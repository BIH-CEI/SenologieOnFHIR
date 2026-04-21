// ============================================================
// Fall 12: Renate Vogel — B3-Läsion (ADH), unklare Dignität
// Screening-Mammographie → BI-RADS 4a (Mikrokalzifikationen)
// Vakuumbiopsie: Atypische duktale Hyperplasie (ADH), B3
// Nachresektion (offene Biopsie) empfohlen → kein Upgrade, nur ADH, R0
// Keine weitere Therapie, engmaschige Nachsorge
// ============================================================

// --- Patient ---
Instance: Fall12-Patient-Renate-Vogel
InstanceOf: Patient
Title: "Fall 12: Patientin Renate Vogel"
Description: "Synthetische Testpatientin — B3-Läsion (ADH), Nachresektion ohne Upgrade"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-012"
* name.family = "Vogel"
* name.given = "Renate"
* gender = #female
* birthDate = "1981-03-06"
* address.city = "Bonn"
* address.country = "DE"


// --- Diagnose (B3-Läsion — als Maligne wegen D48.6 Meldepflicht) ---
Instance: Fall12-Diagnose-ADH
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 12: ADH (B3-Läsion), D48.6"
Description: "Atypische duktale Hyperplasie (ADH), B3-Läsion, ICD-10 D48.6 (meldepflichtig)"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

// Diagnosekode
* code.coding[sct] = $SCT#269497004 "Neoplasm of uncertain behavior of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #D48.6
* code.coding[icd10-gm].display = "Neubildung unsicheren oder unbekannten Verhaltens: Brustdrüse [Mamma]"
* code.text = "Atypische duktale Hyperplasie (ADH), B3-Läsion"

// Seite
* bodySite.coding = $SCT#80248007 "Left breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2025-07-15"

// Onset
* onsetDateTime = "2025-07-15"

// Patient
* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)
* recordedDate = "2025-07-15"


// --- Bildgebung Mammographie ---
Instance: Fall12-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 12: Screening-Mammographie bilateral"
Description: "Screening-Mammographie mit Mikrokalzifikationen links BI-RADS 4a"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Screening-Mammographie bilateral"

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)
* effectiveDateTime = "2025-07-10"

* result[+] = Reference(Observation/Fall12-BiRADS-Links)

* conclusion = "BI-RADS 4a links: gruppierte Mikrokalzifikationen im oberen inneren Quadranten, abklärungsbedürftig. BI-RADS 1 rechts."


// --- BI-RADS Observation ---
Instance: Fall12-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 12: BI-RADS 4a links"
Description: "BI-RADS 4a Befund der linken Brust — geringe Malignitätswahrscheinlichkeit"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)
* effectiveDateTime = "2025-07-10"

* bodySite = $SCT#80248007 "Left breast structure"

* valueCodeableConcept.coding = $SCT#397144001 "BI-RADS assessment category 4"
* valueCodeableConcept.text = "BI-RADS 4a — geringe Malignitätswahrscheinlichkeit"

* note.text = "Gruppierte Mikrokalzifikationen links OIQ, ca. 12 mm Ausdehnung, abklärungsbedürftig"


// --- Pathologie Befund 1: Vakuumbiopsie ---
Instance: Fall12-Pathologie-Befund-Vakuumbiopsie
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 12: Pathologie Vakuumbiopsie — ADH, B3"
Description: "Pathologischer Befund der Vakuumbiopsie: Atypische duktale Hyperplasie, B3-Kategorie"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001201"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-07-15"
* issued = "2025-07-18T10:00:00+02:00"

* performer.display = "Institut für Pathologie, Universitätsklinikum Bonn"

* specimen = Reference(Specimen/Fall12-Pathologie-Praeparat-Vakuumbiopsie)

* result[diagnostic-conclusion] = Reference(Observation/Fall12-Patho-Conclusion-Vakuumbiopsie)

* conclusion = "Atypische duktale Hyperplasie (ADH), B3-Kategorie. Nachresektion empfohlen zum Ausschluss eines DCIS/invasiven Karzinoms."


Instance: Fall12-Patho-Conclusion-Vakuumbiopsie
InstanceOf: Observation
Title: "Fall 12: Pathologische Diagnose Vakuumbiopsie"
Description: "Diagnostische Schlussfolgerung: ADH, B3"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)
* effectiveDateTime = "2025-07-18"
* valueString = "Atypische duktale Hyperplasie (ADH), B3. Offene Biopsie / Nachresektion zum Ausschluss eines Upgrades empfohlen."


// --- Pathologie Präparat 1: Vakuumbiopsie ---
Instance: Fall12-Pathologie-Praeparat-Vakuumbiopsie
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 12: Vakuumbiopsie-Präparat links OIQ"
Description: "Vakuumbiopsie aus dem oberen inneren Quadranten der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-001201-A"

* status = #available

* type.coding[sct] = $SCT#122573003 "Core needle biopsy specimen"
* type.text = "Vakuumbiopsie (stereotaktisch gesteuert)"

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, oberer innerer Quadrant"
* collection.collectedDateTime = "2025-07-15"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Tumorboard ---
Instance: Fall12-Tumorboard
InstanceOf: Senologie_Tumorboard_Empfehlung
Title: "Fall 12: Tumorboard-Empfehlung — Nachresektion empfohlen"
Description: "Empfehlung: offene Biopsie / Nachresektion zum Ausschluss eines Upgrades bei B3-Läsion"
Usage: #example

* status = #active
* intent = #plan

* title = "Tumorboard-Empfehlung Renate Vogel — ADH B3"
* description = "B3-Läsion (ADH) in Vakuumbiopsie. Nachresektion (offene Biopsie) empfohlen zum Ausschluss eines DCIS oder invasiven Karzinoms. Bei reiner ADH nach Nachresektion: keine weitere Therapie, engmaschige Nachsorge."

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)
* period.start = "2025-07-22"

* addresses = Reference(Condition/Fall12-Diagnose-ADH)

// Operative Therapie
* activity[operativeTherapy].detail.kind = #ServiceRequest
* activity[operativeTherapy].detail.code = $SCT#387713003 "Surgical procedure (procedure)"
* activity[operativeTherapy].detail.code.text = "Offene Biopsie / Nachresektion links OIQ"
* activity[operativeTherapy].detail.status = #scheduled

// Follow-up
* activity[followUp].detail.kind = #Appointment
* activity[followUp].detail.code = $SCT#390906007 "Follow-up encounter (procedure)"
* activity[followUp].detail.code.text = "Engmaschige Nachsorge: Mammographie + Sono alle 6 Monate für 2 Jahre"
* activity[followUp].detail.status = #scheduled


// --- Operation: Nachresektion (offene Biopsie) ---
Instance: Fall12-Operation-Nachresektion
InstanceOf: Senologie_Operation
Title: "Fall 12: Nachresektion / offene Biopsie links"
Description: "Offene Biopsie / Nachresektion links OIQ bei B3-Läsion (ADH), R0, kein Upgrade"
Usage: #example

* status = #completed

// Intention
* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#D "diagnostisch"

// Art der Operation
* category = $SCT#392022002 "Excision of mass"

// OPS-Code
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a0
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma: Lumpektomie"
* code.text = "Offene Biopsie / Nachresektion links OIQ"

// Lateralität
* bodySite = $SCT#80248007 "Left breast structure"

// Zeitpunkt
* performedDateTime = "2025-08-05"

// Patient
* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)

// Bezogene Diagnose
* reasonReference = Reference(Condition/Fall12-Diagnose-ADH)

// Follow-up
* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Keine Drainage"
* followUp[verband].coding = $SCT#262171009 "Dressing of wound"
* followUp[verband].text = "Steristrips"

// Outcome
* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "R0, kein Upgrade — nur ADH, kein DCIS, kein invasives Karzinom"


// --- Pathologie Befund 2: Nachresektion ---
Instance: Fall12-Pathologie-Befund-Nachresektion
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 12: Pathologie Nachresektion — ADH, kein Upgrade, R0"
Description: "Pathologischer Befund der Nachresektion: ADH bestätigt, kein DCIS, kein invasives Karzinom, R0"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-001202"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)

* basedOn.display = "Anforderung Histologie durch Senologie"

* effectiveDateTime = "2025-08-05"
* issued = "2025-08-08T14:00:00+02:00"

* performer.display = "Institut für Pathologie, Universitätsklinikum Bonn"

* specimen = Reference(Specimen/Fall12-Pathologie-Praeparat-Nachresektion)

* result[diagnostic-conclusion] = Reference(Observation/Fall12-Patho-Conclusion-Nachresektion)

* conclusion = "Exzisionspräparat: Atypische duktale Hyperplasie (ADH), R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade."


Instance: Fall12-Patho-Conclusion-Nachresektion
InstanceOf: Observation
Title: "Fall 12: Pathologische Diagnose Nachresektion"
Description: "Diagnostische Schlussfolgerung: ADH bestätigt, kein Upgrade, R0"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)
* effectiveDateTime = "2025-08-08"
* valueString = "ADH bestätigt, R0 reseziert. Kein DCIS, kein invasives Karzinom. Kein Upgrade. Keine weitere Therapie erforderlich."


// --- Pathologie Präparat 2: Nachresektion ---
Instance: Fall12-Pathologie-Praeparat-Nachresektion
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 12: Exzisionspräparat Nachresektion links OIQ"
Description: "Exzisionspräparat aus dem oberen inneren Quadranten der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-001202-A"

* status = #available

* type.coding[sct] = $SCT#309502007 "Excision biopsy specimen"
* type.text = "Exzisionspräparat"

* subject = Reference(Patient/Fall12-Patient-Renate-Vogel)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, oberer innerer Quadrant"
* collection.collectedDateTime = "2025-08-05"
* collection.method = $SCT#129314006 "Biopsy - action"
