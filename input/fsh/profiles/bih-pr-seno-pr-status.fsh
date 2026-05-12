// Senologie PR-Status Profil — analog ER, erbt von MII Onko Rezeptorstatus Progesteron.

Profile: Senologie_PR_Status
Parent: $MII_PR_Onko_Mamma_Rezeptorstatus_Progesteron
Id: senologie-pr-status
Title: "BIH Senologie PR-Status"
Description: "Progesteronrezeptor-Status — erbt MII Onko Mamma Rezeptorstatus Progesteron (oBDS + Leitlinien-Slicing, AnteilPositiveZellen + Färbeintensität) und ergänzt IRS und Allred-Score als Senologie-Erweiterung."

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Logisches Modell der Senologie-Spezifikation"
* ^mapping[+].identity = "lm-element"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie#Pathologie.BefundInvasiv.Biomarker.PR"
* ^mapping[=].name = "LM-Element: Pathologie.BefundInvasiv.Biomarker.PR"

* value[x].coding[DefinitionLeitlinie] MS
* value[x].coding[DefinitionLeitlinie] ^short = "Leitlinien-Klassifikation (positiv / gering-positiv / negativ) — empfohlen für PR-low-Analysen"

* component contains
    irsScore 0..1 MS and
    allredScore 0..1 MS

* component[irsScore].code = $CS_Senologie_Biomarker#irs-score
* component[irsScore] ^short = "IRS (Remmele-Stegner, 0–12)"
* component[irsScore].value[x] only Quantity
* component[irsScore].valueQuantity.value 1..1
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}
* component[irsScore] ^mapping[+].identity = "lm"
* component[irsScore] ^mapping[=].map = "Pathologie.BefundInvasiv.Biomarker.PR.IRSScore"

* component[allredScore].code = $CS_Senologie_Biomarker#allred-score
* component[allredScore] ^short = "Allred Score (0–8). LOINC 85339-0 als alternative Kodierung möglich."
* component[allredScore].value[x] only Quantity
* component[allredScore].valueQuantity.value 1..1
* component[allredScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[allredScore].valueQuantity.code = #{score}
* component[allredScore] ^mapping[+].identity = "lm"
* component[allredScore] ^mapping[=].map = "Pathologie.BefundInvasiv.Biomarker.PR.AllredScore"
