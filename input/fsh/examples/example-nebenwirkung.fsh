// ============================================================
// Nebenwirkungen unter Systemtherapie (CTCAE-Grading)
// ============================================================

// --- Fall 2: Fatigue Grad 2 unter neoadjuvanter Chemotherapie ---
Instance: Fall2-Nebenwirkung-Fatigue
InstanceOf: Senologie_Nebenwirkung
Title: "Fall 2: Fatigue CTCAE Grad 2 unter Chemotherapie"
Description: "Fatigue Grad 2 (moderat) unter neoadjuvanter EC-Chemotherapie"
Usage: #example

* actuality = #actual

* event.coding[+].system = "https://www.meddra.org"
* event.coding[=].version = "Version 4"
* event.coding[=].code = #10016256
* event.coding[=].display = "Fatigue"
* event.text = "Fatigue Grad 2 unter EC-Chemotherapie"

* subject = Reference(Patient/Fall2-Patient-Lena-Hoffmann)
* date = "2025-02-10"

* seriousness.coding.system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-nebenwirkung-ctcae-grad"
* seriousness.coding.code = #2
* seriousness.coding.display = "Moderat"
* seriousness.text = "CTCAE Grad 2 — Moderat"

* suspectEntity[+].instance = Reference(Procedure/Fall2-Systemtherapie-Neoadjuvant)


// --- Fall 5: Nausea Grad 1 unter Docetaxel + Trastuzumab ---
Instance: Fall5-Nebenwirkung-Nausea
InstanceOf: Senologie_Nebenwirkung
Title: "Fall 5: Nausea CTCAE Grad 1 unter Docetaxel"
Description: "Nausea Grad 1 (mild) unter neoadjuvantem Docetaxel + Trastuzumab"
Usage: #example

* actuality = #actual

* event.coding[+].system = "https://www.meddra.org"
* event.coding[=].version = "Version 4"
* event.coding[=].code = #10028813
* event.coding[=].display = "Nausea"
* event.text = "Nausea Grad 1 unter Docetaxel + Trastuzumab"

* subject = Reference(Patient/Fall5-Patient-Monika-Braun)
* date = "2025-03-15"

* seriousness.coding.system = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-nebenwirkung-ctcae-grad"
* seriousness.coding.code = #1
* seriousness.coding.display = "Mild"
* seriousness.text = "CTCAE Grad 1 — Mild"

* suspectEntity[+].instance = Reference(Procedure/Fall5-Systemtherapie-Neoadjuvant)
