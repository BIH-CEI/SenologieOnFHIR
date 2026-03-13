# S3-Leitlinie v5.0 - Kapitel 4.8: Systemische Therapie fruhes Mammakarzinom

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 179-206
> Kapitelstruktur: 4.8.1 Allgemeine Empfehlungen und Therapieentscheidungen | 4.8.2 Hormonrezeptor-positives Mammakarzinom (HR+) | 4.8.3 Chemotherapie Triple-negatives Mammakarzinom (TNBC) | 4.8.4 HER2-positives Mammakarzinom (HER2+) | 4.8.5 Knochengerichtete Therapie

---

## 4.8.1 Allgemeine Empfehlungen und Therapieentscheidungen

### Empfehlung 4.137

```yaml
id: S3-5.0-4.137
kapitel: "4.8.1"
kapitel_titel: "Allgemeine Empfehlungen und Therapieentscheidungen"
empfehlung_nr: "4.137"
typ: "Evidenzbasiert"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Zytostatika koennen zeitlich simultan oder sequenziell verabreicht werden (entsprechend
  evidenzbasierter Protokolle).
  Bei hohem tumorbedingtem Mortalitaetsrisiko und dafuer geeigneten Patientinnen
  sollten dosisdichte Therapien eingesetzt werden.

datenobjekte:
  - name: "Chemotherapie-Applikationsmodus"
    beschreibung: "Zeitliche Abfolge der Zytostatikagabe (simultan vs. sequenziell)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "simultan | sequenziell"
    verpflichtung: "obligat"

  - name: "Dosisdichte Therapie"
    beschreibung: "Angabe, ob ein dosisdichtes Regime angewendet wird"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "Bei hohem Mortalitaetsrisiko"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.extension (ex-senologie-therapy-protocol)"
  status: "partial"
  anmerkung: "Therapieprotokoll-Extension vorhanden, aber Applikationsmodus (simultan/sequenziell) und dosisdicht nicht explizit modelliert."

referenzen:
  s3_literatur: ["999", "1000"]
  verwandte_empfehlungen: ["4.138", "4.139"]
```

### Empfehlung 4.138

```yaml
id: S3-5.0-4.138
kapitel: "4.8.1"
kapitel_titel: "Allgemeine Empfehlungen und Therapieentscheidungen"
empfehlung_nr: "4.138"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit lokal fortgeschrittenem, primaer inoperablem oder inflammatorischem
  Mammakarzinom soll eine neoadjuvante (primaere, praeoperative) systemische Therapie
  im Rahmen eines multimodalen Therapiekonzeptes durchgefuehrt werden.

datenobjekte:
  - name: "Therapie-Setting"
    beschreibung: "Neoadjuvant (praeoperativ) vs. adjuvant (postoperativ)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "neo-adjuvant - 373847000"
      display: "Neo-adjuvant - Loss of therapeutic intent (qualifier value)"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "neoadjuvant | adjuvant"
    verpflichtung: "obligat"

  - name: "Indikation neoadjuvante Therapie"
    beschreibung: "Klinische Indikation fuer neoadjuvante systemische Therapie"
    datentyp: "CodeableConcept"
    wertebereich: "lokal fortgeschritten | primaer inoperabel | inflammatorisch"
    verpflichtung: "obligat"
    bedingung: "Bei neoadjuvantem Setting"

  - name: "Multimodales Therapiekonzept"
    beschreibung: "Angabe, dass die Therapie in ein multimodales Konzept eingebettet ist"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Geplante_Systemtherapie"
  element: "ServiceRequest.intent / ServiceRequest.category"
  status: "partial"
  anmerkung: "Therapie-Setting (neo-/adjuvant) nicht explizit als Kategorie modelliert. Tumorboard-Empfehlung (CarePlan) koennte multimodales Konzept abbilden."

referenzen:
  verwandte_empfehlungen: ["4.137", "4.139"]
```

### Empfehlung 4.139

```yaml
id: S3-5.0-4.139
kapitel: "4.8.1"
kapitel_titel: "Allgemeine Empfehlungen und Therapieentscheidungen"
empfehlung_nr: "4.139"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Ist eine Chemotherapie indiziert, kann diese vor der Operation (neoadjuvant) oder
  danach (adjuvant) durchgefuehrt werden. Beide Verfahren sind hinsichtlich des
  Gesamtueberlebens gleichwertig.
  Die neoadjuvante Therapie kann zu einer hoeheren Rate an brusterhaltenden Therapien
  fuehren und erlaubt basierend auf das Therapieansprechen eine risikoadaptierte
  postneoadjuvante Therapie. Diese kann mit einem Ueberlebensvorteil assoziiert sein.

datenobjekte:
  - name: "Therapie-Timing"
    beschreibung: "Zeitpunkt der Chemotherapie relativ zur Operation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "neoadjuvant (praeoperativ) | adjuvant (postoperativ)"
    verpflichtung: "obligat"

  - name: "Pathologisches Ansprechen (pCR)"
    beschreibung: "Pathologische Komplettremission nach neoadjuvanter Therapie (ypT0/is ypN0)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "pCR (ypT0/is ypN0) | non-pCR"
    verpflichtung: "obligat"
    bedingung: "Nach neoadjuvanter Therapie"

  - name: "Postneoadjuvante Therapie"
    beschreibung: "Risikoadaptierte Anschlusstherapie nach neoadjuvanter Behandlung"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"
    bedingung: "Bei non-pCR nach neoadjuvanter Therapie"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure + Senologie_Geplante_Systemtherapie"
  element: "Procedure.category / ServiceRequest"
  status: "partial"
  anmerkung: "Therapie-Setting vorhanden, aber pCR-Bewertung und postneoadjuvante Therapiesteuerung nicht explizit modelliert. pCR ist zentral fuer Therapieentscheidungen bei TNBC und HER2+."

referenzen:
  s3_literatur: ["454", "998", "383"]
  verwandte_empfehlungen: ["4.137", "4.138"]
```

---

## 4.8.2 Hormonrezeptor-positives Mammakarzinom (HR+)

### Empfehlung 4.140

```yaml
id: S3-5.0-4.140
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+) - Indikationen fuer eine endokrine Therapie"
empfehlung_nr: "4.140"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit Hormonrezeptor-positiven invasiven Tumoren sollen eine endokrine
  Therapie erhalten.

datenobjekte:
  - name: "Hormonrezeptor-Status"
    beschreibung: "ER- und/oder PR-Positivitaet als Voraussetzung fuer endokrine Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85337-4"
      display: "Estrogen receptor Ag [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"

  - name: "Endokrine Therapie indiziert"
    beschreibung: "Indikationsstellung zur endokrinen Therapie"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei HR-positiven Tumoren"

  - name: "Art der endokrinen Therapie"
    beschreibung: "Substanzklasse der endokrinen Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Tamoxifen (L02BA01) |
      Anastrozol (L02BG03) |
      Letrozol (L02BG04) |
      Exemestan (L02BG06) |
      GnRH-Agonisten: Goserelin (L02AE03), Leuprorelin (L02AE02)
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Geplante_Systemtherapie + Senologie_SystemischeTherapie_Procedure"
  element: "ServiceRequest.code / Procedure.code"
  status: "partial"
  anmerkung: "Endokrine Therapie als Prozedur modellierbar. Spezifische Medikamente erfordern MedicationRequest/MedicationAdministration, die nicht im Senologie-Profil enthalten sind."

referenzen:
  s3_literatur: ["261", "1002", "1003", "1004"]
  verwandte_empfehlungen: ["4.141", "4.142", "4.143"]
```

### Empfehlung 4.141

```yaml
id: S3-5.0-4.141
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.141"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Eine endokrine Therapie soll erst nach Abschluss der Chemotherapie begonnen
  werden, kann aber parallel zur Strahlentherapie erfolgen.

datenobjekte:
  - name: "Sequenz endokrine Therapie / Chemotherapie"
    beschreibung: "Zeitliche Abfolge: Endokrine Therapie nach Chemotherapie"
    datentyp: "CodeableConcept"
    wertebereich: "sequenziell nach Chemotherapie | parallel zur Strahlentherapie"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_Geplante_Systemtherapie"
  element: "ServiceRequest / CarePlan (Sequenzierung)"
  status: "gap"
  anmerkung: "Therapiesequenzierung (zeitliche Abfolge verschiedener Modalitaeten) ist nicht explizit modelliert. Erfordert CarePlan mit zeitlich geordneten Aktivitaeten."

referenzen:
  s3_literatur: ["1005", "1002", "1003", "261", "1004"]
  verwandte_empfehlungen: ["4.140"]
```

### Empfehlung 4.142

```yaml
id: S3-5.0-4.142
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.142"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die alleinige Ovarialsuppression kann entweder durch Gabe eines GnRHa oder
  durch eine bilaterale Ovarektomie fuer praemenopausale Frauen mit einem
  Oestrogenrezeptor-positiven Mammakarzinom erwogen werden, die kein Tamoxifen
  erhalten koennen oder wollen.

datenobjekte:
  - name: "Ovarialsuppression"
    beschreibung: "Art der ovariellen Funktionssuppression"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC / SNOMED CT"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      GnRH-Agonist: Goserelin (ATC L02AE03) | Leuprorelin (ATC L02AE02) |
      Bilaterale Ovarektomie (SNOMED CT 29827000)
    verpflichtung: "optional"
    bedingung: "Praemenopausale Patientinnen, die kein Tamoxifen erhalten koennen/wollen"

  - name: "Menopausenstatus"
    beschreibung: "Praeemenopausal vs. postmenopausal"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "praemenopausal | postmenopausal | perimenopausal"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Ovarialsuppression als Prozedur modellierbar. Menopausenstatus als eigene Observation nicht explizit vorhanden."

referenzen:
  s3_literatur: ["1013"]
  verwandte_empfehlungen: ["4.140", "4.146"]
```

### Empfehlung 4.143

```yaml
id: S3-5.0-4.143
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.143"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die adjuvante endokrine Therapie fuer postmenopausale Patientinnen mit einem
  Oestrogenrezeptor-positiven Mammakarzinom sollte einen Aromatasehemmer enthalten.

datenobjekte:
  - name: "Aromatasehemmer"
    beschreibung: "Einsatz eines Aromatasehemmers in der adjuvanten endokrinen Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Anastrozol (L02BG03) |
      Letrozol (L02BG04) |
      Exemestan (L02BG06)
    verpflichtung: "empfohlen"
    bedingung: "Postmenopausale Patientinnen mit ER-positivem Mammakarzinom"

  - name: "Therapiedauer endokrine Therapie"
    beschreibung: "Dauer der adjuvanten endokrinen Therapie"
    datentyp: "Quantity (Jahre)"
    wertebereich: "5-10 Jahre (Standard 5 Jahre, erweitert 7-8 Jahre bei erhoehtem Rezidivrisiko)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + Procedure.period"
  status: "partial"
  anmerkung: "Therapiedauer ueber Procedure.period abbildbar. Spezifische Medikamentenwahl erfordert MedicationRequest."

referenzen:
  s3_literatur: ["1019"]
  verwandte_empfehlungen: ["4.140", "4.148"]
```

### Empfehlung 4.144

```yaml
id: S3-5.0-4.144
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.144"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Die neoadjuvante endokrine Therapie ist keine Standardtherapie, in speziellen
  Situationen (fehlende Indikation zur (neo)adjuvanten Chemotherapie, inoperable
  Tumore bei multimorbiden Patientinnen) kann eine neoadjuvante endokrine Therapie
  erwogen werden.

datenobjekte:
  - name: "Neoadjuvante endokrine Therapie"
    beschreibung: "Indikation und Durchfuehrung einer neoadjuvanten endokrinen Therapie"
    datentyp: "boolean"
    verpflichtung: "optional"
    bedingung: "Inoperable Tumore, Multimorbiditaet, keine Chemotherapie-Indikation"

fhir_mapping:
  profil: "Senologie_Geplante_Systemtherapie"
  element: "ServiceRequest.intent + ServiceRequest.category"
  status: "partial"
  anmerkung: "Neoadjuvantes Setting als Kategorie nicht differenziert."

referenzen:
  s3_literatur: ["1029"]
  verwandte_empfehlungen: ["4.140", "4.145"]
```

### Empfehlung 4.145

```yaml
id: S3-5.0-4.145
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.145"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Die Messung des Ki67 nach 2-4 woechiger praeoperativer endokriner (Induktions-)therapie
  ermoeglicht die fruehe Abschaetzung der Sensitivitaet gegenueber der praeoperativ
  eingesetzten endokrinen Therapie. Ein postendokrines Ki67 <= 10% ist mit einer
  verbesserten Prognose (vs. Ki67 > 10%) assoziiert.

datenobjekte:
  - name: "Ki67 postendokrin"
    beschreibung: "Ki67-Proliferationsindex nach 2-4 Wochen praeoperativer endokriner Therapie"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85336-6"
      display: "MIB-1 (Ki-67) [Percentile] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "<= 10% (gutes Ansprechen) | > 10% (schlechtes Ansprechen)"
    verpflichtung: "empfohlen"
    bedingung: "Nach 2-4 Wochen neoadjuvanter endokriner Therapie"

  - name: "Zeitpunkt Ki67-Messung"
    beschreibung: "Zeitpunkt der Ki67-Bestimmung relativ zum Therapiebeginn"
    datentyp: "Quantity (Wochen)"
    wertebereich: "2-4 Wochen nach Therapiebeginn"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Pathologie_Befund"
  element: "Observation (Ki67)"
  status: "partial"
  anmerkung: "Ki67-Observation vorhanden, aber zeitlicher Bezug zur Induktionstherapie (praeendokrin vs. postendokrin) nicht modelliert."

referenzen:
  s3_literatur: ["625", "638", "1030"]
  verwandte_empfehlungen: ["4.144"]
```

### Empfehlung 4.146

```yaml
id: S3-5.0-4.146
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.146"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Eine adjuvante endokrine Therapie sollte bei praemenopausalen Patientinnen mit
  erhoehtem Rezidivrisiko eine ovarielle Suppression (2-5 Jahre in Kombination mit
  Tamoxifen oder 5 Jahre in Kombination mit einem Aromataseinhibitor) beinhalten.

datenobjekte:
  - name: "Ovarielle Suppression (OFS)"
    beschreibung: "Ovarian Function Suppression als Bestandteil der endokrinen Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Goserelin (L02AE03) | Leuprorelin (L02AE02)"
    verpflichtung: "empfohlen"
    bedingung: "Praemenopausale Patientinnen mit erhoehtem Rezidivrisiko"

  - name: "OFS-Dauer"
    beschreibung: "Dauer der ovariellen Suppression"
    datentyp: "Quantity (Jahre)"
    wertebereich: "2-5 Jahre (abhaengig von Kombinationspartner)"
    verpflichtung: "empfohlen"

  - name: "Kombinationspartner OFS"
    beschreibung: "Endokrine Substanz in Kombination mit OFS"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Tamoxifen (L02BA01) | Aromatasehemmer (L02BG)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Kombinationstherapie (OFS + Tamoxifen/AI) erfordert mehrere MedicationRequests. Therapielinie und Dauer ueber Extensions abbildbar."

referenzen:
  s3_literatur: ["1031"]
  verwandte_empfehlungen: ["4.140", "4.142", "4.147"]
```

### Empfehlung 4.147

```yaml
id: S3-5.0-4.147
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.147"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Bei praemenopausalen Patientinnen mit erhoehtem Rezidivrisiko ist der Einsatz der
  Aromatasehemmer vs. Tamoxifen in Kombination mit der ovariellen Suppression
  mit einem geringeren Rezidivrisiko, jedoch noch ohne nachweisbaren Effekt auf
  das Gesamtueberleben assoziiert.

datenobjekte:
  - name: "Wahl endokrine Substanz bei OFS"
    beschreibung: "Auswahl Aromatasehemmer vs. Tamoxifen bei praemenopausalen Patientinnen mit OFS"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Aromatasehemmer (L02BG) | Tamoxifen (L02BA01)"
    verpflichtung: "empfohlen"
    bedingung: "Praemenopausale Patientinnen mit OFS und erhoehtem Rezidivrisiko"

fhir_mapping:
  profil: "Senologie_Geplante_Systemtherapie"
  status: "partial"
  anmerkung: "Therapieempfehlung ueber ServiceRequest modellierbar, Substanzwahl erfordert MedicationRequest."

referenzen:
  verwandte_empfehlungen: ["4.146"]
```

### Empfehlung 4.148

```yaml
id: S3-5.0-4.148
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+)"
empfehlung_nr: "4.148"
typ: "Evidenzbasiert"
empfehlungsgrad: "-"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei postmenopausalen Patientinnen soll die Aromatasehemmer-haltige endokrine
  Therapie mindestens 5 Jahre und bei Patientinnen mit einem erhoehten Rezidivrisiko
  bis zu 7-8 Jahre betragen. Eine ueber diesen Zeitraum hinausgehende endokrine
  Therapie ist lediglich mit einem geringeren Risiko fuer das Auftreten eines
  kontralateralen Mammakarzinoms assoziiert.

datenobjekte:
  - name: "Therapiedauer AI-haltige endokrine Therapie"
    beschreibung: "Dauer der Aromatasehemmer-haltigen endokrinen Therapie"
    datentyp: "Quantity (Jahre)"
    wertebereich: "5 Jahre (Standard) | 7-8 Jahre (erhoehtes Rezidivrisiko) | >8 Jahre (nur kontralaterales Risiko)"
    verpflichtung: "obligat"

  - name: "Rezidivrisiko-Stratifizierung"
    beschreibung: "Einschaetzung des individuellen Rezidivrisikos fuer Therapiedauer-Entscheidung"
    datentyp: "CodeableConcept"
    wertebereich: "niedrig | mittel | hoch"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.period"
  status: "partial"
  anmerkung: "Therapiedauer ueber Period modellierbar. Risikostratifizierung als Entscheidungsgrundlage nicht modelliert."

referenzen:
  s3_literatur: ["1032"]
  verwandte_empfehlungen: ["4.143"]
```

### Empfehlung 4.149 (CDK4/6-Inhibitoren)

```yaml
id: S3-5.0-4.149
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+) - CDK4/6-Inhibitoren"
empfehlung_nr: "4.149"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (hoch bis niedrig)"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit HR+/HER2-Mammakarzinom und hohem Rueckfallrisiko (bei
  N2-3 oder N1 mit G3 oder Tumorgroesse >/= 5cm) sollte Abemaciclib fuer 2 Jahre in
  Kombination mit der endokrinen Standard-Therapie oder Ribociclib (bei N+,
  oder N0 T3/T4, oder N0 T2 G3 oder N0 T2 G2 und (Ki-67 >= 20 % oder high-risk
  Genexpression)) fuer 3 Jahre in Kombination mit einem Aromatasehemmer (+ OFS
  bei praemenopausalen Patientinnen) durchgefuehrt werden. Beide Medikamente fuehren
  zur Senkung der Rezidivwahrscheinlichkeit.

datenobjekte:
  - name: "Abemaciclib"
    beschreibung: "CDK4/6-Inhibitor Abemaciclib als adjuvante Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EF03"
      display: "Abemaciclib"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "HR+/HER2-, N2-3 oder N1 mit G3 oder Tumorgroesse >=5cm"

  - name: "Ribociclib"
    beschreibung: "CDK4/6-Inhibitor Ribociclib als adjuvante Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EF02"
      display: "Ribociclib"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "HR+/HER2-, N+ oder N0 T3/T4 oder N0 T2 G3 oder N0 T2 G2 und Ki67>=20%/high-risk Genexpression"

  - name: "CDK4/6-Inhibitor Therapiedauer"
    beschreibung: "Dauer der adjuvanten CDK4/6-Inhibitor-Therapie"
    datentyp: "Quantity (Jahre)"
    wertebereich: "Abemaciclib: 2 Jahre | Ribociclib: 3 Jahre"
    verpflichtung: "empfohlen"

  - name: "Risikostratifizierung fuer CDK4/6-Inhibitor"
    beschreibung: "Kriterien fuer hohes Rueckfallrisiko (Nodalstatus, Grading, Tumorgroesse, Ki67, Genexpression)"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"
    bedingung: "Entscheidungsgrundlage fuer CDK4/6-Inhibitor-Indikation"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure + Senologie_Geplante_Systemtherapie"
  status: "partial"
  anmerkung: >
    CDK4/6-Inhibitoren als adjuvante Therapie sind neu. Medikamente erfordern
    MedicationRequest/MedicationAdministration. Risikostratifizierung (N-Status, Grading,
    Ki67, Genexpression) als Entscheidungsalgorithmus nicht formalisiert im Profil.

referenzen:
  s3_literatur: ["1033", "540", "1034", "539"]
  verwandte_empfehlungen: ["4.140", "4.146", "4.150"]
```

### Empfehlung 4.150 (Olaparib bei HR+/HER2-)

```yaml
id: S3-5.0-4.150
kapitel: "4.8.2"
kapitel_titel: "Hormonrezeptor-positives Mammakarzinom (HR+) - PARP-Inhibitoren"
empfehlung_nr: "4.150"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (hoch bis niedrig)"
konsensstaerke: "Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit Hormonrezeptor-positivem und HER2/neu negativem
  Mammakarzinom mit hohem Rueckfallrisiko (z.B. N2-3 oder CPS Score >=3 nach
  neoadjuvanter Chemotherapie) und einer Keimbahn BRCA1/2 Mutation sollte Olaparib
  fuer 1 Jahr in Kombination mit der endokrinen Standard-Therapie durchgefuehrt werden.

datenobjekte:
  - name: "Olaparib"
    beschreibung: "PARP-Inhibitor Olaparib als adjuvante Therapie bei gBRCA1/2-Mutation"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01XK01"
      display: "Olaparib"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "HR+/HER2-, hohes Rueckfallrisiko, gBRCA1/2-Mutation"

  - name: "BRCA1/2-Keimbahnmutationsstatus"
    beschreibung: "Pathogene Keimbahnmutation in BRCA1 oder BRCA2"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "BRCA1 pathogen | BRCA2 pathogen | keine pathogene Mutation"
    verpflichtung: "obligat"
    bedingung: "Voraussetzung fuer Olaparib-Indikation"

  - name: "CPS Score (nach NACT)"
    beschreibung: "Clinical-Pathologic Staging Score nach neoadjuvanter Chemotherapie"
    datentyp: "integer"
    wertebereich: ">= 3 (hohes Rezidivrisiko)"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "gap"
  anmerkung: >
    PARP-Inhibitor-Therapie und genetische Stratifizierung (gBRCA) nicht im
    Senologie-Profil modelliert. BRCA-Status erfordert Genomics Reporting IG.
    CPS-Score als postneoadjuvanter Risikoparameter fehlt.

referenzen:
  s3_literatur: ["1033", "177", "1035"]
  verwandte_empfehlungen: ["4.149", "4.156"]
```

---

## 4.8.3 Chemotherapie Triple-negatives Mammakarzinom (TNBC)

### Empfehlung 4.151

```yaml
id: S3-5.0-4.151
kapitel: "4.8.3"
kapitel_titel: "Chemotherapie Triple-negatives Mammakarzinom (TNBC)"
empfehlung_nr: "4.151"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit triple-negativem Mammakarzinom (TNBC) im Stadium II-III
  sollten Platinsalze zusaetzlich zu einer Kombinationschemotherapie unabhaengig
  vom BRCA-Status eingesetzt werden.

datenobjekte:
  - name: "Platinsalz"
    beschreibung: "Platin-basierte Chemotherapie bei TNBC"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Carboplatin (L01XA02) |
      Cisplatin (L01XA01)
    verpflichtung: "empfohlen"
    bedingung: "TNBC Stadium II-III"

  - name: "TNBC-Subtyp"
    beschreibung: "Triple-negativer Brustkrebs (ER-, PR-, HER2-)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

  - name: "UICC-Stadium"
    beschreibung: "Tumorstadium gemaess UICC"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "Stadium II | Stadium III"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-protocol"
  status: "partial"
  anmerkung: "Chemotherapie-Regime abbildbar ueber Therapieprotokoll-Extension. Spezifische Substanzkombinationen erfordern MedicationRequest."

referenzen:
  s3_literatur: ["1036"]
  verwandte_empfehlungen: ["4.152", "4.153", "4.154"]
```

### Empfehlung 4.152

```yaml
id: S3-5.0-4.152
kapitel: "4.8.3"
kapitel_titel: "Chemotherapie Triple-negatives Mammakarzinom (TNBC)"
empfehlung_nr: "4.152"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit triple-negativem Mammakarzinom (TNBC) Tumor >10mm
  und nodal negativ sollte eine Chemotherapie durchgefuehrt werden.

datenobjekte:
  - name: "Tumorgroesse"
    beschreibung: "Groesster Tumordurchmesser als Entscheidungskriterium"
    datentyp: "Quantity (mm)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "21889-1"
      display: "Size Tumor"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "> 10 mm"
    verpflichtung: "obligat"

  - name: "Nodalstatus"
    beschreibung: "Lymphknotenstatus"
    datentyp: "CodeableConcept"
    terminologie:
      system: "UICC TNM"
      version: "8. Auflage (2017)"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "pN0 (nodal negativ)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Indikationsstellung basiert auf Tumorgroesse und Nodalstatus, die ueber Pathologie-Befund verfuegbar sind."

referenzen:
  s3_literatur: ["1037"]
  verwandte_empfehlungen: ["4.151"]
```

### Empfehlung 4.153 (Dosisdichte Chemotherapie)

```yaml
id: S3-5.0-4.153
kapitel: "4.8.3"
kapitel_titel: "Chemotherapie Triple-negatives Mammakarzinom (TNBC) - Dosisdichte Chemotherapie"
empfehlung_nr: "4.153"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Sofern bei Patientinnen mit triple-negativem Mammakarzinom (TNBC) die Indikation
  zu einer alleinigen Anthrazyklin-/taxanhaltigen Chemotherapie besteht, sollte
  diese dosisdicht erfolgen.

datenobjekte:
  - name: "Dosisdichte Chemotherapie"
    beschreibung: "Dosisdichtes Regime (2-woechentlich statt 3-woechentlich) bei TNBC"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "TNBC mit alleiniger Anthrazyklin-/Taxan-Chemotherapie"

  - name: "Chemotherapie-Regime TNBC"
    beschreibung: "Art des Chemotherapie-Regimes"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Anthrazykline: Doxorubicin (L01DB01), Epirubicin (L01DB03) |
      Taxane: Paclitaxel (L01CD01), Docetaxel (L01CD02) |
      Cyclophosphamid (L01AA01)
    verpflichtung: "obligat"

  - name: "Zyklusintervall"
    beschreibung: "Intervall zwischen den Chemotherapie-Zyklen"
    datentyp: "Quantity (Wochen)"
    wertebereich: "2 Wochen (dosisdicht) | 3 Wochen (konventionell)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "ex-senologie-therapy-cycle + ex-senologie-day-in-cycle"
  status: "partial"
  anmerkung: "Zyklus-Extensions vorhanden. Dosisdichtes vs. konventionelles Schema koennte ueber Therapieprotokoll-Extension differenziert werden."

referenzen:
  s3_literatur: ["999"]
  verwandte_empfehlungen: ["4.137", "4.151"]
```

### Empfehlung 4.154 (Immuncheckpoint-Inhibitoren)

```yaml
id: S3-5.0-4.154
kapitel: "4.8.3"
kapitel_titel: "Chemotherapie Triple-negatives Mammakarzinom (TNBC) - Immuncheckpointinhibitoren"
empfehlung_nr: "4.154"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (hoch bis niedrig)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit einem triple-negativem Mammakarzinom (TNBC) groesser 2 cm
  oder mit Lymphknotenbefall sollten den ICPi Pembrolizumab in Kombination mit
  einer neoadjuvanten Chemotherapie mit Anthrazyklin/Taxan/Carboplatin erhalten.
  Das Therapie sollte postoperativ mit 9 Zyklen adjuvant Pembrolizumab fortgesetzt werden.

datenobjekte:
  - name: "Pembrolizumab"
    beschreibung: "PD-1-Inhibitor Pembrolizumab als neoadjuvante/adjuvante Immuntherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FF02"
      display: "Pembrolizumab"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "TNBC > 2 cm oder N+"

  - name: "Neoadjuvantes Chemotherapie-Regime"
    beschreibung: "Chemotherapie-Kombination mit Immuntherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Anthrazyklin (L01DB) + Taxan (L01CD) + Carboplatin (L01XA02)
    verpflichtung: "empfohlen"

  - name: "Adjuvante Pembrolizumab-Zyklen"
    beschreibung: "Anzahl postoperativer Pembrolizumab-Zyklen"
    datentyp: "integer"
    wertebereich: "9 Zyklen"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-cycle"
  status: "partial"
  anmerkung: >
    Immuntherapie (Checkpoint-Inhibitoren) als neue Substanzklasse. Neoadjuvant/adjuvant-Sequenz
    mit Zykluszahl modellierbar ueber Extensions. MedicationRequest fuer Pembrolizumab
    nicht spezifisch vorhanden.

referenzen:
  s3_literatur: ["1033", "930", "1038", "1039"]
  verwandte_empfehlungen: ["4.151", "4.155", "4.156"]
```

### Empfehlung 4.155 (Capecitabin-Erhaltung)

```yaml
id: S3-5.0-4.155
kapitel: "4.8.3"
kapitel_titel: "Chemotherapie Triple-negatives Mammakarzinom (TNBC) - Erhaltungstherapie mit Capecitabin"
empfehlung_nr: "4.155"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit einem triple-negativen Mammakarzinom (TNBC) mit non-pCR
  nach Anthrazyklin- / taxanhaltiger Chemotherapie sollten adjuvant Capecitabin
  fuer 6-8 Zyklen erhalten.

datenobjekte:
  - name: "Capecitabin"
    beschreibung: "Orale Chemotherapie als postneoadjuvante Erhaltungstherapie bei non-pCR"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01BC06"
      display: "Capecitabin"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "TNBC mit non-pCR nach neoadjuvanter Anthrazyklin-/Taxan-Chemotherapie"

  - name: "Capecitabin-Zyklen"
    beschreibung: "Anzahl der adjuvanten Capecitabin-Zyklen"
    datentyp: "integer"
    wertebereich: "6-8 Zyklen"
    verpflichtung: "empfohlen"

  - name: "pCR-Status nach NACT"
    beschreibung: "Pathologisches Ansprechen nach neoadjuvanter Chemotherapie"
    datentyp: "CodeableConcept"
    wertebereich: "pCR | non-pCR"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-cycle + ex-senologie-therapy-status"
  status: "partial"
  anmerkung: "Postneoadjuvante Therapie abbildbar. Bezug zum pCR-Ergebnis als Indikationskriterium nicht formalisiert."

referenzen:
  s3_literatur: ["1040", "1041"]
  verwandte_empfehlungen: ["4.154", "4.156"]
```

### Empfehlung 4.156 (Olaparib bei TNBC)

```yaml
id: S3-5.0-4.156
kapitel: "4.8.3"
kapitel_titel: "Chemotherapie Triple-negatives Mammakarzinom (TNBC) - (Post)neoadjuvante Therapie bei gBRCA-1/2 Mutation"
empfehlung_nr: "4.156"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "GRADE (hoch bis niedrig)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit einem triple-negativem Mammakarzinom (TNBC) und pathogener
  BRCA-1 oder BRCA-2 Keimbahnmutation, die nach neoadjuvanter Chemotherapie
  keine pCR erreicht haben oder die ein hohes Risiko nach primaerer Operation aufweisen
  (> pT2, und/oder >pN1), sollten Olaparib ueber 1 Jahr erhalten.

datenobjekte:
  - name: "Olaparib"
    beschreibung: "PARP-Inhibitor Olaparib als postneoadjuvante/adjuvante Therapie bei gBRCA-mutiertem TNBC"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01XK01"
      display: "Olaparib"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "TNBC + gBRCA1/2-Mutation + non-pCR oder hohes Risiko (>pT2 und/oder >pN1)"

  - name: "Olaparib Therapiedauer"
    beschreibung: "Dauer der Olaparib-Therapie"
    datentyp: "Quantity (Jahre)"
    wertebereich: "1 Jahr"
    verpflichtung: "empfohlen"

  - name: "BRCA1/2-Keimbahnmutationsstatus"
    beschreibung: "Pathogene Keimbahnmutation in BRCA1 oder BRCA2"
    datentyp: "CodeableConcept"
    terminologie:
      system: "HGNC"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "BRCA1 pathogen | BRCA2 pathogen"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "gap"
  anmerkung: >
    PARP-Inhibitor-Therapie nicht im Senologie-Profil modelliert. BRCA-Status
    erfordert Genomics Reporting IG. pCR als Entscheidungskriterium fuer
    postneoadjuvante Therapie nicht formalisiert.

referenzen:
  s3_literatur: ["1033", "177"]
  verwandte_empfehlungen: ["4.150", "4.154", "4.155"]
```

---

## 4.8.4 HER2-positives Mammakarzinom (HER2+)

### Empfehlung 4.157

```yaml
id: S3-5.0-4.157
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.157"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch Score
  3+ oder Score 2+ und ISH-positiv) mit einem Durchmesser >1 cm sollen eine
  Chemotherapie mit einer anti-HER2-gerichteten Therapie erhalten.

datenobjekte:
  - name: "HER2-Status"
    beschreibung: "HER2-Positivitaet als Voraussetzung fuer anti-HER2-Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "85319-2"
      display: "HER2 [Presence] in Breast cancer specimen by Immune stain"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "IHC 3+ | IHC 2+ und ISH-positiv"
    verpflichtung: "obligat"

  - name: "Trastuzumab"
    beschreibung: "Anti-HER2-Antikoerper als Standardtherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD01"
      display: "Trastuzumab"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "HER2-positiv, Tumorgroesse > 1 cm"

  - name: "Tumorgroesse"
    beschreibung: "Tumordurchmesser als Indikationskriterium"
    datentyp: "Quantity (cm)"
    wertebereich: "> 1 cm"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure + Senologie_Geplante_Systemtherapie"
  element: "Procedure.code / ServiceRequest.code"
  status: "partial"
  anmerkung: "Anti-HER2-Therapie als Prozedur modellierbar. Spezifische Medikamente (Trastuzumab) erfordern MedicationRequest."

referenzen:
  s3_literatur: ["1042"]
  verwandte_empfehlungen: ["4.158", "4.159", "4.160", "4.161"]
```

### Empfehlung 4.158

```yaml
id: S3-5.0-4.158
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.158"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch
  Score 3+ oder Score 2+ und ISH-positiv) und einer Tumorgroesse ab 6 mm sollte
  eine Chemotherapie in Kombination mit einer anti-HER2-gerichteten Therapie
  durchgefuehrt werden.

datenobjekte:
  - name: "Tumorgroesse (Schwellenwert)"
    beschreibung: "Tumordurchmesser ab 6 mm als Indikation fuer anti-HER2-Therapie"
    datentyp: "Quantity (mm)"
    wertebereich: ">= 6 mm"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  status: "partial"
  anmerkung: "Ergaenzung zu 4.157 fuer kleinere Tumoren (6mm-10mm). Gleiche Profilstruktur."

referenzen:
  verwandte_empfehlungen: ["4.157", "4.160"]
```

### Empfehlung 4.159

```yaml
id: S3-5.0-4.159
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.159"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Bei Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch
  Score 3+ oder Score 2+ und ISH-positiv) sollte die adjuvante Behandlung mit
  Trastuzumab vorzugsweise simultan mit der Taxan-Phase der adjuvanten
  Chemotherapie begonnen werden.

datenobjekte:
  - name: "Trastuzumab-Timing"
    beschreibung: "Simultaner Beginn von Trastuzumab mit Taxan-Phase"
    datentyp: "CodeableConcept"
    wertebereich: "simultan mit Taxan-Phase | sequenziell nach Chemotherapie"
    verpflichtung: "empfohlen"

  - name: "Taxan-Phase"
    beschreibung: "Taxan-haltige Phase der Chemotherapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Paclitaxel (L01CD01) | Docetaxel (L01CD02)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-protocol"
  status: "partial"
  anmerkung: "Simultane vs. sequenzielle Gabe von Trastuzumab mit Chemotherapie nicht explizit als Timing-Element modelliert."

referenzen:
  s3_literatur: ["1043"]
  verwandte_empfehlungen: ["4.157", "4.164"]
```

### Empfehlung 4.160 (Deeskalation bei kleinen Tumoren)

```yaml
id: S3-5.0-4.160
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.160"
typ: "Evidenzbasiert"
empfehlungsgrad: "A/0"
evidenzlevel: "4"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch Score
  3+ oder 2+ und ISH-positiv) und klinischer Tumorgroesse <= 2cm sowie klinisch und
  sonographisch negativem axillaeren Lymphknotenstatus kann eine primaere Operation
  angeboten werden, um eine Deeskalation der Systemtherapie in Form von
  Paclitaxel in Kombination mit Trastuzumab ueber 12 Wochen zu ermoeglichen.
  Trastuzumab soll ueber eine Gesamtdauer von einem Jahr verabreicht werden.

datenobjekte:
  - name: "Deeskaliertes Regime (Paclitaxel + Trastuzumab)"
    beschreibung: "12 Wochen Paclitaxel + Trastuzumab bei kleinen HER2+ Tumoren"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: "Paclitaxel (L01CD01) + Trastuzumab (L01FD01)"
    verpflichtung: "optional"
    bedingung: "HER2+, Tumorgroesse <= 2 cm, cN0"

  - name: "Trastuzumab Gesamtdauer"
    beschreibung: "Gesamtdauer der Trastuzumab-Therapie"
    datentyp: "Quantity (Monate)"
    wertebereich: "12 Monate (1 Jahr)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + Procedure.period"
  status: "partial"
  anmerkung: "Deeskaliertes Regime als Therapieprotokoll modellierbar. Therapiedauer ueber Period."

referenzen:
  s3_literatur: ["1055", "1056"]
  verwandte_empfehlungen: ["4.157", "4.158", "4.164"]
```

### Empfehlung 4.161 (Neoadjuvante Therapie mit Pertuzumab)

```yaml
id: S3-5.0-4.161
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.161"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch Score
  3+ oder 2+ und ISH-positiv) mit einem Durchmesser > 2 cm und/oder positivem
  Nodalstatus (klinisch bzw. sonographisch oder bioptisch) sollten eine neoadjuvante
  Chemotherapie in Kombination mit Trastuzumab und Pertuzumab erhalten.

datenobjekte:
  - name: "Trastuzumab"
    beschreibung: "Anti-HER2-Antikoerper"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD01"
      display: "Trastuzumab"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "HER2+, > 2 cm und/oder N+"

  - name: "Pertuzumab"
    beschreibung: "Anti-HER2-Antikoerper (duale Blockade)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD02"
      display: "Pertuzumab"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "HER2+, > 2 cm und/oder N+"

  - name: "Neoadjuvante Chemotherapie-Kombination"
    beschreibung: "Chemotherapie-Regime in Kombination mit dualer Anti-HER2-Blockade"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Anthrazyklin-/Taxan-haltig: z.B. EC/AC gefolgt von Docetaxel |
      Anthrazyklinfrei: TCH (Docetaxel + Carboplatin + Trastuzumab)
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-protocol"
  status: "partial"
  anmerkung: "Duale Anti-HER2-Blockade (Trastuzumab + Pertuzumab) als Kombinationstherapie. MedicationRequests fuer Einzelsubstanzen nicht vorhanden."

referenzen:
  s3_literatur: ["1057", "1058"]
  verwandte_empfehlungen: ["4.157", "4.162", "4.163"]
```

### Empfehlung 4.162

```yaml
id: S3-5.0-4.162
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.162"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch Score
  3+ oder 2+ und ISH-positiv) und histopathologischer Komplettremission sollen
  weiterhin Trastuzumab erhalten, bis eine Gesamtdauer von einem Jahr erreicht
  ist. Bei initial klinisch oder pathohistologisch nachgewiesenem ipsilateralen axillaeren
  Lymphknotenbefall, kann diese Therapie mit Pertuzumab ueber die Gesamtdauer
  von einem Jahr kombiniert werden.

datenobjekte:
  - name: "Postneoadjuvante Therapie bei pCR"
    beschreibung: "Fortsetzung Trastuzumab (+/- Pertuzumab) bei pCR"
    datentyp: "CodeableConcept"
    wertebereich: "Trastuzumab mono (1 Jahr gesamt) | Trastuzumab + Pertuzumab (1 Jahr gesamt, bei initial N+)"
    verpflichtung: "obligat"
    bedingung: "HER2+ mit pCR nach NACT"

  - name: "Initialer Lymphknotenbefall"
    beschreibung: "Lymphknotenstatus vor neoadjuvanter Therapie"
    datentyp: "CodeableConcept"
    wertebereich: "N+ (klinisch/bioptisch) | N0"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-protocol + ex-senologie-therapy-status"
  status: "partial"
  anmerkung: "Postneoadjuvante Therapiesteuerung basierend auf pCR-Status und initialem N-Status. Erfordert Bezug zu praetherap. Staging."

referenzen:
  s3_literatur: ["1059", "1060"]
  verwandte_empfehlungen: ["4.161", "4.165"]
```

### Empfehlung 4.163

```yaml
id: S3-5.0-4.163
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.163"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch
  Score 3+ oder 2+ und ISH-positiv) kommen als Therapieregime Anthrazyklin-/
  taxanhaltige Schemata oder Anthrazyklinfreie Regime (Taxane, Carboplatin,
  Trastuzumab +/- Pertuzumab) zum Einsatz.

datenobjekte:
  - name: "Chemotherapie-Schema bei HER2+"
    beschreibung: "Auswahl des Chemotherapie-Regimes bei HER2-positivem Mammakarzinom"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Anthrazyklin-/Taxan-haltig: z.B. EC-TH, FEC-THP |
      Anthrazyklinfrei: TCH (Docetaxel L01CD02 + Carboplatin L01XA02 + Trastuzumab L01FD01),
      TCHP (+ Pertuzumab L01FD02)
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "ex-senologie-therapy-protocol"
  status: "partial"
  anmerkung: "Therapieschemata ueber Therapieprotokoll-Extension modellierbar. Standardisierte Schemabezeichnungen (EC-TH, TCH, TCHP) koennen als CodeSystem definiert werden."

referenzen:
  s3_literatur: ["1061", "1062", "1063", "1064", "1065"]
  verwandte_empfehlungen: ["4.157", "4.161"]
```

### Empfehlung 4.164 (Trastuzumab-Dauer)

```yaml
id: S3-5.0-4.164
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.164"
typ: "Evidenzbasiert"
empfehlungsgrad: "B/0"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Trastuzumab sollte insgesamt fuer 12 Monate verabreicht werden. Eine kuerzere
  Dauer von 6 Monaten kann im Falle von niedrigem Risiko oder kardialen
  Komorbiditaeten erwogen werden.

datenobjekte:
  - name: "Trastuzumab-Therapiedauer"
    beschreibung: "Gesamtdauer der Trastuzumab-Therapie"
    datentyp: "Quantity (Monate)"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD01"
      display: "Trastuzumab"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: "12 Monate (Standard) | 6 Monate (Deeskalation bei niedrigem Risiko/kardialen Komorbiditaeten)"
    verpflichtung: "empfohlen"

  - name: "Kardiale Funktion (LVEF)"
    beschreibung: "Linksventrikluaere Ejektionsfraktion zur Ueberwachung der Kardiotoxizitaet"
    datentyp: "Quantity (%)"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "10230-1"
      display: "Left ventricular Ejection fraction"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "Unter Trastuzumab-Therapie"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.period"
  status: "partial"
  anmerkung: "Therapiedauer ueber Period. LVEF-Monitoring als begleitende Observation nicht im Senologie-Profil, aber ueber Standard-Observation modellierbar."

referenzen:
  verwandte_empfehlungen: ["4.157", "4.159", "4.160"]
```

### Empfehlung 4.165 (T-DM1 bei non-pCR)

```yaml
id: S3-5.0-4.165
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.165"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch Score
  3+ oder 2+ und ISH-positiv) und nicht erreichter histologischer Komplettremission
  (non-pCR) nach einem Anthrazyklin- oder Taxan-basierten Chemotherapieschema
  in Kombination mit anti-HER2 gerichteter Therapie sollen als postneoadjuvante
  Therapie 14 Zyklen Trastuzumab-Emtansin erhalten.

datenobjekte:
  - name: "Trastuzumab-Emtansin (T-DM1)"
    beschreibung: "Antikoerper-Wirkstoff-Konjugat als postneoadjuvante Therapie bei non-pCR"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01FD03"
      display: "Trastuzumab emtansin"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "obligat"
    bedingung: "HER2+ mit non-pCR nach neoadjuvanter Chemotherapie + anti-HER2-Therapie"

  - name: "T-DM1 Zyklen"
    beschreibung: "Anzahl der postneoadjuvanten T-DM1-Zyklen"
    datentyp: "integer"
    wertebereich: "14 Zyklen"
    verpflichtung: "obligat"

  - name: "pCR-Status"
    beschreibung: "Pathologisches Ansprechen nach NACT als Entscheidungskriterium"
    datentyp: "CodeableConcept"
    wertebereich: "non-pCR (Residualtumor)"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-cycle"
  status: "partial"
  anmerkung: >
    T-DM1 als ADC (Antibody-Drug Conjugate) neue Substanzklasse. Postneoadjuvante
    Therapiesteuerung basierend auf pCR-Status. MedicationRequest fuer T-DM1
    nicht spezifisch vorhanden, aber ueber ATC-Code modellierbar.

referenzen:
  s3_literatur: ["1067", "925"]
  verwandte_empfehlungen: ["4.162"]
```

### Empfehlung 4.166 (Neratinib)

```yaml
id: S3-5.0-4.166
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.166"
typ: "Evidenzbasiert"
empfehlungsgrad: "0"
evidenzlevel: "GRADE (hoch bis niedrig)"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Patientinnen mit hormonrezeptor-positiven, HER2-positiven Mammakarzinomen
  (immunhistochemisch Score 3+ oder 2+ und ISH-positiv) im Stadium II bis III kann
  nach adjuvanter anti-HER2-gerichteten Therapie mit Trastuzumab allein eine erweiterte
  (postneo-) adjuvante Therapie mit Neratinib fuer ein Jahr angeboten werden.
  Patientinnen mit Tumoren unter 2 cm sollten nicht mit Neratinib behandelt werden.

datenobjekte:
  - name: "Neratinib"
    beschreibung: "Tyrosinkinase-Inhibitor als erweiterte adjuvante Therapie bei HR+/HER2+"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "L01EH04"
      display: "Neratinib"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "optional"
    bedingung: "HR+/HER2+, Stadium II-III, Tumorgroesse >= 2 cm, nach Trastuzumab"

  - name: "Neratinib Therapiedauer"
    beschreibung: "Dauer der erweiterten adjuvanten Neratinib-Therapie"
    datentyp: "Quantity (Jahre)"
    wertebereich: "1 Jahr"
    verpflichtung: "optional"

fhir_mapping:
  profil: "Senologie_SystemischeTherapie_Procedure"
  element: "Procedure.code + ex-senologie-therapy-line"
  status: "partial"
  anmerkung: "Erweiterte adjuvante Therapie als eigene Therapielinie. Neratinib als orale Substanz ueber MedicationRequest modellierbar."

referenzen:
  s3_literatur: ["1033", "1068", "1069"]
  verwandte_empfehlungen: ["4.157", "4.165"]
```

### Empfehlung 4.167

```yaml
id: S3-5.0-4.167
kapitel: "4.8.4"
kapitel_titel: "HER2-positives Mammakarzinom (HER2+)"
empfehlung_nr: "4.167"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "neu 2025"
text: >
  Bei hormonrezeptor-positiven HER2-positiven Mammakarzinomen (immunhistochemisch
  Score 3+ oder 2+ und ISH-positiv) sollte die endokrine Therapie im adjuvanten
  Setting parallel zu Trastuzumab, Trastuzumab / Pertuzumab bzw. T-DM1
  gegeben werden.

datenobjekte:
  - name: "Parallele endokrine Therapie"
    beschreibung: "Endokrine Therapie parallel zur anti-HER2-Therapie bei HR+/HER2+"
    datentyp: "boolean"
    verpflichtung: "empfohlen"
    bedingung: "HR+/HER2+ im adjuvanten Setting"

  - name: "Anti-HER2-Therapie (Kombinationspartner)"
    beschreibung: "Laufende anti-HER2-Therapie parallel zur endokrinen Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "standard"
      validiert: false
    wertebereich: >
      Trastuzumab (L01FD01) |
      Trastuzumab + Pertuzumab (L01FD01 + L01FD02) |
      Trastuzumab emtansin / T-DM1 (L01FD03)
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "Senologie_Geplante_Systemtherapie"
  status: "gap"
  anmerkung: "Parallele Therapiemodalitaeten (endokrin + anti-HER2) erfordern CarePlan mit zeitgleichen Aktivitaeten. Nicht explizit modelliert."

referenzen:
  verwandte_empfehlungen: ["4.140", "4.157", "4.162", "4.165"]
```

---

## 4.8.5 Knochengerichtete Therapie

### Empfehlung 4.168

```yaml
id: S3-5.0-4.168
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie"
empfehlung_nr: "4.168"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit einem erhoehten Anamnese- oder Krebstherapie-basierten
  Risiko fuer einen Knochenverlust sollte zu Beginn der Therapie eine
  Knochendichtemessung durchgefuehrt werden.
  Abhaengig vom Ergebnis und Hinzukommen weiterer Risikofaktoren sollte die
  Knochendichtemessung wiederholt werden, falls davon eine Therapieaenderung
  abgeleitet werden kann.

datenobjekte:
  - name: "Knochendichtemessung (DXA)"
    beschreibung: "Dual-Roentgen-Absorptiometrie zur Bestimmung der Knochendichte"
    datentyp: "CodeableConcept"
    terminologie:
      system: "LOINC"
      version: "2.77"
      code: "38269-7"
      display: "DXA Bone density"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Erhoehtes Risiko fuer Knochenverlust"

  - name: "T-Score"
    beschreibung: "T-Score der Knochendichtemessung"
    datentyp: "Quantity"
    wertebereich: ">= -1.0 (normal) | -1.0 bis -2.5 (Osteopenie) | < -2.5 (Osteoporose)"
    verpflichtung: "empfohlen"

  - name: "Risikofaktoren Knochenverlust"
    beschreibung: "Krebstherapie-assoziierte Risikofaktoren fuer Knochendichteverlust"
    datentyp: "CodeableConcept"
    wertebereich: "Aromatasehemmer | Ovarielle Suppression | Chemotherapie | Kortisonpraeparate"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Knochendichtemessung und T-Score nicht im Senologie-Profil modelliert. Erfordert DiagnosticReport/Observation fuer DXA."

referenzen:
  verwandte_empfehlungen: ["4.169", "4.170", "4.171"]
```

### Empfehlung 4.169

```yaml
id: S3-5.0-4.169
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie"
empfehlung_nr: "4.169"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Zur Vermeidung von Krebstherapie-induzierten Osteoporose-assoziierten Frakturen
  sollte eine praeventive Behandlung in Abhaengigkeit der individuellen
  Risikokonstellation durchgefuehrt werden.

datenobjekte:
  - name: "Praeventive Osteoporose-Therapie"
    beschreibung: "Praeventive Behandlung zur Vermeidung therapie-induzierter Frakturen"
    datentyp: "CodeableConcept"
    wertebereich: "Bisphosphonate | Denosumab | Calcium/Vitamin D | Lebensstilmassnahmen"
    verpflichtung: "empfohlen"

  - name: "Individuelle Risikokonstellation"
    beschreibung: "Frakturrisiko-Einschaetzung (z.B. gemaess DVO-Leitlinie)"
    datentyp: "CodeableConcept"
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Osteoporose-Praevention nicht im Senologie-Profil modelliert. Verweis auf DVO-Leitlinie."

referenzen:
  verwandte_empfehlungen: ["4.168", "4.170"]
```

### Empfehlung 4.170

```yaml
id: S3-5.0-4.170
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie"
empfehlung_nr: "4.170"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "2"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei praemenopausalen Patientinnen mit GnRH-Agonisten und Tamoxifen oder einem
  AI und bei postmenopausalen Patientinnen unter Aromatasehemmertherapie
  soll die Indikation fuer eine knochenprotektive Therapie geprueft werden.

datenobjekte:
  - name: "Indikationspruefung knochenprotektive Therapie"
    beschreibung: "Dokumentation der Indikationspruefung fuer Knochenprotektion"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Praemenopausal mit GnRH + Tamoxifen/AI oder postmenopausal mit AI"

  - name: "Knochenprotektive Therapie"
    beschreibung: "Art der knochenprotektiven Therapie"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Bisphosphonate: Zoledronat (M05BA08) i.v. 4mg/6m |
      Denosumab (M05BX04) 60mg s.c./6m |
      Orale Bisphosphonate (M05BA)
    verpflichtung: "obligat"
    bedingung: "Bei positivem Indikationsergebnis"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Knochenprotektive Therapie nicht im Senologie-Profil modelliert. Erfordert eigene MedicationRequest/Procedure."

referenzen:
  s3_literatur: ["1072", "1075", "1077", "1084"]
  verwandte_empfehlungen: ["4.168", "4.169", "4.171", "4.175"]
```

### Empfehlung 4.171

```yaml
id: S3-5.0-4.171
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie"
empfehlung_nr: "4.171"
typ: "Evidenzbasiert"
empfehlungsgrad: "A"
evidenzlevel: "1"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Eine Hormontherapie mit Oestrogenen soll bei Brustkrebspatientinnen zur Praevention
  der Krebstherapie-assoziierten Osteoporose nicht eingesetzt werden, insbesondere
  bei Hormonrezeptor-positiver Erkrankung.

datenobjekte:
  - name: "Oestrogentherapie kontraindiziert"
    beschreibung: "Kontraindikation fuer Hormontherapie mit Oestrogenen bei Brustkrebspatientinnen"
    datentyp: "boolean"
    verpflichtung: "obligat"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Kontraindikation als eigenes Datenobjekt nicht modelliert. Koennte ueber AllergyIntolerance oder Flag abgebildet werden."

referenzen:
  s3_literatur: ["1085", "1086"]
  verwandte_empfehlungen: ["4.170"]
```

### Empfehlung 4.172

```yaml
id: S3-5.0-4.172
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie"
empfehlung_nr: "4.172"
typ: "Evidenzbasiert"
empfehlungsgrad: "-"
evidenzlevel: "1"
konsensstaerke: "Konsens"
status: "modifiziert 2025"
text: >
  Bei Patientinnen mit endokriner Therapie, die einen therapieassoziierten
  Knochenmasseverlust hervorruft, sollte eine Therapie mit Denosumab oder
  Bisphosphonaten zur Risikoreduzierung von Frakturen durchgefuehrt werden.

datenobjekte:
  - name: "Denosumab (Osteoporose-Dosis)"
    beschreibung: "RANKL-Inhibitor zur Frakturpraevention"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      code: "M05BX04"
      display: "Denosumab"
      mapping_quelle: "standard"
      validiert: false
    verpflichtung: "empfohlen"
    bedingung: "Therapieassoziierter Knochenmasseverlust"

  - name: "Bisphosphonat (Osteoporose-Dosis)"
    beschreibung: "Bisphosphonat zur Frakturpraevention"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Zoledronat (M05BA08) i.v. 4mg/6m |
      Alendronat (M05BA04) p.o. 70mg/w |
      Risedronat (M05BA07) p.o. 35mg/w |
      Ibandronat (M05BA06) p.o. 50mg/d
    verpflichtung: "empfohlen"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Osteoprotektive Therapie nicht im Senologie-Profil. Erfordert MedicationRequest."

referenzen:
  s3_literatur: ["1087", "1088"]
  verwandte_empfehlungen: ["4.170", "4.173"]
```

### Empfehlung 4.173

```yaml
id: S3-5.0-4.173
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie"
empfehlung_nr: "4.173"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei Beendigung der endokrinen Therapie soll auch die Indikation fuer eine
  begleitende osteoprotektive Therapie ueberprueft werden.

datenobjekte:
  - name: "Re-Evaluation Osteoprotektive Therapie"
    beschreibung: "Ueberpruefung der Indikation bei Therapieende"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Bei Beendigung der endokrinen Therapie"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Follow-up-Trigger bei Therapieende nicht modelliert."

referenzen:
  verwandte_empfehlungen: ["4.170", "4.172"]
```

### Empfehlung 4.174

```yaml
id: S3-5.0-4.174
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie - Therapie der Krebstherapie-induzierten Osteoporose"
empfehlung_nr: "4.174"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Wenn eine Fraktur ohne adaequates Trauma auftritt, soll eine Knochenmetastase
  ausgeschlossen werden.

datenobjekte:
  - name: "Pathologische Fraktur"
    beschreibung: "Fraktur ohne adaequates Trauma als Warnsignal fuer Knochenmetastase"
    datentyp: "CodeableConcept"
    terminologie:
      system: "SNOMED CT"
      version: "2025-01-31"
      code: "268029009"
      display: "Pathological fracture (disorder)"
      mapping_quelle: "vorschlag"
      validiert: false
    verpflichtung: "obligat"

  - name: "Ausschluss Knochenmetastase"
    beschreibung: "Diagnostik zum Ausschluss ossaerer Metastasen"
    datentyp: "CodeableConcept"
    verpflichtung: "obligat"
    bedingung: "Bei Fraktur ohne adaequates Trauma"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Pathologische Fraktur und Metastasen-Ausschluss nicht im Senologie-Profil modelliert."

referenzen:
  verwandte_empfehlungen: ["4.168", "4.175"]
```

### Empfehlung 4.175 (Adjuvante Bisphosphonat-Therapie)

```yaml
id: S3-5.0-4.175
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie - Adjuvante Therapie zur Verbesserung des knochenmetastasenfreien und Gesamtueberlebens"
empfehlung_nr: "4.175"
typ: "Evidenzbasiert"
empfehlungsgrad: "B"
evidenzlevel: "2"
konsensstaerke: "Starker Konsens"
status: "modifiziert 2025"
text: >
  Bei postmenopausalen Patientinnen unter Aromatase-Inhibitor Therapie sowie bei
  praemenopausalen Patientinnen unter Ovarsuppression sollte zur Verlaengerung des
  knochenmetastasenfreien Ueberlebens eine adjuvante Bisphosphonattherapie
  durchgefuehrt werden. *off-label use, siehe Hintergrundtext

datenobjekte:
  - name: "Adjuvante Bisphosphonattherapie"
    beschreibung: "Bisphosphonat zur Verbesserung des knochenmetastasenfreien Ueberlebens (off-label)"
    datentyp: "CodeableConcept"
    terminologie:
      system: "ATC"
      version: "2025"
      mapping_quelle: "vorschlag"
      validiert: false
    wertebereich: >
      Zoledronat (M05BA08) i.v. 4mg/6m |
      Clodronat (M05BA02) p.o. 1600mg/d |
      Ibandronat (M05BA06) p.o. 50mg/d
    verpflichtung: "empfohlen"
    bedingung: "Postmenopausal unter AI oder praemenopausal unter OFS"

  - name: "Off-Label-Use Dokumentation"
    beschreibung: "Dokumentation des Off-Label-Einsatzes der adjuvanten Bisphosphonattherapie"
    datentyp: "boolean"
    verpflichtung: "obligat"
    anmerkung: "Bisphosphonat nicht fuer adjuvante Indikation zugelassen in EU, aber GKV-erstattungsfaehig"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: >
    Adjuvante Bisphosphonattherapie zur Knochenmetastasen-Praevention nicht im
    Senologie-Profil. Erfordert MedicationRequest mit Off-Label-Kennzeichnung.
    Unterscheidung osteoprotektiv vs. antitumoeral wichtig.

referenzen:
  s3_literatur: ["1097", "1095", "1098"]
  verwandte_empfehlungen: ["4.170", "4.172"]
```

### Empfehlung 4.176

```yaml
id: S3-5.0-4.176
kapitel: "4.8.5"
kapitel_titel: "Knochengerichtete Therapie - Osteoprotektive Therapie"
empfehlung_nr: "4.176"
typ: "Konsensbasiert (EK)"
empfehlungsgrad: "EK"
evidenzlevel: "-"
konsensstaerke: "Starker Konsens"
status: "geprueft 2025"
text: >
  Vor Beginn einer adjuvanten osteoprotektiven Therapie soll eine Vorstellung bei
  einem Zahnarzt erfolgen. Ansonsten gelten die Empfehlungen der S3-Leitlinie zur
  "Antiresorptiva-assoziierte Kiefernekrosen".

datenobjekte:
  - name: "Zahnaerztliche Vorstellung"
    beschreibung: "Vorstellung beim Zahnarzt vor Beginn osteoprotektiver Therapie (Kiefernekrose-Praevention)"
    datentyp: "boolean"
    verpflichtung: "obligat"
    bedingung: "Vor Beginn Bisphosphonat-/Denosumab-Therapie"

fhir_mapping:
  profil: "-"
  status: "gap"
  anmerkung: "Zahnaerztliche Vorstellung als Voraussetzung fuer Therapiestart nicht modelliert. Koennte als ServiceRequest/Procedure (dental consultation) abgebildet werden."

referenzen:
  querschnittsleitlinien: ["S3-Leitlinie Antiresorptiva-assoziierte Kiefernekrosen"]
  verwandte_empfehlungen: ["4.170", "4.172", "4.175"]
```

---

## Zusammenfassung: Gap-Analyse Kapitel 4.8

### Medikamenten-Uebersicht mit ATC-Codes

| Substanz | ATC-Code | Substanzklasse | Empfehlungen |
|----------|----------|----------------|-------------|
| Tamoxifen | L02BA01 | SERM | 4.140, 4.142, 4.146, 4.147 |
| Anastrozol | L02BG03 | Aromatasehemmer | 4.140, 4.143 |
| Letrozol | L02BG04 | Aromatasehemmer | 4.140, 4.143 |
| Exemestan | L02BG06 | Aromatasehemmer | 4.140, 4.143 |
| Goserelin | L02AE03 | GnRH-Agonist | 4.142, 4.146 |
| Leuprorelin | L02AE02 | GnRH-Agonist | 4.142, 4.146 |
| Abemaciclib | L01EF03 | CDK4/6-Inhibitor | 4.149 |
| Ribociclib | L01EF02 | CDK4/6-Inhibitor | 4.149 |
| Olaparib | L01XK01 | PARP-Inhibitor | 4.150, 4.156 |
| Carboplatin | L01XA02 | Platinsalz | 4.151, 4.154, 4.163 |
| Cisplatin | L01XA01 | Platinsalz | 4.151 |
| Doxorubicin | L01DB01 | Anthrazyklin | 4.153 |
| Epirubicin | L01DB03 | Anthrazyklin | 4.153 |
| Paclitaxel | L01CD01 | Taxan | 4.153, 4.159, 4.160 |
| Docetaxel | L01CD02 | Taxan | 4.153, 4.159, 4.161 |
| Cyclophosphamid | L01AA01 | Alkylans | 4.153 |
| Pembrolizumab | L01FF02 | PD-1-Inhibitor | 4.154 |
| Capecitabin | L01BC06 | Antimetabolit | 4.155 |
| Trastuzumab | L01FD01 | Anti-HER2-AK | 4.157-4.164 |
| Pertuzumab | L01FD02 | Anti-HER2-AK | 4.161, 4.162, 4.163 |
| Trastuzumab emtansin (T-DM1) | L01FD03 | ADC | 4.165 |
| Neratinib | L01EH04 | TKI (HER2) | 4.166 |
| Zoledronat | M05BA08 | Bisphosphonat | 4.170, 4.172, 4.175 |
| Denosumab | M05BX04 | RANKL-Inhibitor | 4.172 |
| Alendronat | M05BA04 | Bisphosphonat | 4.175 |
| Risedronat | M05BA07 | Bisphosphonat | 4.175 |
| Ibandronat | M05BA06 | Bisphosphonat | 4.175 |
| Clodronat | M05BA02 | Bisphosphonat | 4.175 |

### FHIR-Mapping-Status

| Empfehlung | Thema | FHIR-Status | Handlungsbedarf |
|-----------|-------|-------------|-----------------|
| 4.137 | Applikationsmodus/Dosisdicht | partial | Applikationsmodus (simultan/sequenziell) in Therapieprotokoll ergaenzen |
| 4.138 | Neoadjuvante Indikation | partial | Therapie-Setting (neo-/adjuvant) als Kategorie modellieren |
| 4.139 | Neo-/adjuvant Timing, pCR | partial | pCR-Bewertung und postneoadjuvante Steuerung formalisieren |
| 4.140 | Endokrine Therapie Indikation | partial | MedicationRequest fuer endokrine Substanzen fehlt |
| 4.141 | Therapiesequenz | **gap** | Therapiesequenzierung (CarePlan mit zeitlich geordneten Aktivitaeten) |
| 4.142 | Ovarialsuppression | partial | Menopausenstatus als Observation, OFS-Methode |
| 4.143 | Aromatasehemmer postmenopausal | partial | Therapiedauer und Substanzwahl ueber MedicationRequest |
| 4.144 | Neoadjuvante endokrine Therapie | partial | Neoadjuvantes Setting differenzieren |
| 4.145 | Ki67 postendokrin | partial | Zeitlicher Bezug Ki67 zur Induktionstherapie |
| 4.146 | OFS bei praemenopausal | partial | OFS-Kombinationstherapie ueber MedicationRequest |
| 4.147 | AI vs. Tamoxifen bei OFS | partial | Substanzwahl-Dokumentation |
| 4.148 | Therapiedauer AI | partial | Risikostratifizierung fuer Therapiedauer |
| 4.149 | CDK4/6-Inhibitoren (Abemaciclib/Ribociclib) | partial | **Neue Substanzklasse** - MedicationRequest + Risikostratifizierung |
| 4.150 | Olaparib bei HR+/HER2-/gBRCA | **gap** | PARP-Inhibitor + Genomics Reporting (gBRCA) + CPS-Score |
| 4.151 | Platinsalze bei TNBC | partial | Substanzkombinationen ueber MedicationRequest |
| 4.152 | Chemotherapie bei kleinem TNBC | partial | Indikationskriterien (Tumorgroesse, N-Status) |
| 4.153 | Dosisdichte Chemotherapie TNBC | partial | Dosisdicht-Flag im Therapieprotokoll |
| 4.154 | Pembrolizumab bei TNBC | partial | **Neue Substanzklasse (ICPi)** - MedicationRequest + Zykluszahl |
| 4.155 | Capecitabin-Erhaltung bei non-pCR | partial | pCR-Status als Entscheidungskriterium formalisieren |
| 4.156 | Olaparib bei TNBC/gBRCA | **gap** | PARP-Inhibitor + Genomics Reporting (gBRCA) |
| 4.157 | Anti-HER2-Therapie Indikation | partial | MedicationRequest fuer Trastuzumab |
| 4.158 | Anti-HER2 ab 6mm | partial | Erweiterung Indikation fuer kleine Tumoren |
| 4.159 | Trastuzumab simultan mit Taxan | partial | Timing-Element fuer simultane Gabe |
| 4.160 | Deeskalation (Paclitaxel + Trastuzumab) | partial | Deeskaliertes Regime als Therapieprotokoll |
| 4.161 | Trastuzumab + Pertuzumab neoadjuvant | partial | Duale Anti-HER2-Blockade, MedicationRequest |
| 4.162 | Postneoadjuvant bei pCR (HER2+) | partial | pCR-basierte Therapiesteuerung |
| 4.163 | Chemotherapieschemata HER2+ | partial | Schema-Kodierung (EC-TH, TCH, TCHP) |
| 4.164 | Trastuzumab-Dauer | partial | LVEF-Monitoring als Begleit-Observation |
| 4.165 | T-DM1 bei non-pCR (HER2+) | partial | **ADC-Substanzklasse** - pCR-basierte Steuerung |
| 4.166 | Neratinib erweitert adjuvant | partial | Erweiterte adjuvante Therapielinie |
| 4.167 | Parallele endokrine + anti-HER2 | **gap** | CarePlan fuer parallele Therapiemodalitaeten |
| 4.168 | Knochendichtemessung | **gap** | DXA-Observation/DiagnosticReport |
| 4.169 | Praeventive Osteoporose-Behandlung | **gap** | Osteoporose-Praevention als eigenes Modul |
| 4.170 | Knochenprotektive Therapie Indikation | **gap** | MedicationRequest Bisphosphonat/Denosumab |
| 4.171 | Oestrogene kontraindiziert | **gap** | Kontraindikation-Modellierung |
| 4.172 | Denosumab/Bisphosphonat bei Knochenverlust | **gap** | MedicationRequest fuer Knochenprotektion |
| 4.173 | Re-Evaluation bei Therapieende | **gap** | Follow-up-Trigger |
| 4.174 | Pathologische Fraktur -> Metastasenausschluss | **gap** | Pathologische Fraktur + Metastasen-Diagnostik |
| 4.175 | Adjuvante Bisphosphonattherapie | **gap** | Off-Label-MedicationRequest |
| 4.176 | Zahnaerztliche Vorstellung | **gap** | ServiceRequest Zahnarzt-Konsultation |

### Zentrale Gaps und Handlungsempfehlungen

| Prioritaet | Gap | Betroffene Empfehlungen | Vorgeschlagene Loesung |
|-----------|-----|------------------------|----------------------|
| **Hoch** | MedicationRequest/MedicationAdministration fehlen im Senologie-Profil | 4.140-4.167 | Profil Senologie_Medikation (MedicationRequest) mit ATC-Kodierung erstellen |
| **Hoch** | pCR-Status als Entscheidungskriterium nicht formalisiert | 4.139, 4.155, 4.156, 4.162, 4.165 | Observation fuer pCR/non-pCR nach NACT (ypT0/is ypN0) |
| **Hoch** | Genomics Reporting (gBRCA1/2) | 4.150, 4.156 | Integration Genomics Reporting IG fuer BRCA-Mutationsstatus |
| **Hoch** | Therapiesequenzierung fehlt | 4.141, 4.167 | CarePlan mit zeitlich geordneten Aktivitaeten (sequenziell/parallel) |
| Mittel | Knochengerichtete Therapie komplett unmodelliert | 4.168-4.176 | Neues Modul: DXA-Observation, MedicationRequest Bisphosphonat/Denosumab |
| Mittel | Menopausenstatus als Stratifizierungskriterium | 4.142, 4.146, 4.147, 4.170, 4.175 | Observation fuer Menopausenstatus |
| Mittel | Risikostratifizierung fuer Therapieentscheidungen | 4.148, 4.149, 4.150 | Formalisierte Risikoklassifizierung (N-Status, Ki67, Genexpression, CPS) |
| Niedrig | Off-Label-Dokumentation | 4.175 | Flag/Extension fuer Off-Label-Use |
| Niedrig | Zahnaerztliche Vorstellung als Therapie-Voraussetzung | 4.176 | ServiceRequest fuer Zahnarzt-Konsultation |
