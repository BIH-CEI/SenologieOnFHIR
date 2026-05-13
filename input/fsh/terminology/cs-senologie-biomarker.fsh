// CodeSystem für Senologie-Erweiterungen am MII Onko Rezeptorstatus (ER/PR).
// Backport-Kandidaten für MII Onko: IRS und Allred sind dort nicht vorgesehen,
// ärztlich aber relevant.
//
// Nicht in diesem CS: HER2/CEN17-Ratio, Kopienzahl, Signale — diese sind
// bereits in MII MTB ("MII_PR_MTB_INSITUHYBRIDIZATION_HER2", LOINC Panel
// 74885-5) abgebildet und müssen nicht doppelt definiert werden.

CodeSystem: CS_Senologie_Biomarker
Id: cs-senologie-biomarker
Title: "CS Senologie Biomarker Erweiterungen"
Description: "Codes für zusätzliche IHC-Components am MII Onko Mamma Rezeptorstatus (ER/PR): IRS (Remmele-Stegner) und Allred Score. Backport-Kandidaten für MII Onko."

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

* #irs-score "IRS (Remmele-Stegner)"
    "Immunreaktiver Score nach Remmele-Stegner (0–12). Produkt aus Prozentscore (0–4) und Intensitätsscore (0–3). DE-Standard für ER/PR-Bewertung."
* #allred-score "Allred Score"
    "Allred Score (0–8). Summe aus Proportion Score (0–5) und Intensity Score (0–3). International gebräuchlich für ER/PR-Bewertung."

// HER2 Leitlinie-Klassifikation 2024 (positiv/low/ultralow/negativ/equivocal)
* #her2-positiv "HER2-positiv"
* #her2-low "HER2-low"
* #her2-ultralow "HER2-ultralow"
* #her2-negativ "HER2-negativ"
* #her2-equivocal "HER2-equivocal"

// In-situ-Hybridisierungs-Methoden
* #fish "FISH (Fluoreszenz-ISH)"
* #cish "CISH (Chromogene ISH)"
* #dish "DISH (Dual-ISH)"
* #sish "SISH (Silver-ISH)"

// IHC-Färbeintensität (ER/PR)
* #intensity-negative "negative"
* #intensity-weak "weak"
* #intensity-moderate "moderate"
* #intensity-strong "strong"
