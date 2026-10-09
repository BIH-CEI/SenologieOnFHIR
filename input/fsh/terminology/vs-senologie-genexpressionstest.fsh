Alias: $CS_GENEXPR = https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest

ValueSet: VS_Senologie_Genexpressionstest
Id: vs-senologie-genexpressionstest
Title: "VS Senologie Genexpressionstest"
Description: "Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

* $CS_GENEXPR#oncotype-dx "Oncotype DX"
* $CS_GENEXPR#mammaprint "MammaPrint"
* $CS_GENEXPR#prosigna "Prosigna (PAM50)"
* $CS_GENEXPR#endopredict "EndoPredict"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-genexpressionstest-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest"
* ^expansion.contains[=].code = #oncotype-dx
* ^expansion.contains[=].display = "Oncotype DX"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest"
* ^expansion.contains[=].code = #mammaprint
* ^expansion.contains[=].display = "MammaPrint"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest"
* ^expansion.contains[=].code = #prosigna
* ^expansion.contains[=].display = "Prosigna (PAM50)"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest"
* ^expansion.contains[=].code = #endopredict
* ^expansion.contains[=].display = "EndoPredict"
