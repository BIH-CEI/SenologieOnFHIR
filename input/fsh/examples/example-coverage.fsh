// --- Coverage: GKV (Gesetzliche Krankenversicherung) ---
Instance: Coverage-GKV-Beispiel
InstanceOf: Coverage
Title: "Beispiel: Coverage GKV"
Description: "Gesetzliche Krankenversicherung (A04)"
Usage: #example

* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#GKV "gesetzliche Krankenversicherung"
* beneficiary = Reference(example-patient)
* payor = Reference(Brustzentrum-Charite)
* period.start = "2024-01-01"

// --- Coverage: PKV (Private Krankenversicherung) ---
Instance: Coverage-PKV-Beispiel
InstanceOf: Coverage
Title: "Beispiel: Coverage PKV"
Description: "Private Krankenversicherung (A04)"
Usage: #example

* status = #active
* type = http://fhir.de/CodeSystem/versicherungsart-de-basis#PKV "private Krankenversicherung"
* beneficiary = Reference(example-patient)
* payor = Reference(Brustzentrum-Charite)
* period.start = "2024-01-01"
