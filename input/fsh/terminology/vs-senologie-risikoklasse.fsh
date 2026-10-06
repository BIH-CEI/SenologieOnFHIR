ValueSet: VS_Senologie_Risikoklasse
Id: vs-senologie-risikoklasse
Title: "VS Senologie Risikoklasse"
Description: "Risikokategorien für Genexpressionstests (low, intermediate, high)"

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

// http://terminology.hl7.org/CodeSystem/risk-probability
* http://terminology.hl7.org/CodeSystem/risk-probability#low "Low likelihood"
* http://terminology.hl7.org/CodeSystem/risk-probability#moderate "Moderate likelihood"
* http://terminology.hl7.org/CodeSystem/risk-probability#high "High likelihood"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-risikoklasse-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/risk-probability"
* ^expansion.contains[=].code = #low
* ^expansion.contains[=].display = "Low likelihood"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/risk-probability"
* ^expansion.contains[=].code = #moderate
* ^expansion.contains[=].display = "Moderate likelihood"
* ^expansion.contains[+].system = "http://terminology.hl7.org/CodeSystem/risk-probability"
* ^expansion.contains[=].code = #high
* ^expansion.contains[=].display = "High likelihood"
