// ConceptMap: MII Her2neu-Status Leitlinien-Codes → oBDS/OncoBox/IQTIG P/N/U
//
// MII-Onko-Mamma-Her2neu-Status hat im Leitlinien-Slice die Codes
// positiv / low / ultralow / negativ / equivocal. Die Krebsregister-
// und DKG-Output-Formate kennen nur P/N/U. Diese ConceptMap zeigt
// die offizielle Reduktion auf den binären Fall.
//
// Wichtig: HER2-low und HER2-ultralow werden auf 'N' (negativ) gemappt
// — die Information geht in oBDS/OncoBox-Output verloren (siehe
// biomarker-backport.md). In der FHIR-Schicht bleibt die Granularität
// erhalten.

Instance: cm-her2-leitlinie-to-obds
InstanceOf: ConceptMap
Title: "MII HER2 Leitlinien-Klassifikation zu oBDS/OncoBox/IQTIG P/N/U"
Description: "Mapping: MII Her2neu-Leitlinien-Codes (positiv/low/ultralow/negativ/equivocal) → P/N/U. HER2-low und HER2-ultralow werden zu 'N' subsumiert (oBDS-Spec-Limitation)."
Usage: #definition

* url = "https://www.senologie.org/fhir/ConceptMap/cm-her2-leitlinie-to-obds"
* name = "CmHer2LeitlinieToObds"
* status = #draft
* experimental = false
* date = "2026-05-13"

* sourceUri = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie"
* targetUri = "urn:senologie:rezeptorstatus-pnu"

* group[+].source = "https://www.medizininformatik-initiative.de/fhir/ext/modul-onko/CodeSystem/mii-cs-onko-mamma-her2neu-status-leitlinie"
* group[=].target = "urn:senologie:rezeptorstatus-pnu"

* group[=].element[+].code = #positiv
* group[=].element[=].display = "HER2-positiv"
* group[=].element[=].target[+].code = #P
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #low
* group[=].element[=].display = "HER2-low"
* group[=].element[=].target[+].code = #N
* group[=].element[=].target[=].comment = "HER2-low → 'N' in oBDS (Information geht verloren)"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #ultralow
* group[=].element[=].display = "HER2-ultralow"
* group[=].element[=].target[+].code = #N
* group[=].element[=].target[=].comment = "HER2-ultralow → 'N' in oBDS (Information geht verloren)"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #negativ
* group[=].element[=].display = "HER2-negativ"
* group[=].element[=].target[+].code = #N
* group[=].element[=].target[=].equivalence = #equivalent

* group[=].element[+].code = #equivocal
* group[=].element[=].display = "HER2 equivocal"
* group[=].element[=].target[+].code = #U
* group[=].element[=].target[=].comment = "Equivocal → unbekannt; oBDS kennt keine equivocal-Klasse"
* group[=].element[=].target[=].equivalence = #relatedto
