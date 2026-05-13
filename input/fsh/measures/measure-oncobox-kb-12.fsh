// FHIR Measure: OncoBox KB-12 Präoperative histologische Sicherung
//
// Operationale Definition wie S3-QI-2, aber Kontext OncoBox-Brust-Audit.
// Nutzt dieselbe CQL-Logik via Wiederverwendung (KB_12_* delegiert an QI_02_*).
//
// Aufruf:
//   POST /Measure/senologie-measure-oncobox-kb-12/$evaluate-measure
//        ?periodStart=2025-01-01&periodEnd=2025-12-31

Instance: senologie-measure-oncobox-kb-12
InstanceOf: Measure
Title: "Senologie Measure OncoBox KB-12: Präoperative histologische Sicherung"
Description: "Anteil mit präoperativer histologischer Sicherung (Stanze/Vakuum) vor Ersteingriff. OncoBox Brust 2.0 KB-12 (DKG-Audit-Kennzahl)."
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-oncobox-kb-12"
* version = "0.1.0"
* name = "SenologieMeasureOncoBoxKB12"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Präoperative histologische Sicherung — OncoBox Brust 2.0 KB-12 (DKG-Zertifizierung)"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#program
* useContext.valueCodeableConcept.text = "OncoBox Brust 2.0 Auditjahr 2026"

* library = "https://www.senologie.org/fhir/Library/OncoBoxBrustKennzahlen"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "kb-12-group"
* group[=].population[+].id = "kb-12-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "Invasive oder DCIS"

* group[=].population[+].id = "kb-12-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "KB_12_Nenner"

* group[=].population[+].id = "kb-12-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "KB_12_Zaehler"
