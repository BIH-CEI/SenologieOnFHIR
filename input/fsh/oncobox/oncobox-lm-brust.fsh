// =============================================================================
// OncoBox Brust N1.1.1 -- Logical Model
//
// Logisches Modell der OncoBox-Brust-Meldung (OnkoZert / DKG Brustzentrum-
// Zertifizierung) gemaess Spezifikation N1.1.1. Bildet die XML-Struktur
// der OncoBox-Export-Datei ab, wie sie jaehrlich durch zertifizierte
// Brustzentren an OnkoZert uebermittelt wird.
//
// Dient als StructureMap-Target fuer die Transformation von FHIR-Ressourcen
// (Senologie-Profile) in OncoBox-Brust-Meldungen.
//
// Quelle: input/data/oncobox-brust/OncoBoxBrust_N1.1.1_Spec.xlsx
//   - Sheet "Datenfelder-XML"    (91 Zeilen, XML-Datenfelder)
//   - Sheet "Strukturval."       (148 Zeilen, strukturelle Validierung)
//   - Sheet "Primaerfallarten"   (103 Zeilen, Fallkategorisierung)
//   - Sheet "Gesamtbetracht."    (53 Zeilen, Gesamtbetrachtung)
//   - Sheets "KB-1" bis "KB-20"  (20 Qualitaetsindikatoren / DKG Kennzahlen)
//
// Scope: Nur OncoBox Brust N1.1.1 (nicht OncoBox 2.0, nicht Darm/Prostata/Lunge).
//
// Hinweis: Die XML-Tag-Namen und Feldcodes in den "XML"-Captions dieser
// Elemente folgen der OncoBox-Brust-Konvention (Caps-Case mit Unterstrichen)
// und sind gegen die Excel-Spezifikation zu verifizieren. Die Strukturierung
// in Primaerfall / Eingriff / Nachsorge / Kennzahlen entspricht der
// OnkoZert-Systematik.
// =============================================================================

Logical: OncoBoxBrustMeldung
Id: oncobox-brust-meldung
Title: "OncoBox Brust N1.1.1 Meldung (Logical Model)"
Description: """Logisches Modell einer OncoBox-Brust-Meldung gemaess OnkoZert-Spezifikation N1.1.1.

Die OncoBox Brust ist das XML-basierte Exportformat fuer die jaehrliche Uebermittlung
von Fall- und Qualitaetsindikatordaten zertifizierter Brustzentren an OnkoZert
(DKG-Zertifizierung). Der Datensatz besteht aus folgenden Hauptkomponenten:

- **Zentrum**  -- Kennung und Berichtszeitraum
- **Primaerfall** -- Patienten- und Falldaten (Primaerfallarten nach OnkoZert-Systematik)
- **Diagnose** -- Diagnoseinformationen (ICD-10-GM, TNM, Bildgebung, Histologie)
- **Therapie** -- Operationen, Systemtherapie, Strahlentherapie, Hormontherapie, Trastuzumab
- **Tumorkonferenz** -- Praetherapeutische und postoperative Fallbesprechung
- **Versorgungskette** -- Psychoonkologie, Sozialdienst, Studienteilnahme
- **Nachsorge / Outcome** -- Rezidiv, Metastasierung, Tod
- **Kennzahlen (KB-1 bis KB-20)** -- DKG-Qualitaetsindikatoren

Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung
einer OncoBox-Brust-konformen Meldung aus einem Senologie-FHIR-Bundle.
Die Serialisierung (XML) ist nicht Bestandteil dieses Modells."""

* ^url = "https://www.senologie.org/fhir/StructureDefinition/oncobox-brust-meldung"
* ^version = "0.1.0"
* ^status = #draft

// =============================================================================
// Meldungs-Metadaten (Zentrum + Berichtszeitraum)
// =============================================================================
* zentrum 1..1 BackboneElement "Zentrum" "Kennung des meldenden Brustzentrums"
  * oncoBoxVersion 1..1 string "OncoBox_Version" "Version der OncoBox-Spezifikation (hier: N1.1.1)"
  * zentrumId 1..1 string "Zentrum_ID" "OnkoZert-Zentrumskennung (z.B. DKG-Brustzentrum-Nr.)"
  * zentrumName 0..1 string "Zentrum_Name" "Name des meldenden Brustzentrums"
  * iknr 0..1 string "IKNR" "Institutionskennzeichen der fuehrenden Betriebsstaette"
  * standortId 0..1 string "Standort_ID" "Standortkennung"
  * berichtszeitraumBeginn 1..1 date "Berichtszeitraum_Beginn" "Start des Auditzeitraums (i.d.R. 01.07. Vorjahr)"
  * berichtszeitraumEnde 1..1 date "Berichtszeitraum_Ende" "Ende des Auditzeitraums (i.d.R. 30.06. laufendes Jahr)"
  * meldungsdatum 1..1 date "Meldungsdatum" "Zeitpunkt der Meldungserstellung"

// =============================================================================
// Primaerfall -> Patient + Encounter + Condition
//
// Ein Primaerfall je Patientin im Berichtszeitraum.
// Primaerfallart wird nach OnkoZert-Systematik klassifiziert (siehe Sheet
// "Primaerfallarten", 103 Zeilen -- z.B. invasives Mamma-CA, DCIS, Rezidiv,
// Fernmetastase, Phylloides, Sarkom, Risikoreduktion, Rekonstruktion).
// =============================================================================
* primaerfall 1..* BackboneElement "Primaerfall" "Primaerer Behandlungsfall im Berichtszeitraum"
  // --- Falllkennung ---
  * fallId 1..1 string "Fall_ID" "Eindeutige Fallkennung im Zentrum (pseudonymisiert)"
  * patientPseudonym 1..1 string "Patient_Pseudonym" "Patienten-Pseudonym (zentrumsintern)"
  * primaerfallart 1..1 code "Primaerfallart" "Primaerfallart nach OnkoZert-Systematik (z.B. 1=invasiv, 2=DCIS, 3=Rezidiv, 4=Metastasiert primaer, 5=phylloides, 6=Sarkom, 7=Risikoreduktion, 8=Rekonstruktion, 9=sonstige)"
  * primaerfallSubtyp 0..1 string "Primaerfall_Subtyp" "Feinere Klassifikation (aus Sheet 'Primaerfallarten')"

  // --- Patientenbasis ---
  * patient 1..1 BackboneElement "Patient" "Patientenbasisdaten"
    * geburtsdatum 1..1 date "Patient_Geburtsdatum" "Geburtsdatum"
    * geschlecht 1..1 code "Patient_Geschlecht" "Geschlecht: W=weiblich, M=maennlich, D=divers, U=unbekannt"
    * postleitzahl 0..1 string "Patient_PLZ" "Postleitzahl des Wohnorts"
    * alterBeiDiagnose 0..1 integer "Patient_Alter_Diagnose" "Alter zum Diagnosezeitpunkt in Jahren"
    * menopausenstatus 0..1 code "Patient_Menopausenstatus" "Menopausenstatus: 1=praemenopausal, 2=perimenopausal, 3=postmenopausal, U=unbekannt"

  // --- Fall/Encounter ---
  * fall 1..1 BackboneElement "Fall" "Behandlungsfall"
    * fallTyp 0..1 code "Fall_Typ" "Fallart: 1=stationaer, 2=ambulant, 3=teilstationaer"
    * aufnahmedatum 0..1 date "Fall_Aufnahmedatum" "Aufnahmedatum (bei stationaer)"
    * entlassungsdatum 0..1 date "Fall_Entlassungsdatum" "Entlassungsdatum (bei stationaer)"

  // --- Diagnose ---
  * diagnose 1..1 BackboneElement "Diagnose" "Diagnoseinformationen (primaere Tumordiagnose)"
    * diagnosedatum 1..1 date "Diagnose_Datum" "Datum der Erstdiagnose"
    * diagnoseICD 1..1 BackboneElement "Diagnose_ICD" "ICD-10-GM-Kodierung der Hauptdiagnose"
      * code 1..1 code "Diagnose_ICD_Code" "ICD-10-GM Code (z.B. C50.4, D05.1)"
      * version 0..1 string "Diagnose_ICD_Version" "ICD-10-GM Version"
    * diagnoseICDO 0..1 BackboneElement "Diagnose_ICDO" "ICD-O-3 Morphologie"
      * code 1..1 code "Diagnose_ICDO_Code" "ICD-O-Morphologie-Code (z.B. 8500/3)"
      * version 0..1 string "Diagnose_ICDO_Version" "ICD-O Version"
    * seitenlokalisation 1..1 code "Diagnose_Seite" "Seitenlokalisation: R=rechts, L=links, B=beidseits, U=unbekannt"
    * dignitaet 1..1 code "Diagnose_Dignitaet" "Dignitaet: 1=maligne, 2=in-situ, 3=borderline, 4=benigne, 9=sonstige"
    * grading 0..1 code "Diagnose_Grading" "Histopathologisches Grading: G1, G2, G3, G4, GX, GB (low-grade DCIS), GI (intermediate DCIS), GH (high-grade DCIS)"
    * histologischeSicherungPraeop 0..1 code "Diagnose_Histo_Praeop" "Praeoperative histologische Sicherung: 0=nein, 1=Stanzbiopsie, 2=Vakuumbiopsie, 3=FNA, 4=offene Biopsie, 9=sonstige"
    * rezidivtyp 0..1 code "Diagnose_Rezidivtyp" "Falls Rezidiv: 1=lokoregionaer, 2=kontralateral, 3=fern, 9=unbekannt"

    // --- Bildgebung / Befund praeoperativ ---
    * bildgebung 0..* BackboneElement "Bildgebung" "Praeoperative bildgebende Diagnostik"
      * methode 1..1 code "Bildgebung_Methode" "Modalitaet: 1=Mammografie, 2=Sonografie, 3=MRT, 4=Tomosynthese, 5=Galaktografie, 9=sonstige"
      * datum 0..1 date "Bildgebung_Datum" "Untersuchungsdatum"
      * birads 0..1 code "Bildgebung_BIRADS" "BI-RADS-Klassifikation: 0, 1, 2, 3, 4, 4a, 4b, 4c, 5, 6"
      * befundText 0..1 string "Bildgebung_Befund" "Befund (Freitext, optional)"

    // --- Klinisches TNM (praetherapeutisch) ---
    * cTNM 0..1 BackboneElement "cTNM" "klinisches TNM (praetherapeutisch)"
      * cT 0..1 string "cTNM_T" "klinische T-Kategorie (z.B. cT1, cT2)"
      * cN 0..1 string "cTNM_N" "klinische N-Kategorie"
      * cM 0..1 string "cTNM_M" "klinische M-Kategorie"
      * tnmVersion 0..1 string "cTNM_Version" "TNM-Auflage (z.B. 8)"
      * uiccStadium 0..1 string "cTNM_UICC" "klinisches UICC-Stadium"
      * tumorgroesseKlinisch 0..1 integer "cTNM_Groesse_mm" "praetherapeutische Tumorgroesse in mm"

    // --- Pathologisches TNM (postoperativ) ---
    * pTNM 0..1 BackboneElement "pTNM" "pathologisches TNM (postoperativ)"
      * ySymbol 0..1 code "pTNM_ySymbol" "y-Symbol (nach neoadjuvanter Therapie): 0=nein, y=ja"
      * pT 0..1 string "pTNM_T" "pathologische T-Kategorie"
      * pN 0..1 string "pTNM_N" "pathologische N-Kategorie"
      * pM 0..1 string "pTNM_M" "pathologische M-Kategorie"
      * tnmVersion 0..1 string "pTNM_Version" "TNM-Auflage"
      * uiccStadium 0..1 string "pTNM_UICC" "pathologisches UICC-Stadium"
      * tumorgroesseInvasiv 0..1 integer "pTNM_Groesse_Invasiv_mm" "Groesse invasiver Anteil in mm"
      * tumorgroesseDCIS 0..1 integer "pTNM_Groesse_DCIS_mm" "Groesse DCIS-Anteil in mm"
      * multifokalitaet 0..1 code "pTNM_Multifokal" "Multifokalitaet: 0=nein, 1=multifokal, 2=multizentrisch, 9=unbekannt"
      * l 0..1 code "pTNM_L" "Lymphgefaessinvasion: L0, L1, LX"
      * v 0..1 code "pTNM_V" "Veneninvasion: V0, V1, V2, VX"
      * pn 0..1 code "pTNM_Pn" "Perineurale Invasion: Pn0, Pn1, PnX"

    // --- Lymphknoten ---
    * lymphknoten 0..1 BackboneElement "Lymphknoten" "Lymphknotenstatus"
      * untersucht 0..1 integer "LK_Untersucht" "Anzahl untersuchter Lymphknoten (ohne Sentinel)"
      * befallen 0..1 integer "LK_Befallen" "Anzahl befallener Lymphknoten (ohne Sentinel)"
      * sentinelUntersucht 0..1 integer "SLK_Untersucht" "Anzahl untersuchter Sentinel-Lymphknoten"
      * sentinelBefallen 0..1 integer "SLK_Befallen" "Anzahl befallener Sentinel-Lymphknoten"

    // --- Rezeptorstatus ---
    * rezeptorstatus 0..1 BackboneElement "Rezeptorstatus" "Hormon- und HER2-Rezeptorstatus"
      * erStatus 0..1 code "ER_Status" "Oestrogenrezeptor: P=positiv, N=negativ, U=unbekannt"
      * erProzent 0..1 integer "ER_Prozent" "Anteil ER-positiver Zellen (%)"
      * prStatus 0..1 code "PR_Status" "Progesteronrezeptor: P=positiv, N=negativ, U=unbekannt"
      * prProzent 0..1 integer "PR_Prozent" "Anteil PR-positiver Zellen (%)"
      * her2Status 0..1 code "HER2_Status" "HER2-Status: P=positiv, N=negativ, U=unbekannt"
      * her2Score 0..1 code "HER2_Score" "IHC-Score: 0, 1+, 2+, 3+"
      * ki67 0..1 integer "Ki67_Prozent" "Ki-67-Proliferationsindex (%)"

  // ==========================================================================
  // Therapie -> Procedure / MedicationRequest / MedicationAdministration
  // ==========================================================================

  // --- Operation ---
  * operation 0..* BackboneElement "Operation" "Operativer Eingriff"
    * lnr 1..1 positiveInt "Op_LNR" "Laufende Nummer der Operation im Fall"
    * datum 1..1 date "Op_Datum" "Operationsdatum"
    * seitenlokalisation 1..1 code "Op_Seite" "Seitenlokalisation: R/L/B"
    * operationsart 1..1 code "Op_Art" "Operationsart: 1=BET, 2=Mastektomie einfach, 3=Mastektomie hautsparend (SSM), 4=Mastektomie nippelsparend (NSM), 5=Revision, 6=Wiederaufbau, 7=Axilladissektion (isoliert), 8=SLNB (isoliert), 9=sonstige"
    * opsCodes 0..* BackboneElement "Op_OPS" "OPS-Kode(s) des Eingriffs"
      * code 1..1 code "Op_OPS_Code" "OPS-Kode"
      * version 0..1 string "Op_OPS_Version" "OPS-Version"
    * drahtmarkierung 0..1 code "Op_Drahtmarkierung" "Praeoperative Drahtmarkierung: 0=keine, 1=sonografisch, 2=mammografisch, 3=MRT, 9=sonstige"
    * sentinel 0..1 code "Op_Sentinel" "Sentinel-Lymphknoten-Biopsie durchgefuehrt: 0=nein, 1=ja"
    * axillaDissektion 0..1 code "Op_Axdissektion" "Axilladissektion durchgefuehrt: 0=nein, 1=ja"
    * intraopSchnellschnitt 0..1 code "Op_Schnellschnitt" "Intraoperativer Schnellschnitt: 0=nein, 1=ja"
    * intraopPraeparatkontrolle 0..1 code "Op_Praeparatkontrolle" "Intraoperative Praeparatkontrolle: 0=nein, 1=Mammografie, 2=Sonografie, 9=sonstige"
    * residualstatusLokal 0..1 code "Op_R_Lokal" "Lokaler Residualstatus: R0, R1, R1is, R1cy, R2, RX"
    * residualstatusGesamt 0..1 code "Op_R_Gesamt" "Gesamtresidualstatus: R0, R1, R2, RX"
    * revisionsOp 0..1 code "Op_Revision" "Revisionsoperation: 0=nein, 1=ja"
    * anzahlEingriffeR0 0..1 integer "Op_Anzahl_bis_R0" "Anzahl Eingriffe bis zum Erreichen einer R0-Resektion (KB-14)"
    * komplikationen 0..* BackboneElement "Op_Komplikation" "Intra-/postoperative Komplikationen"
      * kuerzel 0..1 code "Komp_Kuerzel" "Komplikations-Kuerzel (z.B. WUH, ABS)"
      * icdCode 0..1 code "Komp_ICD" "ICD-10-GM-Code (falls zutreffend)"
      * clavienDindo 0..1 code "Komp_Clavien" "Clavien-Dindo-Grad"

  // --- Systemtherapie (Chemo / Immun / Antikoerper) ---
  * systemtherapie 0..* BackboneElement "Systemtherapie" "Systemische Tumortherapie (Chemo-, Immun-, zielgerichtete Therapie)"
    * lnr 1..1 positiveInt "Syst_LNR" "Laufende Nummer der Therapie"
    * therapieart 1..1 code "Syst_Art" "Therapieart: 1=Chemotherapie, 2=Immuntherapie, 3=zielgerichtete Therapie (u.a. Trastuzumab), 4=Kombination, 9=sonstige"
    * stellungZurOP 1..1 code "Syst_Stellung" "Stellung zur Operation: N=neoadjuvant, A=adjuvant, P=palliativ, S=sonstige"
    * beginn 0..1 date "Syst_Beginn" "Beginn der Therapie"
    * ende 0..1 date "Syst_Ende" "Ende der Therapie"
    * protokoll 0..1 string "Syst_Protokoll" "Protokollbezeichnung (z.B. EC-Pac, TCH)"
    * enthaeltTrastuzumab 0..1 code "Syst_Trastuzumab" "Trastuzumab enthalten: 0=nein, 1=ja (KB-7 relevant)"
    * firstLine 0..1 code "Syst_FirstLine" "First-Line-Therapie bei Metastasierung: 0=nein, 1=ja (KB-8 relevant)"

  // --- Endokrine Therapie ---
  * endokrineTherapie 0..* BackboneElement "Endokrine_Therapie" "Endokrine Therapie (Tamoxifen, Aromatasehemmer, GnRH etc.)"
    * lnr 1..1 positiveInt "Endo_LNR" "Laufende Nummer"
    * substanz 0..1 code "Endo_Substanz" "Substanzklasse: 1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6i, 9=sonstige"
    * beginn 0..1 date "Endo_Beginn" "Therapiebeginn"
    * ende 0..1 date "Endo_Ende" "Therapieende"
    * stellungZurOP 0..1 code "Endo_Stellung" "Stellung zur OP: N=neoadjuvant, A=adjuvant, P=palliativ"

  // --- Strahlentherapie ---
  * strahlentherapie 0..* BackboneElement "Strahlentherapie" "Strahlentherapie"
    * lnr 1..1 positiveInt "RT_LNR" "Laufende Nummer"
    * beginn 0..1 date "RT_Beginn" "Therapiebeginn"
    * ende 0..1 date "RT_Ende" "Therapieende"
    * zielgebiet 0..1 code "RT_Zielgebiet" "Zielgebiet: 1=Brust/Thorax, 2=LAW, 3=Boost, 4=Fernmetastase, 9=sonstige"
    * gesamtdosisGy 0..1 decimal "RT_Dosis_Gy" "Gesamtdosis in Gy"
    * stellungZurOP 0..1 code "RT_Stellung" "Stellung zur OP: N=neoadjuvant, A=adjuvant, P=palliativ"

  // --- Tumorkonferenz ---
  * tumorkonferenz 0..* BackboneElement "Tumorkonferenz" "Tumorkonferenz / Fallbesprechung"
    * lnr 1..1 positiveInt "TK_LNR" "Laufende Nummer"
    * datum 1..1 date "TK_Datum" "Datum der Konferenz"
    * typ 1..1 code "TK_Typ" "Typ: 1=praetherapeutisch (KB-2), 2=postoperativ (KB-1), 3=Rezidiv/Metastasen (KB-3)"
    * empfehlungText 0..1 string "TK_Empfehlung" "Therapieempfehlung (Freitext)"

  // --- Psychoonkologie / Sozialdienst / Studie ---
  * psychoonkologie 0..1 BackboneElement "Psychoonkologie" "Psychoonkologische Mitbetreuung (KB-9)"
    * erfolgt 1..1 code "Psych_Erfolgt" "Psychoonkologische Anbindung erfolgt: 0=nein, 1=ja"
    * datum 0..1 date "Psych_Datum" "Datum des ersten Kontakts"

  * sozialdienst 0..1 BackboneElement "Sozialdienst" "Sozialdienstliche Mitbetreuung (KB-10)"
    * erfolgt 1..1 code "Soz_Erfolgt" "Sozialdienstliche Anbindung erfolgt: 0=nein, 1=ja"
    * datum 0..1 date "Soz_Datum" "Datum des ersten Kontakts"

  * studienteilnahme 0..1 BackboneElement "Studienteilnahme" "Teilnahme an klinischer Studie (KB-11)"
    * teilgenommen 1..1 code "Stud_Teilgenommen" "Studienteilnahme: 0=nein, 1=ja"
    * studienKurzname 0..1 string "Stud_Name" "Kurzname der Studie"
    * art 0..1 code "Stud_Art" "Art der Studie: 1=interventionell, 2=nicht-interventionell, 3=Beobachtung/Register, 9=sonstige"

  // --- Verlauf / Outcome ---
  * verlauf 0..* BackboneElement "Verlauf" "Verlaufsereignis (Rezidiv, Metastasierung, Progress)"
    * datum 1..1 date "Verlauf_Datum" "Datum des Ereignisses"
    * ereignis 1..1 code "Verlauf_Ereignis" "Ereignis: 1=Lokalrezidiv, 2=Regionaerrezidiv, 3=Fernmetastase, 4=kontralaterales Mamma-CA, 5=Zweitmalignom, 6=Progress"

    // --- OncoBox 2.0: FM-spezifische Felder (J03-J05) ---
    // Nur relevant wenn ereignis = 3 (Fernmetastase). Bildet die FM-spezifischen
    // Therapiedaten ab, die in OncoBox 2.0 neu hinzukommen.
    * fmOperation 0..1 BackboneElement "FM_Operation" "Operation bei Fernmetastasen (OncoBox 2.0 J03/J05)"
      * opDatum 0..1 date "FM_Op_Datum" "J03: Datum der FM-Operation (z.B. Metastasenresektion)"
      * residualstatus 0..1 code "FM_R_Status" "J05: Residualstatus nach FM-Operation: R0, R1, R2, RX"
    * fmTherapie 0..* BackboneElement "FM_Therapie" "Therapie bei Fernmetastasen (OncoBox 2.0 J04)"
      * therapieart 1..1 code "FM_Therapie_Art" "Art der FM-Therapie: 1=Chemotherapie, 2=Immuntherapie, 3=zielgerichtete Therapie, 4=Strahlentherapie, 5=endokrine Therapie, 9=sonstige"
      * beginn 0..1 date "FM_Therapie_Beginn" "Beginn der FM-Therapie"
      * ende 0..1 date "FM_Therapie_Ende" "Ende der FM-Therapie"

  * tod 0..1 BackboneElement "Tod" "Tod der Patientin im Berichtszeitraum"
    * sterbedatum 1..1 date "Tod_Datum" "Sterbedatum"
    * todesursache 0..1 code "Tod_Ursache" "Todesursache (ICD-10-GM-Kode)"
    * tumorbedingt 0..1 code "Tod_Tumorbedingt" "Tod tumorbedingt: 0=nein, 1=ja, 9=unbekannt"

// =============================================================================
// Kennzahlen (KB-1 bis KB-20) -- DKG-Qualitaetsindikatoren
//
// Die Kennzahlen werden auf Zentrumsebene als Zaehler/Nenner mit Soll-Wert
// gemeldet. Sie werden aus den Primaerfaellen aggregiert, koennen aber auch
// direkt uebermittelt werden (bei Pre-Aggregation durch das Zentrum).
//
// Quelle: Sheets KB-1 bis KB-20 der OncoBox-Brust-Spezifikation, jeweils mit
// Definition von Zaehler, Nenner und Zielwert.
// =============================================================================
* kennzahl 0..* BackboneElement "Kennzahl" "DKG-Qualitaetsindikator (KB-1 bis KB-20)"
  * kennzahlId 1..1 code "KB_ID" "Kennzahl-ID: KB-1 ... KB-20"
  * bezeichnung 0..1 string "KB_Bezeichnung" "Kurzbezeichnung der Kennzahl"
  * zaehler 1..1 integer "KB_Zaehler" "Zaehler (Anzahl Faelle, die das Qualitaetskriterium erfuellen)"
  * nenner 1..1 integer "KB_Nenner" "Nenner (Gesamtanzahl einschlussfaehiger Faelle)"
  * ergebnisProzent 0..1 decimal "KB_Ergebnis" "Zaehler/Nenner in Prozent"
  * sollwertProzent 0..1 decimal "KB_Sollwert" "Zielwert gemaess DKG-Erhebungsbogen (in Prozent)"
  * sollwertErfuellt 0..1 code "KB_Erfuellt" "Sollwert erfuellt: 0=nein, 1=ja, U=nicht bewertbar"
  * kommentar 0..1 string "KB_Kommentar" "Kommentar / Begruendung (bei Nichterfuellung)"
