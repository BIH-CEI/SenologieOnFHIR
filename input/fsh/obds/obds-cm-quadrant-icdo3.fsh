// ============================================================================
// ConceptMap: SNOMED CT Brustquadrant → ICD-O-3 Topographie (C50.x)
// Für die Ableitung der ICD-O-3 Topographie aus der BodyStructure
// (Senologie_Tumorlokalisation.locationQualifier[quadrant])
// ============================================================================

Instance: cm-sct-to-icdo3-mamma-topographie
InstanceOf: ConceptMap
Usage: #definition
Title: "CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie"
Description: "Übersetzung der SNOMED-CT-kodierten Brustquadranten in ICD-O-3 Topographie-Codes (C50.0–C50.9) für die oBDS-Krebsregistermeldung. Quelle: BodyStructure.locationQualifier[quadrant]."

* url = "https://www.senologie.org/fhir/ConceptMap/cm-sct-to-icdo3-mamma-topographie"
* version = "0.1.0"
* name = "CM_SCT_To_ICDO3_Mamma_Topographie"
* status = #draft

// sourceUri and targetUri omitted — use group.source/.target for CodeSystem references

// Brustwarze und Warzenhof
* group[+].source = "http://snomed.info/sct"
* group[=].target = "http://terminology.hl7.org/CodeSystem/icd-o-3"

* group[=].element[+].code = #279007000
* group[=].element[=].display = "Nipple structure"
* group[=].element[=].target[+].code = #C50.0
* group[=].element[=].target[=].display = "Brustwarze und Warzenhof"
* group[=].element[=].target[=].equivalence = #equivalent

// Zentraler Drüsenkörper
* group[=].element[+].code = #49058007
* group[=].element[=].display = "Central portion of breast"
* group[=].element[=].target[+].code = #C50.1
* group[=].element[=].target[=].display = "Zentraler Drüsenkörper der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

// Oberer innerer Quadrant
* group[=].element[+].code = #77831004
* group[=].element[=].display = "Upper inner quadrant of breast"
* group[=].element[=].target[+].code = #C50.2
* group[=].element[=].target[=].display = "Oberer innerer Quadrant der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

// Unterer innerer Quadrant
* group[=].element[+].code = #19100000
* group[=].element[=].display = "Lower inner quadrant of breast"
* group[=].element[=].target[+].code = #C50.3
* group[=].element[=].target[=].display = "Unterer innerer Quadrant der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

// Oberer äußerer Quadrant
* group[=].element[+].code = #76365002
* group[=].element[=].display = "Upper outer quadrant of breast"
* group[=].element[=].target[+].code = #C50.4
* group[=].element[=].target[=].display = "Oberer äußerer Quadrant der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

// Unterer äußerer Quadrant
* group[=].element[+].code = #33564002
* group[=].element[=].display = "Lower outer quadrant of breast"
* group[=].element[=].target[+].code = #C50.5
* group[=].element[=].target[=].display = "Unterer äußerer Quadrant der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

// Axillärer Ausläufer
* group[=].element[+].code = #38412008
* group[=].element[=].display = "Axillary tail of breast"
* group[=].element[=].target[+].code = #C50.6
* group[=].element[=].target[=].display = "Recessus axillaris der Brustdrüse"
* group[=].element[=].target[=].equivalence = #equivalent

// Fallback: Brust ohne Quadrantenangabe → C50.9
* group[=].unmapped.mode = #fixed
* group[=].unmapped.code = #C50.9
* group[=].unmapped.display = "Brustdrüse, nicht näher bezeichnet"
