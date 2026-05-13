// FHIR Measure: S3-QI-09  Adjuvante endokrine Therapie bei HR+
// Auto-generiert von scripts/cql/build-measures.py — bitte dort editieren.

Instance: senologie-measure-s3-qi-09
InstanceOf: Measure
Title: "Senologie Measure S3-QI-09: Adjuvante endokrine Therapie bei HR+"
Description: "Adjuvante endokrine Therapie bei HR+ (S3-Leitlinie Mammakarzinom Kapitel 8, QI-09)"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-09"
* version = "0.1.0"
* name = "SenologieMeasureS3QI09"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Adjuvante endokrine Therapie bei HR+ — S3 Mammakarzinom QI-09"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-09-group"
* group[=].population[+].id = "qi-09-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-09-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI09Nenner"

* group[=].population[+].id = "qi-09-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI09Zaehler"
