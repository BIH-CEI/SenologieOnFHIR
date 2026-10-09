// ValueSets für Senologie Follow-Up / Verlaufsmeldung (OncoBox M01-M10)

Alias: $CS_FOLLOWUP_VS = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

ValueSet: VS_Senologie_Nachsorge_Art
Id: vs-senologie-nachsorge-art
Title: "VS Senologie Nachsorge Art"
Description: "Art der Nachsorge: aktiv (persönliche Untersuchung) oder passiv (Akten/Register) — OncoBox M03"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"

* $CS_FOLLOWUP_VS#aktiv "Aktive Nachsorge"
* $CS_FOLLOWUP_VS#passiv "Passive Nachsorge"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-nachsorge-art-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 2
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up"
* ^expansion.contains[=].code = #aktiv
* ^expansion.contains[=].display = "Aktive Nachsorge"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up"
* ^expansion.contains[=].code = #passiv
* ^expansion.contains[=].display = "Passive Nachsorge"

ValueSet: VS_Senologie_Zweittumor
Id: vs-senologie-zweittumor
Title: "VS Senologie Zweittumor"
Description: "Zweittumor diagnostiziert: ja/nein/unbekannt — OncoBox M08"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"

* $SCT#373066001 "Yes (qualifier value)"
* $SCT#373067005 "No (qualifier value)"
* $SCT#261665006 "Unknown (qualifier value)"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-zweittumor-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 3
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373066001
* ^expansion.contains[=].display = "Yes (qualifier value)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #373067005
* ^expansion.contains[=].display = "No (qualifier value)"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #261665006
* ^expansion.contains[=].display = "Unknown (qualifier value)"
