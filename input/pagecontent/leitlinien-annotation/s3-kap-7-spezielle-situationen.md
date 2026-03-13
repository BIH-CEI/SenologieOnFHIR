# S3-Leitlinie v5.0 - Kapitel 7: Spezielle Situationen bei Mammakarzinom

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 298-342
> Kapitelstruktur: 7.1 Fertilitaetserhalt/Schwangerschaft | 7.2 Aeltere Patientin | 7.3 Mammakarzinom des Mannes | 7.4 Transgender und Brustkrebs | 7.5 Brustrekonstruktion | 7.6 Spezielle Tumorentitaeten

---

## 7.1 Fertilitaetserhalt, Schwangerschaft nach Mammakarzinom, Mammakarzinom in Schwangerschaft und Stillzeit

### 7.1.1 Fertilitaetserhalt

#### Empfehlung 7.1

```yaml
id: S3-5.0-7.1
kapitel: "7.1.1"
kapitel_titel: "Fertilitaetserhalt"
empfehlung_nr: "7.1"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Mammakarzinompatientinnen im gebaerfaehigen Alter sollen eine Beratung ueber
  Fertilitaet und Fertilitaetserhalt vor Therapiebeginn erhalten.

datenobjekte:
  - name: "Fertilitaetsberatung durchgefuehrt"
    beschreibung: "Dokumentation, dass eine Beratung zu Fertilitaet und Fertilitaetserhalt vor Therapiebeginn erfolgte"
    datentyp: "boolean"
    terminologie:
      system: "-"
    verpflichtung: "obligat"
    bedingung: "Patientinnen im gebaerfaehigen Alter"

  - name: "Fertilitaetserhaltende Massnahme geplant/durchgefuehrt"
    beschreibung: "Art der fertilitaetserhaltenden Massnahme"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "GnRH-Analoga | Kryokonservierung Eizellen | Kryokonservierung Ovargewebe | keine"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Kein spezifisches Profil fuer Fertilitaetsberatung/-erhalt vorhanden. Koennte als Procedure oder CarePlan modelliert werden."

referenzen:
  verwandte_empfehlungen: ["7.2", "7.3"]
  querschnittsleitlinien: ["S2/3-Leitlinie Fertilitaetserhalt"]
```

#### Empfehlung 7.2

```yaml
id: S3-5.0-7.2
kapitel: "7.1.1"
kapitel_titel: "Fertilitaetserhalt"
empfehlung_nr: "7.2"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die GnRH-Analoga-Gabe vor Beginn der Chemotherapie kann bei allen Frauen mit
  Wunsch zum Erhalt der Ovarfunktion/Fertilitaet erwogen werden.

datenobjekte:
  - name: "GnRH-Analoga-Gabe"
    beschreibung: "Verabreichung von GnRH-Analoga vor Chemotherapiebeginn zum Fertilitaetserhalt"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      code: "L02AE"
      display: "GnRH-Analoga"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "optional"
    bedingung: "Frauen mit Wunsch zum Erhalt der Ovarfunktion/Fertilitaet"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "GnRH-Analoga als Begleittherapie zur Chemotherapie zum Fertilitaetserhalt nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1568", "1569", "1570", "1571"]
```

#### Empfehlung 7.3

```yaml
id: S3-5.0-7.3
kapitel: "7.1.1"
kapitel_titel: "Fertilitaetserhalt"
empfehlung_nr: "7.3"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Kryokonservierung von Eizellen oder Ovarialgewebe soll Frauen bei nicht ab-
  geschlossener Familienplanung angeboten werden.

datenobjekte:
  - name: "Kryokonservierung angeboten"
    beschreibung: "Dokumentation, dass Kryokonservierung als Option angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Nicht abgeschlossene Familienplanung"

  - name: "Art der Kryokonservierung"
    beschreibung: "Art des kryokonservierten Materials"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Eizellen | Ovarialgewebe | Embryonen"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Kein Profil fuer Kryokonservierung vorhanden."

referenzen:
  verwandte_empfehlungen: ["7.1", "7.2"]
```

### 7.1.2 Schwangerschaft nach Mammakarzinom

#### Empfehlung 7.4

```yaml
id: S3-5.0-7.4
kapitel: "7.1.2"
kapitel_titel: "Schwangerschaft nach Mammakarzinom"
empfehlung_nr: "7.4"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Von einer Schwangerschaft soll nach einer Mammakarzinomerkrankung nicht ab-
  geraten werden. Dies gilt unabhaengig vom Hormonrezeptorstatus.

datenobjekte:
  - name: "Beratung Schwangerschaft nach MaCa"
    beschreibung: "Dokumentation der Beratung zur Schwangerschaft nach Mammakarzinom"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Beratungsdokumentation nicht als FHIR-Ressource modelliert."

referenzen:
  s3_literatur: ["1573", "1574"]
  verwandte_empfehlungen: ["7.5", "7.6", "7.7"]
```

#### Empfehlung 7.5 (Statement)

```yaml
id: S3-5.0-7.5
kapitel: "7.1.2"
kapitel_titel: "Schwangerschaft nach Mammakarzinom"
empfehlung_nr: "7.5"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Der Zeitpunkt der eintretenden Schwangerschaft nach einer Mammakarzinomer-
  krankung korreliert nicht mit einer schlechteren Prognose.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Informatives Statement ohne direkte Datenobjekte."

referenzen:
  s3_literatur: ["1573", "1574", "1575"]
```

#### Empfehlung 7.6

```yaml
id: S3-5.0-7.6
kapitel: "7.1.2"
kapitel_titel: "Schwangerschaft nach Mammakarzinom"
empfehlung_nr: "7.6"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Das individuelle Rezidivrisiko, das Alter und die individuelle Krankheits- und Le-
  benssituation sollen in die Beratung ueber eine nachfolgende Schwangerschaft mit
  einfliessen.

datenobjekte:
  - name: "Rezidivrisiko"
    beschreibung: "Individuelles Rezidivrisiko als Faktor in der Schwangerschaftsberatung"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

  - name: "Alter bei Beratung"
    beschreibung: "Alter der Patientin zum Zeitpunkt der Beratung"
    datentyp: "Quantity (Jahre)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Beratungsinhalt, kein spezifisches Profil."

referenzen:
  verwandte_empfehlungen: ["7.4", "7.7"]
```

#### Empfehlung 7.7

```yaml
id: S3-5.0-7.7
kapitel: "7.1.2"
kapitel_titel: "Schwangerschaft nach Mammakarzinom"
empfehlung_nr: "7.7"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Je laenger eine endokrine Therapie durchgefuehrt wird, desto besser ist die langfris-
  tige Prognose. Wenn eine Schwangerschaft vor Ende der geplanten endokrinen
  Therapiedauer gewuenscht wird, dann sollte die endokrine Therapie nach Entbin-
  dung und Stillzeit fortgesetzt werden.

datenobjekte:
  - name: "Unterbrechung endokrine Therapie"
    beschreibung: "Dokumentation einer Therapieunterbrechung fuer Schwangerschaft"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Schwangerschaftswunsch unter endokriner Therapie"

  - name: "Wiederaufnahme endokrine Therapie"
    beschreibung: "Geplante Wiederaufnahme nach Entbindung/Stillzeit"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Therapieunterbrechung und Wiederaufnahme nicht als spezifisches Datenelement modelliert."

referenzen:
  verwandte_empfehlungen: ["7.4", "7.6"]
```

#### Empfehlung 7.8

```yaml
id: S3-5.0-7.8
kapitel: "7.1.2"
kapitel_titel: "Schwangerschaft nach Mammakarzinom"
empfehlung_nr: "7.8"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Reproduktionsmedizinische Verfahren koennen nach einer Mammakarzinomer-
  krankung zum Erreichen einer Schwangerschaft eingesetzt werden.

datenobjekte:
  - name: "Reproduktionsmedizinisches Verfahren"
    beschreibung: "Art des eingesetzten reproduktionsmedizinischen Verfahrens"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Reproduktionsmedizin nicht im Senologie-Profil abgebildet."

referenzen:
  s3_literatur: ["1579", "1580"]
```

#### Empfehlung 7.9 (Statement)

```yaml
id: S3-5.0-7.9
kapitel: "7.1.2"
kapitel_titel: "Schwangerschaft nach Mammakarzinom"
empfehlung_nr: "7.9"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Patientin soll darueber aufgeklaert werden, dass die Erfolgsaussichten fuer eine
  intakte Schwangerschaft bzw. ein Kind bei autologer Eizellverwendung bei
  Mammakarzinompatientinnen geringer sind als bei Nicht-Karzinompatientinnen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Aufklaerungsinhalt, kein FHIR-Datenobjekt."

referenzen:
  s3_literatur: ["1578", "1579"]
```

### 7.1.3 Mammakarzinom waehrend der Schwangerschaft

#### Empfehlung 7.10

```yaml
id: S3-5.0-7.10
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.10"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Bei Schwangeren mit Verdacht auf Mammakarzinom sollte die Abklaerungsdiag-
  nostik sowie im Falle eines bestaetigten Mammakarzinoms die Ausbreitungsdiag-
  nostik moeglichst nah an dem Vorgehen bei nicht-schwangeren Frauen ausgerich-
  tet sein. Der Embryo bzw. Fetus soll hierbei weitestmoeglich (und insbesondere im
  1. Trimenon) vor einer Strahlenbelastung und einer Kontrastmittelexposition ge-
  schuetzt werden.

datenobjekte:
  - name: "Schwangerschaftsstatus"
    beschreibung: "Schwangerschaftsstatus zum Zeitpunkt der Diagnostik"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "82810-3"
      display: "Pregnancy status"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"

  - name: "Schwangerschaftswoche"
    beschreibung: "Gestationsalter / Trimenon bei Diagnose"
    datentyp: "Quantity (Wochen)"
    verpflichtung: "obligat"

  - name: "Diagnostik-Anpassung Schwangerschaft"
    beschreibung: "Dokumentation der Anpassung der Diagnostik zum Schutz des Fetus"
    datentyp: "string"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Schwangerschaftsstatus kann ueber Observation (LOINC 82810-3) abgebildet werden. Spezifische Anpassung der Diagnostik bei Schwangerschaft nicht modelliert."

referenzen:
  s3_literatur: ["340"]
  verwandte_empfehlungen: ["7.11", "7.12", "7.13", "7.14", "7.15", "7.16"]
```

#### Empfehlung 7.11

```yaml
id: S3-5.0-7.11
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.11"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Behandlung (Systemtherapie, Operation, RT) von schwangeren Patientinnen
  mit Mammakarzinom soll so nah wie moeglich an der Standardbehandlung, nicht-
  schwangerer Patientinnen vergleichbaren Alters mit Mammakarzinomen ausge-
  richtet sein.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Therapeutischer Grundsatz, keine spezifischen Datenobjekte."

referenzen:
  verwandte_empfehlungen: ["7.10", "7.12", "7.13", "7.14"]
```

#### Empfehlung 7.12

```yaml
id: S3-5.0-7.12
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.12"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine Standardchemotherapie mit Anthrazyklinen, Taxanen, Carboplatin kann im 2.
  und 3. Trimenon verabreicht werden.

datenobjekte:
  - name: "Chemotherapie in Schwangerschaft"
    beschreibung: "Art der Chemotherapie waehrend der Schwangerschaft"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "Anthrazykline | Taxane | Carboplatin"
    verpflichtung: "optional"
    bedingung: "Ab 2. Trimenon"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Chemotherapie modellierbar, Kontext Schwangerschaft (Trimenon-Einschraenkung) nicht spezifisch abgebildet."

referenzen:
  s3_literatur: ["1581", "1582", "1583", "1584", "340"]
```

#### Empfehlung 7.13

```yaml
id: S3-5.0-7.13
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.13"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Eine Anti-HER2-Therapie soll in der Schwangerschaft nicht verabreicht werden.

datenobjekte:
  - name: "Anti-HER2-Therapie Kontraindikation Schwangerschaft"
    beschreibung: "Kontraindikation fuer Anti-HER2-Therapie in der Schwangerschaft"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Schwangerschaft"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Kontraindikation waehrend Schwangerschaft nicht als spezifische Einschraenkung modelliert."

referenzen:
  s3_literatur: ["1585", "1586"]
```

#### Empfehlung 7.14

```yaml
id: S3-5.0-7.14
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.14"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Eine endokrine Therapie soll in der Schwangerschaft nicht verabreicht werden.

datenobjekte:
  - name: "Endokrine Therapie Kontraindikation Schwangerschaft"
    beschreibung: "Kontraindikation fuer endokrine Therapie in der Schwangerschaft"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Schwangerschaft"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Kontraindikation waehrend Schwangerschaft nicht als spezifische Einschraenkung modelliert."

referenzen:
  s3_literatur: ["1587"]
```

#### Empfehlung 7.15

```yaml
id: S3-5.0-7.15
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.15"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine Therapie mit Checkpointinhibitoren soll in der Schwangerschaft nicht verab-
  reicht werden.

datenobjekte:
  - name: "Checkpointinhibitor Kontraindikation Schwangerschaft"
    beschreibung: "Kontraindikation fuer Checkpointinhibitoren in der Schwangerschaft"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Schwangerschaft"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Kontraindikation waehrend Schwangerschaft nicht als spezifische Einschraenkung modelliert."

referenzen:
  verwandte_empfehlungen: ["7.13", "7.14"]
```

#### Empfehlung 7.16

```yaml
id: S3-5.0-7.16
kapitel: "7.1.3"
kapitel_titel: "Mammakarzinom waehrend der Schwangerschaft"
empfehlung_nr: "7.16"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die operative Therapie des Mammakarzinoms sollte wie ausserhalb der Schwanger-
  schaft durchgefuehrt werden.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_Operation"
  status: "mapped"
  anmerkung: "Operation analog zu Nicht-Schwangeren, bestehende Profile anwendbar."

referenzen:
  verwandte_empfehlungen: ["7.10", "7.11"]
```

---

## 7.2 Mammakarzinom der aelteren Patientin

### 7.2.1 Allgemein

#### Empfehlung 7.17

```yaml
id: S3-5.0-7.17
kapitel: "7.2.1"
kapitel_titel: "Allgemein"
empfehlung_nr: "7.17"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Therapieentscheidungen bei aelteren Patientinnen sollten ausgehend von der aktu-
  ellen Standardempfehlung das biologische Alter, Lebenserwartung, Patientenprae-
  ferenz und Nutzen-Risiko-Abwaegung beruecksichtigen.

datenobjekte:
  - name: "Biologisches Alter"
    beschreibung: "Einschaetzung des biologischen Alters (vs. chronologisches Alter)"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"

  - name: "Lebenserwartung"
    beschreibung: "Geschaetzte Lebenserwartung"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"

  - name: "Patientenpraeferenz"
    beschreibung: "Dokumentierte Patientenpraeferenz zur Therapie"
    datentyp: "string"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Geriatriespezifische Assessmentdaten nicht modelliert. Patientenpraeferenz koennte als QuestionnaireResponse abgebildet werden."

referenzen:
  verwandte_empfehlungen: ["7.18", "7.19"]
```

### 7.2.2 Geriatrie

#### Empfehlung 7.18

```yaml
id: S3-5.0-7.18
kapitel: "7.2.2"
kapitel_titel: "Geriatrie"
empfehlung_nr: "7.18"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Patientinnen, die aelter als 75 Jahre sind, sollte ein geriatrisches Assessment
  oder ein Screening/Geriatrisches Assessment-Algorithmus durchgefuehrt werden,
  insbesondere wenn eine Chemotherapie oder ein operativer Eingriff mit Vollnar-
  kose geplant ist, um die Therapieadhaerenz, Chemotherapietolerabilisaet und moeg-
  licherweise das Ueberleben zu verbessern.

datenobjekte:
  - name: "Geriatrisches Assessment durchgefuehrt"
    beschreibung: "Dokumentation, ob ein geriatrisches Assessment/Screening durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Patientinnen > 75 Jahre"

  - name: "Art des Assessments"
    beschreibung: "Art des verwendeten Instruments (G8, CGA, etc.)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "G8-Fragebogen | Comprehensive Geriatric Assessment (CGA) | anderes"
    verpflichtung: "empfohlen"

  - name: "G8-Score"
    beschreibung: "Ergebnis des G8-Fragebogens (0-17 Punkte)"
    datentyp: "Quantity (Score)"
    wertebereich: "0-17 Punkte (<=14 = hohes Risiko fuer geriatrische Defizite)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Geriatrisches Assessment und G8-Score nicht als FHIR-Profil vorhanden. Modellierbar als Observation oder QuestionnaireResponse."

referenzen:
  s3_literatur: ["1599", "1600", "1601", "1602", "1603", "1604"]
  verwandte_empfehlungen: ["7.19", "7.20", "7.21"]
```

#### Empfehlung 7.19

```yaml
id: S3-5.0-7.19
kapitel: "7.2.2"
kapitel_titel: "Geriatrie"
empfehlung_nr: "7.19"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Das geriatrische Assessment und Management sollte die empfohlenen und Thera-
  pie-relevanten geriatrischen Dimensionen (Selbsthilfefaehigkeit, Mobilitaet, kognitive
  Funktion inkl. Delir, Affekt, Ernaehrung und soziale Situation) beinhalten um die
  Therapieauswahl entsprechend anzupassen und supportive Massnahmen einzulei-
  ten. Weitere Dimensionen koennen ergaenzt werden: Sensorik, Dysphagie, Sprache
  und Sprechen, Kontinenz, Schmerz, Schlaf, Sucht, Spiritualitaet, Komorbiditaeten
  und Polypharmazie.

datenobjekte:
  - name: "Geriatrische Dimensionen"
    beschreibung: "Bewertete geriatrische Dimensionen im Assessment"
    datentyp: "CodeableConcept (mehrfach)"
    wertebereich: "Selbsthilfefaehigkeit | Mobilitaet | kognitive Funktion | Delir | Affekt | Ernaehrung | soziale Situation | Sensorik | Dysphagie | Kontinenz | Schmerz | Schlaf | Polypharmazie"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Geriatrische Dimensionen als strukturiertes Assessment nicht modelliert. Umfangreiche QuestionnaireResponse-Struktur erforderlich."

referenzen:
  verwandte_empfehlungen: ["7.18", "7.20"]
```

#### Empfehlung 7.20

```yaml
id: S3-5.0-7.20
kapitel: "7.2.2"
kapitel_titel: "Geriatrie"
empfehlung_nr: "7.20"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (sehr niedrig bis niedrig)"
konsensstaerke: "Konsens"
status: "geprueft 2025"
text: >
  aus S3-Leitlinie Umfassendes Geriatrisches Assessment (Comprehensive Geriatric
  Assessment CGA) bei hospitalisierten Patientinnen und Patienten, Langversion 1.1,
  2024. AWMF-Registernummer: 084-003.
  Bei aelteren Patient*innen sollte ein geriatrisches Screening mittels G8-Fragebogen
  vorgenommen werden, um Patient*innen zu identifizieren, die von einem Com-
  prehensive Geriatric Assessment (CGA) vor Einleitung einer onkologischen Thera-
  pie profitieren.

datenobjekte:
  - name: "G8-Screening durchgefuehrt"
    beschreibung: "Ob G8-Fragebogen als Screening-Instrument eingesetzt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "G8-Score"
    beschreibung: "Ergebnis des G8-Screenings"
    datentyp: "Quantity (Score)"
    wertebereich: "0-17 Punkte"
    verpflichtung: "empfohlen"

  - name: "CGA indiziert"
    beschreibung: "Ob basierend auf G8-Score ein CGA indiziert ist"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "G8-Score <= 14"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "G8 und CGA nicht als Profil vorhanden."

referenzen:
  s3_literatur: ["1609", "1610", "1611"]
  querschnittsleitlinien: ["S3-Leitlinie CGA, AWMF 084-003"]
```

#### Empfehlung 7.21

```yaml
id: S3-5.0-7.21
kapitel: "7.2.2"
kapitel_titel: "Geriatrie"
empfehlung_nr: "7.21"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (sehr niedrig bis niedrig)"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  aus S3-Leitlinie CGA, AWMF 084-003.
  Patient*innen >= 65 Jahre, die einen G8-Score <= 14 Punkten haben, geriatrische Pa-
  tient*innen sowie alle Patient*innen >= 70 Jahre sollten ein Comprehensive Geriatric
  Assessment (CGA) vor Einleitung einer onkologischen Therapie erhalten, um
  das Risiko von Therapie-assoziierter Toxizitaet CTCAE Grad 3 oder hoeher zu redu-
  zieren.

datenobjekte:
  - name: "CGA durchgefuehrt"
    beschreibung: "Ob ein Comprehensive Geriatric Assessment durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "G8 <= 14 ODER Alter >= 70"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "CGA nicht modelliert."

referenzen:
  s3_literatur: ["1609", "1610", "1614"]
  querschnittsleitlinien: ["S3-Leitlinie CGA, AWMF 084-003"]
```

#### Empfehlung 7.22

```yaml
id: S3-5.0-7.22
kapitel: "7.2.2"
kapitel_titel: "Geriatrie"
empfehlung_nr: "7.22"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (niedrig)"
konsensstaerke: "Konsens"
status: "geprueft 2025"
text: >
  aus S3-Leitlinie CGA, AWMF 084-003.
  Ein Comprehensive Geriatric Assessment (CGA) bei aelteren Patient*innen in der
  Onkologie fuehrt wahrscheinlich nicht zu einer Verzoegerung der onkologischen
  Therapie.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Informatives Statement."

referenzen:
  s3_literatur: ["1609", "1610"]
  querschnittsleitlinien: ["S3-Leitlinie CGA, AWMF 084-003"]
```

### 7.2.3 Lokale Therapie

#### Empfehlung 7.23 (Statement)

```yaml
id: S3-5.0-7.23
kapitel: "7.2.3"
kapitel_titel: "Lokale Therapie"
empfehlung_nr: "7.23"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die operative Therapie der aelteren Patientin unterscheidet sich nicht grundsaetzlich
  von der der juengeren Patientin.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_Operation"
  status: "mapped"
  anmerkung: "Bestehende OP-Profile anwendbar."

referenzen:
  verwandte_empfehlungen: ["7.24", "7.25"]
```

#### Empfehlung 7.24

```yaml
id: S3-5.0-7.24
kapitel: "7.2.3"
kapitel_titel: "Lokale Therapie"
empfehlung_nr: "7.24"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Patientinnen mit ER/PR-positivem Mammakarzinom: Eine primaer endokrine
  Therapie sollte durchgefuehrt werden, wenn eine OP bei Gebrechlichkeit (u. a.
  Komorbiditaet und erhoehtem Narkoserisiko) oder OP-Ablehnung nicht durchge-
  fuehrt wird. Bei der Therapiewahl sind die Medikamenten-assoziierten spezifischen
  Nebenwirkungen, insbesondere Thrombose/Embolie-Risiko (Tamoxifen) bzw.
  Knochenfrakturrisiko (Aromatasehemmer), zu beachten.

datenobjekte:
  - name: "Primaer endokrine Therapie statt OP"
    beschreibung: "Einsatz primaerer endokriner Therapie als Alternative zur Operation"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "ER/PR-positiv UND OP nicht moeglich/abgelehnt"

  - name: "Grund fuer OP-Verzicht"
    beschreibung: "Grund fuer Verzicht auf Operation"
    datentyp: "CodeableConcept"
    wertebereich: "Gebrechlichkeit | Komorbiditaet | erhoehtes Narkoserisiko | Patientenablehnung"
    verpflichtung: "obligat"
    bedingung: "Bei primaer endokriner Therapie"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Primaer endokrine Therapie als Alternative zur OP nicht spezifisch abgebildet."

referenzen:
  s3_literatur: ["1617"]
```

#### Empfehlung 7.25

```yaml
id: S3-5.0-7.25
kapitel: "7.2.3"
kapitel_titel: "Lokale Therapie"
empfehlung_nr: "7.25"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Patientinnen mit ER- und PR-negativem Mammakarzinom: Wenn eine OP in All-
  gemeinanasthesie bei Gebrechlichkeit (u. a. Komorbiditaet und erhoehtes OP-Risiko)
  oder OP-Ablehnung nicht durchgefuehrt wird, koennen eine chirurgische Therapie in
  Lokalanaesthesie, eine primaere Strahlentherapie oder eine rein palliativmedizini-
  sche Betreuung erwogen werden.

datenobjekte:
  - name: "Alternative Therapie bei ER/PR-negativ"
    beschreibung: "Gewaehlte alternative Therapie bei OP-Verzicht"
    datentyp: "CodeableConcept"
    wertebereich: "OP in Lokalanaesthesie | primaere Strahlentherapie | palliative Betreuung"
    verpflichtung: "optional"
    bedingung: "ER/PR-negativ UND OP in Allgemeinanasthesie nicht moeglich"

fhir_mapping:
  profil: "Senologie_Operation / -"
  status: "partial"
  anmerkung: "Therapiealternativen bei OP-Verzicht nicht spezifisch modelliert."

referenzen:
  verwandte_empfehlungen: ["7.24"]
```

### 7.2.4 Adjuvante endokrine Therapie

#### Empfehlung 7.26

```yaml
id: S3-5.0-7.26
kapitel: "7.2.4"
kapitel_titel: "Adjuvante endokrine Therapie"
empfehlung_nr: "7.26"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "geprueft 2025"
text: >
  Eine endokrine Therapie ist bei Hormonrezeptor-positiver Erkrankung empfohlen.
  Bei Patientinnen mit sehr guenstigem Tumorstadium oder sehr guenstiger Biologie
  oder sehr gebrechlicher Patientin kann im Einzelfall darauf verzichtet werden.

datenobjekte:
  - name: "Verzicht auf endokrine Therapie"
    beschreibung: "Begründeter Verzicht auf endokrine Therapie bei aelteren Patientinnen"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Sehr guenstiges Stadium/Biologie ODER sehr gebrechlich"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Therapieverzicht bei aelteren Patientinnen nicht spezifisch dokumentierbar."

referenzen:
  s3_literatur: ["1618", "1619"]
```

### 7.2.5 Adjuvante Chemotherapie

#### Empfehlung 7.27 (Statement)

```yaml
id: S3-5.0-7.27
kapitel: "7.2.5"
kapitel_titel: "Adjuvante Chemotherapie"
empfehlung_nr: "7.27"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Eine Chemotherapie kann bei aelteren Frauen > 70 Jahre mit einem signifikanten
  Rueckgang der kognitiven Leistungsfaehigkeit assoziiert sein.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Informatives Statement ueber Nebenwirkungen."

referenzen:
  s3_literatur: ["1621", "1622"]
```

#### Empfehlung 7.28

```yaml
id: S3-5.0-7.28
kapitel: "7.2.5"
kapitel_titel: "Adjuvante Chemotherapie"
empfehlung_nr: "7.28"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Anthrazyklin- und/oder taxanbasierte Kombinations- oder Sequenz-Regime soll-
  ten bevorzugt werden. Ein erhoehtes Kardiotoxizitaetsrisiko und MDS/AML Risiko
  bei Anthrazyklinen soll beruecksichtigt werden.

datenobjekte:
  - name: "Chemotherapie-Regime"
    beschreibung: "Gewaehltes Chemotherapie-Regime bei aelteren Patientinnen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "Anthrazyklin-basiert | Taxan-basiert | Kombination | Sequenz"
    verpflichtung: "empfohlen"

  - name: "Kardiotoxizitaetsrisiko bewertet"
    beschreibung: "Dokumentation der Bewertung des Kardiotoxizitaetsrisikos"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Anthrazyklin-Einsatz"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Chemotherapie-Regime modellierbar. Kardiotoxizitaetsrisikobewertung nicht spezifisch abgebildet."

referenzen:
  s3_literatur: ["1623", "1624", "1625", "1626", "1627", "1628", "1629", "1630"]
```

#### Empfehlung 7.29 (Statement)

```yaml
id: S3-5.0-7.29
kapitel: "7.2.5"
kapitel_titel: "Adjuvante Chemotherapie"
empfehlung_nr: "7.29"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Alleinige Monochemotherapien (z. B. Paclitaxel oder Capecitabin) sind weniger
  wirksam im Vergleich zu Standardkombinationstherapien.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Informatives Statement."

referenzen:
  s3_literatur: ["1625"]
```

---

## 7.3 Mammakarzinom des Mannes

#### Empfehlung 7.30

```yaml
id: S3-5.0-7.30
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.30"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Durch Information von insbesondere Hausaerzten und Urologen ueber das individu-
  elle Risiko fuer ein Mammakarzinom des Mannes, dessen Symptome, die durchzu-
  fuehrende Diagnostik und die leitliniengerechte Behandlung soll eine fruehzeitige
  und zielgerichtete Diagnose und Behandlung des maennlichen Mammakarzinoms
  gefoerdert werden.

datenobjekte:
  - name: "Geschlecht des Patienten"
    beschreibung: "Biologisches Geschlecht - maennlich"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HL7 AdministrativeGender"
      code: "male"
      display: "Male"
      mapping_quelle: "standard"
      validiert: true
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Patient"
  status: "mapped"
  anmerkung: "Geschlecht ueber Patient.gender abgebildet. Informationsempfehlung ohne spezifische Datenobjekte."

referenzen:
  s3_literatur: ["1631"]
```

#### Empfehlung 7.31

```yaml
id: S3-5.0-7.31
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.31"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Basisdiagnostik soll bei Verdacht auf einen malignen Befund durch Anamnese,
  klinische Untersuchung, Mammographie sowie Ultraschalldiagnostik der Brust
  und der Lymphabflussregionen und eine histologische Sicherung erfolgen.
  Zum diagnostischen Einsatz der KM-MRT der Brust liegen keine ausreichende Da-
  ten vor.

datenobjekte:
  - name: "Diagnostik maennliches MaCa"
    beschreibung: "Durchgefuehrte Basisdiagnostik bei V.a. maennliches Mammakarzinom"
    datentyp: "CodeableConcept (mehrfach)"
    wertebereich: "Anamnese | Klinische Untersuchung | Mammographie | Ultraschall Brust | Ultraschall Lymphabfluss | Histologische Sicherung"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne"
  status: "mapped"
  anmerkung: "Diagnostik analog zu Frauen, bestehende Profile anwendbar."

referenzen:
  verwandte_empfehlungen: ["7.32"]
```

#### Empfehlung 7.32

```yaml
id: S3-5.0-7.32
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.32"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die weiterfuehrende Diagnostik, Ausbreitungsdiagnostik bei Brust- und Axillabe-
  funden sowie das Staging sollen entsprechend den Empfehlungen fuer Frauen er-
  folgen.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne"
  status: "mapped"
  anmerkung: "Staging analog zu Frauen."

referenzen:
  verwandte_empfehlungen: ["7.31"]
```

#### Empfehlung 7.33

```yaml
id: S3-5.0-7.33
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.33"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Operation hat die vollstaendige Tumorentfernung zum Ziel. Sie kann sowohl
  als lokale Tumorentfernung als auch als Mastektomie mit und ohne Erhalt der
  Brustwarze und Warzenhof durchgefuehrt werden.

datenobjekte:
  - name: "Operationsart maennliches MaCa"
    beschreibung: "Art der Operation beim maennlichen Mammakarzinom"
    datentyp: "CodeableConcept"
    wertebereich: "Lokale Tumorentfernung | Mastektomie mit NAK-Erhalt | Mastektomie ohne NAK-Erhalt"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "mapped"
  anmerkung: "Bestehende OP-Profile anwendbar."

referenzen:
  s3_literatur: ["1635"]
```

#### Empfehlung 7.34

```yaml
id: S3-5.0-7.34
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.34"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Operation der Axilla soll entsprechend den Empfehlungen bei Frauen erfol-
  gen.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_Operation"
  status: "mapped"
  anmerkung: "Axilla-OP analog zu Frauen."
```

#### Empfehlung 7.35

```yaml
id: S3-5.0-7.35
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.35"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die adjuvante Strahlentherapie der Brust und der Lymphabflusswege soll entspre-
  chend den Empfehlungen bei betroffenen Frauen erfolgen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "mapped"
  anmerkung: "Strahlentherapie analog zu Frauen."

referenzen:
  s3_literatur: ["1636"]
```

#### Empfehlung 7.36

```yaml
id: S3-5.0-7.36
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.36"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Indikation zur (neo-)adjuvanten Systemtherapie soll nach den gleichen Regeln
  wie bei Frauen erfolgen und die Tumorbiologie beruecksichtigen.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "mapped"
  anmerkung: "Systemtherapie analog zu Frauen."
```

#### Empfehlung 7.37

```yaml
id: S3-5.0-7.37
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.37"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patienten mit einem Hormonrezeptor-positiven Mammakarzinom sollen eine ad-
  juvante endokrine Therapie mit Tamoxifen in der Regel ueber 5 Jahre erhalten.
  Bei Kontraindikationen fuer die Therapie mit Tamoxifen sollte eine endokrine The-
  rapie mit Aromatasehemmstoff und Suppression der testikulaeren Funktion erfol-
  gen. Fuer eine Behandlung ueber 5 Jahre hinaus liegen bei maennlichen Patienten
  keine Daten vor.
  Bei hohem Risiko sollte zusaetzlich analog zum weiblichen Mammakarzinom die
  endokrin-basierte Therapie mit einem CDK4/6-Inhibitor erfolgen.

datenobjekte:
  - name: "Endokrine Therapie maennlich"
    beschreibung: "Art der endokrinen Therapie beim maennlichen Patienten"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "Tamoxifen | Aromatasehemmer + GnRH-Analogon | CDK4/6-Inhibitor"
    verpflichtung: "obligat"
    bedingung: "HR-positives MaCa beim Mann"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Geschlechtsspezifische Besonderheit (testikulaere Suppression) nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1640", "1641", "1642", "1643", "1034"]
```

#### Empfehlung 7.38

```yaml
id: S3-5.0-7.38
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.38"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Therapiekonzepte bei metastasierter Erkrankung von Maennern sollen nach
  den gleichen Regeln wie bei erkrankten Frauen erfolgen. Insbesondere soll die
  medikamentoese Systemtherapie entsprechend den Empfehlungen fuer erkrankte
  Frauen erfolgen.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "mapped"
  anmerkung: "Therapie analog zu Frauen."

referenzen:
  s3_literatur: ["1645"]
```

#### Empfehlung 7.39

```yaml
id: S3-5.0-7.39
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.39"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die Teilnahme an Studien/Registern sollte Maennern mit Brustkrebs angeboten
  und ermoeglicht werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Studienteilnahme als ResearchSubject modellierbar."
```

#### Empfehlung 7.40

```yaml
id: S3-5.0-7.40
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.40"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "2025"
text: >
  Eine genetische Beratung soll allen Maennern mit Brustkrebs empfohlen werden.

datenobjekte:
  - name: "Genetische Beratung empfohlen/durchgefuehrt"
    beschreibung: "Dokumentation der genetischen Beratung bei maennlichem Brustkrebs"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Genetische Beratung nicht als spezifisches Profil vorhanden."

referenzen:
  s3_literatur: ["1633", "1634"]
```

#### Empfehlung 7.41

```yaml
id: S3-5.0-7.41
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.41"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Ausgestaltung der Nachsorge einschliesslich der bildgebenden Diagnostik soll
  in Analogie zum Vorgehen bei betroffenen Frauen erfolgen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "mapped"
  anmerkung: "Nachsorge analog zu Frauen."
```

#### Empfehlung 7.42

```yaml
id: S3-5.0-7.42
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.42"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Qualifizierte und sachdienliche genderspezifische Informationen (Print und Inter-
  net) sollten dem Patienten von dem behandelnden Fachpersonal zur Verfuegung
  gestellt werden und der Zugang zum speziellen Angebot der Selbsthilfegruppen
  ermoeglicht werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Informationsempfehlung, kein FHIR-Datenobjekt."
```

#### Empfehlung 7.43

```yaml
id: S3-5.0-7.43
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.43"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "geprueft 2025"
text: >
  Fuer die medikamentoese knochengerichtete Therapie in der adjuvanten Situation
  existieren fuer Maenner keine Daten bezueglich der Verbesserung des krankheitsspe-
  zifischen oder Gesamtueberlebens.
  Eine medikamentoese knochengerichtete Therapie zur Vermeidung von osteoporo-
  setypischen Frakturen kann bei individuell erhoehtem Risiko empfohlen werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Knochengerichtete Therapie bei Maennern nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1644"]
```

#### Empfehlung 7.44

```yaml
id: S3-5.0-7.44
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.44"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Eine Genexpressionsanalyse kann maennlichen Patienten, analog zu den Empfeh-
  lungen bei erkrankten Frauen, zur Therapieentscheidung angeboten werden. Al-
  lerdings sollen die Patienten darueber aufgeklaert werden, dass die Testverfahren
  und die Grenzwerte bei Maennern nicht validiert sind.

datenobjekte:
  - name: "Genexpressionsanalyse maennlich"
    beschreibung: "Genexpressionsanalyse beim maennlichen Patienten mit Hinweis auf fehlende Validierung"
    datentyp: "CodeableConcept"
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Genexpressionstest beim Mann nicht separat modelliert."

referenzen:
  s3_literatur: ["1637", "1638"]
```

#### Empfehlung 7.45

```yaml
id: S3-5.0-7.45
kapitel: "7.3"
kapitel_titel: "Mammakarzinom des Mannes"
empfehlung_nr: "7.45"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die Behandlung von Patienten mit maennlichem Brustkrebs soll in interdisziplinae-
  ren zertifizierten Brustzentren erfolgen.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Strukturqualitaetsmerkmal."
```

---

## 7.4 Transgender und Brustkrebs

#### Empfehlung 7.46 (Statement)

```yaml
id: S3-5.0-7.46
kapitel: "7.4"
kapitel_titel: "Transgender und Brustkrebs"
empfehlung_nr: "7.46"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Transgender-Personen sind ueber Anzeichen und Symptome von Brustkrebs aufzu-
  klaeren. Das Angebot einer humangenetischen Beratung richtet sich entsprechend
  der Kriterien fuer die Cis-Population (cis-geschlechtlich sind alle Personen, deren
  Geschlechtsidentitaet mit dem nach der Geburt bestimmten Geschlecht ueberein-
  stimmt).

datenobjekte:
  - name: "Geschlechtsidentitaet"
    beschreibung: "Dokumentation der Geschlechtsidentitaet (Transgender-Status)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Transgender-Frau | Transgender-Mann | nicht-binaer | cis-geschlechtlich"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Patient"
  status: "partial"
  anmerkung: "Patient.gender bildet administratives Geschlecht ab. Geschlechtsidentitaet erfordert Extension (gender-identity). In FHIR R5 nativ unterstuetzt."

referenzen:
  s3_literatur: ["1646", "1647", "1648", "1649", "1650"]
```

#### Empfehlung 7.47

```yaml
id: S3-5.0-7.47
kapitel: "7.4"
kapitel_titel: "Transgender und Brustkrebs"
empfehlung_nr: "7.47"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Transgender-Frauen mit 5 oder mehr Jahren geschlechtsangleichender Hormon-
  therapie soll die Teilnahme an Brustkrebs-Frueherkennungsuntersuchungen ange-
  boten werden.

datenobjekte:
  - name: "Dauer geschlechtsangleichende Hormontherapie"
    beschreibung: "Dauer der geschlechtsangleichenden Hormontherapie in Jahren"
    datentyp: "Quantity (Jahre)"
    verpflichtung: "obligat"
    bedingung: "Transgender-Frauen"

  - name: "Frueherkennung angeboten"
    beschreibung: "Ob Brustkrebs-Frueherkennung angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Transgender-Frauen mit >= 5 Jahren Hormontherapie"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Transgender-spezifische Screening-Kriterien nicht modelliert. Hormontherapie-Dauer muesste als MedicationStatement abgebildet werden."

referenzen:
  s3_literatur: ["1651", "1652"]
```

#### Empfehlung 7.48

```yaml
id: S3-5.0-7.48
kapitel: "7.4"
kapitel_titel: "Transgender und Brustkrebs"
empfehlung_nr: "7.48"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "3"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei Transgender-Maennern soll vor der Mastektomie eine altersentsprechende
  Frueherkennung und die histologische Untersuchung des entfernten Brustgewebes
  durchgefuehrt werden.

datenobjekte:
  - name: "Frueherkennung vor Mastektomie"
    beschreibung: "Altersentsprechende Frueherkennung vor geschlechtsangleichender Mastektomie"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Transgender-Maenner vor Mastektomie"

  - name: "Histologie Mastektomie-Praeparat"
    beschreibung: "Histologische Untersuchung des entfernten Brustgewebes"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Operation modellierbar, aber Kontext geschlechtsangleichende Mastektomie nicht spezifisch abgebildet."

referenzen:
  s3_literatur: ["1648", "1649", "1647"]
```

---

## 7.5 Brustrekonstruktion

#### Empfehlung 7.49

```yaml
id: S3-5.0-7.49
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.49"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit Indikation zur prophylaktischen oder therapeutischen Mastekto-
  mie sollen zum fruehestmoeglichen Zeitpunkt in einem interdisziplinaeren Bera-
  tungsgespraech ueber alle Optionen der Brustrekonstruktion (Implantat-basierte
  Brustrekonstruktion, autologe Brustrekonstruktion) oder flache Brustwandrekon-
  struktion (aesthetic flat closure) aufgeklaert werden.

datenobjekte:
  - name: "Beratung Rekonstruktionsoptionen"
    beschreibung: "Dokumentation der Beratung ueber alle Rekonstruktionsoptionen"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Indikation zur Mastektomie"

  - name: "Rekonstruktionsoption"
    beschreibung: "Besprochene/gewaehlte Rekonstruktionsoption"
    datentyp: "CodeableConcept"
    wertebereich: "Implantat-basiert | autolog | hybrid | aesthetic flat closure | Verzicht"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Brustimplantat"
  status: "partial"
  anmerkung: "Senologie_Brustimplantat deckt Implantat-basierte Rekonstruktion ab. Autologe Rekonstruktion und aesthetic flat closure nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1653", "1654", "1655", "1656", "1657", "1658", "1659"]
```

#### Empfehlung 7.50

```yaml
id: S3-5.0-7.50
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.50"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "GRADE (sehr niedrig bis niedrig)"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Die Patientin soll darueber aufgeklaert werden, dass die Rekonstruktion der Brust,
  unabhaengig von der gewaehlten Methode, mit erhoehten operativen Komplikations-
  risiken im Vergleich zur alleinigen Mastektomie einhergeht.

datenobjekte:
  - name: "Aufklaerung Komplikationsrisiken"
    beschreibung: "Dokumentation der Aufklaerung ueber erhoehte Komplikationsrisiken bei Rekonstruktion"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Brustimplantat / Senologie_Operation"
  status: "partial"
  anmerkung: "Aufklaerungsdokumentation nicht als FHIR-Element modelliert."

referenzen:
  s3_literatur: ["1660", "1661", "1662", "1663", "1664", "1665", "1666", "1667", "1668", "1669", "1670", "1671"]
```

#### Empfehlung 7.51

```yaml
id: S3-5.0-7.51
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.51"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (sehr niedrig bis niedrig)"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Patientinnen sollten darueber aufgeklaert werden, dass die autologe Brustrekon-
  struktion der Implantat-basierten Brustrekonstruktion bezueglich der patientenbe-
  richteten Outcomeparameter (PROMs) Zufriedenheit mit der Rekonstruktion, Zu-
  friedenheit mit der Brust und koerperliches Wohlbefinden langfristig (>2 Jahre nach
  Brustrekonstruktion) ueberlegen zu sein scheint.

datenobjekte:
  - name: "Methode Brustrekonstruktion"
    beschreibung: "Gewaehlte Methode der Brustrekonstruktion"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Implantat-basiert | autolog (mikrochirurgisch) | hybrid"
    verpflichtung: "obligat"

  - name: "PROMs (BREAST-Q)"
    beschreibung: "Patientenberichtete Outcomeparameter nach Brustrekonstruktion"
    datentyp: "Quantity (Score)"
    wertebereich: "Zufriedenheit Rekonstruktion | Zufriedenheit Brust | koerperliches Wohlbefinden"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Brustimplantat"
  status: "partial"
  anmerkung: "Implantat-Rekonstruktion ueber Senologie_Brustimplantat. Autologe Rekonstruktion und PROMs (BREAST-Q) nicht modelliert."

referenzen:
  s3_literatur: ["1675", "1676", "1677", "1678", "1679", "1680", "1681", "1682", "1683", "1684", "1685", "1686", "1687"]
```

#### Empfehlung 7.52

```yaml
id: S3-5.0-7.52
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.52"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Der Wunsch der Patientin nach der Mastektomie eine flache Brustwandrekonstruk-
  tion (aesthetic flat closure) vornehmen zu lassen, soll im Rahmen der Beratung er-
  mittelt, respektiert und nach Aufklaerung ueber alle Behandlungsoptionen unter-
  stuetzt werden.

datenobjekte:
  - name: "Wunsch Aesthetic Flat Closure"
    beschreibung: "Patientinnenwunsch nach flacher Brustwandrekonstruktion"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Aesthetic flat closure als Operationsart nicht spezifisch kodiert."

referenzen:
  s3_literatur: ["1696", "1697", "1698", "1699", "1700", "1701", "1702", "1703"]
```

#### Empfehlung 7.53

```yaml
id: S3-5.0-7.53
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.53"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die flache Rekonstruktion der Brustwand soll im Sinne einer aesthetischen Rekon-
  struktion der Brustwand (aesthetic flat closure) erfolgen.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Operationstechnik-Detail, nicht spezifisch kodiert."
```

#### Empfehlung 7.54

```yaml
id: S3-5.0-7.54
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.54"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "GRADE (sehr niedrig bis niedrig)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Das operative Verfahren der Implantat-basierten Brustrekonstruktion (einzeitig
  versus zweizeitig ueber Expander-Implantat-Sequenz) soll unter Beruecksichtigung
  der onkologischen Situation, individueller Risikofaktoren und individueller Wuen-
  sche mit der Patientin besprochen werden.

datenobjekte:
  - name: "Implantat-Verfahren"
    beschreibung: "Gewaehltes Verfahren der Implantat-basierten Rekonstruktion"
    datentyp: "CodeableConcept"
    wertebereich: "einzeitig (Direktimplantat) | zweizeitig (Expander-Implantat-Sequenz)"
    verpflichtung: "obligat"
    bedingung: "Bei Implantat-basierter Rekonstruktion"

fhir_mapping:
  profil: "Senologie_Brustimplantat"
  status: "partial"
  anmerkung: "Senologie_Brustimplantat dokumentiert das Implantat, aber nicht das Verfahren (einzeitig/zweizeitig) als spezifisches Element."

referenzen:
  s3_literatur: ["1711", "1712", "1713", "1714", "1715", "1716", "1717", "1718", "1719", "1720", "1721", "1722", "1723", "1724", "1725", "1726", "1727", "1728", "1729", "1730", "1731", "1732", "1733", "1734", "1735"]
```

#### Empfehlung 7.55

```yaml
id: S3-5.0-7.55
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.55"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "GRADE (niedrig bis hoch)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Patientin soll darueber aufgeklaert werden, dass die Bestrahlung bei Implantat-
  basierter Brustrekonstruktion mit einer erhoehten kurz- und langfristigen Kompli-
  kationsrate (postoperative Komplikationen, Kapselfibrose, Implantatversagen) ver-
  bunden ist.

datenobjekte:
  - name: "Bestrahlung nach Implantat-Rekonstruktion"
    beschreibung: "Ob adjuvante Bestrahlung bei Implantat-basierter Rekonstruktion geplant/durchgefuehrt"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Implantat-basierte Rekonstruktion"

  - name: "Komplikationsaufklaerung Bestrahlung/Implantat"
    beschreibung: "Aufklaerung ueber erhoehtes Komplikationsrisiko"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Brustimplantat"
  status: "partial"
  anmerkung: "Zusammenspiel Bestrahlung und Implantat-Rekonstruktion nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1744", "1745", "1746", "1747", "1748", "1749", "1750", "1751", "1752", "1753", "1754", "1755", "1756", "1757", "1758", "1759", "1760", "1761", "1762", "1763", "1764", "1765", "1766", "1767", "1768", "1769", "1770", "1771", "1772", "1773", "1774", "1775", "1776", "1777", "1778", "1779", "1780", "1781", "1782", "1783"]
```

#### Empfehlung 7.56

```yaml
id: S3-5.0-7.56
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.56"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Bestrahlungsindikation kann bei Wunsch zur Brustrekonstruktion nach sorgfael-
  tiger Aufklaerung eine Implantat-basierte Brustrekonstruktion zunaechst als Platz-
  halter (u.a. zur Vermeidung bestrahlungsassoziierter Komplikationen auf eine
  spaetere autologe Brustrekonstruktion) oder zur dauerhaften Brustrekonstruktion
  erfolgen.

datenobjekte:
  - name: "Implantat als Platzhalter"
    beschreibung: "Implantat als Platzhalter fuer spaetere autologe Rekonstruktion"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bestrahlungsindikation"

fhir_mapping:
  profil: "Senologie_Brustimplantat"
  status: "partial"
  anmerkung: "Indikation Platzhalter vs. dauerhafte Rekonstruktion nicht spezifisch kodiert."
```

#### Empfehlung 7.57

```yaml
id: S3-5.0-7.57
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.57"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Insbesondere bei Komplikationen der Implantat-basierten Brustrekonstruktion
  nach Bestrahlung soll die autologe Brustrekonstruktion gegenueber einer erneuten
  Implantat-basierten Rekonstruktion bevorzugt werden oder auf Wunsch der Pati-
  entin auf eine erneute Rekonstruktion der Brust verzichtet werden.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_Brustimplantat / Senologie_Operation"
  status: "partial"
  anmerkung: "Konversion von Implantat auf autologe Rekonstruktion nicht spezifisch modelliert."
```

#### Empfehlung 7.58

```yaml
id: S3-5.0-7.58
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.58"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "GRADE (sehr niedrig)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Der Zeitpunkt der autologen Brustrekonstruktion (primaere Rekonstruktion, primaer
  verzoegerte Rekonstruktion ueber Expander-Implantat-Sequenz, sekundaere Rekon-
  struktion) soll unter Beruecksichtigung der onkologischen Situation und der indivi-
  duellen Wuensche mit der Patientin besprochen werden.

datenobjekte:
  - name: "Zeitpunkt autologe Rekonstruktion"
    beschreibung: "Gewaehlter Zeitpunkt der autologen Brustrekonstruktion"
    datentyp: "CodeableConcept"
    wertebereich: "primaer | primaer verzoegert (Expander-Sequenz) | sekundaer"
    verpflichtung: "obligat"
    bedingung: "Bei autologer Rekonstruktion"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Zeitpunkt der Rekonstruktion nicht als spezifisches Datenelement vorhanden."

referenzen:
  s3_literatur: ["508", "1788", "1789", "1790", "1791", "1792", "1793", "1794", "1795", "1796", "1797", "1798", "1799", "1800", "1801", "1802", "1803", "1804", "1674", "1805", "1806"]
```

#### Empfehlung 7.59

```yaml
id: S3-5.0-7.59
kapitel: "7.5"
kapitel_titel: "Brustrekonstruktion"
empfehlung_nr: "7.59"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "GRADE (sehr niedrig bis niedrig)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Patientin soll darueber aufgeklaert werden, dass die adjuvante Bestrahlung der
  autolog rekonstruierten Brust mit einem erhoehten Auftreten von Fettgewebsnek-
  rosen und verminderten Werten der patientenberichteten Outcomeparameter (Zu-
  friedenheit mit der rekonstruierten Brust, koerperliche Gesundheit, seelische Ge-
  sundheit) assoziiert ist.

datenobjekte:
  - name: "Bestrahlung nach autologer Rekonstruktion"
    beschreibung: "Ob adjuvante Bestrahlung nach autologer Rekonstruktion geplant/durchgefuehrt"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Autologe Rekonstruktion"

fhir_mapping:
  profil: "Senologie_Operation"
  status: "partial"
  anmerkung: "Zusammenspiel Bestrahlung und autologe Rekonstruktion nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1811", "1812", "1813", "1814", "1784", "1815", "1816", "1817", "1818", "1819", "1820", "1821", "1822", "1823", "1824", "1825", "1826"]
```

---

## 7.6 Spezielle Tumorentitaeten

### 7.6.1 Metaplastisches Mammakarzinom

#### Empfehlung 7.60

```yaml
id: S3-5.0-7.60
kapitel: "7.6.1"
kapitel_titel: "Metaplastisches Mammakarzinom"
empfehlung_nr: "7.60"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Beim high grade metaplastischen Mammakarzinom sollten adjuvante Therapie-
  massnahmen wie Radiotherapie und Chemotherapie entsprechend dem molekula-
  ren Subtyp durchgefuehrt werden.

datenobjekte:
  - name: "Histologischer Subtyp metaplastisch"
    beschreibung: "Grading und Subtyp des metaplastischen Mammakarzinoms"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      mapping_quelle: "leitlinie"
      validiert: false
    wertebereich: "Low grade (adenosquamoes, fibromatose-aehnlich) | High grade (Spindelzell-, mesenchymal diff., gemischt)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne"
  status: "partial"
  anmerkung: "Metaplastisches Karzinom als ICD-O-3-Morphologie kodierbar. Subtyp-Differenzierung (low/high grade) nicht als spezifisches ValueSet."

referenzen:
  s3_literatur: ["1832", "1833", "1834"]
```

#### Empfehlung 7.61

```yaml
id: S3-5.0-7.61
kapitel: "7.6.1"
kapitel_titel: "Metaplastisches Mammakarzinom"
empfehlung_nr: "7.61"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Beim high grade metaplastischen triple-negativen Mammakarzinom ist eine neo-
  adjuvante Chemotherapie mit hoeheren Raten der lokalen Progression als beim
  konventionellen TNBC assoziiert. Vor allem im klinischen Stadium I sollte eine pri-
  maere Operation durchgefuehrt werden.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure / Senologie_Operation"
  status: "partial"
  anmerkung: "Therapieentscheidung abhaengig von histologischem Subtyp, nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1838", "1839"]
```

### 7.6.2 Phylloidestumor

#### Empfehlung 7.62

```yaml
id: S3-5.0-7.62
kapitel: "7.6.2"
kapitel_titel: "Phylloidestumor"
empfehlung_nr: "7.62"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Borderline Phyllodestumore sollten operativ mit histopathologisch freiem Rand
  (R0 = no ink on tumor) und maligne Phyllodestumore sollten mit einem minima-
  len histopathologischen Sicherheitsabstand von > 2mm entfernt werden.

datenobjekte:
  - name: "Phylloidestumor-Klassifikation"
    beschreibung: "Klassifikation des Phylloidestumors"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      mapping_quelle: "leitlinie"
      validiert: false
    wertebereich: "benigne (9020/0) | borderline (9020/1) | maligne (9020/3)"
    verpflichtung: "obligat"

  - name: "Sicherheitsabstand"
    beschreibung: "Histopathologischer Sicherheitsabstand"
    datentyp: "Quantity (mm)"
    wertebereich: "R0 bei Borderline | > 2mm bei maligne"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne / Senologie_Operation"
  status: "partial"
  anmerkung: "Phylloidestumor als ICD-O-3-Morphologie kodierbar. Spezifische Sicherheitsabstand-Anforderungen nicht als Constraint modelliert."

referenzen:
  s3_literatur: ["1844", "1845", "1846", "1847", "1848", "1849", "1850"]
```

#### Empfehlung 7.63

```yaml
id: S3-5.0-7.63
kapitel: "7.6.2"
kapitel_titel: "Phylloidestumor"
empfehlung_nr: "7.63"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Beim malignen Phylloidestumor sollte eine adjuvante Strahlentherapie zur Sen-
  kung der Lokalrezidivrate vor allem in Faellen mit Hochrisikocharakteristika (z.B.
  Tumorgroesse >5 cm, R1 etc.) durchgefuehrt werden.

datenobjekte:
  - name: "Hochrisikocharakteristika Phylloidestumor"
    beschreibung: "Vorliegen von Hochrisikofaktoren (Groesse >5cm, R1)"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Maligner Phylloidestumor"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Strahlentherapie-Indikation bei Phylloidestumor nicht spezifisch modelliert."

referenzen:
  s3_literatur: ["1851", "1852", "1853", "1854"]
```

#### Empfehlung 7.64 (Statement)

```yaml
id: S3-5.0-7.64
kapitel: "7.6.2"
kapitel_titel: "Phylloidestumor"
empfehlung_nr: "7.64"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit malignem Phylloidestumoren sind die Effekte der adjuvanten
  Chemotherapie unklar.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Informatives Statement."

referenzen:
  s3_literatur: ["1842"]
```

### 7.6.3 Angiosarkom

#### Empfehlung 7.65

```yaml
id: S3-5.0-7.65
kapitel: "7.6.3"
kapitel_titel: "Angiosarkom"
empfehlung_nr: "7.65"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  aus S3-Leitlinie Adulte Weichgewebesarkome, Version 1.1, Juni 2022, AWMF-Re-
  gisternummer: 032/044OL.
  Die Diagnostik und Therapie eines primaeren Sarkoms der Brust soll durch bzw. in
  Abstimmung mit einem zertifizierten Sarkomzentrum oder assoziierten Koopera-
  tionspartner erfolgen.

datenobjekte:
  - name: "Sarkomzentrum-Anbindung"
    beschreibung: "Behandlung in/mit zertifiziertem Sarkomzentrum"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Primaeres Sarkom der Brust"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Strukturqualitaetsmerkmal. Verweis auf S3-LL Weichgewebesarkome."

referenzen:
  querschnittsleitlinien: ["S3-Leitlinie Adulte Weichgewebesarkome, AWMF 032/044OL"]
```

#### Empfehlung 7.66

```yaml
id: S3-5.0-7.66
kapitel: "7.6.3"
kapitel_titel: "Angiosarkom"
empfehlung_nr: "7.66"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Das postradiogene Angiosarkom sollte, wenn es nach Durchfuehrung des Stagings
  solitaer nachgewiesen ist mit einem pathologischen Sicherheitsabstand von 1-2 cm
  R0 reseziert werden. Dafuer sollte ein weiter Sicherheitsabstand von 3-4 cm ge-
  plant werden.

datenobjekte:
  - name: "Angiosarkom-Typ"
    beschreibung: "Typ des Angiosarkoms (primaer vs. postradiogen)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      code: "9120/3"
      display: "Angiosarkom"
      mapping_quelle: "leitlinie"
      validiert: false
    wertebereich: "primaer | postradiogen (Strahlentherapie-assoziiert)"
    verpflichtung: "obligat"

  - name: "Sicherheitsabstand Angiosarkom"
    beschreibung: "Geplanter und erreichter Sicherheitsabstand"
    datentyp: "Quantity (cm)"
    wertebereich: "pathologisch 1-2 cm R0, geplant 3-4 cm"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Diagnose_Maligne / Senologie_Operation"
  status: "partial"
  anmerkung: "Angiosarkom als ICD-O-3 kodierbar. Spezifische Sicherheitsabstand-Anforderungen nicht modelliert."

referenzen:
  s3_literatur: ["1880", "1881", "1882", "1883", "1884"]
```

#### Empfehlung 7.67

```yaml
id: S3-5.0-7.67
kapitel: "7.6.3"
kapitel_titel: "Angiosarkom"
empfehlung_nr: "7.67"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine (neo)-adjuvante Radiotherapie beim postradiogenen Angiosarkom kann in
  Abhaengigkeit zum Zeitintervall zur Vor-Radiotherapie und eingestrahlten Dosis
  zur Senkung der Lokalrezidivrate eingesetzt werden.

datenobjekte: []

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Strahlentherapie bei postradiogenem Angiosarkom - spezielle Situation nicht modelliert."

referenzen:
  s3_literatur: ["1886", "1887", "1888"]
```

#### Empfehlung 7.68

```yaml
id: S3-5.0-7.68
kapitel: "7.6.3"
kapitel_titel: "Angiosarkom"
empfehlung_nr: "7.68"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine (neo)adjuvante Chemotherapie kann zur Senkung der (Lokal)rezidivrate bzw.
  fuer das Erreichen der Operabilitaet, als auch wahrscheinlichen Verbesserung der
  Prognose vor allem bei groesseren postradiogenen Angiosarkomen nach einem
  Mammakarzinom durchgefuehrt werden.

datenobjekte: []

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Chemotherapie modellierbar, Indikation Angiosarkom nicht spezifisch."

referenzen:
  s3_literatur: ["1871", "1878", "1889", "1890"]
```

### 7.6.4 Brustimplantat-assoziiertes anaplastisches grosszelliges Lymphom (BIA-ALCL)

#### Empfehlung 7.69

```yaml
id: S3-5.0-7.69
kapitel: "7.6.4"
kapitel_titel: "Brustimplantat-assoziiertes anaplastisches grosszelliges Lymphom (BIA-ALCL)"
empfehlung_nr: "7.69"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit Brustimplantat-assoziiertem anaplastischem grosszelligem
  Lymphom (BIA-ALCL) sollte die Behandlung multidisziplinaer besprochen und ge-
  plant werden.

datenobjekte:
  - name: "BIA-ALCL Diagnose"
    beschreibung: "Diagnose eines Brustimplantat-assoziierten anaplastischen grosszelligen Lymphoms"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      code: "9714/3"
      display: "Anaplastic large cell lymphoma, ALK negative"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

  - name: "Implantat-Typ"
    beschreibung: "Typ des assoziierten Brustimplantats (strukturierte/texturierte Oberflaeche)"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

  - name: "CD30-Status"
    beschreibung: "Immunhistochemischer CD30-Status der Tumorzellen"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "CD30-positiv | CD30-negativ"
    verpflichtung: "obligat"

  - name: "ALK-Status"
    beschreibung: "ALK-Status der Tumorzellen (typisch ALK-negativ bei BIA-ALCL)"
    datentyp: "CodeableConcept"
    wertebereich: "ALK-negativ | ALK-positiv"
    verpflichtung: "obligat"

  - name: "BfArM-Meldung"
    beschreibung: "Meldung an das Bundesinstitut fuer Arzneimittel und Medizinprodukte"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Brustimplantat"
  status: "partial"
  anmerkung: >
    BIA-ALCL ist eine direkte Komplikation von Brustimplantaten. Senologie_Brustimplantat
    dokumentiert das Implantat, aber BIA-ALCL als spezifische Diagnose (T-Zell-Lymphom)
    erfordert ein eigenes Condition-Profil. Die BfArM-Meldepflicht ist nicht modelliert.
    CD30/ALK-Diagnostik nicht im Senologie-Profil vorhanden.

referenzen:
  s3_literatur: ["1891"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 7

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| **7.1 Fertilitaetserhalt** | | | |
| 7.1-7.3 | Fertilitaetsberatung/-erhalt | **gap** | Neues Profil/Extension fuer Fertilitaetsberatung und Kryokonservierung |
| 7.4-7.9 | Schwangerschaft nach MaCa | **gap** | Schwangerschaftsbezogene Beratungsdokumentation |
| 7.10-7.16 | MaCa in Schwangerschaft | partial | Schwangerschaftsstatus als Kontext fuer Therapie-Einschraenkungen |
| **7.2 Aeltere Patientin** | | | |
| 7.17 | Therapieentscheidung Alter | **gap** | Geriatrie-Assessment-Daten fehlen |
| 7.18-7.22 | Geriatrisches Assessment/CGA | **gap** | G8-Score und CGA als Observation/QuestionnaireResponse |
| 7.23-7.25 | Lokale Therapie Alter | mapped/partial | OP-Profile anwendbar, primaer endokrine Therapie als Alternative |
| 7.26 | Endokrine Therapie Alter | partial | Therapieverzicht-Dokumentation |
| 7.27-7.29 | Chemotherapie Alter | partial | Kardiotoxizitaetsrisiko-Bewertung |
| **7.3 Mammakarzinom des Mannes** | | | |
| 7.30-7.36 | Diagnostik/OP/Bestrahlung Mann | mapped | Bestehende Profile anwendbar (geschlechtsunabhaengig) |
| 7.37 | Endokrine Therapie Mann | partial | Testikulaere Suppression nicht spezifisch modelliert |
| 7.38-7.45 | Systemtherapie/Nachsorge Mann | mapped/gap | Genexpressionsanalyse/genetische Beratung bei Maennern |
| **7.4 Transgender** | | | |
| 7.46-7.48 | Transgender und Brustkrebs | **gap**/partial | Geschlechtsidentitaet-Extension, transgender-spezifische Screening-Kriterien |
| **7.5 Brustrekonstruktion** | | | |
| 7.49 | Beratung Rekonstruktionsoptionen | partial | Autologe Rekonstruktion und aesthetic flat closure ergaenzen |
| 7.50-7.51 | Rekonstruktion vs. Mastektomie | partial | PROMs (BREAST-Q) als Observation |
| 7.52-7.53 | Aesthetic Flat Closure | partial | Als OPS/SNOMED-Kode ergaenzen |
| 7.54 | Implantat einzeitig/zweizeitig | partial | Verfahren-Element in Senologie_Brustimplantat |
| 7.55-7.57 | Bestrahlung und Implantat | partial | Zusammenspiel Bestrahlung/Rekonstruktion modellieren |
| 7.58-7.59 | Zeitpunkt/Bestrahlung autolog | partial | Zeitpunkt-Element fuer Rekonstruktion |
| **7.6 Spezielle Tumorentitaeten** | | | |
| 7.60-7.61 | Metaplastisches MaCa | partial | Subtyp-Differenzierung als ValueSet |
| 7.62-7.64 | Phylloidestumor | partial | Phylloidestumor-Klassifikation und Sicherheitsabstand |
| 7.65-7.68 | Angiosarkom | partial/**gap** | Angiosarkom-Typ (primaer/postradiogen), Sarkomzentrum |
| 7.69 | BIA-ALCL | partial | CD30/ALK-Diagnostik, BfArM-Meldepflicht, eigene Condition |

### Priorisierung fuer FHIR-Profilierung

**Hohe Prioritaet (direkte Profilrelevanz):**
1. **Senologie_Brustimplantat**: Erweiterung um Verfahren (einzeitig/zweizeitig), Indikation (Platzhalter/dauerhaft), BIA-ALCL als Komplikation
2. **Geriatrisches Assessment (G8/CGA)**: Neues Observation-Profil - klinisch hochrelevant fuer Therapieentscheidung
3. **Geschlechtsidentitaet-Extension**: Patient-Extension fuer Transgender-Versorgung

**Mittlere Prioritaet:**
4. Fertilitaetserhalt/Kryokonservierung als Procedure
5. PROMs (BREAST-Q) als standardisierte Observation
6. Schwangerschaftsstatus als Kontext fuer Therapie-Einschraenkungen
7. Spezielle Tumorentitaeten-ValueSet (Metaplastisch, Phylloidestumor, Angiosarkom)

**Niedrige Prioritaet (ueberwiegend Beratungs-/Informationsempfehlungen):**
8. Beratungsdokumentation (Fertilitaet, Schwangerschaft, Rekonstruktion)
9. BfArM-Meldepflicht BIA-ALCL
10. Studienteilnahme als ResearchSubject
