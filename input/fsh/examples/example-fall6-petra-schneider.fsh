// ============================================================
// Fall 6: Petra Schneider — DCIS (Stadium 0)
// Duktales Carcinoma in situ links, G2, ER+
// Screening-Mammographie → BI-RADS 4 (Mikrokalzifikationen)
// Vakuumbiopsie → DCIS bestätigt
// BET links → R0, knapp
// Adjuvant RT 50 Gy, Tamoxifen optional
// ============================================================

// --- Patient ---
Instance: Fall6-Patient-Petra-Schneider
InstanceOf: Patient
Title: "Fall 6: Patientin Petra Schneider"
Description: "Synthetische Testpatientin — DCIS, Screening-Detektion, Stadium 0"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-006"
* name.family = "Schneider"
* name.given = "Petra"
* gender = #female
* birthDate = "1958-09-08"
* address.city = "Frankfurt"
* address.country = "DE"


// --- Diagnose ---
Instance: Fall6-Diagnose-DCIS
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 6: DCIS links"
Description: "Duktales Carcinoma in situ (DCIS) links, G2, ER+"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#109889007 "Ductal carcinoma in situ of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #D05.1
* code.coding[icd10-gm].display = "Carcinoma in situ der Brustdrüse: Intraduktales Carcinoma in situ"
* code.text = "Duktales Carcinoma in situ (DCIS) links, G2, ER+"

* bodySite.coding = $SCT#80248007 "Left breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-04-05"
* onsetDateTime = "2025-04-05"

* stage[+].summary.text = "Stadium 0 (DCIS, Tis)"
* stage[=].type = $SCT#254292007 "Tumor staging"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)
* recordedDate = "2025-04-05"


// --- Bildgebung Mammographie (Screening) ---
Instance: Fall6-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Fall 6: Screening-Mammographie bilateral"
Description: "Screening-Mammographie mit Mikrokalzifikationen links BI-RADS 4"
Usage: #example

* status = #final
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #18781-5
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Screening-Mammographie bilateral"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)
* effectiveDateTime = "2025-03-28"

* result[+] = Reference(Observation/Fall6-BiRADS-Links)

* conclusion = "BI-RADS 4 links — suspekte Mikrokalzifikationen. BI-RADS 1 rechts."


// --- BI-RADS Observation ---
Instance: Fall6-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Fall 6: BI-RADS 4 links"
Description: "BI-RADS 4 Befund links — Mikrokalzifikationen"
Usage: #example

* status = #final

* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)
* effectiveDateTime = "2025-03-28"

* bodySite = $SCT#80248007 "Left breast structure"

* valueCodeableConcept.coding = $SCT#397142005 "BI-RADS assessment category 4"
* valueCodeableConcept.text = "BI-RADS 4 — suspekt, Mikrokalzifikationen"

* note.text = "Gruppierte polymorphe Mikrokalzifikationen links, Ausdehnung ca. 15 mm, suspekt"


// --- Pathologie Befund (Vakuumbiopsie) ---
Instance: Fall6-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Fall 6: Pathologie Vakuumbiopsie — DCIS G2, ER+"
Description: "Pathologischer Befund der Vakuumbiopsie: DCIS G2, ER+, kein invasiver Anteil"
Usage: #example

* status = #final

* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2025-002345"

* code.coding[pathology-report] = $LOINC#60568-3 "Pathology Synoptic report"
* code.text = "Pathologischer Befund"

* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)

* basedOn.display = "Anforderung Histologie — Vakuumbiopsie"

* effectiveDateTime = "2025-04-02"
* issued = "2025-04-05T10:00:00+02:00"

* performer.display = "Institut für Pathologie, Universitätsklinikum Frankfurt"

* specimen = Reference(Specimen/Fall6-Pathologie-Praeparat)

* result[diagnostic-conclusion] = Reference(Observation/Fall6-Patho-Conclusion)

* conclusion = "DCIS, G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil nachweisbar"


Instance: Fall6-Patho-Conclusion
InstanceOf: Observation
Title: "Fall 6: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)
* effectiveDateTime = "2025-04-05"
* valueString = "Duktales Carcinoma in situ (DCIS), G2, kribriformer Typ, ER+ IRS 8, kein invasiver Anteil"


// --- Pathologie Präparat (Vakuumbiopsie) ---
Instance: Fall6-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Fall 6: Vakuumbiopsie-Präparat links"
Description: "Stereotaktische Vakuumbiopsie aus der linken Brust"
Usage: #example

* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2025-002345-A"

* status = #available

* type.coding[sct] = $SCT#119380005 "Specimen from breast obtained by biopsy"
* type.text = "Vakuumbiopsie"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)

* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, Mikrokalzifikationen"
* collection.collectedDateTime = "2025-04-02"
* collection.method = $SCT#129314006 "Biopsy - action"


// --- Operation ---
Instance: Fall6-Operation-BET
InstanceOf: Senologie_Operation
Title: "Fall 6: BET links"
Description: "Brusterhaltende Therapie links bei DCIS, R0 knapp"
Usage: #example

* status = #completed

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* category = $SCT#392022002 "Excision of mass"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.91
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma: Exzision ohne axilläre Lymphknotenexzision"
* code.text = "BET links (DCIS-Exzision)"

* bodySite = $SCT#80248007 "Left breast structure"

* performedDateTime = "2025-04-22"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)

* reasonReference = Reference(Condition/Fall6-Diagnose-DCIS)

* followUp[drainage].coding = $SCT#122462000 "Drainage procedure"
* followUp[drainage].text = "Redon-Drainage 10 Ch"
* followUp[verband].coding = $SCT#262171009 "Dressing of wound"
* followUp[verband].text = "Kompressionsverband"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "R0, knapper Resektionsrand (2 mm). Tis(DCIS), kein invasiver Anteil."


// --- Strahlentherapie ---
Instance: Fall6-Strahlentherapie
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 6: Adjuvante Bestrahlung 50 Gy (kein Boost)"
Description: "Adjuvante Ganzbrustbestrahlung links nach BET bei DCIS"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger, intensitätsmodulierte Radiotherapie: Mit bildgestützter Bestrahlungsplanung"

* subject = Reference(Patient/Fall6-Patient-Petra-Schneider)

* performedPeriod.start = "2025-05-19"
* performedPeriod.end = "2025-06-20"

* bodySite = $SCT#80248007 "Left breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"

* reasonReference = Reference(Condition/Fall6-Diagnose-DCIS)

* note.text = "Ganzbrust links 50 Gy in 25 Fraktionen, kein Boost (DCIS)"
