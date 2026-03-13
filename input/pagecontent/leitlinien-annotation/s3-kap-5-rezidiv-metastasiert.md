# S3-Leitlinie v5.0 - Kapitel 5: Das rezidivierte oder metastasierte Mammakarzinom

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 207-264
> Kapitelstruktur: 5.1 Lokoregionales Rezidiv | 5.2 Systemische Therapie metastasiertes MaCa | 5.3 Spezifische Metastasenlokalisationen

---

## 5.1 Das lokale/lokoregionale Rezidiv

### 5.1.1 Definition und Prognose

Hintergrundtext ohne nummerierte Empfehlung. Definiert Lokalrezidiv als Wiederauftreten in ipsilateraler Brust, Thoraxwand, regionaeren Lymphknoten der Axilla, Supra-/Infraklavikularregion, entlang Mammaria-interna-Gefaesse. Prognostische Faktoren: Resektionsstatus, Multifokalitaet, Tumorgroesse, Lokalisation, Fokalitaet, Grading, HR/HER2-Status, krankheitsfreies Intervall, primaerer LK-Status, Vortherapie.

### 5.1.2 Diagnostik des lokalen/lokoregionalen Rezidivs

### Empfehlung 5.1

```yaml
id: S3-5.0-5.1
kapitel: "5.1.2"
kapitel_titel: "Diagnostik des lokalen/lokoregionalen Rezidivs"
empfehlung_nr: "5.1"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "5"
konsensstaerke: "Starker Konsens"
status: "2025"
text: >
  Weitere diagnostische Methoden neben denen im Rahmen der Nachsorge empfohlenen
  sollten bei asymptomatischen Patientinnen nicht durchgefuehrt werden.

datenobjekte:
  - name: "Diagnostische Methode Nachsorge"
    beschreibung: "Art der diagnostischen Untersuchung im Rahmen der Rezidiv-Nachsorge"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"

  - name: "Symptomstatus Patientin"
    beschreibung: "Ob Patientin symptomatisch oder asymptomatisch ist"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "84229001"
      display: "Fatigue (finding)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Nachsorge"
  status: "gap"
  anmerkung: "Nachsorge-spezifisches Profil nicht vorhanden. Diagnostische Massnahmen im Nachsorgekontext nicht modelliert."

referenzen:
  s3_literatur: ["21", "945"]
```

### Empfehlung 5.2

```yaml
id: S3-5.0-5.2
kapitel: "5.1.2"
kapitel_titel: "Diagnostik des lokalen/lokoregionalen Rezidivs"
empfehlung_nr: "5.2"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Fuer die bildgebende Abklaerung bei Verdacht auf ein lokales/lokoregionaeres Rezidiv
  sollen - wie auch in der Diagnostik des primaeren Mammakarzinoms - die Mammographie
  und der Brustultraschall eingesetzt werden.

datenobjekte:
  - name: "Mammographie (Rezidivdiagnostik)"
    beschreibung: "Mammographie zur Abklaerung eines Rezidivverdachts"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "71651007"
      display: "Mammography (procedure)"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Brustultraschall (Rezidivdiagnostik)"
    beschreibung: "Sonographie der Brust zur Abklaerung eines Rezidivverdachts"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "16310003"
      display: "Ultrasonography of breast (procedure)"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Bildgebung"
  status: "gap"
  anmerkung: "Bildgebung im Rezidivkontext nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1114", "1115"]
```

### Empfehlung 5.3

```yaml
id: S3-5.0-5.3
kapitel: "5.1.2"
kapitel_titel: "Diagnostik des lokalen/lokoregionalen Rezidivs"
empfehlung_nr: "5.3"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Brust-MRT sollte eingesetzt werden, wenn mit anderen Methoden im Hinblick
  auf die Risikosituation der Frau keine ausreichend sichere diagnostische Aussage
  getroffen werden kann.

datenobjekte:
  - name: "Brust-MRT (Rezidivdiagnostik)"
    beschreibung: "MRT der Brust bei unklarem Befund"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "241615005"
      display: "Magnetic resonance imaging of breast (procedure)"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "Bei unzureichender diagnostischer Aussage anderer Methoden"

fhir_mapping:
  profil: "Senologie_Bildgebung"
  status: "gap"
  anmerkung: "Siehe 5.2"

referenzen:
  s3_literatur: ["254", "1116", "1117"]
```

### Empfehlung 5.4

```yaml
id: S3-5.0-5.4
kapitel: "5.1.2"
kapitel_titel: "Diagnostik des lokalen/lokoregionalen Rezidivs"
empfehlung_nr: "5.4"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Fuer die histologische Abklaerung eines lokoregionaeren Rezidivs gelten die gleichen
  Vorgehensweisen wie im Kapitel 4.1.

datenobjekte:
  - name: "Histologische Sicherung Rezidiv"
    beschreibung: "Biopsie zur histologischen Abklaerung des Rezidivs analog Primaerdiagnostik"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  status: "partial"
  anmerkung: "Pathologie-Befund existiert, aber Kontext Rezidiv vs. Primaertumor nicht differenziert."

referenzen:
  verwandte_empfehlungen: ["Kapitel 4.1"]
```

### Empfehlung 5.5

```yaml
id: S3-5.0-5.5
kapitel: "5.1.2"
kapitel_titel: "Diagnostik des lokalen/lokoregionalen Rezidivs"
empfehlung_nr: "5.5"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Staginguntersuchungen sollen bei allen PatientInnen mit einem lokoregionaeren
  Rezidiv durchgefuehrt werden. Fuer die Wahl der bildgebenden Verfahren s. Kapitel 4.1.

datenobjekte:
  - name: "Re-Staging bei Rezidiv"
    beschreibung: "Staginguntersuchungen zur Ausbreitungsdiagnostik bei lokoregionaeren Rezidiv"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "254292007"
      display: "Tumor staging (tumor staging)"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne"
  status: "partial"
  anmerkung: "TNM-Staging vorhanden, Re-Staging-Kontext (Zeitpunkt Rezidiv) nicht explizit modelliert."

referenzen:
  s3_literatur: ["261", "1114", "311"]
  verwandte_empfehlungen: ["Kapitel 4.1"]
```

### Empfehlung 5.6

```yaml
id: S3-5.0-5.6
kapitel: "5.1.2"
kapitel_titel: "Diagnostik des lokalen/lokoregionalen Rezidivs"
empfehlung_nr: "5.6"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Ein PET-CT sollte nur eingesetzt werden, wenn mit anderen Methoden bei symptomatischen
  Patientinnen der dringende Verdacht auf eine Fernmetastasierung vorliegt und diese
  Metastasierung nicht sicher nachgewiesen oder ausgeschlossen werden kann.

datenobjekte:
  - name: "PET-CT (Rezidivdiagnostik)"
    beschreibung: "PET-CT bei V.a. Fernmetastasierung und unklarem Befund"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "443897008"
      display: "Combined positron emission tomography and computed tomography (procedure)"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "Symptomatische Patientinnen mit V.a. Fernmetastasierung und unklarem Befund"

fhir_mapping:
  profil: "Senologie_Bildgebung"
  status: "gap"
  anmerkung: "PET-CT nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["261", "311"]
```

### 5.1.3 Therapie des lokalen/lokoregionalen Rezidivs

#### 5.1.3.1 Lokales (intramammäres) Rezidiv

### Empfehlung 5.7

```yaml
id: S3-5.0-5.7
kapitel: "5.1.3.1"
kapitel_titel: "Lokales (intramammäres) Rezidiv"
empfehlung_nr: "5.7"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Nach histologischer Sicherung eines lokoregionaeren Rezidivs soll eine Bestimmung
  von ER, PR und HER2 und ein komplettes Re-Staging erfolgen, um Metastasen
  auszuschliessen und die Planung einer interdisziplinaeren Therapiestrategie zu
  ermoeglichen.
  Bei einem lokal-fortgeschrittenen und inoperablen triple-negativen Rezidiv sollte
  zudem die PD-L1-Testung zur Therapieplanung durchgefuehrt werden.
  Bei einem lokal-fortgeschrittenen und inoperablem HER2-negativen Rezidiv sollte
  zudem die diagnostische BRCA-Keimbahntestung zur Therapieplanung durchgefuehrt werden.

datenobjekte:
  - name: "ER-Status (Rezidiv)"
    beschreibung: "Oestrogenrezeptor-Status am Rezidivgewebe"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85337-4"
      display: "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "PR-Status (Rezidiv)"
    beschreibung: "Progesteronrezeptor-Status am Rezidivgewebe"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85339-0"
      display: "Progesterone receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "HER2-Status (Rezidiv)"
    beschreibung: "HER2-Status am Rezidivgewebe"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
      display: "HER2 [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "PD-L1-Status (Rezidiv)"
    beschreibung: "PD-L1-Expression am Rezidivgewebe (bei TNBC)"
    datentyp: "CodeableConcept + Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "Bei lokal-fortgeschrittenem, inoperablem triple-negativem Rezidiv"

  - name: "BRCA1/2-Keimbahntestung (Rezidiv)"
    beschreibung: "Keimbahn-BRCA1/2-Mutationsanalyse bei HER2-negativem Rezidiv"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "Bei lokal-fortgeschrittenem, inoperablem HER2-negativem Rezidiv"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  status: "partial"
  anmerkung: "Biomarker-Bestimmung am Rezidiv erfordert Specimen-Kontext (Rezidiv vs. Primaertumor). PD-L1 und BRCA-Testung als Gap."

referenzen:
  verwandte_empfehlungen: ["4.71", "4.72", "4.73", "4.75"]
```

### Empfehlung 5.8

```yaml
id: S3-5.0-5.8
kapitel: "5.1.3.1"
kapitel_titel: "Lokales (intramammäres) Rezidiv"
empfehlung_nr: "5.8"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Beim intramammären Rezidiv (DCIS/invasives Karzinom) wird durch die sekundäre
  Mastektomie die höchste lokale Tumorkontrolle erzielt.
  Die Radikalität des operativen Vorgehens beim lokalen und lokoregionären Rezidiv
  beeinflusst ebenso wie beim Primärkarzinom nicht das Überleben der Patientin.

datenobjekte:
  - name: "Operationsart Rezidiv"
    beschreibung: "Art der operativen Therapie des Lokalrezidivs"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Sekundaere Mastektomie | Brusterhaltende Re-Operation"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Operations-Profil vorhanden, Kontext Rezidiv-OP vs. Primaer-OP nicht differenziert."

referenzen:
  s3_literatur: ["1132"]
```

### Empfehlung 5.9

```yaml
id: S3-5.0-5.9
kapitel: "5.1.3.1"
kapitel_titel: "Lokales (intramammäres) Rezidiv"
empfehlung_nr: "5.9"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei guenstiger Ausgangssituation, z. B. DCIS oder invasives Karzinom mit langem
  rezidivfreiem Intervall und fehlendem Hautbefall, kann nach sorgfaeltiger Aufklaerung
  erneut brusterhaltend operiert werden.

datenobjekte:
  - name: "Erneute brusterhaltende Operation"
    beschreibung: "Erneute BET bei guenstiger Ausgangssituation des Rezidivs"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Guenstige Ausgangssituation (DCIS/invasives Ca, langes DFI, kein Hautbefall)"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Siehe 5.8"

referenzen:
  s3_literatur: ["1127", "1128", "1129", "1130", "1131"]
```

### Empfehlung 5.10

```yaml
id: S3-5.0-5.10
kapitel: "5.1.3.1"
kapitel_titel: "Lokales (intramammäres) Rezidiv"
empfehlung_nr: "5.10"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Vor einer erneuten brusterhaltenden Operation sollte die Moeglichkeit einer Re-Bestrahlung
  (Teilbrustbestrahlung) geprueft, in einer interdisziplinaeren Tumorkonferenz diskutiert
  und die Patientin ggf. einem Strahlentherapeuten vorgestellt werden.

datenobjekte:
  - name: "Pruefung Re-Bestrahlung"
    beschreibung: "Evaluation der Re-Bestrahlungsmoeglichkeit vor erneuter BET"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Tumorkonferenz-Beschluss Rezidiv"
    beschreibung: "Interdisziplinaere Tumorkonferenz-Entscheidung zur Rezidivtherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Tumorkonferenz"
  status: "gap"
  anmerkung: "Tumorkonferenz-Profil nicht vorhanden."

referenzen:
  verwandte_empfehlungen: ["5.9"]
```

### Empfehlung 5.11

```yaml
id: S3-5.0-5.11
kapitel: "5.1.3.1"
kapitel_titel: "Lokales (intramammäres) Rezidiv"
empfehlung_nr: "5.11"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei brusterhaltender Operation soll die Patientin auf ein erhoehtes Risiko fuer ein
  erneutes intramammäres Rezidiv hingewiesen werden.

datenobjekte:
  - name: "Aufklaerung Rezidivrisiko"
    beschreibung: "Dokumentation der Aufklaerung ueber erhoehtes Rezidivrisiko bei erneuter BET"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Aufklaerungsdokumentation nicht in FHIR modelliert."
```

#### 5.1.3.2 Lokalrezidiv nach Mastektomie

### Empfehlung 5.12

```yaml
id: S3-5.0-5.12
kapitel: "5.1.3.2"
kapitel_titel: "Lokalrezidiv nach Mastektomie"
empfehlung_nr: "5.12"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "2025"
text: >
  Ein isoliertes Thoraxwandrezidiv soll nach Moeglichkeit operativ vollstaendig (R0)
  entfernt werden. Bei V.a. Befall der Rippen/Interkostalmuskulatur sollte eine
  Fernmetastasierung ausgeschlossen werden und die Therapieentscheidung interdisziplinaer
  mit der Thoraxchirurgie erfolgen.
  Die Moeglichkeit der systemischen, medikamentoesen Therapie mit den Zielen der
  Remissionsbeurteilung und Einschraenkung der operativen Radikalitaet sollen
  praeoperativ interdisziplinaer besprochen werden.

datenobjekte:
  - name: "Resektion Thoraxwandrezidiv"
    beschreibung: "Operative Resektion des Thoraxwandrezidivs mit Ziel R0"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Resektionsstatus Rezidiv"
    beschreibung: "Resektionsstatus der Rezidivoperation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "standard"
    wertebereich: "R0 | R1 | R2"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "R-Status vorhanden, Thoraxwand-spezifischer Kontext fehlt."

referenzen:
  s3_literatur: ["1146", "1147", "1150", "1151"]
```

### Empfehlung 5.13

```yaml
id: S3-5.0-5.13
kapitel: "5.1.3.2"
kapitel_titel: "Lokalrezidiv nach Mastektomie"
empfehlung_nr: "5.13"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei symptomatischem Lokalrezidiv (z.B. Ulzeration, Schmerzen) kann eine lokale
  Therapie (operative Intervention, Radiotherapie) auch bei Vorliegen von Fernmetastasen
  mit dem Ziel der Symptomreduktion erwogen werden.

datenobjekte:
  - name: "Symptomatisches Lokalrezidiv"
    beschreibung: "Symptomatik des Lokalrezidivs (Ulzeration, Schmerzen)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Palliative Lokaltherapie"
    beschreibung: "Lokale Therapie zur Symptomkontrolle bei Fernmetastasierung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Operation | Radiotherapie"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Therapie-Intent (kurativ vs. palliativ) als Differenzierung noetig."
```

#### 5.1.3.3 Axillaeres Lymphknotenrezidiv

### Empfehlung 5.14

```yaml
id: S3-5.0-5.14
kapitel: "5.1.3.3"
kapitel_titel: "Axilläres Lymphknotenrezidiv"
empfehlung_nr: "5.14"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "2025"
text: >
  Im Fall eines axillaeren Lymphknotenrezidivs sollte eine lokale Kontrolle der
  Erkrankung durch erneute operative axillaere Intervention ggf. mit Radiotherapie
  erfolgen.
  Wie bei jedem lokalen/lokoregionären Rezidiv sollte ein komplettes Staging erfolgen.

datenobjekte:
  - name: "Axillaere Re-Intervention"
    beschreibung: "Erneute operative axillaere Intervention bei Lymphknotenrezidiv"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "OP-Profil vorhanden, axillaere Re-Intervention nicht spezifisch."

referenzen:
  s3_literatur: ["1153", "1154", "1155"]
```

#### 5.1.3.4 Medikamentoese Therapie

### Empfehlung 5.15

```yaml
id: S3-5.0-5.15
kapitel: "5.1.3.4"
kapitel_titel: "Medikamentoese Therapie"
empfehlung_nr: "5.15"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Eine Systemtherapie nach R0-Resektion eines lokoregionaeren Rezidivs soll fuer ein
  verlaengertes krankheitsfreies Intervall als auch ein verlaengertes Gesamtueberleben
  erwogen werden.

datenobjekte:
  - name: "Systemtherapie nach Rezidiv-R0"
    beschreibung: "Systemtherapie nach R0-Resektion des lokoregionaeren Rezidivs"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Endokrine Therapie (Rezidiv)"
    beschreibung: "Endokrine Therapie bei HR-positivem Rezidiv"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Tamoxifen (L02BA01) | Aromatasehemmer (L02BG) | Fulvestrant (L02BA03)"
    verpflichtung: "obligat"
    bedingung: "Bei HR-positivem Rezidiv"

  - name: "Anti-HER2-Therapie (Rezidiv)"
    beschreibung: "Anti-HER2-Therapie bei HER2-positivem Rezidiv"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD01"
      display: "Trastuzumab"
      mapping_quelle: "standard"
    verpflichtung: "obligat"
    bedingung: "Bei HER2-positivem Rezidiv"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Systemtherapie-Profil vorhanden, Kontext post-Rezidiv-Resektion nicht spezifisch."

referenzen:
  s3_literatur: ["1156", "1157", "1158", "1159", "1160", "1161", "1162", "1163", "1164"]
```

#### 5.1.3.5 Strahlentherapie

### Empfehlung 5.16

```yaml
id: S3-5.0-5.16
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie - Bestrahlung nach Rezidivoperation"
empfehlung_nr: "5.16"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Eine Bestrahlung nach Rezidivoperation sollte interdisziplinaer diskutiert und
  entschieden werden.
  Eine postoperative Radiotherapie sollte durchgefuehrt werden, wenn keine vorangegangene
  Radiotherapie erfolgt war oder das Lokalrezidiv nicht radikal operiert wurde (R1-2).

datenobjekte:
  - name: "Postoperative Bestrahlung Rezidiv"
    beschreibung: "Indikation zur postoperativen RT nach Rezidivoperation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "Keine Vorbestrahlung oder R1/R2-Resektion"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "RT-Profil vorhanden, Re-Bestrahlung vs. Erstbestrahlung nicht differenziert."
```

### Empfehlung 5.17

```yaml
id: S3-5.0-5.17
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.17"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei inoperablem Lokalrezidiv kann eine palliative Radiotherapie zur Symptomkontrolle
  sinnvoll sein.

datenobjekte:
  - name: "Palliative Radiotherapie Lokalrezidiv"
    beschreibung: "Palliative Bestrahlung bei inoperablem Lokalrezidiv"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "optional"
    bedingung: "Inoperables Lokalrezidiv"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Therapie-Intent (palliativ) als Extension noetig."
```

### Empfehlung 5.18

```yaml
id: S3-5.0-5.18
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.18"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Vorliegen eines intramammären Rezidivs beziehungsweise Thoraxwandrezidivs ohne
  Vorbestrahlung nach brusterhaltender Operation (R0) beziehungsweise nach Mastektomie
  (R0) sollte die Indikation zur adjuvanten Strahlentherapie analog zu den Empfehlungen
  in der Primärsituation erfolgen.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Verweis auf Primaersituation."

referenzen:
  verwandte_empfehlungen: ["Kapitel 4.6 Strahlentherapie"]
```

### Empfehlung 5.19

```yaml
id: S3-5.0-5.19
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.19"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "2025"
text: >
  Bei Vorliegen eines intramammären Rezidivs nach Vorbestrahlung nach brusterhaltender
  Operation (R0) soll die Indikation zur adjuvanten Strahlentherapie interdisziplinaer
  diskutiert werden und kann insbesondere bei Patientinnen ohne gravierende Spaetfolgen
  von der 1. Strahlentherapie gestellt werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Re-Bestrahlung nach Vorbestrahlung, Dokumentation Spaetfolgen fehlt."
```

### Empfehlung 5.20

```yaml
id: S3-5.0-5.20
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.20"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Vorliegen eines Thoraxwandrezidivs nach Vorbestrahlung nach Mastektomie (R0)
  sollte eine erneute Bestrahlungsindikation zur lokalen Kontrolle interdisziplinaer
  diskutiert werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Siehe 5.19"
```

### Empfehlung 5.21

```yaml
id: S3-5.0-5.21
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.21"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei einem Brustwandrezidiv nach primärer Mastektomie mit nachfolgender Strahlentherapie
  nach Resektion des Rezidivs (R0) sollte bei Vorliegen von Risikofaktoren (knappe
  Resektion, rpN+, G3, Lymphgefässinvasion) die Indikation zu einer erneuten adjuvanten
  Strahlentherapie interdisziplinär diskutiert werden. Diese kann bei Patientinnen ohne
  gravierende Spätfolgen von der 1. Strahlentherapie gestellt werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Risikofaktor-basierte Re-Bestrahlungsindikation."
```

### Empfehlung 5.22

```yaml
id: S3-5.0-5.22
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.22"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Fuer Rezidive, die nicht in einem zuvor bestrahlten Bereich liegen und R1/R2-reseziert
  wurden - ohne Moeglichkeit mit vertretbarem Risiko operativ eine R0-Situation zu
  erzeugen -, soll eine zusaetzliche Strahlentherapie in dieser Situation empfohlen werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Bestrahlung bei R1/R2 ohne Vorbestrahlung."
```

### Empfehlung 5.23

```yaml
id: S3-5.0-5.23
kapitel: "5.1.3.5"
kapitel_titel: "Strahlentherapie"
empfehlung_nr: "5.23"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Vorliegen von Rezidiven nach R1/R2-Resektion und erfolgter Vorbestrahlung ohne
  Moeglichkeit, mit vertretbarem Risiko operativ eine R0-Situation zu erzeugen, sollte
  die Indikation zu einer erneuten Strahlentherapie interdisziplinaer diskutiert werden.
  Diese kann bei Patientinnen ohne gravierende Spaetfolgen von der 1. Strahlentherapie
  gestellt werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Re-Bestrahlung bei R1/R2 und Vorbestrahlung."
```

---

## 5.2 Systemische Therapie metastasiertes Mammakarzinom

### 5.2.1 Systemische Therapie HER2-positives Mammakarzinom

### Empfehlung 5.24

```yaml
id: S3-5.0-5.24
kapitel: "5.2.1"
kapitel_titel: "Systemische Therapie HER2-positives Mammakarzinom"
empfehlung_nr: "5.24"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Metastasierte HER2-positive Mammakarzinome sollen, sofern keine kardialen
  Kontraindikationen bestehen, mit einer Anti-HER2-Therapie behandelt werden.

datenobjekte:
  - name: "HER2-Status (Voraussetzung)"
    beschreibung: "HER2-positiver Status als Voraussetzung fuer Anti-HER2-Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
      display: "HER2 [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Kardiale Kontraindikation"
    beschreibung: "Pruefung kardialer Kontraindikationen vor Anti-HER2-Therapie"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Anti-HER2-Therapie"
    beschreibung: "Anti-HER2-gerichtete Therapie bei metastasiertem HER2+ MaCa"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Trastuzumab (L01FD01) | Pertuzumab (L01FD02) |
      Trastuzumab Deruxtecan (L01FD04) | Trastuzumab Emtansin (L01FD03) |
      Tucatinib (L01EH03) | Lapatinib (L01EH01)
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + Extension:therapy-line"
  status: "partial"
  anmerkung: "Systemtherapie-Profil vorhanden. Anti-HER2-Substanzen ueber ATC-Codes abbildbar. Kardiale Kontraindikation als Bedingung nicht modelliert."

referenzen:
  s3_literatur: ["1172", "1173", "1168"]
```

### Empfehlung 5.25

```yaml
id: S3-5.0-5.25
kapitel: "5.2.1"
kapitel_titel: "Systemische Therapie HER2-positives Mammakarzinom"
empfehlung_nr: "5.25"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei einem metastasierten HER2-positiven Mammakarzinom sollte in der Erstlinientherapie
  eine duale Blockade mit Trastuzumab / Pertuzumab und einem Taxan eingesetzt werden.

datenobjekte:
  - name: "Trastuzumab (Erstlinie HER2+)"
    beschreibung: "Trastuzumab in der Erstlinientherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD01"
      display: "Trastuzumab"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Pertuzumab (Erstlinie HER2+)"
    beschreibung: "Pertuzumab in der Erstlinientherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD02"
      display: "Pertuzumab"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Taxan (Erstlinie HER2+)"
    beschreibung: "Taxan-basierte Chemotherapie in Kombination"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Docetaxel (L01CD02) | Paclitaxel (L01CD01)"
    verpflichtung: "empfohlen"

  - name: "Therapielinie"
    beschreibung: "Therapielinie der systemischen Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "Lokal"
      mapping_quelle: "leitlinie"
    wertebereich: "Erstlinie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Extension:therapy-line + Extension:therapy-protocol"
  status: "partial"
  anmerkung: "Therapielinie als Extension vorhanden. Duale Blockade als Protokoll nicht vordefiniert."

referenzen:
  s3_literatur: ["1172", "1168", "1174"]
```

### Empfehlung 5.26

```yaml
id: S3-5.0-5.26
kapitel: "5.2.1"
kapitel_titel: "Systemische Therapie HER2-positives Mammakarzinom"
empfehlung_nr: "5.26"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit einem HER2-positiven metastasierten Mammakarzinom sollte in
  der Zweitlinientherapie bevorzugt eine Therapie mit Trastuzumab-Deruxtecan oder
  alternativ die Kombination Tucatinib + Trastuzumab + Capecitabin eingesetzt werden.

datenobjekte:
  - name: "Trastuzumab Deruxtecan (Zweitlinie HER2+)"
    beschreibung: "T-DXd als bevorzugte Zweitlinientherapie bei HER2+ metastasiert"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD04"
      display: "Trastuzumab deruxtecan"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Tucatinib + Trastuzumab + Capecitabin (Zweitlinie HER2+)"
    beschreibung: "Dreierkombination als Alternative in Zweitlinie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Tucatinib (L01EH03) + Trastuzumab (L01FD01) + Capecitabin (L01BC06)"
    verpflichtung: "empfohlen"

  - name: "Therapielinie"
    beschreibung: "Zweitlinie"
    datentyp: "CodeableConcept"
    wertebereich: "Zweitlinie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Extension:therapy-line + Extension:therapy-protocol"
  status: "partial"
  anmerkung: "Therapielinie vorhanden. Kombinationstherapie-Protokolle nicht vordefiniert."

referenzen:
  s3_literatur: ["1175"]
```

### Empfehlung 5.27

```yaml
id: S3-5.0-5.27
kapitel: "5.2.1"
kapitel_titel: "Systemische Therapie HER2-positives Mammakarzinom"
empfehlung_nr: "5.27"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei einem metastasierten HER2-positiven Mammakarzinom sollte, sofern noch nicht
  angewandt, in der Drittlinientherapie bevorzugt eine Therapie mit Tucatinib +
  Trastuzumab + Capecitabin, T-DXd oder T-DM1 eingesetzt werden.

datenobjekte:
  - name: "Tucatinib (Drittlinie HER2+)"
    beschreibung: "Tucatinib-basierte Drittlinientherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EH03"
      display: "Tucatinib"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Trastuzumab Deruxtecan (Drittlinie HER2+)"
    beschreibung: "T-DXd als Drittlinienoption"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD04"
      display: "Trastuzumab deruxtecan"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Trastuzumab Emtansin (Drittlinie HER2+)"
    beschreibung: "T-DM1 als Drittlinienoption"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD03"
      display: "Trastuzumab emtansine"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Therapielinie"
    beschreibung: "Drittlinie"
    datentyp: "CodeableConcept"
    wertebereich: "Drittlinie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Extension:therapy-line"
  status: "partial"
  anmerkung: "Therapielinie vorhanden. Sequenz-Logik (was wurde vorher eingesetzt) nicht modelliert."

referenzen:
  s3_literatur: ["1176", "1177", "1178", "1179", "1180", "1175"]
```

### Empfehlung 5.28

```yaml
id: S3-5.0-5.28
kapitel: "5.2.1"
kapitel_titel: "Systemische Therapie HER2-positives Mammakarzinom"
empfehlung_nr: "5.28"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Ist bei Patientinnen mit asymptomatischen HER2-positiven Hirnmetastasen, nach
  interdisziplinaerer Diskussion unter Beruecksichtigung der Patientinnenpraeferenz,
  eine Systemtherapie geplant, sollte entweder T-DXd oder eine Dreierkombination
  Tucatinib + Capecitabin + Trastuzumab angeboten werden.

datenobjekte:
  - name: "Hirnmetastasen-Status"
    beschreibung: "Vorliegen von Hirnmetastasen (asymptomatisch)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "C79.3"
      display: "Sekundaere boesartige Neubildung des Gehirns und der Hirnhaeute"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Trastuzumab Deruxtecan (Hirnmetastasen)"
    beschreibung: "T-DXd bei HER2+ mit asymptomatischen Hirnmetastasen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD04"
      display: "Trastuzumab deruxtecan"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "HER2+ mit asymptomatischen Hirnmetastasen"

  - name: "Tucatinib + Capecitabin + Trastuzumab (Hirnmetastasen)"
    beschreibung: "Dreierkombination bei HER2+ Hirnmetastasen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Tucatinib (L01EH03) + Capecitabin (L01BC06) + Trastuzumab (L01FD01)"
    verpflichtung: "empfohlen"
    bedingung: "HER2+ mit asymptomatischen Hirnmetastasen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure + Senologie_Diagnose_Maligne"
  status: "partial"
  anmerkung: "Metastasenlokalisation ueber cs-senologie-metastasierung abbildbar. Hirnmetastasen-spezifische Therapieauswahl nicht modelliert."

referenzen:
  s3_literatur: ["1177", "1187", "1179"]
```

### 5.2.2 Prä-/perimenopausale Patientinnen, HR+/HER2-

### Empfehlung 5.29

```yaml
id: S3-5.0-5.29
kapitel: "5.2.2"
kapitel_titel: "Prä-/perimenopausale Patientinnen HR+/HER2-"
empfehlung_nr: "5.29"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Patientinnen mit metastasiertem Mammakarzinom wird eine kombinierte chemo-endokrine
  Therapie nicht empfohlen. Sie kann zwar die Remissionsraten erhoehen, fuehrt aber auch
  zu gesteigerter Toxizitaet ohne Verlaengerung des progressionsfreien Intervalls oder
  des Gesamtueberlebens.

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Negative Empfehlung. Relevanz fuer Therapieprotokoll-Validation."

referenzen:
  s3_literatur: ["1190", "1191"]
```

### Empfehlung 5.30

```yaml
id: S3-5.0-5.30
kapitel: "5.2.2"
kapitel_titel: "Prä-/perimenopausale Patientinnen HR+/HER2-"
empfehlung_nr: "5.30"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei prä- und perimenopausalen Patientinnen soll bei positivem Hormonrezeptorstatus
  und negativem HER2-Status eine endokrine Therapie, bevorzugt kombiniert mit einer
  zielgerichteten Therapie mit einem CDK4/6-Inhibitor angeboten werden.

datenobjekte:
  - name: "Endokrine Therapie (prä-/perimenopausal)"
    beschreibung: "Endokrine Therapie bei prä-/perimenopausalen Patientinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Tamoxifen (L02BA01) | Aromatasehemmer (L02BG01-03) | Fulvestrant (L02BA03)
    verpflichtung: "obligat"

  - name: "CDK4/6-Inhibitor"
    beschreibung: "CDK4/6-Inhibitor in Kombination mit endokriner Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Palbociclib (L01EF01) | Ribociclib (L01EF02) | Abemaciclib (L01EF03)
    verpflichtung: "obligat"

  - name: "Menopausenstatus"
    beschreibung: "Menopausenstatus der Patientin"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "praemenopausal | perimenopausal | postmenopausal"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Medikamente ueber ATC abbildbar. Menopausenstatus als Stratifizierungsmerkmal fehlt als eigenes Element."

referenzen:
  s3_literatur: ["1192", "1193"]
```

### Empfehlung 5.31

```yaml
id: S3-5.0-5.31
kapitel: "5.2.2"
kapitel_titel: "Prä-/perimenopausale Patientinnen HR+/HER2-"
empfehlung_nr: "5.31"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei praemenopausalen Patientinnen soll die endokrin-basierte Therapie mit einem
  CDK4/6-Inhibitor unter Ausschaltung der Ovarialfunktion und in Abhaengigkeit von
  der Vortherapie in Kombination mit einem Aromatasehemmer, Fulvestrant oder Tamoxifen
  (Tamoxifen nicht in Kombination mit Ribociclib) erfolgen.

datenobjekte:
  - name: "Ovarielle Suppression"
    beschreibung: "Ausschaltung der Ovarialfunktion (GnRH-Agonist, Ovarektomie, Radiomenolyse)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      GnRH-Agonist: Goserelin (L02AE03) | Leuprorelin (L02AE02) |
      Ovarektomie (OPS) | Radiomenolyse
    verpflichtung: "obligat"
    bedingung: "Praemenopausale Patientinnen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Ovarielle Suppression als Begleittherapie. Kontraindikation Tamoxifen+Ribociclib als Regel nicht modellierbar."

referenzen:
  s3_literatur: ["1192", "1193"]
```

### Empfehlung 5.32

```yaml
id: S3-5.0-5.32
kapitel: "5.2.2"
kapitel_titel: "Prä-/perimenopausale Patientinnen HR+/HER2-"
empfehlung_nr: "5.32"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei sequenziellen endokrin-basierten Therapien sollten die verschiedenen endokrinen
  Substanzen in Abhaengigkeit von vorhergehenden Therapien, Ansprechen, sowie Tumor-
  und Patientencharakteristika ausgewaehlt werden.

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Therapiesequenz-Dokumentation ueber therapy-line Extension moeglich."
```

### 5.2.3 Erstlinientherapie

### Empfehlung 5.33

```yaml
id: S3-5.0-5.33
kapitel: "5.2.3"
kapitel_titel: "Erstlinientherapie"
empfehlung_nr: "5.33"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Kombinationstherapie eines Aromatasehemmers oder Fulvestrant mit CDK 4/6-Inhibitoren
  soll als Erstlinientherapie oder spaetestens ab der Zweitlinie durchgefuehrt werden,
  sofern diese Substanzgruppe noch nicht eingesetzt wurde.

datenobjekte:
  - name: "Aromatasehemmer + CDK4/6i (Erstlinie)"
    beschreibung: "Aromatasehemmer in Kombination mit CDK4/6-Inhibitor als Erstlinie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Letrozol (L02BG04) + Palbociclib (L01EF01) |
      Letrozol (L02BG04) + Ribociclib (L01EF02) |
      Anastrozol (L02BG03) + Abemaciclib (L01EF03) |
      Fulvestrant (L02BA03) + CDK4/6i
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Medikamente vorhanden. Vortherapie-Check (CDK4/6i noch nicht eingesetzt) als Logik nicht modelliert."

referenzen:
  s3_literatur: ["1192", "1193", "1211", "1212"]
```

### 5.2.4 Postmenopausale Patientinnen HR+/HER2-

### Empfehlung 5.34

```yaml
id: S3-5.0-5.34
kapitel: "5.2.4"
kapitel_titel: "Postmenopausale Patientinnen HR+/HER2-"
empfehlung_nr: "5.34"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei postmenopausalen Patientinnen soll die endokrin-basierte Therapie mit einem
  CDK4/6-Inhibitor in Abhaengigkeit von der Vortherapie in Kombination mit einem
  Aromatasehemmer, Fulvestrant oder Tamoxifen (Tamoxifen nicht in Kombination mit
  Ribociclib) erfolgen.

datenobjekte:
  - name: "ET + CDK4/6i (postmenopausal)"
    beschreibung: "Endokrine Therapie + CDK4/6-Inhibitor bei postmenopausalen Patientinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Aromatasehemmer (L02BG) + Palbociclib/Ribociclib/Abemaciclib |
      Fulvestrant (L02BA03) + Palbociclib/Ribociclib/Abemaciclib |
      Tamoxifen (L02BA01) + Palbociclib/Abemaciclib (nicht Ribociclib)
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Medikamente ueber ATC. Kontraindikation Tamoxifen+Ribociclib nicht als Regel."

referenzen:
  s3_literatur: ["1192", "1193", "1212"]
```

### Empfehlung 5.35

```yaml
id: S3-5.0-5.35
kapitel: "5.2.4"
kapitel_titel: "Postmenopausale Patientinnen HR+/HER2-"
empfehlung_nr: "5.35"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Eine kombinierte chemo-endokrine Therapie wird nicht empfohlen. Sie kann zwar die
  Remissionsraten erhoehen, fuehrt aber auch zu gesteigerter Toxizitaet ohne
  Verlaengerung des progressionsfreien Intervalls oder des Gesamtueberlebens.

fhir_mapping:
  profil: "-"
  status: "mapped"
  anmerkung: "Negative Empfehlung, keine neuen Datenobjekte."

referenzen:
  s3_literatur: ["1190", "1191"]
```

#### 5.2.4.1 Zweit- und Folgelinientherapie

### Empfehlung 5.36

```yaml
id: S3-5.0-5.36
kapitel: "5.2.4.1"
kapitel_titel: "Zweit- und Folgelinientherapie"
empfehlung_nr: "5.36"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Sofern in der Erstlinie noch kein CDK4/6-Inhibitor eingesetzt worden war, sollte
  er in weiteren endokrin-basierten Therapielinien eingesetzt werden.

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Vortherapie-Abfrage (CDK4/6i Erstlinie ja/nein) nicht modelliert."

referenzen:
  s3_literatur: ["1192", "1193", "1211", "1212"]
```

### Empfehlung 5.37

```yaml
id: S3-5.0-5.37
kapitel: "5.2.4.1"
kapitel_titel: "Zweit- und Folgelinientherapie"
empfehlung_nr: "5.37"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit positivem Hormonrezeptorstatus und negativem HER2-Status und
  einer PIK3CA-Mutation, die unter oder innerhalb von 12 Monaten nach einer adjuvanten
  endokrinen Therapie progredient sind, sollte eine zielgerichtete Therapie mit
  Inavolisib plus Fulvestrant plus Palbociclib angeboten werden.

datenobjekte:
  - name: "PIK3CA-Mutationsstatus"
    beschreibung: "Nachweis einer PIK3CA-Mutation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      code: "HGNC:8975"
      display: "PIK3CA"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Inavolisib"
    beschreibung: "PI3K-Inhibitor Inavolisib"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EM05"
      display: "Inavolisib"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"
    bedingung: "PIK3CA-Mutation + HR+/HER2- + Progression unter/nach adjuvanter ET"

  - name: "Fulvestrant (Kombination)"
    beschreibung: "Fulvestrant als Kombinationspartner"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L02BA03"
      display: "Fulvestrant"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

  - name: "Palbociclib (Kombination)"
    beschreibung: "Palbociclib als Kombinationspartner"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EF01"
      display: "Palbociclib"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure + Senologie_GenExpressionsTest"
  status: "gap"
  anmerkung: "PIK3CA-Mutationsstatus als Biomarker fuer Therapieentscheidung. Genomics Reporting IG noetig."

referenzen:
  s3_literatur: ["1242", "1243"]
```

### Empfehlung 5.38

```yaml
id: S3-5.0-5.38
kapitel: "5.2.4.1"
kapitel_titel: "Zweitlinientherapie"
empfehlung_nr: "5.38"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Postmenopausale Patientinnen mit HR-positivem / HER2-negativem fortgeschrittenem
  oder metastasiertem Mammakarzinom und einer aktivierenden ESR1-Mutation nach
  mindestens einer endokrinen Therapielinie, einschliesslich eines CDK 4/6-Inhibitors,
  sollten mit Elacestrant behandelt werden.

datenobjekte:
  - name: "ESR1-Mutationsstatus"
    beschreibung: "Nachweis einer aktivierenden ESR1-Mutation (Liquid Biopsy)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      code: "HGNC:3467"
      display: "ESR1"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Elacestrant"
    beschreibung: "Oraler selektiver ER-Degrader (SERD)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L02BA04"
      display: "Elacestrant"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"
    bedingung: "ESR1-Mutation + HR+/HER2- + Vorbehandlung mit ET + CDK4/6i"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "gap"
  anmerkung: "ESR1-Mutation als Biomarker (Liquid Biopsy) nicht modelliert. Elacestrant als neues Medikament."

referenzen:
  s3_literatur: ["1244", "1175"]
```

### Empfehlung 5.39

```yaml
id: S3-5.0-5.39
kapitel: "5.2.4.1"
kapitel_titel: "Zweitlinientherapie"
empfehlung_nr: "5.39"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit vorbehandeltem HR-positivem / HER2-negativem fortgeschrittenem
  oder metastasiertem Mammakarzinom mit einer oder mehrerer PIK3CA/AKT1/PTEN-Alteration
  sollten mit Capivasertib und Fulvestrant behandelt werden.

datenobjekte:
  - name: "PIK3CA/AKT1/PTEN-Alterationsstatus"
    beschreibung: "Nachweis einer Alteration in PIK3CA, AKT1 oder PTEN"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
    wertebereich: "PIK3CA-Mutation | AKT1-Mutation | PTEN-Verlust"
    verpflichtung: "obligat"

  - name: "Capivasertib"
    beschreibung: "AKT-Inhibitor Capivasertib"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EM04"
      display: "Capivasertib"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"
    bedingung: "PIK3CA/AKT1/PTEN-Alteration + HR+/HER2- vorbehandelt"

  - name: "Fulvestrant (Kombination mit Capivasertib)"
    beschreibung: "Fulvestrant als Kombinationspartner"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L02BA03"
      display: "Fulvestrant"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "gap"
  anmerkung: "AKT-Signalweg-Alterationen als Biomarker. Genomics Reporting IG noetig."

referenzen:
  s3_literatur: ["1245"]
```

### Empfehlung 5.40

```yaml
id: S3-5.0-5.40
kapitel: "5.2.4.1"
kapitel_titel: "Zweitlinientherapie"
empfehlung_nr: "5.40"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Nach antihormoneller Vortherapie mit einem nicht-steroidalen Aromatasehemmer sowie
  CDK4/6-Inhibitoren kann eine Folgetherapie mit Exemestan und dem mTOR-Inhibitor
  Everolimus durchgefuehrt werden.

datenobjekte:
  - name: "Exemestan"
    beschreibung: "Steroidaler Aromatasehemmer"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L02BG06"
      display: "Exemestan"
      mapping_quelle: "standard"
    verpflichtung: "optional"

  - name: "Everolimus"
    beschreibung: "mTOR-Inhibitor"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EG02"
      display: "Everolimus"
      mapping_quelle: "standard"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Medikamente ueber ATC abbildbar."
```

### Empfehlung 5.41

```yaml
id: S3-5.0-5.41
kapitel: "5.2.4.1"
kapitel_titel: "Zweitlinientherapie"
empfehlung_nr: "5.41"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Weitere Schritte in der endokrin-basierten Behandlungssequenz stellen je nach
  Vorbehandlung der Einsatz von Elacestrant (bei Nachweis einer aktivierenden
  ESR1-Mutation), Capivasertib (bei Nachweis einer oder mehrerer PIK3CA/AKT1/PTEN-
  Alterationen), Alpelisib (bei Nachweis einer entsprechenden PIK3CA-Mutation),
  Everolimus bzw. Antioestrogene, Oestrogenrezeptor-Antagonisten, der Wechsel des
  Aromatasehemmers von einem steroidalen auf einen nicht-steroidalen Aromatasehemmer
  oder vice versa dar.
  *Cave: Alpelisib derzeit in Deutschland nur ueber internationale Apotheke erhaeltlich.

datenobjekte:
  - name: "Alpelisib"
    beschreibung: "PI3K-Inhibitor Alpelisib (bei PIK3CA-Mutation)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EM03"
      display: "Alpelisib"
      mapping_quelle: "standard"
    verpflichtung: "optional"
    bedingung: "PIK3CA-Mutation nachgewiesen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Therapiesequenz-Statement. Biomarker-abhaengige Therapiewahl erfordert Genomics Reporting."

referenzen:
  verwandte_empfehlungen: ["5.37", "5.38", "5.39", "5.40"]
```

### 5.2.5 ADC-Therapie HR+/HER2-

### Empfehlung 5.42

```yaml
id: S3-5.0-5.42
kapitel: "5.2.5"
kapitel_titel: "Therapie des HR+ HER2- metastasierten Mammakarzinoms mit ADC"
empfehlung_nr: "5.42"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HR-positivem / HER2-low fortgeschrittenem oder metastasiertem
  Mammakarzinom, die eine Chemotherapie in der metastasierten Situation erhalten haben
  oder bei denen waehrend oder innerhalb von 6 Monaten nach Beendigung der adjuvanten
  Chemotherapie ein Rezidiv aufgetreten ist, sollten mit Trastuzumab Deruxtecan
  behandelt werden.

datenobjekte:
  - name: "HER2-low Status"
    beschreibung: "HER2-low Status (IHC 1+ oder IHC 2+/ISH-)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
      mapping_quelle: "standard"
    wertebereich: "HER2-low (IHC 1+ oder IHC 2+/ISH-)"
    verpflichtung: "obligat"

  - name: "Trastuzumab Deruxtecan (HER2-low)"
    beschreibung: "T-DXd bei HR+/HER2-low nach Chemotherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD04"
      display: "Trastuzumab deruxtecan"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "HER2-low als Biomarker-Kategorie nicht im Profil. T-DXd ueber ATC abbildbar."

referenzen:
  s3_literatur: ["1255", "1175"]
```

### Empfehlung 5.43

```yaml
id: S3-5.0-5.43
kapitel: "5.2.5"
kapitel_titel: "Therapie des HR+ HER2- metastasierten Mammakarzinoms mit ADC"
empfehlung_nr: "5.43"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HR-positivem / HER2-low oder HER2-ultralow fortgeschrittenem oder
  metastasiertem Mammakarzinom, die eine oder mehrere endokrine Therapielinien in der
  metastasierten Situation erhalten haben, kann eine Therapie mit Trastuzumab Deruxtecan
  angeboten werden.

datenobjekte:
  - name: "HER2-ultralow Status"
    beschreibung: "HER2-ultralow Status (IHC 0 mit Membranfaerbung)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "vorschlag"
    wertebereich: "HER2-ultralow (IHC 0 mit inkompletter Membranfaerbung)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "gap"
  anmerkung: "HER2-ultralow als neue Kategorie nicht im Profil modelliert."

referenzen:
  s3_literatur: ["1256"]
```

### Empfehlung 5.44

```yaml
id: S3-5.0-5.44
kapitel: "5.2.5"
kapitel_titel: "Therapie des HR+ HER2- metastasierten Mammakarzinoms mit ADC"
empfehlung_nr: "5.44"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HR-positivem / HER2-negativem fortgeschrittenem oder metastasiertem
  Mammakarzinom nach Vorbehandlung mit endokrin-basierter Therapie und mindestens 2
  zusaetzlichen systemischen Therapien bei fortgeschrittener Erkrankung sollten mit
  Sacituzumab Govitecan behandelt werden.

datenobjekte:
  - name: "Sacituzumab Govitecan (HR+/HER2-)"
    beschreibung: "Sacituzumab Govitecan bei HR+/HER2- nach multiplen Vortherapien"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FX17"
      display: "Sacituzumab govitecan"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "HR+/HER2- nach ET + >= 2 systemische Therapien metastasiert"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "ADC ueber ATC. Vortherapie-Zaehlung nicht modelliert."

referenzen:
  s3_literatur: ["1257", "1168", "1175"]
```

### Empfehlung 5.45

```yaml
id: S3-5.0-5.45
kapitel: "5.2.5"
kapitel_titel: "Therapie des HR+ HER2- metastasierten Mammakarzinoms mit ADC"
empfehlung_nr: "5.45"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HR-positivem / HER2-negativem fortgeschrittenem oder metastasiertem
  Mammakarzinom, die bereits eine endokrine Therapie und mindestens eine Chemotherapie
  im fortgeschrittenen Stadium erhalten haben, kann eine Therapie mit Datopotamab
  Deruxtecan angeboten werden.

datenobjekte:
  - name: "Datopotamab Deruxtecan"
    beschreibung: "Trop-2-gerichtetes ADC Datopotamab Deruxtecan (Dato-DXd)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FX18"
      display: "Datopotamab deruxtecan"
      mapping_quelle: "vorschlag"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Neues ADC, ATC-Code ggf. noch nicht final."

referenzen:
  s3_literatur: ["1260"]
```

### 5.2.6 HER2-negativ mit BRCA1/2-Keimbahn-Mutation

### Empfehlung 5.46

```yaml
id: S3-5.0-5.46
kapitel: "5.2.6"
kapitel_titel: "HER2-negatives MaCa bei Keimbahn-BRCA1/2-Mutation"
empfehlung_nr: "5.46"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  HER2-negative Patientinnen mit fortgeschrittenem oder metastasiertem Mammakarzinom
  mit BRCA1/2-Keimbahn-Mutation und Vorbehandlung mit einem Anthrazyklin und einem
  Taxan im (neo)adjuvanten oder metastasierten Setting, es sei denn, sie waren
  ungeeignet fuer diese Behandlungen, sollten mit Olaparib oder mit Talazoparib
  behandelt werden.

datenobjekte:
  - name: "BRCA1/2-Keimbahn-Mutation"
    beschreibung: "Nachweis einer pathogenen BRCA1/2-Keimbahnmutation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
    wertebereich: "BRCA1 (HGNC:1100) | BRCA2 (HGNC:1101) - pathogen/wahrscheinlich pathogen"
    verpflichtung: "obligat"

  - name: "Olaparib"
    beschreibung: "PARP-Inhibitor Olaparib"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01XK01"
      display: "Olaparib"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "gBRCA1/2-Mutation + HER2-negativ + Vorbehandlung Anthrazyklin/Taxan"

  - name: "Talazoparib"
    beschreibung: "PARP-Inhibitor Talazoparib"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01XK04"
      display: "Talazoparib"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "gBRCA1/2-Mutation + HER2-negativ + Vorbehandlung Anthrazyklin/Taxan"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "BRCA-Mutationsstatus ueber Genomics Reporting. PARP-Inhibitoren ueber ATC abbildbar."

referenzen:
  s3_literatur: ["1168", "1261", "1262", "1263", "1264", "1265", "1175"]
```

### 5.2.7 Triple-negativ fortgeschritten/metastasiert

### Empfehlung 5.47

```yaml
id: S3-5.0-5.47
kapitel: "5.2.7"
kapitel_titel: "Triple-negatives MaCa fortgeschritten/metastasiert"
empfehlung_nr: "5.47"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit triple-negativem fortgeschrittenem oder metastasiertem Mammakarzinom
  mit positivem PD-L1-Status sollen mit Pembrolizumab + Chemotherapie (Paclitaxel,
  nab-Paclitaxel oder Carboplatin/Gemcitabin) bei Combined Positive Score >= 10
  behandelt werden. Alternativ kann mit Atezolizumab + nab-Paclitaxel bei IC >= 1%
  als Erstlinientherapie behandelt werden.

datenobjekte:
  - name: "PD-L1 CPS (TNBC)"
    beschreibung: "Combined Positive Score fuer Pembrolizumab-Indikation"
    datentyp: "Quantity (Score)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "standard"
    wertebereich: "CPS >= 10 fuer Pembrolizumab"
    verpflichtung: "obligat"
    bedingung: "TNBC metastasiert"

  - name: "PD-L1 IC Score (TNBC)"
    beschreibung: "Immune Cell Score fuer Atezolizumab-Indikation"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "standard"
    wertebereich: "IC >= 1% fuer Atezolizumab"
    verpflichtung: "obligat"
    bedingung: "TNBC metastasiert, Atezolizumab-Option"

  - name: "Pembrolizumab"
    beschreibung: "Anti-PD-1-Antikoerper"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FF02"
      display: "Pembrolizumab"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "TNBC + CPS >= 10"

  - name: "Atezolizumab"
    beschreibung: "Anti-PD-L1-Antikoerper"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FF05"
      display: "Atezolizumab"
      mapping_quelle: "standard"
    verpflichtung: "optional"
    bedingung: "TNBC + IC >= 1%"

  - name: "Chemotherapie-Backbone (TNBC Erstlinie)"
    beschreibung: "Chemotherapie in Kombination mit Checkpoint-Inhibitor"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Paclitaxel (L01CD01) | nab-Paclitaxel (L01CD01) |
      Carboplatin (L01XA02) + Gemcitabin (L01BC05)
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "PD-L1-Status (CPS/IC) als Biomarker-Observation noetig. Checkpoint-Inhibitoren ueber ATC."

referenzen:
  s3_literatur: ["1168", "1273", "583", "1274", "582", "1275", "1276", "1175"]
```

### Empfehlung 5.48

```yaml
id: S3-5.0-5.48
kapitel: "5.2.7"
kapitel_titel: "Triple-negatives MaCa fortgeschritten/metastasiert"
empfehlung_nr: "5.48"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit triple-negativem fortgeschrittenem oder metastasiertem Mammakarzinom
  nach Vorbehandlung mit zwei oder mehr systemische Therapien, darunter mindestens 1
  gegen die fortgeschrittene Erkrankung, sollten mit Sacituzumab Govitecan behandelt werden.

datenobjekte:
  - name: "Sacituzumab Govitecan (TNBC)"
    beschreibung: "Anti-Trop-2-ADC bei vorbehandeltem metastasiertem TNBC"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FX17"
      display: "Sacituzumab govitecan"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "TNBC + >= 2 Vortherapien (davon >= 1 metastasiert)"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "ADC ueber ATC. Vortherapie-Zaehlung nicht modelliert."

referenzen:
  s3_literatur: ["1168", "1286", "1287", "1175"]
```

### 5.2.8 Chemotherapie des metastasierten Mammakarzinoms

### Empfehlung 5.49

```yaml
id: S3-5.0-5.49
kapitel: "5.2.8"
kapitel_titel: "Chemotherapie des metastasierten Mammakarzinoms"
empfehlung_nr: "5.49"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Vor Durchfuehrung einer Chemotherapie sollen der Allgemeinzustand und die Komorbidität,
  die Vortherapien der Patientin erhoben und die Adhaerenz abgeschaetzt werden.

datenobjekte:
  - name: "ECOG Performance Status"
    beschreibung: "Allgemeinzustand der Patientin vor Chemotherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "89247-1"
      display: "ECOG Performance Status"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Vortherapien"
    beschreibung: "Dokumentation bisheriger systemischer Therapien"
    datentyp: "Reference(Procedure)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "ECOG als Observation moeglich. Vortherapien ueber Procedure-Referenzen."
```

### Empfehlung 5.50

```yaml
id: S3-5.0-5.50
kapitel: "5.2.8"
kapitel_titel: "Chemotherapie des metastasierten Mammakarzinoms"
empfehlung_nr: "5.50"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Waehrend der Therapie soll eine regelmaessige Toxizitaetsbeurteilung (subjektiv und
  objektiv) erfolgen. Die Dosierung soll ebenso wie die angestrebten Zeitintervalle
  gemaess generell akzeptiertem Standard- bzw. aktuell publiziertem Therapieregime
  erfolgen. Eine Evaluation des Therapieeffektes mindestens alle 6-12 Wochen.

datenobjekte:
  - name: "Toxizitaetsbeurteilung (CTCAE)"
    beschreibung: "Regelmaessige Erfassung unerwuenschter Ereignisse nach CTCAE"
    datentyp: "CodeableConcept + integer"
    terminologie:
      system: "NCI CTCAE"
      version: "5.0"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Therapieevaluation"
    beschreibung: "Evaluation des Therapieansprechens (Bildgebung, Tumormarker)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "RECIST"
      version: "1.1"
      mapping_quelle: "standard"
    wertebereich: "CR | PR | SD | PD"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Durchfuehrung"
  status: "partial"
  anmerkung: "Toxizitaetserfassung und Therapieevaluation nicht als eigene Observations modelliert."
```

### Empfehlung 5.51

```yaml
id: S3-5.0-5.51
kapitel: "5.2.8"
kapitel_titel: "Chemotherapie - Modifikation"
empfehlung_nr: "5.51"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Eine Unterbrechung der Therapie sollte bei klinisch relevanter Progression oder
  nicht tolerabler Toxizitaet erfolgen.
  Ein Wechsel auf eine andere Chemotherapie sollte ohne nachgewiesene Progression
  oder ohne nicht tolerable Toxizitaet nicht erfolgen.

datenobjekte:
  - name: "Therapieabbruch-Grund"
    beschreibung: "Grund fuer Therapieunterbrechung/-wechsel"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Progression | Toxizitaet | Patientenwunsch"
    verpflichtung: "obligat"
    bedingung: "Bei Therapieaenderung"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Extension:therapy-status"
  status: "partial"
  anmerkung: "therapy-status Extension vorhanden, Abbruchgrund nicht detailliert."
```

### Empfehlung 5.52

```yaml
id: S3-5.0-5.52
kapitel: "5.2.8"
kapitel_titel: "Chemotherapie - Polychemotherapie"
empfehlung_nr: "5.52"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Indikation zu einer Chemotherapie sollten Patientinnen ohne hohen Remissionsdruck
  eine Mono-Chemotherapie erhalten.

datenobjekte:
  - name: "Mono- vs. Polychemotherapie"
    beschreibung: "Entscheidung Mono- oder Kombinationschemotherapie"
    datentyp: "CodeableConcept"
    wertebereich: "Monochemotherapie | Polychemotherapie"
    verpflichtung: "obligat"

  - name: "Remissionsdruck"
    beschreibung: "Klinische Einschaetzung des Remissionsdrucks"
    datentyp: "CodeableConcept"
    wertebereich: "hoch | niedrig"
    verpflichtung: "obligat"

  - name: "Chemotherapeutika (Monotherapie)"
    beschreibung: "Einzelsubstanzen fuer die Monochemotherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: >
      Anthrazykline (L01DB) | Paclitaxel (L01CD01) | nab-Paclitaxel (L01CD01) |
      Capecitabin (L01BC06) | Eribulin (L01XX41) | Vinorelbin (L01CA04) |
      Platinkomplexe (L01XA)
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Chemotherapeutika ueber ATC. Remissionsdruck als Entscheidungskriterium nicht modelliert."

referenzen:
  s3_literatur: ["1291", "1292"]
```

### Empfehlung 5.53

```yaml
id: S3-5.0-5.53
kapitel: "5.2.8"
kapitel_titel: "Chemotherapie - Bevacizumab"
empfehlung_nr: "5.53"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Kombinationstherapie aus Chemotherapie und Bevacizumab kann in der Erstlinientherapie
  das progressionsfreie Ueberleben verbessern, allerdings mit erhoehter Nebenwirkungsrate
  und ohne Einfluss auf das Gesamtueberleben.

datenobjekte:
  - name: "Bevacizumab"
    beschreibung: "Anti-VEGF-Antikoerper Bevacizumab in Kombination mit Chemotherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FG01"
      display: "Bevacizumab"
      mapping_quelle: "standard"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Bevacizumab ueber ATC abbildbar."

referenzen:
  s3_literatur: ["1293", "1294", "1295", "1296", "1297", "1298", "1168"]
```

---

## 5.3 Spezifische Metastasenlokalisationen

### 5.3.1 Grundsaetzliches Vorgehen bei Fernmetastasierung

### Empfehlung 5.54

```yaml
id: S3-5.0-5.54
kapitel: "5.3.1"
kapitel_titel: "Grundsaetzliches Vorgehen bei Fernmetastasierung"
empfehlung_nr: "5.54"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Neben einer Systemtherapie soll die Indikation zu einer operativen bzw. lokal
  ablativen Therapie von Fernmetastasen individuell und in einem interdisziplinaeren
  Konsil gestellt werden.

datenobjekte:
  - name: "Metastasenlokalisation"
    beschreibung: "Lokalisation der Fernmetastasen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      mapping_quelle: "leitlinie"
    wertebereich: "C79.3 (Hirn) | C79.5 (Knochen) | C78.7 (Leber) | C78.0 (Lunge) | C79.2 (Haut)"
    verpflichtung: "obligat"

  - name: "Lokale Metastasentherapie"
    beschreibung: "Lokale/ablative Therapie einzelner Metastasen"
    datentyp: "CodeableConcept"
    wertebereich: "Resektion | RFA | TACE | SBRT | SIRT"
    verpflichtung: "optional"

  - name: "Interdisziplinaeres Konsil"
    beschreibung: "Dokumentation der interdisziplinaeren Therapieentscheidung"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne"
  element: "Condition.bodySite + cs-senologie-metastasierung"
  status: "partial"
  anmerkung: "Metastasenlokalisation ueber cs-senologie-metastasierung. Lokale Metastasentherapie als Procedure-Subtyp nicht modelliert."
```

### 5.3.2 Skelettmetastasen

#### 5.3.2.1 Indikationen zur Strahlentherapie

### Empfehlung 5.55

```yaml
id: S3-5.0-5.55
kapitel: "5.3.2.1"
kapitel_titel: "Indikationen zur Strahlentherapie bei Skelettmetastasen"
empfehlung_nr: "5.55"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  aus S3-Leitlinien Supportiv-Therapie bei onkologischen PatientInnen AWMF-Registernummer 032-054OL.
  Indikationen zur lokalen perkutanen Strahlentherapie bei Knochenmetastasen sind:
  lokale Schmerzsymptomatik, Bewegungseinschraenkung, Stabilitaetsminderung
  (Frakturgefahr), Zustand nach operativer Stabilisierung, drohende oder bestehende
  neurologische Symptomatik (z. B. Rueckenmarkskompression).

datenobjekte:
  - name: "Indikation Strahlentherapie Knochen"
    beschreibung: "Indikation zur perkutanen RT bei Knochenmetastasen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Schmerz | Bewegungseinschraenkung | Frakturgefahr | Z.n. OP-Stabilisierung | Neurologische Symptomatik"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "RT bei Knochenmetastasen. Indikation als CodeableConcept ergaenzbar."
```

#### 5.3.2.2 Indikationen zur operativen Therapie

### Empfehlung 5.56

```yaml
id: S3-5.0-5.56
kapitel: "5.3.2.2"
kapitel_titel: "Indikationen zur operativen Therapie bei Skelettmetastasen"
empfehlung_nr: "5.56"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  aus S3-Leitlinien Supportiv-Therapie AWMF 032-054OL.
  Indikationen zur chirurgischen Therapie von ossaeren Manifestationen koennen sein:
  Myelonkompression mit neurologischen Symptomen, pathologische Fraktur, drohende
  Fraktur (Frakturrisiko z.B. ueber Mirel Score, SINS), solitaere Spaetmetastase,
  Osteolysen mit Progress nach Strahlentherapie, therapieresistente Schmerzen.

fhir_mapping:
  profil: "Senologie_Operation"
  status: "gap"
  anmerkung: "Operation bei Skelettmetastasen nicht spezifisch modelliert."
```

### 5.3.3 Behandlung von Hirnmetastasen

### Empfehlung 5.57

```yaml
id: S3-5.0-5.57
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.57"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Singulaere Hirnmetastasen sollten reseziert werden oder mittels stereotaktischer
  Radiotherapie behandelt werden. Entscheidungskriterien bei der Wahl des Therapieverfahrens
  sind Tumorgroesse, Metastasenlokalisation, Symptomatik, das Vorliegen einer
  Mittellinienverlagerung sowie die Gesamtprognose.

datenobjekte:
  - name: "Hirnmetastasen-Anzahl"
    beschreibung: "Anzahl der Hirnmetastasen"
    datentyp: "integer"
    verpflichtung: "obligat"

  - name: "Hirnmetastasen-Therapie"
    beschreibung: "Therapiemodalitaet bei Hirnmetastasen"
    datentyp: "CodeableConcept"
    wertebereich: "Resektion | Stereotaktische RT | Ganzhirnbestrahlung"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Hirnmetastasen-spezifische Therapie nicht differenziert."

referenzen:
  s3_literatur: ["1312"]
```

### Empfehlung 5.58

```yaml
id: S3-5.0-5.58
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.58"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Nach Hirnmetastasenresektion sollte bei limitierter zerebraler Metastasierung eine
  lokale fraktionierte Bestrahlung oder stereotaktische Radiotherapie des Tumorbetts erfolgen.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Postoperative RT des Tumorbetts."

referenzen:
  s3_literatur: ["1312"]
```

### Empfehlung 5.59

```yaml
id: S3-5.0-5.59
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.59"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Infratentorielle Metastasen sollten bei drohendem Verschlusshydrozephalus primaer
  reseziert werden.

fhir_mapping:
  profil: "Senologie_Operation"
  status: "gap"
  anmerkung: "Neurochirurgische Intervention nicht im Senologie-Profil."
```

### Empfehlung 5.60

```yaml
id: S3-5.0-5.60
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.60"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Vorliegen einer limitierten Anzahl von Hirnmetastasen (in der Groessenordnung
  2-4), die ein bestrahlbares Gesamtvolumen nicht ueberschreiten, soll der initialen
  Radiochirurgie aufgrund der geringeren negativen Auswirkungen auf die Neurokognition,
  der kuerzeren Behandlungsdauer und der hoeheren Kontrollrate der Vorzug gegeben werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Radiochirurgie als Bestrahlungstechnik."

referenzen:
  s3_literatur: ["1312"]
```

### Empfehlung 5.61

```yaml
id: S3-5.0-5.61
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.61"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Fuer Patientinnen mit 5-10 Hirnmetastasen, die ein bestrahlbares Gesamtvolumen nicht
  ueberschreiten, kann eine stereotaktische Radiotherapie als Alternative zur
  Ganzhirnbestrahlung erfolgen.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Stereotaktische RT bei multiplen Hirnmetastasen."
```

### Empfehlung 5.62

```yaml
id: S3-5.0-5.62
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.62"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Sollte eine Operation oder eine stereotaktische Radiotherapie nicht infrage kommen,
  kann die alleinige Ganzhirnbestrahlung eingesetzt werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "Ganzhirnbestrahlung als Fallback-Option."
```

### Empfehlung 5.63

```yaml
id: S3-5.0-5.63
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.63"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Kombination aus Resektion oder Radiochirurgie mit einer Ganzhirnbestrahlung
  verbessert gegenueber alleiniger Operation oder Radiochirurgie das hirnspezifische
  progressionsfreie Ueberleben, nicht jedoch das Gesamtueberleben. Sie kann im
  Einzelfall erwogen werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"

referenzen:
  s3_literatur: ["1312"]
```

### Empfehlung 5.64

```yaml
id: S3-5.0-5.64
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.64"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Es gibt keine Indikation zur Kombination einer Ganzhirnbestrahlung mit
  radiosensibilisierenden Pharmaka.

fhir_mapping:
  profil: "-"
  status: "mapped"
  anmerkung: "Negative Empfehlung."
```

### Empfehlung 5.65

```yaml
id: S3-5.0-5.65
kapitel: "5.3.3"
kapitel_titel: "Behandlung von Hirnmetastasen"
empfehlung_nr: "5.65"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  aus S3-Leitlinien Supportiv-Therapie AWMF 032-054OL.
  Bei therapeutischer Ganzhirnbestrahlung ohne Hippocampusbefall und ohne leptomeningealen
  Befall kann eine bilaterale Schonung der Hippocampi durch den Einsatz einer
  intensitaetsmodulierten Radiotherapie erwogen werden.

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: "IMRT-Technik mit Hippocampus-Schonung."
```

### 5.3.4 Behandlung von Lebermetastasen

### Empfehlung 5.66

```yaml
id: S3-5.0-5.66
kapitel: "5.3.4"
kapitel_titel: "Behandlung von Lebermetastasen"
empfehlung_nr: "5.66"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "3"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei Vorliegen von Lebermetastasen kann in Einzelfaellen eine Resektion oder eine
  andere lokale Therapie (RFA, TACE, SBRT, SIRT) erwogen werden. Voraussetzungen
  dafuer sind keine disseminierten Metastasen und kontrollierte extrahepatische
  Metastasierung. Die Entscheidung soll im Rahmen einer interdisziplinaeren
  Tumorkonferenz diskutiert werden.

datenobjekte:
  - name: "Lebermetastasen-Therapie"
    beschreibung: "Lokale Therapie der Lebermetastasen"
    datentyp: "CodeableConcept"
    wertebereich: "Resektion | RFA | TACE | SBRT | SIRT"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "Lokal-ablative Leberverfahren nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1355", "1356", "1357", "1358", "1359", "1360", "1361", "1362", "1363", "1364", "1365"]
```

### 5.3.5 Behandlung von Lungenmetastasen

### Empfehlung 5.67

```yaml
id: S3-5.0-5.67
kapitel: "5.3.5"
kapitel_titel: "Behandlung von Lungenmetastasen"
empfehlung_nr: "5.67"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Vorliegen von Lungenmetastasen kann in Einzelfaellen eine Resektion oder eine
  andere lokale Therapie (RFA, stereotaktische Radiotherapie) erwogen werden.
  Voraussetzungen dafuer sind: keine disseminierten Metastasen, kontrollierte
  extrapulmonale Metastasierung. Die Entscheidung soll im Rahmen einer
  interdisziplinaeren Tumorkonferenz diskutiert werden.

fhir_mapping:
  profil: "Senologie_Operation / Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "Pulmonale Metastasentherapie nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1362", "1368", "1363", "1364", "1365"]
```

#### 5.3.5.1 Maligner Pleuraerguss

### Empfehlung 5.68

```yaml
id: S3-5.0-5.68
kapitel: "5.3.5.1"
kapitel_titel: "Maligner Pleuraerguss"
empfehlung_nr: "5.68"
typ: "Evidenzbasiert"
empfehlungsgrad: "A/0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Auftreten einer Pleurakarzinose mit symptomatischer Ergussbildung kann der
  Patientin eine Pleurodese angeboten werden. Alternativ oder ergaenzend kann eine
  dauerhafte Pleuradrainage angewendet werden.

datenobjekte:
  - name: "Pleurodese"
    beschreibung: "Pleurodese bei malignem Pleuraerguss"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "optional"

  - name: "Dauerhafte Pleuradrainage"
    beschreibung: "Thorax-Verweil-Drainage bei rezidivierendem Erguss"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "gap"
  anmerkung: "Pleurale Interventionen nicht im Senologie-Profil."

referenzen:
  s3_literatur: ["1373"]
```

### 5.3.6 Haut- und Weichteilmetastasen

### Empfehlung 5.69

```yaml
id: S3-5.0-5.69
kapitel: "5.3.6"
kapitel_titel: "Haut- und Weichteilmetastasen"
empfehlung_nr: "5.69"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Auftreten von Haut- und Weichteilmetastasen kann eine chirurgische Exzision
  oder eine andere lokale Therapie (z. B. Radiatio, Elektrochemotherapie) erwogen werden.

fhir_mapping:
  profil: "Senologie_Operation / Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "Hautmetastasen-Therapie nicht spezifisch modelliert."
```

---

## Zusammenfassung: Gap-Analyse Kapitel 5

### Medikamenten-Referenz (ATC-Codes)

| Medikament | ATC-Code | Indikation (Kapitel) |
|-----------|----------|---------------------|
| Trastuzumab | L01FD01 | HER2+ metastasiert (5.2.1) |
| Pertuzumab | L01FD02 | HER2+ Erstlinie (5.2.1) |
| Trastuzumab Emtansin (T-DM1) | L01FD03 | HER2+ Drittlinie (5.2.1) |
| Trastuzumab Deruxtecan (T-DXd) | L01FD04 | HER2+ Zweitlinie, HER2-low (5.2.1, 5.2.5) |
| Tucatinib | L01EH03 | HER2+ Zweit-/Drittlinie, Hirnmetastasen (5.2.1) |
| Lapatinib | L01EH01 | HER2+ (5.2.1) |
| Palbociclib | L01EF01 | HR+/HER2- + ET (5.2.2-5.2.4) |
| Ribociclib | L01EF02 | HR+/HER2- + ET (5.2.2-5.2.4) |
| Abemaciclib | L01EF03 | HR+/HER2- + ET (5.2.2-5.2.4) |
| Olaparib | L01XK01 | gBRCA1/2-mutiert HER2- (5.2.6) |
| Talazoparib | L01XK04 | gBRCA1/2-mutiert HER2- (5.2.6) |
| Pembrolizumab | L01FF02 | TNBC + PD-L1 CPS>=10 (5.2.7) |
| Atezolizumab | L01FF05 | TNBC + PD-L1 IC>=1% (5.2.7) |
| Sacituzumab Govitecan | L01FX17 | TNBC/HR+ vorbehandelt (5.2.5, 5.2.7) |
| Datopotamab Deruxtecan | L01FX18* | HR+/HER2- vorbehandelt (5.2.5) |
| Bevacizumab | L01FG01 | Erstlinie + Chemotherapie (5.2.8) |
| Everolimus | L01EG02 | HR+/HER2- + Exemestan (5.2.4) |
| Inavolisib | L01EM05* | PIK3CA-mutiert HR+/HER2- (5.2.4) |
| Alpelisib | L01EM03 | PIK3CA-mutiert HR+/HER2- (5.2.4) |
| Capivasertib | L01EM04* | PIK3CA/AKT1/PTEN-alt. HR+/HER2- (5.2.4) |
| Elacestrant | L02BA04* | ESR1-mutiert HR+/HER2- (5.2.4) |
| Tamoxifen | L02BA01 | HR+ endokrine Therapie (5.2.2-5.2.4) |
| Fulvestrant | L02BA03 | HR+ endokrine Therapie (5.2.2-5.2.4) |
| Letrozol | L02BG04 | HR+ endokrine Therapie (5.2.3-5.2.4) |
| Anastrozol | L02BG03 | HR+ endokrine Therapie (5.2.3-5.2.4) |
| Exemestan | L02BG06 | HR+ endokrine Therapie (5.2.4) |
| Capecitabin | L01BC06 | Verschiedene Kombinationen (5.2.1, 5.2.8) |
| Paclitaxel | L01CD01 | Chemotherapie-Backbone (5.2.7, 5.2.8) |
| Docetaxel | L01CD02 | Erstlinie HER2+ (5.2.1) |
| Eribulin | L01XX41 | Monochemotherapie (5.2.8) |
| Vinorelbin | L01CA04 | Monochemotherapie (5.2.8) |
| Carboplatin | L01XA02 | TNBC-Kombination (5.2.7) |
| Gemcitabin | L01BC05 | TNBC-Kombination (5.2.7) |
| Goserelin | L02AE03 | Ovarielle Suppression (5.2.2) |

*ATC-Codes mit * sind Vorschlaege und muessen validiert werden.

### Biomarker-Stratifizierung

| Biomarker | Bestimmungsmethode | Therapieentscheidung |
|-----------|-------------------|---------------------|
| HER2-Status (positiv/low/ultralow/negativ) | IHC + ISH | Anti-HER2, T-DXd, ADC |
| ER/PR-Status | IHC | Endokrine Therapie |
| PD-L1 CPS | IHC (22C3 Dako) | Pembrolizumab (CPS>=10) |
| PD-L1 IC Score | IHC (SP142 Ventana) | Atezolizumab (IC>=1%) |
| BRCA1/2-Keimbahnmutation | Genetische Testung | Olaparib / Talazoparib |
| PIK3CA-Mutation | Tumorgewebe / Liquid Biopsy | Inavolisib / Alpelisib |
| PIK3CA/AKT1/PTEN-Alteration | NGS | Capivasertib |
| ESR1-Mutation | Liquid Biopsy (ctDNA) | Elacestrant |

### FHIR-Mapping Gap-Analyse

| Empf. | Thema | FHIR-Status | Handlungsbedarf |
|-------|-------|-------------|-----------------|
| 5.1-5.6 | Rezidiv-Diagnostik | **gap** | Nachsorge/Rezidiv-Diagnostik-Profil fehlt |
| 5.7 | Biomarker Rezidiv (ER/PR/HER2/PD-L1/BRCA) | partial | Specimen-Kontext Rezidiv, PD-L1/BRCA als Gap |
| 5.8-5.14 | OP/RT Rezidiv | partial | Therapie-Intent (kurativ/palliativ), Rezidiv-Kontext |
| 5.15 | Systemtherapie nach Rezidiv | partial | Post-Rezidiv-Kontext |
| 5.16-5.23 | Strahlentherapie Rezidiv | partial | Re-Bestrahlung, Vorbestrahlung-Dokumentation |
| 5.24-5.28 | HER2+ Systemtherapie | partial | Therapielinie-Sequenz, Hirnmetastasen-spezifisch |
| 5.29-5.32 | Prä-/perimenopausal HR+/HER2- | partial | Menopausenstatus, ovarielle Suppression |
| 5.33-5.36 | Erstlinie/Folgelinie HR+/HER2- | partial | CDK4/6i-Vortherapie-Check |
| 5.37 | PIK3CA-Mutation -> Inavolisib | **gap** | Genomics Reporting (PIK3CA) |
| 5.38 | ESR1-Mutation -> Elacestrant | **gap** | Liquid Biopsy / ESR1-Mutation |
| 5.39 | PIK3CA/AKT1/PTEN -> Capivasertib | **gap** | Genomics Reporting (AKT-Signalweg) |
| 5.40-5.41 | Everolimus, Alpelisib, Sequenz | partial | Therapiesequenz-Logik |
| 5.42-5.43 | T-DXd bei HER2-low/ultralow | **gap** | HER2-low/ultralow als Biomarker-Kategorie |
| 5.44 | Sacituzumab Govitecan HR+ | partial | Vortherapie-Zaehlung |
| 5.45 | Datopotamab Deruxtecan | partial | Neues ADC |
| 5.46 | PARP-Inhibitoren (BRCA-mutiert) | partial | BRCA-Mutationsstatus via Genomics Reporting |
| 5.47 | Immuntherapie TNBC | **gap** | PD-L1 CPS/IC als Observation |
| 5.48 | Sacituzumab Govitecan TNBC | partial | Vortherapie-Zaehlung |
| 5.49-5.53 | Chemotherapie allgemein | partial | ECOG, Toxizitaet (CTCAE), Remissionsdruck |
| 5.54 | Metastasen-Grundsaetze | partial | cs-senologie-metastasierung vorhanden |
| 5.55-5.56 | Skelettmetastasen | partial/gap | Indikations-CodeSystems |
| 5.57-5.65 | Hirnmetastasen | partial | RT-Techniken (SRS, WBRT, IMRT) |
| 5.66 | Lebermetastasen | **gap** | Lokal-ablative Verfahren (RFA, TACE, SBRT, SIRT) |
| 5.67-5.68 | Lungenmetastasen/Pleuraerguss | **gap** | Pulmonale/pleurale Interventionen |
| 5.69 | Hautmetastasen | **gap** | Hautmetastasen-Therapie |

### Priorisierte Gaps

1. **Genomics Reporting** (PIK3CA, ESR1, BRCA1/2, AKT1/PTEN): Erforderlich fuer biomarker-gesteuerte Therapieentscheidungen in 5.37-5.39, 5.46. HL7 Genomics Reporting IG als Basis.
2. **HER2-low/ultralow Kategorie**: Neue therapeutisch relevante Biomarker-Klassifikation (5.42-5.43). Erweiterung des HER2-ValueSets noetig.
3. **PD-L1 Observation (CPS + IC)**: Fuer Immuntherapie-Indikation bei TNBC (5.47). Spezifische Observation mit Components.
4. **Therapielinie und Vortherapie-Dokumentation**: Zentral fuer Sequenztherapie-Entscheidungen in Kapitel 5.2. Extension therapy-line vorhanden, aber Vortherapie-Abfrage fehlt.
5. **Lokale Metastasentherapie-Verfahren**: RFA, TACE, SBRT, SIRT, Pleurodese als Procedure-Subtypen (5.3).
6. **Menopausenstatus**: Stratifizierungsmerkmal fuer endokrine Therapie (5.2.2 vs. 5.2.4).
