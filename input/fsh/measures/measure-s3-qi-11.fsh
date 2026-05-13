// FHIR Measure: S3-QI-11  Trastuzumab bei HER2-positiven Patientinnen
// Auto-generiert von scripts/cql/build-measures.py — bitte dort editieren.

Instance: senologie-measure-s3-qi-11
InstanceOf: Measure
Title: "Senologie Measure S3-QI-11: Trastuzumab bei HER2-positiven Patientinnen"
Description: "Trastuzumab bei HER2-positiven Patientinnen (S3-Leitlinie Mammakarzinom Kapitel 8, QI-11)"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-11"
* version = "0.1.0"
* name = "SenologieMeasureS3QI11"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Trastuzumab bei HER2-positiven Patientinnen — S3 Mammakarzinom QI-11"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-11-group"
* group[=].population[+].id = "qi-11-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-11-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI11Nenner"

* group[=].population[+].id = "qi-11-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI11Zaehler"
