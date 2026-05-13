// FHIR Measure: S3-QI-06  Sentinel-Lymphknoten-Biopsie bei pN0 ohne Neoadjuvanz
// Auto-generiert von scripts/cql/build-measures.py — bitte dort editieren.

Instance: senologie-measure-s3-qi-06
InstanceOf: Measure
Title: "Senologie Measure S3-QI-06: Sentinel-Lymphknoten-Biopsie bei pN0 ohne Neoadjuvanz"
Description: "Sentinel-Lymphknoten-Biopsie bei pN0 ohne Neoadjuvanz (S3-Leitlinie Mammakarzinom Kapitel 8, QI-06)"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-06"
* version = "0.1.0"
* name = "SenologieMeasureS3QI06"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Sentinel-Lymphknoten-Biopsie bei pN0 ohne Neoadjuvanz — S3 Mammakarzinom QI-06"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-06-group"
* group[=].population[+].id = "qi-06-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-06-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI06Nenner"

* group[=].population[+].id = "qi-06-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI06Zaehler"
