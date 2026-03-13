# S3-Leitlinie v5.0 - Kapitel 4.4: Operative Therapie des invasiven Karzinoms

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 111-123
> Kapitelstruktur: 4.4.1 Generelle Empfehlung | 4.4.2 Brusterhaltende Operation (BET) | 4.4.3 Mastektomie | 4.4.4 Plastisch rekonstruktive Eingriffe | 4.4.5 Operative Therapie der Axilla

---

## 4.4.1 Generelle Empfehlung

### Empfehlung 4.44

```yaml
id: S3-5.0-4.44
kapitel: "4.4.1"
kapitel_titel: "Generelle Empfehlung"
empfehlung_nr: "4.44"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Basis der Therapie für alle nicht fortgeschrittenen Mammakarzinome ist die Tu-
  morresektion in sano (R0-Status).

datenobjekte:
  - name: "Resektionsstatus"
    beschreibung: "R-Klassifikation des chirurgischen Eingriffs"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "R0 (in sano) | R1 (mikroskopisch Residualtumor) | R2 (makroskopisch Residualtumor)"
    verpflichtung: "obligat"

  - name: "Tumorstadium (nicht fortgeschritten)"
    beschreibung: "Klinische Einschätzung, dass kein fortgeschrittenes Karzinom vorliegt"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.outcome"
  status: "partial"
  anmerkung: "R-Klassifikation ist als Outcome der Operation grundsätzlich abbildbar. Detaillierte R-Klassifikation als CodeableConcept mit UICC-TNM-Codes sollte als spezifisches Element sichergestellt werden."

referenzen:
  s3_literatur: ["448", "449"]
  verwandte_empfehlungen: ["4.45", "4.46"]
```

### Empfehlung 4.45 (Statement)

```yaml
id: S3-5.0-4.45
kapitel: "4.4.1"
kapitel_titel: "Generelle Empfehlung"
empfehlung_nr: "4.45"
typ: "Statement"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Der Resektionsrandstatus hat einen prognostischen Effekt beim invasiven
  Mammakarzinom. Es besteht ein signifikanter Zusammenhang zwischen dem Re-
  sektionsrandstatus (positiv vs. negativ) und der Lokalrezidivrate.

datenobjekte:
  - name: "Resektionsrandstatus"
    beschreibung: "Beurteilung der chirurgischen Schnittränder (positiv vs. negativ)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "395536008"
      display: "Surgical margin finding (finding)"
      mapping_quelle: "vorschlag"
    wertebereich: "positiv (Tumor am Rand) | negativ (tumorfrei, 'no tumor on ink')"
    verpflichtung: "obligat"

  - name: "Minimaler Sicherheitsabstand"
    beschreibung: "Metrischer Abstand zwischen Tumor und Resektionsrand in mm"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_Pathologie_Befund"
  element: "Observation (Resektionsrand)"
  status: "partial"
  anmerkung: "Resektionsrandstatus als prognostischer Faktor. R-Klassifikation vorhanden, aber metrischer Sicherheitsabstand und differenzierte Bewertung (no tumor on ink) als eigenständiges Observation-Element unvollständig."

referenzen:
  s3_literatur: ["448", "450"]
  verwandte_empfehlungen: ["4.44", "4.46"]
```

---

## 4.4.2 Brusterhaltende Operation

### Empfehlung 4.46

```yaml
id: S3-5.0-4.46
kapitel: "4.4.2"
kapitel_titel: "Brusterhaltende Operation"
empfehlung_nr: "4.46"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Ziel der operativen Therapie ist die Tumorentfernung im Gesunden. Die Überle-
  bensraten nach einer brusterhaltenden Therapie (BET) mit nachfolgender Radio-
  therapie der gesamten Brust sind denen nach einer Mastektomie mindestens äqui-
  valent.

datenobjekte:
  - name: "Art der Operation"
    beschreibung: "Brusterhaltende Therapie (BET) vs. Mastektomie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "BET (brusterhaltend) | Mastektomie"
    verpflichtung: "obligat"

  - name: "Resektionsstatus (R0)"
    beschreibung: "Tumorentfernung im Gesunden bestätigt"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "R0 | R1 | R2"
    verpflichtung: "obligat"

  - name: "Nachfolgende Radiotherapie geplant"
    beschreibung: "Planung der adjuvanten Ganzbrustbestrahlung nach BET"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei BET"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code (vs-senologie-brustop-art)"
  status: "mapped"
  anmerkung: "Art der Brustoperation über vs-senologie-brustop-art abgebildet. R0-Status als Outcome. Verweis auf geplante Radiotherapie über ServiceRequest / CarePlan möglich."

referenzen:
  s3_literatur: ["448", "449", "454", "455", "456", "457", "458", "459", "460", "461", "462", "463", "464", "465", "466", "467", "468", "469"]
  verwandte_empfehlungen: ["4.44", "4.47", "4.48"]
```

### Empfehlung 4.47

```yaml
id: S3-5.0-4.47
kapitel: "4.4.2"
kapitel_titel: "Brusterhaltende Operation"
empfehlung_nr: "4.47"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Es sollen alle Patientinnen mit oder ohne vorausgegangene primäre Systemthera-
  pie über die Möglichkeit der brusterhaltenden Therapie (BET) und der Mastek-
  tomie mit der Option einer primären oder sekundären Rekonstruktion aufgeklärt
  werden.

datenobjekte:
  - name: "Aufklärung über operative Optionen"
    beschreibung: "Dokumentation der Aufklärung über BET, Mastektomie und Rekonstruktionsmöglichkeiten"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Aufklärungsinhalte"
    beschreibung: "Besprochene operative Optionen"
    datentyp: "CodeableConcept"
    wertebereich: "BET | Mastektomie | primäre Rekonstruktion | sekundäre Rekonstruktion"
    verpflichtung: "obligat"

  - name: "Vorausgegangene primäre Systemtherapie (PST)"
    beschreibung: "Ob eine neoadjuvante Systemtherapie vorausgegangen ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_OP_Planung"
  element: "ServiceRequest + Consent"
  status: "partial"
  anmerkung: "Aufklärung über OP-Optionen nicht strukturiert im Profil abgebildet. Extension ex-senologie-tumor-conference-consent deckt Tumorkonferenz-Zustimmung ab, aber nicht die spezifische OP-Aufklärung. Consent-Ressource könnte ergänzt werden."

referenzen:
  verwandte_empfehlungen: ["4.46", "4.51", "4.54"]
```

### Empfehlung 4.48

```yaml
id: S3-5.0-4.48
kapitel: "4.4.2"
kapitel_titel: "Brusterhaltende Operation"
empfehlung_nr: "4.48"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Unter Berücksichtigung der Tumorlokalisation und Tumorgröße kann bei multi-
  zentrischem Sitz auf eine Mastektomie verzichtet werden.

datenobjekte:
  - name: "Tumorlokalisation"
    beschreibung: "Lokalisation des Tumors in der Brust"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ICD-O-3"
      version: "2. Revision (2019)"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Multizentrischer Sitz"
    beschreibung: "Vorliegen eines multifokalen/multizentrischen Karzinoms"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Tumorgröße"
    beschreibung: "Ausdehnung des Tumors in mm"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21889-1"
      display: "Size Tumor"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_OP_Planung"
  element: "Procedure.bodySite + Condition"
  status: "partial"
  anmerkung: "Tumorlokalisation über bodySite abbildbar. Multifokalität/Multizentrizität als spezifisches Datenobjekt nicht explizit modelliert."

referenzen:
  s3_literatur: ["470", "471", "472", "473", "474", "475", "476", "477", "280"]
  verwandte_empfehlungen: ["4.46", "4.51"]
```

### Empfehlung 4.49

```yaml
id: S3-5.0-4.49
kapitel: "4.4.2"
kapitel_titel: "Brusterhaltende Operation"
empfehlung_nr: "4.49"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Ist die Läsion präoperativ nicht tastbar, soll sie durch eine bildgebungsgesteuerte
  Markierung lokalisiert und entsprechend dieser Markierung exstirpiert werden.

datenobjekte:
  - name: "Präoperative Tastbarkeit"
    beschreibung: "Ob die Läsion präoperativ palpabel ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Präoperative Markierung"
    beschreibung: "Art der bildgebungsgesteuerten Markierung"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Drahtmarkierung | Clip-Markierung | Seed-Markierung | Radarmarkierung | Farbstoffmarkierung"
    verpflichtung: "obligat"
    bedingung: "Bei nicht-palpablen Läsionen"

  - name: "Markierungsmethode Bildgebung"
    beschreibung: "Bildgebungsverfahren zur Steuerung der Markierung"
    datentyp: "CodeableConcept"
    wertebereich: "Mammographie | Sonographie | MRT"
    verpflichtung: "obligat"
    bedingung: "Bei nicht-palpablen Läsionen"

fhir_mapping:
  profil: "Senologie_OP_Planung"
  element: "ServiceRequest + Extension ex-senologie-pre-op-markierung"
  status: "mapped"
  anmerkung: "Präoperative Markierung über Extension ex-senologie-pre-op-markierung abgebildet. Differenzierung der Markierungsverfahren und Bildgebungsmodalität könnte detaillierter sein."

referenzen:
  verwandte_empfehlungen: ["4.50"]
```

### Empfehlung 4.50

```yaml
id: S3-5.0-4.50
kapitel: "4.4.2"
kapitel_titel: "Brusterhaltende Operation"
empfehlung_nr: "4.50"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Die intraoperative Sonographie sollte zur Entfernung von palpablen und nicht-pal-
  pablen sonographisch sichtbaren Befunden als ergänzende oder alleinige Me-
  thode eingesetzt werden.

datenobjekte:
  - name: "Intraoperative Sonographie durchgeführt"
    beschreibung: "Ob eine intraoperative Ultraschalluntersuchung eingesetzt wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "Rolle der intraoperativen Sonographie"
    beschreibung: "Einsatz als ergänzende oder alleinige Lokalisationsmethode"
    datentyp: "CodeableConcept"
    wertebereich: "ergänzend | alleinig"
    verpflichtung: "empfohlen"
    bedingung: "Bei sonographisch sichtbaren Befunden"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.extension"
  status: "gap"
  anmerkung: "Intraoperative Sonographie als begleitende Prozedur/Methode nicht modelliert. Könnte als verknüpfte Procedure oder als Extension an der Hauptoperation abgebildet werden."

referenzen:
  s3_literatur: ["300", "301", "302"]
  verwandte_empfehlungen: ["4.49"]
```

---

## 4.4.3 Mastektomie

### Empfehlung 4.51

```yaml
id: S3-5.0-4.51
kapitel: "4.4.3"
kapitel_titel: "Mastektomie"
empfehlung_nr: "4.51"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine Mastektomie soll bei folgenden Indikationen durchgeführt werden:
  - inkomplette Entfernung des Tumors (inkl. intraduktale Komponente), auch nach Nachresektion
  - inflammatorisches Mammakarzinom
  - bei Kontraindikationen zur Nachbestrahlung nach brusterhaltender Therapie bei Indikation zur Bestrahlung
  - Wunsch der aufgeklärten Patientin

datenobjekte:
  - name: "Indikation zur Mastektomie"
    beschreibung: "Grund für die Durchführung einer Mastektomie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "Inkomplette Tumorentfernung (nach BET/Nachresektion) | Inflammatorisches Mammakarzinom | Kontraindikation Bestrahlung | Patientinnenwunsch"
    verpflichtung: "obligat"

  - name: "Inflammatorisches Mammakarzinom"
    beschreibung: "Vorliegen eines inflammatorischen Mammakarzinoms (IBC)"
    datentyp: "boolean"
    terminologie:
      system: "ICD-10-GM"
      version: "2025"
      code: "C50.9 + Zusatz"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Vorherige Nachresektion"
    beschreibung: "Ob bereits eine Nachresektion nach BET erfolgt ist"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei inkompletter Entfernung als Indikation"

  - name: "Kontraindikation Bestrahlung"
    beschreibung: "Art der Kontraindikation gegen adjuvante Bestrahlung"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"
    bedingung: "Bei Kontraindikation als Indikation"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code + Procedure.reasonCode"
  status: "partial"
  anmerkung: "Mastektomie als Operationsart in vs-senologie-brustop-art enthalten. Indikation (reasonCode) als strukturiertes Element mit spezifischen Codes für die vier Indikationen nicht vollständig modelliert."

referenzen:
  s3_literatur: ["489", "257", "490", "491"]
  verwandte_empfehlungen: ["4.46", "4.52", "4.54"]
```

### Empfehlung 4.52

```yaml
id: S3-5.0-4.52
kapitel: "4.4.3"
kapitel_titel: "Mastektomie"
empfehlung_nr: "4.52"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Unter Berücksichtigung von tumorfreien Resektionsrändern kann die Mastektomie
  auch hautsparend mit oder ohne Erhalt des Mamillen-Areola-Komplexes (MAK)
  durchgeführt werden.

datenobjekte:
  - name: "Mastektomie-Typ"
    beschreibung: "Art der Mastektomie (MRM, SSM, NSM)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Modifiziert radikale Mastektomie (MRM) | Hautsparende Mastektomie (SSM) | Mamillen-sparende Mastektomie (NSM)"
    verpflichtung: "obligat"

  - name: "Erhalt des Mamillen-Areola-Komplexes (MAK)"
    beschreibung: "Ob der MAK erhalten wurde"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei hautsparender Mastektomie"

  - name: "Resektionsrand retroareolär tumorfrei"
    beschreibung: "Histologische Bestätigung tumorfreien retroareolären Gewebes"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei NSM (Erhalt MAK)"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code (vs-senologie-brustop-art)"
  status: "partial"
  anmerkung: "Mastektomie-Typen (MRM/SSM/NSM) sollten in vs-senologie-brustop-art differenziert abgebildet sein. MAK-Erhalt als eigenes Datenobjekt prüfen."

referenzen:
  s3_literatur: ["492", "493", "494", "495"]
  verwandte_empfehlungen: ["4.51", "4.54"]
```

### Empfehlung 4.53

```yaml
id: S3-5.0-4.53
kapitel: "4.4.3"
kapitel_titel: "Mastektomie"
empfehlung_nr: "4.53"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "geprüft 2025"
text: >
  Eine kontralaterale risiko-reduzierende Mastektomie sollte bei Nicht-Mutationsträge-
  rinnen bzw. bei Patientinnen ohne Nachweis einer familiären Hochrisikositua-
  tion zur Reduktion des kontralateralen Mammakarzinomrisikos nicht durchge-
  führt werden.

datenobjekte:
  - name: "Kontralaterale risiko-reduzierende Mastektomie"
    beschreibung: "Ob eine prophylaktische kontralaterale Mastektomie durchgeführt wird"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

  - name: "BRCA1/2-Mutationsstatus"
    beschreibung: "Keimbahn-Mutationsstatus für BRCA1/2"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
    wertebereich: "pathogen | wahrscheinlich pathogen | VUS | negativ"
    verpflichtung: "obligat"
    bedingung: "Entscheidungsrelevant für kontralaterale Mastektomie"

  - name: "Familiäre Hochrisikosituation"
    beschreibung: "Vorliegen einer familiären Hochrisikosituation (ohne nachgewiesene Mutation)"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code + Procedure.reasonCode"
  status: "partial"
  anmerkung: "Kontralaterale prophylaktische Mastektomie als eigene Procedure kodierbar. Zusammenhang mit Mutationsstatus über Condition/Observation herzustellen. Entscheidungsgrundlage (Mutationsstatus, familiäre Risikosituation) nicht strukturiert verknüpft."

referenzen:
  s3_literatur: ["449", "200", "233", "496", "224"]
  verwandte_empfehlungen: ["4.51", "4.54"]
```

---

## 4.4.4 Plastisch rekonstruktive Eingriffe

### Empfehlung 4.54

```yaml
id: S3-5.0-4.54
kapitel: "4.4.4"
kapitel_titel: "Plastisch rekonstruktive Eingriffe"
empfehlung_nr: "4.54"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "3"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Jede Patientin, bei der eine Mastektomie durchgeführt wird, soll über die Möglich-
  keit einer sofortigen oder späteren Brustrekonstruktion bzw. den Verzicht auf re-
  konstruktive Maßnahmen aufgeklärt werden; dabei sollte ein Kontakt zu Betroffe-
  nen bzw. Selbsthilfegruppen oder Selbsthilfeorganisationen angeboten werden.

datenobjekte:
  - name: "Aufklärung Rekonstruktionsoptionen"
    beschreibung: "Dokumentation der Aufklärung über Rekonstruktionsmöglichkeiten"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Mastektomie"

  - name: "Rekonstruktionszeitpunkt"
    beschreibung: "Geplanter Zeitpunkt der Rekonstruktion"
    datentyp: "CodeableConcept"
    wertebereich: "sofort (primär) | später (sekundär) | Verzicht"
    verpflichtung: "obligat"
    bedingung: "Bei Mastektomie"

  - name: "Rekonstruktionsmethode"
    beschreibung: "Art der geplanten Brustrekonstruktion"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "Implantat | Expander | Eigengewebe (autolog) | Kombination | Flat closure | Keine"
    verpflichtung: "empfohlen"
    bedingung: "Bei geplanter Rekonstruktion"

  - name: "Kontaktangebot Selbsthilfe"
    beschreibung: "Ob Kontakt zu Betroffenen/Selbsthilfegruppen angeboten wurde"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Brustimplantat / Senologie_OP_Planung"
  element: "Procedure (Brustimplantat) + ServiceRequest"
  status: "partial"
  anmerkung: "Senologie_Brustimplantat deckt Implantat-Rekonstruktionen ab. Aufklärung über Optionen und Entscheidung als Consent/CarePlan nicht strukturiert modelliert. Eigengewebe-Rekonstruktionen (DIEP, TRAM etc.) nicht spezifisch profiliert. Verweis auf Kapitel 7.5 Brustrekonstruktion für Details."

referenzen:
  s3_literatur: ["449", "494", "506", "261"]
  verwandte_empfehlungen: ["4.51", "4.52"]
```

---

## 4.4.5 Operative Therapie der Axilla

### Empfehlung 4.55

```yaml
id: S3-5.0-4.55
kapitel: "4.4.5"
kapitel_titel: "Operative Therapie der Axilla"
empfehlung_nr: "4.55"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "2025"
text: >
  Bei Nachweis einer Fernmetastasierung soll auf ein operatives axilläres Staging
  verzichtet werden.

datenobjekte:
  - name: "Fernmetastasierung nachgewiesen"
    beschreibung: "Vorliegen von Fernmetastasen (cM1/pM1)"
    datentyp: "boolean"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Operatives axilläres Staging durchgeführt"
    beschreibung: "Ob ein operatives Staging der Axilla erfolgt ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_OP_Planung"
  element: "Procedure + ServiceRequest"
  status: "partial"
  anmerkung: "Axilla-Staging als eigene Procedure kodierbar. Entscheidungslogik (Verzicht bei M1) nicht als Geschäftsregel formalisiert."

referenzen:
  verwandte_empfehlungen: ["4.56", "4.57"]
```

### 4.4.5.1 Primäre operative Therapie der Axilla

### Empfehlung 4.56

```yaml
id: S3-5.0-4.56
kapitel: "4.4.5.1"
kapitel_titel: "Primäre operative Therapie der Axilla"
empfehlung_nr: "4.56"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Das operative axilläre Staging soll mit Hilfe der Sentinellymphknoten-Exzision
  (SLNE) bei palpatorisch und bildmorphologisch unauffälligem Lymphknotenstatus
  erfolgen.

datenobjekte:
  - name: "Sentinellymphknoten-Exzision (SLNE) durchgeführt"
    beschreibung: "Ob eine SLNE als axilläres Staging-Verfahren durchgeführt wurde"
    datentyp: "boolean"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Klinischer Lymphknotenstatus (cN)"
    beschreibung: "Palpatorischer und bildmorphologischer Lymphknotenstatus"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "cN0 (unauffällig) | cN+ (auffällig)"
    verpflichtung: "obligat"

  - name: "Anzahl entfernter Sentinel-Lymphknoten"
    beschreibung: "Gesamtzahl der entfernten Sentinel-Lymphknoten"
    datentyp: "integer"
    verpflichtung: "obligat"

  - name: "Sentinel-Lymphknoten-Befund"
    beschreibung: "Histologischer Befund der Sentinel-Lymphknoten"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "negativ | Mikrometastase (> 0.2 bis 2.0 mm) | Makrometastase (> 2.0 mm) | isolierte Tumorzellen (ITC, <= 0.2 mm)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code + Observation"
  status: "partial"
  anmerkung: "SLNE als Prozedur kodierbar. Detaillierte Sentinel-Befunde (Anzahl, Klassifikation der Metastasen) nicht als eigenständige Observations modelliert. Differenzierung Makro-/Mikrometastase/ITC als FHIR-Element fehlt."

referenzen:
  s3_literatur: ["530", "531"]
  verwandte_empfehlungen: ["4.55", "4.57", "4.59", "4.60"]
```

### Empfehlung 4.57

```yaml
id: S3-5.0-4.57
kapitel: "4.4.5.1"
kapitel_titel: "Primäre operative Therapie der Axilla"
empfehlung_nr: "4.57"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei postmenopausalen Patientinnen >= 50 Jahre mit cT1 cN0 HR+ HER2- G1-2-Tu-
  moren, die eine brusterhaltende Operation mit anschließender perkutaner Ganz-
  brustbestrahlung und adäquater Systemtherapie erhalten, kann auf das operative
  axilläre Staging verzichtet werden.

datenobjekte:
  - name: "Menopausenstatus"
    beschreibung: "Postmenopausaler Status der Patientin"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
    wertebereich: "prämenopausal | postmenopausal"
    verpflichtung: "obligat"

  - name: "Alter"
    beschreibung: "Alter der Patientin (>= 50 Jahre als Kriterium)"
    datentyp: "Quantity (Jahre)"
    verpflichtung: "obligat"

  - name: "cT-Kategorie"
    beschreibung: "Klinische Tumorkategorie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "cT1"
    verpflichtung: "obligat"

  - name: "cN-Kategorie"
    beschreibung: "Klinischer Lymphknotenstatus"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "cN0"
    verpflichtung: "obligat"

  - name: "Hormonrezeptor-Status"
    beschreibung: "HR-positiv als Voraussetzung"
    datentyp: "CodeableConcept"
    wertebereich: "HR+"
    verpflichtung: "obligat"

  - name: "HER2-Status"
    beschreibung: "HER2-negativ als Voraussetzung"
    datentyp: "CodeableConcept"
    wertebereich: "HER2-"
    verpflichtung: "obligat"

  - name: "Grading"
    beschreibung: "Histologischer Differenzierungsgrad G1-2"
    datentyp: "CodeableConcept"
    wertebereich: "G1 | G2"
    verpflichtung: "obligat"

  - name: "Verzicht auf axilläres Staging"
    beschreibung: "Dokumentation des Verzichts auf operatives axilläres Staging"
    datentyp: "boolean"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_OP_Planung"
  element: "ServiceRequest + Procedure"
  status: "partial"
  anmerkung: "Komplexe Entscheidungslogik (Alter + Menopause + cT1 + cN0 + HR+ + HER2- + G1-2 + BET + WBI + Systemtherapie) basiert auf SOUND/INSEMA-Studien. Einzelne Parameter über verschiedene Ressourcen verfügbar, aber die klinische Entscheidungsregel als strukturierte Abfrage nicht formalisiert."

referenzen:
  s3_literatur: ["532", "533", "462"]
  verwandte_empfehlungen: ["4.56", "4.58"]
```

### Empfehlung 4.58

```yaml
id: S3-5.0-4.58
kapitel: "4.4.5.1"
kapitel_titel: "Primäre operative Therapie der Axilla"
empfehlung_nr: "4.58"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen >= 70 Jahre mit cT1, cN0, HR+ HER2- Tumoren kann unabhängig
  von der Art der Brustoperation auf das operative axilläre Staging verzichtet wer-
  den.

datenobjekte:
  - name: "Alter"
    beschreibung: "Alter der Patientin (>= 70 Jahre als Kriterium)"
    datentyp: "Quantity (Jahre)"
    verpflichtung: "obligat"

  - name: "cT-Kategorie"
    beschreibung: "Klinische Tumorkategorie cT1"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "cN-Kategorie"
    beschreibung: "Klinischer Lymphknotenstatus cN0"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Hormonrezeptor-Status"
    beschreibung: "HR-positiv als Voraussetzung"
    datentyp: "CodeableConcept"
    wertebereich: "HR+"
    verpflichtung: "obligat"

  - name: "HER2-Status"
    beschreibung: "HER2-negativ als Voraussetzung"
    datentyp: "CodeableConcept"
    wertebereich: "HER2-"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation / Senologie_OP_Planung"
  element: "ServiceRequest + Procedure"
  status: "partial"
  anmerkung: "Analog zu 4.57, aber mit erweitertem Alters-Kriterium (>= 70) und ohne Grading-Einschränkung. Unabhängig von OP-Art (BET oder Mastektomie)."

referenzen:
  verwandte_empfehlungen: ["4.57"]
```

### Empfehlung 4.59

```yaml
id: S3-5.0-4.59
kapitel: "4.4.5.1"
kapitel_titel: "Primäre operative Therapie der Axilla"
empfehlung_nr: "4.59"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei ausschließlicher Mikrometastasierung soll auf eine gezielte Therapie der Lymph-
  abflussgebiete (Operation, Radiotherapie) verzichtet werden.

datenobjekte:
  - name: "Art der Lymphknoten-Metastasierung"
    beschreibung: "Klassifikation der Metastasierung im Sentinel-Lymphknoten"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "Makrometastase (> 2.0 mm) | Mikrometastase (> 0.2-2.0 mm, pN1mi) | ITC (<= 0.2 mm, pN0(i+))"
    verpflichtung: "obligat"

  - name: "Verzicht auf Axilladissektion bei Mikrometastase"
    beschreibung: "Dokumentation des Therapieverzichts bei ausschließlicher Mikrometastasierung"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei pN1mi (ausschließlich Mikrometastasen)"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure + Observation"
  status: "partial"
  anmerkung: "Differenzierung Makro-/Mikrometastase/ITC im Sentinel-Befund muss als strukturiertes Datenobjekt verfügbar sein. Entscheidungsregel (Verzicht bei Mikrometastase) nicht formalisiert."

referenzen:
  s3_literatur: ["534", "535"]
  verwandte_empfehlungen: ["4.56", "4.60"]
```

### Empfehlung 4.60

```yaml
id: S3-5.0-4.60
kapitel: "4.4.5.1"
kapitel_titel: "Primäre operative Therapie der Axilla"
empfehlung_nr: "4.60"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit pT1-pT3/cN0-Tumoren, die eine brusterhaltende Operation
  mit anschließender perkutaner Ganzbrustbestrahlung erhalten und einen oder
  zwei positive Sentinel-Lymphknoten aufweisen, sollte auf eine Axilladissektion
  verzichtet werden.

datenobjekte:
  - name: "pT-Kategorie"
    beschreibung: "Pathologische Tumorkategorie pT1-pT3"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "pT1 | pT2 | pT3"
    verpflichtung: "obligat"

  - name: "cN-Status präoperativ"
    beschreibung: "Klinischer Lymphknotenstatus cN0"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Anzahl positiver Sentinel-Lymphknoten"
    beschreibung: "Zahl der befallenen SLN (1-2 als Kriterium)"
    datentyp: "integer"
    wertebereich: "1-2"
    verpflichtung: "obligat"

  - name: "Art der Brustoperation"
    beschreibung: "BET als Voraussetzung für den Verzicht auf ALND"
    datentyp: "CodeableConcept"
    wertebereich: "BET (brusterhaltend)"
    verpflichtung: "obligat"

  - name: "Ganzbrustbestrahlung geplant"
    beschreibung: "Perkutane Ganzbrustbestrahlung als adjuvante Maßnahme geplant"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Verzicht auf Axilladissektion"
    beschreibung: "Dokumentation des Verzichts auf ALND"
    datentyp: "boolean"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure + Observation"
  status: "partial"
  anmerkung: "ACOSOG Z0011-Kriterien: pT1-3, cN0, BET, WBI, 1-2 positive SLN. Komplexe Entscheidungslogik über mehrere Ressourcen verteilt. Anzahl positiver SLN als eigenständige Observation erforderlich."

referenzen:
  s3_literatur: ["536", "537", "538"]
  verwandte_empfehlungen: ["4.56", "4.59", "4.61"]
```

### Empfehlung 4.61

```yaml
id: S3-5.0-4.61
kapitel: "4.4.5.1"
kapitel_titel: "Primäre operative Therapie der Axilla"
empfehlung_nr: "4.61"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit pT1-pT3/cN0-Tumoren, die eine Mastektomie mit anschlie-
  ßender Bestrahlung erhalten und einen oder zwei positive Sentinel-Lymphknoten
  aufweisen, sollte auf eine Axilladissektion verzichtet werden.

datenobjekte:
  - name: "pT-Kategorie"
    beschreibung: "Pathologische Tumorkategorie pT1-pT3"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "pT1 | pT2 | pT3"
    verpflichtung: "obligat"

  - name: "cN-Status präoperativ"
    beschreibung: "Klinischer Lymphknotenstatus cN0"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    verpflichtung: "obligat"

  - name: "Anzahl positiver Sentinel-Lymphknoten"
    beschreibung: "Zahl der befallenen SLN (1-2)"
    datentyp: "integer"
    wertebereich: "1-2"
    verpflichtung: "obligat"

  - name: "Art der Brustoperation"
    beschreibung: "Mastektomie als OP-Art"
    datentyp: "CodeableConcept"
    wertebereich: "Mastektomie"
    verpflichtung: "obligat"

  - name: "Adjuvante Bestrahlung geplant"
    beschreibung: "Nachfolgende Bestrahlung geplant"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure + Observation"
  status: "partial"
  anmerkung: "Analog zu 4.60, aber für Mastektomie-Patientinnen (SENOMAC/AMAROS-Daten). Gleiche Datenelemente erforderlich."

referenzen:
  s3_literatur: ["536", "537"]
  verwandte_empfehlungen: ["4.60"]
```

### 4.4.5.2 Operation der Axilla nach primär systemischer Therapie

### Empfehlung 4.62

```yaml
id: S3-5.0-4.62
kapitel: "4.4.5.2"
kapitel_titel: "Operation der Axilla nach primär systemischer Therapie"
empfehlung_nr: "4.62"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen, die eine primär systemische Therapie (PST) erhalten, und präthe-
  rapeutisch einen palpatorisch und sonographisch negativen Lymphknotenstatus
  (cN0) aufweisen, soll die SLNE nach der PST durchgeführt werden.

datenobjekte:
  - name: "Primär systemische Therapie (PST) erhalten"
    beschreibung: "Durchführung einer neoadjuvanten Systemtherapie"
    datentyp: "boolean"
    verpflichtung: "obligat"

  - name: "Prätherapeutischer Lymphknotenstatus (cN)"
    beschreibung: "Lymphknotenstatus vor PST (palpatorisch und sonographisch)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "cN0 (unauffällig)"
    verpflichtung: "obligat"

  - name: "Zeitpunkt SLNE"
    beschreibung: "SLNE nach Abschluss der PST (nicht vor PST)"
    datentyp: "CodeableConcept"
    wertebereich: "nach PST"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code + Procedure.partOf/reasonReference"
  status: "partial"
  anmerkung: "SLNE als Procedure nach PST kodierbar. Zeitliche Abfolge (SLNE nach PST) über Procedure.partOf oder zeitliche Referenz abbildbar, aber nicht explizit als Geschäftsregel modelliert."

referenzen:
  s3_literatur: ["545", "546"]
  verwandte_empfehlungen: ["4.56", "4.63", "4.64"]
```

### Empfehlung 4.63

```yaml
id: S3-5.0-4.63
kapitel: "4.4.5.2"
kapitel_titel: "Operation der Axilla nach primär systemischer Therapie"
empfehlung_nr: "4.63"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen, die eine primär systemische Therapie (PST) erhalten und präthe-
  rapeutisch einen stanzbioptisch positiven Nodalstatus und nach der PST einen kli-
  nisch negativen Nodalstatus (ycN0) aufweisen, soll entweder eine 'Targeted axil-
  lary dissection' (TAD) oder eine Axilladissektion erfolgen.

datenobjekte:
  - name: "Prätherapeutischer Nodalstatus (bioptisch)"
    beschreibung: "Stanzbioptisch gesicherter positiver Lymphknotenbefall vor PST"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "cN+ (bioptisch gesichert)"
    verpflichtung: "obligat"

  - name: "Nodalstatus nach PST (ycN)"
    beschreibung: "Klinischer Lymphknotenstatus nach primärer Systemtherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "ycN0 (klinisch negativ nach PST)"
    verpflichtung: "obligat"

  - name: "Markierung des Lymphknotens vor PST"
    beschreibung: "Markierung der initial befallenen Lymphknoten (Clip, Seed, Farbstoff)"
    datentyp: "CodeableConcept"
    wertebereich: "Clip | Seed | Farbstoffpartikel"
    verpflichtung: "empfohlen"
    bedingung: "Bei geplanter TAD"

  - name: "Art des axillären Eingriffs nach PST"
    beschreibung: "Targeted Axillary Dissection (TAD) oder Axilladissektion (ALND)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    wertebereich: "TAD (Targeted Axillary Dissection) | ALND (Axilladissektion)"
    verpflichtung: "obligat"

  - name: "Pathologischer Nodalstatus nach PST (ypN)"
    beschreibung: "Histologisches Ergebnis nach axillärem Eingriff post-PST"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "ypN0 | ypN0(i+) | ypN1mi | ypN1a | ypN2 | ypN3"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code + Observation"
  status: "partial"
  anmerkung: "TAD als neues Verfahren nicht spezifisch in vs-senologie-operation-art enthalten. Markierung der LK vor PST als Extension/Procedure nicht modelliert. Konversion von cN+ zu ycN0 unter PST als klinische Verlaufsbeobachtung nicht strukturiert abgebildet."

referenzen:
  s3_literatur: ["547", "548"]
  verwandte_empfehlungen: ["4.62", "4.64"]
```

### Empfehlung 4.64

```yaml
id: S3-5.0-4.64
kapitel: "4.4.5.2"
kapitel_titel: "Operation der Axilla nach primär systemischer Therapie"
empfehlung_nr: "4.64"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprüft 2025"
text: >
  Bei Patientinnen, die eine primär systemische Therapie (PST) erhalten und vor und
  nach der PST einen positiven Nodalstatus aufweisen, soll eine Axilladissektion
  durchgeführt werden.

datenobjekte:
  - name: "Prätherapeutischer Nodalstatus"
    beschreibung: "Positiver Lymphknotenstatus vor PST"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "cN+ (positiv)"
    verpflichtung: "obligat"

  - name: "Nodalstatus nach PST"
    beschreibung: "Persistierend positiver Lymphknotenstatus nach PST"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "leitlinie"
    wertebereich: "ycN+ (persistierend positiv)"
    verpflichtung: "obligat"

  - name: "Axilladissektion (ALND) durchgeführt"
    beschreibung: "Durchführung einer vollständigen Axilladissektion"
    datentyp: "boolean"
    terminologie:
      system: "OPS"
      version: "2025"
      mapping_quelle: "standard"
    verpflichtung: "obligat"

  - name: "Anzahl entfernter Lymphknoten (ALND)"
    beschreibung: "Gesamtzahl der bei ALND entfernten Lymphknoten"
    datentyp: "integer"
    verpflichtung: "obligat"

  - name: "Anzahl befallener Lymphknoten (ALND)"
    beschreibung: "Anzahl der metastatisch befallenen Lymphknoten"
    datentyp: "integer"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Operation"
  element: "Procedure.code + Observation"
  status: "partial"
  anmerkung: "ALND als Procedure kodierbar. Lymphknoten-Befund (Anzahl entfernt/befallen) als Observations erforderlich. Persistierender Nodalstatus trotz PST als klinische Verlaufsbeobachtung nicht strukturiert."

referenzen:
  verwandte_empfehlungen: ["4.62", "4.63"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 4.4

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.44 | R0-Resektion als Therapiebasis | partial | R-Klassifikation als strukturiertes Outcome-Element sicherstellen |
| 4.45 | Resektionsrandstatus (Statement) | partial | Metrischer Sicherheitsabstand als Observation ergänzen |
| 4.46 | BET vs. Mastektomie (Äquivalenz) | mapped | Operationsart über vs-senologie-brustop-art abgebildet |
| 4.47 | Aufklärung OP-Optionen | partial | Consent-Ressource für OP-Aufklärung (BET/Mastektomie/Rekonstruktion) |
| 4.48 | Multizentrisch - Verzicht Mastektomie | partial | Multifokalität/Multizentrizität als Datenobjekt ergänzen |
| 4.49 | Präoperative Markierung nicht-palpabler Läsionen | mapped | Extension ex-senologie-pre-op-markierung vorhanden |
| 4.50 | Intraoperative Sonographie | **gap** | Neue Extension/Procedure für intraoperativen Ultraschall |
| 4.51 | Mastektomie-Indikationen | partial | Strukturierte Indikationscodes (reasonCode) für Mastektomie-Gründe |
| 4.52 | Mastektomie-Typ (SSM/NSM/MRM) | partial | Differenzierung SSM/NSM/MRM in vs-senologie-brustop-art prüfen; MAK-Erhalt als Element |
| 4.53 | Kontralaterale risiko-reduzierende Mastektomie | partial | Verknüpfung mit Mutationsstatus/familiärer Risikosituation |
| 4.54 | Aufklärung Rekonstruktion | partial | Eigengewebe-Rekonstruktionen nicht profiliert; Aufklärung als Consent |
| 4.55 | Verzicht axilläres Staging bei M1 | partial | Entscheidungslogik (Verzicht bei Fernmetastasen) nicht formalisiert |
| 4.56 | SLNE als Staging-Standard | partial | Sentinel-Befund (Makro-/Mikrometastase/ITC) als Observation ergänzen |
| 4.57 | Verzicht SLNE (>= 50J, cT1cN0, HR+HER2-, G1-2) | partial | Komplexe Entscheidungslogik; Datenobjekte verteilt vorhanden |
| 4.58 | Verzicht SLNE (>= 70J, cT1cN0, HR+HER2-) | partial | Analog 4.57, erweitertes Alterskriterium |
| 4.59 | Verzicht ALND bei Mikrometastase | partial | Differenzierung Makro-/Mikrometastase/ITC im SLN-Befund |
| 4.60 | Verzicht ALND bei 1-2 pos. SLN + BET + WBI | partial | Anzahl positiver SLN als eigenständige Observation |
| 4.61 | Verzicht ALND bei 1-2 pos. SLN + Mastektomie | partial | Analog 4.60 für Mastektomie-Patientinnen |
| 4.62 | SLNE nach PST bei cN0 | partial | Zeitliche Abfolge PST-SLNE als Prozess-Modell |
| 4.63 | TAD/ALND nach PST bei initialem cN+ -> ycN0 | partial | **TAD als neues Verfahren** in ValueSet ergänzen; LK-Markierung vor PST modellieren |
| 4.64 | ALND bei persistierend cN+ nach PST | partial | Lymphknotenbefall-Verlauf (vor/nach PST) als strukturierte Observations |

### Priorisierte Gaps

| Priorität | Gap | Betroffene Empfehlungen | Vorgeschlagene Lösung |
|-----------|-----|------------------------|----------------------|
| **Hoch** | SLN-Befund-Differenzierung (Makro-/Mikrometastase/ITC) | 4.56, 4.59, 4.60, 4.61 | Neue Observation "Senologie_Sentinel_Befund" mit Components für Anzahl, Metastasenklassifikation |
| **Hoch** | TAD als OP-Verfahren | 4.63 | Ergänzung von vs-senologie-operation-art um TAD-Code; Modellierung der LK-Markierung vor PST |
| **Hoch** | Intraoperative Sonographie | 4.50 | Extension oder verknüpfte Procedure für intraoperativen Ultraschall |
| **Mittel** | Mastektomie-Typ-Differenzierung (MRM/SSM/NSM) | 4.52 | Prüfung und ggf. Erweiterung von vs-senologie-brustop-art |
| **Mittel** | Resektionsrand-Details (metrisch) | 4.44, 4.45 | Observation mit Quantity-Component für minimalen Sicherheitsabstand |
| **Mittel** | Aufklärung OP-Optionen + Rekonstruktion | 4.47, 4.54 | Consent-Profil für operative Aufklärung |
| **Mittel** | Multifokalität/Multizentrizität | 4.48 | Condition-Extension oder Observation für multi-fokale/-zentrische Befunde |
| **Niedrig** | Entscheidungslogik Axilla-Staging-Verzicht | 4.57, 4.58 | CDS-Regeln (Clinical Decision Support), nicht FHIR-Profil |
| **Niedrig** | PST-Response im Nodalstatus (cN+ -> ycN0) | 4.62, 4.63, 4.64 | Staging-Verlauf als verknüpfte Observations vor/nach PST |
