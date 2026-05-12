// CodeSystem für Senologie-Erweiterungen am MII Onko Rezeptorstatus / HER2-Status.
// Dies sind die Backport-Kandidaten für MII Onko — die hier kodierten Konzepte
// (IRS, Allred, HER2/CEN17 Ratio, HER2 Kopienzahl) sind im MII-Onko-Profil
// derzeit nicht vorgesehen, ärztlich aber relevant für ER-low/HER2-low-Analysen.

CodeSystem: CS_Senologie_Biomarker
Id: cs-senologie-biomarker
Title: "CS Senologie Biomarker Erweiterungen"
Description: "Codes für zusätzliche Biomarker-Components am MII Onko Mamma Rezeptorstatus/HER2-Status: IRS (Remmele-Stegner), Allred Score, HER2/CEN17-Ratio, HER2-Kopienzahl. Backport-Kandidaten für MII Onko."

* ^status = #draft
* ^version = "0.1.0"
* ^caseSensitive = true
* ^content = #complete

* #irs-score "IRS (Remmele-Stegner)"
    "Immunreaktiver Score nach Remmele-Stegner (0–12). Produkt aus Prozentscore (0–4) und Intensitätsscore (0–3). DE-Standard für ER/PR-Bewertung."
* #allred-score "Allred Score"
    "Allred Score (0–8). Summe aus Proportion Score (0–5) und Intensity Score (0–3). International gebräuchlich für ER/PR-Bewertung."
* #her2-cen17-ratio "HER2/CEN17 Ratio"
    "Ratio zwischen HER2- und CEN17-Signalen bei In-Situ-Hybridisierung (FISH/CISH/DISH). Cutoff für Amplifikation typ. ≥ 2.0."
* #her2-copy-number "HER2 Kopienzahl pro Zelle"
    "Mittlere HER2-Gen-Kopienzahl pro Tumorzelle (FISH/CISH). Cutoff für Amplifikation typ. ≥ 6."
* #percent-positive-cells "% Positive Zellen"
    "Anteil rezeptorpositiver Tumorzellen in Prozent. ER-low typ. < 10 %."
* #staining-intensity "Färbeintensität"
    "Färbeintensität 0 / 1+ / 2+ / 3+."
