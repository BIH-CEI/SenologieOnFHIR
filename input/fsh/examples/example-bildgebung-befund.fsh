Instance: Example-Bildgebung-Mammographie
InstanceOf: Senologie_Bildgebung_Befund
Title: "Beispiel: Mammographie bilateral, BI-RADS 5 links"
Description: "Mammographie bilateral mit suspektem Herdbefund links (BI-RADS 5) und unauffälligem Befund rechts (BI-RADS 1)"
Usage: #example

* status = #final

// Kategorie
* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

// Art der Bildgebung: Mammographie
* code.coding[mammography].system = "http://loinc.org"
* code.coding[mammography].code = #24606-6
* code.coding[mammography].display = "Mammography of bilateral breasts"
* code.text = "Mammographie bilateral"

// Patient
* subject = Reference(Patient/example-patient)

// Datum
* effectiveDateTime = "2024-02-20"

// Einzel-Befunde als Observations
* result[+] = Reference(Observation/Example-Bildgebung-BiRADS-Links)
* result[+] = Reference(Observation/Example-Bildgebung-BiRADS-Rechts)

// Gesamtbeurteilung
* conclusion = "Links: suspekter Herdbefund im oberen äußeren Quadranten, BI-RADS 5. Rechts: unauffällig, BI-RADS 1. Empfehlung: Stanzbiopsie links."


Instance: Example-Bildgebung-BiRADS-Links
InstanceOf: Senologie_Bildgebung_Observation
Title: "Beispiel: BI-RADS 5 links"
Description: "BI-RADS 5 Befund der linken Brust bei Mammographie"
Usage: #example

* status = #final

// BI-RADS Code
* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

// Patient
* subject = Reference(Patient/example-patient)
* effectiveDateTime = "2024-02-20"

// Seite
* bodySite = $SCT#80248007 "Left breast structure"

// BI-RADS 5
* valueCodeableConcept.coding = $SCT#397145000 "Mammography assessment (Category 5) - Highly suggestive of malignancy"
* valueCodeableConcept.text = "BI-RADS 5 — hochverdächtig auf Malignität"

* note.text = "Suspekter Herdbefund OAQ, 15 mm, unscharf begrenzt, Mikrokalk"


Instance: Example-Bildgebung-BiRADS-Rechts
InstanceOf: Senologie_Bildgebung_Observation
Title: "Beispiel: BI-RADS 1 rechts"
Description: "BI-RADS 1 Befund der rechten Brust bei Mammographie"
Usage: #example

* status = #final

// BI-RADS Code
* code.coding[biRadsLoinc].system = "http://loinc.org"
* code.coding[biRadsLoinc].code = #72018-2
* code.coding[biRadsLoinc].display = "Breast Imaging-Reporting and Data System (BI-RADS) assessment category"

// Patient
* subject = Reference(Patient/example-patient)
* effectiveDateTime = "2024-02-20"

// Seite
* bodySite = $SCT#73056007 "Right breast structure"

// BI-RADS 1
* valueCodeableConcept.coding = $SCT#397140005 "Mammography assessment (Category 1) - Negative"
* valueCodeableConcept.text = "BI-RADS 1 — unauffällig"
