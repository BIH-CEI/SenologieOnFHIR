Instance: Example-Diagnose-DCIS
InstanceOf: Senologie_Diagnose_Maligne
Title: "Beispiel: DCIS rechts"
Description: "Duktales Carcinoma in situ der rechten Brust, mammographisch entdeckt"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologisch"

// Diagnosekode SNOMED - DCIS
* code.coding[sct] = $SCT#109889007 "Ductal carcinoma in situ of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2024"
* code.coding[icd10-gm].code = #D05.1
* code.coding[icd10-gm].display = "Carcinoma in situ der Brustdrüse: Intraduktales Karzinom in situ"
* code.text = "DCIS rechts"

// Seite
* bodySite.coding = $SCT#73056007 "Right breast structure"

// Feststellungsdatum
* extension[Feststellungsdatum].valueDateTime = "2024-06-20"

// Stadium - Stage 0 for DCIS
* stage[+].summary = $SCT#258228008 "Stage 0"
* stage[=].type = $SCT#254292007 "Tumor staging"

* subject = Reference(Patient/example-patient)
* recordedDate = "2024-06-20"
