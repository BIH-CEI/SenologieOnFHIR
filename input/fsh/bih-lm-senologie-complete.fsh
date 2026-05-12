Logical: BIH_LM_Senologie
Parent: Element
Id: LogicalModelSenologie
Title: "BIH LM Senologie LogicalModel"
Description: "Vollständiges LogicalModel der BIH-Spezifikation des Moduls Senologie. Bildet alle klinischen Datenpunkte des Kerndatensatzes Senologie ab."
* insert PR_CS_VS_Version
* ^status = #draft

// =============================================================================
// Diagnose
// =============================================================================
* Diagnose 0..* BackboneElement "Diagnose Mamma"
  * Falltyp 0..1 CodeableConcept "Falltyp" "Ersterkrankung, Rezidiv oder metastasierte Erkrankung"
  * Diagnosekode 1..1 CodeableConcept "Diagnose" "SNOMED CT, ICD-10-GM, ICD-11 (Dual-Coding)"
  * DiagnoseB3SubTyp 0..1 CodeableConcept "B3-Subtyp" "ADH, FEA, Papillom, LIN etc."
  * Seite 0..1 CodeableConcept "Seitenlokalisation" "Rechts, Links, Beidseits"
  * DatumErstdiagnose 0..1 date "Datum der Erstdiagnose" "assertedDate der Diagnosestellung"
  * Diagnosesicherung 0..1 CodeableConcept "Diagnosesicherung" "oBDS-konforme Diagnosesicherung"
  * Tumormanifestation 0..* CodeableConcept "Tumormanifestation" "Primärtumor, Rezidiv, LK-Metastase, Fernmetastase"
  * Metastasierungsstadium 0..1 CodeableConcept "Metastasierungsstadium" "cM0, cM1, pM1"
  * Grad 0..1 CodeableConcept "Grading" "Differenzierungsgrad G1–G4"

// =============================================================================
// Tumorlokalisation
// =============================================================================
* Tumorlokalisation 0..* BackboneElement "Tumorlokalisation"
  * Seite 1..1 CodeableConcept "Seite" "Links, Rechts, Beidseits"
  * Quadrant 0..1 CodeableConcept "Quadrant" "Quadrant der Brust"
  * Uhrzeitposition 0..1 CodeableConcept "Uhrzeitposition" "Uhrzeit-Lokalisation (12-Uhr-Schema)"
  * Mamillenabstand 0..1 string "Mamillenabstand" "Abstand zur Mamille in mm"

// =============================================================================
// Vorstellung
// =============================================================================
* Vorstellung 0..1 BackboneElement "Vorstellungsgrund"
  * Typ 0..1 CodeableConcept "Art der Vorstellung" "Erst- oder Verlaufsvorstellung"
  * Erstvorstellung 0..1 date "Datum der Erstvorstellung" "Datum der Erstvorstellung"

// =============================================================================
// Anamnese
// =============================================================================
* GynaekologischeAnamnese 0..1 BackboneElement "Gynäkologische Anamnese"
  * Menarche 0..1 Quantity "Alter bei Menarche" "Alter bei Menarche in Jahren"
  * Menopausenstatus 0..1 CodeableConcept "Menopausenstatus" "Prä-/peri-/postmenopausal"
  * Schwangerschaften 0..1 Quantity "Anzahl Schwangerschaften" "Gravida"
  * Hormonersatztherapie 0..1 CodeableConcept "Hormonersatztherapie" "HRT ja/nein"

* Familienanamnese 0..* BackboneElement "Familienanamnese"
  * Verwandtschaftsgrad 1..1 CodeableConcept "Verwandtschaftsgrad" "Mutter, Schwester, Tante, etc."
  * Mammakarzinom 0..1 BackboneElement "Mammakarzinom" "Mammakarzinom in der Familie"
    * Erkrankungsalter 0..1 Quantity "Erkrankungsalter" "Alter bei Erkrankung"
  * Ovarialkarzinom 0..1 BackboneElement "Ovarialkarzinom" "Ovarialkarzinom in der Familie"
    * Erkrankungsalter 0..1 Quantity "Erkrankungsalter" "Alter bei Erkrankung"

* ChecklisteErblicheBelastung 0..1 BackboneElement "Checkliste Erbliche Belastung"
  * Durchgefuehrt 0..1 boolean "Durchgeführt" "Checkliste durchgeführt ja/nein"
  * Score 0..1 integer "Score" "Punktwert der Checkliste"

// =============================================================================
// Klinische Untersuchung
// =============================================================================
* KlinischeUntersuchung 0..* BackboneElement "Klinische Untersuchung"
  * Datum 0..1 dateTime "Untersuchungsdatum" "Datum der klinischen Untersuchung"
  * Seite 0..1 CodeableConcept "Seite" "Links/Rechts"
  * Palpationsbefund 0..1 CodeableConcept "Palpationsbefund" "Befund bei Tastuntersuchung"
  * Hautveraenderungen 0..1 CodeableConcept "Hautveränderungen" "Einziehung, Rötung, Peau d'orange"
  * Mamillenbefund 0..1 CodeableConcept "Mamillenbefund" "Sekretion, Einziehung"
  * Lymphknotenstatus 0..1 CodeableConcept "Lymphknotenstatus" "Klinischer Lymphknotenbefund"
  * KlinischeTumorformel 0..1 BackboneElement "Klinische Tumorformel (cTNM)" "Klinische TNM-Klassifikation aus körperlicher Untersuchung und Bildgebung"
    * cT 0..1 CodeableConcept "cT" "Klinische T-Kategorie (x, 0, is, 1a/b/c, 2, 3, 4a/b/c/d)"
    * cN 0..1 CodeableConcept "cN" "Klinische N-Kategorie (x, 0, 1, 2a/b, 3a/b/c)"
    * cM 0..1 CodeableConcept "cM" "Klinische M-Kategorie (0, 1)"
    * cUICC 0..1 CodeableConcept "cUICC-Stadium" "Klinisches UICC-Stadium"
    * y 0..1 boolean "y-Präfix" "Befund nach neoadjuvanter Therapie"
    * r 0..1 boolean "r-Präfix" "Rezidiv-Befund"

// =============================================================================
// Bildgebung
// =============================================================================
* BildgebungMamma 0..* BackboneElement "Bildgebung Mamma"
  * Datum 0..1 dateTime "Untersuchungsdatum" "Datum der Bildgebung"
  * Art 1..1 CodeableConcept "Art der Bildgebung" "Mammografie, Sonografie, MRT, Tomosynthese"
  * Standort 0..1 string "Untersuchungsstandort" "Standort der Untersuchung"
  * BIRADS 0..1 CodeableConcept "BI-RADS" "BI-RADS Kategorie 0–6"
  * ACRDichte 0..1 CodeableConcept "ACR-Dichte" "ACR-Dichtegrad a–d"
  * Herdbefund 0..1 CodeableConcept "Herdbefund" "Beschreibung des Herdbefunds"
  * Mikrokalk 0..1 CodeableConcept "Mikrokalk" "Mikrokalkbefund"
  * LymphknotenBildgebung 0..1 CodeableConcept "Lymphknotenstatus" "Bildgebender Lymphknotenbefund"
  * Befundtext 0..1 string "Befundtext" "Gesamtzusammenfassung"

* BildgebungSonstige 0..* BackboneElement "Bildgebung Sonstige"
  * Datum 0..1 dateTime "Untersuchungsdatum" "Datum der Bildgebung"
  * Art 1..1 CodeableConcept "Art der Bildgebung" "CT, PET-CT, Szintigrafie etc."
  * Befundtext 0..1 string "Befundtext" "Befundzusammenfassung"
  * KodierteBefundaussage 0..* CodeableConcept "Kodierte Befundaussage" "Strukturierte Befundkodierung"

// =============================================================================
// Pathologie
// =============================================================================
* Pathologie 0..* BackboneElement "Pathologie"
  // -- Befund-Metadaten --
  * Datum 0..1 dateTime "Befunddatum" "Datum der Befunderstellung"
  * DatumProbeneingang 0..1 dateTime "Probeneingang" "Datum Probeneingang im Labor"
  * DatumEntnahme 0..1 dateTime "Entnahmedatum" "Datum der Präparateentnahme"
  * ZeitpunktEntnahme 0..1 string "Zeitpunkt Präparatentnahme" "Uhrzeit der Entnahme"
  * DatumMitteilungPatient 0..1 dateTime "Datum Mitteilung Patient*in" "Datum Befundmitteilung"
  * PathologischesInstitut 0..1 string "Pathologisches Institut" "Befundendes Institut"
  * EinrichtungEntnahme 0..1 string "Einrichtung Präparateentnahme" "Einrichtung der Probenentnahme"
  * StrukturierterBefund 0..1 boolean "Strukturierter Befund" "Strukturierter Befund angelegt"
  * Praeparat 0..1 BackboneElement "Präparat" "Pathologisches Präparat"
    * Art 1..1 CodeableConcept "Art des Präparats" "Biopsie, Resektat, etc."
    * Entnahmemethode 0..1 CodeableConcept "Entnahmemethode" "Methode der Gewebeentnahme"
    * Lokalisation 0..1 CodeableConcept "Entnahmelokalisation" "Körperstelle der Entnahme"
    * Seite 0..1 CodeableConcept "Seite" "Lateralität des Präparats"
    * Uhrzeit 0..1 string "Uhrzeit-Position" "Lokalisation als Uhrzeit"
    * Mamillenabstand 0..1 Quantity "Mamillenabstand" "Abstand zur Mamille in mm"

  // -- Histologie allgemein --
  * Histologie 0..1 CodeableConcept "Histologischer Typ" "ICD-O-3 Morphologie"

  // -- Invasives Karzinom (BC) --
  * BefundInvasiv 0..1 BackboneElement "Befund invasives Karzinom" "Pathologische Befundung invasives Mammakarzinom"
    * Subtyp 0..1 CodeableConcept "Subtyp" "Histologischer Subtyp (NST, lobulär, etc.)"
    * MaxTumordurchmesser 0..1 Quantity "Max. Tumordurchmesser" "Maximaler invasiver Tumordurchmesser in mm"
    * Multifokalitaet 0..1 boolean "Multifokal (m)" "Multifokales/multizentrisches Karzinom"
    * Grading 0..1 CodeableConcept "Grading" "G1–G4"
    * NukleaeresGrading 0..1 CodeableConcept "Nukleäres Grading" "Nukleäres Grading"
    * pT 0..1 CodeableConcept "pT (BC)" "Pathologische T-Kategorie"
    * cN 0..1 CodeableConcept "cN (BC)" "Klinische N-Kategorie (im Patho-Befund dokumentiert)"
    * pN 0..1 CodeableConcept "pN (BC)" "Pathologische N-Kategorie"
    * CpSwitch 0..1 CodeableConcept "c/p-Switch" "Befund klinisch (c) oder pathologisch (p) klassifiziert"
    * y 0..1 boolean "y-Präfix" "Nach neoadjuvanter Therapie"
    * r 0..1 boolean "r-Präfix" "Rezidiv-Befund"
    * L 0..1 CodeableConcept "L-Status" "Lymphgefäßinvasion (L0/L1/LX)"
    * V 0..1 CodeableConcept "V-Status" "Veneninvasion (V0/V1/V2/VX)"
    * Pn 0..1 CodeableConcept "Pn-Status" "Perineuralscheideninvasion (Pn0/Pn1/PnX)"
    * R 0..1 CodeableConcept "R-Status (BC)" "Residualstatus invasiv"
    * Resektionsraender 0..1 BackboneElement "Resektionsränder" "Abstände zu Resektionsrändern in mm"
      * Anterior 0..1 Quantity "anterior" "Abstand anterior"
      * Posterior 0..1 Quantity "posterior" "Abstand posterior"
      * Superior 0..1 Quantity "superior" "Abstand superior"
      * Inferior 0..1 Quantity "inferior" "Abstand inferior"
      * Medial 0..1 Quantity "medial" "Abstand medial"
      * Lateral 0..1 Quantity "lateral" "Abstand lateral"
    * Biomarker 0..1 BackboneElement "Biomarker invasiv" "Tumor-Biomarker BC"
      // ER-Status: granulare Erfassung statt nur positiv/negativ
      * ER 0..1 BackboneElement "ER-Status (Östrogenrezeptor)" "Erlaubt ER-low-Klassifikation; IRS und Allred sind alternative Scoring-Systeme"
        * Gesamtstatus 0..1 CodeableConcept "Gesamtstatus" "positiv | gering-positiv (= ER-low) | negativ | unbekannt (MII-Onko Leitlinien-VS; oBDS-Slice nur positiv/negativ/unbekannt)"
        * ProzentPositiveZellen 0..1 Quantity "% positive Zellen" "Anteil ER-positiver Tumorzellen in Prozent (UCUM %)"
        * Faerbeintensitaet 0..1 CodeableConcept "Färbeintensität" "Intensität 0 | 1+ | 2+ | 3+"
        * IRSScore 0..1 Quantity "IRS (Remmele-Stegner)" "Immunreaktiver Score 0–12 (DE-Standard)"
        * AllredScore 0..1 Quantity "Allred Score" "Allred Score 0–8 (international)"
      // PR-Status: analog
      * PR 0..1 BackboneElement "PR-Status (Progesteronrezeptor)" "Analog ER; IRS und Allred sind alternative Scoring-Systeme"
        * Gesamtstatus 0..1 CodeableConcept "Gesamtstatus" "positiv | gering-positiv (= PR-low) | negativ | unbekannt (MII-Onko Leitlinien-VS)"
        * ProzentPositiveZellen 0..1 Quantity "% positive Zellen" "Anteil PR-positiver Tumorzellen in Prozent"
        * Faerbeintensitaet 0..1 CodeableConcept "Färbeintensität" "0 | 1+ | 2+ | 3+"
        * IRSScore 0..1 Quantity "IRS (Remmele-Stegner)" "Immunreaktiver Score 0–12"
        * AllredScore 0..1 Quantity "Allred Score" "Allred Score 0–8"
      // HER2-Status: IHC + ISH klar getrennt, HER2-low als eigener Gesamtstatus
      * HER2 0..1 BackboneElement "HER2-Status" "IHC + ISH-Reflextestung; ermöglicht HER2-low-Klassifikation"
        * IHCScore 0..1 CodeableConcept "HER2 IHC-Score" "0 | 1+ | 2+ | 3+"
        * ISHDurchgefuehrt 0..1 boolean "ISH durchgeführt" "wurde ISH-Reflextestung durchgeführt (typ. bei IHC 2+)"
        * ISHMethode 0..1 CodeableConcept "ISH-Methode" "FISH | CISH | DISH | SISH"
        * ISHStatus 0..1 CodeableConcept "ISH-Ergebnis" "amplifiziert | nicht amplifiziert | equivocal"
        * HER2CEN17Ratio 0..1 Quantity "HER2/CEN17-Ratio" "Ratio bei FISH (dimensionslos)"
        * HER2Kopienzahl 0..1 Quantity "HER2-Kopienzahl/Zelle" "Mittlere Kopienzahl pro Zelle"
        * Gesamtstatus 0..1 CodeableConcept "HER2-Gesamtstatus" "positiv | HER2-low | HER2-ultralow | negativ | equivocal (MII-Onko Leitlinien-VS)"
      * Ki67 0..1 Quantity "Ki-67" "Ki-67 Proliferationsindex in Prozent"
      * PDL1CPS 0..1 Quantity "PD-L1 CPS" "Combined Positive Score"
      * PDL1TPS 0..1 Quantity "PD-L1 TPS" "Tumor Proportion Score"
      * PDL1IC 0..1 Quantity "PD-L1 IC" "Immune Cell Score"

  // -- DCIS --
  * BefundDCIS 0..1 BackboneElement "Befund DCIS" "Pathologische Befundung Ductales Carcinoma in situ"
    * Art 0..1 CodeableConcept "DCIS Art" "Art des DCIS"
    * MaxAusdehnung 0..1 Quantity "Maximale Ausdehnung" "Größte Ausdehnung des DCIS in mm"
    * Grading 0..1 CodeableConcept "DCIS Grading" "G1–G3"
    * pT 0..1 CodeableConcept "T (DCIS)" "T-Kategorie für DCIS (typ. pTis)"
    * cN 0..1 CodeableConcept "cN (DCIS)" "Klinische N-Kategorie"
    * pN 0..1 CodeableConcept "pN (DCIS)" "Pathologische N-Kategorie"
    * y 0..1 boolean "y-Präfix" "Nach neoadjuvanter Therapie"
    * r 0..1 boolean "r-Präfix" "Rezidiv-Befund"
    * R 0..1 CodeableConcept "R-Status (DCIS)" "Residualstatus DCIS"
    * Resektionsraender 0..1 BackboneElement "Resektionsränder DCIS" "Abstände zu Resektionsrändern in mm"
      * Anterior 0..1 Quantity "anterior" "Abstand anterior"
      * Posterior 0..1 Quantity "posterior" "Abstand posterior"
      * Superior 0..1 Quantity "superior" "Abstand superior"
      * Inferior 0..1 Quantity "inferior" "Abstand inferior"
      * Medial 0..1 Quantity "medial" "Abstand medial"
      * Lateral 0..1 Quantity "lateral" "Abstand lateral"
    * Biomarker 0..1 BackboneElement "Biomarker DCIS" "Tumor-Biomarker DCIS"
      // ER-Status DCIS: gleiche Granularität wie invasiv
      * ER 0..1 BackboneElement "ER-Status DCIS" "Östrogenrezeptor am DCIS"
        * Gesamtstatus 0..1 CodeableConcept "Gesamtstatus" "positiv | gering-positiv (= ER-low) | negativ | unbekannt (MII-Onko Leitlinien-VS; oBDS-Slice nur positiv/negativ/unbekannt)"
        * ProzentPositiveZellen 0..1 Quantity "% positive Zellen" "Anteil ER-positiver DCIS-Zellen in Prozent"
        * Faerbeintensitaet 0..1 CodeableConcept "Färbeintensität" "0 | 1+ | 2+ | 3+"
        * IRSScore 0..1 Quantity "IRS (Remmele-Stegner)" "Immunreaktiver Score 0–12"
        * AllredScore 0..1 Quantity "Allred Score" "Allred Score 0–8"
      * PR 0..1 BackboneElement "PR-Status DCIS" "Progesteronrezeptor am DCIS"
        * Gesamtstatus 0..1 CodeableConcept "Gesamtstatus" "positiv | gering-positiv (= PR-low) | negativ | unbekannt (MII-Onko Leitlinien-VS)"
        * ProzentPositiveZellen 0..1 Quantity "% positive Zellen" "Anteil PR-positiver DCIS-Zellen in Prozent"
        * Faerbeintensitaet 0..1 CodeableConcept "Färbeintensität" "0 | 1+ | 2+ | 3+"
        * IRSScore 0..1 Quantity "IRS (Remmele-Stegner)" "Immunreaktiver Score 0–12"
        * AllredScore 0..1 Quantity "Allred Score" "Allred Score 0–8"
      * HER2 0..1 BackboneElement "HER2-Status DCIS" "HER2 am DCIS"
        * IHCScore 0..1 CodeableConcept "HER2 IHC-Score" "0 | 1+ | 2+ | 3+"
        * ISHDurchgefuehrt 0..1 boolean "ISH durchgeführt"
        * ISHMethode 0..1 CodeableConcept "ISH-Methode" "FISH | CISH | DISH | SISH"
        * ISHStatus 0..1 CodeableConcept "ISH-Ergebnis" "amplifiziert | nicht amplifiziert | equivocal"
        * HER2CEN17Ratio 0..1 Quantity "HER2/CEN17-Ratio" "Ratio bei FISH"
        * Gesamtstatus 0..1 CodeableConcept "HER2-Gesamtstatus" "positiv | HER2-low | HER2-ultralow | negativ | equivocal (MII-Onko Leitlinien-VS)"
      * Ki67 0..1 Quantity "Ki-67 DCIS" "Ki-67 Proliferationsindex in Prozent"

  // -- Globale M-Klassifikation (für BC und DCIS) --
  * M 0..1 CodeableConcept "M-Kategorie" "Pathologische M-Klassifikation (gilt für BC und DCIS)"
  * DetailM 0..1 string "Detail M" "Details zur M-Klassifikation"
  * UICC 0..1 CodeableConcept "UICC-Stadium" "Pathologisches UICC-Gesamtstadium"

  // -- Lymphknoten gesamt --
  * LymphknotenUntersucht 0..1 integer "Lymphknoten untersucht" "Anzahl untersuchter LK"
  * LymphknotenBefallen 0..1 integer "Lymphknoten befallen" "Anzahl befallener LK"
  * SentinelUntersucht 0..1 integer "Sentinel-LK untersucht" "Anzahl untersuchter Sentinel-LK"
  * SentinelBefallen 0..1 integer "Sentinel-LK befallen" "Anzahl befallener Sentinel-LK"
  * LKRatioText 0..1 string "LK-Ratio (+LK/LK insg)" "Verhältnis befallene/untersuchte LK"

  // -- Scores --
  * CPSEGScore 0..1 Quantity "CPS-EG-Score" "CPS-EG Score (MD Anderson)"
  * AbsoluterChemoNutzen 0..1 Quantity "Absoluter Chemotherapie-Nutzen" "Prognostischer Nutzen einer Chemotherapie"

  * Befundtext 0..1 string "Befundtext" "Gesamtbeurteilung des Pathologen"
  * Sonstiges 0..1 string "Sonstiges" "Sonstige Befundaspekte"

// =============================================================================
// Genetik
// =============================================================================
* Genetik 0..1 BackboneElement "Genetische Diagnostik"
  * SomatischeMutation 0..* BackboneElement "Somatische Mutation" "Tumorgewebemutation"
    * Gen 1..1 CodeableConcept "Gen" "BRCA1, BRCA2, PALB2 etc."
    * Ergebnis 0..1 CodeableConcept "Ergebnis" "Mutation/Wildtyp/nicht bestimmbar"
  * Genexpressionstest 0..* BackboneElement "Genexpressionstest" "Oncotype DX, MammaPrint, Prosigna, EndoPredict"
    * Testmethode 1..1 CodeableConcept "Testmethode" "Art des Genexpressionstests"
    * Score 0..1 Quantity "Score" "Numerischer Score-Wert"
    * Risikoklasse 0..1 CodeableConcept "Risikoklasse" "Niedrig/mittel/hoch"
    * Fernrezidivrisiko 0..1 decimal "Fernrezidivrisiko" "Rezidivrisiko in Prozent"

// =============================================================================
// Operationsplanung
// =============================================================================
* Operationsplanung 0..1 BackboneElement "Operationsplanung"
  * GeplanteOP 0..1 CodeableConcept "Geplante OP" "Art der geplanten Operation"
  * Seite 0..1 CodeableConcept "Seite" "Geplante Lateralität"
  * Operateur 0..1 string "Geplanter Operateur" "Geplanter Operateur"
  * OPDauer 0..1 Quantity "Geplante OP-Dauer" "Dauer in Minuten"
  * PraeoperativeMarkierung 0..1 CodeableConcept "Präoperative Markierung" "Magnetclip, Draht, Tusche etc."
  * PraeoperativeBlutabnahme 0..1 boolean "Präoperative Blutabnahme" "Geplant ja/nein"
  * PraeoperativeAntibiotikatherapie 0..1 boolean "Präoperative Antibiotikatherapie" "Geplant ja/nein"
  * OPLagerung 0..1 CodeableConcept "OP-Lagerung" "Tischanordnung"

// =============================================================================
// Operation
// =============================================================================
* Operation 0..* BackboneElement "Operation"
  * Art 1..1 CodeableConcept "Art der Operation" "OPS- und SNOMED-codiert"
  * Datum 0..1 dateTime "Operationsdatum" "Datum der Operation"
  * Seite 0..1 CodeableConcept "Seite" "Lateralität"
  * Intention 0..1 CodeableConcept "Intention" "Diagnostisch/therapeutisch"
  * Erstoperateur 0..1 Reference "Erstoperateur" "Erstoperateur"
  * Zweitoperateur 0..1 Reference "Zweitoperateur" "Zweitoperateur"
  * PraeoperativeMarkierung 0..* CodeableConcept "Präoperative Markierung" "Art der Markierung"
  * IntraoperativesImaging 0..* CodeableConcept "Intraoperatives Imaging" "Präparateradiografie etc."
  * Outcome 0..1 CodeableConcept "Outcome" "Ergebnis der Operation"
  * PostoperativeAnordnungen 0..1 BackboneElement "Postoperative Anordnungen" "Follow-up-Maßnahmen"
    * Drainage 0..1 CodeableConcept "Drainage" "Art der Drainage"
    * Verband 0..1 CodeableConcept "Verband" "Art des Verbandes"
    * Antibiotika 0..1 CodeableConcept "Antibiotika" "Postoperative Antibiotika"
    * Mobilisation 0..1 CodeableConcept "Mobilisation" "Mobilisationsplan"
    * Laborkontrolle 0..1 CodeableConcept "Laborkontrolle" "Geplante Laborkontrollen"
  * Komplikation 0..* BackboneElement "Operative Komplikation" "Clavien-Dindo-klassifiziert"
    * ClavienDindo 0..1 CodeableConcept "Clavien-Dindo Grad" "Grad I–V"
    * Art 0..1 CodeableConcept "Art der Komplikation" "SNOMED-kodierte Komplikationsart"
    * Zeitpunkt 0..1 CodeableConcept "Zeitpunkt" "Intraoperativ/postoperativ/stationär/ambulant"
    * Konsequenz 0..1 string "Konsequenz" "Folgen der Komplikation"
  * Implantat 0..* BackboneElement "Implantat" "Brustimplantat"
    * Art 0..1 CodeableConcept "Art" "Art des Implantats"
    * Hersteller 0..1 string "Hersteller" "Hersteller des Implantats"
    * REFNummer 0..1 string "REF-Nummer" "Referenznummer"
    * Seriennummer 0..1 string "Seriennummer" "Seriennummer"

// =============================================================================
// Systemische Therapie
// =============================================================================
* SystemischeTherapie 0..* BackboneElement "Systemische Therapie"
  * Intention 0..1 CodeableConcept "Intention" "Neoadjuvant, adjuvant, palliativ"
  * Therapielinie 0..1 integer "Therapielinie" "1., 2., 3. Linie"
  * FirstLineMetastasiert 0..1 boolean "First-Line bei Metastasierung" "Erste Linie bei metastasierter Erkrankung"
  * Startdatum 0..1 dateTime "Startdatum" "Beginn der Therapie"
  * Enddatum 0..1 dateTime "Enddatum" "Ende der Therapie"
  * Protokoll 0..1 CodeableConcept "Therapieprotokoll" "Protokollname"
  * Outcome 0..1 CodeableConcept "Outcome" "Abgeschlossen/abgebrochen"
  * Medikation 0..* BackboneElement "Medikation" "Einzelne Substanz/Gabe"
    * Substanz 1..1 CodeableConcept "Substanz" "SNOMED-codierte Substanz"
    * Zyklus 0..1 integer "Zyklus" "Therapiezyklus-Nummer"
    * TagImZyklus 0..1 integer "Tag im Zyklus" "Tag innerhalb des Zyklus"
    * Dosis 0..1 Quantity "Dosis" "Verabreichte Dosis"
    * Datum 0..1 dateTime "Datum der Gabe" "Zeitpunkt der Medikamentengabe"

* GeplanteSystemtherapie 0..* BackboneElement "Geplante Systemtherapie"
  * Substanz 1..1 CodeableConcept "Substanz" "Geplantes Medikament"
  * Intention 0..1 CodeableConcept "Intention" "Neoadjuvant/adjuvant/palliativ"
  * Therapielinie 0..1 integer "Therapielinie" "Geplante Therapielinie"
  * Protokoll 0..1 CodeableConcept "Therapieprotokoll" "Geplantes Protokoll"
  * GeplanteDosisDatum 0..1 Quantity "Geplante Dosis" "Geplante Dosierung"

// =============================================================================
// Strahlentherapie
// =============================================================================
* Strahlentherapie 0..* BackboneElement "Strahlentherapie"
  * Intention 0..1 CodeableConcept "Intention" "Adjuvant, neoadjuvant, palliativ"
  * Startdatum 0..1 dateTime "Startdatum" "Beginn der Bestrahlung"
  * Enddatum 0..1 dateTime "Enddatum" "Ende der Bestrahlung"
  * Bestrahlungsregion 0..1 CodeableConcept "Bestrahlungsregion" "Zielgebiet der Bestrahlung"
  * Gesamtdosis 0..1 Quantity "Gesamtdosis" "Gesamtdosis in Gy"
  * Einzeldosis 0..1 Quantity "Einzeldosis" "Dosis pro Fraktion in Gy"
  * AnzahlFraktionen 0..1 integer "Anzahl Fraktionen" "Anzahl der Bestrahlungssitzungen"
  * SimultaneRadiochemotherapie 0..1 boolean "Simultane Radiochemotherapie" "Gleichzeitige Chemotherapie ja/nein"

// =============================================================================
// Nebenwirkungen
// =============================================================================
* Nebenwirkung 0..* BackboneElement "Nebenwirkung"
  * Ereignis 1..1 CodeableConcept "Ereignis" "MedDRA-kodiertes Ereignis"
  * CTCAEGrad 0..1 CodeableConcept "CTCAE-Grad" "Schweregrad 1–5"
  * Datum 0..1 dateTime "Datum" "Zeitpunkt des Ereignisses"
  * VerursachendeTherapie 0..1 Reference "Verursachende Therapie" "Bezug zur Systemtherapie"

// =============================================================================
// Begleitmedikation
// =============================================================================
* Begleitmedikation 0..* BackboneElement "Begleitmedikation"
  * Medikament 1..1 CodeableConcept "Medikament" "SNOMED-kodiertes Medikament"
  * Einnahmezeitraum 0..1 Period "Einnahmezeitraum" "Start- und Enddatum"
  * Dosierschema 0..1 string "Dosierschema" "Freitext-Dosierung"
  * Dosis 0..1 Quantity "Dosis" "Dosierung"

// =============================================================================
// Tumorkonferenz
// =============================================================================
* Tumorkonferenz 0..* BackboneElement "Tumorkonferenz"
  * Datum 1..1 date "Datum" "Datum der Tumorkonferenz"
  * Fachdisziplinen 0..* CodeableConcept "Fachdisziplinen" "Teilnehmende Fachdisziplinen"
  * Empfehlung 0..* BackboneElement "Empfehlung" "Empfehlung der Tumorkonferenz"
    * EmpfehlungText 0..1 string "Empfehlungstext" "Freitext-Empfehlung"
    * OperativeTherapie 0..1 CodeableConcept "Operative Therapie" "Empfohlene OP"
    * Chemotherapie 0..1 CodeableConcept "Chemotherapie" "Empfohlene Chemotherapie"
    * Strahlentherapie 0..1 CodeableConcept "Strahlentherapie" "Empfohlene Bestrahlung"
    * EndokrineTherapie 0..1 CodeableConcept "Endokrine Therapie" "Empfohlene Hormontherapie"
    * ZielgerichteteTherapie 0..1 CodeableConcept "Zielgerichtete Therapie" "Empfohlene Targeted Therapy"
    * Immuntherapie 0..1 CodeableConcept "Immuntherapie" "Empfohlene Immuntherapie"
    * AntiresorptiveTherapie 0..1 CodeableConcept "Antiresorptive Therapie" "Empfohlene Knochentherapie"
    * WeitereDiagnostik 0..1 CodeableConcept "Weitere Diagnostik" "Empfohlene Diagnostik"
    * Studienempfehlung 0..1 CodeableConcept "Studienempfehlung" "Empfohlene Studienteilnahme"
    * Genetik 0..1 CodeableConcept "Genetische Beratung" "Empfohlene genetische Abklärung"
    * Nachsorge 0..1 CodeableConcept "Nachsorge" "Empfohlene Nachsorge"
    * Wiedervorstellung 0..1 date "Wiedervorstellung" "Datum der Wiedervorstellung"

// =============================================================================
// Studienteilnahme
// =============================================================================
* Studienteilnahme 0..* BackboneElement "Studienteilnahme"
  * Studienname 1..1 string "Studienname" "Name der klinischen Studie"
  * StudiennameCode 0..1 CodeableConcept "Studienname (kodiert)" "Kodierter Studienname"
  * Teilnahmestatus 0..1 CodeableConcept "Teilnahmestatus" "Kandidat/Screening/On-Study/Withdrawn etc."
  * Studienscreening 0..1 boolean "Screening durchgeführt" "Screening zur Studienteilnahme ja/nein"
  * Screeningstatus 0..1 CodeableConcept "Screeningstatus" "Ergebnis des Screenings"
  * Studienarm 0..1 string "Studienarm" "Zugewiesener Studienarm"
  * Aufklaerungsdatum 0..1 date "Aufklärungsdatum" "Datum der Aufklärung"
  * Teilnahmezeitraum 0..1 Period "Teilnahmezeitraum" "Beginn und Ende der Teilnahme"
  * Kontakt 0..1 string "Kontaktperson" "Kontaktperson für die Studie"

// =============================================================================
// Psychoonkologie & Sozialdienst
// =============================================================================
* Psychoonkologie 0..1 BackboneElement "Psychoonkologische Mitbetreuung"
  * Stattgefunden 0..1 boolean "Stattgefunden" "Kontakt erfolgt ja/nein"
  * Datum 0..1 dateTime "Datum" "Datum des ersten Kontakts"

* Sozialdienst 0..1 BackboneElement "Sozialdienst-Kontakt"
  * Stattgefunden 0..1 boolean "Stattgefunden" "Kontakt erfolgt ja/nein"
  * Datum 0..1 dateTime "Datum" "Datum des Kontakts"

// =============================================================================
// Verlauf / Follow-Up
// =============================================================================
* Verlauf 0..* BackboneElement "Verlauf / Follow-Up"
  * Meldedatum 1..1 date "Meldedatum" "Datum der Verlaufsmeldung (M01)"
  * Melder 0..1 Reference "Melder" "Meldende Einrichtung oder Person (M02)"
  * NachsorgeArt 0..1 CodeableConcept "Art der Nachsorge" "Aktiv oder passiv (M03)"
  * Vitalstatus 0..1 CodeableConcept "Vitalstatus" "Lebend, verstorben, unbekannt (M04)"
  * Gesamtbeurteilung 0..1 CodeableConcept "Gesamtbeurteilung" "CR, PR, SD, PD etc."
  * TumorstatusLokal 0..1 CodeableConcept "Tumorstatus lokal" "Lokaler Tumorstatus (M05)"
  * TumorstatusLK 0..1 CodeableConcept "Tumorstatus Lymphknoten" "Lymphknoten-Tumorstatus (M06)"
  * TumorstatusFM 0..1 CodeableConcept "Tumorstatus Fernmetastasen" "Fernmetastasen-Tumorstatus (M07)"
  * Zweittumor 0..1 CodeableConcept "Zweittumor" "Zweittumor ja/nein/unbekannt (M08)"
  * ZweitttumorICD 0..1 CodeableConcept "Zweittumor ICD-10-GM" "ICD-10-GM des Zweittumors (M09)"
  * ZweitttumorDatum 0..1 date "Zweittumor Diagnosedatum" "Diagnosedatum des Zweittumors (M10)"

// =============================================================================
// Mappings
// =============================================================================

Mapping: oBDS
Source: BIH_LM_Senologie
Target: "https://basisdatensatz.de/oBDS/2021"
Id: oBDS
Title: "Onkologischer Basisdatensatz (oBDS 2021)"

// Diagnose
* Diagnose -> "5 Diagnose"
* Diagnose.Diagnosekode -> "5.1 Tumordiagnose ICD-10-GM"
* Diagnose.Seite -> "5.8 Seitenlokalisation"
* Diagnose.DatumErstdiagnose -> "5.6 Diagnosedatum"
* Diagnose.Diagnosesicherung -> "5.7 Diagnosesicherung"
* Diagnose.Tumormanifestation -> "5.9 Frühere Tumorerkrankungen"
* Diagnose.Grad -> "6.1 Grading"
// Tumorlokalisation
* Tumorlokalisation.Seite -> "5.8 Seitenlokalisation"
* Tumorlokalisation.Quadrant -> "5.4 Topographie ICD-O (abgeleitet)"
// Pathologie
* Pathologie.Histologie -> "6.3 Morphologie-Code (ICD-O-3)"
* Pathologie.BefundInvasiv.Grading -> "6.1 Grading"
* Pathologie.BefundInvasiv.MaxTumordurchmesser -> "6.2 Tumorgröße"
* Pathologie.BefundInvasiv.R -> "8.1 Lokale Beurteilung Residualstatus / 8.2 Gesamtbeurteilung Residualstatus"
* Pathologie.LymphknotenUntersucht -> "6.6 Zahl untersuchter Lymphknoten"
* Pathologie.LymphknotenBefallen -> "6.7 Zahl befallener Lymphknoten"
* Pathologie.SentinelUntersucht -> "6.8 Zahl untersuchter Sentinel-Lymphknoten"
* Pathologie.SentinelBefallen -> "6.9 Zahl befallener Sentinel-Lymphknoten"
* Pathologie.BefundInvasiv.pT -> "7.1 TNM pT"
* Pathologie.BefundInvasiv.pN -> "7.2 TNM pN"
* Pathologie.M -> "7.3 TNM pM"
* Pathologie.UICC -> "7.6 TNM UICC-Stadium"
* Pathologie.BefundInvasiv.L -> "7.4 TNM L"
* Pathologie.BefundInvasiv.V -> "7.5 TNM V"
* Pathologie.BefundInvasiv.Pn -> "7.7 TNM Pn"
* Pathologie.BefundInvasiv.y -> "7.8 y-Symbol"
* Pathologie.BefundInvasiv.r -> "7.9 r-Symbol"
* Pathologie.BefundInvasiv.Multifokalitaet -> "7.10 m-Symbol"
// Klinische Tumorformel
* KlinischeUntersuchung.KlinischeTumorformel.cT -> "7.1 TNM cT"
* KlinischeUntersuchung.KlinischeTumorformel.cN -> "7.2 TNM cN"
* KlinischeUntersuchung.KlinischeTumorformel.cM -> "7.3 TNM cM"
* KlinischeUntersuchung.KlinischeTumorformel.cUICC -> "7.6 TNM UICC-Stadium (klinisch)"
// Operation
* Operation -> "8 OP"
* Operation.Art -> "8.3 OPS-Schlüssel"
* Operation.Datum -> "8.4 OP-Datum"
* Operation.Intention -> "8.5 Intention OP"
* Operation.Komplikation -> "8.6 Komplikation(en)"
// Systemische Therapie
* SystemischeTherapie -> "9 Systemische Therapie"
* SystemischeTherapie.Intention -> "9.1 Intention"
* SystemischeTherapie.Startdatum -> "9.3 Beginn"
* SystemischeTherapie.Enddatum -> "9.4 Ende"
* SystemischeTherapie.Protokoll -> "9.2 Therapieschema"
* SystemischeTherapie.Medikation.Substanz -> "9.5 Substanz"
// Strahlentherapie
* Strahlentherapie -> "10 Strahlentherapie"
* Strahlentherapie.Intention -> "10.1 Intention"
* Strahlentherapie.Startdatum -> "10.2 Beginn"
* Strahlentherapie.Enddatum -> "10.3 Ende"
* Strahlentherapie.Bestrahlungsregion -> "10.4 Zielgebiet"
// Verlauf
* Verlauf -> "11 Verlauf"
* Verlauf.Meldedatum -> "11.1 Meldedatum"
* Verlauf.Vitalstatus -> "11.4 Vitalstatus"
* Verlauf.Gesamtbeurteilung -> "11.5 Gesamtbeurteilung"
* Verlauf.TumorstatusLokal -> "11.6 Tumorstatus lokal"
* Verlauf.TumorstatusLK -> "11.7 Tumorstatus Lymphknoten"
* Verlauf.TumorstatusFM -> "11.8 Tumorstatus Fernmetastasen"

Mapping: IQTIG
Source: BIH_LM_Senologie
Target: "https://iqtig.org/qs-verfahren/18-1"
Id: IQTIG
Title: "IQTIG QS 18.1 Mammachirurgie (Spez. 2024 V05)"

// Teildatensatz Brust
* Diagnose.Seite -> "BRUST:SEITE"
* Diagnose.Diagnosekode -> "BRUST:DIAGICD"
* Diagnose.DatumErstdiagnose -> "BRUST:DIAGDATUM"
* BildgebungMamma.Art -> "BRUST:BILDGMETHODE"
* BildgebungMamma.BIRADS -> "BRUST:BIRADS"
* Operationsplanung.PraeoperativeMarkierung -> "BRUST:DRAHT" "Präoperative Markierung (M/S/T/N)"
* Tumorkonferenz -> "BRUST:TKPRAEOP" "Prätherapeutische Tumorkonferenz"
* SystemischeTherapie -> "BRUST:NEOADJ" "Neoadjuvante Therapie"
// Klinische Tumorformel (Teildatensatz Brust)
* KlinischeUntersuchung.KlinischeTumorformel.cT -> "BRUST:CT"
* KlinischeUntersuchung.KlinischeTumorformel.cN -> "BRUST:CN"
* KlinischeUntersuchung.KlinischeTumorformel.cM -> "BRUST:CM"
// Teildatensatz Operation
* Operation.Datum -> "O:OPDATUM"
* Operation.Seite -> "O:SEITE"
* Operation.Art -> "O:OPSCHLUESSEL / O:OPART"
* Pathologie.Histologie -> "O:HISTMORPH"
* Pathologie.BefundInvasiv.Grading -> "O:GRADING"
* Pathologie.BefundInvasiv.MaxTumordurchmesser -> "O:TGROESSEINV"
* Pathologie.BefundDCIS.MaxAusdehnung -> "O:TGROESSEDCIS"
* Pathologie.BefundInvasiv.Multifokalitaet -> "O:MULTIFOK"
* Pathologie.BefundInvasiv.R -> "O:RSTATUSLOK / O:RSTATUSGES"
* Pathologie.BefundInvasiv.pT -> "O:PT"
* Pathologie.BefundInvasiv.pN -> "O:PN"
* Pathologie.M -> "O:PM"
* Pathologie.UICC -> "O:UICCPATHO"
* Pathologie.LymphknotenUntersucht -> "O:LKUNTERSUCHT"
* Pathologie.LymphknotenBefallen -> "O:LKBEFALLEN"
* Pathologie.SentinelUntersucht -> "O:SLKUNTERSUCHT"
* Pathologie.SentinelBefallen -> "O:SLKBEFALLEN"
* Pathologie.BefundInvasiv.Biomarker.ER -> "O:ERSTATUS"
* Pathologie.BefundInvasiv.Biomarker.PR -> "O:PRSTATUS"
* Pathologie.BefundInvasiv.Biomarker.HER2 -> "O:HER2STATUS"
* Operation.Komplikation -> "O:KOMPL"

Mapping: OncoBox
Source: BIH_LM_Senologie
Target: "https://www.onkozert.de/oncobox/brust/N1.1.1"
Id: OncoBox
Title: "OncoBox Brust N1.1.1 (DKG-Zertifizierung)"

// Diagnose
* Diagnose -> "primaerfall.diagnose"
* Diagnose.Diagnosekode -> "Diagnose_ICD_Code"
* Diagnose.Seite -> "Diagnose_Seite"
* Diagnose.DatumErstdiagnose -> "Diagnose_Datum"
* Diagnose.Grad -> "Diagnose_Grading"
* Diagnose.Diagnosesicherung -> "Diagnose_Histo_Praeop"
// Staging
* Diagnose.Metastasierungsstadium -> "cTNM_M"
// Bildgebung
* BildgebungMamma.Art -> "Bildgebung_Methode"
* BildgebungMamma.BIRADS -> "Bildgebung_BIRADS"
// Klinische Tumorformel (cTNM)
* KlinischeUntersuchung.KlinischeTumorformel.cT -> "cTNM_T"
* KlinischeUntersuchung.KlinischeTumorformel.cN -> "cTNM_N"
* KlinischeUntersuchung.KlinischeTumorformel.cM -> "cTNM_M"
// Pathologie
* Pathologie.Histologie -> "Diagnose_ICDO_Code"
* Pathologie.BefundInvasiv.pT -> "pTNM_T"
* Pathologie.BefundInvasiv.pN -> "pTNM_N"
* Pathologie.M -> "pTNM_M"
* Pathologie.UICC -> "pTNM_UICC"
* Pathologie.BefundInvasiv.MaxTumordurchmesser -> "pTNM_Groesse_Invasiv_mm"
* Pathologie.BefundDCIS.MaxAusdehnung -> "pTNM_Groesse_DCIS_mm"
* Pathologie.BefundInvasiv.Multifokalitaet -> "pTNM_Multifokal"
* Pathologie.BefundInvasiv.R -> "Op_R_Lokal / Op_R_Gesamt"
* Pathologie.LymphknotenUntersucht -> "LK_Untersucht"
* Pathologie.LymphknotenBefallen -> "LK_Befallen"
* Pathologie.SentinelUntersucht -> "SLK_Untersucht"
* Pathologie.SentinelBefallen -> "SLK_Befallen"
// Biomarker (am invasiven Befund)
* Pathologie.BefundInvasiv.Biomarker.ER -> "ER_Status"
* Pathologie.BefundInvasiv.Biomarker.PR -> "PR_Status"
* Pathologie.BefundInvasiv.Biomarker.HER2 -> "HER2_Status"
* Pathologie.BefundInvasiv.Biomarker.Ki67 -> "Ki67_Prozent"
// Operation
* Operation -> "primaerfall.operation"
* Operation.Art -> "Op_Art"
* Operation.Datum -> "Op_Datum"
* Operation.Seite -> "Op_Seite"
* Operation.Komplikation -> "Op_Komplikation"
// Systemische Therapie
* SystemischeTherapie -> "primaerfall.systemtherapie"
* SystemischeTherapie.Intention -> "Syst_Stellung"
* SystemischeTherapie.Startdatum -> "Syst_Beginn"
* SystemischeTherapie.Enddatum -> "Syst_Ende"
* SystemischeTherapie.Protokoll -> "Syst_Protokoll"
// Strahlentherapie
* Strahlentherapie -> "primaerfall.strahlentherapie"
* Strahlentherapie.Startdatum -> "RT_Beginn"
* Strahlentherapie.Enddatum -> "RT_Ende"
* Strahlentherapie.Bestrahlungsregion -> "RT_Zielgebiet"
* Strahlentherapie.Gesamtdosis -> "RT_Dosis_Gy"
// Tumorkonferenz
* Tumorkonferenz -> "primaerfall.tumorkonferenz"
* Tumorkonferenz.Datum -> "TK_Datum"
// Supportiv
* Psychoonkologie -> "primaerfall.psychoonkologie"
* Sozialdienst -> "primaerfall.sozialdienst"
* Studienteilnahme -> "primaerfall.studienteilnahme"
// Verlauf
* Verlauf -> "primaerfall.verlauf"
* Verlauf.Meldedatum -> "Meldedatum"
* Verlauf.Vitalstatus -> "Vitalstatus"
* Verlauf.TumorstatusLokal -> "Tumorstatus_Lokal"
* Verlauf.TumorstatusLK -> "Tumorstatus_LK"
* Verlauf.TumorstatusFM -> "Tumorstatus_FM"

Mapping: IRegG
Source: BIH_LM_Senologie
Target: "https://implantateregister-deutschland.de/spec/V4.1.1"
Id: IRegG
Title: "IRegG Brustimplantat-Meldung (V4.1.1)"

// Operation -> Implantat
* Operation -> "fall.operation"
* Operation.Datum -> "OPE_Datum"
* Operation.Seite -> "OPE_SeitenLokalisationSchluessel"
* Operation.Implantat -> "operation.artikelidentifikation"
* Operation.Implantat.Art -> "ABI_ArtikelTypSchluessel"
* Operation.Implantat.Hersteller -> "ABI_HerstellerSchluessel"
* Operation.Implantat.REFNummer -> "ARI_Artikelkennzeichen"
* Operation.Implantat.Seriennummer -> "ARB_SerienNummer"

// =============================================================================
// Mapping LM -> FHIR-Profile (Senologie IG)
// =============================================================================
// Welches FHIR-Profil repräsentiert ein LM-Element in der Senologie-Spezifikation?
// Form: "Senologie_<Profilname> (Resource: <FHIR-Ressource>)"

Mapping: FHIRProfile
Source: BIH_LM_Senologie
Target: "https://www.senologie.org/fhir"
Id: FHIRProfile
Title: "Senologie FHIR-Profile (interne Abbildung)"

// Diagnose / Tumor
* Diagnose -> "Senologie_Diagnose (Condition)"
* Diagnose.DiagnoseB3SubTyp -> "Senologie_Diagnose_Benigne (Condition)"
* Tumorlokalisation -> "Senologie_Tumorlokalisation (BodyStructure)"

// Anamnese
* GynaekologischeAnamnese -> "Senologie_Gynaekologische_Anamnese (Observation)"
* Familienanamnese -> "Senologie_Familienanamnese (FamilyMemberHistory)"
* ChecklisteErblicheBelastung -> "Senologie_Checkliste_Erbliche_Belastung (Observation)"

// Untersuchung & Bildgebung
* KlinischeUntersuchung -> "Senologie_Klinische_Untersuchung (Observation)"
* KlinischeUntersuchung.KlinischeTumorformel -> "MII_PR_Onko_TNM_Klassifikation (Observation)" "cTNM via MII Onko TNM-Klassifikation"
* BildgebungMamma -> "Senologie_Bildgebung_Befund (DiagnosticReport) + Senologie_Bildgebung_Observation"
* BildgebungSonstige -> "Senologie_Bildgebung_Sonstige (DiagnosticReport)"

// Pathologie
* Pathologie -> "Senologie_Pathologie_Befund (DiagnosticReport, basiert auf MII Patho Report)"
* Pathologie.Praeparat -> "Senologie_Pathologie_Praeparat (Specimen)"
* Pathologie.BefundInvasiv -> "MII_PR_Patho_GrouperBefund (Observation, microscopic)"
* Pathologie.BefundDCIS -> "MII_PR_Patho_GrouperBefund (Observation, microscopic)"
* Pathologie.BefundInvasiv.Biomarker.ER -> "Senologie_ER_Status (erbt MII Onko Rezeptorstatus Estrogen + IRS/Allred)"
* Pathologie.BefundInvasiv.Biomarker.PR -> "Senologie_PR_Status (erbt MII Onko Rezeptorstatus Progesteron + IRS/Allred)"
* Pathologie.BefundInvasiv.Biomarker.HER2 -> "Senologie_HER2_Status (erbt MII Onko Her2neu Status + Ratio/Kopienzahl)"
* Pathologie.BefundInvasiv.pT -> "MII_PR_Onko_TNM_Klassifikation (Observation, pTNM)"
* Pathologie.BefundInvasiv.pN -> "MII_PR_Onko_TNM_Klassifikation (Observation, pTNM)"
* Pathologie.M -> "MII_PR_Onko_TNM_Klassifikation (Observation, pTNM)"
* Pathologie.BefundInvasiv.Biomarker.Ki67 -> "Senologie_Ki67 (Observation)"
* Pathologie.BefundInvasiv.Biomarker.PDL1CPS -> "Senologie_PDL1_Status (Observation)"
* Pathologie.BefundInvasiv.Biomarker.PDL1TPS -> "Senologie_PDL1_Status (Observation)"
* Pathologie.BefundInvasiv.Biomarker.PDL1IC -> "Senologie_PDL1_Status (Observation)"

// Genetik
* Genetik.SomatischeMutation -> "Senologie_Somatische_Mutation (Observation)"
* Genetik.Genexpressionstest -> "Senologie_Genexpressionstest (Observation) + Senologie_Genexpressions_Score"

// Operation
* Operationsplanung -> "Senologie_OP_Planung (ServiceRequest)"
* Operation -> "Senologie_BrustOP (Procedure)"
* Operation.Komplikation -> "Senologie_Operative_Komplikation (Observation)"
* Operation.Implantat -> "Senologie_Brustimplantat (DeviceUseStatement)"

// Therapie
* SystemischeTherapie -> "Senologie_Systemtherapie_Procedure (Procedure)"
* SystemischeTherapie.Medikation -> "Senologie_Systemtherapie_Durchfuehrung (MedicationAdministration)"
* GeplanteSystemtherapie -> "Senologie_Geplante_Systemtherapie (MedicationRequest)"
* Strahlentherapie -> "Senologie_Strahlentherapie (Procedure)"
* Nebenwirkung -> "Senologie_Nebenwirkung (AdverseEvent)"
* Begleitmedikation -> "Senologie_Begleitmedikation (MedicationStatement)"

// Tumorboard & Studien
* Tumorkonferenz -> "Senologie_Tumorboard_Empfehlung (CarePlan / ServiceRequest)"
* Studienteilnahme -> "Senologie_Studienteilnahme (ResearchSubject)"

// Supportiv
* Psychoonkologie -> "Senologie_Psychoonkologie (Encounter / Observation)"
* Sozialdienst -> "Senologie_Sozialdienst (Encounter / Observation)"

// Verlauf
* Verlauf -> "Senologie_Follow_Up (Observation)"

// =============================================================================
// Datenherkunft (MII-Modul oder Senologie-eigen)
// =============================================================================
// Markiert pro LM-Element, aus welchem Standard-Modul das Konzept stammt:
//   - MII-Onko   = Medizininformatik-Initiative, Modul Onkologie
//   - MII-Patho  = MII-Modul Pathologie-Befund
//   - MII-MTB    = MII-Modul Molekulares Tumorboard
//   - MII-Medikation = MII-Modul Medikation
//   - Senologie  = Eigene Erweiterung der BIH/Senologie-Spezifikation

Mapping: Datenherkunft
Source: BIH_LM_Senologie
Target: "https://www.medizininformatik-initiative.de/"
Id: Datenherkunft
Title: "Datenherkunft: MII-Modul oder Senologie-eigen"

// Diagnose / Staging
* Diagnose -> "MII-Onko (Primaerdiagnose)"
* Diagnose.Falltyp -> "Senologie (Ersterkrankung/Rezidiv/Metastase)"
* Diagnose.DiagnoseB3SubTyp -> "Senologie (B3-Laesion, KDS Biobank uebernommen)"
* Diagnose.Tumormanifestation -> "MII-Onko (Tumormanifestation)"
* Diagnose.Metastasierungsstadium -> "MII-Onko (cM)"
* Diagnose.Grad -> "MII-Patho (Grading)"

// Tumorlokalisation
* Tumorlokalisation -> "Senologie (BodyStructure mit Quadrant/Uhrzeit, ueber MII Patho LateralityQualifier hinaus)"

// Anamnese
* Vorstellung -> "Senologie"
* GynaekologischeAnamnese -> "Senologie"
* Familienanamnese -> "Senologie (FamilyMemberHistory)"
* ChecklisteErblicheBelastung -> "Senologie (DKG-Checkliste)"

// Klinische Untersuchung
* KlinischeUntersuchung -> "Senologie"
* KlinischeUntersuchung.KlinischeTumorformel -> "MII-Onko (TNM-Klassifikation, c-Praefix)"

// Bildgebung
* BildgebungMamma -> "Senologie (BI-RADS, ACR, Herdbefund, Mikrokalk)"
* BildgebungSonstige -> "Senologie"

// Pathologie
* Pathologie -> "MII-Patho (Patho Report)"
* Pathologie.Praeparat -> "MII-Patho (Specimen)"
* Pathologie.Histologie -> "MII-Patho (Histologie ICD-O-3)"
* Pathologie.BefundInvasiv -> "MII-Patho (Grouper-Befund microscopic)"
* Pathologie.BefundInvasiv.pT -> "MII-Onko (TNM-Klassifikation, p-Praefix)"
* Pathologie.BefundInvasiv.pN -> "MII-Onko (TNM-Klassifikation, p-Praefix)"
* Pathologie.BefundInvasiv.L -> "MII-Onko (TNM L-Status)"
* Pathologie.BefundInvasiv.V -> "MII-Onko (TNM V-Status)"
* Pathologie.BefundInvasiv.Pn -> "MII-Onko (TNM Pn-Status)"
* Pathologie.BefundInvasiv.R -> "MII-Onko (Residualstatus)"
* Pathologie.BefundInvasiv.Biomarker.ER -> "MII-Onko Mamma Rezeptorstatus Estrogen (value: oBDS + Leitlinie [ER-low als 'gering-positiv']; component: % + Intensitaet) + Senologie (IRS/Allred-Erweiterung)"
* Pathologie.BefundInvasiv.Biomarker.PR -> "MII-Onko Mamma Rezeptorstatus Progesteron (value: oBDS + Leitlinie; component: % + Intensitaet) + Senologie (IRS/Allred-Erweiterung)"
* Pathologie.BefundInvasiv.Biomarker.HER2 -> "MII-Onko Mamma Her2neu Status (value: oBDS + Leitlinie [HER2-low, HER2-ultralow]; component: IHC-Score + ISH) + Senologie (ISH-Ratio + Kopienzahl)"
* Pathologie.BefundInvasiv.Biomarker.Ki67 -> "MII-Patho (Biomarker, Ki-67)"
* Pathologie.BefundInvasiv.Biomarker.PDL1CPS -> "Senologie (PD-L1 IHC)"
* Pathologie.BefundDCIS -> "MII-Patho + Senologie (DCIS-Spezifika)"
* Pathologie.M -> "MII-Onko (TNM pM)"
* Pathologie.UICC -> "MII-Onko (UICC-Stadium)"
* Pathologie.LymphknotenUntersucht -> "MII-Onko / oBDS"
* Pathologie.LymphknotenBefallen -> "MII-Onko / oBDS"

// Genetik (MTB-Anbindung)
* Genetik -> "MII-MTB (Molekulares Tumorboard)"
* Genetik.SomatischeMutation -> "MII-MTB (somatic variant)"
* Genetik.SomatischeMutation.Gen -> "MII-MTB (HGNC-codiertes Gen)"
* Genetik.Genexpressionstest -> "Senologie (Oncotype DX, MammaPrint, Prosigna, EndoPredict)"

// OP-Planung & Operation
* Operationsplanung -> "Senologie (ServiceRequest)"
* Operation -> "MII-Onko Mamma Operation"
* Operation.Komplikation -> "MII-Onko (Operative Komplikation)"
* Operation.Implantat -> "Senologie (IRegG-Anbindung)"
* Operation.PraeoperativeMarkierung -> "MII-Onko Mamma (usedCode)"
* Operation.IntraoperativesImaging -> "MII-Onko Mamma (usedCode)"

// Therapie
* SystemischeTherapie -> "MII-Onko Systemtherapie / MII-Medikation"
* SystemischeTherapie.Medikation -> "MII-Medikation (MedicationAdministration)"
* GeplanteSystemtherapie -> "MII-Medikation (MedicationRequest)"
* Strahlentherapie -> "MII-Onko Strahlentherapie"
* Nebenwirkung -> "MII-Onko (AdverseEvent) + CTCAE"
* Begleitmedikation -> "MII-Medikation (MedicationStatement)"

// Tumorboard, Studien, Supportiv
* Tumorkonferenz -> "Senologie (CarePlan, OncoBox-naher Aufbau)"
* Studienteilnahme -> "MII-Studie (ResearchSubject)"
* Psychoonkologie -> "Senologie"
* Sozialdienst -> "Senologie"

// Verlauf
* Verlauf -> "MII-Onko Verlauf"
* Verlauf.Gesamtbeurteilung -> "MII-Onko Verlauf (D27)"
* Verlauf.TumorstatusLokal -> "MII-Onko Verlauf (M05)"
* Verlauf.TumorstatusLK -> "MII-Onko Verlauf (M06)"
* Verlauf.TumorstatusFM -> "MII-Onko Verlauf (M07)"
* Verlauf.Vitalstatus -> "MII-Person (Patient.deceased)"
* Verlauf.Zweittumor -> "MII-Onko (Senologie-Erweiterung M08–M10)"
