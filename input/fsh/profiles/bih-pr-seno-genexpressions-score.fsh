Alias: $CS_GENEXPR = https://www.senologie.org/fhir/CodeSystem/cs-senologie-genexpressionstest
Alias: $LOINC = http://loinc.org
Alias: $UCUM = http://unitsofmeasure.org

Profile: Senologie_Genexpressions_Score
Parent: Observation
Id: senologie-genexpressions-score
Title: "BIH PR Seno Genexpressions-Score"
Description: "Observation für den numerischen Score-Wert eines Genexpressionstests (Oncotype DX Recurrence Score, MammaPrint Index, Prosigna ROR Score, EndoPredict EPclin Score)"

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossener Befund"

* category MS
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category contains laboratory 1..1
* category[laboratory] = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* category[laboratory] ^short = "Laboruntersuchung"

* code MS
* code ^short = "Art des Genexpressionstests"
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    genexpressionstest 1..1 MS and
    loinc 0..1 MS

// Lokaler Code für den Test-Typ
* code.coding[genexpressionstest] from VS_Senologie_Genexpressionstest (required)
* code.coding[genexpressionstest] ^short = "Genexpressionstest-Typ"

// LOINC Code (verfügbar für Prosigna)
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc] ^short = "LOINC Code"
* code.coding[loinc] ^comment = "Prosigna ROR Score: LOINC 76544-6. Für andere Tests ggf. nicht verfügbar."

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patientin"

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum des Testergebnisses"

* performer MS
* performer ^short = "Durchführendes Labor"

* valueQuantity MS
* valueQuantity ^short = "Numerischer Score-Wert"
* valueQuantity ^comment = "Oncotype DX: 0–100 (Recurrence Score). MammaPrint: -1.0 bis +1.0 (70-Gene Index). Prosigna: 0–100 (ROR Score). EndoPredict: kontinuierlich (EPclin Score)."
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.system = $UCUM (exactly)
* valueQuantity.code = #1 (exactly)
* valueQuantity.code ^short = "Einheitenloser Score"

* specimen ^short = "Tumorgewebe-Probe"

* method MS
* method ^short = "Testmethode"
* method ^comment = "Genexpressions-Analyse"
* method.text ^short = "Freitext zur Methode"

* note ^short = "Anmerkungen zum Testergebnis"
