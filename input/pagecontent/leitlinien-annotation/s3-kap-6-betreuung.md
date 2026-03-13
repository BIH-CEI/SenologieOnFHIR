# S3-Leitlinie v5.0 - Kapitel 6: Behandlung, Betreuung und Begleitung

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 265-296
> Kapitelstruktur: 6.1 Psychoonkologie | 6.2 Supportivtherapie | 6.3 Nachsorge und Langzeitbetreuung | 6.4 Rehabilitation | 6.5 Palliativmedizin | 6.6 Komplementaere Medizin

---

## 6.1 Psychoonkologie

### 6.1.1 Versorgung

> Die Empfehlungen 6.1-6.11 basieren auf der S3-Leitlinie Psychoonkologische Diagnostik, Beratung und Behandlung von erwachsenen Krebspatient\*innen, aktuelle Version 2.1, August 2023, AWMF-Registernummer: 032-051OL.

### Empfehlung 6.1

```yaml
id: S3-5.0-6.1
kapitel: "6.1.2"
kapitel_titel: "Screening und Diagnostik"
empfehlung_nr: "6.1"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Alle Krebspatient*innen sollen ein Screening auf psychosoziale Belastungen erhalten.

datenobjekte:
  - name: "Psychosoziales Belastungsscreening durchgefuehrt"
    beschreibung: "Ob ein Screening auf psychosoziale Belastungen durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Screening-Zeitpunkt"
    beschreibung: "Zeitpunkt der Durchfuehrung des Belastungsscreenings"
    datentyp: "dateTime"
    verpflichtung: "obligat"

  - name: "Screening-Ergebnis"
    beschreibung: "Ergebnis des psychosozialen Belastungsscreenings (auffaellig/unauffaellig)"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Kein bestehendes Senologie-Profil. QuestionnaireResponse fuer Screening-Instrumente denkbar. Encounter-basierte Dokumentation moeglich."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.2

```yaml
id: S3-5.0-6.2
kapitel: "6.1.2"
kapitel_titel: "Screening und Diagnostik"
empfehlung_nr: "6.2"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Ein psychoonkologisches Screening sollte fruehestmoeglich in angemessenen Abstaenden,
  wenn klinisch indiziert oder bei Veraenderung des Erkrankungsstatus eines*einer Patient*in
  (z. B. Wiederauftreten oder Fortschreiten der Erkrankung) wiederholt im Krankheitsverlauf
  werden.

datenobjekte:
  - name: "Screening-Frequenz"
    beschreibung: "Zeitliche Abstaende der Screening-Wiederholung"
    datentyp: "Timing"
    verpflichtung: "empfohlen"

  - name: "Anlass fuer Screening-Wiederholung"
    beschreibung: "Klinischer Anlass zur erneuten Durchfuehrung (Statusaenderung, Rezidiv, Progress)"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CarePlan koennte Screening-Zeitpunkte abbilden. Trigger-Events ueber Encounter oder Condition-Status."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.3

```yaml
id: S3-5.0-6.3
kapitel: "6.1.2"
kapitel_titel: "Screening und Diagnostik"
empfehlung_nr: "6.3"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "geprüft 2025"
text: >
  Zur Erfassung der psychosozialen Belastung sollen validierte und standardisierte
  Screeninginstrumente eingesetzt werden.
  Als Screeninginstrumente sollen das Distress-Thermometer (DT), die Hospital
  Anxiety and Depression Scale (HADS), der Fragebogen zur Belastung von Krebspatienten
  (FBK), das Depressionsmodul des Patient Health Questionnaire (PHQ-9)
  oder die Generalized Anxiety Disorder Scale-7 (GAD-7) eingesetzt werden.

datenobjekte:
  - name: "Screeninginstrument"
    beschreibung: "Art des eingesetzten validierten Screeninginstruments"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "vorschlag"
    wertebereich: "DT | HADS | FBK | PHQ-9 | GAD-7"
    verpflichtung: "obligat"

  - name: "Distress-Thermometer Score"
    beschreibung: "Wert des Distress-Thermometers (0-10)"
    datentyp: "Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "66736-3"
      display: "Distress Thermometer"
      mapping_quelle: "standard"
    wertebereich: "0-10"
    verpflichtung: "obligat"
    bedingung: "Wenn DT als Instrument gewaehlt"

  - name: "PHQ-9 Score"
    beschreibung: "Summenscore des PHQ-9 Fragebogens"
    datentyp: "Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "44261-6"
      display: "Patient Health Questionnaire 9 item (PHQ-9) total score"
      mapping_quelle: "standard"
    wertebereich: "0-27"
    verpflichtung: "obligat"
    bedingung: "Wenn PHQ-9 als Instrument gewaehlt"

  - name: "GAD-7 Score"
    beschreibung: "Summenscore des GAD-7 Fragebogens"
    datentyp: "Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "70274-6"
      display: "Generalized anxiety disorder 7 item (GAD-7) total score"
      mapping_quelle: "standard"
    wertebereich: "0-21"
    verpflichtung: "obligat"
    bedingung: "Wenn GAD-7 als Instrument gewaehlt"

  - name: "HADS Score"
    beschreibung: "Score der Hospital Anxiety and Depression Scale"
    datentyp: "Quantity"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"
    bedingung: "Wenn HADS als Instrument gewaehlt"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Questionnaire/QuestionnaireResponse fuer standardisierte Instrumente. LOINC-Panels fuer PHQ-9 und GAD-7 existieren und koennten als Observation modelliert werden."

referenzen:
  s3_literatur: ["1390", "1391", "1392", "1393", "1394", "1395", "1396", "1397", "1398", "1399", "1400", "1401", "1402", "1403", "1404", "1405"]
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.4

```yaml
id: S3-5.0-6.4
kapitel: "6.1.2"
kapitel_titel: "Screening und Diagnostik"
empfehlung_nr: "6.4"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "geprüft 2025"
text: >
  Zusaetzlich zum Belastungsscreening soll der subjektive psychosoziale Unterstuetzungsbedarf
  erfragt werden.

datenobjekte:
  - name: "Subjektiver Unterstuetzungsbedarf"
    beschreibung: "Ob die Patientin subjektiven psychosozialen Unterstuetzungsbedarf angibt"
    datentyp: "CodeableConcept"
    wertebereich: "ja | nein | unklar"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Kann als zusaetzliche Observation zum Screening oder als Item im Questionnaire erfasst werden."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.5

```yaml
id: S3-5.0-6.5
kapitel: "6.1.2"
kapitel_titel: "Screening und Diagnostik"
empfehlung_nr: "6.5"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "geprüft 2025"
text: >
  Bei positivem Screening und/oder subjektivem Unterstuetzungsbedarf soll ein diagnostisches
  Gespraech zur Abklaerung psychosozialer Belastungen, psychischer Komorbidität sowie dem
  Unterstuetzungs- und Behandlungsbedarf angeboten werden.

datenobjekte:
  - name: "Diagnostisches Gespraech angeboten"
    beschreibung: "Ob ein diagnostisches Gespraech zur Abklaerung angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei positivem Screening oder subjektivem Unterstuetzungsbedarf"

  - name: "Diagnostisches Gespraech durchgefuehrt"
    beschreibung: "Ob das diagnostische Gespraech tatsaechlich stattfand"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Psychische Komorbidität identifiziert"
    beschreibung: "Ob eine psychische Komorbidität im Gespraech festgestellt wurde"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "empfohlen"
    bedingung: "Wenn Gespraech durchgefuehrt"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Encounter fuer Gespraech. Condition fuer identifizierte psychische Komorbidität."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.6

```yaml
id: S3-5.0-6.6
kapitel: "6.1.2"
kapitel_titel: "Screening und Diagnostik"
empfehlung_nr: "6.6"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Eine weiterfuehrende diagnostische Abklaerung sollte entsprechend der im Gespraech
  festgestellten individuellen Probleme im psychischen/sozialen/somatischen Bereich erfolgen.

datenobjekte:
  - name: "Weiterfuehrende Diagnostik veranlasst"
    beschreibung: "Ob eine weiterfuehrende diagnostische Abklaerung eingeleitet wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Wenn im diagnostischen Gespraech Probleme identifiziert"

  - name: "Problembereich"
    beschreibung: "Bereich der identifizierten Probleme"
    datentyp: "CodeableConcept"
    wertebereich: "psychisch | sozial | somatisch"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "ServiceRequest fuer diagnostische Abklaerung. Condition fuer identifizierte Probleme."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### 6.1.3 Psychoonkologische Interventionen

### Empfehlung 6.7

```yaml
id: S3-5.0-6.7
kapitel: "6.1.3"
kapitel_titel: "Psychoonkologische Interventionen"
empfehlung_nr: "6.7"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Indikationsstellung fuer psychoonkologische Interventionen soll entsprechend
  dem nach den Empfehlungen 7.1. bis 7.5 aus der S3-Leitlinie Psychoonkologie
  festgestellten individuellen Bedarf, dem Setting sowie der Krankheitsphase der
  Patient*innen (Erstdiagnose, Operation, adjuvante Therapie, rezidivfreie Phase,
  Rezidivphase, palliative Phase) erfolgen und den Wunsch der Patient*innen nach
  psychoonkologischer Unterstuetzung beruecksichtigen.

datenobjekte:
  - name: "Krankheitsphase"
    beschreibung: "Aktuelle Phase der Erkrankung fuer Interventionsentscheidung"
    datentyp: "CodeableConcept"
    wertebereich: "Erstdiagnose | Operation | adjuvante Therapie | rezidivfreie Phase | Rezidivphase | palliative Phase"
    verpflichtung: "obligat"

  - name: "Psychoonkologische Intervention indiziert"
    beschreibung: "Ob eine psychoonkologische Intervention indiziert ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Art der Intervention"
    beschreibung: "Typ der empfohlenen psychoonkologischen Intervention"
    datentyp: "CodeableConcept"
    wertebereich: "psychotherapeutisch | psychoedukativ | Entspannung | E-Health | Beratung | Krisenintervention | kuenstlerische Therapie | ergaenzende Therapie"
    verpflichtung: "empfohlen"
    bedingung: "Wenn Intervention indiziert"

  - name: "Setting"
    beschreibung: "Versorgungssetting der Intervention"
    datentyp: "CodeableConcept"
    wertebereich: "stationaer | ambulant | Rehabilitation"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CarePlan oder ServiceRequest fuer Interventionsplanung. Procedure fuer durchgefuehrte Intervention."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.8

```yaml
id: S3-5.0-6.8
kapitel: "6.1.3"
kapitel_titel: "Psychoonkologische Interventionen"
empfehlung_nr: "6.8"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Patient*innen mit keiner oder geringer Belastung (festgestellt ueber Screening und
  durch weiterfuehrende Diagnostik) sollen eine patient*innenorientierte Information
  und eine psychosoziale Beratung angeboten oder vermittelt werden.

datenobjekte:
  - name: "Belastungsniveau"
    beschreibung: "Einschaetzung des Belastungsniveaus nach Screening"
    datentyp: "CodeableConcept"
    wertebereich: "keine | gering | mittel | hoch"
    verpflichtung: "obligat"

  - name: "Information/Beratung angeboten"
    beschreibung: "Ob Information und psychosoziale Beratung angeboten wurden"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei keiner oder geringer Belastung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Procedure oder Communication fuer Beratungsangebot."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.9

```yaml
id: S3-5.0-6.9
kapitel: "6.1.3"
kapitel_titel: "Psychoonkologische Interventionen"
empfehlung_nr: "6.9"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Zusaetzlich zu Empfehlung 8.2 der S3-Leitlinie Psychoonkologie sollen Patient*innen
  mit subsyndromalen psychischen Belastungen (festgestellt ueber Screening und durch
  weiterfuehrende Diagnostik) psychotherapeutische/psychoonkologische Einzel- und/oder
  Gruppenintervention angeboten werden.

datenobjekte:
  - name: "Subsyndromale Belastung festgestellt"
    beschreibung: "Ob subsyndromale psychische Belastung identifiziert wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Psychotherapeutische Intervention angeboten"
    beschreibung: "Ob Einzel- und/oder Gruppenintervention angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei subsyndromaler Belastung"

  - name: "Interventionsform"
    beschreibung: "Einzel- oder Gruppenintervention"
    datentyp: "CodeableConcept"
    wertebereich: "Einzelintervention | Gruppenintervention | beides"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Procedure fuer Intervention. ServiceRequest fuer Ueberweisung."

referenzen:
  s3_literatur: ["1431", "1432", "1433", "1434", "1435", "1436", "1437", "1438", "1439", "1440", "1441", "1442", "1443", "1444", "1445", "1446", "1447", "1448", "1449", "1450", "1451", "1452", "1453", "1454", "1455", "1456", "1457", "1458", "1459", "1460", "1461", "1462", "1463", "1464", "1465", "1466", "1467", "1468", "1469", "1470", "1471", "1472", "1473"]
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.10

```yaml
id: S3-5.0-6.10
kapitel: "6.1.3"
kapitel_titel: "Psychoonkologische Interventionen"
empfehlung_nr: "6.10"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Patient*innen mit diagnostizierten psychischen Stoerungen sollen entsprechend
  den vorhandenen stoerungsspezifischen Leitlinien versorgt werden.

datenobjekte:
  - name: "Psychische Stoerung diagnostiziert"
    beschreibung: "ICD-10 kodierte psychische Stoerung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "F00-F99"
    verpflichtung: "obligat"
    bedingung: "Wenn psychische Stoerung diagnostiziert"

  - name: "Leitliniengerechte Versorgung eingeleitet"
    beschreibung: "Ob stoerungsspezifische leitliniengerechte Behandlung eingeleitet wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Condition fuer psychische Stoerung. CarePlan/ServiceRequest fuer leitliniengerechte Behandlung."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

### Empfehlung 6.11

```yaml
id: S3-5.0-6.11
kapitel: "6.1.3"
kapitel_titel: "Psychoonkologische Interventionen"
empfehlung_nr: "6.11"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Patient*innen mit einer Anpassungsstoerung gemaess ICD-10 (festgestellt ueber
  Screening und weiterfuehrende Diagnostik) sollen eine patient*innenzentrierte
  Information und eine psychosoziale Beratung sowie zusaetzlich eine psychotherapeutische
  Einzel- und/oder Gruppenintervention angeboten werden.

datenobjekte:
  - name: "Anpassungsstoerung (ICD-10)"
    beschreibung: "Diagnose Anpassungsstoerung gemaess ICD-10"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "F43.2"
      display: "Anpassungsstoerungen"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Psychotherapeutische Intervention angeboten"
    beschreibung: "Ob Einzel-/Gruppenintervention angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Condition (F43.2). Procedure fuer psychotherapeutische Intervention."

referenzen:
  querschnittsleitlinien: ["S3 Psychoonkologie 032-051OL"]
```

---

## 6.2 Supportivtherapie

### Empfehlung 6.12

```yaml
id: S3-5.0-6.12
kapitel: "6.2"
kapitel_titel: "Supportivtherapie"
empfehlung_nr: "6.12"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen und Patienten mit Mammakarzinom sollen im Rahmen der Supportivtherapie
  nach der Querschnittleitlinie S3-Leitlinie Supportive Therapie bei onkologischen
  PatientInnen (AWMF-Registernummer: 032-054OL, aktuelle Version) behandelt werden.
  Die folgenden Themenbereiche zur supportiven Therapie sind relevant:
  Tumortherapie-induzierte Anaemie, Antiemese, Granulopoetische Wachstumsfaktoren,
  Hauttoxizitaeten, Schleimhauttoxizitaet, Tumortherapie-induzierte Diarrhoe,
  Periphere Neurotoxizitaet (PNP), Ossaere Komplikationen, Paravasate,
  Supportive Massnahmen in der Radioonkologie, Immunvermittelte Nebenwirkungen
  durch Immuncheckpoint-Inhibition (irAEs), Kardiotoxizitaet, Zentrale Neurotoxizitaet.

datenobjekte:
  - name: "Nebenwirkung/Toxizitaet"
    beschreibung: "Art der therapieassoziierten Nebenwirkung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "CTCAE"
      version: "5.0"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"
    bedingung: "Bei Auftreten von Nebenwirkungen"

  - name: "Schweregrad (CTCAE)"
    beschreibung: "Schweregrad der Nebenwirkung nach CTCAE"
    datentyp: "CodeableConcept"
    terminologie:
      system: "CTCAE"
      version: "5.0"
      mapping_quelle: "leitlinie"
    wertebereich: "Grad 1 | Grad 2 | Grad 3 | Grad 4 | Grad 5"
    verpflichtung: "obligat"

  - name: "Supportive Massnahme"
    beschreibung: "Art der eingeleiteten supportiven Therapie"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"
    bedingung: "Wenn Nebenwirkung behandelt"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "AdverseEvent fuer Nebenwirkungen mit CTCAE-Grading. MedicationRequest/Procedure fuer supportive Massnahmen. CTCAE v5.0 als Terminologie explizit in der Leitlinie benannt."

referenzen:
  querschnittsleitlinien: ["S3 Supportive Therapie 032-054OL"]
```

---

## 6.3 Nachsorge und Langzeitbetreuung

### 6.3.1 Ziele

### Empfehlung 6.13

```yaml
id: S3-5.0-6.13
kapitel: "6.3.1"
kapitel_titel: "Ziele der Nachsorge"
empfehlung_nr: "6.13"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Nachsorge bei Patienten und Patientinnen mit Mammakarzinom beginnt mit
  der abgeschlossenen lokoregionaeren Primaerbehandlung. Sie besteht aus Anamnese,
  koerperlicher Untersuchung, aerztlicher Beratung, Betreuung und Begleitung
  sowie bildgebender Diagnostik zur Erkennung eines lokal- und lokoregionaeren
  Rezidivs und eines kontralateralen Mammakarzinoms.
  Bei auffaelligem Befund ist die Nachsorge symptomorientiert zu konzipieren.

datenobjekte:
  - name: "Nachsorge-Beginn"
    beschreibung: "Zeitpunkt des Beginns der strukturierten Nachsorge (nach Abschluss Primaerbehandlung)"
    datentyp: "dateTime"
    verpflichtung: "obligat"

  - name: "Anamnese durchgefuehrt"
    beschreibung: "Ob eine Anamnese im Rahmen der Nachsorge erhoben wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Koerperliche Untersuchung"
    beschreibung: "Koerperliche Untersuchung inkl. Lokalbefund und kontralateraler Mamma"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Bildgebende Diagnostik durchgefuehrt"
    beschreibung: "Ob bildgebende Diagnostik (Mammographie etc.) durchgefuehrt"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CarePlan fuer Nachsorge-Schema. Encounter fuer einzelne Nachsorge-Termine. Keine senologiespezifischen Profile vorhanden."

referenzen:
  s3_literatur: ["1474"]
```

### Empfehlung 6.14

```yaml
id: S3-5.0-6.14
kapitel: "6.3.1"
kapitel_titel: "Ziele der Nachsorge"
empfehlung_nr: "6.14"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Bedarf sind in die individuelle Nachsorge von Brustkrebspatientinnen und
  Brustkrebspatienten onkologisch versierte Fachaerzte und auch andere Berufsgruppen,
  zum Beispiel Psychoonkologen, Physiotherapeuten, Lymphologen, onkologische
  Fachkrankenpflegende, Breast Care Nurses u. a. mit einzubeziehen. Je nach
  individuellem Bedarf sind Informationen ueber die Moeglichkeiten der weiteren
  Beratung und Betreuung u. a. Angebote der Selbsthilfe zu vermitteln.

datenobjekte:
  - name: "Beteiligte Berufsgruppen"
    beschreibung: "In die Nachsorge einbezogene Fachdisziplinen/Berufsgruppen"
    datentyp: "CodeableConcept"
    wertebereich: "Psychoonkologie | Physiotherapie | Lymphologie | onkologische Fachpflege | Breast Care Nurse | Selbsthilfe | andere"
    verpflichtung: "empfohlen"

  - name: "Verweis an Selbsthilfe"
    beschreibung: "Ob auf Angebote der Selbsthilfe hingewiesen wurde"
    datentyp: "boolean"
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CareTeam fuer beteiligte Berufsgruppen. ServiceRequest fuer Ueberweisungen."

referenzen:
  s3_literatur: ["1474"]
```

### 6.3.2 Untersuchungen zum lokoregionalen/intramammären Rezidiv

### Empfehlung 6.15

```yaml
id: S3-5.0-6.15
kapitel: "6.3.2"
kapitel_titel: "Untersuchungen zum lokoregionalen Rezidiv"
empfehlung_nr: "6.15"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die bildgebende Diagnostik zur Detektion von lokal- und lokoregionaeren Rezidiven
  und kontralateralen Karzinomen sollte die jaehrliche Mammographie umfassen.

datenobjekte:
  - name: "Mammographie durchgefuehrt"
    beschreibung: "Ob eine Mammographie im Rahmen der Nachsorge durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Mammographie-Datum"
    beschreibung: "Datum der Nachsorge-Mammographie"
    datentyp: "dateTime"
    verpflichtung: "empfohlen"

  - name: "Mammographie-Befund"
    beschreibung: "Ergebnis der Mammographie (BI-RADS)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS"
      version: "5th Edition"
      mapping_quelle: "standard"
    wertebereich: "BI-RADS 0-6"
    verpflichtung: "empfohlen"

  - name: "Seite"
    beschreibung: "Welche Seite untersucht wurde"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "ipsilateral | kontralateral | beidseits"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "DiagnosticReport/ImagingStudy fuer Mammographie. Observation fuer BI-RADS."

referenzen:
  s3_literatur: ["1479", "340"]
```

### Empfehlung 6.16

```yaml
id: S3-5.0-6.16
kapitel: "6.3.2"
kapitel_titel: "Untersuchungen zum lokoregionalen Rezidiv"
empfehlung_nr: "6.16"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine Sonographie der ipsilateralen und kontralateralen Brust sollte bei hoeherer
  Brustdichte (ACR c,d) oder Abbildungsproblemen der operierten Brust ergaenzend
  zur Mammographie durchgefuehrt werden.

datenobjekte:
  - name: "Brustdichte (ACR)"
    beschreibung: "Mammographische Brustdichte nach ACR-Klassifikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR"
      mapping_quelle: "leitlinie"
    wertebereich: "ACR a | ACR b | ACR c | ACR d"
    verpflichtung: "empfohlen"

  - name: "Ergaenzende Sonographie durchgefuehrt"
    beschreibung: "Ob eine ergaenzende Mammasonographie durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei ACR c/d oder Abbildungsproblemen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "DiagnosticReport fuer Sonographie. Observation fuer ACR-Dichte."

referenzen:
  verwandte_empfehlungen: ["6.15"]
```

### Empfehlung 6.17

```yaml
id: S3-5.0-6.17
kapitel: "6.3.2"
kapitel_titel: "Untersuchungen zum lokoregionalen Rezidiv"
empfehlung_nr: "6.17"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen und Patienten mit Zustand nach Mammakarzinom kann zur Beurteilung
  der Axilla eine ergaenzende Sonographie durchgefuehrt werden.

datenobjekte:
  - name: "Axilla-Sonographie durchgefuehrt"
    beschreibung: "Ob eine Sonographie der Axilla durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "DiagnosticReport fuer Axilla-Sonographie."

referenzen:
  verwandte_empfehlungen: ["6.15", "6.16"]
```

### Empfehlung 6.18

```yaml
id: S3-5.0-6.18
kapitel: "6.3.2"
kapitel_titel: "Untersuchungen zum lokoregionalen Rezidiv"
empfehlung_nr: "6.18"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Durch die ergaenzende qualitaetsgesicherte Ultraschalluntersuchung in der Nachsorge
  erhoeht sich die Wiedereinbestellungs- und die Biopsierate. Patientinnen berichteten
  am haeufigsten (82%) ueber psychisch positive Aspekte durch erhoehte Aufmerksamkeit
  und damit verbundenen Sicherheit, selten (<6%) psychische Belastungen durch
  Verunsicherung und Angst. Sie sollte bei nicht ausreichend beurteilbarer
  Mammographie durchgefuehrt werden.

datenobjekte:
  - name: "Ergaenzender Ultraschall durchgefuehrt"
    beschreibung: "Ob ein ergaenzender qualitaetsgesicherter Ultraschall durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei nicht ausreichend beurteilbarer Mammographie"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "DiagnosticReport/ImagingStudy fuer Ultraschalluntersuchung."

referenzen:
  s3_literatur: ["1485", "1486"]
```

### 6.3.3 Maenner mit Brustkrebs

### Empfehlung 6.19

```yaml
id: S3-5.0-6.19
kapitel: "6.3.3"
kapitel_titel: "Maenner mit Brustkrebs"
empfehlung_nr: "6.19"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Maenner mit Brustkrebs sollen wie Frauen eine jaehrliche bildgebende Diagnostik
  erhalten, insbesondere da ein hoeheres Risiko fuer ein kontralaterales Karzinom besteht.

datenobjekte:
  - name: "Geschlecht"
    beschreibung: "Geschlecht des Patienten"
    datentyp: "code"
    terminologie:
      system: "HL7 AdministrativeGender"
      mapping_quelle: "standard"
    wertebereich: "male"
    verpflichtung: "obligat"

  - name: "Jaehrliche Bildgebung durchgefuehrt"
    beschreibung: "Ob jaehrliche bildgebende Diagnostik erfolgte"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Patient.gender = male. CarePlan mit gleichem Nachsorge-Schema wie bei Frauen."

referenzen:
  s3_literatur: ["1487"]
```

### 6.3.4 Untersuchung auf Metastasen

### Empfehlung 6.20

```yaml
id: S3-5.0-6.20
kapitel: "6.3.4"
kapitel_titel: "Untersuchung auf Metastasen"
empfehlung_nr: "6.20"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine intensivierte apparative und labortechnische Diagnostik mit Knochenszintigrafie,
  CT, PET oder MRT sowie Blutbildbestimmung, Serum-Biochemie oder Tumormarkerbestimmung
  soll in der Nachsorge nicht standardmaessig durchgefuehrt werden.

datenobjekte:
  - name: "Intensivierte Diagnostik durchgefuehrt"
    beschreibung: "Ob eine intensivierte apparative/labortechnische Diagnostik in der Nachsorge durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Art der Diagnostik"
    beschreibung: "Art der durchgefuehrten intensivierten Diagnostik (sollte nur bei Symptomatik erfolgen)"
    datentyp: "CodeableConcept"
    wertebereich: "Knochenszintigrafie | CT | PET | MRT | Blutbild | Serum-Biochemie | Tumormarker"
    verpflichtung: "obligat"
    bedingung: "Nur bei klinischer Indikation / Symptomatik"

  - name: "Indikation fuer intensivierte Diagnostik"
    beschreibung: "Klinischer Anlass (Symptomatik, Verdacht auf Rezidiv/Metastasen)"
    datentyp: "string"
    verpflichtung: "obligat"
    bedingung: "Wenn intensivierte Diagnostik durchgefuehrt"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "ServiceRequest/DiagnosticReport fuer erweiterte Diagnostik. Wichtig: Negative Empfehlung - standardmaessig NICHT durchzufuehren."

referenzen:
  s3_literatur: ["1479", "340"]
  verwandte_empfehlungen: ["6.15"]
```

### 6.3.5 Diagnostik und Therapie von Neben- und Folgewirkungen

#### 6.3.5.1 Lymphoedem

### Empfehlung 6.21

```yaml
id: S3-5.0-6.21
kapitel: "6.3.5.1"
kapitel_titel: "Lymphoedem"
empfehlung_nr: "6.21"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Alle Patientinnen und Patienten mit axillaerer Lymphadenektomie sollen ueber die
  Optionen der Erkennung, Prophylaxe und Behandlung eines postoperativen Lymphoedems
  aufgeklaert werden.

datenobjekte:
  - name: "Axillaere Lymphadenektomie durchgefuehrt"
    beschreibung: "Ob eine axillaere Lymphadenektomie erfolgte"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "234262008"
      display: "Excision of axillary lymph node (procedure)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Aufklaerung Lymphoedem erfolgt"
    beschreibung: "Ob ueber Erkennung, Prophylaxe und Behandlung des Lymphoedems aufgeklaert wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Z.n. axillaerer Lymphadenektomie"

  - name: "Lymphoedem vorhanden"
    beschreibung: "Ob ein sekundaeres Lymphoedem des Armes vorliegt"
    datentyp: "boolean"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "I97.2"
      display: "Lymphoedem nach Mastektomie"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Condition fuer Lymphoedem. Procedure fuer Lymphadenektomie. Communication fuer Aufklaerung."

referenzen:
  s3_literatur: ["261", "1490", "1491", "1492", "1493", "1494", "1495", "1496", "1497", "1498", "1499"]
  querschnittsleitlinien: ["S3 Diagnostik und Therapie der Lymphoedeme 058-001"]
```

### Empfehlung 6.22

```yaml
id: S3-5.0-6.22
kapitel: "6.3.5"
kapitel_titel: "Diagnostik und Therapie von Neben- und Folgewirkungen"
empfehlung_nr: "6.22"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Relevante therapieassoziierte Nebenwirkungen und Langzeitfolgen bei Patientinnen
  und Patienten mit Brustkrebs, deren Praevention, Diagnostik sowie Behandlungsoptionen
  sollen gemaess der S3-Querschnittleitlinie Supportiv-Therapie bei onkologischen
  PatientInnen (AWMF-Registernummer: 032-054OL) behandelt werden.
  Hierzu zaehlen: Diarrhoe, Neutropenie, Anaemie, Klimakterisches Syndrom,
  Schmerzen (Arthralgien), Thromboembolische Ereignisse, Fatigue,
  Insomnie, Neurotoxizitaet, Kardiotoxizitaet, Leukaemie,
  Stoerung der Sexualitaet, Lebensqualitaetseinschraenkungen.

datenobjekte:
  - name: "Therapieassoziierte Nebenwirkung"
    beschreibung: "Art der therapieassoziierten Nebenwirkung/Langzeitfolge"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Diarrhoe | Neutropenie | Anaemie | Klimakterisches Syndrom | Arthralgien | Thromboembolische Ereignisse | Fatigue | Insomnie | Neurotoxizitaet | Kardiotoxizitaet | Leukaemie | Sexuelle Funktionsstoerung | Lebensqualitaetseinschraenkung"
    verpflichtung: "obligat"
    bedingung: "Bei Auftreten"

  - name: "Behandlung eingeleitet"
    beschreibung: "Ob eine leitliniengerechte Behandlung eingeleitet wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "AdverseEvent / Condition fuer Nebenwirkungen. Verweis auf S3 Supportivtherapie."

referenzen:
  querschnittsleitlinien: ["S3 Supportive Therapie 032-054OL"]
```

### 6.3.6 Haeufigkeit der Nachuntersuchungen

### Empfehlung 6.23

```yaml
id: S3-5.0-6.23
kapitel: "6.3.6"
kapitel_titel: "Haeufigkeit der Nachuntersuchungen"
empfehlung_nr: "6.23"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die klinischen Nachsorgeuntersuchungen sollten in den ersten 3 Jahren nach der
  lokalen Primaertherapie bei asymptomatischen Patientinnen und Patienten mit
  invasivem Mammakarzinom vierteljaehrlich, bei asymptomatischen Patientinnen und
  Patienten mit nicht invasivem Mammakarzinom halbjaehrlich, im 4. und 5. Jahr
  halbjaehrlich und ab dem 6. Jahr jaehrlich erfolgen. Jaehrliche gynaekologische
  Frueherkennungsuntersuchungen sind miteinzuschliessen.

datenobjekte:
  - name: "Tumortyp (invasiv/nicht-invasiv)"
    beschreibung: "Ob invasives oder nicht-invasives Mammakarzinom vorliegt"
    datentyp: "CodeableConcept"
    wertebereich: "invasiv | nicht-invasiv (DCIS)"
    verpflichtung: "obligat"

  - name: "Jahre seit Primaertherapie"
    beschreibung: "Zeitraum seit Abschluss der lokalen Primaertherapie"
    datentyp: "Quantity (Jahre)"
    verpflichtung: "obligat"

  - name: "Nachsorge-Intervall"
    beschreibung: "Empfohlenes Intervall zwischen Nachsorgeuntersuchungen"
    datentyp: "Timing"
    wertebereich: "invasiv Jahr 1-3: alle 3 Mon. | invasiv Jahr 4-5: alle 6 Mon. | ab Jahr 6: alle 12 Mon. | nicht-invasiv Jahr 1-3: alle 6 Mon."
    verpflichtung: "obligat"

  - name: "Gynaekologische Frueherkennung"
    beschreibung: "Ob jaehrliche gynaekologische Frueherkennungsuntersuchung eingeschlossen"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    BESONDERS WICHTIG fuer FHIR-Modellierung: CarePlan mit Timing fuer strukturiertes
    Nachsorge-Schema. Appointment/Encounter fuer einzelne Termine.
    Nachsorge-Schema-Tabelle (Tabelle 9 der Leitlinie) definiert konkrete Intervalle.

referenzen:
  verwandte_empfehlungen: ["6.13", "6.15"]
```

> **Nachsorge-Schema (Tabelle 9 der Leitlinie)** - BESONDERS WICHTIG fuer FHIR-Modellierung:
>
> | Untersuchung | Jahr 1-3 | Jahr 4-5 | ab Jahr 6 |
> |---|---|---|---|
> | Anamnese, klin. Untersuchung, Beratung | invasiv: alle 3 Mon. / in situ: alle 6 Mon. | alle 6 Mon. | alle 12 Mon. |
> | Selbstuntersuchung | monatlich | monatlich | monatlich |
> | Bildgebende Diagnostik, Labor | nur bei Symptomatik / Verdacht auf Rezidiv/Metastasen | | |
> | Mammographie + ggf. Sonographie (nach BET) | beidseits: alle 12 Monate | | |
> | Mammographie + ggf. Sonographie (nach Mastektomie) | kontralateral: alle 12 Monate | | |
> | Echokardiografie | 6, 12, 24 Mon., dann jaehrlich bis 5 J. nach Anthrazyklin-/Trastuzumab-Therapie; danach alle 5 J. | | |
>
> Hinweis: Erste Mammographie nach BET: 1 Jahr nach initialer Mammographie oder mind. 6 Monate nach abgeschlossener Radiatio.

### Empfehlung 6.24

```yaml
id: S3-5.0-6.24
kapitel: "6.3.6"
kapitel_titel: "Haeufigkeit der Nachuntersuchungen"
empfehlung_nr: "6.24"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Essenzieller Bestandteil der Nachsorge ist die stetige Motivation der Patientinnen
  und Patienten zur regelmaessigen Einnahme der zur adjuvanten Therapie verordneten
  Medikamente, insbesondere der endokrin-basierten Therapie einschliesslich
  Ovarsuppression (z. B. Tamoxifen oder Aromatasehemmer).
  Die Patienten sind eingehend nach Vertraeglichkeit bzw. Nebenwirkungen der Therapie
  zu befragen. Beschwerden sind mit geeigneten Massnahmen zu behandeln.
  Ein vorzeitiger Therapieabbruch kann durch einen Wechsel der endokrinen Behandlung
  verhindert werden.

datenobjekte:
  - name: "Endokrine Therapie verordnet"
    beschreibung: "Ob eine adjuvante endokrine Therapie verordnet ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Medikament"
    beschreibung: "Art der verordneten endokrinen Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      mapping_quelle: "standard"
    wertebereich: "Tamoxifen | Aromatasehemmer | GnRH-Agonist"
    verpflichtung: "obligat"
    bedingung: "Wenn endokrine Therapie verordnet"

  - name: "Therapieadhaerenz"
    beschreibung: "Ob die Patientin die Medikamente regelmaessig einnimmt"
    datentyp: "CodeableConcept"
    wertebereich: "adharent | teilweise adharent | nicht adharent | abgebrochen"
    verpflichtung: "obligat"

  - name: "Nebenwirkungen der endokrinen Therapie"
    beschreibung: "Art und Schwere der Nebenwirkungen"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"

  - name: "Therapiewechsel/-abbruch"
    beschreibung: "Ob ein Wechsel oder Abbruch der endokrinen Therapie erfolgte"
    datentyp: "CodeableConcept"
    wertebereich: "fortgesetzt | gewechselt | abgebrochen"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "MedicationRequest/MedicationStatement fuer endokrine Therapie. Observation fuer Adhaerenz. AdverseEvent fuer Nebenwirkungen."

referenzen:
  s3_literatur: ["1516"]
```

---

## 6.4 Rehabilitation

### Empfehlung 6.25

```yaml
id: S3-5.0-6.25
kapitel: "6.4"
kapitel_titel: "Rehabilitation"
empfehlung_nr: "6.25"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Patientinnen sollen ueber die Moeglichkeiten ambulanter und stationaerer
  Rehabilitationsmassnahmen sowie weiterer Ansprueche, die sich aus dem Sozialrecht
  ergeben, fruehzeitig informiert werden. Bei der Indikationsstellung und der Empfehlung
  zur Rehabilitationsart sollen die Wuensche der Patientinnen beruecksichtigt werden.

datenobjekte:
  - name: "Information ueber Rehabilitation erfolgt"
    beschreibung: "Ob ueber Rehabilitationsmassnahmen informiert wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Rehabilitationsart"
    beschreibung: "Empfohlene Art der Rehabilitation"
    datentyp: "CodeableConcept"
    wertebereich: "ambulant | stationaer"
    verpflichtung: "empfohlen"

  - name: "Rehabilitation beantragt"
    beschreibung: "Ob eine Rehabilitation beantragt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "ServiceRequest fuer Rehabilitationsantrag. Encounter fuer Rehabilitation."

referenzen: {}
```

### Empfehlung 6.26

```yaml
id: S3-5.0-6.26
kapitel: "6.4"
kapitel_titel: "Rehabilitation"
empfehlung_nr: "6.26"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bewegungsprogramme mit Kraft und Ausdauertraining sollen mit dem Ziel angeboten werden,
  therapiebedingte Einschraenkungen der koerperlichen Leistungsfaehigkeit zu reduzieren,
  eine Erschoepfung/Fatigue zu reduzieren sowie die Lebensqualitaet der
  Brustkrebspatientinnen zu verbessern.

datenobjekte:
  - name: "Bewegungsprogramm angeboten"
    beschreibung: "Ob ein Bewegungsprogramm mit Kraft/Ausdauertraining angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Art des Trainings"
    beschreibung: "Art des empfohlenen Bewegungsprogramms"
    datentyp: "CodeableConcept"
    wertebereich: "Krafttraining | Ausdauertraining | kombiniert"
    verpflichtung: "empfohlen"

  - name: "Fatigue-Screening"
    beschreibung: "Screening auf tumorassoziierte Fatigue"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "vorschlag"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CarePlan/ServiceRequest fuer Bewegungsprogramm. Observation fuer Fatigue-Assessment."

referenzen:
  s3_literatur: ["945", "1517"]
```

### Empfehlung 6.27

```yaml
id: S3-5.0-6.27
kapitel: "6.4"
kapitel_titel: "Rehabilitation"
empfehlung_nr: "6.27"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Eine Physiotherapie zur Mobilisation des Schultergelenks soll in den ersten beiden
  Wochen postoperativ beginnen.

datenobjekte:
  - name: "Physiotherapie begonnen"
    beschreibung: "Ob Physiotherapie zur Schultermobilisation begonnen wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Beginn Physiotherapie"
    beschreibung: "Datum des Beginns der Physiotherapie"
    datentyp: "dateTime"
    verpflichtung: "obligat"

  - name: "Zeitraum seit OP"
    beschreibung: "Abstand zwischen Operation und Beginn Physiotherapie (Soll: <= 2 Wochen)"
    datentyp: "Quantity (Tage)"
    wertebereich: "<= 14 Tage"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "ServiceRequest/Procedure fuer Physiotherapie. Timing relativ zur Operation."

referenzen:
  s3_literatur: ["1522", "1523"]
```

### Empfehlung 6.28

```yaml
id: S3-5.0-6.28
kapitel: "6.4"
kapitel_titel: "Rehabilitation"
empfehlung_nr: "6.28"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Lymphoedemen sollte eine komplexe Entstauungstherapie (KPE) bestehend aus
  Hautpflege, manueller Lymphdrainage, Bewegungstherapie und Kompressionsbehandlung
  durchgefuehrt werden.

datenobjekte:
  - name: "Lymphoedem diagnostiziert"
    beschreibung: "Ob ein Lymphoedem diagnostiziert wurde"
    datentyp: "boolean"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "I97.2"
      display: "Lymphoedem nach Mastektomie"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "KPE durchgefuehrt"
    beschreibung: "Ob eine komplexe Entstauungstherapie eingeleitet wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei diagnostiziertem Lymphoedem"

  - name: "Komponenten KPE"
    beschreibung: "Durchgefuehrte Komponenten der KPE"
    datentyp: "CodeableConcept"
    wertebereich: "Hautpflege | manuelle Lymphdrainage | Bewegungstherapie | Kompressionsbehandlung"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Condition fuer Lymphoedem. Procedure fuer KPE-Komponenten."

referenzen:
  s3_literatur: ["1523"]
  querschnittsleitlinien: ["AWMF Diagnostik und Therapie der Lymphoedeme 058-001"]
```

### Empfehlung 6.29

```yaml
id: S3-5.0-6.29
kapitel: "6.4"
kapitel_titel: "Rehabilitation - Kognitive Leistungseinschraenkungen"
empfehlung_nr: "6.29"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "geprüft 2025"
text: >
  Patientinnen sollten nach kognitiven Leistungseinschraenkungen (Konzentration,
  Exekutivfunktionen, Kurzzeitgedaechtnis) gefragt werden und bei Bedarf sollte
  eine weiterfuehrende diagnostische Abklaerung eingeleitet werden.

datenobjekte:
  - name: "Kognitive Beeintraechtigung erfragt"
    beschreibung: "Ob nach kognitiven Leistungseinschraenkungen gefragt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Kognitive Dysfunktion vorhanden"
    beschreibung: "Ob kognitive Leistungseinschraenkungen berichtet werden"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Art der Beeintraechtigung"
    beschreibung: "Art der kognitiven Einschraenkung"
    datentyp: "CodeableConcept"
    wertebereich: "Konzentration | Exekutivfunktionen | Kurzzeitgedaechtnis | andere"
    verpflichtung: "empfohlen"
    bedingung: "Wenn kognitive Dysfunktion vorhanden"

  - name: "Diagnostische Abklaerung eingeleitet"
    beschreibung: "Ob weiterfuehrende neuropsychologische Diagnostik veranlasst"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei Bedarf"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Observation fuer kognitive Symptome. QuestionnaireResponse fuer Screening-Instrumente (FACT-Cog, EORTC-QoL30, FEDA). ServiceRequest fuer neuropsychologische Diagnostik."

referenzen:
  s3_literatur: ["945", "1525"]
```

---

## 6.5 Palliativmedizin

### Empfehlung 6.30

```yaml
id: S3-5.0-6.30
kapitel: "6.5"
kapitel_titel: "Palliativmedizin"
empfehlung_nr: "6.30"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  In der Palliativsituation sollen alle erforderlichen Massnahmen an den individuellen
  Therapie- und Lebenszielen der Patientin orientiert werden.

datenobjekte:
  - name: "Palliativsituation"
    beschreibung: "Ob eine Palliativsituation vorliegt"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Individuelle Therapieziele"
    beschreibung: "Dokumentierte individuelle Therapie- und Lebensziele"
    datentyp: "string"
    verpflichtung: "obligat"
    bedingung: "In Palliativsituation"

  - name: "Vorausschauende Versorgungsplanung"
    beschreibung: "Ob eine vorausschauende Versorgungsplanung (Advance Care Planning) besprochen wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Palliativversorgung eingeleitet"
    beschreibung: "Art der eingeleiteten Palliativversorgung"
    datentyp: "CodeableConcept"
    wertebereich: "allgemein | spezialisiert (Palliativdienst/SAPV/Palliativstation/Hospiz)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CarePlan fuer Therapieziele und Versorgungsplanung. Goal-Ressource fuer individuelle Ziele. Consent fuer Patientenverfuegung/Vorsorgevollmacht."

referenzen:
  querschnittsleitlinien: ["S3 Palliativmedizin 128/001OL", "S3 Supportive Therapie 032-054OL", "S3 Psychoonkologie 032-051OL"]
```

---

## 6.6 Komplementaere Medizin

### Empfehlung 6.31

```yaml
id: S3-5.0-6.31
kapitel: "6.6"
kapitel_titel: "Komplementaere Medizin"
empfehlung_nr: "6.31"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Alle Patientinnen und Patienten sollen fruehestmoeglich und im Verlauf wiederholt
  zur aktuellen und geplanten Anwendung von komplementaeren Massnahmen befragt werden
  und gezielt auf moegliche Interaktionen zwischen diesen Anwendungen und der
  Krebstherapie hingewiesen werden.
  Aus Querschnittleitlinie: S3-Leitlinie Komplementaermedizin in der Behandlung
  von onkologischen PatientInnen, Langversion 2.0, 2024, AWMF-Registernummer: 032-055OL.

datenobjekte:
  - name: "Komplementaere Massnahmen erfragt"
    beschreibung: "Ob nach Nutzung komplementaerer Massnahmen gefragt wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Komplementaere Massnahmen genutzt"
    beschreibung: "Ob komplementaere Massnahmen aktuell oder geplant genutzt werden"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Art der komplementaeren Massnahme"
    beschreibung: "Art der genutzten komplementaeren Massnahme"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"
    bedingung: "Wenn komplementaere Massnahmen genutzt"

  - name: "Interaktionsrisiko"
    beschreibung: "Ob potenzielle Interaktionen mit der Krebstherapie bestehen"
    datentyp: "CodeableConcept"
    wertebereich: "kein Risiko | potenzielles Risiko | kontraindiziert"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Observation oder QuestionnaireResponse fuer Erfassung. Fragebogen zur strukturierten Erfassung (vgl. Kapitel 11.1)."

referenzen:
  querschnittsleitlinien: ["S3 Komplementaermedizin 032-055OL"]
```

### 6.6.1 Alternativmedizinische Diagnostik und Methoden

### Empfehlung 6.32

```yaml
id: S3-5.0-6.32
kapitel: "6.6.1"
kapitel_titel: "Alternativmedizinische Diagnostik und Methoden"
empfehlung_nr: "6.32"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die im Rahmen von komplementaeren und alternativen Therapiekonzepten angebotenen
  diagnostischen Massnahmen, die auf wissenschaftlich nicht belegten Konzepten
  und/oder falschen Interpretationen von Zusammenhaengen der Koerperfunktionen
  basieren, sollen nicht empfohlen werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Negative Empfehlung - keine strukturierten Datenobjekte erforderlich. Dokumentation ueber Beratungsgespraech."

referenzen:
  querschnittsleitlinien: ["S3 Komplementaermedizin 032-055OL"]
```

### Empfehlung 6.33

```yaml
id: S3-5.0-6.33
kapitel: "6.6.1"
kapitel_titel: "Alternativmedizinische Diagnostik und Methoden"
empfehlung_nr: "6.33"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Alternative Therapieverfahren ohne wissenschaftlich nachgewiesenen Nutzen sollen
  Patientinnen und Patienten nicht empfohlen werden. In einer einfuehlsamen
  Beratungssituation sollten die Patientinnen und Patienten wertneutral, kompetent
  und umfassend ueber den Schaden und Nutzen einer solchen Therapie informiert werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Negative Empfehlung mit Beratungsaspekt. Communication fuer dokumentierte Beratung."

referenzen:
  querschnittsleitlinien: ["S3 Komplementaermedizin 032-055OL"]
```

### 6.6.2 Integrative Onkologie: Komplementaermedizin

### Empfehlung 6.34

```yaml
id: S3-5.0-6.34
kapitel: "6.6.2"
kapitel_titel: "Integrative Onkologie: Komplementaermedizin"
empfehlung_nr: "6.34"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen und Patienten mit Mammakarzinom sollen im Rahmen der Komplementaeren
  Medizin nach der Querschnittleitlinie Leitlinienprogramm Onkologie (Deutsche
  Krebsgesellschaft, Deutsche Krebshilfe, AWMF: S3-Leitlinie Komplementaermedizin
  in der Behandlung von onkologischen PatientInnen, Langversion 2.0, 2024,
  AWMF-Registernummer: 032-055OL) behandelt werden.
  Fuer Patientinnen und Patienten mit Brustkrebs sind folgende Themen aus der
  Querschnittleitlinie zu komplementaermedizinischen Therapien von Interesse:
  Angst/Aengstlichkeit, Anorexie/Kachexie, Appetit, Dermatitis, Depressivitaet,
  Distress, Ejektionsfraktion, Ein- und Durchschlafstörungen, Entspannung,
  Erektile Dysfunktion, Fatigue, Haematologische Toxizitaet, Hand-Fuss-Syndrom,
  Hepatotoxizitaet, Kognitive Beeintraechtigung, Lebensqualitaet, Lymphoedem,
  Menopausale Symptome, Mukositis, u.a.

datenobjekte:
  - name: "Komplementaermedizinisches Thema"
    beschreibung: "Relevantes Thema aus der S3-Leitlinie Komplementaermedizin"
    datentyp: "CodeableConcept"
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Verweis auf Querschnittleitlinie. Keine eigene FHIR-Modellierung, Nutzung der jeweiligen symptomspezifischen Ressourcen."

referenzen:
  querschnittsleitlinien: ["S3 Komplementaermedizin 032-055OL"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 6

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 6.1-6.4 | Psychosoziales Belastungsscreening | **gap** | Questionnaire/QuestionnaireResponse fuer DT, PHQ-9, GAD-7, HADS. LOINC-Panels verfuegbar. |
| 6.5-6.6 | Diagnostisches Gespraech & Abklaerung | **gap** | Encounter fuer Gespraech. Condition fuer psychische Komorbidität. |
| 6.7-6.11 | Psychoonkologische Interventionen | **gap** | CarePlan/Procedure fuer Interventionen. Condition (ICD-10 F-Kapitel) fuer psychische Stoerungen. |
| 6.12 | Supportivtherapie | **gap** | AdverseEvent mit CTCAE-Grading. Verweis auf Querschnittleitlinie. |
| 6.13-6.14 | Nachsorge-Ziele und -Beginn | **gap** | CarePlan fuer strukturiertes Nachsorge-Schema. CareTeam fuer beteiligte Berufsgruppen. |
| 6.15-6.18 | Bildgebende Nachsorge (Mammographie, Sonographie) | **gap** | DiagnosticReport/ImagingStudy fuer Mammographie und Sonographie. Observation fuer BI-RADS. |
| 6.19 | Maenner mit Brustkrebs | **gap** | Gleiches Nachsorge-Schema, Patient.gender beachten. |
| 6.20 | Intensivierte Diagnostik (negativ) | **gap** | Negative Empfehlung: StandardDiagnostik NICHT durchfuehren. Dokumentation wenn doch mit Indikation. |
| 6.21 | Lymphoedem-Aufklaerung | **gap** | Condition fuer Lymphoedem. Communication fuer Aufklaerung. |
| 6.22 | Therapieassoziierte Nebenwirkungen | **gap** | AdverseEvent/Condition mit Verweis auf S3 Supportivtherapie. |
| 6.23 | **Nachsorge-Schema/Intervalle** | **gap** | **PRIORITAER**: CarePlan mit Timing-Struktur fuer Nachsorge-Intervalle (Tabelle 9). |
| 6.24 | Therapieadhaerenz endokrine Therapie | **gap** | MedicationStatement/MedicationRequest. Observation fuer Adhaerenz. |
| 6.25 | Rehabilitation - Information | **gap** | ServiceRequest fuer Rehabilitation. |
| 6.26 | Bewegungsprogramme | **gap** | CarePlan/Procedure fuer Bewegungsprogramm. |
| 6.27 | Physiotherapie postoperativ | **gap** | Procedure mit Timing relativ zur OP (<= 2 Wochen). |
| 6.28 | KPE bei Lymphoedem | **gap** | Procedure fuer KPE-Komponenten. |
| 6.29 | Kognitive Leistungseinschraenkungen | **gap** | Observation/QuestionnaireResponse fuer kognitive Symptome (FACT-Cog, EORTC-QoL30). |
| 6.30 | Palliativmedizin | **gap** | CarePlan/Goal fuer Therapieziele. Consent fuer Vorsorgevollmacht. |
| 6.31 | Komplementaere Medizin - Erfassung | **gap** | Observation/QuestionnaireResponse fuer komplementaere Massnahmen. |
| 6.32-6.33 | Alternative Methoden (negativ) | **gap** | Negative Empfehlungen - primaer Beratungsdokumentation. |
| 6.34 | Komplementaermedizin (Verweis) | **gap** | Verweis auf S3 Komplementaermedizin. |

### Priorisierung fuer FHIR-Profil-Entwicklung

1. **Hoechste Prioritaet**: Empfehlung 6.23 - Nachsorge-Schema mit konkreten Intervallen (Tabelle 9) als CarePlan
2. **Hoch**: Empfehlungen 6.1-6.3 - Psychoonkologisches Screening (Questionnaire/QuestionnaireResponse)
3. **Hoch**: Empfehlung 6.12 - CTCAE-basierte Nebenwirkungsdokumentation (AdverseEvent)
4. **Mittel**: Empfehlungen 6.15-6.18 - Bildgebende Nachsorge-Diagnostik
5. **Mittel**: Empfehlung 6.24 - Therapieadhaerenz-Monitoring
