Alias: $CS_GENEXPR = https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest

ValueSet: VS_Senologie_Genexpressionstest
Id: vs-senologie-genexpressionstest
Title: "VS Senologie Genexpressionstest"
Description: "Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom"

* ^status = #draft
* ^version = "0.1.0"
* ^experimental = true

* $CS_GENEXPR#oncotype-dx "Oncotype DX"
* $CS_GENEXPR#mammaprint "MammaPrint"
* $CS_GENEXPR#prosigna "Prosigna (PAM50)"
* $CS_GENEXPR#endopredict "EndoPredict"
