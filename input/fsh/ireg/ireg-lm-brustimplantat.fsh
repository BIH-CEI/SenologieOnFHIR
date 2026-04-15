// =============================================================================
// IRegG Brustimplantat Logical Model (V4.1.1)
//
// Logisches Modell der GEMeldung fuer Brustimplantate gemaess
// IRegD XML-Spezifikation V4.1.1. Bildet nur den Brustimplantat-Anteil
// der IRegG-Meldung ab (keine Endoprothesen, keine Aortenklappen).
//
// Dient als StructureMap-Target fuer die Transformation von FHIR-Ressourcen
// in IRegG-XML-Nachrichten.
//
// Quelle: /implantateregister/reference/xsd/V4.1.1/
// =============================================================================

Logical: IRegBrustimplantatMeldung
Id: ireg-brustimplantat-meldung
Title: "IRegG Brustimplantat Meldung (Logical Model)"
Description: """Logisches Modell der GEMeldung fuer Brustimplantate gemaess IRegD XML-Spezifikation V4.1.1.

Dieses Modell bildet die Hierarchie der XML-Nachricht ab, beschraenkt auf den
Brustimplantat-Anteil (ohne Endoprothese und Aortenklappe). Es dient als
StructureMap-Target fuer die Erzeugung von IRegG-XML-Meldungen aus FHIR-Ressourcen.

Mapping-Uebersicht:
- Meldung (MEL_*) -> MessageHeader + Organization
- Fall (FAL_*) -> Encounter
- PatientenaufnahmeBrustimplantat (PAT_* + PAB_*) -> Patient + Observations
- Operation (OPE_* + OBI_*) -> Procedure
- Artikelidentifikation (ARI_* + ARB_* + ABI_*) -> Device
- Zubehoer (ZUB_* + ZBI_*) -> Device
- Entlassung (ENT_* + DBI_*) -> Encounter.hospitalization + Condition"""

* ^url = "http://fhir.bih-charite.de/kds-senologie/StructureDefinition/ireg-brustimplantat-meldung"
* ^version = "0.1.0"
* ^status = #draft

// =============================================================================
// Meldung (MeldungBasis) -> MessageHeader + Organization
// =============================================================================
* meldung 1..1 BackboneElement "Meldung" "Meldungskopf einer GEMeldung"
  * idEinrichtung 1..1 string "MEL_IrdIdGesundheitseinrichtung" "IRD-GE-Kennung (Format: IRD-GE-[0-9]{8})"
  * standortId 0..1 string "MEL_StandortId" "Standort-ID"
  * bsnr 0..1 string "MEL_Bsnr" "Betriebsstaettennummer (BSNR)"
  * irdSpezVersion 1..1 string "MEL_IrdSpezVersion" "Version der IRD-Spezifikation (Format: N.N.N)"
  * swName 1..1 string "MEL_SwName" "Name der Software (max. 120 Zeichen)"
  * swHersteller 1..1 string "MEL_SwHersteller" "Name des Software-Herstellers (max. 120 Zeichen)"
  * swVersion 1..1 string "MEL_SwVersion" "Version der Software (max. 120 Zeichen)"

// =============================================================================
// Fall (FallBasis) -> Encounter
// =============================================================================
* fall 1..1 BackboneElement "Fall" "Behandlungsfall"
  * aufnahmedatum 1..1 date "FAL_Aufnahmedatum" "Aufnahmedatum"
  * artAufenthaltSchluessel 1..1 code "FAL_ArtAufenthaltSchluessel" "Art des Aufenthalts (enum_0065)"
  * transfernummer 1..1 string "FAL_Transfernummer" "Transfernummer der Vertrauensstelle (64-stellig, [a-z0-9]{64})"
  * datumZeitSatzErstellung 1..1 dateTime "FAL_DatumZeitSatzErstellung" "Zeitstempel der Datensatzerstellung"
  * versionsnummer 0..1 string "FAL_Versionsnummer" "Versionsnummer des Datensatzes (max. 10 Zeichen)"

// --- Ausloeser -> Procedure.code ---
  * ausloeser 0..* BackboneElement "Ausloeser" "Ausloesende OPS-Prozedur"
    * prozedurenSchluessel 1..1 string "ALR_ProzedurenSchluessel" "OPS-Kode (Format: [135689]-[0-9]{2}[a-zA-Z0-9](.[a-zA-Z0-9]{1,2})*(:[RLB])?)"

// =============================================================================
// Patientenaufnahme (PatientenaufnahmeBasis) -> Patient + Observations
// =============================================================================
  * patientenaufnahme 1..1 BackboneElement "Patientenaufnahme" "Demografische und klinische Patientendaten bei Aufnahme"
    // --- PAT_* Basisdaten ---
    * alter 1..1 integer "PAT_Alter" "Alter in Jahren"
    * groesse 0..1 integer "PAT_Groesse" "Koerpergroesse in cm"
    * gewicht 0..1 integer "PAT_Gewicht" "Koerpergewicht in kg"
    * geschlechtSchluessel 1..1 code "PAT_GeschlechtSchluessel" "Geschlecht (enum_0070)"

    // --- PAB_* Brustimplantat-spezifisch ---
    * brustimplantat 1..1 BackboneElement "PatientenaufnahmeBrustimplantat" "Brustimplantat-spezifische Patientendaten bei Aufnahme"
      * autoimmunerkrankungSchluessel 1..1 code "PAB_AutoimmunerkrankungSchluessel" "Autoimmunerkrankung (enum_0122)"
      * verlaufAutoimmunerkrankungSchluessel 0..1 code "PAB_VerlaufAutoimmunerkrankungSchluessel" "Verlauf der Autoimmunerkrankung seit Implantation (enum_0123)"
      * geschlechtGeburtSchluessel 0..1 code "PAB_GeschlechtGeburtSchluessel" "Biologisches Geschlecht bei Geburt (enum_0170)"

// =============================================================================
// Operation (OperationBasis + OperationBrustimplantat) -> Procedure
// =============================================================================
  * operation 1..* BackboneElement "Operation" "Operativer Eingriff"
    // --- OPE_* Basis ---
    * laufendeNummer 1..1 positiveInt "OPE_LaufendeNummer" "Sequenznummer der Operation (1-999)"
    * datum 1..1 date "OPE_Datum" "Operationsdatum"
    * seitenLokalisationSchluessel 0..1 code "OPE_SeitenLokalisationSchluessel" "Seitenlokalisation (enum_0050)"
    * asaSchluessel 1..1 code "OPE_AsaSchluessel" "ASA-Klassifikation (enum_0044)"
    * implantattypSchluessel 1..1 code "OPE_ImplantattypSchluessel" "Implantattyp (enum_0080)"

    // --- OBI_* Brustimplantat-spezifische Operationsdaten ---
    * operationBrustimplantat 1..1 BackboneElement "OperationBrustimplantat" "Brustimplantat-spezifische Angaben zum Eingriff"
      * artEingriffSchluessel 1..1 code "OBI_ArtEingriffSchluessel" "Art des Eingriffs (enum_0100)"
      // choice: GrundPrimaerEingriff | GrundAustausch | GrundRevisionExplantation
      * grundPrimaerEingriffSchluessel 0..1 code "OBI_GrundPrimaerEingriffSchluessel" "Grund des Primaereingriffs (enum_0102)"
      * grundAustauschSchluessel 0..1 code "OBI_GrundAustauschSchluessel" "Grund der Revision/Austausch (enum_0104)"
      * grundRevisionExplantationSchluessel 0..1 code "OBI_GrundRevisionExplantationSchluessel" "Grund der Explantation (enum_0106)"
      * lageSchluessel 0..1 code "OBI_LageSchluessel" "Lage des neuen Implantats (enum_0112)"
      * zugangSchluessel 0..1 code "OBI_ZugangSchluessel" "Operationszugang (enum_0118)"
      * entfernungAdmNetzSchluessel 0..1 code "OBI_EntfernungAdmNetzSchluessel" "Entfernung des ADM/Netzes (enum_0114)"
      * verfahrenswechselSchluessel 0..1 code "OBI_VerfahrenswechselSchluessel" "Verfahrenswechsel (enum_0111)"

      // --- Vorbehandlung BI ---
      * vorbehandlung 0..* BackboneElement "VorbehandlungBrustimplantat" "Brustimplantat-spezifische Vorbehandlung"
        // choice: BehandlungLokal | BehandlungSystemisch
        * behandlungLokalSchluessel 0..1 code "VBI_BehandlungLokalSchluessel" "Lokale Vorbehandlung (enum_0110)"
        * behandlungSystemischSchluessel 0..1 code "VBI_BehandlungSystemischSchluessel" "Systemische Vorbehandlung (enum_0113)"

      // --- Massnahme BI ---
      * massnahme 0..* BackboneElement "MassnahmeBrustimplantat" "Brustimplantat-spezifische Massnahme"
        * massnahmeSchluessel 1..1 code "MAB_MassnahmeSchluessel" "Operationsmassnahme (enum_0116)"

      // --- Operationsdetail BI ---
      * operationsdetail 0..* BackboneElement "OperationsdetailBrustimplantat" "Brustimplantat-spezifische Operationsdetails"
        // choice: PrimaerEingriff | Austausch | Revision
        * operationsdetailPrimaerEingriffSchluessel 0..1 code "ODB_OperationsdetailPrimaerEingriffSchluessel" "Operationsdetail Primaereingriff (enum_0103)"
        * operationsdetailAustauschSchluessel 0..1 code "ODB_OperationsdetailAustauschSchluessel" "Operationsdetail Austausch (enum_0105)"
        * operationsdetailRevisionSchluessel 0..1 code "ODB_OperationsdetailRevisionSchluessel" "Operationsdetail Revision (enum_0107)"

      // --- Befund BI ---
      * befund 0..* BackboneElement "BefundBrustimplantat" "Befund bei Revision/Explantation"
        // choice: Befund | BefundAustausch
        * befundSchluessel 0..1 code "BEB_BefundSchluessel" "Befund bei Revision/Explantation (enum_0121)"
        * befundAustauschSchluessel 0..1 code "BEB_BefundAustauschSchluessel" "Befund bei Austausch Expander gegen Implantat (enum_0120)"

      // --- Prozedurenschluessel BI ---
      * prozedurenSchluessel 0..* BackboneElement "ProzedurenSchluesselBrustimplantat" "OPS-Kodes fuer den Brustimplantat-Eingriff"
        * opsKode 1..1 string "PBI_ProzedurenSchluessel" "OPS-Kode"

// =============================================================================
// Artikelidentifikation -> Device
// =============================================================================
    * artikelidentifikation 0..* BackboneElement "Artikelidentifikation" "Implantierter/explantierter Artikel"
      // --- ARI_* Identifikation ---
      * laufendeNummer 1..1 positiveInt "ARI_LaufendeNummer" "Sequenznummer des Artikels (1-999)"
      * irdNummer 0..1 string "ARI_IrdNummer" "IRD-Artikelnummer aus der Produktdatenbank (max. 16 Zeichen)"
      * artikelkennzeichen 0..1 string "ARI_Artikelkennzeichen" "UDI oder herstellerspezifische REF/Katalognummer (max. 20 Zeichen)"
      * artikelkennzeichenUnbekannt 0..1 integer "ARI_ArtikelkennzeichenUnbekannt" "Artikelkennzeichen ist unbekannt (Wert 1)"
      * kennzeichenTypSchluessel 0..1 code "ARI_KennzeichenTypSchluessel" "Typ des Artikelkennzeichens: UDI oder REF (enum_0068)"
      * sonderstatusJNSchluessel 0..1 code "ARI_SonderstatusJNSchluessel" "Sonderzulassung / Spezialanfertigung (enum_0060)"
      * artikelArtSchluessel 0..1 code "ARI_ArtikelArtSchluessel" "Implantat/Explantat (enum_0067)"
      * artikelArtFunktionSchluessel 0..1 code "ARI_ArtikelArtFunktionSchluessel" "Implantat/Explantat Funktion (enum_0071)"

      // --- ARB_* Artikelbeschreibung ---
      * artikelbeschreibung 1..1 BackboneElement "Artikelbeschreibung" "Beschreibende Daten zum Artikel"
        * lotNummer 0..1 string "ARB_LotNummer" "Chargen-/LOT-Nummer (max. 20 Zeichen)"
        * lotNummerUnbekannt 0..1 integer "ARB_LotNummerUnbekannt" "Chargen-/LOT-Nummer ist unbekannt (Wert 1)"
        * serienNummer 0..1 string "ARB_SerienNummer" "Seriennummer (max. 20 Zeichen)"
        * serienNummerUnbekannt 0..1 integer "ARB_SerienNummerUnbekannt" "Seriennummer ist unbekannt (Wert 1)"
        * datumVerfall 0..1 string "ARB_DatumVerfall" "Verfalldatum (max. 20 Zeichen)"
        * datumVerfallUnbekannt 0..1 integer "ARB_DatumVerfallUnbekannt" "Verfalldatum ist unbekannt (Wert 1)"
        * artikelbezeichnung 0..1 string "ARB_Artikelbezeichnung" "Artikelbezeichnung (max. 250 Zeichen)"
        * barcode 0..1 string "ARB_Barcode" "Barcode (max. 250 Zeichen)"
        * datumImplantierungExplantat 0..1 string "ARB_DatumImplantierungExplantat" "Datum der Implantation des vorherigen Implantats (Format: JJJJ[-MM[-TT]])"
        * datumImplantierungExplantatUnbekannt 0..1 integer "ARB_DatumImplantierungExplantatUnbekannt" "Implantationsdatum des vorherigen Implantats unbekannt (Wert 1)"

        // --- ABI_* Brustimplantat-spezifische Artikeldaten ---
        * artikelBrustimplantat 1..1 BackboneElement "ArtikelBrustimplantat" "Brustimplantat-spezifische Artikeleigenschaften"
          // choice: HerstellerSchluessel | HerstellerUnbekannt
          * herstellerSchluessel 0..1 string "ABI_HerstellerSchluessel" "Hersteller (7-stelliger Katalogkode)"
          * herstellerUnbekannt 0..1 integer "ABI_HerstellerUnbekannt" "Hersteller ist unbekannt (Wert 1)"
          * herstellerSonstiger 0..1 string "ABI_HerstellerSonstiger" "Sonstiger Hersteller Freitext (max. 250 Zeichen)"
          * artikelTypSchluessel 1..1 code "ABI_ArtikelTypSchluessel" "Artikeltyp (enum_0190)"
          // choice: FormSchluessel | FormUnbekannt
          * formSchluessel 0..1 code "ABI_FormSchluessel" "Form des Implantats (enum_0126)"
          * formUnbekannt 0..1 integer "ABI_FormUnbekannt" "Form ist unbekannt (Wert 1)"
          // choice: OberflaecheSchluessel | OberflaecheUnbekannt
          * oberflaecheSchluessel 0..1 code "ABI_OberflaecheSchluessel" "Oberflaeche des Implantats (enum_0128)"
          * oberflaecheUnbekannt 0..1 integer "ABI_OberflaecheUnbekannt" "Oberflaeche ist unbekannt (Wert 1)"
          // choice: FuellungSchluessel | FuellungUnbekannt
          * fuellungSchluessel 0..1 code "ABI_FuellungSchluessel" "Fuellung des Implantats (enum_0124)"
          * fuellungUnbekannt 0..1 integer "ABI_FuellungUnbekannt" "Fuellung ist unbekannt (Wert 1)"
          // choice: Volumen | VolumenUnbekannt
          * volumen 0..1 positiveInt "ABI_Volumen" "Volumen in ml (1-99999)"
          * volumenUnbekannt 0..1 integer "ABI_VolumenUnbekannt" "Volumen ist unbekannt (Wert 1)"
          * intraoperativesVolumen 0..1 integer "ABI_IntraoperativesVolumen" "Intraoperatives Volumen in ml (0-99999)"

// =============================================================================
// Zubehoer (ZubehoerBasis + ZubehoerBrustimplantat) -> Device
// =============================================================================
    * zubehoer 0..* BackboneElement "Zubehoer" "Zubehoer (ADM/Netz) zum Eingriff"
      * laufendeNummer 1..1 positiveInt "ZUB_LaufendeNummer" "Sequenznummer des Zubehoers (1-999)"
      * zubehoerArtSchluessel 1..1 code "ZUB_ZubehoerArtSchluessel" "Implantat/Explantat (enum_0069)"
      * artikelNummer 0..1 string "ZUB_ArtikelNummer" "Artikelnummer (max. 20 Zeichen)"
      * artikelNummerUnbekannt 0..1 integer "ZUB_ArtikelNummerUnbekannt" "Artikelnummer ist unbekannt (Wert 1)"
      * lotNummer 0..1 string "ZUB_LotNummer" "Chargen-/LOT-Nummer (max. 20 Zeichen)"
      * lotNummerUnbekannt 0..1 integer "ZUB_LotNummerUnbekannt" "Chargen-/LOT-Nummer ist unbekannt (Wert 1)"
      * serienNummer 0..1 string "ZUB_SerienNummer" "Seriennummer (max. 20 Zeichen)"
      * serienNummerUnbekannt 0..1 integer "ZUB_SerienNummerUnbekannt" "Seriennummer ist unbekannt (Wert 1)"
      * artikelbezeichnung 0..1 string "ZUB_Artikelbezeichnung" "Artikelbezeichnung (max. 250 Zeichen)"

      // --- ZBI_* Brustimplantat-spezifisches Zubehoer ---
      * zubehoerBrustimplantat 0..1 BackboneElement "ZubehoerBrustimplantat" "Brustimplantat-spezifische Zubehoerdaten"
        // choice: HerstellerSchluessel | HerstellerUnbekannt
        * herstellerSchluessel 0..1 code "ZBI_HerstellerSchluessel" "Hersteller (enum_0131)"
        * herstellerUnbekannt 0..1 integer "ZBI_HerstellerUnbekannt" "Hersteller ist unbekannt (Wert 1)"
        * herstellerSonstiger 0..1 string "ZBI_HerstellerSonstiger" "Sonstiger Hersteller Freitext (max. 250 Zeichen)"
        * zubehoerTypSchluessel 1..1 code "ZBI_ZubehoerTypSchluessel" "Zubehoertyp (enum_0191)"

// =============================================================================
// Entlassung (EntlassungBasis + DiagnoseBrustimplantat) -> Encounter + Condition
// =============================================================================
  * entlassung 1..1 BackboneElement "Entlassung" "Entlassungsdaten"
    * datum 1..1 date "ENT_Datum" "Entlassungsdatum"
    * grundSchluessel 0..1 string "ENT_GrundSchluessel" "Entlassungs-/Verlegungsgrund (2-stellig, [0-9]{2})"

    // --- DBI_* Brustimplantat-Diagnosen ---
    * diagnoseBrustimplantat 0..* BackboneElement "DiagnoseBrustimplantat" "Brustimplantat-spezifische Entlassungsdiagnose (ICD-10-GM)"
      * icdSchluessel 1..1 string "DBI_IcdSchluessel" "ICD-10-GM Kode (Format: [a-zA-Z][0-9]{2}(.[0-9]{1,2})?(:[RLB])?)"
