// ============================================================
// ConceptMap: OncoBox Endokrine Substanzklasse -> ATC
//
// Uebersetzung der OncoBox-Substanzklassen-Codes (1-5, 9) fuer
// endokrine Therapie auf ATC-Codes. Wird von der OncoBox-
// Transformation (SenologieToOncoBoxBrustTherapie) verwendet.
// ============================================================

Instance: cm-oncobox-endokrine-substanz-atc
InstanceOf: ConceptMap
Usage: #definition

Title: "OncoBox Endokrine Substanzklasse zu ATC"
Description: "Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor)"
* url = "https://www.senologie.org/fhir/ConceptMap/cm-oncobox-endokrine-substanz-atc"
* insert Version
* status = #draft
* experimental = true

* sourceUri = "http://fhir.de/CodeSystem/bfarm/atc"
* targetUri = "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-endokrine-substanz"

// Tamoxifen
* group[+].source = "http://fhir.de/CodeSystem/bfarm/atc"
* group[=].target = "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-endokrine-substanz"
* group[=].element[+].code = #L02BA01
* group[=].element[=].display = "Tamoxifen"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "Tamoxifen"
* group[=].element[=].target[=].equivalence = #equivalent

// Aromatasehemmer
* group[=].element[+].code = #L02BG03
* group[=].element[=].display = "Anastrozol"
* group[=].element[=].target[+].code = #2
* group[=].element[=].target[=].display = "Aromatasehemmer"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #L02BG04
* group[=].element[=].display = "Letrozol"
* group[=].element[=].target[+].code = #2
* group[=].element[=].target[=].display = "Aromatasehemmer"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #L02BG06
* group[=].element[=].display = "Exemestan"
* group[=].element[=].target[+].code = #2
* group[=].element[=].target[=].display = "Aromatasehemmer"
* group[=].element[=].target[=].equivalence = #wider

// GnRH-Analoga
* group[=].element[+].code = #L02AE02
* group[=].element[=].display = "Leuprorelin"
* group[=].element[=].target[+].code = #3
* group[=].element[=].target[=].display = "GnRH-Analogon"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #L02AE03
* group[=].element[=].display = "Goserelin"
* group[=].element[=].target[+].code = #3
* group[=].element[=].target[=].display = "GnRH-Analogon"
* group[=].element[=].target[=].equivalence = #wider

// Fulvestrant
* group[=].element[+].code = #L02BA03
* group[=].element[=].display = "Fulvestrant"
* group[=].element[=].target[+].code = #4
* group[=].element[=].target[=].display = "Fulvestrant"
* group[=].element[=].target[=].equivalence = #equivalent

// CDK4/6-Inhibitoren
* group[=].element[+].code = #L01EF01
* group[=].element[=].display = "Palbociclib"
* group[=].element[=].target[+].code = #5
* group[=].element[=].target[=].display = "CDK4/6-Inhibitor"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #L01EF02
* group[=].element[=].display = "Ribociclib"
* group[=].element[=].target[+].code = #5
* group[=].element[=].target[=].display = "CDK4/6-Inhibitor"
* group[=].element[=].target[=].equivalence = #wider

* group[=].element[+].code = #L01EF03
* group[=].element[=].display = "Abemaciclib"
* group[=].element[=].target[+].code = #5
* group[=].element[=].target[=].display = "CDK4/6-Inhibitor"
* group[=].element[=].target[=].equivalence = #wider
