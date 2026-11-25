// EvidenceVariable-Instanzen: EBM-Pilot Speicheldrüsentumoren (AWMF 007-102OL)
// Quelle: docs/ebm-pilot-speicheldrüsen/evidence-variables.yaml
// FHIR R4-kompatible Darstellung; in R5/R6 würde characteristicCombination +
// variableRole den Schichten-Ansatz (Population / Intervention / Outcome) direkt ausdrücken.

Alias: $SCT = http://snomed.info/sct


// ─────────────────────────────────────────────────────────────────────────────
// 1. Benigne Raumforderung Gl. parotidea (Empf. 4.2, 4.3)
// ─────────────────────────────────────────────────────────────────────────────
Instance: SpLD-BenignePArotis
InstanceOf: EvidenceVariable
Title: "Benigne Raumforderung der Gl. parotidea (klinisch, oberflächlich)"
Description: "Population für Empfehlungen 4.2 und 4.3 (AWMF 007-102OL): PatientInnen mit klinisch
benigne imponierendem, oberflächlich gelegenem, verschieblichem Tumor der Glandula parotidea
ohne präoperativen Malignitätsverdacht."
Usage: #example

* url = "https://www.senologie.org/fhir/EvidenceVariable/speicheldrüsentumor-benigne-parotis"
* version = "1.0.0"
* name = "SpLD_BenignePArotis"
* status = #draft
* type = #dichotomous

// Merkmal 1: Tumor der Gl. parotidea
* characteristic[+].definitionCodeableConcept = $SCT#45289007 "Parotid gland structure"
* characteristic[=].description = "Tumor der Gl. parotidea"
* characteristic[=].exclude = false

// Merkmal 2: Klinisch benigne (kein Malignomverdacht)
* characteristic[+].definitionCodeableConcept = $SCT#255154009 "Benign neoplasm of salivary gland"
* characteristic[=].description = "Klinisch benigne imponierend (kein Malignomverdacht)"
* characteristic[=].exclude = false

// Merkmal 3: Ausschluss Fernmetastasen
* characteristic[+].definitionCodeableConcept = $SCT#399409002 "Distant metastasis present"
* characteristic[=].description = "Ausschluss Fernmetastasen (M0)"
* characteristic[=].exclude = true


// ─────────────────────────────────────────────────────────────────────────────
// 2. Speicheldrüsenkarzinom allgemein, kurativ resektabel (Empf. 4.14)
// ─────────────────────────────────────────────────────────────────────────────
Instance: SpLD-KarzinomAllgemein
InstanceOf: EvidenceVariable
Title: "Speicheldrüsenkarzinom (alle Lokalisationen, kurativ resektabel)"
Description: "Population für Empfehlung 4.14 (A) (AWMF 007-102OL): PatientInnen mit
histologisch gesichertem Karzinom einer Speicheldrüse ohne Fernmetastasierung – kurativ-resektabler Ansatz."
Usage: #example

* url = "https://www.senologie.org/fhir/EvidenceVariable/speicheldrüsenkarzinom-allgemein"
* version = "1.0.0"
* name = "SpLD_KarzinomAllgemein"
* status = #draft
* type = #dichotomous

// Merkmal 1: Karzinom der Speicheldrüse (groß oder klein)
* characteristic[+].definitionCodeableConcept = $SCT#126787005 "Neoplasm of major salivary gland"
* characteristic[=].description = "Histologisch gesichertes Karzinom der Speicheldrüse"
* characteristic[=].exclude = false

// Merkmal 2: Ausschluss Fernmetastasen (M0)
* characteristic[+].definitionCodeableConcept = $SCT#399409002 "Distant metastasis present"
* characteristic[=].description = "Ausschluss Fernmetastasen (M0)"
* characteristic[=].exclude = true


// ─────────────────────────────────────────────────────────────────────────────
// 3. High-grade Speicheldrüsenkarzinom (Empf. 4.26, adjuvante RT)
// In R5 würde definitionByCombination (any-of) verwendet; R4-Annäherung:
// beide Histologien als separate include-Charakteristika (implizit OR-Semantik
// bei gleicher Rolle möglich; Implementierung über CQL zu lösen).
// ─────────────────────────────────────────────────────────────────────────────
Instance: SpLD-KarzinomHighGrade
InstanceOf: EvidenceVariable
Title: "High-grade Speicheldrüsenkarzinom (inkl. High-grade-Transformation)"
Description: "Population für Empfehlung 4.26 (A) und adjuvante RT-Indikation (AWMF 007-102OL):
Speicheldrüsenkarzinom mit High-grade-Histologie oder High-grade-Transformation (ICD-O G3/G4).
R4-Annäherung: die any-of-Kombination der Histologien ist über CQL zu implementieren."
Usage: #example

* url = "https://www.senologie.org/fhir/EvidenceVariable/speicheldrüsenkarzinom-highgrade"
* version = "1.0.0"
* name = "SpLD_KarzinomHighGrade"
* status = #draft
* type = #dichotomous

// Merkmal 1: Karzinom der Speicheldrüse (Basis)
* characteristic[+].definitionCodeableConcept = $SCT#126787005 "Neoplasm of major salivary gland"
* characteristic[=].description = "Karzinom der Speicheldrüse"
* characteristic[=].exclude = false

// Merkmal 2a: Speichelgangkarzinom (inherent high-grade)
* characteristic[+].definitionCodeableConcept = $SCT#397082006 "Salivary duct carcinoma"
* characteristic[=].description = "Speichelgangkarzinom (inherent high-grade) — any-of Gruppe"
* characteristic[=].exclude = false

// Merkmal 2b: Karzinom ex pleomorphem Adenom (High-grade-Transformation)
* characteristic[+].definitionCodeableConcept = $SCT#17264009 "Carcinoma ex pleomorphic adenoma"
* characteristic[=].description = "Karzinom ex pleomorphem Adenom — any-of Gruppe"
* characteristic[=].exclude = false

// Merkmal 3: Ausschluss Fernmetastasen
* characteristic[+].definitionCodeableConcept = $SCT#399409002 "Distant metastasis present"
* characteristic[=].description = "Ausschluss Fernmetastasen"
* characteristic[=].exclude = true


// ─────────────────────────────────────────────────────────────────────────────
// 4. Adenoid-zystisches Karzinom, lokal fortgeschritten (T3/T4, cN0) (Empf. 4.27)
// ─────────────────────────────────────────────────────────────────────────────
Instance: SpLD-AdCC-T3T4
InstanceOf: EvidenceVariable
Title: "Adenoid-zystisches Karzinom, lokal fortgeschritten (T3/T4, cN0)"
Description: "Population für Empfehlung 4.27 (B) (AWMF 007-102OL): PatientInnen mit
adenoid-zystischem Karzinom im Stadium T3/T4 cN0 — Frage: elektive Neck Dissection vs. Watch-and-Wait."
Usage: #example

* url = "https://www.senologie.org/fhir/EvidenceVariable/adcc-lokal-fortgeschritten"
* version = "1.0.0"
* name = "SpLD_AdCC_T3T4"
* status = #draft
* type = #dichotomous

// Merkmal 1: Adenoid-zystisches Karzinom
* characteristic[+].definitionCodeableConcept = $SCT#11671000 "Adenoid cystic carcinoma"
* characteristic[=].description = "Adenoid-zystisches Karzinom (histologisch gesichert)"
* characteristic[=].exclude = false

// Merkmal 2a: T3 (UICC)
* characteristic[+].definitionCodeableConcept = $SCT#1228882005 "pT3 category"
* characteristic[=].description = "T3 (UICC) — any-of mit T4"
* characteristic[=].exclude = false

// Merkmal 2b: T4 (UICC)
* characteristic[+].definitionCodeableConcept = $SCT#1228884006 "pT4 category"
* characteristic[=].description = "T4 (UICC) — any-of mit T3"
* characteristic[=].exclude = false

// Merkmal 3: cN0
* characteristic[+].definitionCodeableConcept = $SCT#1229947003 "cN0 category"
* characteristic[=].description = "Kein klinischer LK-Befall (cN0)"
* characteristic[=].exclude = false


// ─────────────────────────────────────────────────────────────────────────────
// 5. Parotiskarzinom mit präoperativer Fazialisparese (Hintergrund Empf. 4.14/4.19)
// ─────────────────────────────────────────────────────────────────────────────
Instance: SpLD-ParotisKarzinom-Fazialis
InstanceOf: EvidenceVariable
Title: "Parotiskarzinom mit präoperativer Fazialisparese"
Description: "Population für PICO-Frage Fazialismanagement (AWMF 007-102OL): PatientInnen mit
Karzinom der Gl. parotidea und präoperativer Fazialisparese (House-Brackmann ≥ III).
SNOMED-Lücke Fazialisparese: Implementierung über Observation mit House-Brackmann-Score."
Usage: #example

* url = "https://www.senologie.org/fhir/EvidenceVariable/parotiskarzinom-fazialisinfiltration"
* version = "1.0.0"
* name = "SpLD_ParotisKarzinom_Fazialis"
* status = #draft
* type = #dichotomous

// Merkmal 1: Karzinom der Gl. parotidea
* characteristic[+].definitionCodeableConcept = $SCT#45289007 "Parotid gland structure"
* characteristic[=].description = "Karzinom der Glandula parotidea"
* characteristic[=].exclude = false

// Merkmal 2: Präoperative Fazialisparese (Text-only, SNOMED-Lücke)
* characteristic[+].definitionCodeableConcept.text = "Präoperative Fazialisparese (klinisch, House-Brackmann ≥ III)"
* characteristic[=].description = "Präoperative N.-facialis-Parese durch Tumorinfiltration; kein allgemeiner SNOMED-Code (Oct 2026)"
* characteristic[=].exclude = false

// Merkmal 3: Ausschluss Fernmetastasen
* characteristic[+].definitionCodeableConcept = $SCT#399409002 "Distant metastasis present"
* characteristic[=].description = "Ausschluss Fernmetastasen"
* characteristic[=].exclude = true


// ─────────────────────────────────────────────────────────────────────────────
// 6. Speicheldrüsenkarzinom nach R1/R2-Resektion — Indikation adjuvante RT (Kap. 4.3.1)
// ─────────────────────────────────────────────────────────────────────────────
Instance: SpLD-KarzinomR1-RT
InstanceOf: EvidenceVariable
Title: "Speicheldrüsenkarzinom nach R1/R2-Resektion (Indikation adjuvante RT)"
Description: "Population für PICO-Frage adjuvante Strahlentherapie (AWMF 007-102OL Kap. 4.3.1):
PatientInnen mit Karzinom der Speicheldrüse nach nicht-R0-Resektion (R1/R2) und/oder Risikofaktoren
(High-grade, T3/T4, PNI). R-Status via LOINC 44648-4 (Surgical margin status)."
Usage: #example

* url = "https://www.senologie.org/fhir/EvidenceVariable/speicheldrüsenkarzinom-r1-indikation-rt"
* version = "1.0.0"
* name = "SpLD_KarzinomR1_RT"
* status = #draft
* type = #dichotomous

// Merkmal 1: Karzinom der Speicheldrüse, operiert
* characteristic[+].definitionCodeableConcept = $SCT#126787005 "Neoplasm of major salivary gland"
* characteristic[=].description = "Histologisch gesichertes Karzinom der Speicheldrüse, operiert"
* characteristic[=].exclude = false

// Merkmal 2: Perineuralscheideninfiltration (Risikofaktor)
* characteristic[+].definitionCodeableConcept = $SCT#396394004 "Perineural invasion finding"
* characteristic[=].description = "Perineuralscheideninfiltration (PNI) — Risikofaktor für adjuvante RT"
* characteristic[=].exclude = false

// Merkmal 3: Speichelgangkarzinom als High-grade-Proxy
* characteristic[+].definitionCodeableConcept = $SCT#397082006 "Salivary duct carcinoma"
* characteristic[=].description = "High-grade Histologie (Proxy: Speichelgangkarzinom) — any-of Risikogruppe"
* characteristic[=].exclude = false
