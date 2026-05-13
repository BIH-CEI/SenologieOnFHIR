// Uhrzeitposition (Clock-Face-Position) für BodyStructure.bodyLandmarkOrientation
// (R5-Backport). 1-12 Uhr als SNOMED-Codes (260318004..260326007).
// Spiegelt die R5-Standard-ValueSet
// http://hl7.org/fhir/ValueSet/bodystructure-bodylandmarkorientation-clockface-position

ValueSet: VS_Senologie_ClockFace_Position
Id: vs-senologie-clockface-position
Title: "VS Senologie Clock-Face Position (Uhrzeitposition)"
Description: "12 Uhrzeitpositionen (1-12 Uhr) als SNOMED CT Codes für die Mamma-Lokalisation im Uhrzeitschema."

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
