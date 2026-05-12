// Senologie HER2-Status Profil — erbt von MII Onko Mamma Her2neu Status.
// Erweitert um HER2/CEN17-Ratio und HER2-Kopienzahl als Backport-Kandidaten.

Profile: Senologie_HER2_Status
Parent: $MII_PR_Onko_Mamma_Her2neu_Status
Id: senologie-her2-status
Title: "BIH Senologie HER2-Status"
Description: "HER2-Status — erbt MII Onko Mamma Her2neu Status (oBDS + Leitlinien-Slicing inkl. HER2-low/HER2-ultralow, IHC-Score + ISH-Status) und ergänzt HER2/CEN17-Ratio und HER2-Kopienzahl pro Zelle für quantitative ISH-Befunde."

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Logisches Modell der Senologie-Spezifikation"
* ^mapping[+].identity = "lm-element"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie#Pathologie.BefundInvasiv.Biomarker.HER2"
* ^mapping[=].name = "LM-Element: Pathologie.BefundInvasiv.Biomarker.HER2"

// Leitlinien-Slice (inkl. HER2-low/HER2-ultralow) als MS markieren
* value[x].coding[DefinitionLeitlinie] MS
* value[x].coding[DefinitionLeitlinie] ^short = "Leitlinien-Klassifikation (positiv / HER2-low / HER2-ultralow / negativ / equivocal) — empfohlen für HER2-low-Analysen"

// Zusätzliche Senologie-Components für quantitative ISH-Befunde
* component contains
    her2Cen17Ratio 0..1 MS and
    her2CopyNumber 0..1 MS

* component[her2Cen17Ratio].code = $CS_Senologie_Biomarker#her2-cen17-ratio
* component[her2Cen17Ratio] ^short = "HER2/CEN17-Ratio (FISH/CISH/DISH)"
* component[her2Cen17Ratio] ^comment = "Ratio aus HER2- und CEN17-Signalen. Cutoff für Amplifikation typ. ≥ 2.0."
* component[her2Cen17Ratio].value[x] only Quantity
* component[her2Cen17Ratio].valueQuantity.value 1..1
* component[her2Cen17Ratio].valueQuantity.system = "http://unitsofmeasure.org"
* component[her2Cen17Ratio].valueQuantity.code = #1
* component[her2Cen17Ratio] ^mapping[+].identity = "lm"
* component[her2Cen17Ratio] ^mapping[=].map = "Pathologie.BefundInvasiv.Biomarker.HER2.HER2CEN17Ratio"

* component[her2CopyNumber].code = $CS_Senologie_Biomarker#her2-copy-number
* component[her2CopyNumber] ^short = "HER2-Kopienzahl pro Zelle"
* component[her2CopyNumber] ^comment = "Mittlere HER2-Gen-Kopienzahl pro Tumorzelle. Cutoff für Amplifikation typ. ≥ 6."
* component[her2CopyNumber].value[x] only Quantity
* component[her2CopyNumber].valueQuantity.value 1..1
* component[her2CopyNumber] ^mapping[+].identity = "lm"
* component[her2CopyNumber] ^mapping[=].map = "Pathologie.BefundInvasiv.Biomarker.HER2.HER2Kopienzahl"
