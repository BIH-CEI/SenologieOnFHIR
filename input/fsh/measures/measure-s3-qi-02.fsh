// FHIR Measure: S3-QI-02 Prätherapeutische histologische Sicherung
//
// Definition: Anteil invasiver Mammakarzinome / DCIS, bei denen vor dem
// ersten therapeutischen Eingriff eine Stanz-/Vakuumbiopsie als histo-
// logische Sicherung erfolgt ist.
//
// Quelle: S3-Leitlinie Mammakarzinom v5.0, Kapitel 8
// Logik: Library QualitaetsindikatorenLeitlinie (CQL-Defines QI_02_Zaehler/QI_02_Nenner)
//
// Aufruf:
//   POST /Measure/senologie-measure-s3-qi-02/$evaluate-measure
//        ?periodStart=2025-01-01&periodEnd=2025-12-31

Instance: senologie-measure-s3-qi-02
InstanceOf: Measure
Title: "Senologie Measure S3-QI-02: Prätherapeutische histologische Sicherung"
Description: "Anteil mit Stanz-/Vakuumbiopsie vor erstem therapeutischen Eingriff (S3-Leitlinie Mammakarzinom QI-2)"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-02"
* version = "0.1.0"
* name = "SenologieMeasureS3QI02"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Prätherapeutische histologische Sicherung — S3 Mammakarzinom Kapitel 8, QI-2"
* useContext.code = http://terminology.hl7.org/CodeSystem/usage-context-type#focus
* useContext.valueCodeableConcept = http://snomed.info/sct#254837009 "Malignant neoplasm of breast"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-02-group"
* group[=].population[+].id = "qi-02-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-02-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI02Nenner"

* group[=].population[+].id = "qi-02-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasQI02Zaehler"
