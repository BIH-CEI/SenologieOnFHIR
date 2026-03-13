# S3-Leitlinie v5.0 - Kapitel 4.2: DCIS & Kapitel 4.3: Risikolaesionen

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 96-110
> Kapitelstruktur: 4.2.1 Klinische Praesentation, Risiko und Verlauf | 4.2.2 Operative Therapie | 4.2.3 Radiotherapie | 4.2.4 Antihormonelle Therapie | 4.2.5 Active Surveillance | 4.2.6 Nachsorge beim DCIS | 4.3.1 ADH in Stanz-/Vakuumbiopsie | 4.3.2 LN in Stanz-/Vakuumbiopsie | 4.3.3 FEA in Stanz-/Vakuumbiopsie | 4.3.4 ADH, LN, FEA in offener Biopsie | 4.3.5 Papillom in Stanz-/Vakuumbiopsie | 4.3.6 Papillom in offener Biopsie

---

## 4.2 Duktales Carcinoma in situ (DCIS)

> ICD-10-GM-2025: D05.- Carcinoma in situ der Brustdruese

## 4.2.1 Klinische Praesentation, Risiko und Verlauf beim DCIS

### Empfehlung 4.29

```yaml
id: S3-5.0-4.29
kapitel: "4.2.1"
kapitel_titel: "Klinische Praesentation, Risiko und Verlauf beim DCIS"
empfehlung_nr: "4.29"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  DCIS - Allgemein:
  Bei der Behandlung einer Patientin mit duktalem Carcinoma in situ (DCIS) ohne invasive
  Anteile sollen die Vor- und Nachteile verfuegbarer Therapieformen bzw. deren Kombination
  erlaeutert werden. Dabei soll der relative und absolute Effekt adjuvanter Therapiemassnahmen
  in Bezug auf die lokale Rezidivwahrscheinlichkeit und das Gesamtueberleben dargestellt werden.

datenobjekte:
  - name: "DCIS-Diagnose"
    beschreibung: "Diagnose eines duktalen Carcinoma in situ ohne invasive Anteile"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "D05.1"
      display: "Intraduktales Carcinoma in situ der Brustdruese"
      mapping_quelle: "leitlinie"
      validiert: true
    verpflichtung: "obligat"

  - name: "Invasive Komponente ausgeschlossen"
    beschreibung: "Bestaetigung, dass keine invasiven Anteile vorliegen (reines DCIS)"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Patientenaufklaerung Therapieoptionen"
    beschreibung: "Dokumentation der Aufklaerung ueber Therapieoptionen inkl. relativer/absoluter Effekte"
    datentyp: "boolean / Reference(Consent)"
    verpflichtung: "obligat"
    anmerkung: "Prozedurale Anforderung - keine direkte Abbildung in Pathologie-Profilen"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne"
  element: "Condition.code (D05.1)"
  status: "mapped"
  anmerkung: "DCIS-Diagnose ueber Senologie_Diagnose_Maligne abbildbar (D05 im Scope). Aufklaerungsdokumentation ist prozedural und nicht profiliert."

referenzen:
  s3_literatur: ["314", "315"]
  verwandte_empfehlungen: ["4.30", "4.31", "4.32", "4.33", "4.36"]
```

---

## 4.2.2 Operative Therapie des DCIS

### Empfehlung 4.30

```yaml
id: S3-5.0-4.30
kapitel: "4.2.2"
kapitel_titel: "Operative Therapie des DCIS"
empfehlung_nr: "4.30"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die vollstaendige Exzision ist die therapeutische Basis fuer die Behandlung des DCIS.
  Die Resektionsgrenzen sollten beim reinen DCIS mindestens 2 mm betragen, wenn eine
  adjuvante Radiotherapie angeschlossen wird.

datenobjekte:
  - name: "Operative Therapie DCIS"
    beschreibung: "Art der operativen Therapie (BET oder Mastektomie)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      display: "z.B. 5-870 Brusterhaltende Operation, 5-872 Mastektomie"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Vollstaendige Exzision"
    beschreibung: "Bestaetigung der vollstaendigen Exzision des DCIS"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Resektionsrand-Status DCIS"
    beschreibung: "Minimaler Resektionsrand beim reinen DCIS"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "371487001"
      display: "Surgical margin finding (finding)"
      mapping_quelle: "vorschlag"
    wertebereich: ">= 2 mm (bei geplanter adjuvanter RT)"
    verpflichtung: "obligat"

  - name: "Resektionsrand-Beurteilung"
    beschreibung: "Kategorische Beurteilung R0/R1/R2"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "R0 | R1 | R2"
    verpflichtung: "obligat"

  - name: "DCIS-Groesse"
    beschreibung: "Ausdehnung des DCIS in mm (pathologisch-radiologische Korrelation)"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21889-1"
      display: "Size Tumor"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    anmerkung: "Groesse des DCIS ist fuer TNM-Staging nicht erforderlich, aber klinisch relevant fuer OP-Planung und Risikostratifizierung"

  - name: "Kerngrading DCIS"
    beschreibung: "Nukleaeres Grading des DCIS (low/intermediate/high grade)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "low-grade (G1) | intermediate-grade (G2) | high-grade (G3)"
    verpflichtung: "obligat"
    anmerkung: "Kerngrading ist wichtigster Risikofaktor beim DCIS"

  - name: "Komedotyp-Nekrosen"
    beschreibung: "Vorhandensein von Komedotyp-Nekrosen im DCIS"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "vorhanden | nicht vorhanden"
    verpflichtung: "empfohlen"
    anmerkung: "High-grade DCIS mit extensiven Komedotyp-Nekrosen hat deutlich erhoehtes Rezidivrisiko"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne + Senologie_Pathologie_Befund"
  status: "partial"
  anmerkung: >
    Resektionsrand-Status ist grundsaetzlich modellierbar, aber die DCIS-spezifische
    2-mm-Grenze und die Detailangaben (Kerngrading DCIS, Komedotyp-Nekrosen, DCIS-Groesse)
    fehlen als eigene Observations. Diese sind therapeutisch relevant fuer die
    Entscheidung RT ja/nein und OP-Art.

referenzen:
  s3_literatur: ["337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348"]
  verwandte_empfehlungen: ["4.29", "4.31", "4.32"]
```

### Empfehlung 4.31

```yaml
id: S3-5.0-4.31
kapitel: "4.2.2"
kapitel_titel: "Operative Therapie des DCIS - Axilladissektion"
empfehlung_nr: "4.31"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Eine Axilladissektion soll beim DCIS nicht durchgefuehrt werden. Eine Sentinel-Node-Biopsie
  soll nur durchgefuehrt werden, wenn eine sekundaere Sentinel-Node-Biopsie aus technischen
  Gruenden nicht moeglich ist, z. B. bei Mastektomie.

datenobjekte:
  - name: "Axilladissektion durchgefuehrt"
    beschreibung: "Dokumentation ob Axilladissektion durchgefuehrt (soll NICHT beim reinen DCIS)"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Sentinel-Node-Biopsie durchgefuehrt"
    beschreibung: "Dokumentation ob SLNB durchgefuehrt"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "396487001"
      display: "Sentinel lymph node biopsy (procedure)"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Indikation SLNB bei DCIS"
    beschreibung: "Begruendung fuer SLNB beim DCIS (nur bei Mastektomie / technisch keine sekundaere SLNB moeglich)"
    datentyp: "CodeableConcept"
    wertebereich: "Mastektomie geplant | sekundaere SLNB technisch nicht moeglich"
    verpflichtung: "obligat"
    bedingung: "Nur wenn SLNB durchgefuehrt"

  - name: "Sentinel-Node-Ergebnis"
    beschreibung: "Ergebnis der Sentinellymphknotenbiopsie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "positiv (SLN+) | negativ (SLN-)"
    verpflichtung: "obligat"
    bedingung: "Nur wenn SLNB durchgefuehrt"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund / Procedure"
  status: "partial"
  anmerkung: >
    SLNB als Procedure modellierbar. Die DCIS-spezifische Kontraindikation
    (keine ALND, SLNB nur bei Mastektomie) ist eine klinische Regel, die nicht
    als Constraint im Profil abgebildet ist.

referenzen:
  s3_literatur: ["349", "350", "351", "352", "353"]
  verwandte_empfehlungen: ["4.30"]
```

---

## 4.2.3 Radiotherapie des DCIS

### Empfehlung 4.32

```yaml
id: S3-5.0-4.32
kapitel: "4.2.3"
kapitel_titel: "Radiotherapie des DCIS"
empfehlung_nr: "4.32"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit hohem Lokalrezidivrisiko sollte eine Strahlentherapie angeboten werden.
  Bei Patientinnen mit geringem Lokalrezidivrisiko kann auf eine Strahlentherapie verzichtet werden.

datenobjekte:
  - name: "Lokalrezidivrisiko DCIS"
    beschreibung: "Risikostratifizierung fuer Lokalrezidiv beim DCIS (hoch vs. niedrig)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "hohes Risiko | niedriges Risiko"
    verpflichtung: "obligat"
    anmerkung: >
      Risikofaktoren fuer Lokalrezidiv: Kerngrading (wichtigster Faktor), DCIS-Groesse,
      Komedotyp-Nekrosen, Alter der Patientin (<40 J = hoch), klinisch symptomatisch vs.
      Screening-detektiert, mammographische Dichte

  - name: "Strahlentherapie empfohlen"
    beschreibung: "Indikation zur adjuvanten Strahlentherapie nach BET"
    datentyp: "CodeableConcept"
    wertebereich: "empfohlen | nicht empfohlen | Einzelfallentscheidung"
    verpflichtung: "obligat"
    bedingung: "Nach brusterhaltender Operation"

  - name: "Strahlentherapie durchgefuehrt"
    beschreibung: "Dokumentation ob Bestrahlung tatsaechlich durchgefuehrt"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Procedure (Strahlentherapie)"
  status: "partial"
  anmerkung: >
    Strahlentherapie-Procedure vorhanden. Die DCIS-spezifische Risikostratifizierung
    als Grundlage der Therapieentscheidung ist nicht als eigene Observation modelliert.
    Die Risikofaktoren (Grading, Groesse, Komedotyp-Nekrosen) muessen aus dem
    Pathologie-Befund abgeleitet werden.

referenzen:
  s3_literatur: ["354", "355", "356", "357", "358", "359", "365", "366", "367", "368", "369", "370"]
  verwandte_empfehlungen: ["4.30", "4.33", "4.34", "4.35"]
```

### Empfehlung 4.33

```yaml
id: S3-5.0-4.33
kapitel: "4.2.3"
kapitel_titel: "Radiotherapie des DCIS"
empfehlung_nr: "4.33"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Wenn die Radiotherapie der Brust durchgefuehrt wird, soll diese in Hypofraktionierung
  (Gesamtdosis ca. 40 Gy in ca. 15-16 Fraktionen in ca. 3 bis 5 Wochen) erfolgen.
  Alternativ kann sie in konventioneller Fraktionierung (Gesamtdosis ca. 50 Gy in ca.
  25-28 Fraktionen in ca. 5-6 Wochen) erfolgen.

datenobjekte:
  - name: "Fraktionierungsschema"
    beschreibung: "Art der Fraktionierung (Hypofraktionierung oder konventionell)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Hypofraktionierung | konventionelle Fraktionierung"
    verpflichtung: "obligat"
    bedingung: "Wenn RT durchgefuehrt"

  - name: "Gesamtdosis"
    beschreibung: "Gesamtdosis der Bestrahlung in Gray"
    datentyp: "Quantity (Gy)"
    terminologie:
      system: "UCUM"
      code: "Gy"
      mapping_quelle: "standard"
    wertebereich: "ca. 40 Gy (hypo) | ca. 50 Gy (konventionell)"
    verpflichtung: "obligat"
    bedingung: "Wenn RT durchgefuehrt"

  - name: "Anzahl Fraktionen"
    beschreibung: "Anzahl der Bestrahlungsfraktionen"
    datentyp: "integer"
    wertebereich: "15-16 (hypo) | 25-28 (konventionell)"
    verpflichtung: "obligat"
    bedingung: "Wenn RT durchgefuehrt"

  - name: "Bestrahlungsdauer"
    beschreibung: "Gesamtdauer der Bestrahlungsserie in Wochen"
    datentyp: "Quantity (Wochen)"
    wertebereich: "3-5 Wochen (hypo) | 5-6 Wochen (konventionell)"
    verpflichtung: "empfohlen"
    bedingung: "Wenn RT durchgefuehrt"

fhir_mapping:
  profil: "Procedure (Strahlentherapie) + Extensions"
  element: "EX_Senologie_TotalDoseGy, EX_Senologie_SessionCount"
  status: "partial"
  anmerkung: >
    Gesamtdosis und Fraktionszahl ueber bestehende Extensions modellierbar
    (EX_Senologie_TotalDoseGy, EX_Senologie_SessionCount). Fraktionierungsschema
    als eigenstaendiges Datenobjekt fehlt.

referenzen:
  s3_literatur: ["360", "361", "359"]
  verwandte_empfehlungen: ["4.32", "4.34", "4.35"]
```

### Empfehlung 4.34

```yaml
id: S3-5.0-4.34
kapitel: "4.2.3"
kapitel_titel: "Radiotherapie des DCIS"
empfehlung_nr: "4.34"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei erhoehtem Lokalrezidivrisiko kann eine zusaetzliche Boost-Bestrahlung des
  Tumorbetts zur Senkung des Lokalrezidivrisikos erfolgen.

datenobjekte:
  - name: "Boost-Bestrahlung"
    beschreibung: "Zusaetzliche Boost-Bestrahlung des Tumorbetts"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "durchgefuehrt | nicht durchgefuehrt"
    verpflichtung: "optional"
    bedingung: "Bei erhoehtem Lokalrezidivrisiko"

  - name: "Boost-Dosis"
    beschreibung: "Dosis der Boost-Bestrahlung in Gy"
    datentyp: "Quantity (Gy)"
    verpflichtung: "obligat"
    bedingung: "Wenn Boost durchgefuehrt"

fhir_mapping:
  profil: "Procedure (Strahlentherapie)"
  element: "EX_Senologie_BoostApplied"
  status: "mapped"
  anmerkung: "Boost-Information ueber bestehende Extension EX_Senologie_BoostApplied modellierbar."

referenzen:
  s3_literatur: ["360"]
  verwandte_empfehlungen: ["4.32", "4.33"]
```

### Empfehlung 4.35

```yaml
id: S3-5.0-4.35
kapitel: "4.2.3"
kapitel_titel: "Radiotherapie des DCIS"
empfehlung_nr: "4.35"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "-"
status: "neu 2025"
text: >
  Eine Teilbrustbestrahlung kann bei Erfuellen aller folgenden Kriterien alternativ zur
  Ganzbrustbestrahlung zum Einsatz kommen:
  Alter >= 50 Jahre, DCIS <= 3 cm, G1-2, R0 (>= 5 mm), unifokal / unizentrisch.

datenobjekte:
  - name: "Alter der Patientin"
    beschreibung: "Alter bei Diagnose (Kriterium >= 50 Jahre)"
    datentyp: "Quantity (Jahre)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "30525-0"
      display: "Age"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "DCIS-Groesse fuer TBI-Eignung"
    beschreibung: "Maximale Ausdehnung des DCIS (Kriterium <= 3 cm)"
    datentyp: "Quantity (cm)"
    verpflichtung: "obligat"

  - name: "Kerngrading fuer TBI-Eignung"
    beschreibung: "Nukleaeres Grading des DCIS (Kriterium G1-2)"
    datentyp: "CodeableConcept"
    wertebereich: "G1 | G2"
    verpflichtung: "obligat"

  - name: "Resektionsrand fuer TBI-Eignung"
    beschreibung: "Minimaler Resektionsrand (Kriterium R0 mit >= 5 mm)"
    datentyp: "Quantity (mm)"
    wertebereich: ">= 5 mm"
    verpflichtung: "obligat"

  - name: "Fokalitaet"
    beschreibung: "Uni- vs. Multifokalitaet (Kriterium unifokal/unizentrisch)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "unifokal | unizentrisch | multifokal | multizentrisch"
    verpflichtung: "obligat"

  - name: "Bestrahlungsart"
    beschreibung: "Art der Bestrahlung (Ganzbrustbestrahlung vs. Teilbrustbestrahlung)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Ganzbrustbestrahlung (WBRT) | Teilbrustbestrahlung (PBI/APBI)"
    verpflichtung: "obligat"
    bedingung: "Wenn RT durchgefuehrt"

fhir_mapping:
  profil: "Procedure (Strahlentherapie) + EX_Senologie_RadiationTarget"
  status: "partial"
  anmerkung: >
    Bestrahlungsziel ueber EX_Senologie_RadiationTarget modellierbar. Die Eignungskriterien
    fuer Teilbrustbestrahlung (Alter, Groesse, Grading, Rand, Fokalitaet) sind verteilte
    Datenobjekte, die jeweils aus anderen Profilen stammen. Ein zusammenfassender
    Eignungs-Score oder -Check ist nicht modelliert.

referenzen:
  s3_literatur: ["362", "363", "364", "371"]
  verwandte_empfehlungen: ["4.32", "4.33"]
```

---

## 4.2.4 Antihormonelle Therapie beim DCIS

### Empfehlung 4.36

```yaml
id: S3-5.0-4.36
kapitel: "4.2.4"
kapitel_titel: "Antihormonelle Therapie beim DCIS"
empfehlung_nr: "4.36"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine endokrine Therapie kann zur Praevention eines Zweitkarzinoms beim Oestrogen-Rezeptor-
  positiven DCIS unter Beruecksichtigung einer individuellen Risiko-Nutzen-Bewertung
  durchgefuehrt werden.

datenobjekte:
  - name: "Oestrogenrezeptor-Status DCIS"
    beschreibung: "ER-Status des DCIS (Voraussetzung fuer endokrine Therapie)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85337-4"
      display: "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
    wertebereich: "positiv (>= 1%) | negativ (<1%)"
    verpflichtung: "obligat"
    anmerkung: "ER-Bestimmung ist Voraussetzung fuer endokrine Therapieentscheidung"

  - name: "Endokrine Therapie beim DCIS"
    beschreibung: "Entscheidung fuer/gegen endokrine Therapie"
    datentyp: "CodeableConcept"
    wertebereich: "Tamoxifen 20 mg | Tamoxifen 5 mg | Anastrozol | keine endokrine Therapie"
    verpflichtung: "optional"
    bedingung: "Nur bei ER-positivem DCIS"

  - name: "Menopausenstatus"
    beschreibung: "Menopausenstatus der Patientin (relevant fuer Wirkstoffwahl)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "161712005"
      display: "Menopause, function (observable entity)"
      mapping_quelle: "vorschlag"
    wertebereich: "praemenopausal | postmenopausal"
    verpflichtung: "empfohlen"
    anmerkung: "Anastrozol nur bei postmenopausalen Patientinnen"

  - name: "Risiko-Nutzen-Bewertung"
    beschreibung: "Individuelle Risiko-Nutzen-Bewertung fuer endokrine Therapie"
    datentyp: "string"
    verpflichtung: "empfohlen"
    bedingung: "Bei Entscheidung fuer endokrine Therapie"

fhir_mapping:
  profil: "MedicationStatement / CarePlan"
  status: "gap"
  anmerkung: >
    Die endokrine Therapie beim DCIS ist ein Spezialfall (praeventive Indikation,
    nicht kurativ). Ein DCIS-spezifisches Therapieprofil fehlt. Der ER-Status des
    DCIS ist ueber Senologie_Pathologie_Befund abbildbar.

referenzen:
  s3_literatur: ["372", "373", "374", "375", "376", "377", "378", "379"]
  verwandte_empfehlungen: ["4.29", "4.32"]
```

---

## 4.2.5 Active Surveillance (Verzicht auf Behandlung)

> Hinweis: Kein eigener Empfehlungskasten in v5.0. Die Leitlinie stellt fest, dass mehrere
> Studien (LORIS/UK, LORD/Europa, COMET/USA, LORETTA/Japan) untersuchen, ob eine
> Deeskalation oder reine Ueberwachung bei DCIS mit guenstiger Tumorbiologie moeglich ist.
> Solange die Ergebnisse ausstehen, wird der Verzicht auf Behandlung ausserhalb von Studien
> nicht empfohlen.

```yaml
id: S3-5.0-4.2.5-Hintergrund
kapitel: "4.2.5"
kapitel_titel: "Active Surveillance (Verzicht auf Behandlung)"
typ: "Hintergrundtext (keine formale Empfehlung)"
text: >
  Aufgrund des geringen Risikos fuer die Entwicklung einer invasiven Erkrankung und dem
  damit verbundenen geringen Risiko zu versterben, besteht potenziell beim DCIS die Gefahr
  einer Uebertherapie. Derzeit untersuchen mehrere Studien (LORIS, LORD, COMET, LORETTA),
  ob eine Deeskalation der Behandlung oder lediglich eine Ueberwachung moeglich waere.
  Solange die Ergebnisse ausstehen, wird der Verzicht auf eine Behandlung beim DCIS
  ausserhalb von Studien nicht empfohlen.

datenobjekte:
  - name: "Studienteilnahme Active Surveillance"
    beschreibung: "Teilnahme an einer Active-Surveillance-Studie fuer DCIS (LORIS, LORD, COMET, LORETTA)"
    datentyp: "boolean / Reference(ResearchStudy)"
    verpflichtung: "optional"
    anmerkung: "Prospektives Datenobjekt fuer kuenftige Implementierung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Kein bestehendes Profil. Active Surveillance beim DCIS waere ueber ResearchStudy/ResearchSubject modellierbar."

referenzen:
  s3_literatur: ["380", "381", "382"]
```

---

## 4.2.6 Nachsorge beim DCIS

> Hinweis: Kein eigener Empfehlungskasten, sondern Hintergrundtext in der Leitlinie.

```yaml
id: S3-5.0-4.2.6-Hintergrund
kapitel: "4.2.6"
kapitel_titel: "Nachsorge beim DCIS"
typ: "Hintergrundtext (keine formale Empfehlung)"
text: >
  Die Nachsorge von Patientinnen mit DCIS umfasst eine Anamnese und koerperliche Untersuchung
  alle 6 bis 12 Monate fuer 5 Jahre und dann jaehrlich sowie eine jaehrliche diagnostische
  Mammographie (nach brusterhaltender Operation beidseitig, nach Mastektomie kontralateral).
  Eine ergaenzende Sonographie kann bei dichtem Druesengewebe sinnvoll sein. Bei Patientinnen,
  die brusterhaltend behandelt wurden, sollte die erste Nachsorge-Mammographie 6 bis 12 Monate
  nach Abschluss der Bestrahlung durchgefuehrt werden. Fuer Patientinnen unter Tamoxifentherapie
  wird eine jaehrliche gynaekologische Untersuchung empfohlen. Unter Therapie mit einem
  Aromatasehemmer sollte die Knochendichte bestimmt werden.

datenobjekte:
  - name: "Nachsorge-Intervall"
    beschreibung: "Intervall der Nachsorgeuntersuchungen"
    datentyp: "Quantity (Monate)"
    wertebereich: "6-12 Monate (Jahre 1-5), dann jaehrlich"
    verpflichtung: "obligat"

  - name: "Nachsorge-Mammographie"
    beschreibung: "Jaehrliche diagnostische Mammographie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "71651007"
      display: "Mammography (procedure)"
      mapping_quelle: "standard"
    wertebereich: "beidseitig (nach BET) | kontralateral (nach Mastektomie)"
    verpflichtung: "obligat"

  - name: "Erste Nachsorge-Mammographie nach RT"
    beschreibung: "Zeitpunkt der ersten Mammographie nach Bestrahlung"
    datentyp: "Quantity (Monate)"
    wertebereich: "6-12 Monate nach RT-Abschluss"
    verpflichtung: "empfohlen"
    bedingung: "Nach brusterhaltender Operation mit RT"

  - name: "Gynaekologische Untersuchung"
    beschreibung: "Jaehrliche gynaekologische Untersuchung unter Tamoxifen"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Unter Tamoxifen-Therapie"

  - name: "Knochendichtemessung (DXA)"
    beschreibung: "Knochendichtemessung unter Aromatasehemmer-Therapie"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Unter Aromatasehemmer-Therapie"

fhir_mapping:
  profil: "CarePlan / Encounter (Nachsorge)"
  status: "gap"
  anmerkung: >
    Nachsorge-Schemata sind nicht als FHIR-Profile modelliert. Waere ueber CarePlan
    mit geplanten Activities abbildbar. Mammographie-Befunde ueber DiagnosticReport.

referenzen:
  s3_literatur: ["383"]
  verwandte_empfehlungen: ["4.36"]
```

---

## 4.3 Risikolaesionen

> Vorbemerkung: Risikolaesionen sind benigne Veraenderungen mit unsicherem malignem Potential
> (B3-Laesionen). Sie sind meist klinisch unauffaellig und werden im Screening detektiert.
> Zu den Laesionen mit erhoehtem Risiko zaehlen die atypische duktale Hyperplasie (ADH) und
> das lobulaere Carcinoma in situ (LCIS) mit einem residuellen Lebenszeitrisiko >= 20%.
> Zur Dokumentation hat das ICCR-Konsortium einen einheitlichen Datensatz entwickelt.

### Empfehlung 4.37

```yaml
id: S3-5.0-4.37
kapitel: "4.3"
kapitel_titel: "Risikolaesionen - Allgemein"
empfehlung_nr: "4.37"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Das therapeutische Konzept bei Risikolaesionen soll nach Vorliegen des histologischen
  Befundes aus einer Stanz-/Vakuumbiopsie interdisziplinaer (Radiodiagnostik, Operateur,
  Pathologie) erstellt werden.

datenobjekte:
  - name: "Histologischer Befund Biopsie"
    beschreibung: "Histologischer Befund aus Stanz- oder Vakuumbiopsie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Biopsieart"
    beschreibung: "Art der Biopsie (Stanzbiopsie vs. Vakuumbiopsie)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Stanzbiopsie | Vakuumbiopsie (VAB)"
    verpflichtung: "obligat"

  - name: "B-Klassifikation"
    beschreibung: "B-Klassifikation der Biopsie (B1-B5)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "Lokal (B-Klassifikation)"
      mapping_quelle: "leitlinie"
    wertebereich: "B1 (nicht verwertbar) | B2 (benigne) | B3 (unsicheres malignes Potential) | B4 (malignitaetsverdaechtig) | B5 (maligne)"
    verpflichtung: "obligat"

  - name: "Interdisziplinaere Konferenz"
    beschreibung: "Dokumentation der interdisziplinaeren Besprechung (Radiodiagnostik, Operateur, Pathologie)"
    datentyp: "boolean / Reference(Encounter)"
    verpflichtung: "obligat"
    anmerkung: "Tumorboardbeschluss oder aequivalente interdisziplinaere Konferenz"

  - name: "Pathologisch-radiologische Konkordanz"
    beschreibung: "Beurteilung der Konkordanz zwischen radiologischem und pathologischem Befund"
    datentyp: "CodeableConcept"
    wertebereich: "konkordant | diskordant"
    verpflichtung: "obligat"
    anmerkung: "Diskordanz ist ein eigener Indikator fuer weitergehende Abklaerung"

fhir_mapping:
  profil: "Senologie_Diagnose_Benigne + EX_Senologie_B3LesionDetails"
  element: "Condition.code + Extension"
  status: "partial"
  anmerkung: >
    B3-Diagnose ueber Senologie_Diagnose_Benigne mit Extension ex-senologie-b3-lesion-details
    abbildbar. B-Klassifikation und radiologisch-pathologische Konkordanz fehlen als
    eigenstaendige Datenobjekte. Interdisziplinaere Konferenz nicht modelliert.

referenzen:
  s3_literatur: ["45", "384", "385", "386"]
  verwandte_empfehlungen: ["4.38", "4.39", "4.40", "4.41", "4.42", "4.43"]
```

---

## 4.3.1 Atypische duktale Hyperplasie (ADH) in der Stanz- oder Vakuumbiopsie

### Empfehlung 4.38

```yaml
id: S3-5.0-4.38
kapitel: "4.3.1"
kapitel_titel: "ADH in der Stanz- oder Vakuumbiopsie"
empfehlung_nr: "4.38"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Diagnose einer ADH soll eine offene PE zum Ausschluss einer hoehergradigen
  Laesion durchgefuehrt werden.

datenobjekte:
  - name: "ADH-Diagnose"
    beschreibung: "Diagnose einer atypischen duktalen Hyperplasie in der Biopsie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "427785007"
      display: "Atypical ductal hyperplasia of breast"
      mapping_quelle: "standard"
      validiert: true
    verpflichtung: "obligat"

  - name: "Offene PE indiziert"
    beschreibung: "Indikation zur offenen Probeexzision bei ADH"
    datentyp: "boolean"
    verpflichtung: "obligat"
    anmerkung: "Soll-Empfehlung: offene PE zum Ausschluss DCIS/invasives Karzinom"

  - name: "Offene PE durchgefuehrt"
    beschreibung: "Dokumentation ob offene PE durchgefuehrt"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Ergebnis offene PE"
    beschreibung: "Histologisches Ergebnis der offenen PE (Upgrade ja/nein)"
    datentyp: "CodeableConcept"
    wertebereich: "ADH bestaetigt | Upgrade DCIS | Upgrade invasives Karzinom"
    verpflichtung: "obligat"
    bedingung: "Wenn offene PE durchgefuehrt"

  - name: "Upgrade-Rate ADH"
    beschreibung: "Dokumentation der Upgrade-Rate (28-56% in der Literatur)"
    datentyp: "Quantity (%)"
    verpflichtung: "optional"
    anmerkung: "Qualitaetsindikator, nicht patientenindividuell"

fhir_mapping:
  profil: "Senologie_Diagnose_Benigne + EX_Senologie_B3LesionDetails"
  element: "Condition.code (SNOMED 427785007)"
  status: "partial"
  anmerkung: >
    ADH als B3-Laesion ueber Senologie_Diagnose_Benigne mit Extension modellierbar.
    SNOMED-Code 427785007 ist im ValueSet vs-senologie-diagnose-b3 enthalten.
    Der Workflow (Biopsie -> offene PE -> Upgrade-Ergebnis) ist nicht als
    zusammenhaengender Prozess modelliert.

referenzen:
  s3_literatur: ["387", "388", "389", "390", "391", "392", "393", "394", "395", "396", "397", "398", "399", "400", "401", "402", "403", "404", "405", "406"]
  verwandte_empfehlungen: ["4.37", "4.41"]
```

---

## 4.3.2 Lobulaere Neoplasie (LN) in der Stanz- oder Vakuumbiopsie

### Empfehlung 4.39

```yaml
id: S3-5.0-4.39
kapitel: "4.3.2"
kapitel_titel: "LN in der Stanz- oder Vakuumbiopsie"
empfehlung_nr: "4.39"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei isoliertem oder inzidentellem Befund einer LN (klassische Variante) in der Stanz-
  oder Vakuumbiopsie und Konkordanz mit der Bildgebung kann auf eine weitere bioptische
  Abklaerung verzichtet werden. Bei LN mit erhoehtem Risiko (pleomorphe LN, floride oder
  tumorartige LN, LN mit Komedotypnekrosen) sollte eine Exzision der Veraenderung
  durchgefuehrt werden, ebenso bei Diskordanz zum radiologischen Befund.

datenobjekte:
  - name: "LN-Diagnose"
    beschreibung: "Diagnose einer lobulaeren Neoplasie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "LN-Subtyp"
    beschreibung: "Subtyp der lobulaeren Neoplasie (differenziert Risiko)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: >
      Klassische LN:
        - ALH (atypische lobulaere Hyperplasie) | SNOMED 450697004
        - Klassisches LCIS | SNOMED 444739008
      LN mit erhoehtem Risiko:
        - Pleomorphes LCIS | SNOMED 444591006
        - Florides / tumorartiges LCIS
        - LCIS mit Komedotypnekrosen
    verpflichtung: "obligat"
    anmerkung: >
      Kritische Unterscheidung: Klassische LN = aktive Surveillance moeglich,
      LN mit erhoehtem Risiko = Exzision empfohlen.

  - name: "Radiologisch-pathologische Konkordanz"
    beschreibung: "Beurteilung Konkordanz Bildgebung - Histologie"
    datentyp: "CodeableConcept"
    wertebereich: "konkordant | diskordant"
    verpflichtung: "obligat"
    anmerkung: "Bei Diskordanz: Exzision empfohlen unabhaengig vom LN-Subtyp"

  - name: "Therapeutische Konsequenz"
    beschreibung: "Empfohlenes Vorgehen bei LN in der Biopsie"
    datentyp: "CodeableConcept"
    wertebereich: "Active Surveillance | Exzision | offene Biopsie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Benigne + EX_Senologie_B3LesionDetails"
  element: "Condition.code + Extension"
  status: "partial"
  anmerkung: >
    LN-Subtypen sind im ValueSet vs-senologie-diagnose-b3 enthalten (ALH: 450697004,
    klassisches LCIS: 444739008, pleomorphes LCIS: 444591006). Die Differenzierung
    nach Risiko-Subtypen (floride LN, LN mit Komedotypnekrosen) fehlt im ValueSet.
    Das Datenobjekt "radiologisch-pathologische Konkordanz" ist nicht modelliert.

referenzen:
  s3_literatur: ["384", "387", "408", "409", "410", "411", "412", "413", "414", "415", "416", "417", "418", "419", "420", "421", "422", "423"]
  verwandte_empfehlungen: ["4.37", "4.41"]
```

---

## 4.3.3 Flache Epithelatypie (FEA) in der Stanz- oder Vakuumbiopsie

### Empfehlung 4.40

```yaml
id: S3-5.0-4.40
kapitel: "4.3.3"
kapitel_titel: "FEA in der Stanz- oder Vakuumbiopsie"
empfehlung_nr: "4.40"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Diagnose einer flachen Epithelatypie (FEA) kann auf eine offene PE verzichtet werden,
  wenn die suspekten Verkalkungen mittels Vakuumbiopsie bildgebend bereits vollstaendig oder
  weitestgehend vollstaendig entfernt wurden. Bei radiologisch ausgedehnten begleitenden
  Verkalkungen oder bei Diskordanz zum radiologischen Befund soll eine repraesentative offene
  PE erfolgen.

datenobjekte:
  - name: "FEA-Diagnose"
    beschreibung: "Diagnose einer flachen Epithelatypie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "860895001"
      display: "Flat epithelial atypia of breast"
      mapping_quelle: "standard"
      validiert: true
    verpflichtung: "obligat"

  - name: "Verkalkungen vollstaendig entfernt"
    beschreibung: "Beurteilung ob suspekte Verkalkungen durch VAB vollstaendig entfernt"
    datentyp: "CodeableConcept"
    wertebereich: "vollstaendig entfernt | weitestgehend entfernt | nicht vollstaendig entfernt"
    verpflichtung: "obligat"
    anmerkung: "Basiert auf post-interventioneller Bildgebung"

  - name: "Ausdehnung begleitender Verkalkungen"
    beschreibung: "Radiologische Beurteilung der Ausdehnung residualer Verkalkungen"
    datentyp: "CodeableConcept"
    wertebereich: "keine residualen | begrenzt | ausgedehnt"
    verpflichtung: "obligat"

  - name: "Radiologisch-pathologische Konkordanz"
    beschreibung: "Konkordanz zwischen Bildgebung und Histologie"
    datentyp: "CodeableConcept"
    wertebereich: "konkordant | diskordant"
    verpflichtung: "obligat"

  - name: "Offene PE erforderlich"
    beschreibung: "Indikation zur offenen PE (bei Diskordanz oder ausgedehnten Verkalkungen)"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Benigne + EX_Senologie_B3LesionDetails"
  element: "Condition.code (SNOMED 860895001)"
  status: "partial"
  anmerkung: >
    FEA als B3-Laesion ueber Senologie_Diagnose_Benigne modellierbar. SNOMED-Code
    860895001 ist im ValueSet vs-senologie-diagnose-b3 enthalten. Die Beurteilung
    der Verkalkungsentfernung und radiologisch-pathologischen Konkordanz fehlen als
    eigenstaendige Datenobjekte.

referenzen:
  s3_literatur: ["384", "387", "424", "425", "426", "427", "428", "429", "430", "431", "432", "433", "434"]
  verwandte_empfehlungen: ["4.37", "4.41"]
```

---

## 4.3.4 ADH, LN, FEA in der offenen Biopsie

### Empfehlung 4.41

```yaml
id: S3-5.0-4.41
kapitel: "4.3.4"
kapitel_titel: "ADH, LN, FEA in der offenen Biopsie"
empfehlung_nr: "4.41"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Vorliegen einer klassischen LN oder einer FEA (alleine oder in Kombination mit einem
  invasiven Karzinom) am Resektionsrand ist keine Nachresektion erforderlich. Bei Vorliegen
  einer isolierten ADH am Resektionsrand sollte eine Nachresektion erfolgen. Ebenso sollte
  bei Vorliegen einer LN mit erhoehtem Risiko am Resektionsrand (alleine oder in Kombination
  mit einem invasiven Karzinom) eine Nachresektion erfolgen.

datenobjekte:
  - name: "Risikolaesion am Resektionsrand"
    beschreibung: "Art der Risikolaesion am Resektionsrand der offenen Biopsie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "ADH | klassische LN (ALH/LCIS) | LN mit erhoehtem Risiko | FEA | keine Risikolaesion am Rand"
    verpflichtung: "obligat"
    bedingung: "Nach offener Biopsie/Exzision"

  - name: "Kombination mit invasivem Karzinom"
    beschreibung: "Ob die Risikolaesion in Kombination mit einem invasiven Karzinom vorliegt"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Nachresektion erforderlich"
    beschreibung: "Indikation zur Nachresektion basierend auf Laesionstyp am Rand"
    datentyp: "CodeableConcept"
    wertebereich: "nicht erforderlich (klass. LN/FEA) | empfohlen (ADH, LN mit erhoehtem Risiko)"
    verpflichtung: "obligat"

  - name: "Nachresektion durchgefuehrt"
    beschreibung: "Dokumentation ob Nachresektion durchgefuehrt"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Wenn Nachresektion indiziert"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund + Procedure"
  status: "gap"
  anmerkung: >
    Die differenzierte Beurteilung von Risikolaesionen am Resektionsrand (ADH vs.
    klassische LN vs. LN mit erhoehtem Risiko vs. FEA) mit daraus resultierender
    Nachresektions-Indikation ist nicht modelliert. Erfordert spezifische Observations
    oder Extensions am Pathologie-Befund.

referenzen:
  s3_literatur: ["412", "435", "436", "437", "438"]
  verwandte_empfehlungen: ["4.37", "4.38", "4.39", "4.40"]
```

---

## 4.3.5 Papillom in der Stanz- oder Vakuumbiopsie

### Empfehlung 4.42

```yaml
id: S3-5.0-4.42
kapitel: "4.3.5"
kapitel_titel: "Papillom in der Stanz- oder Vakuumbiopsie"
empfehlung_nr: "4.42"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei histologischer Diagnose eines mittels Bildgebung entdeckten Milchgangspapilloms sollte
  eine Exzision durchgefuehrt werden. Diese kann auch als Vakuum-assistierte Exzision erfolgen,
  sofern keine Atypien vorliegen. Bei Vorliegen einer ADH im Papillom ist eine operative
  Exzision erforderlich.

datenobjekte:
  - name: "Papillom-Diagnose"
    beschreibung: "Histologische Diagnose eines Milchgangspapilloms"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "99571000119102"
      display: "Intraductal papilloma of breast without atypia"
      mapping_quelle: "standard"
      validiert: true
    verpflichtung: "obligat"

  - name: "Papillom-Subtyp"
    beschreibung: "Differenzierung benignes vs. atypisches Papillom"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "standard"
    wertebereich: >
      - Benignes Papillom ohne Atypien | SNOMED 99571000119102
      - Atypisches Papillom (Papillom mit ADH) | SNOMED 1144917006
      - Mikropapillom (<2mm, benigne) | B2-Klassifikation
    verpflichtung: "obligat"

  - name: "Papillomgroesse"
    beschreibung: "Groesse des Papilloms (Mikropapillom <2mm relevant fuer Management)"
    datentyp: "Quantity (mm)"
    verpflichtung: "empfohlen"
    anmerkung: "Mikropapillome <2mm bei vollstaendiger Entfernung: B2-Klassifikation moeglich"

  - name: "Atypien im Papillom"
    beschreibung: "Vorhandensein von Atypien (insb. ADH) im Papillom"
    datentyp: "boolean"
    verpflichtung: "obligat"
    anmerkung: "Bestimmt das therapeutische Vorgehen: operative Exzision obligat bei ADH"

  - name: "Bildgebend detektiert"
    beschreibung: "Papillom mittels Bildgebung detektiert (vs. inzidentell)"
    datentyp: "boolean"
    verpflichtung: "obligat"
    anmerkung: "Radiologisch detektierte Papillome: Exzision empfohlen; inzidentelle: ggf. Verlaufsbeobachtung"

  - name: "Exzisionsart"
    beschreibung: "Art der Exzision (operativ vs. VAB)"
    datentyp: "CodeableConcept"
    wertebereich: "operative Exzision | Vakuum-assistierte Exzision (VAB) | Verlaufsbeobachtung"
    verpflichtung: "obligat"
    anmerkung: "VAB nur bei Papillom ohne Atypien moeglich"

fhir_mapping:
  profil: "Senologie_Diagnose_Benigne + EX_Senologie_B3LesionDetails"
  element: "Condition.code"
  status: "partial"
  anmerkung: >
    Papillom-Diagnosen (ohne/mit Atypien) im ValueSet vs-senologie-diagnose-b3 enthalten
    (SNOMED 99571000119102 und 1144917006). Die Differenzierung nach Groesse (Mikropapillom)
    und Atypie-Status als eigenstaendige Datenobjekte fehlt. Der Management-Workflow
    (Bildgebung -> Biopsie -> Exzisionsentscheidung) ist nicht modelliert.

referenzen:
  s3_literatur: ["384", "388", "431", "439", "440", "441", "442", "443", "444", "445"]
  verwandte_empfehlungen: ["4.37", "4.43"]
```

---

## 4.3.6 Papillom in der offenen Biopsie

### Empfehlung 4.43

```yaml
id: S3-5.0-4.43
kapitel: "4.3.6"
kapitel_titel: "Papillom in der offenen Biopsie"
empfehlung_nr: "4.43"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Nachweis eines Papilloms oder eines Papilloms mit ADH in einer offenen Biopsie ist
  kein weiterer Eingriff erforderlich. Bei Vorliegen von Atypien am Resektionsrand sollte
  eine Nachresektion erfolgen.

datenobjekte:
  - name: "Papillom in offener Biopsie"
    beschreibung: "Befund eines Papilloms in der offenen Biopsie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "standard"
    wertebereich: "Benignes Papillom | Papillom mit ADH"
    verpflichtung: "obligat"

  - name: "Atypien am Resektionsrand"
    beschreibung: "Vorliegen atypischer Veraenderungen am Resektionsrand"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Nachresektion erforderlich"
    beschreibung: "Indikation zur Nachresektion (nur bei Atypien am Rand)"
    datentyp: "CodeableConcept"
    wertebereich: "nicht erforderlich | empfohlen (Atypien am Rand)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Benigne + Senologie_Pathologie_Befund"
  status: "partial"
  anmerkung: >
    Papillom-Befund modellierbar. Die spezifische Beurteilung von Atypien am
    Resektionsrand mit Nachresektionsindikation fehlt als eigenes Datenobjekt.

referenzen:
  s3_literatur: ["446", "447"]
  verwandte_empfehlungen: ["4.42", "4.41"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 4.2 und 4.3

### DCIS (Kapitel 4.2)

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.29 | DCIS-Diagnose / Aufklaerung | mapped | DCIS-Diagnose ueber Senologie_Diagnose_Maligne (D05) abbildbar |
| 4.30 | OP-Therapie DCIS / Resektionsrand | partial | DCIS-spezifische Observations: Kerngrading, Komedotyp-Nekrosen, DCIS-Groesse, 2mm-Resektionsrand |
| 4.31 | Axilladissektion / SLNB beim DCIS | partial | SLNB-Indikation beim DCIS als klinische Regel nicht profiliert |
| 4.32 | Radiotherapie-Indikation (Risikostratifizierung) | partial | Lokalrezidivrisiko-Score/Stratifizierung als Observation fehlt |
| 4.33 | Fraktionierungsschema RT | partial | Fraktionierungsschema als eigenes Datenobjekt fehlt (Dosis/Fraktionen vorhanden) |
| 4.34 | Boost-Bestrahlung | mapped | Ueber EX_Senologie_BoostApplied abbildbar |
| 4.35 | Teilbrustbestrahlung (Eignungskriterien) | partial | Eignungskriterienpruefung nicht als Composite modelliert |
| 4.36 | Antihormonelle Therapie DCIS | **gap** | DCIS-spezifisches Therapieprofil fehlt (praeventive endokrine Therapie) |
| 4.2.5 | Active Surveillance | **gap** | ResearchStudy/ResearchSubject fuer DCIS-Studien nicht modelliert |
| 4.2.6 | Nachsorge DCIS | **gap** | Nachsorge-CarePlan fehlt |

### Risikolaesionen (Kapitel 4.3)

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.37 | Interdisziplinaeres Konzept B3 | partial | B-Klassifikation, radiolog.-patholog. Konkordanz fehlen als Datenobjekte |
| 4.38 | ADH in Stanzbiopsie | partial | ADH im VS vorhanden; Upgrade-Workflow (Biopsie->offene PE->Ergebnis) fehlt |
| 4.39 | LN in Stanzbiopsie | partial | LN-Subtypen teilweise im VS; floride LN / LN mit Komedotypnekrosen fehlen |
| 4.40 | FEA in Stanzbiopsie | partial | FEA im VS vorhanden; Verkalkungsbeurteilung/-entfernung fehlt |
| 4.41 | ADH/LN/FEA in offener Biopsie | **gap** | Differenzierte Resektionsrand-Beurteilung fuer Risikolaesionen fehlt |
| 4.42 | Papillom in Stanzbiopsie | partial | Papillom im VS; Groesse/Atypie-Differenzierung fehlt als Datenobjekt |
| 4.43 | Papillom in offener Biopsie | partial | Atypien am Resektionsrand nicht als eigenes Element |

### Uebergreifende Gaps

| Gap-Kategorie | Beschreibung | Betroffene Empfehlungen | Prioritaet |
|--------------|-------------|------------------------|-----------|
| **DCIS-Pathologie-Details** | Kerngrading DCIS, Komedotyp-Nekrosen, DCIS-Groesse als eigene Observations | 4.30, 4.32, 4.35 | Hoch |
| **Radiologisch-pathologische Konkordanz** | Fehlende Observation fuer Konkordanzbeurteilung bei B3-Laesionen | 4.37, 4.39, 4.40 | Hoch |
| **B-Klassifikation** | Fehlende formale Abbildung der B-Klassifikation (B1-B5) | 4.37 | Hoch |
| **Risikolaesion am Resektionsrand** | Differenzierte Beurteilung Resektionsrand bei Risikolaesionen | 4.41, 4.43 | Mittel |
| **LN-Subtyp-Erweiterung** | ValueSet vs-senologie-diagnose-b3 um floride LN, LN mit Komedotypnekrosen erweitern | 4.39 | Mittel |
| **DCIS-Nachsorge** | CarePlan fuer DCIS-spezifische Nachsorge | 4.2.6 | Niedrig |
| **Endokrine Therapie DCIS** | Praeventives Therapieprofil (Tamoxifen/Anastrozol beim DCIS) | 4.36 | Niedrig |
| **Active Surveillance DCIS** | ResearchStudy-Modellierung fuer laufende Studien | 4.2.5 | Niedrig (prospektiv) |
