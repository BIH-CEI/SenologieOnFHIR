Profile: Senologie_Klinische_Untersuchung
Parent: Observation
Id: senologie-klinische-untersuchung
Title: "BIH Senologie Klinische Untersuchung"
Description: "Observation für klinische Brustuntersuchung (Mammabefund pro Seite) aus dotbase Questionnaire 'Klinische Untersuchung'"

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)

* code MS
* code = $LOINC#32422-8 "Physical findings of Breast"
* code ^short = "Klinische Brustuntersuchung"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Untersuchung"

* bodySite MS
* bodySite ^short = "Untersuchte Seite (links/rechts)"
* bodySite.coding from VS_Senologie_Seite (required)

* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open

* component contains
    palpationsbefund 0..1 MS and
    hautveraenderungen 0..1 MS and
    mamillenbefund 0..1 MS and
    lymphknotenstatus 0..1 MS

* component[palpationsbefund].code = $SCT#118242002 "Finding by palpation"
* component[palpationsbefund] ^short = "Palpationsbefund"
* component[palpationsbefund] ^comment = "Aus dotbase: Tastbefund der Brust (Verhärtung, Knoten, etc.)"
* component[palpationsbefund].value[x] only CodeableConcept or string

* component[hautveraenderungen].code = $SCT#115951000119105 "Breast symptom of change in skin"
* component[hautveraenderungen] ^short = "Hautveränderungen"
* component[hautveraenderungen] ^comment = "Aus dotbase: Hauteinziehung, Rötung, Orangenhaut etc."
* component[hautveraenderungen].value[x] only CodeableConcept or string

* component[mamillenbefund].code = $SCT#248819006 "Nipple finding"
* component[mamillenbefund] ^short = "Mamillenbefund"
* component[mamillenbefund] ^comment = "Aus dotbase: Mamillensekretion, Retraktion etc."
* component[mamillenbefund].value[x] only CodeableConcept or string

* component[lymphknotenstatus].code = $SCT#301782006 "Finding of lymph node of axillary region"
* component[lymphknotenstatus] ^short = "Klinischer Lymphknotenstatus"
* component[lymphknotenstatus] ^comment = "Aus dotbase: Tastbare axilläre Lymphknoten"
* component[lymphknotenstatus].value[x] only CodeableConcept or string
