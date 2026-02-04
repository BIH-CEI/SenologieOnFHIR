Alias: $CS_GENEXPR = http://fhir.bih-charite.de/kds-senologie/CodeSystem/cs-senologie-genexpressionstest
Alias: $LOINC = http://loinc.org

Profile: Senologie_Genexpressionstest
Parent: RiskAssessment
Id: senologie-genexpressionstest
Title: "BIH PR Seno Genexpressionstest"
Description: "RiskAssessment für genomische Risikoscores bei Mammakarzinom (Oncotype DX, MammaPrint, Prosigna, EndoPredict). Bildet die Risikoklassifikation ab und referenziert die Score-Observation."

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)
* status ^short = "Abgeschlossene Risikobewertung"

* subject 1..1 MS
* subject only Reference(Patient)
* subject ^short = "Patientin"

* occurrenceDateTime MS
* occurrenceDateTime ^short = "Datum der Risikobewertung"

* condition MS
* condition only Reference(Condition)
* condition ^short = "Zugehörige Mammakarzinom-Diagnose"

* performer MS
* performer only Reference(Practitioner or PractitionerRole)
* performer ^short = "Durchführendes Labor / Arzt"

// Welcher Test wurde durchgeführt
* method 1..1 MS
* method from VS_Senologie_Genexpressionstest (required)
* method ^short = "Art des Genexpressionstests"
* method ^comment = "Oncotype DX, MammaPrint, Prosigna oder EndoPredict"

// Referenz zur Score-Observation
* basis MS
* basis only Reference(Observation)
* basis ^short = "Referenz zur Score-Observation"
* basis ^comment = "Referenz auf Senologie_Genexpressions_Score mit dem numerischen Testergebnis"

// Risikoprädiktion
* prediction 1..1 MS
* prediction ^short = "Risikoprädiktion"

// Qualitative Risikoklasse (low/intermediate/high)
* prediction.qualitativeRisk 1..1 MS
* prediction.qualitativeRisk from VS_Senologie_Risikoklasse (required)
* prediction.qualitativeRisk ^short = "Risikoklasse"
* prediction.qualitativeRisk ^comment = "Oncotype DX: low (0–10), intermediate (11–25), high (≥26). MammaPrint: low (>0.0), high (≤0.0). Prosigna: low (≤40), intermediate (41–60), high (>60). EndoPredict: low (<3.3), high (≥3.3)."

// Wahrscheinlichkeit Fernrezidiv (optional)
* prediction.probabilityDecimal MS
* prediction.probabilityDecimal ^short = "Fernrezidivrisiko in Prozent"
* prediction.probabilityDecimal ^comment = "10-Jahres-Fernrezidivrisiko als Dezimalwert (z.B. 0.12 für 12%)"

// Zeitrahmen der Prädiktion
* prediction.whenRange MS
* prediction.whenRange ^short = "Prognosezeitraum"
* prediction.whenRange ^comment = "Typisch 10 Jahre (z.B. low=0, high=10, unit=a)"

* prediction.outcome MS
* prediction.outcome ^short = "Vorhergesagtes Ergebnis"
* prediction.outcome.text = "Fernrezidiv" (exactly)
* prediction.outcome.text ^short = "Risiko eines Fernrezidivs"

* note ^short = "Anmerkungen zur Risikobewertung"
