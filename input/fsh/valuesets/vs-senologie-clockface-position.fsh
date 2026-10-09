// Uhrzeitposition (Clock-Face-Position) für BodyStructure.bodyLandmarkOrientation
// (R5-Backport). 1-12 Uhr als SNOMED-Codes (260318004..260326007).
// Spiegelt die R5-Standard-ValueSet
// http://hl7.org/fhir/ValueSet/bodystructure-bodylandmarkorientation-clockface-position

ValueSet: VS_Senologie_ClockFace_Position
Id: vs-senologie-clockface-position
Title: "VS Senologie Clock-Face Position (Uhrzeitposition)"
Description: "12 Uhrzeitpositionen (1-12 Uhr) als SNOMED CT Codes für die Mamma-Lokalisation im Uhrzeitschema."
* insert SenoCRMIValueSet

* ^url = "https://www.senologie.org/fhir/ValueSet/vs-senologie-clockface-position"
* ^status = #draft
* insert PR_CS_VS_Version

* $SCT#260318004 "1 o'clock position"
* $SCT#260328008 "2 o'clock position"
* $SCT#260330005 "3 o'clock position"
* $SCT#260333007 "4 o'clock position"
* $SCT#260335000 "5 o'clock position"
* $SCT#260337008 "6 o'clock position"
* $SCT#260339006 "7 o'clock position"
* $SCT#260341007 "8 o'clock position"
* $SCT#260343005 "9 o'clock position"
* $SCT#260322009 "10 o'clock position"
* $SCT#260324005 "11 o'clock position"
* $SCT#260326007 "12 o'clock position"

// Pre-built expansion for Aidbox/$expand — generated 2026-10-06
* ^expansion.identifier = "urn:uuid:vs-senologie-clockface-position-expansion"
* ^expansion.timestamp = "2026-10-06T00:00:00Z"
* ^expansion.total = 12
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260318004
* ^expansion.contains[=].display = "1 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260328008
* ^expansion.contains[=].display = "2 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260330005
* ^expansion.contains[=].display = "3 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260333007
* ^expansion.contains[=].display = "4 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260335000
* ^expansion.contains[=].display = "5 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260337008
* ^expansion.contains[=].display = "6 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260339006
* ^expansion.contains[=].display = "7 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260341007
* ^expansion.contains[=].display = "8 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260343005
* ^expansion.contains[=].display = "9 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260322009
* ^expansion.contains[=].display = "10 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260324005
* ^expansion.contains[=].display = "11 o'clock position"
* ^expansion.contains[+].system = "http://snomed.info/sct"
* ^expansion.contains[=].code = #260326007
* ^expansion.contains[=].display = "12 o'clock position"
