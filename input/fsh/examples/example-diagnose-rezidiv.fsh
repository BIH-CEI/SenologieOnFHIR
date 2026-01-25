Instance: Example-Diagnose-Rezidiv
InstanceOf: Senologie_Diagnose
Title: "Beispiel: Mammakarzinom-Rezidiv"
Description: "Lokalrezidiv eines Mammakarzinoms nach brusterhaltender Therapie"
Usage: #example

// Rezidiv-Status
* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#recurrence
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologisch"

// Diagnosekode - kann auch post-koordiniert sein
* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2024"
* code.coding[icd10-gm].code = #C50.4
* code.coding[icd10-gm].display = "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.text = "Lokalrezidiv Mammakarzinom links"

// Seite
* bodySite.coding = $SCT#80248007 "Left breast structure"

// Feststellungsdatum Rezidiv
* extension[Feststellungsdatum].valueDateTime = "2024-11-08"

// Verweis auf Erstdiagnose (inherited extension)
* extension[occurredFollowing].valueReference = Reference(Condition/Example-Diagnose-Mammakarzinom)

// Metastasierungsstadium
* stage[metastasis].summary.text = "M0 - keine Fernmetastasen"
* stage[metastasis].type = $SCT#385349001 "Metastasis stage finding"

* subject = Reference(Patient/example-patient)
* recordedDate = "2024-11-08"
