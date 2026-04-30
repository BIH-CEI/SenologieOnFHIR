// ValueSets für Senologie Follow-Up / Verlaufsmeldung (OncoBox M01-M10)

Alias: $CS_FOLLOWUP_VS = https://www.senologie.org/fhir/CodeSystem/cs-senologie-follow-up

ValueSet: VS_Senologie_Nachsorge_Art
Id: vs-senologie-nachsorge-art
Title: "VS Senologie Nachsorge Art"
Description: "Art der Nachsorge: aktiv (persönliche Untersuchung) oder passiv (Akten/Register) — OncoBox M03"

* ^status = #draft
* ^version = "0.1.0"

* $CS_FOLLOWUP_VS#aktiv "Aktive Nachsorge"
* $CS_FOLLOWUP_VS#passiv "Passive Nachsorge"


ValueSet: VS_Senologie_Vitalstatus
Id: vs-senologie-vitalstatus
Title: "VS Senologie Vitalstatus"
Description: "Vitalstatus der Patientin zum Meldezeitpunkt — OncoBox M04"

* ^status = #draft
* ^version = "0.1.0"

* $SCT#438949009 "Alive (finding)"
* $SCT#419099009 "Dead (finding)"
* $SCT#261665006 "Unknown (qualifier value)"


ValueSet: VS_Senologie_Zweittumor
Id: vs-senologie-zweittumor
Title: "VS Senologie Zweittumor"
Description: "Zweittumor diagnostiziert: ja/nein/unbekannt — OncoBox M08"

* ^status = #draft
* ^version = "0.1.0"

* $SCT#373066001 "Yes (qualifier value)"
* $SCT#373067005 "No (qualifier value)"
* $SCT#261665006 "Unknown (qualifier value)"
