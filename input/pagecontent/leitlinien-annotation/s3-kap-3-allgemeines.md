# S3-Leitlinie v5.0 - Kapitel 3: Allgemeines

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 39-81
> Kapitelstruktur: 3.1 Informations- und Gesundheitskompetenz | 3.2 Brustkrebsfrueherkennung | 3.3 Familiaeres Mammakarzinom | 3.4 Versorgungsstrukturen

---

## 3.1 Informations- und Gesundheitskompetenz

### 3.1.1 Patientenzentrierte Kommunikation

### Empfehlung 3.1

```yaml
id: S3-5.0-3.1
kapitel: "3.1.1"
kapitel_titel: "Patientenzentrierte Kommunikation"
empfehlung_nr: "3.1"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Der Wunsch von Patientinnen und Patienten, das Gespräch oder auch weitere Gespräche
  gemeinsam mit einer Vertrauensperson (Partner oder Partnerin, Angehörige,
  Patientenvertreter und -vertreterinnen, sogenannte Caregiver) zu führen,
  sollte erfragt werden.

datenobjekte:
  - name: "Wunsch Vertrauensperson"
    beschreibung: "Dokumentation, ob der Wunsch nach Begleitung durch eine Vertrauensperson erfragt wurde"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Prozessuale Empfehlung zur Gesprächsführung. Keine strukturierte Abbildung in FHIR-Profilen vorgesehen."

referenzen:
  querschnittsleitlinien: ["S3-Querschnittleitlinie Psychoonkologie"]
```

### Empfehlung 3.2

```yaml
id: S3-5.0-3.2
kapitel: "3.1.1"
kapitel_titel: "Patientenzentrierte Kommunikation"
empfehlung_nr: "3.2"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die medizinische Aufklärung von Patientinnen und Patienten ist primär Aufgabe
  des Arztes/der Ärztin, sie sollte jedoch bei spezifischen Themen durch andere
  Berufsgruppen wie Pflege, Psychoonkologen etc. unterstützt werden.

datenobjekte:
  - name: "Aufklärungsgespräch durchgeführt"
    beschreibung: "Dokumentation der Durchführung des Aufklärungsgesprächs und verantwortliche Person"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Prozessuale Empfehlung. Aufklärungsdokumentation ist organisatorisch, nicht primär als FHIR-Datenobjekt relevant."

referenzen:
  verwandte_empfehlungen: ["3.1", "3.3"]
```

### Empfehlung 3.3

```yaml
id: S3-5.0-3.3
kapitel: "3.1.1"
kapitel_titel: "Patientenzentrierte Kommunikation"
empfehlung_nr: "3.3"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Aus S3-Querschnittleitlinie Psychoonkologie (Langversion 2.1 August 2023):
  Eine patientenzentrierte Kommunikation soll sich an den nachfolgenden Grundprinzipien
  orientieren:
  - Herstellen einer angemessenen, ungestörten Gesprächsatmosphäre
  - Ausreichend Zeit
  - Aufbau einer tragfähigen, förderlichen Beziehung zu den Patienten und den Angehörigen
  - Gesprächsführung auf der Basis des aktiven Zuhörens
  - Exploration des subjektiven Informationsstands der Patienten
  - Direktes und einfühlsames Ansprechen emotional belastender Themen
  - Vermittlung von bedeutsamen Informationen in einer verständlichen, möglichst einfachen Sprache
  - Ehrliche Vermittlung von Risiko und Prognose, die Raum für realistische Hoffnung lässt
  - Einsatz von Strategien, um das patientenseitige Verständnis und das Behalten von Informationen sicherzustellen
  - Ermutigung, Fragen zu stellen
  - Ermutigung, Gefühle auszudrücken
  - Ausdruck emotionaler Unterstützung
  - Rückversichern, ob die Patienten die relevanten Informationen in der intendierten Weise verstanden hat
  - Einbeziehen von Angehörigen oder Bezugspersonen in Abhängigkeit vom Wunsch der Patienten
  - Anbieten weiterführender psychologischer und sozialer Angebote

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Rein prozessuale Empfehlung zur Kommunikationsgestaltung. Kein FHIR-Mapping erforderlich."

referenzen:
  querschnittsleitlinien: ["S3-Querschnittleitlinie Psychoonkologie v2.1"]
```

### 3.1.2 Information und Aufklärung

### Empfehlung 3.4

```yaml
id: S3-5.0-3.4
kapitel: "3.1.2"
kapitel_titel: "Information und Aufklärung"
empfehlung_nr: "3.4"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Informations- und Aufklärungsbedürfnisse bei Langzeitüberlebenden sollten exploriert
  werden und entsprechende Unterstützungsangebote sowie gesundheitsfördernden Maßnahmen
  bei Folgestörungen wie neurokognitive Einschränkungen, Fatigue, Angst, Depression,
  Polyneuropathie, Übergewicht, etc. vermittelt werden.

datenobjekte:
  - name: "Informationsbedarf Langzeitüberlebende"
    beschreibung: "Erfassung des Informations- und Aufklärungsbedarfs bei Langzeitüberlebenden"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "390866009"
      display: "Assessment of information needs (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"

  - name: "Folgestörungen"
    beschreibung: "Dokumentation von Folgestörungen (Fatigue, Angst, Depression, Polyneuropathie, neurokognitive Einschränkungen, Übergewicht)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "F32.x (Depression), G62.x (Polyneuropathie), F41.x (Angst), R53 (Fatigue), E66.x (Übergewicht)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Nachsorge-/Survivorship-Dokumentation ist in keinem Senologie-Profil modelliert. Bezug zu PRO-Instrumenten (Patient Reported Outcomes) möglich."

referenzen:
  s3_literatur: ["21", "22"]
```

### Empfehlung 3.5

```yaml
id: S3-5.0-3.5
kapitel: "3.1.2"
kapitel_titel: "Information und Aufklärung"
empfehlung_nr: "3.5"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Frauen und Männer mit Brustkrebs sind in ihrem Recht auf Selbstbestimmung zu bestärken
  und durch praktische Hilfestellungen zu unterstützen.
  Es liegt im Ermessen der Betroffenen, ob Selbsthilfevertreter in medizinische Beratungen
  und Aufklärungsgespräche einbezogen werden.
  Über Kontaktmöglichkeiten zu Selbsthilfeanbietern sollte informiert werden.
  Informationsmaterialien sollten von den Leistungsanbietern vorgehalten werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Prozessuale Empfehlung zu Patientenrechten und Selbsthilfe. Kein strukturiertes FHIR-Mapping erforderlich."

referenzen:
  verwandte_empfehlungen: ["3.4"]
```

### 3.1.3 E-Health und digitale Gesundheitsanwendungen (DiGA)

### Empfehlung 3.6

```yaml
id: S3-5.0-3.6
kapitel: "3.1.3"
kapitel_titel: "E-Health und digitale Gesundheitsanwendungen (DiGA)"
empfehlung_nr: "3.6"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Der Einsatz von E-Health kann zur verbesserten Versorgung von Patientinnen und
  Patienten beitragen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Allgemeines Statement ohne konkreten Datenerhebungsbedarf. E-Health/DiGA-Integration wäre ein eigenes Themenfeld."

referenzen:
  s3_literatur: ["23", "24"]
```

---

## 3.2 Brustkrebsfrüherkennung

### Empfehlung 3.7

```yaml
id: S3-5.0-3.7
kapitel: "3.2"
kapitel_titel: "Brustkrebsfrüherkennung"
empfehlung_nr: "3.7"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Der wichtigste populationsbezogene Risikofaktor für eine Brustkrebsentstehung
  ist bei Frauen und Männern das fortgeschrittene Alter.

datenobjekte:
  - name: "Alter"
    beschreibung: "Alter der Person als populationsbezogener Risikofaktor"
    datentyp: "Quantity"
    terminologie:
      system: "LOINC"
      code: "30525-0"
      display: "Age"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Patient"
  element: "Patient.birthDate"
  status: "mapped"
  anmerkung: "Alter ergibt sich aus Geburtsdatum im Patient-Profil."

referenzen: {}
```

### Empfehlung 3.8

```yaml
id: S3-5.0-3.8
kapitel: "3.2"
kapitel_titel: "Brustkrebsfrüherkennung"
empfehlung_nr: "3.8"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Das Mammakarzinom des Mannes ist eine seltene Erkrankung. Asymptomatischen
  Männern sollen keine speziellen bildgebenden Brustkrebs-Früherkennungsmaßnahmen
  empfohlen werden. Die Diagnostik erfolgt bei klinischer Symptomatik mit
  Mammographie und Ultraschall. Die Abklärungsdiagnostik soll entsprechend den
  Empfehlungen für Frauen erfolgen.

datenobjekte:
  - name: "Geschlecht"
    beschreibung: "Biologisches Geschlecht zur Risikostratifikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HL7 AdministrativeGender"
      mapping_quelle: "standard"
      validiert: true
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Patient"
  element: "Patient.gender"
  status: "mapped"
  anmerkung: "Geschlecht im Patient-Profil vorhanden."

referenzen:
  s3_literatur: ["27"]
  verwandte_empfehlungen: ["7.3"]
```

### Empfehlung 3.9

```yaml
id: S3-5.0-3.9
kapitel: "3.2"
kapitel_titel: "Brustkrebsfrüherkennung"
empfehlung_nr: "3.9"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die qualitätsgesicherte bildgebende Früherkennung von Brustkrebs (Sekundärprävention)
  ist neben der weiteren Verbesserung der Therapie die aussichtsreichste Möglichkeit,
  Diagnose und Behandlung von Brustkrebserkrankungen zu optimieren und die
  Brustkrebssterblichkeit zu senken.
  Früherkennung und Therapie wirken unabhängig voneinander, ergänzen sich aber auch.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Allgemeines Statement ohne konkreten Datenerhebungsbedarf."

referenzen: {}
```

### Empfehlung 3.10

```yaml
id: S3-5.0-3.10
kapitel: "3.2"
kapitel_titel: "Brustkrebsfrüherkennung"
empfehlung_nr: "3.10"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Zur Sicherung einer bestmöglichen Behandlung soll die weiterführende Therapie
  von Mammakarzinom in zertifizierten Brustkrebszentren erfolgen. Die kontinuierliche
  Qualitätssicherung soll durch Kommunikation und Datenerfassung zwischen
  Screeningzentrum und zertifiziertem Brustkrebszentrum gesichert werden.

datenobjekte:
  - name: "Behandlung in zertifiziertem Zentrum"
    beschreibung: "Dokumentation der Behandlung in einem zertifizierten Brustkrebszentrum"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

  - name: "Screeningzentrum-Anbindung"
    beschreibung: "Kommunikation und Datenerfassung zwischen Screeningzentrum und Brustkrebszentrum"
    datentyp: "Reference(Organization)"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Versorgungsstruktur-Empfehlung. Organization-Referenzen auf zertifizierte Zentren sind in FHIR abbildbar, aber kein spezifisches Senologie-Profil vorhanden."

referenzen:
  verwandte_empfehlungen: ["3.41"]
```

### 3.2.1 Maßnahmen zur Brustkrebsfrüherkennung

### Empfehlung 3.11

```yaml
id: S3-5.0-3.11
kapitel: "3.2.1"
kapitel_titel: "Maßnahmen zur Brustkrebsfrüherkennung"
empfehlung_nr: "3.11"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Im Rahmen der gesetzlichen Krebsfrüherkennung soll den Frauen ein Anamnese-
  und Aufklärungsgespräch über mögliche Risikofaktoren angeboten werden.

datenobjekte:
  - name: "Risikofaktoren-Anamnese"
    beschreibung: "Dokumentation der Erhebung von Brustkrebs-Risikofaktoren"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "408942007"
      display: "Assessment of risk factors (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

  - name: "Familienanamnese Brustkrebs"
    beschreibung: "Erhebung der Familienanamnese bezüglich Brust- und Eierstockkrebs"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "Z80.-"
      display: "Bösartige Neubildung in der Familienanamnese"
      mapping_quelle: "leitlinie"
      validiert: true
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Screening-Anamnese-Dokumentation fehlt in Senologie-Profilen. FamilyMemberHistory-Ressource wäre für Familienanamnese geeignet."

referenzen:
  verwandte_empfehlungen: ["3.13", "3.27"]
```

### Empfehlung 3.12

```yaml
id: S3-5.0-3.12
kapitel: "3.2.1"
kapitel_titel: "Maßnahmen zur Brustkrebsfrüherkennung"
empfehlung_nr: "3.12"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Brustselbstuntersuchung ist, selbst bei regelmäßiger Anwendung und Training,
  nicht in der Lage, als alleinige Methode die Brustkrebssterblichkeit zu senken.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Statement ohne Datenerhebungsbedarf."

referenzen:
  s3_literatur: ["49", "50"]
```

### Empfehlung 3.13

```yaml
id: S3-5.0-3.13
kapitel: "3.2.1"
kapitel_titel: "Maßnahmen zur Brustkrebsfrüherkennung"
empfehlung_nr: "3.13"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Im Rahmen der Erstvorstellung bei der Frauenärztin/beim Frauenarzt soll das
  Brustkrebs-Risiko der Frau erfasst und bewertet werden. Risiko-angepasste
  Früherkennungsuntersuchungen entsprechend organisierter Krebsfrüherkennungsprogramme
  (KFE-RL) sollen empfohlen werden. Die Aufklärung soll ergebnisoffen erfolgen unter
  Darstellung der Vor- und Nachteile sowie prognostischer Unsicherheiten.

datenobjekte:
  - name: "Brustkrebsrisiko-Bewertung"
    beschreibung: "Erfassung und Bewertung des individuellen Brustkrebsrisikos"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "395085008"
      display: "Assessment of risk for breast cancer (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

  - name: "Risikokategorie"
    beschreibung: "Einstufung in Risikokategorie (Normalrisiko, moderat erhöht, Hochrisiko)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "-"
    wertebereich: "Normalrisiko (<15% Lebenszeit) | Moderat erhöht (15-30% Lebenszeit) | Hochrisiko (>30% Lebenszeit)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Risikobewertung ist nicht in einem Senologie-Profil abgebildet. RiskAssessment-Ressource wäre geeignet."

referenzen:
  verwandte_empfehlungen: ["3.11", "3.19", "3.27"]
```

### Empfehlung 3.14

```yaml
id: S3-5.0-3.14
kapitel: "3.2.1"
kapitel_titel: "Maßnahmen zur Brustkrebsfrüherkennung"
empfehlung_nr: "3.14"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die klinische Brustuntersuchung, das heißt Inspektion, Palpation der Brust und
  Beurteilung des Lymphabflusses, sollte im Rahmen der gesetzlichen Früherkennungsuntersuchungen
  Frauen angeboten werden.
  Als alleinige Methode zur Brustkrebsfrüherkennung soll die klinische Untersuchung
  der Brust und Axilla nicht empfohlen werden.
  Dieses soll den Frauen entsprechend kommuniziert werden.

datenobjekte:
  - name: "Klinische Brustuntersuchung"
    beschreibung: "Durchführung der klinischen Brustuntersuchung (Inspektion, Palpation, Lymphabfluss)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "185712003"
      display: "Clinical breast examination (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Klinische Untersuchungsbefunde der Brust sind nicht in einem spezifischen Senologie-Profil modelliert."

referenzen:
  verwandte_empfehlungen: ["3.12"]
```

### 3.2.2 Mammographiescreening

### Empfehlung 3.15

```yaml
id: S3-5.0-3.15
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening"
empfehlung_nr: "3.15"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Die Mammographie ist die einzige Früherkennungs-Methode mit gesicherter Reduktion
  der Brustkrebsmortalität.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Statement ohne Datenerhebungsbedarf."

referenzen:
  s3_literatur: ["50", "51", "30", "52", "53", "33", "43", "54", "36"]
```

### Empfehlung 3.16

```yaml
id: S3-5.0-3.16
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening"
empfehlung_nr: "3.16"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Frauen im anspruchsberechtigten Alter, aktuell im Alter von 50 bis einschließlich
  75 soll die Teilnahme am Nationalen Mammographie Screening Programm (MSP)
  angeboten werden.

datenobjekte:
  - name: "Mammographie-Screening"
    beschreibung: "Teilnahme am Nationalen Mammographie Screening Programm (MSP)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "241055006"
      display: "Mammography screening (procedure)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"

  - name: "Screening-Altersgruppe"
    beschreibung: "Anspruchsberechtigtes Alter 50-75 Jahre"
    datentyp: "Range"
    wertebereich: "50-75 Jahre"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Mammographie-Screening-Dokumentation fehlt in Senologie-Profilen. DiagnosticReport oder Procedure wären geeignet."

referenzen:
  s3_literatur: ["53", "33", "63", "64", "59"]
```

### Empfehlung 3.17

```yaml
id: S3-5.0-3.17
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening"
empfehlung_nr: "3.17"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Im Rahmen der gynäkologischen Früherkennungsuntersuchung ist die Frau über den
  nachgewiesenen Vorteil bezüglich des brustkrebsspezifischen Überlebens durch
  Teilnahme am Mammographie Screening Programm (MSP) zu informieren.
  Dies soll dokumentiert werden.

datenobjekte:
  - name: "Aufklärung MSP-Vorteil dokumentiert"
    beschreibung: "Dokumentation der Aufklärung über den Vorteil des MSP"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Dokumentation der Aufklärung ist prozessual. Kein Senologie-Profil vorhanden."

referenzen:
  verwandte_empfehlungen: ["3.16"]
```

### Empfehlung 3.18

```yaml
id: S3-5.0-3.18
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening"
empfehlung_nr: "3.18"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Reduktion der Brustkrebssterblichkeit durch das Mammografiescreening ist
  auch für Frauen im Alter zwischen 45 und 49 Jahren belegt und überwiegt die
  sich aus der Strahlenexposition ergebenden Risiken.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Statement ohne konkreten Datenerhebungsbedarf."

referenzen:
  s3_literatur: ["50", "52", "67", "64", "68"]
```

### Empfehlung 3.19

```yaml
id: S3-5.0-3.19
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening"
empfehlung_nr: "3.19"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Für Frauen mit moderatem Risiko außerhalb des Screeningalters soll ab dem Alter
  von 40 Jahren die bildgebende Früherkennung mittels Mammografie angeboten werden.
  Bei Frauen mit Hochrisiko sollte die Früherkennung entsprechend dem Programm
  für familiären Brustkrebs erfolgen.
  Bei brustgesunden asymptomatischen Frauen vor dem Alter von 40 Jahren mit niedrigem
  bis moderatem Brustkrebsrisiko soll keine mammographische Früherkennung erfolgen.

datenobjekte:
  - name: "Risikostratifikation Screening"
    beschreibung: "Risikokategorie zur Bestimmung der angemessenen Früherkennungsstrategie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "-"
    wertebereich: "Normalrisiko | Moderat erhöht (Lebenszeit 15-30%) | Hochrisiko (>30%)"
    verpflichtung: "obligat"
    bedingung: "Frauen < 50 oder > 75 Jahre"

  - name: "Lebenszeit-Brustkrebsrisiko"
    beschreibung: "Berechnetes Lebenszeitrisiko für Brustkrebs (z.B. via BOADICEA-Modell)"
    datentyp: "Quantity"
    terminologie:
      system: "-"
    wertebereich: "0-100%"
    verpflichtung: "empfohlen"
    bedingung: "Bei Risikoevaluation außerhalb des regulären Screenings"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Risikostratifizierung nicht in Senologie-Profilen abgebildet. RiskAssessment-Ressource wäre geeignet."

referenzen:
  verwandte_empfehlungen: ["3.13", "3.27", "3.35"]
```

### 3.2.2 Mammographiescreening (Fortsetzung) - Tomosynthese

### Empfehlung 3.20

```yaml
id: S3-5.0-3.20
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening - Tomosynthese"
empfehlung_nr: "3.20"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die digitale Tomosynthese (3D-Mammographie oder digitale Brust-Tomosynthese)
  mit synthetischem 2D-Bild ist bezüglich Sensitivität und Spezifität der digitalen
  Mammographie (DM) überlegen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Statement ohne konkreten Datenerhebungsbedarf."

referenzen:
  s3_literatur: ["73", "74", "33", "75", "76", "77"]
```

### Empfehlung 3.21

```yaml
id: S3-5.0-3.21
kapitel: "3.2.2"
kapitel_titel: "Mammographiescreening - Tomosynthese"
empfehlung_nr: "3.21"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  In dichtem Gewebe ist die Tomosynthese in Sensitivität und Spezifität der digitalen
  Mammographie (DM) klar überlegen.
  Der Einsatz der Tomosynthese im hohen Dichtebereich sollte wegen der wesentlich
  besseren Sensitivität bei mindestens gleicher Spezifität der Tomosynthese möglichst
  zeitnah (beginnend mit Dichtetyp D und schrittweise C) im Rahmen des
  Mammographie-Screening-Programms unter strenger Qualitätssicherung und Ergebnis-Evaluation
  ermöglicht werden.

datenobjekte:
  - name: "Bildgebungsmodalität"
    beschreibung: "Art der mammographischen Untersuchung (DM vs. DBT/Tomosynthese)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "450566007"
      display: "Digital breast tomosynthesis (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Bei hoher mammographischer Dichte (ACR C/D)"

  - name: "Mammographische Dichte (ACR)"
    beschreibung: "Klassifikation der mammographischen Dichte nach ACR"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS"
      code: "A|B|C|D"
      display: "Breast composition categories"
      mapping_quelle: "leitlinie"
      validiert: false
    wertebereich: "ACR A (fast vollständig Fettgewebe) | ACR B (verstreut fibroglandulär) | ACR C (heterogen dicht) | ACR D (extrem dicht)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Mammographische Dichte und Bildgebungsmodalität sind nicht in Senologie-Profilen abgebildet. Observation mit ACR-Density-ValueSet wäre geeignet."

referenzen:
  s3_literatur: ["33", "78", "79", "80", "81"]
  verwandte_empfehlungen: ["3.25"]
```

### 3.2.3 Sonographie und Kontrastmittel-MRT

### Empfehlung 3.22

```yaml
id: S3-5.0-3.22
kapitel: "3.2.3"
kapitel_titel: "Sonographie und Kontrastmittel-MRT"
empfehlung_nr: "3.22"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Als alleinige Methode zur Brustkrebsfrüherkennung soll der systematische Einsatz
  von Sonographie nicht empfohlen werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Negative Empfehlung ohne Datenerhebungsbedarf."

referenzen: {}
```

### Empfehlung 3.23

```yaml
id: S3-5.0-3.23
kapitel: "3.2.3"
kapitel_titel: "Sonographie und Kontrastmittel-MRT"
empfehlung_nr: "3.23"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Eine Kontrastmittel-MRT soll zur Früherkennung bei asymptomatischen Frauen
  außerhalb des Hochrisikokollektivs nicht erfolgen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Negative Empfehlung ohne Datenerhebungsbedarf."

referenzen:
  verwandte_empfehlungen: ["3.35"]
```

### Empfehlung 3.24

```yaml
id: S3-5.0-3.24
kapitel: "3.2.3"
kapitel_titel: "Sonographie und Kontrastmittel-MRT - Einsatz von KI"
empfehlung_nr: "3.24"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Als Ergänzung zur menschlichen Befundung kann Künstliche Intelligenz (KI) die
  Sensitivität und die Spezifität verbessern. Substitutiv eingesetzt hat der KI-Einsatz
  das Potential, die Arbeitslast der fachärztlichen Doppelbefundung bei mindestens
  gleichwertigem Ergebnis zu reduzieren.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Statement zur KI-Unterstützung. Kein konkreter Datenerhebungsbedarf."

referenzen: {}
```

### 3.2.4 Mammographische Dichte

### Empfehlung 3.25

```yaml
id: S3-5.0-3.25
kapitel: "3.2.4"
kapitel_titel: "Mammographische Dichte"
empfehlung_nr: "3.25"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Erhöhte mammographische Dichte ist ein unabhängiger, moderater Risikofaktor
  für das Auftreten von Brustkrebs.
  Mammographische Dichte und Sensitivität korrelieren negativ miteinander.
  Auch bei hoher mammographischer Dichte bleibt die Indikation zur Früherkennung
  durch Mammographie-Screening bestehen, denn der Effekt der Mortalitätsreduktion
  ist für alle Frauen belegt. Ein bedeutender Anteil an Mammakarzinomen und
  Vorstadien ist nur mammographisch sichtbar.

datenobjekte:
  - name: "Mammographische Dichte"
    beschreibung: "Klassifikation der mammographischen Dichte als Risikofaktor"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ACR BI-RADS"
      code: "A|B|C|D"
      display: "Breast composition categories"
      mapping_quelle: "leitlinie"
      validiert: false
    wertebereich: "ACR A | ACR B | ACR C | ACR D"
    verpflichtung: "obligat"
    bedingung: "Bei jeder Mammographie-Untersuchung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Mammographische Dichte als Observation ist nicht in Senologie-Profilen vorhanden."

referenzen:
  s3_literatur: ["113", "114", "115"]
  verwandte_empfehlungen: ["3.21", "3.26"]
```

### Empfehlung 3.26

```yaml
id: S3-5.0-3.26
kapitel: "3.2.4"
kapitel_titel: "Mammographische Dichte"
empfehlung_nr: "3.26"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Evidenz bezüglich des Einsatzes substitutiver oder ergänzender bildgebender
  Methoden bei Frauen mit Normalrisiko ist begrenzt. Bei moderatem Risiko und
  dichtem Drüsengewebe erscheint derzeit die Sonographie als ergänzende Methode geeignet.
  Tomosynthese, Sonographie und MRT können die dichteabhängige Sensitivität erhöhen.
  In der Früherkennung sind Sonographie und MRT mit einer höheren Rate an Biopsien
  als das Nationale Mammographie Screening-Programm verbunden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Statement zur Methodenwahl bei dichtem Gewebe. Kein konkreter Datenerhebungsbedarf."

referenzen:
  s3_literatur: ["49", "52", "53", "116", "117", "118", "119", "33", "59", "36"]
  verwandte_empfehlungen: ["3.25", "3.21"]
```

---

## 3.3 Familiäres Mammakarzinom

### Empfehlung 3.27

```yaml
id: S3-5.0-3.27
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.27"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine genetische Untersuchung zum Nachweis einer erblichen Belastung sollte angeboten
  werden, wenn eine familiäre bzw. individuelle Belastung vorliegt, die mit einer
  mindestens 10 %-igen Nachweiswahrscheinlichkeit für eine wahrscheinlich pathogene /
  pathogene konstitutionelle Variante (PV) einhergeht.
  Dies trifft zu, wenn in einer Linie der Familie
  - mindestens 3 Frauen an Brustkrebs erkrankt sind, unabhängig vom Alter
  - mindestens 2 Frauen an Brustkrebs erkrankt sind, davon 1 vor dem 50. Geburtstag
  - mindestens 1 Frau an Brustkrebs und 1 weitere Frau an Eierstockkrebs erkrankt sind
  - mindestens 2 Frauen an Eierstockkrebs erkrankt sind
  - mindestens 1 Frau an Brust- und Eierstockkrebs erkrankt ist
  - mindestens 1 Frau vor dem 36. Geburtstag an Brustkrebs erkrankt ist
  - mindestens 1 Frau vor dem 50. Geburtstag an bilateralem Brustkrebs erkrankt ist
  - mindestens 1 Mann an Brustkrebs und eine Frau an Brust- oder Eierstockkrebs erkrankt sind
  Es ist eine angemessene Bedenkzeit vor Durchführung der Diagnostik zu beachten.

datenobjekte:
  - name: "Familienanamnese Brust-/Eierstockkrebs"
    beschreibung: "Detaillierte Familienanamnese bezüglich Brust- und Eierstockkrebs mit Erkrankungsalter und Verwandtschaftsgrad"
    datentyp: "BackboneElement"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "Z80.-, Z85.-"
      display: "Bösartige Neubildung in der Familien-/Eigenanamnese"
      mapping_quelle: "leitlinie"
      validiert: true
    verpflichtung: "obligat"

  - name: "Nachweiswahrscheinlichkeit PV"
    beschreibung: "Berechnete Nachweiswahrscheinlichkeit für eine pathogene/wahrscheinlich pathogene konstitutionelle Variante (>=10%)"
    datentyp: "Quantity"
    terminologie:
      system: "-"
    wertebereich: "0-100%"
    verpflichtung: "empfohlen"

  - name: "Indikation genetische Testung"
    beschreibung: "Indikationsstellung zur genetischen Untersuchung basierend auf Einschlusskriterien des DK"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "empfohlen"

  - name: "Genetische Untersuchung angeboten"
    beschreibung: "Dokumentation, ob eine genetische Untersuchung angeboten wurde"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Familienanamnese über FamilyMemberHistory abbildbar. Genetische Testindikation und
    Nachweiswahrscheinlichkeit erfordern RiskAssessment. Kein Senologie-Profil vorhanden.
    Genomics Reporting IG (hl7.fhir.uv.genomics-reporting) wäre für Testergebnisse relevant.

referenzen:
  s3_literatur: ["131", "130"]
  verwandte_empfehlungen: ["3.28", "3.31", "3.35"]
```

### Empfehlung 3.28

```yaml
id: S3-5.0-3.28
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.28"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Für weitere Indikationen einer genetischen Untersuchung zum Nachweis einer
  erblichen Belastung
  - mindestens 1 Frau ist an triple-negativem Brustkrebs vor dem 70. Geburtstag erkrankt
  - mindestens 1 Frau ist an Eierstockkrebs vor dem 80. Geburtstag erkrankt
  - mindestens 1 Mann ist an Brustkrebs erkrankt
  ist eine Signifikanz für eine mindestens 10%ige Nachweiswahrscheinlichkeit von
  wahrscheinlich pathogenen / pathogenen konstitutionellen Varianten (PV) noch
  nicht abschließend gesichert. Deshalb sollten sie weiter systematisch validiert werden.

datenobjekte:
  - name: "Triple-negativer Brustkrebs"
    beschreibung: "Dokumentation triple-negativer Brustkrebs (ER-/PR-/HER2-) als Indikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "706970001"
      display: "Triple negative malignant neoplasm of breast (disorder)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Erkrankung vor dem 70. Geburtstag"

  - name: "Männlicher Brustkrebs"
    beschreibung: "Brustkrebs beim Mann als Indikation für genetische Testung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "C50"
      display: "Bösartige Neubildung der Brustdrüse"
      mapping_quelle: "leitlinie"
      validiert: true
    verpflichtung: "empfohlen"
    bedingung: "Patient.gender = male"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Erweiterte Testindikationen. Gleiche Gap-Situation wie 3.27."

referenzen:
  s3_literatur: ["134", "135", "136"]
  verwandte_empfehlungen: ["3.27"]
```

### Empfehlung 3.29

```yaml
id: S3-5.0-3.29
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.29"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Beratung soll eine partizipative Entscheidungsfindung ermöglichen. Diese setzt
  eine umfassende und verständliche Information der Ratsuchenden und die Einbeziehung
  ihrer Präferenzen in den Entscheidungsprozess voraus.
  Für die verständliche Informationsvermittlung sollten angemessene Materialien für
  Ratsuchende genutzt werden.
  Evidenzbasierte Entscheidungshilfen können helfen, eine informierte, wertekongruente
  Entscheidung zu treffen. Sie führen zu einem großen Zuwachs an Wissen, einer genauen
  Risikowahrnehmung und einer aktiven Rolle bei der Entscheidungsfindung.
  Entscheidungscoaching kann das Wissen der Teilnehmer verbessern, wenn es mit
  evidenzbasierten Informationen eingesetzt wird. Im Rahmen der Beratung sollte die
  Indikation zu einer Unterstützung durch die Psychoonkologie geprüft werden.

datenobjekte:
  - name: "Partizipative Entscheidungsfindung"
    beschreibung: "Dokumentation der partizipativen Entscheidungsfindung bei genetischer Beratung"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"

  - name: "Entscheidungshilfe eingesetzt"
    beschreibung: "Einsatz evidenzbasierter Entscheidungshilfen dokumentiert"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "empfohlen"

  - name: "Psychoonkologische Indikation geprüft"
    beschreibung: "Prüfung der Indikation zur psychoonkologischen Unterstützung"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Prozessuale Empfehlung zur Beratungsgestaltung. Dokumentation über Procedure oder ClinicalImpression möglich."

referenzen:
  s3_literatur: ["142", "143", "144", "145", "17"]
```

### Empfehlung 3.30

```yaml
id: S3-5.0-3.30
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.30"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Der Kontakt zur Krebsselbsthilfe sollte gesunden sowie erkrankten Frauen und
  Männern mit erhöhten Risiken angeboten werden, um ihrem Wunsch nach weiteren
  Informationen nachzukommen und sie in ihrem Recht auf Selbstbestimmung
  zu bestärken.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Prozessuale Empfehlung ohne strukturierten Datenerhebungsbedarf."

referenzen:
  s3_literatur: ["151"]
```

### Empfehlung 3.31

```yaml
id: S3-5.0-3.31
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.31"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Genetische Varianten sollen in einem 5-Klassen-System eingeordnet werden (ACMG).
  Grundlage für klinische Maßnahmen sind nur Varianten der Klassen 4 (wahrscheinlich
  pathogen) und 5 (pathogen).
  Von Varianten unklarer Signifikanz (VUS, Klasse 3) sollen keine klinischen Maßnahmen
  abgeleitet werden und sie sollten in begleitenden wissenschaftlichen Projekten
  weiter abgeklärt werden.

datenobjekte:
  - name: "ACMG-Klassifikation"
    beschreibung: "Klassifikation genetischer Varianten nach ACMG/AMP 5-Klassen-System"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      code: "53037-8"
      display: "Genetic disease assessed"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "Klasse 1 (benigne, PP<0.001) | Klasse 2 (wahrscheinlich benigne, 0.001<=PP<0.10) | Klasse 3 (VUS, 0.10<=PP<=0.90) | Klasse 4 (wahrscheinlich pathogen, 0.90<PP<=0.99) | Klasse 5 (pathogen, PP>0.99)"
    verpflichtung: "obligat"
    bedingung: "Bei Durchführung einer genetischen Untersuchung"

  - name: "Untersuchte Gene"
    beschreibung: "Liste der untersuchten Risikogene (BRCA1, BRCA2, PALB2, ATM, CHEK2, etc.)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "BRCA1 (HGNC:1100) | BRCA2 (HGNC:1101) | PALB2 (HGNC:26144) | ATM (HGNC:795) | CHEK2 (HGNC:16627) | BARD1 (HGNC:952) | RAD51C (HGNC:9820) | RAD51D (HGNC:9821) | BRIP1 (HGNC:20473) | CDH1 (HGNC:1748) | PTEN (HGNC:9588) | STK11 (HGNC:11389) | TP53 (HGNC:11998)"
    verpflichtung: "obligat"
    bedingung: "Bei genetischer Untersuchung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Genomics Reporting IG (hl7.fhir.uv.genomics-reporting) bietet DiagnosticReport und
    Observation-Profile für genetische Befunde. ACMG-Klassifikation ist im IG als
    diagnostic-implication modelliert. Kein Senologie-spezifisches Profil vorhanden.

referenzen:
  s3_literatur: ["152", "153", "154", "155", "156"]
  verwandte_empfehlungen: ["3.27", "3.32"]
```

### Empfehlung 3.32

```yaml
id: S3-5.0-3.32
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.32"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  In der Beratung vor genetischer Untersuchung sollten insbesondere folgende Inhalte
  berücksichtigt werden:
  - Wahrscheinlichkeit für das Vorliegen einer pathogenen / wahrscheinlich pathogenen
    konstitutionellen Variante (PV)
  - Wahrscheinlichkeit für das Vorliegen einer Variante unklarer Signifikanz (VUS)
  - Erkrankungsrisiken bei auffälligem (PV) und nicht-informativem Genbefund
  - Chancen und Risiken präventiver und therapeutischer Optionen, einschließlich der
    Option, nichts zu tun
  - Bedeutung der genetischen Untersuchung für die Familienangehörigen
  Nach Erhalt des Genbefundes sollten in der Beratung und in der Abwägung über den
  Einsatz von präventiven Maßnahmen insbesondere folgende Inhalte vertieft angesprochen werden:
  - Erkrankungsrisiko in Abhängigkeit von genetischen und nicht-genetischen Faktoren,
    Alter und Begleiterkrankungen (natürlicher Verlauf)
  - Wahrscheinlichkeit für falsch positive und falsch negative Untersuchungsergebnisse
    der intensivierten Brustkrebs-Früherkennung
  - Nutzen der präventiven Optionen
  - Risiken der präventiven Optionen einschließlich Langzeitfolgen
  - Konkurrierende Risiken, Prognose und Therapierbarkeit im Falle eines Krankheitseintrittes
  - Ggf. Risiken für assoziierte Tumoren

datenobjekte:
  - name: "Genetische Beratung vor Testung"
    beschreibung: "Dokumentation der Beratungsinhalte vor genetischer Testung"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "370995009"
      display: "Genetic counseling (procedure)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"

  - name: "Genetische Beratung nach Befunderhalt"
    beschreibung: "Dokumentation der Beratungsinhalte nach Erhalt des Genbefundes"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "370995009"
      display: "Genetic counseling (procedure)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Nach Vorliegen des genetischen Befundes"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Beratungsdokumentation könnte über Procedure mit Beratungsinhalten als Extension abgebildet werden."

referenzen:
  s3_literatur: ["130", "156", "157", "132", "137"]
  verwandte_empfehlungen: ["3.27", "3.31"]
```

### Empfehlung 3.33

```yaml
id: S3-5.0-3.33
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.33"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  BRCA1-assoziierte Mammakarzinome weisen häufig einen charakteristischen
  histopathologischen und immunhistochemischen Phänotyp auf:
  - invasives Karzinom mit medullären Eigenschaften
  - G3-Morphologie
  - Östrogenrezeptor-, Progesteronrezeptor- und HER2-Negativität (triple-negativ)

datenobjekte:
  - name: "BRCA1-assoziierter Phänotyp"
    beschreibung: "Histopathologischer und immunhistochemischer Phänotyp bei BRCA1-assoziierten Karzinomen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "706970001"
      display: "Triple negative malignant neoplasm of breast (disorder)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Bei histologischer Befundung"

  - name: "Grading"
    beschreibung: "Histologisches Grading (G3 typisch für BRCA1)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "54102005"
      display: "G3 grade (finding)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "Observation (Grading, ER, PR, HER2)"
  status: "partial"
  anmerkung: "Grading und Rezeptorstatus sind im Pathologie-Befund modelliert. Spezifische Zuordnung zu BRCA1-Assoziation fehlt."

referenzen:
  s3_literatur: ["158", "159"]
  verwandte_empfehlungen: ["3.34"]
```

### Empfehlung 3.34

```yaml
id: S3-5.0-3.34
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom"
empfehlung_nr: "3.34"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "geprüft 2025"
text: >
  Bei Vorliegen dieser Charakteristika sollte vom Pathologen auf die Möglichkeit eines
  erblichen Hintergrunds hingewiesen werden.

datenobjekte:
  - name: "Hinweis auf erblichen Hintergrund"
    beschreibung: "Dokumentation des pathologischen Hinweises auf möglichen erblichen Hintergrund im Befund"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "empfohlen"
    bedingung: "Bei BRCA1-typischem Phänotyp"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "DiagnosticReport.conclusion"
  status: "partial"
  anmerkung: "Hinweis auf erblichen Hintergrund könnte in DiagnosticReport.conclusion oder als separate Observation abgebildet werden."

referenzen:
  verwandte_empfehlungen: ["3.33", "3.27"]
```

### Empfehlung 3.35

```yaml
id: S3-5.0-3.35
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom - Intensivierte Früherkennung"
empfehlung_nr: "3.35"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit einer konstitutionellen wahrscheinlich pathogenen / pathogenen
  Variante (PV) im BRCA1- oder BRCA2-Gen sollte und bei Patientinnen mit PV in
  anderen Risikogenen kann eine intensivierte Brustkrebsfrüherkennung unter Hinzunahme
  des MRT und der Sonographie nur im Rahmen einer wissensgenerierenden Versorgung und
  entsprechender Ergebnisevaluation erfolgen.
  Unter diesen Voraussetzungen kann diese Früherkennung nicht informativ getesteter
  Frauen zwischen 30 und 50 Jahren mit einem Mammakarzinomrisiko von 5% in 10 Jahren
  erfolgen.
  Eine zusätzliche, alle zwei Jahre erfolgende Mammographie ab dem 40. Lebensjahr sollte
  ebenso im Rahmen einer wissensgenerierenden Versorgung und entsprechender
  Ergebnisevaluation erfolgen.

datenobjekte:
  - name: "PV-Status BRCA1/BRCA2"
    beschreibung: "Status der pathogenen/wahrscheinlich pathogenen konstitutionellen Variante in BRCA1 oder BRCA2"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      code: "HGNC:1100 (BRCA1), HGNC:1101 (BRCA2)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Ergebnis genetischer Testung"

  - name: "PV-Status andere Risikogene"
    beschreibung: "Status pathogener Varianten in weiteren Risikogenen (ATM, BARD1, BRIP1, CDH1, CHEK2, PALB2, PTEN, RAD51C, RAD51D, STK11, TP53)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"

  - name: "Intensivierte Früherkennung (iFE)"
    beschreibung: "Programm der intensivierten Brustkrebsfrüherkennung (MRT + Sonographie + ggf. Mammographie)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "268547008"
      display: "Screening for malignant neoplasm of breast (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "PV in BRCA1/2 oder anderen Risikogenen"

  - name: "10-Jahres-Mammakarzinomrisiko"
    beschreibung: "Berechnetes 10-Jahres-Risiko für Mammakarzinom (>= 5% als Schwelle für iFE)"
    datentyp: "Quantity"
    terminologie:
      system: "-"
    wertebereich: ">= 5%"
    verpflichtung: "empfohlen"
    bedingung: "Bei nicht-informativ getesteten Frauen 30-50 Jahre"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    PV-Status über Genomics Reporting IG abbildbar. Intensivierte Früherkennung als
    CarePlan mit spezifischen Aktivitäten (MRT, Sonographie, Mammographie) modellierbar.
    Kein Senologie-Profil vorhanden.

referenzen:
  s3_literatur: ["162", "163", "164", "165", "166", "71", "157"]
  verwandte_empfehlungen: ["3.27", "3.31", "3.37"]
```

### Empfehlung 3.36

```yaml
id: S3-5.0-3.36
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom - Therapie"
empfehlung_nr: "3.36"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die operative Therapie des BRCA1- bzw. BRCA2-assoziierten Mammakarzinoms richtet
  sich nach den Leitlinienempfehlungen für das sporadische Mammakarzinom.
  Die Mastektomie hat keinen Überlebensvorteil im Vergleich zur brusterhaltenden Therapie.
  Die medikamentöse Therapie des BRCA-assoziierten Mammakarzinoms richtet sich nach den
  Leitlinienempfehlungen für das sporadische Mammakarzinom.
  Ausnahme ist die zielgerichtete Therapie des frühen bzw. fortgeschrittenen/metastasierten
  Her2-negativen Mammakarzinoms und Nachweis einer wahrscheinlich pathogenen
  konstitutionellen Variante (PV) in den Genen BRCA1 und BRCA2 mit PARP-Inhibitoren
  (s. Kapitel medikamentöse Therapie).

datenobjekte:
  - name: "BRCA-Mutationsstatus"
    beschreibung: "Nachweis einer PV in BRCA1/BRCA2 als Voraussetzung für PARP-Inhibitor-Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      code: "HGNC:1100 (BRCA1), HGNC:1101 (BRCA2)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Bei HER2-negativem Mammakarzinom, Therapieentscheidung PARP-Inhibitor"

  - name: "PARP-Inhibitor-Indikation"
    beschreibung: "Indikationsstellung für PARP-Inhibitor-Therapie bei BRCA-PV"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      code: "L01XK01 (Olaparib), L01XK04 (Talazoparib)"
      display: "PARP-Inhibitoren"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "PV in BRCA1/2 + HER2-negativ"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    BRCA-Mutationsstatus über Genomics Reporting IG abbildbar. Therapieentscheidung
    PARP-Inhibitor über MedicationRequest modellierbar. Verknüpfung Genetik-Therapie
    fehlt in Senologie-Profilen.

referenzen:
  s3_literatur: ["171", "172", "173", "174", "175", "176", "177", "178", "179", "180"]
  verwandte_empfehlungen: ["3.35", "3.37"]
```

### Empfehlung 3.37

```yaml
id: S3-5.0-3.37
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom - Risikoreduzierende Operation"
empfehlung_nr: "3.37"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Risiko-reduzierende Operation bei gesunden Trägerinnen wahrscheinlich pathogener /
  pathogener konstitutioneller Varianten (PV) in den Genen BRCA1 oder BRCA2
  (Klasse 4/5): prophylaktische bilaterale Mastektomie.
  Gesunde Frauen mit einer PV in den Genen BRCA1 oder BRCA2 haben ein lebenszeitlich
  erhöhtes Risiko für die Entwicklung eines Mammakarzinoms.
  Bei gesunden Frauen mit einer PV in den Genen BRCA1- oder BRCA2 führt die beidseitige
  prophylaktische Mastektomie zu einer Reduktion der Brustkrebsinzidenz. Eine Reduktion
  der Brustkrebs-spezifischen Mortalität bzw. der Gesamtmortalität durch die beidseitige
  prophylaktische Mastektomie ist nicht ausreichend gesichert.
  Daher setzt eine Einzelfallentscheidung für oder gegen eine bilaterale risiko-reduzierende
  Mastektomie stets fallbezogen eine umfassende Aufklärung und ausführliche
  multidisziplinäre Beratung über potentielle Vor- und Nachteile eines solchen Eingriffs
  mit Berücksichtigung der möglichen Alternativen voraus.

datenobjekte:
  - name: "Prophylaktische bilaterale Mastektomie (BRRM)"
    beschreibung: "Risikoreduzierende beidseitige Mastektomie bei BRCA1/2-PV-Trägerinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      code: "5-870"
      display: "Partielle (brusterhaltende) Exzision der Mamma und Destruktion von Mammagewebe"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Gesunde Trägerinnen PV BRCA1/2 (Klasse 4/5), nach multidisziplinärer Beratung"

  - name: "Multidisziplinäre Beratung dokumentiert"
    beschreibung: "Dokumentation der umfassenden multidisziplinären Beratung vor risikoreduzierender OP"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"
    bedingung: "Vor risikoreduzierender Operation"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Risikoreduzierende Operationen sind nicht in Senologie-Profilen abgebildet. Procedure-Ressource wäre geeignet."

referenzen:
  s3_literatur: ["187", "188", "189", "190", "191", "192", "193", "194", "195", "180", "71", "196"]
  verwandte_empfehlungen: ["3.38", "3.39", "3.40"]
```

### Empfehlung 3.38

```yaml
id: S3-5.0-3.38
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom - Risikoreduzierende Operation"
empfehlung_nr: "3.38"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Risikoreduzierende Operation bei gesunden Trägerinnen wahrscheinlich pathogener /
  pathogener konstitutioneller Varianten in den Genen BRCA1 oder BRCA2
  (Klasse 4/5): prophylaktische bilaterale Adnexektomie.
  Frauen mit einer PV in den Genen BRCA1 oder BRCA2 haben ein lebenszeitlich erhöhtes
  Risiko für ein Ovarialkarzinom, Tubenkarzinom und/oder ein primäres Peritonealkarzinom.
  Bei gesunden Frauen mit einer PV in den Genen BRCA1- oder BRCA2 führt die prophylaktische
  Adnexektomie zu einer Reduktion der Ovarialkarzinominzidenz und der Gesamtmortalität.
  Daher soll die prophylaktische beidseitige Salpingo-Oophorektomie fallbezogen im Rahmen
  einer umfassenden, multidisziplinären Beratung über potentielle Vor- und Nachteile
  eines solchen Eingriffs und unter Berücksichtigung fehlender effektiver
  Früherkennungsmöglichkeiten diskutiert und empfohlen werden.

datenobjekte:
  - name: "Prophylaktische bilaterale Salpingo-Oophorektomie (BRRSO)"
    beschreibung: "Risikoreduzierende beidseitige Adnexektomie bei BRCA1/2-PV-Trägerinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      code: "5-652"
      display: "Ovariektomie"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Gesunde Trägerinnen PV BRCA1/2 (Klasse 4/5), nach Familienplanung"

  - name: "Empfohlenes Alter BRRSO"
    beschreibung: "Empfohlenes Alter für BRRSO: BRCA1 ab 35 Jahre, BRCA2 ab 40 (Option)/45 (empfohlen)"
    datentyp: "Quantity"
    terminologie:
      system: "-"
    wertebereich: "BRCA1: ab 35J | BRCA2: ab 40J (Option), ab 45J (empfohlen)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Risikoreduzierende Adnexektomie nicht in Senologie-Profilen. Procedure wäre geeignet."

referenzen:
  s3_literatur: ["168", "187", "189", "191", "206", "207", "208", "209", "210", "211"]
  verwandte_empfehlungen: ["3.37", "3.39"]
```

### Empfehlung 3.39

```yaml
id: S3-5.0-3.39
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom - Risikoreduzierende Operation"
empfehlung_nr: "3.39"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Risikoreduzierende Operation bei bereits unilateral an Brustkrebs erkrankten
  Trägerinnen wahrscheinlich pathogener / pathogener konstitutioneller Varianten (PV)
  in den Genen BRCA1 oder BRCA2 (Klasse 4/5): kontralaterale prophylaktische
  Mastektomie und prophylaktische bilaterale Adnexektomie.
  Bereits an Brustkrebs erkrankte Frauen mit einer PV in den Genen BRCA1 oder BRCA2
  haben ein erhöhtes Risiko für die Entstehung eines kontralateralen Mammakarzinoms.
  Bei Frauen mit einer PV in den Genen BRCA1 oder BRCA2 führt die kontralaterale,
  prophylaktische Mastektomie zu einer Reduktion des kontralateralen Karzinomrisikos.
  Bei Patientinnen mit einer PV in den Genen BRCA1 oder BRCA2 führt die prophylaktische
  Adnexektomie zu einer Reduktion der Brustkrebs-spezifischen Mortalität und zu einer
  Verbesserung des Gesamtüberlebens.

datenobjekte:
  - name: "Kontralaterale prophylaktische Mastektomie"
    beschreibung: "Risikoreduzierende kontralaterale Mastektomie bei bereits erkrankten BRCA1/2-PV-Trägerinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      code: "5-870"
      display: "Exzision Mamma"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Bereits unilateral erkrankte Trägerinnen PV BRCA1/2 (Klasse 4/5)"

  - name: "Prophylaktische bilaterale Adnexektomie bei Erkrankten"
    beschreibung: "BRRSO bei bereits an Brustkrebs erkrankten BRCA1/2-PV-Trägerinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      code: "5-652"
      display: "Ovariektomie"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Bereits erkrankte Trägerinnen PV BRCA1/2 (Klasse 4/5)"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Risikoreduzierende Operationen bei Erkrankten nicht in Senologie-Profilen."

referenzen:
  s3_literatur: ["218", "205", "199", "200", "219", "220", "221", "222", "223", "209", "211", "180", "224"]
  verwandte_empfehlungen: ["3.37", "3.38"]
```

### Empfehlung 3.40

```yaml
id: S3-5.0-3.40
kapitel: "3.3"
kapitel_titel: "Familiäres Mammakarzinom - Risikoreduzierende Operation"
empfehlung_nr: "3.40"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Risiko-reduzierende Operation bei Risikopersonen ohne nachgewiesene wahrscheinlich
  pathogene / pathogene Variante (PV) (Klasse 4/5) in den Genen BRCA1 oder BRCA2.
  Bei Frauen ohne nachgewiesene einer PV in den Genen BRCA1 oder BRCA2 ist der Nutzen
  einer risiko-reduzierend bilateralen Mastektomie oder einer risiko-reduzierend
  kontralateralen Mastektomie nicht nachgewiesen.

datenobjekte:
  - name: "BRCA1/2-Teststatus negativ"
    beschreibung: "Dokumentation eines negativen oder nicht-informativen BRCA1/2-Testergebnisses"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      code: "HGNC:1100 (BRCA1), HGNC:1101 (BRCA2)"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Vor Entscheidung über risikoreduzierende Operation"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Negatives Testergebnis als Ausschlusskriterium für OP. Genomics Reporting IG anwendbar."

referenzen:
  s3_literatur: ["200", "232", "233", "180"]
  verwandte_empfehlungen: ["3.37", "3.38", "3.39"]
```

---

## 3.4 Versorgungsstrukturen: Strukturmerkmale einer guten Versorgung

### Empfehlung 3.41

```yaml
id: S3-5.0-3.41
kapitel: "3.4"
kapitel_titel: "Versorgungsstrukturen: Strukturmerkmale einer guten Versorgung"
empfehlung_nr: "3.41"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Wesentliche Strukturmerkmale für eine qualitätsgesicherte, fach- und sektorenübergreifende
  Betreuung der Patientinnen und Patienten mit Brustkrebs sind
  - die flächendeckende Durchführung und Weiterentwicklung von Früherkennungsmaßnahmen
    (wie Mammographie-Screening, Erfassung des genetischen Risikos) mit evidenzbasierter
    und qualitätsgesicherter Aufklärung,
  - die Behandlung in zertifizierten Brustkrebszentren, u.a. nach DKG e.V. und DGS e.V. mit
    - Umsetzung der S3-Leitlinie,
    - Verbesserung der Kommunikation in der Versorgungskette zur sektorenübergreifenden
      Nachsorge,
    - und Integration von z.B. Sozialdienst, Psychoonkologie, Rehabilitation, Physiotherapie,
      Palliativmedizin, Ernährungsberatung, onkologischer Fachpflege, weiterer
      Gesundheitsfachberufe und der Selbsthilfe in die Betreuungskonzepte.

datenobjekte:
  - name: "Zertifizierungsstatus Brustkrebszentrum"
    beschreibung: "Status der Zertifizierung des behandelnden Zentrums (DKG/DGS)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "-"
    wertebereich: "DKG-zertifiziert | DGS-zertifiziert | Nicht zertifiziert"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Zertifizierungsstatus der Organisation nicht in Senologie-Profilen. Organization.type oder Extension wäre geeignet."

referenzen:
  s3_literatur: ["234", "235", "237", "238"]
  verwandte_empfehlungen: ["3.10", "3.42", "3.43"]
```

### Empfehlung 3.42

```yaml
id: S3-5.0-3.42
kapitel: "3.4"
kapitel_titel: "Versorgungsstrukturen"
empfehlung_nr: "3.42"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen und Patienten mit DCIS u/o invasivem Mammakarzinom soll die
  Checkliste zur Erfassung einer möglichen erblichen Belastung für Brust- und/oder
  Eierstockkrebs angewendet werden.

datenobjekte:
  - name: "Checkliste erbliche Belastung angewendet"
    beschreibung: "Dokumentation der Anwendung der Checkliste zur Erfassung erblicher Belastung für Brust-/Eierstockkrebs"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"
    bedingung: "DCIS und/oder invasives Mammakarzinom"

  - name: "Ergebnis Checkliste erbliche Belastung"
    beschreibung: "Ergebnis: Kriterien für genetische Testung erfüllt ja/nein"
    datentyp: "CodeableConcept"
    terminologie:
      system: "-"
    wertebereich: "Kriterien erfüllt | Kriterien nicht erfüllt"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Checkliste zur erblichen Belastung ist ein zentrales Screening-Instrument.
    Questionnaire/QuestionnaireResponse wäre ein geeignetes FHIR-Modell. Kein Senologie-Profil vorhanden.

referenzen:
  s3_literatur: ["236"]
  verwandte_empfehlungen: ["3.27", "3.41"]
```

### Empfehlung 3.43

```yaml
id: S3-5.0-3.43
kapitel: "3.4"
kapitel_titel: "Versorgungsstrukturen"
empfehlung_nr: "3.43"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen und Patienten mit DCIS u/o invasivem Mammakarzinom sollen in einer
  prätherapeutischen und in einer postoperativen interdisziplinären Tumorkonferenz
  vorgestellt werden.

datenobjekte:
  - name: "Prätherapeutische Tumorkonferenz"
    beschreibung: "Dokumentation der Vorstellung in prätherapeutischer interdisziplinärer Tumorkonferenz"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "708004003"
      display: "Multidisciplinary review (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

  - name: "Postoperative Tumorkonferenz"
    beschreibung: "Dokumentation der Vorstellung in postoperativer interdisziplinärer Tumorkonferenz"
    datentyp: "boolean"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "708004003"
      display: "Multidisciplinary review (procedure)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Tumorkonferenz-Dokumentation ist nicht in Senologie-Profilen abgebildet. ClinicalImpression oder Encounter wäre geeignet."

referenzen:
  verwandte_empfehlungen: ["3.41"]
```

---

## Gap-Analyse Kapitel 3

| Empfehlung | Thema | FHIR-Status | Gap-Beschreibung | Priorität |
|------------|-------|-------------|------------------|-----------|
| 3.1-3.3 | Patientenzentrierte Kommunikation | gap | Prozessuale Empfehlungen, kein FHIR-Bedarf | niedrig |
| 3.4 | Langzeitüberlebende Informationsbedarf | gap | PRO-Instrumente, Survivorship-Dokumentation fehlt | mittel |
| 3.5-3.6 | Selbstbestimmung, E-Health | gap | Prozessual/Statement, kein FHIR-Bedarf | niedrig |
| 3.7-3.8 | Risikofaktoren (Alter, Geschlecht) | mapped | Patient.birthDate, Patient.gender | - |
| 3.9-3.10 | Screening allgemein, Zentren | gap | Organization-Zertifizierung fehlt | mittel |
| 3.11 | Risikofaktoren-Anamnese | gap | FamilyMemberHistory, RiskAssessment fehlen | hoch |
| 3.12 | Brustselbstuntersuchung | gap | Statement, kein FHIR-Bedarf | niedrig |
| 3.13 | Brustkrebsrisiko-Bewertung | gap | RiskAssessment-Profil fehlt | hoch |
| 3.14 | Klinische Brustuntersuchung | gap | Untersuchungsbefund-Profil fehlt | mittel |
| 3.15 | Mammographie Statement | gap | Statement, kein FHIR-Bedarf | niedrig |
| 3.16-3.17 | MSP-Teilnahme | gap | Screening-Procedure/DiagnosticReport fehlt | mittel |
| 3.18-3.20 | Screening-Evidenz | gap | Statements, kein FHIR-Bedarf | niedrig |
| 3.21 | Tomosynthese + Mammogr. Dichte | gap | Bildgebungsmodalität + ACR-Dichte-Observation fehlt | hoch |
| 3.22-3.24 | Sonographie/MRT/KI | gap | Statements/negative Empfehlungen, kein FHIR-Bedarf | niedrig |
| 3.25-3.26 | Mammographische Dichte | gap | ACR-Dichte-Observation fehlt | hoch |
| **3.27** | **Genetische Testung Indikation** | **gap** | **FamilyMemberHistory + RiskAssessment + Genomics Reporting fehlen** | **sehr hoch** |
| **3.28** | **Erweiterte Testindikationen** | **gap** | **Wie 3.27** | **sehr hoch** |
| 3.29-3.30 | Beratung/Selbsthilfe | gap | Prozessual, niedriger FHIR-Bedarf | niedrig |
| **3.31** | **ACMG-Klassifikation** | **gap** | **Genomics Reporting IG (DiagnosticImplication) nicht profiliert** | **sehr hoch** |
| **3.32** | **Beratung vor/nach Testung** | **gap** | **Genetic Counseling Procedure fehlt** | **hoch** |
| 3.33 | BRCA1-Phänotyp | partial | Grading/Rezeptoren in Pathologie-Profil, BRCA-Zuordnung fehlt | mittel |
| 3.34 | Hinweis erblicher Hintergrund | partial | DiagnosticReport.conclusion nutzbar, spezifische Codierung fehlt | mittel |
| **3.35** | **Intensivierte Früherkennung** | **gap** | **CarePlan für iFE + Genomics Reporting fehlen** | **sehr hoch** |
| **3.36** | **Therapie BRCA-assoziiert** | **gap** | **BRCA-Status -> PARP-Inhibitor-Verknüpfung fehlt** | **hoch** |
| 3.37-3.40 | Risikoreduzierende Operationen | gap | Procedure-Profile für BRRM/BRRSO fehlen | hoch |
| 3.41 | Versorgungsstrukturen | gap | Organization-Zertifizierung fehlt | mittel |
| **3.42** | **Checkliste erbliche Belastung** | **gap** | **Questionnaire/QuestionnaireResponse fehlt** | **sehr hoch** |
| 3.43 | Tumorkonferenz | gap | ClinicalImpression/Encounter fehlt | hoch |

### Zusammenfassung

- **Gesamtzahl Empfehlungen**: 43 (3.1-3.43)
- **Davon Evidenzbasiert**: 14 (3.4, 3.12, 3.15, 3.16, 3.18, 3.20, 3.21, 3.25, 3.26, 3.27, 3.29, 3.35, 3.36, 3.37, 3.38, 3.39, 3.40)
- **Davon Konsensbasiert (EK)**: 20 (3.1, 3.2, 3.3, 3.5, 3.10, 3.11, 3.13, 3.14, 3.17, 3.19, 3.22, 3.23, 3.28, 3.30, 3.31, 3.32, 3.34, 3.42, 3.43)
- **Davon Statement**: 9 (3.6, 3.7, 3.8, 3.9, 3.15, 3.18, 3.20, 3.24, 3.25, 3.26, 3.33, 3.41)
- **FHIR-Status mapped**: 2 (3.7, 3.8 - Alter/Geschlecht im Patient)
- **FHIR-Status partial**: 2 (3.33, 3.34 - Pathologie-Befund)
- **FHIR-Status gap**: 39

### Priorisierte FHIR-Profilierungs-Bedarfe

1. **Genetische Testung und Befundung** (3.27, 3.28, 3.31, 3.35, 3.36): Genomics Reporting IG profilieren fuer BRCA1/2 und weitere Risikogene (PALB2, ATM, CHEK2, etc.) mit ACMG-Klassifikation
2. **Familienanamnese Brust-/Eierstockkrebs** (3.11, 3.27, 3.42): FamilyMemberHistory-Profil mit Checkliste-Items
3. **Risikobewertung** (3.13, 3.19, 3.35): RiskAssessment-Profil fuer Brustkrebsrisiko (Lebenszeit-/10-Jahres-Risiko, BOADICEA)
4. **Mammographische Dichte** (3.21, 3.25): Observation-Profil mit ACR-Density-ValueSet
5. **Screening/Frueerkennung** (3.16, 3.35): Procedure/CarePlan fuer MSP und intensivierte Frueerkennung
6. **Risikoreduzierende Operationen** (3.37-3.40): Procedure-Profile fuer BRRM/BRRSO
7. **Tumorkonferenz** (3.43): ClinicalImpression/Encounter fuer Tumorboard-Dokumentation
