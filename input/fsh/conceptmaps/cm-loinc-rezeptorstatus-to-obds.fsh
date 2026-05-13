// ConceptMap: LOINC Rezeptorstatus-Codes (LL-Answers) → oBDS/OncoBox P/N/U
//
// Die MII-Onko-Mamma-Rezeptorstatus-Profile (ER/PR) tragen im
// oBDS-Slice LOINC-Antworten LA6576-8 / LA6577-6 / LA4489-6.
// Die Krebsregister- und DKG-Output-Formate erwarten Einzel-Codes
// P / N / U. Diese ConceptMap nimmt dieses Mapping.

Instance: cm-loinc-rezeptorstatus-to-obds
InstanceOf: ConceptMap
Title: "LOINC Rezeptorstatus zu oBDS/OncoBox/IQTIG P/N/U"
Description: "Mapping: LOINC Answer-Codes LA6576-8/LA6577-6/LA4489-6 (Positive/Negative/Unknown) → P/N/U Single-Code (oBDS, OncoBox, IQTIG)."
Usage: #definition

* url = "https://www.senologie.org/fhir/ConceptMap/cm-loinc-rezeptorstatus-to-obds"
* name = "CmLoincRezeptorstatusToObds"
* status = #draft
* experimental = false
* date = "2026-05-13"

* sourceUri = "http://loinc.org"
* targetUri = "urn:senologie:rezeptorstatus-pnu"

* group[+].source = "http://loinc.org"
* group[=].target = "urn:senologie:rezeptorstatus-pnu"

* group[=].element[+].code = #LA6576-8
* group[=].element[=].display = "Positive"
* group[=].element[=].target[+].code = #P
* group[=].element[=].target[=].display = "positiv"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #LA6577-6
* group[=].element[=].display = "Negative"
* group[=].element[=].target[+].code = #N
* group[=].element[=].target[=].display = "negativ"
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #LA4489-6
* group[=].element[=].display = "Unknown"
* group[=].element[=].target[+].code = #U
* group[=].element[=].target[=].display = "unbekannt"
* group[=].element[=].target[=].equivalence = #equivalent
