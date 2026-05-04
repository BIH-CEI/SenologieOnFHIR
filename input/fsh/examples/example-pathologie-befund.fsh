Instance: Example-Pathologie-Befund
InstanceOf: Senologie_Pathologie_Befund
Title: "Beispiel: Invasiv-duktales Karzinom G2, ER+/PR+/HER2-"
Description: "Pathologischer Befund nach Stanzbiopsie: invasiv-duktales Karzinom, G2, Hormonrezeptor-positiv, HER2-negativ"
Usage: #example

* status = #final

// Identifier (required by MII Patho parent)
* identifier[Set-ID].type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier[Set-ID].system = "http://pathologie.charite.de/fhir/sid/report-id"
* identifier[Set-ID].value = "PATH-2024-001234"

// Code (required by MII Patho parent)
* code.coding[pathology-report] = $LOINC#60568-3 "Pathology synoptic report"
* code.text = "Pathologischer Befund"

// Kategorie
* category = http://terminology.hl7.org/CodeSystem/v2-0074#SP "Surgical Pathology"

// Patient
* subject = Reference(Patient/example-patient)

// basedOn (required by MII Patho parent)
* basedOn.display = "Anforderung Histologie durch Senologie"

// Zeitpunkte
* effectiveDateTime = "2024-03-01"
* issued = "2024-03-05T14:30:00+01:00"

// Pathologisches Institut (required by MII Patho parent)
* performer.display = "Institut für Pathologie, Charité - Universitätsmedizin Berlin"

// Specimen
* specimen = Reference(Specimen/Example-Pathologie-Praeparat)

// Result: diagnostic-conclusion (required by MII Patho parent)
* result[diagnostic-conclusion] = Reference(Observation/Example-Patho-Conclusion)

// Gesamtbeurteilung
* conclusion = "Invasiv-duktales Mammakarzinom links, OAQ. Grading: G2. ER positiv (IRS 12), PR positiv (IRS 8). HER2-Status: negativ (Score 1+). Ki-67: 20%."


Instance: Example-Patho-Conclusion
InstanceOf: Observation
Title: "Beispiel: Pathologische Diagnose/Conclusion"
Description: "Diagnostische Schlussfolgerung des Pathologen"
Usage: #example

* status = #final
* code = $LOINC#22637-3 "Pathology report final diagnosis Narrative"
* subject = Reference(Patient/example-patient)
* effectiveDateTime = "2024-03-05"
* valueString = "Invasiv-duktales Mammakarzinom, G2, pT1c, ER+/PR+/HER2-, Ki-67 20%"


Instance: Example-Pathologie-Praeparat
InstanceOf: Senologie_Pathologie_Praeparat
Title: "Beispiel: Stanzbiopsie-Präparat links OAQ"
Description: "Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust"
Usage: #example

// Identifier (required by MII Patho Specimen)
* identifier[+].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC "Placer Identifier"
* identifier[=].system = "http://pathologie.charite.de/fhir/sid/specimen-id"
* identifier[=].value = "SPEC-2024-001234-A"

// Status (required)
* status = #available

// Art des Präparats: Stanzbiopsie
* type.coding[sct] = $SCT#122737001 "Specimen from breast obtained by core needle biopsy"
* type.text = "Stanzbiopsie"

// Patient
* subject = Reference(Patient/example-patient)

// Entnahme-Details
* collection.bodySite = $SCT#80248007 "Left breast structure"
* collection.bodySite.text = "Linke Brust, oberer äußerer Quadrant"
* collection.collectedDateTime = "2024-03-01"
* collection.method = $SCT#129314006 "Biopsy - action"
