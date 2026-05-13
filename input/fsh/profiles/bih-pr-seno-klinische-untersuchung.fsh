Profile: Senologie_Klinische_Untersuchung
Parent: Observation
Id: senologie-klinische-untersuchung
Title: "BIH Senologie Klinische Untersuchung"
Description: "Observation für klinische Brustuntersuchung (Mammabefund pro Seite)"

* insert PR_CS_VS_Version
* ^status = #draft

// Mapping zum Logischen Modell
* ^mapping[+].identity = "lm"
* ^mapping[=].uri = "https://www.senologie.org/fhir/StructureDefinition/LogicalModelSenologie"
* ^mapping[=].name = "BIH LM Senologie"
* ^mapping[=].comment = "Bezugselement im Logischen Modell: KlinischeUntersuchung"

* status MS
* status = #final (exactly)

* code MS
* code = $LOINC#32422-8 "Physical findings of Breast"
* code ^short = "Klinische Brustuntersuchung"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Untersuchung"
* effectiveDateTime ^mapping[+].identity = "lm"
* effectiveDateTime ^mapping[=].map = "KlinischeUntersuchung.Datum"

* bodySite MS
* bodySite ^short = "Untersuchte Seite (links/rechts)"
* bodySite.coding from VS_Senologie_Seite (required)
* bodySite ^mapping[+].identity = "lm"
* bodySite ^mapping[=].map = "KlinischeUntersuchung.Seite"

* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open

// Cardinality 0..* da pro Seite (rechts/links) eine separate Component möglich
// ist — bodyPosition-Extension auf component.code unterscheidet die Seiten.
* component contains
    palpationsbefund 0..* MS and
    hautveraenderungen 0..* MS and
    mamillenbefund 0..1 MS and
    lymphknotenstatus 0..* MS and
    inspektion 0..* MS and
    symmetrie 0..1 MS and
    ptosis 0..* MS and
    klinisches-ct 0..1 MS and
    klinisches-cn 0..1 MS and
    tumornachweis-status 0..1 MS

* component[inspektion].code = $SCT#225289005 "Examination of breast"
* component[inspektion] ^short = "Inspektionsbefund Brust (per Seite via observation-bodyPosition)"
* component[inspektion].value[x] only CodeableConcept or string

* component[symmetrie].code = $SCT#366348007 "Finding of symmetry of breasts"
* component[symmetrie] ^short = "Symmetrie der Brüste"
* component[symmetrie].value[x] only CodeableConcept

* component[ptosis].code = $SCT#15955021000119100 "Ptosis of breast"
* component[ptosis] ^short = "Ptosis-Grad (Regnault, pro Seite via observation-bodyPosition)"
* component[ptosis].value[x] only CodeableConcept

* component[klinisches-ct].code = $SCT#399504009 "cT category (observable entity)"
* component[klinisches-ct] ^short = "Klinisches cT (Einschätzung des Untersuchers)"
* component[klinisches-ct].value[x] only CodeableConcept

* component[klinisches-cn].code = $SCT#399534004 "cN category (observable entity)"
* component[klinisches-cn] ^short = "Klinisches cN (Einschätzung des Untersuchers)"
* component[klinisches-cn].value[x] only CodeableConcept

* component[tumornachweis-status].code = $SCT#363676003 "Status of disease (observable entity)"
* component[tumornachweis-status] ^short = "Tumornachweis / Response Assessment"
* component[tumornachweis-status].value[x] only CodeableConcept

* component[palpationsbefund].code = $SCT#118242002 "Finding by palpation"
* component[palpationsbefund] ^short = "Palpationsbefund"
* component[palpationsbefund] ^comment = "Tastbefund der Brust (Verhärtung, Knoten, etc.)"
* component[palpationsbefund].value[x] only CodeableConcept or string
* component[palpationsbefund] ^mapping[+].identity = "lm"
* component[palpationsbefund] ^mapping[=].map = "KlinischeUntersuchung.Palpationsbefund"

* component[hautveraenderungen].code = $SCT#115951000119105 "Breast symptom of change in skin"
* component[hautveraenderungen] ^short = "Hautveränderungen"
* component[hautveraenderungen] ^comment = "Hauteinziehung, Rötung, Orangenhaut etc."
* component[hautveraenderungen].value[x] only CodeableConcept or string
* component[hautveraenderungen] ^mapping[+].identity = "lm"
* component[hautveraenderungen] ^mapping[=].map = "KlinischeUntersuchung.Hautveraenderungen"

* component[mamillenbefund].code = $SCT#248819006 "Nipple finding"
* component[mamillenbefund] ^short = "Mamillenbefund"
* component[mamillenbefund] ^comment = "Mamillensekretion, Retraktion etc."
* component[mamillenbefund].value[x] only CodeableConcept or string
* component[mamillenbefund] ^mapping[+].identity = "lm"
* component[mamillenbefund] ^mapping[=].map = "KlinischeUntersuchung.Mamillenbefund"

* component[lymphknotenstatus].code = $SCT#301782006 "Finding of lymph node of axillary region"
* component[lymphknotenstatus] ^short = "Klinischer Lymphknotenstatus"
* component[lymphknotenstatus] ^comment = "Tastbare axilläre Lymphknoten"
* component[lymphknotenstatus].value[x] only CodeableConcept or string
* component[lymphknotenstatus] ^mapping[+].identity = "lm"
* component[lymphknotenstatus] ^mapping[=].map = "KlinischeUntersuchung.Lymphknotenstatus"
