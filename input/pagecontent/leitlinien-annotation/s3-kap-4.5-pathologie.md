# S3-Leitlinie v5.0 - Kapitel 4.5: Pathologie

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 124-144
> Kapitelstruktur: 4.5.1 Allgemeines | 4.5.2 Diagnostik Primärtumor | 4.5.3 Diagnostik Metastase | 4.5.4 Details Biomarker-Diagnostik | 4.5.5 Prognose und Prädiktion | 4.5.6 Molekulares Tumorboard

---

## 4.5.1 Allgemeines

### Empfehlung 4.65

```yaml
id: S3-5.0-4.65
kapitel: "4.5.1"
kapitel_titel: "Allgemeines"
empfehlung_nr: "4.65"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Das Operationsmaterial soll mit Angaben zur Fragestellung und zum klinisch-radiologischen
  Befund, eindeutig topographisch markiert und vollständig an den Pathologen übersendet werden.

datenobjekte:
  - name: "Klinische Fragestellung"
    beschreibung: "Angabe zur klinischen Fragestellung bei Einsendung"
    datentyp: "string"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

  - name: "Klinisch-radiologischer Befund"
    beschreibung: "Zusammenfassung des bildgebenden Befunds als Begleitinformation"
    datentyp: "string | Reference(DiagnosticReport)"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

  - name: "Topographische Markierung"
    beschreibung: "Eindeutige räumliche Markierung des Operationspräparats"
    datentyp: "CodeableConcept"
    terminologie:
      system: "Lokal / Hausspezifisch"
    verpflichtung: "obligat"

  - name: "Vollständigkeit Einsendung"
    beschreibung: "Bestätigung der vollständigen Einsendung"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "DiagnosticReport.extension / ServiceRequest"
  status: "partial"
  anmerkung: "Begleitinformationen zur Einsendung sind nicht vollständig modelliert. Bezug zu ServiceRequest/Auftrag fehlt."

referenzen:
  verwandte_empfehlungen: ["4.66", "4.67", "4.68"]
```

### Empfehlung 4.66

```yaml
id: S3-5.0-4.66
kapitel: "4.5.1"
kapitel_titel: "Allgemeines"
empfehlung_nr: "4.66"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Gewebefixation soll in 10 %igem neutral gepuffertem Formalin erfolgen.
  Auf ein adäquates Volumenverhältnis zwischen Fixans und Gewebe soll geachtet werden
  (optimal: 10fach mehr Fixans im Verhältnis zum Gewebevolumen). Die Fixationsdauer
  soll zwischen 6 h und 72 h betragen. Der Zeitraum zwischen Gewebeentnahme und Fixation
  sollte eine Stunde nicht überschreiten (kalte Ischämiezeit).

datenobjekte:
  - name: "Fixationsmittel"
    beschreibung: "Art des Fixationsmittels (10% neutral gepuffertes Formalin)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "431510009"
      display: "Formalin fixation (procedure)"
    verpflichtung: "obligat"

  - name: "Fixationsdauer"
    beschreibung: "Dauer der Gewebefixation in Stunden"
    datentyp: "Quantity"
    wertebereich: "6-72 h"
    verpflichtung: "obligat"

  - name: "Kalte Ischämiezeit"
    beschreibung: "Zeitraum zwischen Gewebeentnahme und Fixation"
    datentyp: "Quantity"
    wertebereich: "<= 1 h (Soll)"
    verpflichtung: "empfohlen"

  - name: "Volumenverhältnis Fixans/Gewebe"
    beschreibung: "Verhältnis Fixans zu Gewebevolumen"
    datentyp: "Ratio"
    wertebereich: "optimal 10:1"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Präanalytische Angaben zur Gewebefixation sind in keinem bestehenden Profil modelliert. Relevant für Qualitätssicherung der Biomarker-Bestimmung (vgl. 4.76)."

referenzen:
  s3_literatur: ["562", "563"]
  verwandte_empfehlungen: ["4.76"]
```

### Empfehlung 4.67

```yaml
id: S3-5.0-4.67
kapitel: "4.5.1"
kapitel_titel: "Allgemeines"
empfehlung_nr: "4.67"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die intraoperative Schnellschnittuntersuchung soll ausschließlich bei unmittelbarer
  operativer Konsequenz erfolgen.
  Anwendungsgebiete sind:
  - Dignitätsbeurteilung palpabler Herdbefunde >10 mm, wenn eine präoperative Diagnose
    mittels minimal-invasiver Biopsie nicht möglich war
  - Bestimmung des Resektionsrandstatus
  - Beurteilung der Sentinellymphknoten
  Eine Schnellschnittuntersuchung sollte nicht erfolgen bei nicht-palpablen Läsionen
  und minimal-invasiven Biopsien (Stanzbiopsien, Vakuum-assistierte Biopsien).

datenobjekte:
  - name: "Schnellschnittuntersuchung durchgeführt"
    beschreibung: "Ob eine intraoperative Schnellschnittuntersuchung erfolgte"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Indikation Schnellschnitt"
    beschreibung: "Anwendungsgebiet/Indikation der Schnellschnittuntersuchung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "Dignitätsbeurteilung | Resektionsrand | Sentinellymphknoten"
    verpflichtung: "obligat"
    bedingung: "Nur wenn Schnellschnitt durchgeführt"

  - name: "Schnellschnitt-Ergebnis"
    beschreibung: "Befund der Schnellschnittuntersuchung"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"
    bedingung: "Nur wenn Schnellschnitt durchgeführt"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  status: "gap"
  anmerkung: "Intraoperative Schnellschnittuntersuchung nicht als eigenes Element modelliert."

referenzen:
  verwandte_empfehlungen: ["4.68"]
  s3_literatur: ["566", "567"]
```

### Empfehlung 4.69

```yaml
id: S3-5.0-4.69
kapitel: "4.5.1"
kapitel_titel: "Allgemeines"
empfehlung_nr: "4.69"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Lymphknotenstatus: Der Lymphknotenstatus wird anhand der histologischen Untersuchung
  aller entfernten Lymphknoten erhoben.
  Es sollen dabei obligat angegeben werden: Zahl entfernter und befallener Lymphknoten,
  Ausdehnung der größten Tumorabsiedelung, Kapseldurchbruch, pN-Kategorie
  (gemäß aktueller TNM-Klassifikation).
  Ziel der Aufarbeitung ist die Erfassung aller Makrometastasen (> 2,0 mm).

datenobjekte:
  - name: "Anzahl entfernter Lymphknoten"
    beschreibung: "Gesamtzahl aller entfernten Lymphknoten"
    datentyp: "integer"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21894-1"
      display: "Regional lymph nodes examined [#] Specimen"
    verpflichtung: "obligat"

  - name: "Anzahl befallener Lymphknoten"
    beschreibung: "Zahl der Lymphknoten mit Metastasen"
    datentyp: "integer"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21893-3"
      display: "Regional lymph nodes positive [#] Specimen"
    verpflichtung: "obligat"

  - name: "Größte Tumorabsiedelung"
    beschreibung: "Ausdehnung der größten Lymphknotenmetastase in mm"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    verpflichtung: "obligat"

  - name: "Kapseldurchbruch"
    beschreibung: "Extranodale Extension (ENE) ja/nein"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "371153006"
      display: "Extranodal extension of tumor (finding)"
    verpflichtung: "obligat"

  - name: "pN-Kategorie"
    beschreibung: "Pathologische Lymphknoten-Kategorie gemäß TNM"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "pN0 | pN0(i+) | pN1mi | pN1a-c | pN2a-b | pN3a-c | pNX"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund / MII Onkologie TNM"
  element: "Observation (TNM pN)"
  status: "partial"
  anmerkung: "pN-Kategorie über MII-Onkologie-Modul verfügbar. Detailangaben (Kapseldurchbruch, Größe der Metastase) fehlen als eigene Observations."

referenzen:
  s3_literatur: ["559"]
  verwandte_empfehlungen: ["4.77"]
```

---

## 4.5.2 Diagnostik Primärtumor

### Empfehlung 4.70

```yaml
id: S3-5.0-4.70
kapitel: "4.5.2"
kapitel_titel: "Diagnostik Primärtumor"
empfehlung_nr: "4.70"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei allen invasiven Mammakarzinomen sollen folgende Parameter bestimmt werden,
  vorzugsweise bereits an der Stanzbiopsie:
  1. Histologischer Tumortyp gemäß aktueller WHO-Klassifikation (derzeit 5. Auflage)
  2. Histologisches Grading nach Elston und Ellis
  3. Östrogen- und Progesteronrezeptor-Status (ER/PR)
  4. HER2-Status
  5. Ki67-Proliferationsindex
  6. Maximaler Tumordurchmesser (metrisch; nach operativer Entfernung). Bei extensiver
     DCIS-Komponente auch Gesamtausdehnung einschließlich der DCIS-Komponente
  7. Peritumorale Gefäßinvasion (nach operativer Entfernung; gemäß aktueller TNM-Klassifikation)
  8. Resektionsrand-Status (nach operativer Entfernung; gemäß aktueller TNM-Klassifikation)
     sowie minimale Sicherheitsabstände
  9. pTN-Status (lokoregionäre Tumorausbreitung, lokoregionärer Lymphknotenbefall;
     nach operativer Entfernung) gemäß der aktuellen TNM-Klassifikation

datenobjekte:
  - name: "Histologischer Tumortyp"
    beschreibung: "Histologische Klassifikation nach WHO, 5. Auflage"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      display: "z.B. 8500/3 Invasives Karzinom NST, 8520/3 Invasives lobuläres Karzinom"
    verpflichtung: "obligat"

  - name: "Histologisches Grading"
    beschreibung: "Differenzierungsgrad nach Elston und Ellis (Nottingham Grading)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "G1 (gut diff.) | G2 (mäßig diff.) | G3 (schlecht diff.)"
    verpflichtung: "obligat"

  - name: "Östrogenrezeptor-Status (ER)"
    beschreibung: "Immunhistochemischer ER-Status mit Prozent positiver Tumorzellkerne"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85337-4"
      display: "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
    wertebereich: "negativ (<1%) | gering positiv (1-10%) | positiv (>10%)"
    verpflichtung: "obligat"

  - name: "Progesteronrezeptor-Status (PR)"
    beschreibung: "Immunhistochemischer PR-Status mit Prozent positiver Tumorzellkerne"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85339-0"
      display: "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
    wertebereich: "negativ (<1%) | gering positiv (1-10%) | positiv (>10%)"
    verpflichtung: "obligat"

  - name: "HER2-Status"
    beschreibung: "HER2-Rezeptor-Status (IHC und ggf. ISH)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
      display: "HER2 [Presence] in Breast cancer specimen by Immune stain"
    wertebereich: "IHC Score 0 | 1+ | 2+ | 3+ (bei 2+: ISH ergänzen)"
    verpflichtung: "obligat"

  - name: "Ki67-Proliferationsindex"
    beschreibung: "Durchschnittlicher Prozentsatz Ki67-positiver Tumorzellkerne"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85336-6"
      display: "MIB-1 (Ki-67) [Percentile] in Breast cancer specimen by Immune stain"
    verpflichtung: "obligat"

  - name: "Maximaler Tumordurchmesser"
    beschreibung: "Größter Durchmesser des invasiven Tumors in mm"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21889-1"
      display: "Size Tumor"
    verpflichtung: "obligat"
    bedingung: "Nach operativer Entfernung"

  - name: "Peritumorale Gefäßinvasion"
    beschreibung: "Lymph- und/oder Blutgefäßinvasion gemäß TNM"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "V0 | V1 | V2 | L0 | L1"
    verpflichtung: "obligat"
    bedingung: "Nach operativer Entfernung"

  - name: "Resektionsrand-Status"
    beschreibung: "Beurteilung der Schnittränder mit minimalen Sicherheitsabständen"
    datentyp: "CodeableConcept + Quantity (mm)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "R0 (in sano) | R1 (mikroskopisch) | R2 (makroskopisch) + Abstand in mm"
    verpflichtung: "obligat"
    bedingung: "Nach operativer Entfernung"

  - name: "pTN-Status"
    beschreibung: "Pathologische TNM-Klassifikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "pT + pN Kategorien gemäß TNM 8"
    verpflichtung: "obligat"
    bedingung: "Nach operativer Entfernung"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund + MII Onkologie TNM"
  status: "partial"
  anmerkung: >
    Zentrale Empfehlung! Definiert die Pflichtparameter des Pathologie-Befunds.
    Histologischer Tumortyp, Grading, ER/PR, HER2, Ki67 als Observations vorhanden.
    TNM über MII Onkologie-Modul. Resektionsrand-Details und Gefäßinvasion-Details
    als eigenständige Observations noch unvollständig.

referenzen:
  s3_literatur: ["557", "560", "562", "563", "564"]
  ago_kapitel: "Pathologie"
  verwandte_empfehlungen: ["4.72", "4.73", "4.74", "4.77", "4.78", "4.79", "4.80", "4.81", "4.82"]
```

---

## 4.5.3 Diagnostik Metastase

### Empfehlung 4.71

```yaml
id: S3-5.0-4.71
kapitel: "4.5.3"
kapitel_titel: "Diagnostik Metastase"
empfehlung_nr: "4.71"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  An Gewebeproben aus Fernmetastasen sollen ER, PR und HER2 bestimmt werden.
  Weitere molekularpathologische oder immunhistologische Tests [z. B. an Tumorgewebe
  oder zirkulierender Tumor-DNA (ctDNA)] sollten dann durchgeführt werden, wenn das
  Ergebnis den Behandlungsansatz ändert oder wenn die Patientin Zugang zu geeigneten
  Therapiemaßnahmen oder klinischen Studien erhält.

datenobjekte:
  - name: "ER-Status (Metastase)"
    beschreibung: "Östrogenrezeptor-Status an Metastasengewebe"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85337-4"
    verpflichtung: "obligat"
    bedingung: "Bei Fernmetastasen"

  - name: "PR-Status (Metastase)"
    beschreibung: "Progesteronrezeptor-Status an Metastasengewebe"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85339-0"
    verpflichtung: "obligat"
    bedingung: "Bei Fernmetastasen"

  - name: "HER2-Status (Metastase)"
    beschreibung: "HER2-Status an Metastasengewebe"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
    verpflichtung: "obligat"
    bedingung: "Bei Fernmetastasen"

  - name: "Untersuchungsmaterial"
    beschreibung: "Art des Untersuchungsmaterials (Tumorgewebe, Liquid Biopsy/ctDNA, Blutzellen)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "Gewebeprobe Metastase | Liquid Biopsy (ctDNA) | Blutzellen"
    verpflichtung: "obligat"

  - name: "BRCA1/2-Mutationsstatus (gBRCAm)"
    beschreibung: "Keimbahn-BRCA1/2-Mutationsstatus"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
    verpflichtung: "empfohlen"
    bedingung: "Bei HER2-negativem metastasiertem Mammakarzinom"

  - name: "PD-L1-Status"
    beschreibung: "PD-L1-Expression (IC Score und CPS)"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
    verpflichtung: "empfohlen"
    bedingung: "Bei triple-negativem metastasiertem Mammakarzinom"

  - name: "PIK3CA / AKT1 / PTEN / ESR1 Mutationsstatus"
    beschreibung: "Mutationsanalyse therapierelevanter Gene"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
    verpflichtung: "empfohlen"
    bedingung: "Bei ER-positivem, HER2-negativem metastasiertem Mammakarzinom"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund + Senologie_GenExpressionsTest"
  status: "partial"
  anmerkung: >
    Biomarker-Bestimmung an Metastasen erfordert Unterscheidung Primärtumor vs. Metastase
    als Specimen-Kontext. Molekulare Marker (BRCA, PIK3CA etc.) über Genomics Reporting
    IG modellierbar, aber nicht spezifisch im Senologie-Profil vorhanden.

referenzen:
  s3_literatur: ["562", "565", "574", "575", "576"]
  verwandte_empfehlungen: ["4.72", "4.73", "4.75"]
```

---

## 4.5.4 Details Biomarker-Diagnostik

### Empfehlung 4.72

```yaml
id: S3-5.0-4.72
kapitel: "4.5.4"
kapitel_titel: "Details Biomarker-Diagnostik"
empfehlung_nr: "4.72"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Bestimmung des Östrogen- und Progesteronrezeptorstatus (ER/PR) soll immunhistochemisch
  erfolgen. Es soll jeweils der Prozentsatz positiver Tumorzellkerne und die durchschnittliche
  Färbeintensität angegeben werden. Die Bewertung als ER- bzw. PR-positiv erfordert mindestens
  1 % positive Tumorzellkerne. Tumoren mit 1 bis 10% positiven Tumorzellkernen sind als gering
  positiv einzuordnen.

datenobjekte:
  - name: "ER - Prozentsatz positive Tumorzellkerne"
    beschreibung: "Prozentualer Anteil ER-positiver Tumorzellkerne"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85325-9"
      display: "Cells.estrogen receptor/100 cells in Breast cancer specimen by Immune stain"
    verpflichtung: "obligat"

  - name: "ER - Durchschnittliche Färbeintensität"
    beschreibung: "Mittlere Intensität der immunhistochemischen ER-Färbung"
    datentyp: "CodeableConcept"
    wertebereich: "schwach | mäßig | stark"
    verpflichtung: "obligat"

  - name: "ER - Bewertung"
    beschreibung: "Kategorische Bewertung des ER-Status"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "negativ (<1%) | gering positiv (1-10%) | positiv (>10%)"
    verpflichtung: "obligat"

  - name: "PR - Prozentsatz positive Tumorzellkerne"
    beschreibung: "Prozentualer Anteil PR-positiver Tumorzellkerne"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85329-1"
      display: "Cells.progesterone receptor/100 cells in Breast cancer specimen by Immune stain"
    verpflichtung: "obligat"

  - name: "PR - Durchschnittliche Färbeintensität"
    beschreibung: "Mittlere Intensität der immunhistochemischen PR-Färbung"
    datentyp: "CodeableConcept"
    wertebereich: "schwach | mäßig | stark"
    verpflichtung: "obligat"

  - name: "PR - Bewertung"
    beschreibung: "Kategorische Bewertung des PR-Status"
    datentyp: "CodeableConcept"
    wertebereich: "negativ (<1%) | gering positiv (1-10%) | positiv (>10%)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "Observation (contained/referenced)"
  status: "partial"
  anmerkung: >
    ER/PR-Status als Observation grundsätzlich modellierbar. Detailangaben wie
    Färbeintensität und die Dreistufigkeit (negativ/gering positiv/positiv) müssen
    als spezifische Components oder Extensions ergänzt werden.

referenzen:
  s3_literatur: ["563"]
  verwandte_empfehlungen: ["4.70", "4.73"]
```

### Empfehlung 4.73

```yaml
id: S3-5.0-4.73
kapitel: "4.5.4"
kapitel_titel: "Details Biomarker-Diagnostik"
empfehlung_nr: "4.73"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei immunhistochemischer Bestimmung des HER2-Status soll der immunhistochemische Score
  und der den Score-definierende Prozentsatz positiver Tumorzellen entsprechend den
  ASCO/CAP-Empfehlungen angegeben werden: Score 0, Score 1+, Score 2+ oder Score 3+.
  Bei einem immunhistochemischen Score 2+ soll zur Festlegung des HER2-Status eine
  In-situ-Hybridisierung ergänzt werden. Deren Auswertung soll den ASCO/CAP-Empfehlungen folgen.

datenobjekte:
  - name: "HER2 IHC Score"
    beschreibung: "Immunhistochemischer HER2-Score nach ASCO/CAP"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
      display: "HER2 [Presence] in Breast cancer specimen by Immune stain"
    wertebereich: "Score 0 | Score 1+ | Score 2+ | Score 3+"
    verpflichtung: "obligat"

  - name: "HER2 IHC - Prozentsatz positive Tumorzellen"
    beschreibung: "Score-definierender Anteil HER2-positiver Tumorzellen"
    datentyp: "Quantity (%)"
    verpflichtung: "obligat"

  - name: "HER2 ISH-Ergebnis"
    beschreibung: "Ergebnis der In-situ-Hybridisierung (FISH/CISH/SISH)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85318-4"
      display: "HER2 [Presence] in Breast cancer specimen by FISH"
    wertebereich: "amplifiziert | nicht amplifiziert | nicht auswertbar"
    verpflichtung: "obligat"
    bedingung: "Bei IHC Score 2+"

  - name: "HER2 ISH - Ratio HER2/CEP17"
    beschreibung: "Verhältnis HER2-Signale zu CEP17-Signale"
    datentyp: "Ratio"
    verpflichtung: "obligat"
    bedingung: "Bei IHC Score 2+"

  - name: "HER2-Gesamtbewertung"
    beschreibung: "Abschließende HER2-Bewertung (positiv/negativ/HER2-low/HER2-ultralow)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "HER2-positiv (3+ oder 2+/ISH+) | HER2-low (1+ oder 2+/ISH-) | HER2-ultralow (Score 0 mit Membranfärbung) | HER2-negativ (Score 0 ohne Membranfärbung)"
    verpflichtung: "obligat"
    anmerkung: "HER2-low und HER2-ultralow sind therapeutisch relevant für ADC-Therapie (T-DXd)"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  status: "partial"
  anmerkung: >
    HER2-Status als Observation vorhanden, aber die differenzierte Vierstufigkeit
    (positiv/low/ultralow/negativ) gemäß aktueller Klassifikation und die
    ISH-Detailergebnisse (Ratio) müssen ergänzt werden. Therapeutisch hochrelevant
    für ADC-Indikationen (Trastuzumab-Deruxtecan).

referenzen:
  s3_literatur: ["577", "578", "579", "383", "339", "562", "560"]
  ago_kapitel: "Pathologie"
  verwandte_empfehlungen: ["4.70", "4.71", "4.76"]
```

### Empfehlung 4.74

```yaml
id: S3-5.0-4.74
kapitel: "4.5.4"
kapitel_titel: "Details Biomarker-Diagnostik"
empfehlung_nr: "4.74"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei der immunhistochemischen Bestimmung des Ki67-Proliferationsindex soll der
  durchschnittliche Prozentsatz markierter Tumorzellkerne angegeben werden. Der
  Proliferationsindex sollte durch Auszählen oder Bildanalyse bestimmt werden.
  In Fällen, bei denen der exakte Wert für klinische Entscheidungen nicht relevant ist,
  kann auch eine semiquantitative Bestimmung in 5% Schritten erfolgen.

datenobjekte:
  - name: "Ki67-Proliferationsindex"
    beschreibung: "Durchschnittlicher Prozentsatz Ki67-positiver Tumorzellkerne"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85336-6"
      display: "MIB-1 (Ki-67) [Percentile] in Breast cancer specimen by Immune stain"
    verpflichtung: "obligat"

  - name: "Ki67-Bestimmungsmethode"
    beschreibung: "Methode der Ki67-Quantifizierung"
    datentyp: "CodeableConcept"
    wertebereich: "Auszählung (exakt) | Bildanalyse (digital) | semiquantitativ (5%-Schritte)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "Observation.method + Observation.valueQuantity"
  status: "partial"
  anmerkung: "Ki67 als Observation vorhanden, Methode der Bestimmung fehlt als Element."

referenzen:
  s3_literatur: ["570", "571", "581"]
  verwandte_empfehlungen: ["4.70", "4.82"]
```

### Empfehlung 4.75

```yaml
id: S3-5.0-4.75
kapitel: "4.5.4"
kapitel_titel: "Details Biomarker-Diagnostik"
empfehlung_nr: "4.75"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Beim metastasierten triple-negativen Mammakarzinom sollten bei der immunhistochemischen
  PD-L1-Bestimmung der Immunzell-Flächen-Score (Immune Cells in tumor area; IC) sowie der
  Combined Positive Score (CPS)-Score angegeben werden.

datenobjekte:
  - name: "PD-L1 IC Score"
    beschreibung: "Immunzell-Flächen-Score (Immune Cells in tumor area)"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
    wertebereich: "IC Score = (gefärbte inflammatorische Zellen / Tumorfläche) x 100%"
    verpflichtung: "empfohlen"
    bedingung: "Bei metastasiertem TNBC"

  - name: "PD-L1 CPS"
    beschreibung: "Combined Positive Score"
    datentyp: "Quantity (Score)"
    terminologie:
      system: "LOINC"
      version: "2.77"
    wertebereich: "CPS = (gefärbte TC + gefärbte mononukleäre IC / Tumorzellen) x 100"
    verpflichtung: "empfohlen"
    bedingung: "Bei metastasiertem TNBC"

  - name: "PD-L1 Antikörperklon"
    beschreibung: "Verwendeter PD-L1-Antikörperklon (klonspezifische Scoring-Systeme)"
    datentyp: "CodeableConcept"
    wertebereich: "SP142 (Ventana) | 22C3 (Dako) | SP263 (Ventana)"
    verpflichtung: "obligat"
    bedingung: "Bei PD-L1-Bestimmung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    PD-L1-Scoring mit IC und CPS ist nicht im Senologie-Profil modelliert.
    Erfordert spezifische Observation mit Components für IC Score, CPS und Antikörperklon.

referenzen:
  s3_literatur: ["582", "583"]
  verwandte_empfehlungen: ["4.71"]
```

### Empfehlung 4.76

```yaml
id: S3-5.0-4.76
kapitel: "4.5.4"
kapitel_titel: "Details Biomarker-Diagnostik"
empfehlung_nr: "4.76"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei der Bestimmung des ER-, PR-, HER2- und PD-L1-Status sowie des Ki67-Proliferationsindex
  soll die Zuverlässigkeit der eingesetzten Nachweisverfahren sichergestellt sein. Dies
  beinhaltet die interne Testvalidierung, die Verwendung standardisierter Protokolle,
  on slide- und interner Kontrollen sowie die regelmäßige erfolgreiche Teilnahme an
  externen Qualitätssicherungsmaßnahmen.

datenobjekte:
  - name: "Qualitätssicherung Biomarker"
    beschreibung: "Nachweis der Teilnahme an externer Qualitätssicherung (z.B. QuIP)"
    datentyp: "boolean / Reference(Organization)"
    verpflichtung: "obligat"
    anmerkung: "Strukturqualitätsmerkmal, nicht patientenbezogen. Relevant für Zertifizierung."

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Qualitätssicherung ist ein Strukturqualitätsmerkmal auf Einrichtungsebene,
    nicht direkt patientenbezogen. Kann ggf. als Organization-Qualifikation oder
    als Qualitätsindikator (Kapitel 8) modelliert werden.

referenzen:
  s3_literatur: ["562", "563", "571"]
  verwandte_empfehlungen: ["4.72", "4.73", "4.74", "4.75"]
```

---

## 4.5.5 Prognose und Prädiktion

### Empfehlung 4.77

```yaml
id: S3-5.0-4.77
kapitel: "4.5.5"
kapitel_titel: "Prognose und Prädiktion"
empfehlung_nr: "4.77"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Zur Einschätzung der Prognose sollen als Grundlage für die Therapieentscheidung
  beim frühen Mammakarzinom die Tumorgröße - pT (gemäß aktueller TNM-Klassifikation)
  und der Lymphknotenstatus - pN (gemäß aktueller TNM-Klassifikation) herangezogen werden.

datenobjekte:
  - name: "pT-Kategorie"
    beschreibung: "Pathologische Tumorgröße gemäß TNM-Klassifikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "pTis | pT1mi | pT1a-c | pT2 | pT3 | pT4a-d"
    verpflichtung: "obligat"

  - name: "pN-Kategorie"
    beschreibung: "Pathologischer Lymphknotenstatus gemäß TNM-Klassifikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "pN0 | pN1mi | pN1a-c | pN2a-b | pN3a-c"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "MII Onkologie TNM-Klassifikation"
  status: "mapped"
  anmerkung: "Vollständig über MII Onkologie-Modul abgebildet."

referenzen:
  s3_literatur: ["585", "586", "587", "588", "589", "590", "591", "592", "569", "593", "383"]
  verwandte_empfehlungen: ["4.70", "4.78", "4.79", "4.80", "4.81", "4.82"]
```

### Empfehlungen 4.78-4.82 (Prognose-Parameter)

```yaml
# Zusammenfassung der Prognosefaktoren (4.78-4.82)
# Alle: Evidenzbasiert, Empfehlungsgrad A, Starker Konsens, modifiziert 2025

prognosefaktoren_obligat:
  - parameter: "Resektionsrandstatus"
    empfehlung: "S3-5.0-4.78"
    evidenzlevel: "1"
    terminologie: "UICC TNM 8. Auflage"
    fhir_status: "mapped (MII Onkologie)"

  - parameter: "Histologischer Tumortyp"
    empfehlung: "S3-5.0-4.79"
    evidenzlevel: "2"
    terminologie: "ICD-O-3, WHO-Klassifikation 5. Auflage"
    fhir_status: "mapped (MII Onkologie)"

  - parameter: "Histologischer Grad (Grading)"
    empfehlung: "S3-5.0-4.80"
    evidenzlevel: "2"
    terminologie: "Elston/Ellis (Nottingham), SNOMED CT"
    fhir_status: "mapped (MII Onkologie)"

  - parameter: "Peritumorale Gefäßinvasion"
    empfehlung: "S3-5.0-4.81"
    evidenzlevel: "2"
    terminologie: "UICC TNM 8. Auflage (L/V-Klassifikation)"
    fhir_status: "partial"

  - parameter: "Biomarker-definierter Tumortyp"
    empfehlung: "S3-5.0-4.82"
    evidenzlevel: "2"
    terminologie: "ER/PR + HER2 + Ki67 → Luminal A/B, HER2+, Triple-negativ"
    fhir_status: "gap"
    anmerkung: >
      Abgeleiteter Parameter aus ER, PR, HER2, Ki67. Kein eigenständiges Profil-Element.
      Klinisch hochrelevant für Therapieentscheidung.
      Luminal A: ER/PR+ und HER2- und Ki67 niedrig
      Luminal B (HER2-negativ): ER/PR+ und HER2- und Ki67 hoch
      Luminal B (HER2-positiv): ER/PR+ und HER2+ und Ki67 hoch oder niedrig
      HER2-positiv: ER- und PR- und HER2+
      Triple-negativ: ER- und PR- und HER2-
```

### Empfehlung 4.83

```yaml
id: S3-5.0-4.83
kapitel: "4.5.5"
kapitel_titel: "Prognose und Prädiktion"
empfehlung_nr: "4.83"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Zur Einschätzung des Erkrankungsverlaufs und zur Therapieentscheidung sollen
  das Alter und die Komorbidität herangezogen werden.

datenobjekte:
  - name: "Alter der Patientin"
    beschreibung: "Alter bei Diagnose"
    datentyp: "Quantity (Jahre)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "30525-0"
      display: "Age"
    verpflichtung: "obligat"

  - name: "Komorbidität"
    beschreibung: "Relevante Begleiterkrankungen, idealerweise als Score"
    datentyp: "CodeableConcept + integer"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
    wertebereich: "Freitext / Charlson Comorbidity Index / CIRS-G"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Patient (Alter) + Condition (Komorbiditäten)"
  status: "mapped"
  anmerkung: "Alter über Patient-Ressource. Komorbiditäten über Condition-Ressourcen. Komorbidity-Score als eigene Observation möglich."

referenzen:
  s3_literatur: ["383", "339"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 4.5

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.65 | Einsendung Operationsmaterial | partial | ServiceRequest für Pathologie-Auftrag ergänzen |
| 4.66 | Gewebefixation (Präanalytik) | **gap** | Präanalytik-Extension oder Specimen-Profil |
| 4.67 | Schnellschnitt | **gap** | Intraop. Schnellschnitt als Procedure/Observation |
| 4.68 | Kalzifikation-Schnittstufen | **gap** | Specimen-Aufarbeitung |
| 4.69 | Lymphknotenstatus | partial | Detailangaben (Kapseldurchbruch, Größe) fehlen |
| 4.70 | Pflichtparameter Primärtumor | partial | Zentrale Empfehlung - Resektionsrand-Details, Gefäßinvasion ergänzen |
| 4.71 | Biomarker Metastase | partial | Specimen-Kontext (Primärtumor vs. Metastase) + Molekulare Marker |
| 4.72 | ER/PR-Details | partial | Färbeintensität und 3-Stufen-Bewertung ergänzen |
| 4.73 | HER2-Details | partial | IHC/ISH-Details, HER2-low/ultralow-Kategorien |
| 4.74 | Ki67-Details | partial | Bestimmungsmethode ergänzen |
| 4.75 | PD-L1 (IC + CPS) | **gap** | Neue Observation für PD-L1 mit IC/CPS/Antikörperklon |
| 4.76 | Qualitätssicherung | **gap** | Strukturqualität (nicht patientenbezogen) |
| 4.77-4.82 | Prognosefaktoren | mapped/partial | Biomarker-definierter Tumortyp als abgeleiteter Parameter fehlt |
| 4.83 | Alter und Komorbidität | mapped | Charlson/CIRS-G Score optional ergänzen |
