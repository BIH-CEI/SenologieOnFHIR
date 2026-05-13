// FHIR Measure: S3-QI-04  Axilläre LK-Entfernung bei DCIS (invers, niedrig=gut)
// Auto-generiert von scripts/cql/build-measures.py — bitte dort editieren.

Instance: senologie-measure-s3-qi-04
InstanceOf: Measure
Title: "Senologie Measure S3-QI-04: Axilläre LK-Entfernung bei DCIS (invers, niedrig=gut)"
Description: "Axilläre LK-Entfernung bei DCIS (invers, niedrig=gut) (S3-Leitlinie Mammakarzinom Kapitel 8, QI-04)"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-04"
* version = "0.1.0"
* name = "SenologieMeasureS3QI04"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Axilläre LK-Entfernung bei DCIS (invers, niedrig=gut) — S3 Mammakarzinom QI-04"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-04-group"
* group[=].population[+].id = "qi-04-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-04-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI04Nenner"

* group[=].population[+].id = "qi-04-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI04Zaehler"
