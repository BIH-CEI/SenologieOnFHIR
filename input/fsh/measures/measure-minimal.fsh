// Minimal-Measure zum Debuggen: ip=denominator=numerator=true → 100 % bei
// jeder Population. Iterativer Einstiegspunkt für HAPI \$evaluate-measure.

Instance: senologie-measure-minimal
InstanceOf: Measure
Title: "Senologie Measure Minimal (Debug)"
Description: "Trivialste Measure — ip/denominator/numerator immer true. Erwartetes Ergebnis bei N Patienten: N/N (100 %). Nutzt MinimalMeasureLib."
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-minimal"
* version = "0.1.0"
* name = "SenologieMeasureMinimal"
* status = #active
* experimental = true
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "Trivial-Measure für CR-Engine-Sanity-Check (alles true)."

* library = "https://www.senologie.org/fhir/Library/MinimalMeasureLib"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

// Group 1: triviale Sanity-Check Group (alle true)
* group[+].id = "minimal-group"
* group[=].population[+].id = "minimal-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "InInitialPopulation"
* group[=].population[+].id = "minimal-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "InDenominator"
* group[=].population[+].id = "minimal-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "InNumerator"

// Group 2: BET bei Mamma-Ca (Denominator = Mamma-Ca, Numerator = mit BET)
* group[+].id = "bet-bei-mamma-ca"
* group[=].population[+].id = "bet-ip"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasMammaCa"
* group[=].population[+].id = "bet-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasMammaCa"
* group[=].population[+].id = "bet-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasBET"
