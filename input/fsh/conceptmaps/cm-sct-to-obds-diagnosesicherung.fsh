// ConceptMap: SNOMED CT Diagnostik-Procedure → oBDS Diagnosesicherung
//
// oBDS-Feld 5.7 "Diagnosesicherung" ist im Krebsregister-Format ein
// einzelner Code (1..9). In FHIR/SNOMED-Welt stehen die Information
// als Procedure (Stanze, Vakuumbiopsie, Exzision …) — diese ConceptMap
// gibt die Übersetzung.

Instance: cm-sct-to-obds-diagnosesicherung
InstanceOf: ConceptMap
Title: "SNOMED CT Diagnostik-Procedure zu oBDS Diagnosesicherung"
Description: "Mapping: SNOMED CT Biopsie-Codes → oBDS-Diagnosesicherungscode (5.7). Stützt CQL-QI-2 mit Datenquellen-Agnostik."
Usage: #definition

* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-obds-diagnosesicherung"
* name = "CmSctToObdsDiagnosesicherung"
* status = #draft
* experimental = false
* date = "2026-05-13"

* sourceUri = "http://snomed.info/sct"
* targetUri = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung"

* group[+].source = "http://snomed.info/sct"
* group[=].target = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-primaertumor-diagnosesicherung"

// Stanzbiopsie → "7" (histologische Untersuchung Primärtumor, prätherapeutisch)
* group[=].element[+].code = #119738008
* group[=].element[=].display = "Core biopsy of breast (procedure)"
* group[=].element[=].target[+].code = #7
* group[=].element[=].target[=].display = "histologische Untersuchung eines Primärtumors"
* group[=].element[=].target[=].equivalence = #relatedto

// Vakuumbiopsie → "7"
* group[=].element[+].code = #1188850001
* group[=].element[=].display = "Vacuum-assisted biopsy of breast"
* group[=].element[=].target[+].code = #7
* group[=].element[=].target[=].display = "histologische Untersuchung eines Primärtumors"
* group[=].element[=].target[=].equivalence = #relatedto

// Generic Biopsy → "7"
* group[=].element[+].code = #122548005
* group[=].element[=].display = "Biopsy of breast (procedure)"
* group[=].element[=].target[+].code = #7
* group[=].element[=].target[=].display = "histologische Untersuchung eines Primärtumors"
* group[=].element[=].target[=].equivalence = #relatedto

// Exzisionsbiopsie → "8" (intraoperativ, da Exzision i.d.R. im OP)
* group[=].element[+].code = #51632004
* group[=].element[=].display = "Excisional biopsy"
* group[=].element[=].target[+].code = #8
* group[=].element[=].target[=].display = "intraoperative histologische Untersuchung"
* group[=].element[=].target[=].equivalence = #relatedto
