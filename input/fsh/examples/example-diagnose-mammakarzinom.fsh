Instance: Example-Diagnose-Mammakarzinom
InstanceOf: Senologie_Diagnose_Maligne
Title: "Beispiel: Mammakarzinom links"
Description: "Primäres Mammakarzinom der linken Brust, Stadium II, histologisch gesichert"
Usage: #example

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active
* verificationStatus.coding[+] = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed
* verificationStatus.coding[+] = https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung#7 "histologische Untersuchung eines Primärtumors"

// Tumormanifestation (Mehrfachauswahl: Primärtumor + regionäre LK)
* category[tumormanifestation][+] = https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation#primaertumor "Primärtumor"
* category[tumormanifestation][+] = https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation#regionaere-lk "Regionäre Lymphknotenmetastasen"

// Diagnosekode SNOMED
* code.coding[sct] = $SCT#254837009 "Malignant neoplasm of breast"
* code.coding[icd10-gm].system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
* code.coding[icd10-gm].version = "2024"
* code.coding[icd10-gm].code = #C50.4
* code.coding[icd10-gm].display = "Bösartige Neubildung: Oberer äußerer Quadrant der Brustdrüse"
* code.text = "Mammakarzinom links, oberer äußerer Quadrant"

// Seite
* bodySite.coding = $SCT#80248007 "Left breast structure"

// Feststellungsdatum (inherited extension)
* extension[Feststellungsdatum].valueDateTime = "2024-03-15"

// Stadium/Grad
* stage[+].summary = $SCT#258219007 "Stage 2"
* stage[=].type = $SCT#254292007 "Tumor staging"

// Patient
* subject = Reference(Patient/example-patient)
* recordedDate = "2024-03-15"

// Onset (Symptombeginn, optional)
* onsetDateTime = "2024-01-10"
