CodeSystem: CS_Senologie_Tumormanifestation
Id: cs-senologie-tumormanifestation
Title: "CS Senologie Tumormanifestation"
Description: "Klassifikation der Tumormanifestation bei Diagnosestellung"
* insert SenoCRMICodeSystem

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

* #primaertumor "Primärtumor"
    "Erstmanifestation des Tumors"
* #lokalrezidiv "Lokalrezidiv"
    "Wiederauftreten des Tumors am Ursprungsort"
* #regionaere-lk "Regionäre Lymphknotenmetastasen"
    "Metastasen in regionären Lymphknoten"
* #fernmetastasen "Fernmetastasen"
    "Metastasen in entfernten Organen"


Alias: $CS_TUMORMANIFESTATION = https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation

ValueSet: VS_Senologie_Tumormanifestation
Id: vs-senologie-tumormanifestation
Title: "VS Senologie Tumormanifestation"
Description: "Tumormanifestation bei Diagnosestellung (Mehrfachauswahl möglich)"
* insert SenoCRMIValueSet

* ^status = #draft
* ^version = "0.1.0"

* include codes from system $CS_TUMORMANIFESTATION

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-tumormanifestation-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 4
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation"
* ^expansion.contains[=].code = #primaertumor
* ^expansion.contains[=].display = "Primärtumor"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation"
* ^expansion.contains[=].code = #lokalrezidiv
* ^expansion.contains[=].display = "Lokalrezidiv"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation"
* ^expansion.contains[=].code = #regionaere-lk
* ^expansion.contains[=].display = "Regionäre Lymphknotenmetastasen"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-tumormanifestation"
* ^expansion.contains[=].code = #fernmetastasen
* ^expansion.contains[=].display = "Fernmetastasen"
