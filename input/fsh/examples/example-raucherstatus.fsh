Instance: Fall1-Raucherstatus
InstanceOf: Observation
Usage: #example
Title: "Fall 1 — Raucherstatus: Nie geraucht"
Description: "OncoBox 2.0 C03: Raucherstatus der Patientin (ISiK-kompatibel)"

* meta.profile = "https://gematik.de/fhir/isik/StructureDefinition/ISiKRaucherStatus"
* status = #final
* code.coding[+] = $SCT#77176002 "Smoker"
* code.coding[+] = $LOINC#72166-2 "Tobacco smoking status"
* subject = Reference(Fall1-Patient-Erika-Neumann)
* effectiveDateTime = "2024-01-15"
* valueCodeableConcept = $LOINC#LA18978-9 "Never smoker"
