Instance: Example-Bildgebung-Skelettszintigraphie
InstanceOf: Senologie_Bildgebung_Sonstige
Usage: #example
Title: "Beispiel Skelettszintigraphie (Staging)"
Description: "Skelettszintigraphie im Rahmen des Stagings bei Mammakarzinom — kein Hinweis auf ossäre Metastasen."

* status = #final

* category.coding = http://terminology.hl7.org/CodeSystem/v2-0074#RAD "Radiology"

* code.coding[snomed] = http://snomed.info/sct#44491008 "Bone scan"
* code.coding[loinc] = http://loinc.org#39638-7 "Bone scan"

* subject = Reference(example-patient)

* effectiveDateTime = "2024-03-10"

* conclusion = "Kein Hinweis auf ossäre Metastasen. Regelrechte Skelettszintigraphie."
