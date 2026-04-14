Instance: Example-ResearchStudy-ADAPT-HER2
InstanceOf: ResearchStudy
Title: "Beispiel: ADAPT-HER2 Studie"
Description: "Fiktive klinische Studie ADAPT-HER2 für Mammakarzinom"
Usage: #example

* status = #active
* title = "ADAPT-HER2: Adjuvante dynamische Marker-adaptierte personalisierte Therapie bei HER2-positivem Mammakarzinom"
* condition = $SCT#254837009 "Malignant neoplasm of breast"


Instance: Example-Studienteilnahme
InstanceOf: Senologie_Studienteilnahme
Title: "Beispiel: Studienteilnahme ADAPT-HER2"
Description: "Beispiel einer Patientin, die in der ADAPT-HER2-Studie im Interventionsarm teilnimmt"
Usage: #example

// Teilnahmestatus: on-study-intervention
* status = #on-study-intervention

// Referenz auf die Studie
* study = Reference(ResearchStudy/Example-ResearchStudy-ADAPT-HER2)
* study.display = "ADAPT-HER2"

// Patientin
* individual = Reference(Patient/example-patient)
* individual.display = "Maria Musterfrau"

// Teilnahmezeitraum
* period.start = "2024-02-15"

// Studienarm
* assignedArm = "Interventionsarm: T-DM1 + endokrine Therapie"

// Einwilligung (nur Referenz mit display, keine eigene Consent-Ressource)
* consent.display = "Studieneinwilligung ADAPT-HER2 vom 2024-02-10"

// Screeningstatus: geeignet
* extension[Screeningstatus].valueCodeableConcept = $SCT#385645004 "Eligible (qualifier value)"

// Kontaktperson
* extension[Kontakt].valueString = "Dr. med. Anna Schmidt, Studienzentrale Senologie"

// Aufklärungsdatum
* extension[Aufklaerungsdatum].valueDate = "2024-02-10"
