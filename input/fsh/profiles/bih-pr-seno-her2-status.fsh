// Senologie HER2-Status (IHC) — erbt MII Onko Mamma Her2neu Status.
//
// Wichtig: Die quantitative ISH-Reflextestung (HER2/CEP17-Ratio, Kopienzahl,
// gezählte Zellkerne) wird NICHT hier abgebildet, sondern über das
// MII MTB Profil "MII_PR_MTB_INSITUHYBRIDIZATION_HER2" (LOINC Panel 74885-5).
// Bei IHC 2+ ist die ISH-Reflextestung obligat — dann referenzieren Befund
// (IHC) und ISH (MTB) sich gegenseitig oder werden in einem DiagnosticReport
// gruppiert.

Profile: Senologie_HER2_Status
Parent: $MII_PR_Onko_Mamma_Her2neu_Status
Id: senologie-her2-status
Title: "BIH Senologie HER2-Status (IHC)"
Description: "HER2-Status aus Immunhistochemie — erbt MII Onko Mamma Her2neu Status (oBDS + Leitlinien-Slicing inkl. HER2-low/HER2-ultralow, IHC-Score + ISH-Ergebnis). Quantitative ISH-Details (Ratio/Kopienzahl) werden über MII MTB INSITUHYBRIDIZATION_HER2 abgebildet."

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Bezugselement im Logischen Modell: Pathologie.BefundInvasiv.Biomarker.HER2"

// Leitlinien-Slice (inkl. HER2-low/HER2-ultralow) als MS markieren
* value[x].coding[DefinitionLeitlinie] MS
* value[x].coding[DefinitionLeitlinie] ^short = "Leitlinien-Klassifikation (positiv / HER2-low / HER2-ultralow / negativ / equivocal) — empfohlen für HER2-low-Analysen"
* value[x].coding[DefinitionLeitlinie] ^comment = "ER-low und HER2-low sind nur über den Leitlinien-Slice analysierbar (oBDS-Slice kennt nur positiv/negativ/unbekannt)."

// hasMember-Verweis auf die ISH-Reflextestung (MII MTB) bei IHC 2+
* hasMember MS
* hasMember ^short = "Verweis auf ISH-Reflextestung bei IHC 2+ (MII MTB INSITUHYBRIDIZATION_HER2)"
* hasMember ^comment = "Bei equivocal IHC (2+) sollte hier auf das MII MTB ISH-HER2 Observation-Profil referenziert werden, das HER2/CEP17-Ratio, Signale und Zellzahl quantitativ erfasst."
