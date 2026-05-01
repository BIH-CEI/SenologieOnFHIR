// ============================================================
// ConceptMap: MII Verlauf Gesamtbeurteilung -> OncoBox Verlauf-Ereignis
//
// Uebersetzung der MII Onko Verlauf-Gesamtbeurteilung (V/T/K/P/D/B/R/Y/U/X)
// auf OncoBox Verlauf_Ereignis Codes (1-6). Stabile Zustaende (V/T/K/B/R)
// werden nicht auf ein Ereignis gemappt. P->6 (Progress), Y->1 (Lokalrezidiv
// als Default; Differenzierung ueber Component-Auswertung in der SM).
// ============================================================

Instance: cm-oncobox-verlauf-gesamtbeurteilung-ereignis
InstanceOf: ConceptMap
Usage: #definition

Title: "MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis"
Description: "Mapping der MII Onko Verlauf-Gesamtbeurteilung auf OncoBox Verlauf_Ereignis. Stabile Zustaende (V, T, K, B, R) erzeugen kein Verlaufsereignis. P (Progression) wird auf 6 (Progress) gemappt, Y (Rezidiv) auf 1 (Lokalrezidiv als Default). D (divergent) und U/X (unbekannt/fehlend) werden nicht gemappt."
* url = "https://www.senologie.org/fhir/ConceptMap/cm-oncobox-verlauf-gesamtbeurteilung-ereignis"
* insert Version
* status = #draft
* experimental = true

* sourceUri = $MII_CS_Onko_Verlauf_Gesamt
* targetUri = "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-verlauf-ereignis"

* group[+].source = $MII_CS_Onko_Verlauf_Gesamt
* group[=].target = "https://www.senologie.org/fhir/CodeSystem/cs-oncobox-verlauf-ereignis"

// Stabile Zustaende -> kein Verlaufsereignis
* group[=].element[+].code = #V
* group[=].element[=].display = "Vollremission (complete remission, CR)"
* group[=].element[=].target[+].equivalence = #unmatched

* group[=].element[+].code = #T
* group[=].element[=].display = "Teilremission (partial remission, PR)"
* group[=].element[=].target[+].equivalence = #unmatched

* group[=].element[+].code = #K
* group[=].element[=].display = "keine Aenderung (no change, NC) = stable disease"
* group[=].element[=].target[+].equivalence = #unmatched

* group[=].element[+].code = #B
* group[=].element[=].display = "klinische Besserung (minimal response, MR)"
* group[=].element[=].target[+].equivalence = #unmatched

* group[=].element[+].code = #R
* group[=].element[=].display = "Vollremission mit residualen Auffaelligkeiten (CRr)"
* group[=].element[=].target[+].equivalence = #unmatched

// Progression -> 6 (Progress)
* group[=].element[+].code = #P
* group[=].element[=].display = "Progression"
* group[=].element[=].target[+].code = #6
* group[=].element[=].target[=].display = "Progress"
* group[=].element[=].target[=].equivalence = #wider

// Rezidiv -> 1 (Lokalrezidiv als Default; SM differenziert ueber Components)
* group[=].element[+].code = #Y
* group[=].element[=].display = "Rezidiv"
* group[=].element[=].target[+].code = #1
* group[=].element[=].target[=].display = "Lokalrezidiv"
* group[=].element[=].target[=].equivalence = #wider
* group[=].element[=].target[=].comment = "Default-Mapping auf Lokalrezidiv. Differenzierung (2=Regionalrezidiv, 3=Fernmetastase) erfolgt ueber Component-Auswertung Tumor_Verlauf/Lymphknoten_Verlauf/Fernmetastasen_Verlauf in der StructureMap."

// Divergent -> nicht gemappt (heterogenes Ansprechen, kein einzelnes Ereignis)
* group[=].element[+].code = #D
* group[=].element[=].display = "divergentes Geschehen"
* group[=].element[=].target[+].equivalence = #unmatched

// Unbekannt/fehlend -> nicht gemappt
* group[=].element[+].code = #U
* group[=].element[=].display = "Beurteilung unmoeglich"
* group[=].element[=].target[+].equivalence = #unmatched

* group[=].element[+].code = #X
* group[=].element[=].display = "fehlende Angabe"
* group[=].element[=].target[+].equivalence = #unmatched
