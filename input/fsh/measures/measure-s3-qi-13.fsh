// FHIR Measure: S3-QI-13  HER2 Score nach ASCO/CAP
// Auto-generiert von scripts/cql/build-measures.py — bitte dort editieren.

Instance: senologie-measure-s3-qi-13
InstanceOf: Measure
Title: "Senologie Measure S3-QI-13: HER2 Score nach ASCO/CAP"
Description: "HER2 Score nach ASCO/CAP (S3-Leitlinie Mammakarzinom Kapitel 8, QI-13)"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-13"
* version = "0.1.0"
* name = "SenologieMeasureS3QI13"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "HER2 Score nach ASCO/CAP — S3 Mammakarzinom QI-13"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-13-group"
* group[=].population[+].id = "qi-13-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-13-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI13Nenner"

* group[=].population[+].id = "qi-13-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI13Zaehler"
