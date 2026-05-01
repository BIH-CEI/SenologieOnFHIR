CodeSystem: CS_Senologie_Tumormanifestation
Id: cs-senologie-tumormanifestation
Title: "CS Senologie Tumormanifestation"
Description: "Klassifikation der Tumormanifestation bei Diagnosestellung"

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

* ^status = #draft
* ^version = "0.1.0"

* include codes from system $CS_TUMORMANIFESTATION
