# S3-Leitlinie v5.0 - Kapitel 4.6: Adjuvante Strahlentherapie des Mammakarzinoms

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 145-170
> Kapitelstruktur: 4.6 Allgemein | 4.6.1 Fraktionierung | 4.6.2 Teilbrustbestrahlung und IORT | 4.6.3 Postmastektomie-Radiotherapie (PMRT) | 4.6.4 PMRT nach PST | 4.6.5 Regionale Lymphknoten | 4.6.6 Axillaere Lymphknoten | 4.6.7 Dosis bei regionaler LK-Bestrahlung | 4.6.8 Lokal fortgeschritten | 4.6.9 Therapiesequenz

---

## 4.6 Adjuvante Strahlentherapie - Allgemein

### Empfehlung 4.94

```yaml
id: S3-5.0-4.94
kapitel: "4.6"
kapitel_titel: "Adjuvante Strahlentherapie des Mammakarzinoms"
empfehlung_nr: "4.94"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Nach brusterhaltender Operation wegen eines invasiven Karzinoms soll eine Bestrahlung
  der betroffenen Brust durchgefuehrt werden.
  Bei Patientinnen mit eindeutig begrenzter Lebenserwartung (<10 Jahre) und einem kleinen
  (pT1), nodal-negativen (pN0), Hormon-rezeptorpositiven HER2-negativen Tumor mit
  endokriner adjuvanter Therapie, freie Schnittraender vorausgesetzt (alle Kriterien
  sollen erfuellt sein), kann unter Inkaufnahme eines erhoehten Lokalrezidivrisikos nach
  individueller Beratung auf die Strahlentherapie verzichtet werden.

datenobjekte:
  - name: "Operationstyp"
    beschreibung: "Art der Operation (brusterhaltend vs. Mastektomie)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "392021009"
      display: "Lumpectomy of breast (procedure)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Indikation Bestrahlung Brust"
    beschreibung: "Indikation zur adjuvanten Ganzbrustbestrahlung nach BET"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Nach brusterhaltender Operation bei invasivem Karzinom"

  - name: "Bestrahlungszielgebiet"
    beschreibung: "Zielgebiet der Bestrahlung (gesamte Brust)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "76752008"
      display: "Breast structure (body structure)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Verzicht auf Bestrahlung"
    beschreibung: "Dokumentation eines begruendeten Verzichts auf Bestrahlung"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Nur bei Erfuellung aller Low-risk-Kriterien: pT1, pN0, HR+, HER2-, endokrine Therapie, freie Schnittraender, Lebenserwartung <10 Jahre"

  - name: "Therapieintention"
    beschreibung: "Intention der Strahlentherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "373846009"
      display: "Adjuvant - intent (qualifier value)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "Procedure.code + ex-senologie-radiation-target + ex-senologie-treatment-intention"
  status: "partial"
  anmerkung: >
    Grundlegende Strahlentherapie-Prozedur ist im Profil abgebildet.
    Zielgebiet und Intention als Extensions vorhanden. Der dokumentierte
    Verzicht auf Bestrahlung (mit Begruendung) ist nicht modelliert.
    Kriterien fuer den Verzicht (Low-risk-Konstellation) erfordern
    Querverweis auf Pathologie-Befund und Staging.

referenzen:
  s3_literatur: ["691", "692", "693", "694", "695", "696", "697", "698", "699", "700", "701"]
  verwandte_empfehlungen: ["4.95", "4.98", "4.103", "4.109"]
```

---

## 4.6.1 Fraktionierung

### Empfehlung 4.95

```yaml
id: S3-5.0-4.95
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.95"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Radiotherapie der Brust soll in moderater Hypofraktionierung (Gesamtdosis
  ca. 40 Gy in ca. 15-16 Fraktionen in ca. 3 Wochen) erfolgen.

datenobjekte:
  - name: "Fraktionierungsschema"
    beschreibung: "Art der Fraktionierung (moderat hypofraktioniert vs. konventionell vs. ultra-hypofraktioniert)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "moderat hypofraktioniert | konventionell | ultra-hypofraktioniert"
    verpflichtung: "obligat"

  - name: "Gesamtdosis"
    beschreibung: "Geplante Gesamtdosis in Gray"
    datentyp: "Quantity (Gy)"
    terminologie:
      system: "UCUM"
      code: "Gy"
      display: "Gray"
      mapping_quelle: "standard"
    wertebereich: "ca. 40 Gy (moderat hypofraktioniert)"
    verpflichtung: "obligat"

  - name: "Anzahl Fraktionen"
    beschreibung: "Gesamtzahl der Bestrahlungssitzungen"
    datentyp: "integer"
    wertebereich: "ca. 15-16 (moderat hypofraktioniert)"
    verpflichtung: "obligat"

  - name: "Behandlungsdauer"
    beschreibung: "Gesamtdauer der Strahlentherapie"
    datentyp: "Quantity (Wochen)"
    wertebereich: "ca. 3 Wochen (moderat hypofraktioniert)"
    verpflichtung: "empfohlen"

  - name: "Einzeldosis pro Fraktion"
    beschreibung: "Dosis pro Einzelbestrahlung"
    datentyp: "Quantity (Gy)"
    terminologie:
      system: "UCUM"
      code: "Gy"
      mapping_quelle: "standard"
    wertebereich: "ca. 2.5-2.67 Gy (moderat hypofraktioniert)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-total-dose-gy + ex-senologie-session-count"
  status: "partial"
  anmerkung: >
    Gesamtdosis und Anzahl Sitzungen sind als Extensions vorhanden.
    Fraktionierungsschema (moderat/konventionell/ultra), Einzeldosis
    und Behandlungsdauer fehlen als eigene Elemente. Eine Extension
    oder ein CodeSystem fuer Fraktionierungsschemata waere sinnvoll.

referenzen:
  s3_literatur: ["361", "719", "720", "721", "722", "723", "724", "725", "726", "727", "728", "729"]
  verwandte_empfehlungen: ["4.94", "4.96", "4.97"]
```

### Empfehlung 4.96

```yaml
id: S3-5.0-4.96
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.96"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine ultra-hypofraktionierte Radiotherapie mit 26 Gy in 5 Fraktionen ueber eine
  Woche kann nach Aufklaerung ueber die fehlenden Langzeitdaten und das moeglicherweise
  erhoehte Spaettoxizitaetsrisiko zum Einsatz kommen.

datenobjekte:
  - name: "Fraktionierungsschema"
    beschreibung: "Ultra-Hypofraktionierung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Gesamtdosis"
    beschreibung: "Gesamtdosis bei Ultra-Hypofraktionierung"
    datentyp: "Quantity (Gy)"
    wertebereich: "26 Gy"
    verpflichtung: "obligat"

  - name: "Anzahl Fraktionen"
    beschreibung: "5 Fraktionen"
    datentyp: "integer"
    wertebereich: "5"
    verpflichtung: "obligat"

  - name: "Aufklaerung dokumentiert"
    beschreibung: "Dokumentation der Aufklaerung ueber fehlende Langzeitdaten und Spaettoxizitaetsrisiko"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Wahl der Ultra-Hypofraktionierung"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-total-dose-gy + ex-senologie-session-count"
  status: "partial"
  anmerkung: >
    Dosis und Fraktionen abbildbar. Fraktionierungsschema-Typ und
    Aufklaerungsdokumentation fehlen.

referenzen:
  s3_literatur: ["361", "719", "720", "721", "722", "735", "736", "737", "738", "739", "740"]
  verwandte_empfehlungen: ["4.95", "4.107"]
```

### Empfehlung 4.97

```yaml
id: S3-5.0-4.97
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.97"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei linksseitigem Tumorsitz sollte die Bestrahlung zur Herzschonung in tiefer
  Einatemtechnik "Deep Inspiration Breath Hold" (DIBHT) oder atemgetrigger "Gating"
  erfolgen.

datenobjekte:
  - name: "Lateralitaet Tumor"
    beschreibung: "Seitenlokalisation des Tumors (links/rechts)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "80248007"
      display: "Left breast structure (body structure)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Atemtechnik bei Bestrahlung"
    beschreibung: "Verwendete Technik zur Herzschonung (DIBHT/Gating)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "DIBHT (Deep Inspiration Breath Hold) | Gating | keine"
    verpflichtung: "empfohlen"
    bedingung: "Bei linksseitigem Tumorsitz"

  - name: "Bestrahlungstechnik"
    beschreibung: "Radiotherapie-Technik (3D-konformal, IMRT, VMAT)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "3D-Konformationsbestrahlung | IMRT | VMAT"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Atemtechnik (DIBHT/Gating) und Bestrahlungstechnik (IMRT/VMAT/3D) sind
    nicht als Extensions im Strahlentherapie-Profil vorhanden. Fuer die
    Herzschonung bei linksseitiger Bestrahlung waeren Extensions fuer
    Atemtechnik und ggf. Dosisparameter am Herzen relevant.

referenzen:
  s3_literatur: ["741", "742", "743", "744", "745", "746", "747", "748"]
  verwandte_empfehlungen: ["4.94", "4.95", "4.118"]
```

---

## 4.6.1 (Fortsetzung) Boost-Bestrahlung

### Empfehlung 4.98

```yaml
id: S3-5.0-4.98
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.98"
typ: "Evidenzbasiert"
empfehlungsgrad: "A/B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Eine lokale Dosisaufsaettigung (Boost-Bestrahlung) des Tumorbettes senkt die lokale
  Rezidivrate in der Brust, ohne dadurch einen signifikanten Ueberlebensvorteil zu
  bewirken.
  Die Boostbestrahlung
  - soll daher bei allen <= 50 Jahre alten Patientinnen und
  - sollte bei > 50 Jahre alten Patientinnen nur bei erhoehtem lokalen Rueckfallrisiko
    erfolgen (G3, HER2-positiv, tripelnegativ, > T1).

datenobjekte:
  - name: "Boost-Bestrahlung durchgefuehrt"
    beschreibung: "Ob eine Boost-Bestrahlung (Dosisaufsaettigung) des Tumorbettes erfolgte"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Boost-Indikation"
    beschreibung: "Indikation fuer die Boost-Bestrahlung (altersabhaengig und risikoadaptiert)"
    datentyp: "CodeableConcept"
    wertebereich: "Alter <= 50 (obligat) | Alter > 50 mit Risikofaktoren (G3, HER2+, TN, >T1)"
    verpflichtung: "obligat"
    bedingung: "Bei Boost-Bestrahlung"

  - name: "Boost-Dosis"
    beschreibung: "Gesamtdosis des Boost in Gray"
    datentyp: "Quantity (Gy)"
    terminologie:
      system: "UCUM"
      code: "Gy"
      mapping_quelle: "standard"
    wertebereich: "typisch 10-16 Gy"
    verpflichtung: "obligat"
    bedingung: "Bei Boost-Bestrahlung"

  - name: "Alter der Patientin"
    beschreibung: "Alter bei Therapie (entscheidungsrelevant fuer Boost-Indikation)"
    datentyp: "Quantity (Jahre)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-boost-applied"
  status: "partial"
  anmerkung: >
    Boost ja/nein ist als Extension vorhanden. Boost-Dosis, Boost-Technik
    und die Indikationskriterien fehlen als eigene Elemente. Die Boost-Dosis
    sollte separat von der Gesamtdosis der Ganzbrustbestrahlung erfassbar sein.

referenzen:
  s3_literatur: ["755", "756", "757", "758", "759"]
  verwandte_empfehlungen: ["4.94", "4.99", "4.100", "4.101", "4.102"]
```

### Empfehlung 4.99

```yaml
id: S3-5.0-4.99
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.99"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Boostbestrahlung sollte als perkutaner Boost (sequentiell oder simultan-integriert)
  verabreicht werden.

datenobjekte:
  - name: "Boost-Technik"
    beschreibung: "Art der Boost-Applikation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "sequentieller perkutaner Boost | simultan-integrierter Boost (SIB) | intraoperativer Boost | Brachytherapie-Boost"
    verpflichtung: "empfohlen"
    bedingung: "Bei Boost-Bestrahlung"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Boost-Technik (sequentiell vs. SIB vs. IORT vs. Brachytherapie) ist nicht
    als Extension modelliert. Waere als CodeableConcept-Extension sinnvoll.

referenzen:
  s3_literatur: ["755", "760", "761", "762", "763", "764", "765", "766", "767", "768"]
  verwandte_empfehlungen: ["4.98", "4.100", "4.101"]
```

### Empfehlung 4.100

```yaml
id: S3-5.0-4.100
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.100"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Wenn bereits praeoperativ aufgrund der vorliegenden Informationen eine gesicherte
  Boost-Indikation besteht, kann eine intraoperative Boost-Bestrahlung erfolgen.

datenobjekte:
  - name: "Intraoperativer Boost"
    beschreibung: "Ob ein intraoperativer Boost (IOERT/IORT) durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Bei praeoperativ gesicherter Boost-Indikation"

  - name: "Boost-Zeitpunkt"
    beschreibung: "Zeitpunkt der Boost-Applikation (intraoperativ vs. postoperativ)"
    datentyp: "CodeableConcept"
    wertebereich: "intraoperativ | postoperativ"
    verpflichtung: "obligat"
    bedingung: "Bei Boost-Bestrahlung"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Intraoperative Bestrahlung als Boost-Variante ist nicht spezifisch modelliert.
    Erfordert Unterscheidung des Boost-Zeitpunkts (intra- vs. postoperativ).

referenzen:
  s3_literatur: ["769", "770", "771", "772", "773", "774", "775", "768"]
  verwandte_empfehlungen: ["4.98", "4.99", "4.101"]
```

### Empfehlung 4.101

```yaml
id: S3-5.0-4.101
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.101"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Boost-Bestrahlung kann in individuellen Faellen (z.B. tiefliegendes Tumorbett)
  als interstitielle Brachytherapie verabreicht werden.

datenobjekte:
  - name: "Brachytherapie-Boost"
    beschreibung: "Boost als interstitielle Brachytherapie"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Individuelle Faelle, z.B. tiefliegendes Tumorbett"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "Brachytherapie als Boost-Variante nicht modelliert."

referenzen:
  s3_literatur: ["757", "755", "760", "761", "762", "763", "764", "765", "766", "767", "776", "777"]
  verwandte_empfehlungen: ["4.98", "4.99", "4.100"]
```

### Empfehlung 4.102

```yaml
id: S3-5.0-4.102
kapitel: "4.6.1"
kapitel_titel: "Fraktionierung"
empfehlung_nr: "4.102"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei geplanter Boostbestrahlung sollte eine intraoperative Clipmarkierung des
  Tumorbetts erfolgen.

datenobjekte:
  - name: "Clipmarkierung Tumorbett"
    beschreibung: "Intraoperative Markierung des Tumorbetts mit Clips"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei geplanter Boost-Bestrahlung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Clipmarkierung ist eine operative Massnahme (Procedure) und gehoert
    zur Operationsdokumentation, nicht zur Strahlentherapie. Kein
    bestehendes Profil bildet dies ab.

referenzen:
  s3_literatur: ["778", "779", "780", "781", "782", "783", "784"]
  verwandte_empfehlungen: ["4.98", "4.108"]
```

---

## 4.6.2 Teilbrustbestrahlung und IORT

### Empfehlung 4.103

```yaml
id: S3-5.0-4.103
kapitel: "4.6.2"
kapitel_titel: "Teilbrustbestrahlung und IORT"
empfehlung_nr: "4.103"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine alleinige Teilbrustbestrahlung (als Alternative zur Nachbestrahlung der ganzen
  Brust) kann bei Patientinnen mit niedrigem Rezidivrisiko (Alter >=50 Jahre,
  Tumorgroesse < 3 cm, pN0, ER/PgR pos., HER2 neg., G1-2, R0, nicht-lobulaere
  Histologie - alle Kriterien sollten erfuellt werden) durchgefuehrt werden.

datenobjekte:
  - name: "Bestrahlungsart"
    beschreibung: "Art der Bestrahlung (Ganzbrustbestrahlung vs. Teilbrustbestrahlung)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Ganzbrustbestrahlung (WBI) | Teilbrustbestrahlung (PBI) | IORT"
    verpflichtung: "obligat"

  - name: "Eignungskriterien Teilbrustbestrahlung"
    beschreibung: "Dokumentation der Eignungskriterien (Alter >=50, <3cm, pN0, HR+, HER2-, G1-2, R0, nicht-lobulaer)"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Teilbrustbestrahlung"

  - name: "PBI-Technik"
    beschreibung: "Technik der Teilbrustbestrahlung"
    datentyp: "CodeableConcept"
    wertebereich: "perkutane RT (moderat hypofraktioniert) | perkutane RT (ultra-hypofraktioniert) | Multikatheter-Brachytherapie | IORT"
    verpflichtung: "obligat"
    bedingung: "Bei Teilbrustbestrahlung"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: >
    Zielgebiet-Extension kann Ganz- vs. Teilbrustbestrahlung unterscheiden.
    PBI-Technik und Eignungskriterien sind nicht modelliert. Die
    Differenzierung der PBI-Verfahren waere als Extension sinnvoll.

referenzen:
  s3_literatur: ["790", "791", "792", "793", "371", "794", "795", "364", "363", "796", "797", "798", "799", "800", "801", "802", "803", "804", "805", "719", "806"]
  verwandte_empfehlungen: ["4.94", "4.104", "4.105", "4.106"]
```

### Empfehlung 4.104

```yaml
id: S3-5.0-4.104
kapitel: "4.6.2"
kapitel_titel: "Teilbrustbestrahlung und IORT"
empfehlung_nr: "4.104"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Teilbrustbestrahlung soll als perkutane Radiotherapie (moderat hypofraktionierte
  Radiotherapie mit 40 Gy in 15 Fraktionen ueber 3 Wochen oder ultra-hypofraktionierte
  Radiotherapie mit 30 Gy in 5 Fraktionen ueber 1,5 Wochen) oder als interstitielle
  Multikatheter-Brachytherapie durchgefuehrt werden.

datenobjekte:
  - name: "PBI-Fraktionierung"
    beschreibung: "Fraktionierungsschema der Teilbrustbestrahlung"
    datentyp: "CodeableConcept"
    wertebereich: "moderat hypofraktioniert (40 Gy / 15 Fraktionen / 3 Wochen) | ultra-hypofraktioniert (30 Gy / 5 Fraktionen / 1.5 Wochen) | Multikatheter-Brachytherapie"
    verpflichtung: "obligat"
    bedingung: "Bei Teilbrustbestrahlung"

  - name: "PBI-Gesamtdosis"
    beschreibung: "Gesamtdosis der Teilbrustbestrahlung"
    datentyp: "Quantity (Gy)"
    wertebereich: "40 Gy (moderat) | 30 Gy (ultra) | variabel (Brachytherapie)"
    verpflichtung: "obligat"

  - name: "PBI-Fraktionszahl"
    beschreibung: "Anzahl der Fraktionen"
    datentyp: "integer"
    wertebereich: "15 (moderat) | 5 (ultra)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-total-dose-gy + ex-senologie-session-count"
  status: "partial"
  anmerkung: "Dosis und Fraktionen abbildbar. PBI-spezifische Fraktionierungsschemata fehlen."

referenzen:
  s3_literatur: ["790", "791", "792", "793", "371", "794", "795", "364", "363", "796", "797", "798", "799", "800", "801", "802", "803", "804", "805", "719", "806", "807", "808", "809", "810", "811", "812", "813", "738"]
  verwandte_empfehlungen: ["4.103", "4.105", "4.107"]
```

### Empfehlung 4.105

```yaml
id: S3-5.0-4.105
kapitel: "4.6.2"
kapitel_titel: "Teilbrustbestrahlung und IORT"
empfehlung_nr: "4.105"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine alleinige intraoperative Teilbrustbestrahlung mit niedrigenergetischen
  Roentgenstrahlen oder Elektronen kann nach Aufklaerung ueber das erhoehte
  Lokalrezidivrisiko eingesetzt werden, wenn die intraoperative Radiotherapie
  im Rahmen des ersten operativen Eingriffs erfolgt.

datenobjekte:
  - name: "IORT als alleinige Teilbrustbestrahlung"
    beschreibung: "Alleinige intraoperative Radiotherapie (IORT) als Teilbrustbestrahlung"
    datentyp: "boolean"
    verpflichtung: "optional"

  - name: "IORT-Strahlenart"
    beschreibung: "Art der intraoperativen Bestrahlung"
    datentyp: "CodeableConcept"
    wertebereich: "niedrigenergetische Roentgenstrahlen (50 kV) | Elektronen"
    verpflichtung: "obligat"
    bedingung: "Bei IORT"

  - name: "Aufklaerung erhoehtes Lokalrezidivrisiko"
    beschreibung: "Dokumentation der Aufklaerung ueber erhoehtes Rezidivrisiko bei alleiniger IORT"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei alleiniger IORT"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "IORT als spezifische Bestrahlungsmodalitaet und Strahlenart nicht modelliert."

referenzen:
  s3_literatur: ["800", "801", "802", "803", "814", "815", "816", "804", "805", "719", "806"]
  verwandte_empfehlungen: ["4.103", "4.104", "4.106"]
```

### Empfehlung 4.106

```yaml
id: S3-5.0-4.106
kapitel: "4.6.2"
kapitel_titel: "Teilbrustbestrahlung und IORT"
empfehlung_nr: "4.106"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1, 2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine stark akzelerierte, hochdosierte perkutane Radiotherapie (2x tgl. 3,85 Gy bis
  38,5 Gy) oder eine Brachytherapie mit Einzellumenkathetern sollte bei der
  Teilbrustbestrahlung nicht zum Einsatz kommen.

datenobjekte:
  - name: "Kontraindizierte PBI-Verfahren"
    beschreibung: "Verfahren die bei PBI nicht empfohlen werden"
    datentyp: "CodeableConcept"
    wertebereich: "stark akzelerierte perkutane RT (2x tgl. 3.85 Gy) | Einzellumenkatheter-Brachytherapie"
    verpflichtung: "empfohlen"
    anmerkung: "Negativ-Empfehlung - diese Verfahren sollen nicht eingesetzt werden"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "Negativ-Empfehlung; relevant fuer Qualitaetssicherung und Leitlinien-Adherence."

referenzen:
  s3_literatur: ["804", "805", "719", "806", "363", "798", "800"]
  verwandte_empfehlungen: ["4.103", "4.104", "4.105"]
```

### Empfehlung 4.107

```yaml
id: S3-5.0-4.107
kapitel: "4.6.2"
kapitel_titel: "Teilbrustbestrahlung und IORT"
empfehlung_nr: "4.107"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Teilbrustbestrahlung kann als ultra-hypofraktionierte Radiotherapie mit 26 Gy
  in 5 Fraktionen ueber 1 Woche durchgefuehrt werden.

datenobjekte:
  - name: "Ultra-Hypofraktionierte Teilbrustbestrahlung"
    beschreibung: "Teilbrustbestrahlung mit 26 Gy in 5 Fraktionen / 1 Woche"
    datentyp: "CodeableConcept"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-total-dose-gy + ex-senologie-session-count"
  status: "partial"
  anmerkung: "Dosis und Fraktionszahl abbildbar. PBI-spezifischer Kontext fehlt."

referenzen:
  verwandte_empfehlungen: ["4.96", "4.103", "4.104"]
```

### Empfehlung 4.108

```yaml
id: S3-5.0-4.108
kapitel: "4.6.2"
kapitel_titel: "Teilbrustbestrahlung und IORT"
empfehlung_nr: "4.108"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei geplanter Teilbrustbestrahlung sollte eine intraoperative Clipmarkierung des
  Tumorbetts erfolgen.

datenobjekte:
  - name: "Clipmarkierung Tumorbett"
    beschreibung: "Intraoperative Markierung des Tumorbetts mit Clips fuer PBI-Zielvolumendefinition"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei geplanter Teilbrustbestrahlung"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Identisch mit 4.102 - Clipmarkierung als operative Massnahme nicht modelliert."

referenzen:
  s3_literatur: ["778", "779", "780", "781", "782", "783", "784", "755"]
  verwandte_empfehlungen: ["4.102", "4.103"]
```

---

## 4.6.3 Postmastektomie-Radiotherapie (PMRT)

### Empfehlung 4.109 (Statement)

```yaml
id: S3-5.0-4.109
kapitel: "4.6.3"
kapitel_titel: "Postmastektomie-Radiotherapie (PMRT)"
empfehlung_nr: "4.109"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Die postoperative Radiotherapie der Brustwand nach Mastektomie senkt das Risiko
  eines lokoregionaeren Rezidivs und verbessert das Gesamtueberleben bei lokal
  fortgeschrittenen und nodal-positiven Mammakarzinomen.

datenobjekte:
  - name: "PMRT-Indikation"
    beschreibung: "Indikation zur Postmastektomie-Radiotherapie"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Nach Mastektomie"

  - name: "Zielgebiet Brustwand"
    beschreibung: "Bestrahlung der Brustwand (Thoraxwand)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "78904004"
      display: "Chest wall structure (body structure)"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"
    bedingung: "Bei PMRT"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: "Zielgebiet-Extension vorhanden, aber Brustwand als spezifisches Zielgebiet muss im ValueSet enthalten sein."

referenzen:
  s3_literatur: ["820"]
  verwandte_empfehlungen: ["4.110", "4.111"]
```

### Empfehlung 4.110

```yaml
id: S3-5.0-4.110
kapitel: "4.6.3"
kapitel_titel: "Postmastektomie-Radiotherapie (PMRT)"
empfehlung_nr: "4.110"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Bei folgenden Situationen soll die Strahlentherapie der Brustwand nach Mastektomie
  angeboten werden:
  - pT4,
  - pT3 pN0 R0 bei Vorliegen von Risikofaktoren (Lymphgefaessinvasion (L1),
    Grading G3, praemenopausal, Alter < 50 Jahre),
  - R1-/R2-Resektion und fehlender Moeglichkeit der sanierenden Nachresektion.
  a) Bei 4 und mehr befallenen axillaeren Lymphknoten soll eine Postmastektomie-
     bestrahlung regelhaft durchgefuehrt werden.
  b) Bei 1-3 tumorbefallenen axillaeren Lymphknoten soll eine Postmastektomie-
     bestrahlung durchgefuehrt werden, wenn ein erhoehtes Rezidivrisiko vorliegt
     (z.B. wenn HER2-positiv, triple-negativ, G3, L1, Ki67 > 30%, > 25% der
     entfernten Lymphknoten tumorbefallen; Alter <= 45 Jahren mit zusaetzlichen
     Risikofaktoren wie medialer Tumorlokalisation oder Tumorgroesse > 2cm,
     oder ER-negativ).
  c) Bei 1-3 tumorbefallenen axillaeren Lymphknoten und Tumoren mit geringem
     Lokalrezidivrisiko (pT1, G1, ER-positiv, HER2-negativ, wenigstens 3
     Eigenschaften muessen zutreffen) sollte auf die PMRT verzichtet werden.
  d) Bei allen anderen Patientinnen mit 1-3 tumorbefallenen axillaeren Lymphknoten
     soll die individuelle Indikation interdisziplinaer festgelegt werden.

datenobjekte:
  - name: "PMRT-Indikationskriterien"
    beschreibung: "Dokumentation der Indikationskriterien fuer PMRT"
    datentyp: "CodeableConcept"
    wertebereich: "pT4 | pT3 pN0 R0 mit Risikofaktoren | R1/R2 | >=4 LK+ | 1-3 LK+ mit erhoehtem Risiko | interdisziplinaere Entscheidung"
    verpflichtung: "obligat"
    bedingung: "Nach Mastektomie"

  - name: "Anzahl befallener axillaerer Lymphknoten"
    beschreibung: "Zahl der tumorbefallenen axillaeren Lymphknoten"
    datentyp: "integer"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21893-3"
      display: "Regional lymph nodes positive [#] Specimen"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "pT-Kategorie"
    beschreibung: "Pathologische T-Kategorie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Resektionsstatus"
    beschreibung: "R-Klassifikation (R0/R1/R2)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "R0 | R1 | R2"
    verpflichtung: "obligat"

  - name: "Risikofaktoren fuer PMRT"
    beschreibung: "Individuelle Risikofaktoren (L1, G3, praemenopausal, Alter <50, HER2+, TN, Ki67 >30%, Tumorlokalisation)"
    datentyp: "CodeableConcept (mehrfach)"
    verpflichtung: "obligat"
    bedingung: "Bei Entscheidung ueber PMRT"

  - name: "Interdisziplinaere Entscheidung dokumentiert"
    beschreibung: "Dokumentation der interdisziplinaeren Festlegung"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei nicht eindeutiger Indikation (Gruppe d)"

fhir_mapping:
  profil: "Senologie_Strahlentherapie + MII Onkologie TNM"
  status: "partial"
  anmerkung: >
    Zentrale Empfehlung mit komplexer Indikationslogik. TNM-Staging ueber
    MII-Modul verfuegbar. Risikofaktorenanalyse und die differenzierte
    Indikationsstellung (a-d) erfordern Querverweis auf Pathologie und
    Tumorkonferenz-Dokumentation. Interdisziplinaere Entscheidung als
    CarePlan oder ClinicalImpression modellierbar.

referenzen:
  s3_literatur: ["821", "820", "822", "823", "824", "825", "826", "827", "828", "829", "830", "831", "832", "833", "834"]
  verwandte_empfehlungen: ["4.109", "4.111", "4.113"]
```

---

## 4.6.4 Postmastektomie-Radiotherapie nach primaer systemischer Therapie

### Empfehlung 4.111

```yaml
id: S3-5.0-4.111
kapitel: "4.6.4"
kapitel_titel: "Postmastektomie-Radiotherapie nach primaer systemischer Therapie"
empfehlung_nr: "4.111"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Nach primaerer (neoadjuvanter) systemischer Therapie soll sich die Indikation zur
  Postmastektomie-Radiotherapie am praetherapeutischen klinischen Stadium orientieren;
  bei pCR (ypT0 und ypN0) soll die Indikation im interdisziplinaeren Tumorboard
  abhaengig vom Risikoprofil festgelegt werden.

datenobjekte:
  - name: "Neoadjuvante Systemtherapie erhalten"
    beschreibung: "Ob eine primaere (neoadjuvante) Systemtherapie durchgefuehrt wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Klinisches Stadium vor PST"
    beschreibung: "Praetherapeutisches klinisches Stadium (cT, cN)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"
    bedingung: "Nach neoadjuvanter Therapie"

  - name: "Pathologisches Ansprechen (ypT/ypN)"
    beschreibung: "Posttherapeutisches pathologisches Stadium"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "ypT0/is ypN0 (pCR) | ypT1-2 ypN0 | ypT3-4 oder ypN+"
    verpflichtung: "obligat"

  - name: "pCR erreicht"
    beschreibung: "Pathologische Komplettremission (ypT0/is ypN0)"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Tumorboard-Entscheidung bei pCR"
    beschreibung: "Interdisziplinaere Festlegung der PMRT-Indikation bei pCR"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei pCR nach neoadjuvanter Therapie"

fhir_mapping:
  profil: "Senologie_Strahlentherapie + MII Onkologie TNM"
  status: "partial"
  anmerkung: >
    Klinisches und pathologisches Staging ueber MII-Modul verfuegbar.
    Der Bezug auf das praetherapeutische Stadium (cTNM vor PST) und
    das posttherapeutische Stadium (ypTNM) muss als zeitliche Zuordnung
    klar modelliert sein. Tumorboard-Entscheidung ueber CarePlan/
    ClinicalImpression abbildbar.

referenzen:
  s3_literatur: ["837", "838", "839", "840", "841", "842", "843", "844"]
  verwandte_empfehlungen: ["4.109", "4.110"]
```

---

## 4.6.5 Radiotherapie der regionalen Lymphknoten

### Empfehlung 4.112 (Statement)

```yaml
id: S3-5.0-4.112
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.112"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die adjuvante Bestrahlung der regionalen Lymphabflussgebiete (Supra-/Infraklavikular-
  region, Mammaria interna-Region, nicht-dissezierter Anteil der Axilla) verbessert
  das brustkrebsspezifische Ueberleben und das Gesamtueberleben in Untergruppen
  von Patientinnen.

datenobjekte:
  - name: "Regionale Lymphabflussgebiete bestrahlt"
    beschreibung: "Welche regionalen Lymphabflussgebiete bestrahlt wurden"
    datentyp: "CodeableConcept (mehrfach)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Supraklavikularregion | Infraklavikularregion | Mammaria interna | Axilla (nicht-disseziert)"
    verpflichtung: "obligat"
    bedingung: "Bei Bestrahlung der Lymphabflusswege"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: >
    Zielgebiet-Extension vorhanden, aber differenzierte Abbildung der einzelnen
    Lymphabflussgebiete (supraklaviculaer, infraklaviculaer, Mammaria interna,
    Axilla-Level) als ValueSet noetig.

referenzen:
  s3_literatur: ["709", "710", "711", "858", "859", "795", "364", "363", "796", "797", "798", "799", "800", "801", "802", "803", "804", "719", "752", "860", "861", "862"]
  verwandte_empfehlungen: ["4.113", "4.114", "4.115", "4.116", "4.117", "4.118"]
```

### Empfehlung 4.113

```yaml
id: S3-5.0-4.113
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.113"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Nachweis von 4 und mehr befallenen axillaeren Lymphknoten soll eine Bestrahlung
  der regionalen Lymphabflussgebiete durchgefuehrt werden.

datenobjekte:
  - name: "Anzahl befallener axillaerer LK"
    beschreibung: "Mindestens 4 befallene axillaere Lymphknoten"
    datentyp: "integer"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21893-3"
      display: "Regional lymph nodes positive [#] Specimen"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Bestrahlung regionale Lymphabflussgebiete"
    beschreibung: "Indikation zur Bestrahlung aller regionalen Lymphabflussgebiete"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei >= 4 befallenen axillaeren LK"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: "Zielgebiet abbildbar. Indikationslogik muss extern dokumentiert werden."

referenzen:
  s3_literatur: ["709", "710", "711", "858", "859", "863", "864", "752", "860", "861", "862"]
  verwandte_empfehlungen: ["4.112", "4.114", "4.110"]
```

### Empfehlung 4.114

```yaml
id: S3-5.0-4.114
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.114"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Nachweis von 1-3 befallenen axillaeren Lymphknoten und Vorliegen von
  Risikofaktoren:
  - ER/PgR-negativ
  oder
  - medialer oder zentraler Tumorsitz
  sollte eine Bestrahlung der regionalen Lymphabflussgebiete durchgefuehrt werden.

datenobjekte:
  - name: "Anzahl befallener axillaerer LK"
    beschreibung: "1-3 befallene axillaere Lymphknoten"
    datentyp: "integer"
    verpflichtung: "obligat"

  - name: "ER/PgR-Status"
    beschreibung: "Hormonrezeptorstatus (negativ als Risikofaktor)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Tumorsitz"
    beschreibung: "Lokalisation des Tumors in der Brust (medial/zentral vs. lateral)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      mapping_quelle: "standard"
    wertebereich: "medial | zentral | lateral | oberer aeusserer Quadrant | etc."
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: >
    Zielgebiet abbildbar. Tumorsitz als Indikationskriterium erfordert
    Bezug zum Primärtumor (Condition/Observation mit Topographie).

referenzen:
  s3_literatur: ["709", "710", "711", "858", "859", "863", "864", "752", "860", "861", "862"]
  verwandte_empfehlungen: ["4.112", "4.113", "4.115"]
```

### Empfehlung 4.115

```yaml
id: S3-5.0-4.115
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.115"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine Bestrahlung der regionalen Lymphabflussgebiete kann bei Patientinnen mit
  pN0- oder pN1mi-Stadium erfolgen, sofern die folgenden Bedingungen alle erfuellt sind:
  - Praemenopausal
  - zentraler oder medialer Tumorsitz
  - G3 und ER/PgR-negativ

datenobjekte:
  - name: "pN-Stadium"
    beschreibung: "Pathologischer Lymphknotenstatus (pN0 oder pN1mi)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "pN0 | pN1mi"
    verpflichtung: "obligat"

  - name: "Menopausenstatus"
    beschreibung: "Praemeno- vs. postmenopausal"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

  - name: "Grading"
    beschreibung: "Histologischer Grad (G3 als Risikofaktor)"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

  - name: "Tumorsitz"
    beschreibung: "Zentral oder medial"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "partial"
  anmerkung: >
    Indikationslogik erfordert Querverweis auf Pathologie (Grading, HR-Status),
    Staging (pN) und klinische Angaben (Menopausenstatus, Tumorsitz).

referenzen:
  s3_literatur: ["752", "861", "865", "866", "867", "868", "869", "863", "864"]
  verwandte_empfehlungen: ["4.112", "4.113", "4.114"]
```

### Empfehlung 4.116

```yaml
id: S3-5.0-4.116
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.116"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei nachgewiesenem Befall der A. mammaria interna Lymphknoten oder der
  supra-/infraklavikulaeren Lymphknoten sollte eine Bestrahlung der regionalen
  Lymphabflussgebiete durchgefuehrt werden.

datenobjekte:
  - name: "Befall Mammaria-interna-LK"
    beschreibung: "Nachweis befallener Lymphknoten entlang der A. mammaria interna"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Befall supra-/infraklavikulaere LK"
    beschreibung: "Nachweis befallener supra- oder infraklavikulaerer Lymphknoten"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: "Zielgebiet abbildbar. Spezifischer LK-Befall als Indikation erfordert Staging-Befund."

referenzen:
  s3_literatur: ["709", "710", "711", "858", "859", "870", "871"]
  verwandte_empfehlungen: ["4.112", "4.113", "4.118"]
```

### Empfehlung 4.117

```yaml
id: S3-5.0-4.117
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.117"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Wenn eine Bestrahlung der Lymphabflusswege durchgefuehrt wird, sollte auch eine
  Bestrahlung der Brust bzw. Thoraxwand erfolgen.

datenobjekte:
  - name: "Kombinierte Bestrahlung Brust/Thoraxwand + Lymphabflusswege"
    beschreibung: "Gleichzeitige Bestrahlung von Brust/Thoraxwand bei Lymphabflussbestrahlung"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei Bestrahlung der Lymphabflusswege"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: "Mehrere Zielgebiete gleichzeitig muessen dokumentierbar sein."

referenzen:
  s3_literatur: ["752"]
  verwandte_empfehlungen: ["4.112", "4.94", "4.109"]
```

### Empfehlung 4.118

```yaml
id: S3-5.0-4.118
kapitel: "4.6.5"
kapitel_titel: "Radiotherapie der regionalen Lymphknoten"
empfehlung_nr: "4.118"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Bestrahlung der A. mammaria interna Lymphknoten soll bei erhoehtem kardialen
  Risiko oder einer Therapie mit Trastuzumab/Pertuzumab individuell interdisziplinaer
  entschieden werden.

datenobjekte:
  - name: "Kardiales Risikoprofil"
    beschreibung: "Erhoehtes kardiales Risiko der Patientin"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"
    bedingung: "Bei geplanter Mammaria-interna-Bestrahlung"

  - name: "Anti-HER2-Therapie"
    beschreibung: "Begleitende Therapie mit Trastuzumab/Pertuzumab"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Interdisziplinaere Entscheidung MI-LK-Bestrahlung"
    beschreibung: "Dokumentation der interdisziplinaeren Entscheidung"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei erhoehtem kardialen Risiko oder Anti-HER2-Therapie"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Kardiales Risikoprofil und Interaktion mit Anti-HER2-Therapie
    sind nicht im Strahlentherapie-Profil modelliert. Erfordern
    Querverweis auf Condition (kardiale Vorerkrankungen) und
    MedicationAdministration (Trastuzumab/Pertuzumab).

referenzen:
  s3_literatur: ["872", "873"]
  verwandte_empfehlungen: ["4.112", "4.116", "4.126"]
```

---

## 4.6.6 Bestrahlung der axillaeren Lymphknoten

### Empfehlung 4.119

```yaml
id: S3-5.0-4.119
kapitel: "4.6.6"
kapitel_titel: "Bestrahlung der axillaeren Lymphknoten"
empfehlung_nr: "4.119"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "4"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Wenn bei Patientinnen mit befallenen axillaeren Waechterlymphknoten (> 2 mm) keine
  axillaere Dissektion erfolgt ist, sollte das klinische Zielvolumen der adjuvanten
  Strahlentherapie neben der Brust bzw. Thoraxwand die axillaeren Level I-IV mit
  erfassen.

datenobjekte:
  - name: "Axillaere Dissektion durchgefuehrt"
    beschreibung: "Ob eine axillaere Lymphknotendissektion (ALND) erfolgte"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Sentinel-LK-Befall"
    beschreibung: "Befallene Waechterlymphknoten mit Makrometastasen (>2mm)"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Axilla-Level im Zielvolumen"
    beschreibung: "Erfasste axillaere Level im Bestrahlungszielvolumen"
    datentyp: "CodeableConcept (mehrfach)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Axilla Level I | Level II | Level III | Level IV (supraklaviculaer)"
    verpflichtung: "empfohlen"
    bedingung: "Bei Verzicht auf ALND und positivem Sentinel-LK"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-radiation-target"
  status: "partial"
  anmerkung: >
    Zielgebiet-Extension vorhanden, aber differenzierte Abbildung der
    Axilla-Level (I-IV) fehlt im ValueSet. Bezug zur axillaeren Chirurgie
    (SLNB vs. ALND) als Querverweis noetig.

referenzen:
  s3_literatur: ["536", "537", "877", "878"]
  verwandte_empfehlungen: ["4.112", "4.120"]
```

### Empfehlung 4.120

```yaml
id: S3-5.0-4.120
kapitel: "4.6.6"
kapitel_titel: "Bestrahlung der axillaeren Lymphknoten"
empfehlung_nr: "4.120"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Sind nur 1-2 axillaere Waechterlymphknoten befallen (> 2 mm) und besteht ansonsten
  keine Indikation zur Lymphabflussbestrahlung, kann in dieser Situation ein Verzicht
  auf die Bestrahlung von Level III-IV und des kranialen Anteils von Level I-II
  (obere Feldgrenze des PTV bis 5 mm unterhalb der V. axillaris) erwogen werden.

datenobjekte:
  - name: "Anzahl befallener Sentinel-LK"
    beschreibung: "1-2 befallene Waechterlymphknoten mit Makrometastasen"
    datentyp: "integer"
    wertebereich: "1-2"
    verpflichtung: "obligat"

  - name: "Reduziertes Axilla-Zielvolumen"
    beschreibung: "Verzicht auf Level III-IV und kranialen Anteil Level I-II"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Bei 1-2 SLN+ und keine weitere LK-Bestrahlungsindikation"

  - name: "Obere Feldgrenze PTV"
    beschreibung: "Obere Feldgrenze bis 5 mm unterhalb V. axillaris"
    datentyp: "Quantity (mm)"
    verpflichtung: "optional"
    bedingung: "Bei reduziertem Axilla-Zielvolumen"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Detaillierte Zielvolumendefinition (Feldgrenzen, Axilla-Level-Differenzierung)
    ist nicht im FHIR-Profil modelliert. Gehoert zur Bestrahlungsplanung und
    waere als RTPlan-Referenz oder Extension darstellbar.

referenzen:
  s3_literatur: ["878", "537", "743", "543", "879", "880"]
  verwandte_empfehlungen: ["4.119", "4.112"]
```

---

## 4.6.7 Dosis und Fraktionierung bei Bestrahlung des regionalen Lymphabflusses

### Empfehlung 4.121

```yaml
id: S3-5.0-4.121
kapitel: "4.6.7"
kapitel_titel: "Dosis und Fraktionierung bei Bestrahlung des regionalen Lymphabflusses"
empfehlung_nr: "4.121"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Die Radiotherapie des Lymphabflusses sollte in konventioneller Fraktionierung
  (5x woechentlich 1,8 Gy bis 2,0 Gy, Gesamtdosis ca. 50 Gy in ca. 5-6 Wochen)
  oder in moderater Hypofraktionierung (Gesamtdosis ca. 40-43,5 Gy in ca. 15-16
  Fraktionen in ca. 3 Wochen) erfolgen.

datenobjekte:
  - name: "Fraktionierungsschema Lymphabfluss"
    beschreibung: "Fraktionierung der regionalen Lymphabflussbestrahlung"
    datentyp: "CodeableConcept"
    wertebereich: "konventionell (50 Gy / 25-28 Fraktionen / 5-6 Wochen) | moderat hypofraktioniert (40-43.5 Gy / 15-16 Fraktionen / 3 Wochen)"
    verpflichtung: "empfohlen"

  - name: "Gesamtdosis Lymphabfluss"
    beschreibung: "Gesamtdosis der Lymphabflussbestrahlung"
    datentyp: "Quantity (Gy)"
    wertebereich: "ca. 50 Gy (konventionell) | ca. 40-43.5 Gy (hypofraktioniert)"
    verpflichtung: "obligat"

  - name: "Einzeldosis Lymphabfluss"
    beschreibung: "Dosis pro Fraktion"
    datentyp: "Quantity (Gy)"
    wertebereich: "1.8-2.0 Gy (konventionell) | ca. 2.5-2.67 Gy (hypofraktioniert)"
    verpflichtung: "empfohlen"

  - name: "Fraktionszahl Lymphabfluss"
    beschreibung: "Anzahl der Fraktionen"
    datentyp: "integer"
    wertebereich: "25-28 (konventionell) | 15-16 (hypofraktioniert)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-total-dose-gy + ex-senologie-session-count"
  status: "partial"
  anmerkung: >
    Gesamtdosis und Fraktionszahl abbildbar. Differenzierung der Dosis
    pro Zielgebiet (Brust vs. Lymphabfluss) fehlt. Separate Extensions
    oder verschachtelte Struktur fuer mehrere Bestrahlungszielgebiete
    mit jeweils eigener Dosimetrie waere erforderlich.

referenzen:
  s3_literatur: ["732", "887", "888", "889", "890"]
  verwandte_empfehlungen: ["4.95", "4.112", "4.113"]
```

---

## 4.6.8 Radiotherapie bei lokal weit fortgeschrittenem Tumor und bei primaerer Inoperabilitaet

### Empfehlung 4.122

```yaml
id: S3-5.0-4.122
kapitel: "4.6.8"
kapitel_titel: "Radiotherapie bei lokal fortgeschrittenem Tumor und primaerer Inoperabilitaet"
empfehlung_nr: "4.122"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Bei Patientinnen mit primaer inoperablen bzw. inflammatorischen Karzinomen soll
  eine primaere Systemtherapie, gefolgt von Operation und postoperativer Strahlentherapie,
  oder bei weiter bestehender Inoperabilitaet eine Strahlentherapie mit erneuter
  Evaluation einer Operation nach Abschluss der Strahlentherapie durchgefuehrt werden.

datenobjekte:
  - name: "Primaere Inoperabilitaet"
    beschreibung: "Tumorsituation: primaer inoperabel oder inflammatorisches Karzinom"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Inflammatorisches Mammakarzinom"
    beschreibung: "Vorliegen eines inflammatorischen Mammakarzinoms (IBC)"
    datentyp: "boolean"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      code: "8530/3"
      display: "Inflammatory carcinoma"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Therapiesequenz bei Inoperabilitaet"
    beschreibung: "Therapeutische Sequenz (PST -> OP -> RT oder PST -> RT -> OP-Evaluation)"
    datentyp: "CodeableConcept"
    wertebereich: "PST + OP + adjuvante RT | PST + definitive RT + OP-Re-Evaluation | Radio(chemo)therapie"
    verpflichtung: "obligat"
    bedingung: "Bei primaer inoperablem oder inflammatorischem Karzinom"

  - name: "Operabilitaet nach PST"
    beschreibung: "Wurde nach PST Operabilitaet erreicht?"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  element: "ex-senologie-treatment-intention"
  status: "partial"
  anmerkung: >
    Therapieintention (adjuvant/neoadjuvant/palliativ) abbildbar. Die komplexe
    Therapiesequenz bei Inoperabilitaet erfordert einen CarePlan mit mehreren
    verknuepften Procedures und zeitlicher Abfolge.

referenzen:
  s3_literatur: ["891", "892", "893", "894", "895"]
  verwandte_empfehlungen: ["4.109", "4.110", "4.111"]
```

---

## 4.6.9 Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie

### Empfehlung 4.123

```yaml
id: S3-5.0-4.123
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.123"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Postoperative Chemotherapie und Radiotherapie sollen sequentiell erfolgen.
  Die Ueberlegenheit einer speziellen Sequenz (erst Chemotherapie bzw. erst
  Radiotherapie) ist nicht belegt. Fuer die klinische Praxis hat sich die Sequenz
  von Chemotherapie mit nachfolgender Radiotherapie etabliert.

datenobjekte:
  - name: "Therapiesequenz Chemo/RT"
    beschreibung: "Zeitliche Abfolge von Chemotherapie und Radiotherapie"
    datentyp: "CodeableConcept"
    wertebereich: "Chemotherapie zuerst, dann RT | RT zuerst, dann Chemotherapie | simultan (nicht empfohlen)"
    verpflichtung: "obligat"
    bedingung: "Bei adjuvanter Chemo- und Radiotherapie"

  - name: "Intervall Chemotherapie-Ende bis RT-Beginn"
    beschreibung: "Zeitintervall zwischen Ende der Chemotherapie und Beginn der RT"
    datentyp: "Quantity (Wochen)"
    wertebereich: "typisch 2-4 Wochen nach letztem Chemo-Kurs"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Therapiesequenz ist nicht im Strahlentherapie-Profil modelliert. Erfordert
    CarePlan oder uebergeordnete Therapieplanung mit zeitlicher Verknuepfung
    von MedicationAdministration (Chemotherapie) und Procedure (RT).

referenzen:
  s3_literatur: ["902", "903", "904", "905"]
  verwandte_empfehlungen: ["4.124", "4.125", "4.126"]
```

### Empfehlung 4.124

```yaml
id: S3-5.0-4.124
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.124"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "gepr&uuml;ft 2025"
text: >
  Bei alleiniger Strahlentherapie sollte diese innerhalb einer 8-woechigen Frist
  postoperativ eingeleitet werden.

datenobjekte:
  - name: "Intervall OP bis RT-Beginn"
    beschreibung: "Zeitintervall zwischen Operation und Beginn der Strahlentherapie"
    datentyp: "Quantity (Wochen)"
    wertebereich: "<= 8 Wochen (Soll)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Zeitintervall OP-RT ist nicht als eigenes Element modelliert. Kann ueber
    Procedure.performedPeriod.start (RT) minus Procedure.performedPeriod.end (OP)
    berechnet werden, erfordert aber Referenz zwischen beiden Procedures.

referenzen:
  s3_literatur: ["906", "907"]
  verwandte_empfehlungen: ["4.123"]
```

### Empfehlung 4.125

```yaml
id: S3-5.0-4.125
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.125"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine adjuvante endokrine Therapie kann unabhaengig von der Radiotherapie eingeleitet
  werden.

datenobjekte:
  - name: "Gleichzeitige endokrine Therapie und RT"
    beschreibung: "Endokrine Therapie parallel zur Radiotherapie"
    datentyp: "boolean"
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Parallele Medikation waehrend RT ueber MedicationAdministration abbildbar, aber keine spezifische Modellierung."

referenzen:
  s3_literatur: ["908", "909", "910", "911", "912", "913", "914", "915", "916"]
  verwandte_empfehlungen: ["4.123"]
```

### Empfehlung 4.126

```yaml
id: S3-5.0-4.126
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.126"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1, 4"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine Therapie mit Trastuzumab und Pertuzumab kann waehrend einer adjuvanten
  Strahlentherapie fortgefuehrt werden. Bei einer simultanen A.-mammaria-Lymphknoten-
  Bestrahlung soll das Vorgehen interdisziplinaer festgelegt werden.

datenobjekte:
  - name: "Simultane Anti-HER2-Therapie"
    beschreibung: "Trastuzumab/Pertuzumab waehrend RT"
    datentyp: "boolean"
    verpflichtung: "optional"

  - name: "Simultane MI-LK-Bestrahlung und Anti-HER2"
    beschreibung: "Gleichzeitige Mammaria-interna-Bestrahlung und Trastuzumab/Pertuzumab"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Anti-HER2-Therapie und geplanter MI-LK-Bestrahlung"

  - name: "Interdisziplinaere Festlegung"
    beschreibung: "Dokumentation der interdisziplinaeren Entscheidung"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei simultaner MI-LK-Bestrahlung und Anti-HER2-Therapie"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: >
    Gleichzeitige Systemtherapie waehrend RT ist nicht modelliert.
    Erfordert Referenz zwischen Procedure (RT) und MedicationAdministration
    (Anti-HER2) sowie CarePlan fuer interdisziplinaere Entscheidung.

referenzen:
  s3_literatur: ["712", "872", "873", "914", "917", "918", "919", "920", "921", "922", "923", "924"]
  verwandte_empfehlungen: ["4.118", "4.123", "4.127"]
```

### Empfehlung 4.127

```yaml
id: S3-5.0-4.127
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.127"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine Therapie mit Trastuzumab Emtansin (T-DM1) kann waehrend einer adjuvanten
  Strahlentherapie eingeleitet bzw. fortgefuehrt werden. Auf eine optimale
  Lungenschonung sollte wegen des geringfuegig erhoehten Pneumonitis-Risikos
  geachtet werden.

datenobjekte:
  - name: "Simultane T-DM1-Therapie"
    beschreibung: "T-DM1 (Trastuzumab Emtansin) waehrend RT"
    datentyp: "boolean"
    verpflichtung: "optional"

  - name: "Lungenschonung beachtet"
    beschreibung: "Dokumentation der optimalen Lungenschonung bei simultaner T-DM1-Gabe"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei simultaner T-DM1 und RT"

fhir_mapping:
  profil: "Senologie_Strahlentherapie"
  status: "gap"
  anmerkung: "Simultane Medikation und Organschonung nicht modelliert."

referenzen:
  s3_literatur: ["925", "926", "927", "928", "914"]
  verwandte_empfehlungen: ["4.126"]
```

### Empfehlung 4.128

```yaml
id: S3-5.0-4.128
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.128"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine Therapie mit Pembrolizumab kann waehrend einer adjuvanten Strahlentherapie
  fortgefuehrt werden.

datenobjekte:
  - name: "Simultane Pembrolizumab-Therapie"
    beschreibung: "Pembrolizumab (Anti-PD-1) waehrend RT"
    datentyp: "boolean"
    verpflichtung: "optional"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Simultane Immuntherapie waehrend RT nicht modelliert."

referenzen:
  s3_literatur: ["929", "930", "914"]
  verwandte_empfehlungen: ["4.126", "4.127"]
```

### Empfehlung 4.129

```yaml
id: S3-5.0-4.129
kapitel: "4.6.9"
kapitel_titel: "Therapiesequenz von adjuvanter Systemtherapie und Radiotherapie"
empfehlung_nr: "4.129"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine Therapie mit Inhibitoren Cyclin-abhaengiger Kinasen (CDK) oder der
  Poly(ADP-ribose)-Polymerase (PARP) sollte waehrend der adjuvanten Strahlentherapie
  vermieden werden, da ausreichende Daten zur Sicherheit fehlen.

datenobjekte:
  - name: "CDK-Inhibitor waehrend RT"
    beschreibung: "Vermeidung von CDK-Inhibitoren (Abemaciclib, Palbociclib, Ribociclib) waehrend RT"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    anmerkung: "Negativ-Empfehlung - sollte vermieden werden"

  - name: "PARP-Inhibitor waehrend RT"
    beschreibung: "Vermeidung von PARP-Inhibitoren (Olaparib) waehrend RT"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    anmerkung: "Negativ-Empfehlung - sollte vermieden werden"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Kontraindikation simultaner CDK/PARP-Inhibitoren waehrend RT ist nicht
    modelliert. Relevant fuer Arzneimittelinteraktions-Checks und
    Qualitaetssicherung.

referenzen:
  s3_literatur: ["931", "914"]
  verwandte_empfehlungen: ["4.126", "4.127", "4.128"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 4.6

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.94 | Indikation adjuvante RT nach BET | partial | Verzicht-Dokumentation mit Begruendung fehlt |
| 4.95 | Moderate Hypofraktionierung | partial | Fraktionierungsschema-Typ, Einzeldosis, Behandlungsdauer fehlen |
| 4.96 | Ultra-Hypofraktionierung | partial | Fraktionierungsschema-Typ und Aufklaerungsdokumentation fehlen |
| 4.97 | DIBHT/Gating bei linksseitiger RT | **gap** | Extensions fuer Atemtechnik und Bestrahlungstechnik noetig |
| 4.98 | Boost-Bestrahlung | partial | Boost-Dosis, Boost-Technik, Indikationskriterien fehlen |
| 4.99 | Boost-Technik (perkutan/SIB) | **gap** | Extension fuer Boost-Technik (sequentiell/SIB/IORT/Brachytherapie) |
| 4.100 | Intraoperativer Boost | **gap** | Intraoperative Bestrahlung als Modalitaet nicht modelliert |
| 4.101 | Brachytherapie-Boost | **gap** | Brachytherapie als Boost-Variante nicht modelliert |
| 4.102 | Clipmarkierung fuer Boost | **gap** | Clipmarkierung als operative Massnahme fehlt |
| 4.103 | Teilbrustbestrahlung (PBI) | partial | PBI-Technik, Eignungskriterien fehlen |
| 4.104 | PBI-Fraktionierung | partial | PBI-spezifische Fraktionierungsschemata fehlen |
| 4.105 | IORT als alleinige PBI | **gap** | IORT-Modalitaet und Strahlenart nicht modelliert |
| 4.106 | Kontraindizierte PBI-Verfahren | **gap** | Negativ-Empfehlung; Qualitaetssicherung |
| 4.107 | Ultra-hypofraktionierte PBI | partial | Kontext PBI fehlt |
| 4.108 | Clipmarkierung fuer PBI | **gap** | Identisch mit 4.102 |
| 4.109 | PMRT-Statement | partial | Brustwand als Zielgebiet im ValueSet ergaenzen |
| 4.110 | PMRT-Indikation | partial | Komplexe Indikationslogik; Risikofaktoren-Querverweis |
| 4.111 | PMRT nach PST | partial | Praetherapeutisches vs. posttherapeutisches Staging klar zuordnen |
| 4.112 | Regionale LK - Statement | partial | Differenziertes ValueSet fuer Lymphabflussgebiete noetig |
| 4.113 | Regionale LK bei >=4 LK+ | partial | Zielgebiet abbildbar; Indikationslogik extern |
| 4.114 | Regionale LK bei 1-3 LK+ mit RF | partial | Tumorsitz als Indikationskriterium fehlt |
| 4.115 | Regionale LK bei pN0/pN1mi | partial | Menopausenstatus-Querverweis noetig |
| 4.116 | Regionale LK bei MI/supraklav. Befall | partial | Spezifischer LK-Befall als Staging-Querverweis |
| 4.117 | LK-RT immer mit Brust/Thoraxwand | partial | Mehrere Zielgebiete gleichzeitig |
| 4.118 | MI-LK bei kardialem Risiko/Anti-HER2 | **gap** | Kardiales Risikoprofil, Anti-HER2-Interaktion fehlen |
| 4.119 | Axilla-Level I-IV bei SLN+ ohne ALND | partial | Axilla-Level-Differenzierung im ValueSet noetig |
| 4.120 | Reduziertes Axilla-Zielvolumen | **gap** | Detaillierte Zielvolumendefinition nicht modelliert |
| 4.121 | Dosis/Fraktionierung Lymphabfluss | partial | Dosis pro Zielgebiet (Brust vs. LK) nicht differenziert |
| 4.122 | RT bei lokal fortgeschrittenem Tumor | partial | Therapiesequenz bei Inoperabilitaet ueber CarePlan |
| 4.123 | Sequenz Chemo/RT | **gap** | Therapiesequenz/CarePlan fehlt |
| 4.124 | Zeitintervall OP-RT | **gap** | Zeitintervall als Qualitaetsindikator nicht modelliert |
| 4.125 | Endokrine Therapie parallel zu RT | **gap** | Simultane Medikation nicht modelliert |
| 4.126 | Trastuzumab/Pertuzumab waehrend RT | **gap** | Anti-HER2-Therapie waehrend RT nicht modelliert |
| 4.127 | T-DM1 waehrend RT | **gap** | Simultane T-DM1 und Lungenschonung nicht modelliert |
| 4.128 | Pembrolizumab waehrend RT | **gap** | Simultane Immuntherapie nicht modelliert |
| 4.129 | CDK/PARP-Inhibitoren vermeiden | **gap** | Kontraindikation simultaner Medikation nicht modelliert |

### Uebergreifende Gaps und Handlungsempfehlungen

| Thema | Betroffene Empfehlungen | Vorgeschlagene Massnahme |
|-------|------------------------|--------------------------|
| **Fraktionierungsschema** | 4.95, 4.96, 4.104, 4.107, 4.121 | Neues CodeSystem/ValueSet fuer Fraktionierungsschemata (konventionell/moderat hypo/ultra-hypo) als Extension |
| **Boost-Details** | 4.98, 4.99, 4.100, 4.101 | Extensions fuer Boost-Dosis, Boost-Technik (sequentiell/SIB/IORT/Brachytherapie) ergaenzen |
| **Bestrahlungstechnik/Atemtechnik** | 4.97 | Extensions fuer Bestrahlungstechnik (3D/IMRT/VMAT) und Atemtechnik (DIBHT/Gating) |
| **Zielgebiet-ValueSet** | 4.109, 4.112, 4.119 | Erweiterung des ValueSets fuer ex-senologie-radiation-target um Brustwand, Lymphabflussgebiete (supraklaviculaer, infraklaviculaer, MI, Axilla Level I-IV) |
| **Dosis pro Zielgebiet** | 4.121 | Refactoring: Verschachtelte Struktur fuer mehrere Zielgebiete mit jeweils eigener Dosis/Fraktionierung |
| **Therapiesequenz** | 4.123, 4.124, 4.125-4.129 | CarePlan-Profil fuer Therapiesequenz (Chemo -> RT, simultane Medikation waehrend RT) |
| **Clipmarkierung** | 4.102, 4.108 | Neues Procedure-Element oder Extension fuer intraoperative Tumorbett-Markierung |
| **Simultane Systemtherapie** | 4.126, 4.127, 4.128, 4.129 | Referenz-Modell zwischen Procedure (RT) und MedicationAdministration (Systemtherapie) mit Kompatibilitaets-Flags |
