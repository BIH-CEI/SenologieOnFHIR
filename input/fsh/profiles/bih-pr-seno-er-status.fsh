// Senologie ER-Status Profil — erbt von MII Onko Rezeptorstatus Estrogen.
// Erweitert um zusätzliche Components für IRS (DE-Standard) und Allred-Score.
// Diese Erweiterungen sind als Backport-Vorschlag für MII Onko gedacht.

Profile: Senologie_ER_Status
Parent: $MII_PR_Onko_Mamma_Rezeptorstatus_Estrogen
Id: senologie-er-status
Title: "BIH Senologie ER-Status"
Description: "Östrogenrezeptor-Status — erbt MII Onko Mamma Rezeptorstatus Estrogen (oBDS + Leitlinien-Slicing, AnteilPositiveZellen + Färbeintensität) und ergänzt IRS (Remmele-Stegner) und Allred-Score als Senologie-Erweiterung. Erlaubt ER-low-Analysen."

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Logisches Modell der Senologie-Spezifikation"
* ^mapping[+].identity = "lm-element"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie#Pathologie.BefundInvasiv.Biomarker.ER"
* ^mapping[=].name = "LM-Element: Pathologie.BefundInvasiv.Biomarker.ER"

// Leitlinien-Slice als MS markieren (positiv/gering-positiv/negativ — ermöglicht ER-low-Erfassung)
* value[x].coding[DefinitionLeitlinie] MS
* value[x].coding[DefinitionLeitlinie] ^short = "Leitlinien-Klassifikation (positiv / gering-positiv / negativ) — empfohlen für ER-low-Analysen"

// Zusätzliche Senologie-Components (Backport-Kandidaten für MII Onko)
* component contains
    irsScore 0..1 MS and
    allredScore 0..1 MS

* component[irsScore].code = $CS_Senologie_Biomarker#irs-score
* component[irsScore] ^short = "IRS (Remmele-Stegner, 0–12)"
* component[irsScore] ^comment = "Immunreaktiver Score nach Remmele-Stegner (DE-Standard). Produkt aus Prozentscore (0–4) und Intensitätsscore (0–3)."
* component[irsScore].value[x] only Quantity
* component[irsScore].valueQuantity.value 1..1
* component[irsScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[irsScore].valueQuantity.code = #{score}
* component[irsScore] ^mapping[+].identity = "lm"
* component[irsScore] ^mapping[=].map = "Pathologie.BefundInvasiv.Biomarker.ER.IRSScore"

* component[allredScore].code = $CS_Senologie_Biomarker#allred-score
* component[allredScore] ^short = "Allred Score (0–8)"
* component[allredScore] ^comment = "Allred Score (international). Summe aus Proportion (0–5) und Intensity (0–3). LOINC 85337-4 als alternative Kodierung möglich."
* component[allredScore].value[x] only Quantity
* component[allredScore].valueQuantity.value 1..1
* component[allredScore].valueQuantity.system = "http://unitsofmeasure.org"
* component[allredScore].valueQuantity.code = #{score}
* component[allredScore] ^mapping[+].identity = "lm"
* component[allredScore] ^mapping[=].map = "Pathologie.BefundInvasiv.Biomarker.ER.AllredScore"
