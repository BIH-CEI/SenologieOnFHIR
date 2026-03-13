# S3-Leitlinie v5.0 - Kapitel 4.1: Diagnostik bei der Abklärung auffälliger Befunde sowie prätherapeutische Ausbreitungsdiagnostik

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 82-95
> Kapitelstruktur: 4.1.1 Basisdiagnostik | 4.1.2 Bildgebende Verfahren | 4.1.3 Diagnostische Sicherung | 4.1.4 Pathologische Sekretion | 4.1.5 Staging

---

## 4.1.1 Basisdiagnostik

### Empfehlung 4.1

```yaml
id: S3-5.0-4.1
kapitel: "4.1.1"
kapitel_titel: "Basisdiagnostik"
empfehlung_nr: "4.1"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Als Basisuntersuchungen gelten:
  - Anamnese und klinische Brustuntersuchung: Inspektion, Palpation von Brust
    und Lymphabflussgebieten
  - Mammographie
  - Ultraschall.
  Ergibt die klinische Brustuntersuchung einen auffälligen Befund, soll die Diagnostik
  durch geeignete bildgebende Verfahren und ggf. eine histologische Untersuchung
  komplettiert werden.

datenobjekte:
  - name: "Anamnese"
    beschreibung: "Erhebung der klinischen Anamnese inkl. Risikofaktoren"
    datentyp: "Narrative / QuestionnaireResponse"
    verpflichtung: "obligat"

  - name: "Klinische Brustuntersuchung"
    beschreibung: "Inspektion und Palpation von Brust und Lymphabflussgebieten"
    datentyp: "Procedure + Observation"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "185712006"
      display: "Clinical breast examination (procedure)"
    verpflichtung: "obligat"

  - name: "Befund klinische Untersuchung"
    beschreibung: "Ergebnis der klinischen Untersuchung (auffällig/unauffällig)"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

  - name: "Bildgebende Modalität"
    beschreibung: "Art der durchgeführten Bildgebung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT / DICOM"
      version: "2025-01-31"
    wertebereich: "Mammographie | Sonographie | MRT | Tomosynthese"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund + Senologie_Bildgebung_Observation"
  status: "partial"
  anmerkung: >
    Bildgebungsbefunde sind modelliert (DiagnosticReport + Observation).
    Klinische Brustuntersuchung als eigenständige Procedure/Observation fehlt.
    Anamnese fehlt als strukturiertes Element.

referenzen:
  verwandte_empfehlungen: ["4.3", "4.6", "4.7", "4.8", "4.9"]
```

### Empfehlung 4.2

```yaml
id: S3-5.0-4.2
kapitel: "4.1.1"
kapitel_titel: "Basisdiagnostik"
empfehlung_nr: "4.2"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Wirkungen endogener und exogener Hormone sollten bei Durchführung und
  Befundung diagnostischer Maßnahmen berücksichtigt werden.

datenobjekte:
  - name: "Hormonelle Exposition"
    beschreibung: "Aktuelle Hormoneinnahme (HRT, orale Kontrazeptiva) oder hormoneller Status"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
    verpflichtung: "empfohlen"

  - name: "Menopausenstatus"
    beschreibung: "Prä-/peri-/postmenopausal"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "prämenopausal | perimenopausal | postmenopausal"
    verpflichtung: "empfohlen"

  - name: "Zyklusphase bei Untersuchung"
    beschreibung: "Tag im Menstruationszyklus bei Durchführung der Bildgebung"
    datentyp: "integer / CodeableConcept"
    verpflichtung: "empfohlen"
    bedingung: "Bei prämenopausalen Patientinnen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Hormonelle Kontextinformationen zur Bildgebung fehlen im Profil.
    Menopausenstatus ist im Logical Model vorhanden (Gynäkologische Anamnese),
    aber nicht als Observation/Extension an der Bildgebung modelliert.

referenzen:
  s3_literatur: ["239", "240", "241", "242"]
```

---

## 4.1.2 Bildgebende Verfahren

### Mammographie (Empfehlungen 4.3-4.5)

```yaml
# 4.3-4.5: Mammographie-Indikationen (zusammengefasst)

id: S3-5.0-4.3-bis-4.5
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Mammographie"
zusammenfassung: >
  4.3: Frauen ab 40 Jahren sollen bei auffälligem Befund eine Mammographie erhalten (EK, geprüft 2025)
  4.4: Frauen unter 40 Jahren - Mammographie bei Malignomverdacht wenn Sono/Biopsie nicht ausreicht (EK, geprüft 2025)
  4.5: Geeignete Zusatzaufnahmen zur mammographischen Abklärung (EK, geprüft 2025)

datenobjekte:
  - name: "Mammographie durchgeführt"
    beschreibung: "Ob eine Mammographie erfolgte"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Mammographie-Modalität"
    beschreibung: "Art der Mammographie (2D, Tomosynthese, Zusatzaufnahmen)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "DICOM"
    wertebereich: "2D-Mammographie | Tomosynthese | Spot-/Vergrößerungsaufnahmen"
    verpflichtung: "obligat"
    bedingung: "Wenn Mammographie durchgeführt"

  - name: "Mammographische Dichte"
    beschreibung: "ACR-Dichteklassifikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR / BI-RADS"
    wertebereich: "ACR A (fast vollständig fettig) | ACR B | ACR C | ACR D (extrem dicht)"
    verpflichtung: "obligat"

  - name: "Mammographie-Befundkategorie"
    beschreibung: "BI-RADS-Kategorie des Mammographie-Befunds"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS"
      version: "5. Auflage (2013)"
    wertebereich: "BI-RADS 0-6"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund + Senologie_Bildgebung_Observation"
  status: "partial"
  anmerkung: >
    Bildgebungsbefund als DiagnosticReport mit Modalität vorhanden.
    BI-RADS und ACR-Dichte sind als Observations modellierbar.
    Tomosynthese als Modalität ergänzen.
```

### Empfehlung 4.6

```yaml
id: S3-5.0-4.6
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Sonographie"
empfehlung_nr: "4.6"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Im Rahmen der Abklärung eines auffälligen Befundes und hoher mammographischer Dichte
  bzw. eingeschränkter mammographischer Beurteilbarkeit soll eine Sonographie ergänzend
  durchgeführt werden.

datenobjekte:
  - name: "Sonographie-Indikation"
    beschreibung: "Grund für die ergänzende Sonographie"
    datentyp: "CodeableConcept"
    wertebereich: "Auffälliger Befund | Hohe mammographische Dichte | Eingeschränkte Mammographie-Beurteilbarkeit"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund"
  element: "DiagnosticReport.extension (Indikation) / ServiceRequest.reasonCode"
  status: "partial"
  anmerkung: "Indikation für Sonographie nicht als eigenes Element. Über ServiceRequest.reasonCode modellierbar."

referenzen:
  s3_literatur: ["117", "118", "247"]
```

### Empfehlung 4.7

```yaml
id: S3-5.0-4.7
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Mammographie"
empfehlung_nr: "4.7"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei aktuell nachgewiesenem Malignom soll prätherapeutisch eine Mammographie oder
  Tomosynthese bds. in guter Qualität vorliegen oder durchgeführt werden.

datenobjekte:
  - name: "Bilaterale Mammographie/Tomosynthese prätherapeutisch"
    beschreibung: "Beidseitige Mammographie oder Tomosynthese vor Therapiebeginn"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei nachgewiesenem Malignom"

  - name: "Seite der Bildgebung"
    beschreibung: "Lateralität (beidseits erforderlich)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "links | rechts | beidseits"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund"
  status: "mapped"
  anmerkung: "Lateralität und Modalität im Bildgebungs-Profil vorhanden."

referenzen:
  s3_literatur: ["248", "249"]
```

### Empfehlung 4.8

```yaml
id: S3-5.0-4.8
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Sonographie"
empfehlung_nr: "4.8"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei aktuell nachgewiesenem Malignom soll
  - eine Sonographie beider Axillae erfolgen.
  - Bei auffälligem Axillabefund soll, wenn technisch möglich, eine stanzbioptische
    Klärung ergänzt werden.
  - Bei hoher mammographischer Dichte oder mammographisch erschwerter Beurteilbarkeit
    des Drüsengewebes soll eine Sonographie der Brust bds. ergänzend durchgeführt werden.

datenobjekte:
  - name: "Axilla-Sonographie bilateral"
    beschreibung: "Sonographie beider Axillae bei nachgewiesenem Malignom"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei nachgewiesenem Malignom"

  - name: "Axilla-Sonographie-Befund"
    beschreibung: "Ergebnis der Axilla-Sonographie (auffällig/unauffällig)"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

  - name: "Axilla-Stanzbiopsie"
    beschreibung: "Stanzbiopsie auffälliger axillärer Lymphknoten"
    datentyp: "Procedure"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    verpflichtung: "obligat"
    bedingung: "Bei auffälligem Axillabefund, wenn technisch möglich"

  - name: "Brust-Sonographie bilateral"
    beschreibung: "Ergänzende Brustsonographie bds. bei eingeschränkter Mammographie"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei hoher mammographischer Dichte"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund + Senologie_Bildgebung_Observation"
  status: "partial"
  anmerkung: >
    Bildgebungsbefunde Brust vorhanden. Axilla-Sonographie als eigene Observation
    mit Lateralität ergänzen. Axilla-Stanzbiopsie als Procedure fehlt.

referenzen:
  verwandte_empfehlungen: ["4.21", "4.7"]
```

### Sonographie (Empfehlungen 4.9-4.10)

```yaml
id: S3-5.0-4.9
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Sonographie"
empfehlung_nr: "4.9"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Sonographie soll zur Abklärung klinisch unklarer und mammographischer sowie
  MR-tomographischer Befunde der Beurteilungskategorien 0, 3, 4 und 5 eingesetzt werden.

datenobjekte:
  - name: "Sonographie-Indikation nach BI-RADS"
    beschreibung: "Auslösende BI-RADS-Kategorie für ergänzende Sonographie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS"
    wertebereich: "BI-RADS 0 | BI-RADS 3 | BI-RADS 4 | BI-RADS 5"
    verpflichtung: "obligat"

  - name: "Sonographie-Befundkategorie"
    beschreibung: "BI-RADS-Kategorie des Sonographie-Befunds"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS"
      version: "5. Auflage (2013)"
    wertebereich: "BI-RADS 1-6"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund"
  status: "partial"
  anmerkung: "BI-RADS als Befundkategorie modellierbar. Indikation (auslösender Befund) über ServiceRequest."

referenzen:
  s3_literatur: ["117", "118", "247", "257", "258", "259", "260", "261", "262", "263"]
```

```yaml
id: S3-5.0-4.10
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Sonographie"
empfehlung_nr: "4.10"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Das Ziel einer standardisiert durchgeführten Mammasonographie ist die systematische
  und reproduzierbare Durchuntersuchung der Brustdrüse und der Axilla. Die Befunde
  sollen reproduzierbar dokumentiert werden.

datenobjekte:
  - name: "Systematische Brustsonographie"
    beschreibung: "Standardisierte, reproduzierbare Durchuntersuchung von Brustdrüse und Axilla"
    datentyp: "Procedure"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "16310003"
      display: "Ultrasonography of breast (procedure)"
    verpflichtung: "obligat"

  - name: "Reproduzierbare Befunddokumentation"
    beschreibung: "Standardisierte, nachvollziehbare Dokumentation des Sonographie-Befunds"
    datentyp: "DiagnosticReport"
    verpflichtung: "obligat"
    anmerkung: "Strukturqualitätsmerkmal - betrifft Dokumentationsstandard"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund"
  status: "mapped"
  anmerkung: "DiagnosticReport für Bildgebungsbefunde vorhanden."
```

### Kontrastmittel-Verfahren (Empfehlungen 4.11-4.14)

```yaml
# 4.11-4.14: KM-MRT und KM-Mammographie (zusammengefasst)

id: S3-5.0-4.11-bis-4.14
kapitel: "4.1.2"
kapitel_titel: "Bildgebende Verfahren - Kontrastmittel-Verfahren"
zusammenfassung: >
  4.11: KM-MRT bei unklaren Befunden, die mit MG/US/Biopsie nicht lösbar (B, LoE 2, modifiziert 2025)
  4.12: Ergänzende KM-MRT oder KM-Mammographie prätherapeutisch bei eingeschränkter
        konventioneller Beurteilbarkeit (B, LoE 2, modifiziert 2025)
  4.13: KM-MRT bei Multifokalität/-zentrizität und geplanter BET (EK, neu 2025)
  4.14: KM-MRT/KM-Mammographie nur wo MRT/Mammographie-gestützte Intervention möglich (EK, modifiziert 2025)

datenobjekte:
  - name: "Kontrastmittel-Bildgebung durchgeführt"
    beschreibung: "Ob eine kontrastmittelverstärkte Bildgebung erfolgte"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei eingeschränkter konventioneller Beurteilbarkeit"

  - name: "KM-Bildgebung Modalität"
    beschreibung: "Art der kontrastmittelverstärkten Bildgebung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "DICOM / SNOMED CT"
    wertebereich: "KM-MRT | KM-Mammographie"
    verpflichtung: "obligat"
    bedingung: "Wenn KM-Bildgebung durchgeführt"

  - name: "KM-Bildgebung Indikation"
    beschreibung: "Klinische Indikation für die kontrastmittelverstärkte Untersuchung"
    datentyp: "CodeableConcept"
    wertebereich: >
      Unklarer Befund nach konventioneller Diagnostik |
      Eingeschränkte Beurteilbarkeit der Befundausdehnung |
      Multifokalität/Multizentrizität bei geplanter BET |
      Invasiv-lobuläres Mammakarzinom |
      Dichtes Drüsengewebe (ACR C/D) |
      Hohes genetisches/familiäres Risiko
    verpflichtung: "obligat"

  - name: "KM-MRT Befundkategorie"
    beschreibung: "BI-RADS-Kategorie des MRT-Befunds"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS MRI"
      version: "5. Auflage (2013)"
    wertebereich: "BI-RADS 1-6"
    verpflichtung: "obligat"

  - name: "Interventionsmöglichkeit vorhanden"
    beschreibung: "Ob MRT- oder Mammographie-gestützte Intervention vor Ort möglich ist"
    datentyp: "boolean"
    verpflichtung: "obligat"
    anmerkung: "Strukturqualitätsmerkmal - KM-Verfahren sollen nur dort eingesetzt werden, wo eine gestützte Biopsie möglich ist (4.14)"

fhir_mapping:
  profil: "Senologie_Bildgebung_Befund"
  status: "partial"
  anmerkung: >
    MRT als Modalität im Bildgebungs-Profil vorhanden. KM-Mammographie als
    eigenständige Modalität ergänzen. Indikation und Verfügbarkeit
    interventioneller Optionen fehlen als Elemente.

referenzen:
  s3_literatur: ["273", "274", "275", "276", "277", "278", "279", "280", "281"]
  verwandte_empfehlungen: ["4.6", "4.9", "4.15"]
```

---

## 4.1.3 Diagnostische Sicherung

### Empfehlung 4.15

```yaml
id: S3-5.0-4.15
kapitel: "4.1.3"
kapitel_titel: "Diagnostische Sicherung - Minimalinvasive Biopsie"
empfehlung_nr: "4.15"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die histologische Abklärung von Befunden soll durch Stanzbiopsie, Vakuumbiopsie
  und in zu begründenden Ausnahmefällen durch offene Exzisionsbiopsie erfolgen.

datenobjekte:
  - name: "Biopsie-Methode"
    beschreibung: "Art der histologischen Gewebeentnahme"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "Stanzbiopsie (core needle biopsy) | Vakuumbiopsie (vacuum-assisted biopsy) | Offene Exzisionsbiopsie"
    verpflichtung: "obligat"

  - name: "Biopsie-Steuerung"
    beschreibung: "Bildgebende Steuerung der Biopsie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
    wertebereich: "Sonographisch | Mammographisch (Stereotaxie) | MRT-gesteuert"
    verpflichtung: "obligat"

  - name: "Biopsie-Ergebnis (B-Klassifikation)"
    beschreibung: "Histologische Befundkategorie nach B-Klassifikation"
    datentyp: "CodeableConcept"
    wertebereich: "B1 (normal) | B2 (benigne) | B3 (unsichere biologische Potenz) | B4 (malignitätsverdächtig) | B5 (maligne)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "ex-senologie-specimen-type"
  status: "partial"
  anmerkung: >
    Specimen-Type Extension vorhanden (Biopsie vs. Resektat). B-Klassifikation
    und Steuerungsmethode fehlen als eigenständige Elemente.

referenzen:
  s3_literatur: ["261", "283", "284", "285"]
  verwandte_empfehlungen: ["4.16", "4.17", "4.18", "4.20"]
```

### Empfehlung 4.16

```yaml
id: S3-5.0-4.16
kapitel: "4.1.3"
kapitel_titel: "Diagnostische Sicherung"
empfehlung_nr: "4.16"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Steuerung der Biopsie soll mit Hilfe der Bildgebung erfolgen, die den Befund
  eindeutig darstellt.
  Bei der Wahl der Entnahmemethode sollen die diagnostische Sicherheit und das
  Nebenwirkungsrisiko berücksichtigt werden.
  Der Untersucher soll durch geeignete Maßnahmen sicherstellen, dass die Lokalisation
  des Befundes wiederzufinden ist (z.B. durch Markereinlage).

datenobjekte:
  - name: "Steuerungsmodalität"
    beschreibung: "Bildgebung, die den Befund am besten darstellt und zur Steuerung genutzt wird"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

  - name: "Markereinlage nach Biopsie"
    beschreibung: "Ob ein Marker/Clip zur Wiederfindung der Biopsie-Stelle eingelegt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Marker-Typ"
    beschreibung: "Art des eingelegten Markers (Clip, Magnetmarker etc.)"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"
    bedingung: "Wenn Markereinlage erfolgte"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Biopsie-Details (Steuerung, Marker) sind nicht als Procedure-Profil modelliert."

referenzen:
  verwandte_empfehlungen: ["4.15", "4.25", "4.26"]
```

### Empfehlungen 4.17-4.19 (Biopsie-Spezifika)

```yaml
# 4.17-4.19: Biopsie-Verfahrensspezifika (zusammengefasst)

zusammenfassung: >
  4.17: Sonographisch gesteuerte Stanzbiopsie auch bei MG/MRT-detektierten Befunden
        mit sonographischem Korrelat (EK, geprüft 2025)
  4.18: Röntgen-gesteuerte Vakuumbiopsie bei Mikrokalk ohne Herdbefund (A, LoE 2, modifiziert 2025)
  4.19: Vakuumbiopsie bei röntgen- oder MRT-gesteuerter Gewebegewinnung (EK, modifiziert 2025)

datenobjekte:
  - name: "Nadelkaliber"
    beschreibung: "Gauge-Größe der Biopsienadel"
    datentyp: "Quantity (Gauge)"
    wertebereich: "<= 14 G (empfohlen für Stanzbiopsie)"
    verpflichtung: "empfohlen"

  - name: "Anzahl entnommener Proben"
    beschreibung: "Zahl der entnommenen Stanzzylinder"
    datentyp: "integer"
    wertebereich: ">= 3 (bei Stanzbiopsie mit <= 14 G)"
    verpflichtung: "empfohlen"

  - name: "Zielerfassung bestätigt"
    beschreibung: "Ob die nachweisbare Zielerfassung der Stanznadel dokumentiert wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Biopsie-Prozeduraldetails (Nadel, Probenanzahl, Zielerfassung) nicht modelliert."

referenzen:
  s3_literatur: ["283", "286", "292", "293", "294", "295"]
```

### Empfehlung 4.20

```yaml
id: S3-5.0-4.20
kapitel: "4.1.3"
kapitel_titel: "Diagnostische Sicherung"
empfehlung_nr: "4.20"
typ: "Konsensbasiertes Statement"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei allen Biopsien ist die Korrelation zwischen dem histologischen Ergebnis und
  der klinischen Verdachtsdiagnose zu überprüfen und zu dokumentieren.

datenobjekte:
  - name: "Radiologisch-pathologische Korrelation"
    beschreibung: "Bewertung der Übereinstimmung zwischen Bildgebung und Histologie"
    datentyp: "CodeableConcept"
    wertebereich: "konkordant (Befund erklärt Bildgebung) | diskordant (Befund erklärt Bildgebung nicht)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  status: "gap"
  anmerkung: >
    Radiologisch-pathologische Korrelation fehlt als eigenständiges Datenobjekt.
    Könnte als Observation mit Reference auf DiagnosticReport (Bildgebung) und
    DiagnosticReport (Pathologie) modelliert werden.

referenzen:
  verwandte_empfehlungen: ["4.15", "4.23"]
```

### Empfehlung 4.21

```yaml
id: S3-5.0-4.21
kapitel: "4.1.3"
kapitel_titel: "Diagnostische Sicherung - Lymphknoten"
empfehlung_nr: "4.21"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Zur feingeweblichen Abklärung bildgebend suspekter Lymphknoten sollte primär
  die Stanzbiopsie eingesetzt werden.

datenobjekte:
  - name: "Lymphknoten-Biopsie"
    beschreibung: "Stanzbiopsie suspekter Lymphknoten"
    datentyp: "Procedure"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    verpflichtung: "obligat"
    bedingung: "Bei bildgebend suspekten Lymphknoten"

  - name: "Lymphknoten-Biopsie-Ergebnis"
    beschreibung: "Histologisches Ergebnis der Lymphknoten-Biopsie"
    datentyp: "CodeableConcept"
    wertebereich: "Metastase nachgewiesen | Keine Metastase | Nicht beurteilbar"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Lymphknoten-Biopsie als prätherapeutische Procedure nicht modelliert."

referenzen:
  s3_literatur: ["287", "288", "289", "290", "291", "256"]
  verwandte_empfehlungen: ["4.8"]
```

### Empfehlungen 4.22-4.24 (Probenqualität und Dokumentation)

```yaml
# 4.22-4.24: Probenqualität (zusammengefasst)

zusammenfassung: >
  4.22: >= 3 Proben bei <= 14 G Stanzbiopsie mit Zielerfassung (B, LoE 2)
  4.23: Repräsentative Probenmenge, Präparateradiographie bei Mikrokalk (EK, Statement)
  4.24: Über MRT-Artefaktbildung durch Marker/Tracer aufklären (EK, neu 2025)

datenobjekte:
  - name: "Präparateradiographie durchgeführt"
    beschreibung: "Röntgenaufnahme der entnommenen Probe zur Kontrolle bei Mikrokalk"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Mikrokalk"

  - name: "Probenmenge repräsentativ"
    beschreibung: "Bewertung ob die entnommene Probe diagnostisch repräsentativ ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Marker-Artefakt MRT-relevant"
    beschreibung: "Dokumentation ob eingelegter Marker MRT-Artefakte verursacht"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Qualitätsdokumentation der Biopsie-Prozedur fehlt."
```

### Empfehlungen 4.25-4.26 (Bildgebende Lokalisation)

```yaml
# 4.25-4.26: Präoperative Markierung und Lokalisation

id: S3-5.0-4.25-4.26
kapitel: "4.1.3"
kapitel_titel: "Diagnostische Sicherung - Bildgebende Lokalisation"
zusammenfassung: >
  4.25: Prä-/intraoperative Markierung bei nicht-tastbaren Befunden mit der Methode,
        die den Befund am besten darstellt (EK, geprüft 2025)
  4.26: Drahtmarkierung - Draht im Herd, <1 cm überragend, Lage dokumentieren (EK, modifiziert 2025)

datenobjekte:
  - name: "Präoperative Markierung durchgeführt"
    beschreibung: "Ob eine präoperative Läsionsmarkierung erfolgte"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei nicht-tastbaren Befunden"

  - name: "Markierungsmethode"
    beschreibung: "Art der präoperativen Markierung"
    datentyp: "CodeableConcept"
    wertebereich: "Drahtmarkierung | Magnetmarker (Magseed) | Radarreflektor | Radioaktiver Seed (ROLL) | Kohlemarkierung"
    verpflichtung: "obligat"

  - name: "Markierung Steuerungsmodalität"
    beschreibung: "Bildgebung zur Steuerung der Markierung"
    datentyp: "CodeableConcept"
    wertebereich: "Sonographie | Mammographie/Stereotaxie | MRT"
    verpflichtung: "obligat"

  - name: "Markierung Lage dokumentiert"
    beschreibung: "Bildgebende Dokumentation der korrekten Lage von Draht/Clip/Marker"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Intraoperative Präparateradiographie"
    beschreibung: "Radiologischer Nachweis der adäquaten Resektion intraoperativ"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei nicht-tastbaren Befunden"

fhir_mapping:
  profil: "Senologie_OP_Planung"
  element: "ex-senologie-pre-op-markierung"
  status: "partial"
  anmerkung: >
    Extension ex-senologie-pre-op-markierung existiert (boolean: Markierung geplant).
    Details (Methode, Steuerung, Lagedokumentation) fehlen.
    Intraoperative Präparateradiographie nicht modelliert.

referenzen:
  verwandte_empfehlungen: ["4.16"]
```

---

## 4.1.4 Vorgehen bei pathologischer Sekretion

### Empfehlung 4.27

```yaml
id: S3-5.0-4.27
kapitel: "4.1.4"
kapitel_titel: "Vorgehen bei pathologischer Sekretion"
empfehlung_nr: "4.27"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei pathologischer Sekretion mit V.a. intramammäre Ursache soll eine Sonographie
  und altersabhängig eine Mammographie erfolgen. Ist eine weitere Bildgebung notwendig,
  soll eine MRT erfolgen, da die diagnostische Wertigkeit der MRT der Galaktographie
  überlegen ist. Eine histologische Klärung sollte bei bildgebendem Korrelat mittels
  minimalivasiver Intervention erfolgen.
  Sollte trotz negativer Bildgebung der klinische Verdacht auf ein Malignom weiter
  bestehen, dann soll eine Duktektomie erfolgen.

datenobjekte:
  - name: "Pathologische Sekretion vorhanden"
    beschreibung: "Dokumentation einer pathologischen Mamillensekretion"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    verpflichtung: "obligat"

  - name: "Sekretcharakter"
    beschreibung: "Art der Sekretion (blutig, serös, etc.)"
    datentyp: "CodeableConcept"
    wertebereich: "blutig | serös | milchig | eitrig"
    verpflichtung: "obligat"

  - name: "Diagnostischer Pfad Sekretion"
    beschreibung: "Durchgeführte diagnostische Schritte bei pathologischer Sekretion"
    datentyp: "Sequence(Procedure)"
    wertebereich: "Sonographie → Mammographie → MRT → Biopsie/Duktektomie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Pathologische Sekretion als klinisches Symptom/Befund nicht im Profil.
    Wäre als Observation (Symptom) mit Verlaufs-Dokumentation modellierbar.

referenzen:
  s3_literatur: ["308", "309", "310"]
```

---

## 4.1.5 Staging

### Empfehlung 4.28

```yaml
id: S3-5.0-4.28
kapitel: "4.1.5"
kapitel_titel: "Staging"
empfehlung_nr: "4.28"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Ein Ganzkörperstaging sollte bei allen Patientinnen mit V.a. Fernmetastasen und
  asymptomatischen Patientinnen mit höherem Metastasierungsrisiko (N+, > T2)
  und/oder aggressiver Tumorbiologie (z. B.: HER2+, triple-negativ) sowie bei
  indizierter systemischen Chemo-/Antikörpertherapie mittels CT-Thorax/Abdomen/Becken
  und Skelettszintigraphie und ggf. Erweiterung der Bildgebung abhängig von der
  Symptomatik erfolgen.

datenobjekte:
  - name: "Staging-Indikation"
    beschreibung: "Klinische Indikation für ein Ganzkörperstaging"
    datentyp: "CodeableConcept"
    wertebereich: >
      V.a. Fernmetastasen |
      Erhöhtes Metastasierungsrisiko (N+, > T2) |
      Aggressive Tumorbiologie (HER2+, triple-negativ) |
      Indizierte systemische Chemo-/Antikörpertherapie
    verpflichtung: "obligat"

  - name: "Staging-Untersuchungen"
    beschreibung: "Durchgeführte Staging-Modalitäten"
    datentyp: "CodeableConcept (multiple)"
    terminologie:
      system: "SNOMED CT / DICOM"
    wertebereich: "CT Thorax | CT Abdomen/Becken | Skelettszintigraphie | PET-CT | MRT (bei Bedarf)"
    verpflichtung: "empfohlen"

  - name: "Staging-Ergebnis cM-Status"
    beschreibung: "Klinischer Fernmetastasen-Status"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
    wertebereich: "cM0 | cM1"
    verpflichtung: "obligat"

  - name: "Metastasen-Lokalisation"
    beschreibung: "Organbezogene Lokalisation von Fernmetastasen"
    datentyp: "CodeableConcept (multiple)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
    wertebereich: "Lunge | Leber | Knochen | ZNS | Haut/Weichteile | Andere"
    verpflichtung: "obligat"
    bedingung: "Bei cM1"

fhir_mapping:
  profil: "MII Onkologie TNM + Senologie_Diagnose_Maligne"
  status: "partial"
  anmerkung: >
    TNM cM-Status über MII Onkologie abgebildet. Staging-Untersuchungen als
    DiagnosticReports modellierbar. Metastasen-Lokalisationen über
    cs-senologie-metastasierung vorhanden. Staging-Indikation (Auslöser) fehlt.

referenzen:
  s3_literatur: ["311"]
  verwandte_empfehlungen: ["4.7", "4.8"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 4.1

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.1 | Basisdiagnostik | partial | Klinische Untersuchung als Procedure fehlt |
| 4.2 | Hormonelle Einflüsse | **gap** | Hormoneller Kontext zur Bildgebung |
| 4.3-4.5 | Mammographie-Indikationen | partial | BI-RADS-ValueSet, ACR-Dichte, Tomosynthese |
| 4.6 | Sonographie-Indikation | partial | ServiceRequest.reasonCode ergänzen |
| 4.7 | Bilaterale Mammographie prätherapeutisch | mapped | - |
| 4.8 | Axilla-Sonographie + Stanzbiopsie | partial | Axilla-Sono als eigene Observation |
| 4.9-4.10 | Sonographie-Einsatz + Standardisierung | partial | BI-RADS Sono-Kategorie |
| 4.11-4.14 | KM-MRT / KM-Mammographie | partial | KM-Mammographie als Modalität, Indikation |
| 4.15 | Biopsie-Verfahren | partial | B-Klassifikation, Steuerungsmethode |
| 4.16 | Biopsie-Steuerung + Marker | **gap** | Biopsie-Procedure-Profil |
| 4.17-4.19 | Biopsie-Spezifika | **gap** | Nadelkaliber, Probenanzahl, Zielerfassung |
| 4.20 | Radiologisch-pathologische Korrelation | **gap** | Konkordanz-Observation |
| 4.21 | Lymphknoten-Biopsie | **gap** | Prätherapeutische LK-Biopsie-Procedure |
| 4.22-4.24 | Probenqualität | **gap** | Qualitätsdokumentation Biopsie |
| 4.25-4.26 | Präoperative Markierung | partial | Methode, Steuerung, Lage-Dokumentation |
| 4.27 | Pathologische Sekretion | **gap** | Symptom-Observation, Diagnostischer Pfad |
| 4.28 | Staging | partial | Staging-Indikation, Untersuchungs-Set |

### Kernerkenntnisse Kapitel 4.1

1. **Biopsie-Workflow ist die größte Lücke**: Kein eigenständiges Biopsie-Procedure-Profil mit Details (Steuerung, Nadel, Proben, Marker, B-Klassifikation)
2. **Radiologisch-pathologische Korrelation** (4.20) ist ein zentrales Qualitätsmerkmal das komplett fehlt
3. **BI-RADS als Standardterminologie** für alle Bildgebungsmodalitäten (Mammographie, Sonographie, MRT) durchgängig nutzen
4. **Präoperative Markierung** (4.25-4.26): Extension existiert als boolean, braucht aber Details
5. **Diagnostik = stark Workflow-getrieben** - viele Empfehlungen beschreiben Entscheidungspfade (wenn X, dann Y), die über einfache Datenobjekte hinausgehen
