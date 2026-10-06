// CodeSystem for Diagnosesicherung (oBDS)
CodeSystem: CSSenologieDiagnosesicherung
Id: cs-senologie-diagnosesicherung
Title: "CodeSystem Diagnosesicherung"
Description: "Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz)"

* ^url = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^status = #draft
* ^caseSensitive = true

* #1 "Klinisch ohne weitere Spezifizierung"
  "Klinische Angaben (ohne die nachfolgenden Kategorien)"
* #2 "Klinische Diagnostik"
  "Spezifische Diagnostik wie Endoskopie, bildgebende Verfahren, Ultraschall, explorative Eingriffe"
* #3 "Chirurgisch/Autopsie ohne Histologie"
  "Chirurgische Eingriffe (wie Laparotomie) und Autopsie, aber ohne Gewebsuntersuchung"
* #4 "Spezifische Tumormarker"
  "Biochemische und/oder immunologische Marker, die für einen bestimmten Tumorsitz spezifisch sind"
* #5 "Zytologie"
  "Untersuchung von Zellen aus primärem oder sekundärem Sitz, einschließlich Aspiraten"
* #6 "Histologie einer Metastase"
  "Histologische Untersuchung von Metastasengewebe"
* #7 "Histologie Primärtumor"
  "Histologische Untersuchung eines Primärtumors"
* #7.1 "Histologie nach Operation"
  "Histologische Untersuchung nach operativer Entfernung"
* #7.2 "Histologie nach Biopsie"
  "Histologische Untersuchung nach Biopsie"
* #7.3 "Histologie nach Autopsie"
  "Histologische Untersuchung nach Autopsie"
* #8 "Genetisch/Molekularbiologisch"
  "Zytogenetische und/oder molekularbiologische Untersuchung"
* #9 "Unbekannt"
  "Diagnosesicherung unbekannt"


ValueSet: VSSenologieDiagnosesicherung
Id: vs-senologie-diagnosesicherung
Title: "ValueSet Diagnosesicherung"
Description: "Art der Diagnosesicherung gemäß oBDS für onkologische Diagnosen"

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-diagnosesicherung"
* ^status = #draft

* include codes from system CSSenologieDiagnosesicherung

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-diagnosesicherung-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 12
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #1
* ^expansion.contains[=].display = "Klinisch ohne weitere Spezifizierung"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #2
* ^expansion.contains[=].display = "Klinische Diagnostik"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #3
* ^expansion.contains[=].display = "Chirurgisch/Autopsie ohne Histologie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #4
* ^expansion.contains[=].display = "Spezifische Tumormarker"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #5
* ^expansion.contains[=].display = "Zytologie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #6
* ^expansion.contains[=].display = "Histologie einer Metastase"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #7
* ^expansion.contains[=].display = "Histologie Primärtumor"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #7.1
* ^expansion.contains[=].display = "Histologie nach Operation"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #7.2
* ^expansion.contains[=].display = "Histologie nach Biopsie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #7.3
* ^expansion.contains[=].display = "Histologie nach Autopsie"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #8
* ^expansion.contains[=].display = "Genetisch/Molekularbiologisch"
* ^expansion.contains[+].system = "https://www.senologie.org/fhir/CodeSystem/cs-senologie-diagnosesicherung"
* ^expansion.contains[=].code = #9
* ^expansion.contains[=].display = "Unbekannt"
