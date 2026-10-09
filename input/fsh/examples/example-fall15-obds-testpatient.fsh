// ============================================================
// Fall 15: oBDS-Testpatient (re-engineered)
//
// Quelle: input/data/obds-testdaten/Testpatient_Mamma.xml (oBDS XML v3.0.1)
//
// Patient: Dr. Michaela van Musterfrau (geb. Krüger), weiblich, *15.10.1950,
//   verstorben 27.11.2021 (tumorbedingt). Heilbronn, GKV (T221038567).
// Diagnose: Mammakarzinom rechts (C50.4), Erstdiagnose 2020-02-16,
//   invasives duktales Karzinom NOS (ICD-O-3 8500/3), Grading 3, TNM 8 cT1c.
// Verlauf (2021-09-14): Statusänderung — Progression mit Fernmetastasen
//   (Leber + Lunge), Rezidiv lokal/regional/distant. r-Symbol.
// Tod: 2021-11-27, tumorbedingt (C50.4).
//
// Pendant zu Fall14 (OncoBox), zeigt oBDS-spezifische Felder:
//   - Versichertendaten (IKNR + GKV-Versichertennummer)
//   - Morphologie (ICD-O-3 mit Version)
//   - Seitenlokalisation (R = rechts)
//   - Verlauf-Tumorstatus (Lokal/LK/Fernmet)
//   - Fernmetastasen mit Lokalisation (HEP/PUL/etc.)
//   - Sterbedatum + tumorbedingt-Flag
// ============================================================

// --- Patient ---
Instance: Fall15-Patient-Michaela-Musterfrau
InstanceOf: Patient
Title: "Fall 15: Patientin Michaela van Musterfrau (oBDS-Testpatient)"
Description: "Re-engineered aus oBDS XML v3.0.1 Testpatient_Mamma.xml. Verstorben 2021 nach Verlauf mit Fernmetastasen."
Usage: #example

* identifier[+].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "T221038567"
* identifier[+].system = "http://fhir.bih-charite.de/sid/patient-id"
* identifier[=].value = "SENO-OBDS-60"
* name[+].family = "van Musterfrau"
* name[=].prefix = "Dr."
* name[=].given = "Michaela"
* name[=].use = #official
* name[+].family = "Krüger"
* name[=].use = #maiden
* gender = #female
* birthDate = "1950-10-15"
* deceasedDateTime = "2021-11-27"
* address.line = "Kellerstr. 7"
* address.city = "Heilbronn"
* address.postalCode = "74072"
* address.country = "DE"

// --- Diagnose ---
Instance: Fall15-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Fall 15: Mammakarzinom rechts C50.4 cT1c"
Description: "Invasives duktales Karzinom NOS (ICD-O 8500/3), rechts, Grading 3, TNM 8 cT1c. Erstdiagnose 2020-02-16."
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7
* code.coding[+] = $SCT#254837009 "Mammakarzinom"
* code.coding[+] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#C50.4 "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.coding[=].version = "10 2020 GM"
* category[+] = $SCT#255217005 "Ersterkrankung"
* bodySite.coding[+] = $SCT#24028007 "Rechts"
* bodySite.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-seitenlokalisation#R "Rechts"
* subject = Reference(Fall15-Patient-Michaela-Musterfrau)
* onsetDateTime = "2020-02-16"
* recordedDate = "2020-02-16"
* extension[Feststellungsdatum].url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
* extension[Feststellungsdatum].valueDateTime = "2020-02-16"

// --- Verlauf-Observation (Rezidiv mit FM, 2021-09-14) ---
Instance: Fall15-Verlauf-Progression
InstanceOf: Observation
Title: "Fall 15: Verlauf 2021-09-14 — Progression mit Fernmetastasen"
Description: "Statusänderung 2021-09-14: lokaler/regionärer/distanter Rezidiv-Status, Leber- und Lungenmetastasen. r-Symbol."
Usage: #example

* status = #final
* code = $LOINC#88040-1 "Response to cancer treatment"
* subject = Reference(Fall15-Patient-Michaela-Musterfrau)
* focus[+] = Reference(Fall15-Diagnose-Mammakarzinom)
* effectiveDateTime = "2021-09-14"
* valueCodeableConcept.coding[+] = $SCT#271299001 "Tumor progression"
* component[+].code = $SCT#395709001 "Locoregional recurrence"
* component[=].valueCodeableConcept.coding[+] = $SCT#395709001 "Recurrence local"
* component[+].code = $SCT#373572006 "Clinical state of distant metastases"
* component[=].valueCodeableConcept.coding[+] = $SCT#79282002 "Metastatic"

// --- Fernmetastasen-Observation 1: Leber ---
Instance: Fall15-Fernmetastase-Leber
InstanceOf: Observation
Title: "Fall 15: Fernmetastase Leber"
Description: "Lebermetastase (HEP) detektiert 2021-09-14 im Verlauf-Restaging."
Usage: #example

* status = #final
* code = $SCT#94381002 "Secondary malignant neoplasm of liver"
* subject = Reference(Fall15-Patient-Michaela-Musterfrau)
* focus[+] = Reference(Fall15-Diagnose-Mammakarzinom)
* effectiveDateTime = "2021-09-14"
* bodySite = $SCT#10200004 "Liver structure"

// --- Fernmetastasen-Observation 2: Lunge ---
Instance: Fall15-Fernmetastase-Lunge
InstanceOf: Observation
Title: "Fall 15: Fernmetastase Lunge"
Description: "Lungenmetastase (PUL) detektiert 2021-09-14 im Verlauf-Restaging."
Usage: #example

* status = #final
* code = $SCT#94391008 "Secondary malignant neoplasm of lung"
* subject = Reference(Fall15-Patient-Michaela-Musterfrau)
* focus[+] = Reference(Fall15-Diagnose-Mammakarzinom)
* effectiveDateTime = "2021-09-14"
* bodySite = $SCT#39607008 "Lung structure"

// --- Histologie (Re-Biopsie 2021-09-14, invasives duktales Karzinom G3) ---
Instance: Fall15-Histologie-Rebiopsie
InstanceOf: Observation
Title: "Fall 15: Histologie 2021-09-14 (Re-Biopsie)"
Description: "Invasives duktales Karzinom NOS (ICD-O 8500/3), Grading G3. Histologie-Einsendung H23201/2021."
Usage: #example

* status = #final
* code = $LOINC#33731-1 "Histology type in Cancer specimen"
* subject = Reference(Fall15-Patient-Michaela-Musterfrau)
* focus[+] = Reference(Fall15-Diagnose-Mammakarzinom)
* effectiveDateTime = "2021-09-14"
* valueCodeableConcept.coding[+] = http://terminology.hl7.org/CodeSystem/icd-o-3#8500/3 "Invasive ductal carcinoma, NOS"
* valueCodeableConcept.coding[=].version = "31"
* component[+].code = $SCT#371469007 "Histologic grade"
* component[=].valueCodeableConcept.coding[+] = $SCT#61026006 "G3"

// --- Todesursache (Tod 2021-11-27, tumorbedingt C50.4) ---
Instance: Fall15-Todesursache
InstanceOf: Observation
Title: "Fall 15: Todesursache — Mammakarzinom (C50.4)"
Description: "Patientin verstorben 2021-11-27, tumorbedingt durch Mammakarzinom (C50.4)."
Usage: #example

* status = #final
* code = $LOINC#69453-9 "Cause of death"
* subject = Reference(Fall15-Patient-Michaela-Musterfrau)
* effectiveDateTime = "2021-11-27"
* valueCodeableConcept.coding[+] = http://fhir.de/CodeSystem/bfarm/icd-10-gm#C50.4 "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* valueCodeableConcept.coding[=].version = "10 2022 GM"
* note.text = "Tumorbedingt (oBDS-Flag Tod_tumorbedingt=J)"
