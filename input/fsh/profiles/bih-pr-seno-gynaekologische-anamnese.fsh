Profile: Senologie_Gynaekologische_Anamnese
Parent: Observation
Id: senologie-gynaekologische-anamnese
Title: "BIH Senologie Gynäkologische Anamnese"
Description: "Observation für gynäkologische Anamnese (Menarche, Menopause, Schwangerschaften, HRT) aus dotbase Questionnaire 'Gynäkologische Anamnese'"

* insert PR_CS_VS_Version
* ^status = #draft

* status MS
* status = #final (exactly)

* code MS
* code = $LOINC#89221-6 "Gynecology History and physical note"
* code ^short = "Gynäkologische Anamnese"

* subject MS
* subject only Reference(Patient)

* effectiveDateTime MS
* effectiveDateTime ^short = "Datum der Anamneseerhebung"

* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open

* component contains
    menarche 0..1 MS and
    menopause 0..1 MS and
    schwangerschaften 0..1 MS and
    hormonersatztherapie 0..1 MS

* component[menarche].code = $LOINC#42798-9 "Age at menarche"
* component[menarche] ^short = "Alter bei Menarche"
* component[menarche] ^comment = "Aus dotbase: Menarche-Alter in Jahren"
* component[menarche].value[x] only Quantity
* component[menarche].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[menarche].valueQuantity.code = #a (exactly)

* component[menopause].code = $LOINC#42802-9 "Age at menopause"
* component[menopause] ^short = "Menopausenstatus / Alter bei Menopause"
* component[menopause] ^comment = "Aus dotbase: prä-/postmenopausal, Alter bei Menopause"
* component[menopause].value[x] only Quantity or CodeableConcept

* component[schwangerschaften].code = $LOINC#11996-6 "Number of pregnancies"
* component[schwangerschaften] ^short = "Anzahl Schwangerschaften"
* component[schwangerschaften] ^comment = "Aus dotbase: Gravida"
* component[schwangerschaften].value[x] only Quantity

* component[hormonersatztherapie].code = $SCT#266717002 "Hormone replacement therapy"
* component[hormonersatztherapie] ^short = "Hormonersatztherapie (HRT)"
* component[hormonersatztherapie] ^comment = "Aus dotbase: HRT ja/nein, Art der HRT"
* component[hormonersatztherapie].value[x] only CodeableConcept or boolean
