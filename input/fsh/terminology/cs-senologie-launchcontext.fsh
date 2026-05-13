// CodeSystem für Senologie-spezifische SDC launchContext-Variablen.
//
// Der SDC-CS http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext kennt nur
// fest definierte Codes: patient, encounter, location, user, study,
// clinical-trial. Für die Senologie brauchen wir zusätzlich einen
// "diagnosis"-Kontext, der eine Anker-Condition durch die nachgelagerten
// Questionnaires (OP, Pathologie, Tumorboard, Verlauf, Therapie) trägt.
//
// Verwendung: extension[launchContext].extension[name].valueCoding mit
// System = dieser CodeSystem-URL.

CodeSystem: CS_Senologie_LaunchContext
Id: cs-senologie-launchcontext
Title: "CS Senologie SDC LaunchContext"
Description: "Senologie-spezifische SDC launchContext-Variablennamen. Ergänzt den SDC-Default-CS um 'diagnosis' (Condition als Anker für nachgelagerte Questionnaires)."

* ^url = "https://www.senologie.org/fhir/CodeSystem/launchContext"
* ^status = #draft
* insert PR_CS_VS_Version
* ^caseSensitive = true
* ^content = #complete

* #diagnosis "Diagnose (Anker-Condition)"
    "Die Anker-Diagnose (Condition) des aktuellen Patienten, vom Frontend nach User-Choice gesetzt. Treibt Pre-Population der Folge-Questionnaires (OP, Pathologie, Tumorboard, Therapie, Verlauf)."
