// Antwortoptionen für T/N/M-Items in Fragebögen.
//
// Die Antwort bleibt ein einzelnes UICC-Coding. Das SNOMED-CT-Äquivalent hängt
// als Standard-Extension `alternate-codes` am valueCoding der Option; die
// Extraktionsvorlagen lesen es von dort und schreiben es als zweites Coding
// (MII Onko 2027: value[x].coding:snomed-ct). Die Zuordnung stammt aus den
// MII-Onko-ConceptMaps mii-cm-onko-tnm-uicc-sct-clinical / -pathological;
// das Präfix (c/p) ist Teil des SNOMED-CT-Konzepts, deshalb unterscheiden sich
// die Optionen der klinischen und der pathologischen Items.

RuleSet: TnmAnswerOption(code, display, sct, sctDisplay)
* item[=].item[=].answerOption[+].valueCoding = https://www.uicc.org/resources/tnm#{code} "{display}"
* item[=].item[=].answerOption[=].valueCoding.extension.url = "http://hl7.org/fhir/StructureDefinition/alternate-codes"
* item[=].item[=].answerOption[=].valueCoding.extension.valueCodeableConcept = http://snomed.info/sct#{sct} "{sctDisplay}"

// Für UICC-Codes ohne SNOMED-CT-Entsprechung (cN1mi, pM0)
RuleSet: TnmAnswerOptionUiccOnly(code, display)
* item[=].item[=].answerOption[+].valueCoding = https://www.uicc.org/resources/tnm#{code} "{display}"
