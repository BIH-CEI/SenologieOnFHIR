// ============================================================
// Fall 13: Sabine Lehmann — Synchrones bilaterales Mammakarzinom
// Links: Invasives Karzinom NST, C50.4, pT1c pN0 M0, ER+/PR+/HER2-, G2
//   → BET + SLNB links
// Rechts: Invasives lobuläres Karzinom, C50.2, pT2 pN1a M0, ER+/PR-/HER2+, G3
//   → Mastektomie + Axilladissektion rechts
// Gemeinsame Systemtherapie → adj. Chemo + Trastuzumab (HER2+ rechts)
// Demonstriert:
//   - 2 Conditions mit unterschiedlicher Seite und Staging
//   - Procedures mit korrekter reasonReference pro Seite
//   - Systemtherapie referenziert beide Conditions
// ============================================================

// --- Patient ---
Instance: Fall13-Patient-Sabine-Lehmann
InstanceOf: Patient
Title: "Fall 13: Patientin Sabine Lehmann"
Description: "Synthetische Testpatientin — synchrones bilaterales Mammakarzinom"
Usage: #example

* identifier.system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier.value = "SENO-2025-013"
* name.family = "Lehmann"
* name.given = "Sabine"
* gender = #female
* birthDate = "1958-11-22"
* address.city = "München"
* address.country = "DE"


// --- Encounter ---
Instance: Fall13-Encounter
InstanceOf: Encounter
Title: "Fall 13: Stationärer Aufenthalt"
Description: "Stationärer Aufenthalt für bilaterale operative Versorgung"
Usage: #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* period.start = "2025-04-07"
* period.end = "2025-04-18"


// ============================================================
// Diagnose LINKS: C50.4 — Invasives Karzinom NST
// pT1c pN0(sn) M0, ER+/PR+/HER2-, G2, Ki-67 20%
// ============================================================
Instance: Fall13-Diagnose-Links
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 13: Mammakarzinom links OAQ, pT1c pN0 M0"
Description: "Invasives Karzinom NST links, oberer äußerer Quadrant, pT1c pN0(sn) M0, UICC IA"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.4
* code.coding[icd10-gm].display = "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.text = "Invasives Karzinom NST links, oberer äußerer Quadrant"

* bodySite.coding = $SCT#80248007 "Left breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-03-20"
* onsetDateTime = "2025-03-20"

* stage[+].summary.text = "UICC IA (pT1c pN0(sn) M0)"
* stage[=].type = $SCT#254292007 "Tumor staging"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* recordedDate = "2025-03-20"


// ============================================================
// Diagnose RECHTS: C50.2 — Invasives lobuläres Karzinom
// pT2 pN1a M0, ER+/PR-/HER2+, G3, Ki-67 40%
// ============================================================
Instance: Fall13-Diagnose-Rechts
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 13: Mammakarzinom rechts UIQ, pT2 pN1a M0"
Description: "Invasives lobuläres Karzinom rechts, unterer innerer Quadrant, pT2 pN1a M0, UICC IIB"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

* code.coding[sct] = $SCT#443451005 "Invasive lobular carcinoma of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2025"
* code.coding[icd10-gm].code = #C50.2
* code.coding[icd10-gm].display = "Bösartige Neubildung: Unterer innerer Quadrant der Brustdrüse"
* code.text = "Invasives lobuläres Karzinom rechts, unterer innerer Quadrant"

* bodySite.coding = $SCT#73056007 "Right breast structure"

* extension[Feststellungsdatum].valueDateTime = "2025-03-20"
* onsetDateTime = "2025-03-20"

* stage[+].summary.text = "UICC IIB (pT2 pN1a M0)"
* stage[=].type = $SCT#254292007 "Tumor staging"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* recordedDate = "2025-03-20"


// ============================================================
// OP LINKS: BET + SLNB → reasonReference → Diagnose Links
// ============================================================
Instance: Fall13-OP-Links-BET
InstanceOf: Senologie_Operation
Title: "Fall 13: BET + SLNB links"
Description: "Brusterhaltende Therapie mit Sentinel-Lymphknoten-Biopsie links"
Usage: #example

* status = #completed
* category = $SCT#392021009 "Lumpectomy of breast"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-870.a1
* code.coding[=].display = "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe: Partielle Resektion: Lumpektomie"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-401.11
* code.coding[=].display = "Exzision einzelner Lymphknoten und Lymphgefäße: Axillär: Mit Radionuklidmarkierung (Sentinel-Lymphonodektomie)"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* performedDateTime = "2025-04-08"

* bodySite = $SCT#80248007 "Left breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "R0 — tumorfreie Resektionsränder"

* reasonReference = Reference(Condition/Fall13-Diagnose-Links)


// ============================================================
// OP RECHTS: Mastektomie + Axilladissektion → reasonReference → Diagnose Rechts
// ============================================================
Instance: Fall13-OP-Rechts-Mastektomie
InstanceOf: Senologie_Operation
Title: "Fall 13: Mastektomie + Axilladissektion rechts"
Description: "Einfache Mastektomie mit Axilladissektion rechts wegen pT2 pN1a"
Usage: #example

* status = #completed
* category = $SCT#172043006 "Simple mastectomy"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-871.1
* code.coding[=].display = "Einfache Mastektomie: Mastektomie mit Entfernung der Pektoralisfaszie"
* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #5-402.0
* code.coding[=].display = "Regionale Lymphadenektomie (Ausräumung mehrerer Lymphknoten einer Region) im Rahmen einer anderen Operation: Axillär"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* performedDateTime = "2025-04-10"

* bodySite = $SCT#73056007 "Right breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* outcome.coding = $MII_CS_Onko_Residualstatus#R0 "R0"
* outcome.text = "R0 — tumorfreie Resektionsränder"

* reasonReference = Reference(Condition/Fall13-Diagnose-Rechts)


// ============================================================
// Systemtherapie: Adjuvante Chemotherapie + Trastuzumab
// referenziert BEIDE Diagnosen (bilaterale Indikation)
// ============================================================
Instance: Fall13-Systemtherapie-AdjChemoTrast
InstanceOf: Senologie_Systemtherapie_Procedure
Title: "Fall 13: Adjuvante Chemo + Trastuzumab"
Description: "Adjuvante Chemotherapie EC-Pac + Trastuzumab wegen HER2+ rechts, bilateral indiziert"
Usage: #example

* status = #completed
* category = $SCT#18629005 "Administration of medication"

* code.coding = $SCT#367336001 "Chemotherapy"
* code.text = "Adjuvante Chemotherapie EC-Pac + Trastuzumab"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* performedPeriod.start = "2025-05-05"
* performedPeriod.end = "2025-10-15"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"

* outcome.text = "Abgeschlossen — 4x EC, 12x Paclitaxel, Trastuzumab laufend"

// Referenziert BEIDE Diagnosen
* reasonReference[+] = Reference(Condition/Fall13-Diagnose-Links)
* reasonReference[+] = Reference(Condition/Fall13-Diagnose-Rechts)

* note.text = "Trastuzumab wegen HER2+ rechts; Chemotherapie bilateral indiziert wegen pT2 pN1a rechts"


// ============================================================
// Strahlentherapie links: Adjuvante Ganzbrustbestrahlung
// ============================================================
Instance: Fall13-Strahlentherapie-Links
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 13: Adjuvante RT links 50 Gy + Boost"
Description: "Adjuvante Ganzbrustbestrahlung links nach BET, 50 Gy + Boost 16 Gy"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* performedPeriod.start = "2025-11-03"
* performedPeriod.end = "2025-12-12"

* bodySite = $SCT#80248007 "Left breast structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* extension[sessionCount].valueQuantity.value = 28
* extension[sessionCount].valueQuantity.unit = "Sitzungen"
* extension[einzeldosis].valueQuantity = 2 'Gy' "Gy"

* reasonReference = Reference(Condition/Fall13-Diagnose-Links)

* note.text = "50 Gy Ganzbrust + 16 Gy Boost auf Tumorbett, 28 Fraktionen"


// ============================================================
// Strahlentherapie rechts: Thoraxwandbestrahlung nach Mastektomie
// ============================================================
Instance: Fall13-Strahlentherapie-Rechts
InstanceOf: Senologie_Strahlentherapie
Title: "Fall 13: Adjuvante RT Thoraxwand rechts 50 Gy"
Description: "Adjuvante Thoraxwandbestrahlung rechts nach Mastektomie wegen pN1a"
Usage: #example

* status = #completed
* category = $SCT#1287742003 "Radiotherapy (procedure)"

* code.coding[+].system = "http://fhir.de/CodeSystem/bfarm/ops"
* code.coding[=].version = "2025"
* code.coding[=].code = #8-522.d1
* code.coding[=].display = "Hochvoltstrahlentherapie: Linearbeschleuniger mehr als 6 MeV Photonen oder schnelle Elektronen, 3D-geplante Bestrahlung: Mit bildgestützter Einstellung"

* subject = Reference(Patient/Fall13-Patient-Sabine-Lehmann)
* performedPeriod.start = "2025-11-03"
* performedPeriod.end = "2025-12-05"

* bodySite = $SCT#127951006 "Chest wall structure"

* extension[Intention].valueCodeableConcept = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-intention#K "kurativ"
* extension[sessionCount].valueQuantity.value = 25
* extension[sessionCount].valueQuantity.unit = "Sitzungen"
* extension[einzeldosis].valueQuantity = 2 'Gy' "Gy"

* reasonReference = Reference(Condition/Fall13-Diagnose-Rechts)

* note.text = "50 Gy Thoraxwand rechts inkl. Lymphabfluss, 25 Fraktionen, nach Mastektomie wegen pN1a"
