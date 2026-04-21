// =============================================================================
// IQTIG QS-Verfahren 18.1 Mammachirurgie -- Logical Model
//
// Logisches Modell der IQTIG-Datenspezifikation fuer die externe stationaere
// Qualitaetssicherung zum Leistungsbereich 18.1 "Mammachirurgie"
// (Spezifikation 2024 V05). Bildet die drei Teildatensaetze (Basis, Brust,
// Operation) als FHIR-StructureDefinition ab und dient als Zielstruktur der
// FHIR StructureMaps.
//
// Quelle: Ausfuellhinweise IQTIG 18.1 Mammachirurgie
//   https://iqtig.org/downloads/erfassung/2024/v05/181/Ausfuellhinweise_18_1.html
//
// Scope: Nur QS-Verfahren 18.1 Mammachirurgie (nicht 18.2 Ovar, nicht DMP etc.)
// Hinweis: Feldnummern/Schluessel basieren auf der oeffentlich dokumentierten
// Teildatensatz-Struktur; die konkrete Schluesselnotation (B:N, BRUST:N, O:N)
// ist an den IQTIG-Konventionen orientiert.
// =============================================================================

Logical: IQTIGMammachirurgie181
Id: iqtig-mammachirurgie-181
Title: "IQTIG QS 18.1 Mammachirurgie (Logical Model)"
Description: """Logisches Modell des IQTIG-Datensatzes fuer das QS-Verfahren 18.1 Mammachirurgie
(Spezifikation 2024 V05).

Der Datensatz besteht aus drei Teildatensaetzen:
- Teildatensatz Basis (B): Patienten- und Falldaten
- Teildatensatz Brust (BRUST): Brustspezifische Diagnose- und Befunddaten
- Teildatensatz Operation (O): Operation, Histologie, Pathologie, Resektionsstatus

Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung
einer IQTIG-konformen QS-Meldung aus einem Senologie-FHIR-Bundle. Die
Serialisierung (CSV / XML) ist nicht Bestandteil dieses Modells."""

* ^url = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/iqtig-mammachirurgie-181"
* ^version = "0.1.0"
* ^status = #draft

// =============================================================================
// Teildatensatz Basis (B) -> Patient + Encounter
// Demografische Daten, Fallkennungen, Aufnahme/Entlassung
// =============================================================================
* teildatensatzBasis 1..1 BackboneElement "Teildatensatz Basis (B)" "Patienten- und Falldaten"
  // --- Identifikation / Meldung ---
  * institutionskennzeichen 1..1 string "B:IKNRKH" "Institutionskennzeichen (IKNR) der Einrichtung (9-stellig)"
  * entlassenderStandort 0..1 string "B:ENTLSTANDORT" "Standortkennung des entlassenden Krankenhauses (Standort-ID)"
  * betriebsstaettennummer 0..1 string "B:BSNR" "Betriebsstaettennummer (BSNR) bei ambulanter Leistung"
  * pseudonymId 1..1 string "B:VERSICHERTENIDNEU" "Patientenpseudonym / Versicherten-ID (pseudonymisiert)"
  * fallId 1..1 string "B:VORGANGSNR" "Vorgangsnummer / Fall-ID (eindeutige Kennung pro Fall)"
  * datensatzVersion 1..1 string "B:DS_VERSION" "Version des Datensatzes (z.B. 18.1_2024_V05)"

  // --- Patient ---
  * geburtsdatum 1..1 date "B:GEBDATUM" "Geburtsdatum der Patientin / des Patienten"
  * geschlecht 1..1 code "B:GESCHLECHT" "Geschlecht: 1=maennlich, 2=weiblich, 8=X, 9=unbestimmt"
  * postleitzahl 0..1 string "B:PLZ" "Postleitzahl des Wohnorts (5-stellig)"

  // --- Aufnahme / Entlassung ---
  * aufnahmedatum 1..1 date "B:AUFNDATUM" "Aufnahmedatum in die behandelnde Einrichtung"
  * aufnahmegrund 0..1 code "B:AUFNGRUND" "Aufnahmegrund nach Paragraph 301 SGB V (4-stellig)"
  * aufnahmeanlass 0..1 code "B:AUFNANLASS" "Aufnahmeanlass: E=Einweisung, N=Notfall, V=Verlegung, G=Geburt, ..."
  * einwilligungDatenuebermittlung 0..1 code "B:EINWLANDESGBA" "Einwilligung zur Datenuebermittlung an Landesstelle/G-BA (0=nein, 1=ja, 9=unbekannt)"
  * entlassungsdatum 1..1 date "B:ENTLDATUM" "Entlassungsdatum aus der Einrichtung"
  * entlassungsgrund 0..1 code "B:ENTLGRUND" "Entlassungs-/Verlegungsgrund nach Paragraph 301 SGB V"

// =============================================================================
// Teildatensatz Brust (BRUST) -> Condition + Observation (Bildgebung, Pathologie)
// Diagnose, Befund, Bildgebung, praeoperative Festlegung
// =============================================================================
* teildatensatzBrust 1..* BackboneElement "Teildatensatz Brust (BRUST)" "Brustspezifische Diagnose- und Befunddaten; ein Eintrag je behandelter Seite"
  * laufendeNummer 1..1 positiveInt "BRUST:LNRBRUST" "Laufende Nummer des Brust-Teildatensatzes (Zuordnung zu Operation)"
  * seitenlokalisation 1..1 code "BRUST:SEITE" "Seitenlokalisation: R=rechts, L=links, B=beidseits"

  // --- Diagnose / Indikation ---
  * indikation 1..1 code "BRUST:INDIKATION" "Indikation des Eingriffs: 1=maligne, 2=DCIS, 3=benigne, 4=Risikoreduktion, 5=Rekonstruktion, 9=sonstige"
  * diagnoseICD 0..1 BackboneElement "BRUST:DIAGICD" "ICD-10-GM-Kodierung der Diagnose"
    * code 1..1 code "Code" "ICD-10-GM-Code (z.B. C50.4)"
    * version 1..1 string "Version" "ICD-10-GM-Version"
  * diagnosedatum 0..1 date "BRUST:DIAGDATUM" "Datum der Erstdiagnose"

  // --- Praetherapeutische Tumorklassifikation ---
  * tumorgroesseKlinisch 0..1 integer "BRUST:TGROESSEKLIN" "Praetherapeutische Tumorgroesse in mm (klinisch/bildgebend)"
  * cT 0..1 string "BRUST:CT" "klinische T-Kategorie"
  * cN 0..1 string "BRUST:CN" "klinische N-Kategorie"
  * cM 0..1 string "BRUST:CM" "klinische M-Kategorie"
  * uiccStadiumKlinisch 0..1 string "BRUST:UICCKLIN" "klinisches UICC-Stadium"

  // --- Bildgebung / Befund ---
  * bildgebendeMethode 0..* code "BRUST:BILDGMETHODE" "Eingesetzte bildgebende Methode: 1=Mammografie, 2=Sonografie, 3=MRT, 4=Tomosynthese, 9=sonstige"
  * birads 0..1 code "BRUST:BIRADS" "BI-RADS-Klassifikation (0-6)"
  * histologischeSicherungPraeop 0..1 code "BRUST:HISTPRAEOP" "Praeoperative histologische Sicherung: 0=nein, 1=Stanzbiopsie, 2=Vakuumbiopsie, 3=FNA, 4=Exzisionsbiopsie, 9=sonstige"
  * befundcode 0..1 code "BRUST:BEFUND" "Praeoperativer Befundcode (Pathologie): B1-B5 analog UK-NHSBSP"

  // --- Praeoperative Festlegung / Therapieplanung ---
  * drahtmarkierung 0..1 code "BRUST:DRAHT" "Praeoperative Drahtmarkierung/Lokalisation: 0=keine, 1=Mammografie, 2=Sonografie, 3=MRT, 9=sonstige"
  * neoadjuvanteTherapie 0..1 code "BRUST:NEOADJ" "Neoadjuvante Therapie erhalten: 0=nein, 1=ja-Chemotherapie, 2=ja-endokrin, 3=ja-Antikoerper, 9=sonstige"
  * tumorkonferenzPraeop 0..1 code "BRUST:TKPRAEOP" "Praetherapeutische Tumorkonferenzempfehlung vorhanden: 0=nein, 1=ja, 9=unbekannt"

// =============================================================================
// Teildatensatz Operation (O) -> Procedure + Specimen + Observations (TNM, R-Status)
// OP-Daten, Histologie, Pathologie, Resektionsstatus, Lymphknotenstatus
// =============================================================================
* teildatensatzOperation 1..* BackboneElement "Teildatensatz Operation (O)" "Daten zur operativen Behandlung; ein Eintrag je Eingriff"
  * laufendeNummer 1..1 positiveInt "O:LNROP" "Laufende Nummer des Operations-Teildatensatzes"
  * bezugLnrBrust 1..1 positiveInt "O:LNRBRUST" "Zuordnung zu einem Brust-Teildatensatz (laufende Nummer)"
  * operationsdatum 1..1 date "O:OPDATUM" "Datum der Operation"
  * seitenlokalisation 1..1 code "O:SEITE" "Seitenlokalisation der Operation: R=rechts, L=links, B=beidseits"

  // --- OPS-Prozeduren ---
  * prozeduren 1..* BackboneElement "O:OPSCHLUESSEL" "OPS-Prozedurenkodes des Eingriffs"
    * code 1..1 code "Code" "OPS-Kode, z.B. 5-870.a1"
    * version 1..1 string "Version" "OPS-Version (z.B. 2024)"

  // --- Operationscharakteristik ---
  * operationsart 1..1 code "O:OPART" "Art des Eingriffs: 1=BET, 2=Mastektomie einfach, 3=Mastektomie hautsparend, 4=Mastektomie nippelsparend, 5=Revision, 6=Wiederaufbau, 9=sonstige"
  * dignitaetIntraop 0..1 code "O:DIGNITAET" "Dignitaet intraoperativ: 1=maligne, 2=benigne, 3=unklar"
  * intraopSchnellschnitt 0..1 code "O:SCHNELLSCHNITT" "Intraoperativer Schnellschnitt durchgefuehrt: 0=nein, 1=ja"
  * intraopPraeparatkontrolle 0..1 code "O:PRAEPKONTROLLE" "Intraoperative Praeparatkontrolle (QI-3): 0=nein, 1=Mammografie, 2=Sonografie, 9=sonstige"

  // --- Histologie / Pathologie ---
  * histologieICDO 0..1 BackboneElement "O:HISTMORPH" "ICD-O-3 Morphologie (Histologietyp)"
    * code 1..1 code "Code" "ICD-O-Morphologie-Code (z.B. 8500/3)"
    * version 1..1 string "Version" "ICD-O-Version"
  * grading 0..1 code "O:GRADING" "Histopathologisches Grading: 1=G1, 2=G2, 3=G3, 4=G4, X=GX"
  * tumorgroesseInvasiv 0..1 integer "O:TGROESSEINV" "Maximaler Durchmesser des invasiven Tumorherdes in mm"
  * tumorgroesseDCIS 0..1 integer "O:TGROESSEDCIS" "Maximaler Durchmesser der DCIS-Komponente in mm"
  * multifokalitaet 0..1 code "O:MULTIFOK" "Multifokalitaet: 0=nein, 1=multifokal, 2=multizentrisch, 9=unbekannt"

  // --- pTNM / Residualstatus ---
  * pT 0..1 string "O:PT" "Pathologische T-Kategorie"
  * pN 0..1 string "O:PN" "Pathologische N-Kategorie"
  * pM 0..1 string "O:PM" "Pathologische M-Kategorie"
  * ySymbol 0..1 code "O:YSYMBOL" "y-Symbol (nach neoadjuvanter Therapie): 0=nein, 1=ja"
  * uiccStadiumPatho 0..1 string "O:UICCPATHO" "Pathologisches UICC-Stadium"
  * l 0..1 code "O:L" "Lymphgefaessinvasion: L0, L1, LX"
  * v 0..1 code "O:V" "Veneninvasion: V0, V1, V2, VX"
  * pn 0..1 code "O:PN_PERI" "Perineurale Invasion: Pn0, Pn1, PnX"
  * residualstatusLokal 0..1 code "O:RSTATUSLOK" "Lokaler Residualstatus: R0, R1, R1is, R1cy, R2, RX"
  * residualstatusGesamt 0..1 code "O:RSTATUSGES" "Gesamtresidualstatus: R0, R1, R2, RX"

  // --- Lymphknoten ---
  * sentinelDurchgefuehrt 0..1 code "O:SENTINEL" "Sentinel-Lymphknoten-Biopsie durchgefuehrt: 0=nein, 1=ja"
  * lkUntersucht 0..1 integer "O:LKUNTERSUCHT" "Anzahl untersuchter Lymphknoten (ohne Sentinel)"
  * lkBefallen 0..1 integer "O:LKBEFALLEN" "Anzahl befallener Lymphknoten (ohne Sentinel)"
  * sentinelLkUntersucht 0..1 integer "O:SLKUNTERSUCHT" "Anzahl untersuchter Sentinel-Lymphknoten"
  * sentinelLkBefallen 0..1 integer "O:SLKBEFALLEN" "Anzahl befallener Sentinel-Lymphknoten"
  * axillaDissektion 0..1 code "O:AXDISSEKTION" "Axilladissektion durchgefuehrt: 0=nein, 1=ja"

  // --- Rezeptorstatus (fuer Modul Mamma / QI) ---
  * hormonrezeptorStatusER 0..1 code "O:ERSTATUS" "Oestrogenrezeptor: P=positiv, N=negativ, U=unbekannt"
  * hormonrezeptorStatusPR 0..1 code "O:PRSTATUS" "Progesteronrezeptor: P=positiv, N=negativ, U=unbekannt"
  * her2Status 0..1 code "O:HER2STATUS" "HER2-Status: P=positiv, N=negativ, U=unbekannt"

  // --- Komplikationen ---
  * komplikationen 0..* BackboneElement "O:KOMPL" "Intra-/postoperative Komplikationen"
    * kuerzel 0..1 code "Kuerzel" "Komplikationskuerzel (z.B. WUH=Wundheilungsstoerung, ABS=Abszess)"
    * icdCode 0..1 code "ICD" "ICD-10-GM-Code der Komplikation (falls vorhanden)"
  * revisionsoperation 0..1 code "O:REVISION" "Revisionsoperation waehrend des Aufenthalts: 0=nein, 1=ja"
