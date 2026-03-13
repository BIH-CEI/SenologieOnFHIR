# S3-Leitlinie v5.0 - Kapitel 8: Qualitaetsindikatoren

> Quelle: S3-Leitlinie Mammakarzinom, Langversion 5.0, Dezember 2025, Seiten 343-350
> Das finale Set besteht aus 17 QI (QI 7 unbesetzt). 15 der 17 QI sind mit dem onkologischen Basisdatensatz der Krebsregister (Stand 11/2025) zu dokumentieren. Der Zaehler ist stets eine Teilmenge des Nenners.

---

## QI 1: Weiterbehandlung der im Screening detektierten Mammakarzinome in zertifizierten Brustkrebszentren

```yaml
id: QI-1
qi_name: "Weiterbehandlung im zertifizierten Brustkrebszentrum"
seit: "2012"
vormals: "-"
status: "bestehend"

zaehler:
  definition: >
    Anzahl der Patientinnen, die eine Behandlung in einem zertifizierten
    Brustkrebszentrum (DKG/DGS, NRW) erhalten haben.
  datenobjekte:
    - name: "Behandlung im zertifizierten Zentrum"
      beschreibung: "Ob die Behandlung in einem zertifizierten Brustkrebszentrum erfolgte"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Zertifizierungsstatus Zentrum"
      beschreibung: "Zertifizierungsstatus des behandelnden Zentrums (DKG/DGS, NRW)"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle im Screening entdeckten Patientinnen mit histologisch gesichertem
    invasivem Mammakarzinom und/oder DCIS.
  datenobjekte:
    - name: "Im Screening entdeckt"
      beschreibung: "Ob das Mammakarzinom im Rahmen des Screenings detektiert wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Histologische Sicherung"
      beschreibung: "Histologisch gesichertes invasives MaCa und/oder DCIS"
      datentyp: "CodeableConcept"
      terminologie:
        system: "ICD-O-3"
        mapping_quelle: "standard"
      verpflichtung: "obligat"

referenz_empfehlung: "3.10"
qualitaetsziel: "Moeglichst haeufig Weiterbehandlung der im Screening detektierten Mammakarzinome u/o DCIS in einem zertifizierten Brustkrebszentrum"
referenzbereich: "-"
evidenzgrundlage: "Der QI kann mit Daten der Kooperationsgemeinschaft Mammographie ausgewertet werden."

fhir_datenobjekte:
  - "Condition (Diagnose invasives MaCa / DCIS)"
  - "Encounter (Behandlung im Zentrum)"
  - "Organization (zertifiziertes Brustkrebszentrum)"
  - "Flag/Observation (Screening-Detektion)"

fhir_mapping:
  status: "gap"
  anmerkung: "Organization.qualification fuer Zertifizierungsstatus. Encounter.serviceProvider fuer Zuordnung zum Zentrum."
```

---

## QI 2: Praetherapeutische histologische Sicherung

```yaml
id: QI-2
qi_name: "Praetherapeutische histologische Sicherung"
seit: "2012"
vormals: "MamCa 1"
status: "bestehend"

zaehler:
  definition: >
    Patientinnen mit praetherapeutischer histologischer Diagnosesicherung durch
    Stanzbiopsie oder Vakuumbiopsie.
  datenobjekte:
    - name: "Praetherapeutische Biopsie durchgefuehrt"
      beschreibung: "Ob eine histologische Diagnosesicherung vor Therapiebeginn erfolgte"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Biopsie-Methode"
      beschreibung: "Art der Biopsie"
      datentyp: "CodeableConcept"
      terminologie:
        system: "OPS"
        mapping_quelle: "standard"
      wertebereich: "Stanzbiopsie | Vakuumbiopsie | (Ausnahme: offene Exzisionsbiopsie)"
      verpflichtung: "obligat"

nenner:
  definition: >
    Patientinnen mit Ersteingriff und Histologie 'invasives Mammakarzinom oder DCIS'
    als Primaererkrankung.
  datenobjekte:
    - name: "Ersteingriff"
      beschreibung: "Ob es sich um den Ersteingriff bei Primaererkrankung handelt"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Histologie"
      beschreibung: "Histologische Diagnose invasives MaCa oder DCIS"
      datentyp: "CodeableConcept"
      terminologie:
        system: "ICD-O-3"
        mapping_quelle: "standard"
      verpflichtung: "obligat"

referenz_empfehlung: "4.15"
qualitaetsziel: "Moeglichst viele Pat. mit praetherapeutischer histologischer Sicherung durch Stanz- oder Vakuumbiopsie bei Ersteingriff und Primaererkrankung invasives Mammakarzinom und/oder DCIS"
referenzbereich: "-"
evidenzgrundlage: "LOE 3a, Empfehlungsgrad A"

fhir_datenobjekte:
  - "Procedure (Stanzbiopsie / Vakuumbiopsie)"
  - "DiagnosticReport (Histologie)"
  - "Condition (Primaererkrankung invasives MaCa / DCIS)"
  - "Specimen (Biopsat)"

fhir_mapping:
  status: "partial"
  anmerkung: "Procedure fuer Biopsie ueber OPS-Codes. Histologie ueber DiagnosticReport. Zeitlicher Bezug zum Ersteingriff muss gewaehrleistet sein."
```

---

## QI 3: Intraoperative Praeparateradio-/-sonographie

```yaml
id: QI-3
qi_name: "Intraoperative Praeparateradio-/-sonographie"
seit: "2012"
vormals: "MamCa 2"
status: "bestehend"

zaehler:
  definition: >
    Operationen mit intraoperativem Praeparatroentgen oder intraoperativer
    Praeparatsonographie.
  datenobjekte:
    - name: "Intraoperative Praeparatbildgebung"
      beschreibung: "Ob eine intraoperative Praeparateradiographie oder -sonographie durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Art der Praeparatbildgebung"
      beschreibung: "Methode der intraoperativen Praeparatebildgebung"
      datentyp: "CodeableConcept"
      wertebereich: "Praeparatroentgen | Praeparatsonographie"
      verpflichtung: "obligat"

nenner:
  definition: >
    Operationen mit praeoperativer Drahtmarkierung gesteuert durch Mammographie
    oder Sonographie.
  datenobjekte:
    - name: "Praeoperative Drahtmarkierung"
      beschreibung: "Ob eine praeoperative Drahtmarkierung durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Steuerung der Markierung"
      beschreibung: "Bildgebungsverfahren zur Steuerung der Markierung"
      datentyp: "CodeableConcept"
      wertebereich: "Mammographie | Sonographie"
      verpflichtung: "obligat"

referenz_empfehlung: "4.25"
qualitaetsziel: "Moeglichst haeufig intraoperative Praeparatsonographie o. -radiographie nach praeoperativer Markierung"
referenzbereich: "-"
evidenzgrundlage: "-"

fhir_datenobjekte:
  - "Procedure (Operation mit Drahtmarkierung)"
  - "Procedure (intraoperative Praeparatbildgebung)"
  - "DiagnosticReport (Praeparatroentgen/-sonographie)"

fhir_mapping:
  status: "gap"
  anmerkung: "Procedure fuer Markierung und intraoperative Bildgebung. Bezug zur OP ueber Encounter."
```

---

## QI 4: Axillaere Lymphknotenentfernung bei DCIS

```yaml
id: QI-4
qi_name: "Axillaere Lymphknotenentfernung bei DCIS"
seit: "2012"
vormals: "MamCa 3"
status: "bestehend"

zaehler:
  definition: >
    Patientinnen mit axillaerer Lymphknotenentnahme (primaere Axilladissektion
    oder Sentinel-Node-Biopsie).
  datenobjekte:
    - name: "Axillaere Lymphknotenentnahme"
      beschreibung: "Ob eine axillaere Lymphknotenentnahme durchgefuehrt wurde"
      datentyp: "boolean"
      terminologie:
        system: "OPS"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "Art der Lymphknotenentnahme"
      beschreibung: "Primaere Axilladissektion oder Sentinel-Node-Biopsie"
      datentyp: "CodeableConcept"
      wertebereich: "Axilladissektion | Sentinel-Node-Biopsie"
      verpflichtung: "obligat"

nenner:
  definition: >
    Patientinnen mit Histologie 'DCIS' und abgeschlossener operativer Therapie
    bei Primaererkrankung und brusterhaltender Therapie.
  datenobjekte:
    - name: "Histologie DCIS"
      beschreibung: "Histologische Diagnose DCIS"
      datentyp: "CodeableConcept"
      terminologie:
        system: "ICD-O-3"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "Brusterhaltende Therapie"
      beschreibung: "Ob eine brusterhaltende Therapie (BET) durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "4.31"
qualitaetsziel: "Moeglichst wenige Pat. mit primaerer Axilladissektion oder Sentinel-Node-Biopsie (SNB) bei DCIS mit brusterhaltender Therapie. Qualitaetsziel <5%"
referenzbereich: "<5%"
evidenzgrundlage: "LOE 1b, Empfehlungsgrad A"

fhir_datenobjekte:
  - "Condition (DCIS)"
  - "Procedure (BET)"
  - "Procedure (Axilladissektion / SNB)"

fhir_mapping:
  status: "partial"
  anmerkung: "Procedure fuer OP und Lymphknotenentnahme. Condition fuer DCIS. ACHTUNG: Inverser QI - moeglichst WENIGE sollen Zaehler-Kriterium erfuellen."
```

---

## QI 5: Endokrine Therapie als erste Therapieoption beim steroidrezeptorpositivem metastasierten Mammakarzinom

```yaml
id: QI-5
qi_name: "Endokrine Therapie als First-Line bei HR+/HER2- metastasiertem MaCa"
seit: "2012"
vormals: "MamCa 11"
status: "bestehend"

zaehler:
  definition: >
    Patientinnen, die eine endokrin basierte Therapie im metastasierten Stadium
    als First-Line-Therapie erhalten haben.
  datenobjekte:
    - name: "Endokrine First-Line-Therapie"
      beschreibung: "Ob eine endokrin basierte Therapie als Erstlinientherapie im metastasierten Setting erfolgte"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Therapie-Art"
      beschreibung: "Art der endokrinen Therapie"
      datentyp: "CodeableConcept"
      terminologie:
        system: "ATC"
        mapping_quelle: "standard"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit steroidrezeptorpositivem und HER2-negativem
    Mammakarzinom und Erstdiagnose einer Metastasierung.
  datenobjekte:
    - name: "Steroidrezeptorstatus positiv"
      beschreibung: "ER- und/oder PR-positiver Rezeptorstatus"
      datentyp: "CodeableConcept"
      terminologie:
        system: "SNOMED CT"
        version: "2025-01-31"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "HER2-Status negativ"
      beschreibung: "HER2-negativer Tumorstatus"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Erstdiagnose Metastasierung"
      beschreibung: "Ob eine Erstdiagnose einer Fernmetastasierung vorliegt"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "-"
qualitaetsziel: "Moeglichst haeufig Durchfuehrung einer endokrin basierten Therapie als First-Line-Therapie bei Pat mit Mammakarzinom, positivem Hormonrezeptorstatus, negativem HER2-Status und Erstdiagnose einer Metastasierung"
referenzbereich: "-"
evidenzgrundlage: "LOE 1b, Empfehlungsgrad A"

fhir_datenobjekte:
  - "Condition (metastasiertes MaCa)"
  - "Observation (ER/PR-Status positiv)"
  - "Observation (HER2-Status negativ)"
  - "MedicationRequest (endokrine Therapie)"
  - "Condition (Fernmetastase, Erstdiagnose)"

fhir_mapping:
  status: "partial"
  anmerkung: "Biomarker-Observations vorhanden. MedicationRequest fuer endokrine Therapie. Zeitliche Zuordnung (First-Line) muss ueber CarePlan oder Encounter modelliert werden."
```

---

## QI 6: Indikation zur Sentinel-Lymphknotenbiopsie

```yaml
id: QI-6
qi_name: "Indikation zur Sentinel-Lymphknotenbiopsie"
seit: "2012"
vormals: "MamCa 4"
status: "bestehend"

zaehler:
  definition: >
    Patientinnen mit alleiniger Sentinel-Node-Biopsie.
  datenobjekte:
    - name: "Alleinige Sentinel-Node-Biopsie"
      beschreibung: "Ob ausschliesslich eine Sentinel-Node-Biopsie (ohne Axilladissektion) durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

nenner:
  definition: >
    Patientinnen mit Primaererkrankung invasives Mammakarzinom und negativem
    pN-Staging und ohne praeoperative tumorspezifische Therapie.
  datenobjekte:
    - name: "Primaererkrankung invasives MaCa"
      beschreibung: "Ersterkrankung invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "pN-Staging negativ"
      beschreibung: "Pathologisch negative Lymphknoten (pN0)"
      datentyp: "CodeableConcept"
      terminologie:
        system: "UICC TNM"
        version: "8. Auflage"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "Keine praeoperative tumorspezifische Therapie"
      beschreibung: "Ob KEINE neoadjuvante Systemtherapie vor OP durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "-"
qualitaetsziel: "Moeglichst viele Pat. mit Sentinel-Node-Biopsie bei Lymphknoten-negativem (pN0) invasivem Mammakarzinom ohne praeoperative tumorspezifische Therapie"
referenzbereich: "-"
evidenzgrundlage: "Der Qualitaetsindikator soll getrennt nach weiblichen und maennlichen Patienten berechnet werden"

fhir_datenobjekte:
  - "Condition (invasives MaCa, Primaererkrankung)"
  - "Procedure (Sentinel-Node-Biopsie)"
  - "Observation (pN-Staging)"
  - "MedicationRequest (neoadjuvante Therapie - Ausschluss)"

fhir_mapping:
  status: "partial"
  anmerkung: "Procedure fuer SNB. TNM-Observation fuer pN0. Geschlechtsspezifische Auswertung beachten."
```

---

## QI 7: Therapie der axillären Lymphabflussgebiete bei pN1mi (unbesetzt 2025)

```yaml
id: QI-7
qi_name: "Therapie der axillären Lymphabflussgebiete bei pN1mi"
seit: "-"
vormals: "MamCa 5"
status: "unbesetzt 2025"

zaehler:
  definition: "-"
nenner:
  definition: "-"

referenz_empfehlung: "-"
qualitaetsziel: "-"
referenzbereich: "-"
evidenzgrundlage: "-"

fhir_datenobjekte: []

fhir_mapping:
  status: "-"
  anmerkung: "QI 7 ist in der aktuellen Version unbesetzt."
```

---

## QI 8: Durchgefuehrte Strahlentherapie nach BET

```yaml
id: QI-8
qi_name: "Durchgefuehrte Strahlentherapie nach BET"
seit: "2012"
vormals: "MamCa 6"
status: "bestehend"

zaehler:
  definition: >
    Patientinnen mit invasivem Karzinom und BET, die eine Radiatio der Brust
    erhalten haben.
  datenobjekte:
    - name: "Radiatio der Brust durchgefuehrt"
      beschreibung: "Ob eine Bestrahlung der Brust nach BET erfolgte"
      datentyp: "boolean"
      verpflichtung: "obligat"

nenner:
  definition: >
    Patientinnen mit Primaererkrankung invasives Mammakarzinom und BET.
  datenobjekte:
    - name: "Primaererkrankung invasives MaCa"
      beschreibung: "Ersterkrankung invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "BET durchgefuehrt"
      beschreibung: "Ob eine brusterhaltende Therapie durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "-"
qualitaetsziel: "Adaequate Rate an Bestrahlungen nach BET bei Pat. mit Ersterkrankung invasives Mammakarzinom"
referenzbereich: "-"
evidenzgrundlage: "LOE 1a, Empfehlungsgrad A"

fhir_datenobjekte:
  - "Condition (invasives MaCa, Primaererkrankung)"
  - "Procedure (BET)"
  - "Procedure (Radiatio Mamma)"

fhir_mapping:
  status: "partial"
  anmerkung: "Procedure fuer BET und Radiatio. Zeitliche Abfolge BET -> Radiatio muss abbildbar sein."
```

---

## QI 9: Endokrine Therapie bei rezeptorpositivem Befund

```yaml
id: QI-9
qi_name: "Endokrine Therapie bei rezeptorpositivem Befund"
seit: "2012"
vormals: "MamCa 7"
status: "bestehend"

zaehler:
  definition: >
    Patientinnen, die eine adjuvante endokrine Therapie erhalten haben.
  datenobjekte:
    - name: "Adjuvante endokrine Therapie"
      beschreibung: "Ob eine adjuvante endokrine Therapie verordnet/durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

nenner:
  definition: >
    Steroidrezeptorpositive Patientinnen mit Primaererkrankung invasives Mammakarzinom.
  datenobjekte:
    - name: "Steroidrezeptorstatus positiv"
      beschreibung: "ER- und/oder PR-positiver Rezeptorstatus"
      datentyp: "CodeableConcept"
      terminologie:
        system: "LOINC"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "Primaererkrankung invasives MaCa"
      beschreibung: "Ersterkrankung invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"

referenz_empfehlung: "4.140"
qualitaetsziel: "Moeglichst haeufig Durchfuehrung einer endokrinen Therapie bei rezeptorpositiven Pat. mit Ersterkrankung invasives Mammakarzinom"
referenzbereich: "-"
evidenzgrundlage: "LOE 1a, Empfehlungsgrad A"

fhir_datenobjekte:
  - "Condition (invasives MaCa, Primaererkrankung)"
  - "Observation (ER/PR-Status positiv)"
  - "MedicationRequest (endokrine Therapie)"

fhir_mapping:
  status: "partial"
  anmerkung: "Biomarker-Observations vorhanden. MedicationRequest fuer endokrine Therapie."
```

---

## QI 10: Trastuzumab-basierte Therapie ueber ein Jahr bei HER2-positivem Befund

```yaml
id: QI-10
qi_name: "Trastuzumab-basierte Therapie ueber 1 Jahr bei HER2+"
seit: "2012"
vormals: "MamCa 8"
status: "modifiziert 2025"

zaehler:
  definition: >
    Patientinnen des Nenners, die eine (neo-)adjuvante Trastuzumab-basierte
    Therapie ueber 1 Jahr erhalten haben.
  datenobjekte:
    - name: "Trastuzumab-Therapie ueber 1 Jahr"
      beschreibung: "Ob eine Trastuzumab-basierte Therapie fuer mindestens 1 Jahr durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Therapiedauer"
      beschreibung: "Gesamtdauer der Trastuzumab-Therapie"
      datentyp: "Quantity (Monate)"
      wertebereich: ">= 12 Monate"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit Primaererkrankung eines invasiven, HER2-positiven
    Mammakarzinoms (immunhistochemisch Score 3+ oder 2+ und ISH positiv),
    >= pT1c.
  datenobjekte:
    - name: "HER2-Status positiv"
      beschreibung: "HER2-positiver Status (IHC 3+ oder IHC 2+ und ISH-positiv)"
      datentyp: "CodeableConcept"
      terminologie:
        system: "LOINC"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "Tumorgroesse >= pT1c"
      beschreibung: "Pathologische Tumorgroesse mindestens pT1c"
      datentyp: "CodeableConcept"
      terminologie:
        system: "UICC TNM"
        version: "8. Auflage"
        mapping_quelle: "standard"
      verpflichtung: "obligat"

referenz_empfehlung: "4.157, 4.162"
qualitaetsziel: "Moeglichst haeufig Trastuzumab-basierte Therapie ueber 1 Jahr bei HER2-positiven Pat. mit Ersterkrankung invasives Mammakarzinom >= pT1c"
referenzbereich: "-"
evidenzgrundlage: "4.157: EG A, LoE 2; 4.154: EK, starker Konsens"

fhir_datenobjekte:
  - "Condition (invasives MaCa >= pT1c)"
  - "Observation (HER2-Status: IHC Score + ISH)"
  - "Observation (pT-Kategorie)"
  - "MedicationRequest/MedicationAdministration (Trastuzumab)"
  - "MedicationRequest (Pertuzumab - bei axillaeren LK-Befall optional)"

fhir_mapping:
  status: "partial"
  anmerkung: "Biomarker-Observations und TNM vorhanden. MedicationRequest fuer Trastuzumab. Therapiedauer-Tracking ueber MedicationAdministration oder CarePlan."
```

---

## QI 11: R0-Resektion bei invasivem Mammakarzinom

```yaml
id: QI-11
qi_name: "R0-Resektion bei invasivem Mammakarzinom"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners mit R0-Resektion als endgueltigem Ergebnis.
  datenobjekte:
    - name: "R0-Resektion"
      beschreibung: "Ob eine R0-Resektion (Resektion im Gesunden) als Endergebnis erreicht wurde"
      datentyp: "CodeableConcept"
      terminologie:
        system: "SNOMED CT"
        version: "2025-01-31"
        mapping_quelle: "vorschlag"
      wertebereich: "R0 | R1 | R2 | RX"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit invasivem Mammakarzinom und Tumorresektion.
  datenobjekte:
    - name: "Invasives Mammakarzinom"
      beschreibung: "Diagnose invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Tumorresektion durchgefuehrt"
      beschreibung: "Ob eine Tumorresektion durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "4.46"
qualitaetsziel: "Moeglichst haeufig soll die Resektion im Gesunden erfolgen"
referenzbereich: "-"
evidenzgrundlage: "EG A, LoE 1"

fhir_datenobjekte:
  - "Condition (invasives MaCa)"
  - "Procedure (Tumorresektion: BET / Mastektomie)"
  - "Observation (Resektionsrand-Status R0/R1/R2)"

fhir_mapping:
  status: "partial"
  anmerkung: "Procedure fuer OP. Observation fuer R-Klassifikation ueber Pathologie-Befund. R-Status in Senologie_Pathologie_Befund modellierbar."
```

---

## QI 12: Immunhistochemischer Befund des Oestrogen- u. Progesteronrezeptorstatus

```yaml
id: QI-12
qi_name: "Immunhistochemischer Befund ER/PR-Status"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners mit immunhistochemisch bestimmtem Befund des Oestrogen-
    und Progesteronrezeptorstatus mit Angabe des Prozentsatzes an positiven
    Tumorzellkernen und Angabe der durchschnittlichen Faerbeintensitaet.
  datenobjekte:
    - name: "ER-Status immunhistochemisch bestimmt"
      beschreibung: "Ob der Oestrogenrezeptorstatus immunhistochemisch bestimmt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "PR-Status immunhistochemisch bestimmt"
      beschreibung: "Ob der Progesteronrezeptorstatus immunhistochemisch bestimmt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Prozentsatz positiver Tumorzellkerne (ER)"
      beschreibung: "Anteil positiver Tumorzellkerne fuer ER"
      datentyp: "Quantity (%)"
      terminologie:
        system: "LOINC"
        mapping_quelle: "standard"
      verpflichtung: "obligat"
    - name: "Prozentsatz positiver Tumorzellkerne (PR)"
      beschreibung: "Anteil positiver Tumorzellkerne fuer PR"
      datentyp: "Quantity (%)"
      verpflichtung: "obligat"
    - name: "Durchschnittliche Faerbeintensitaet"
      beschreibung: "Durchschnittliche immunhistochemische Faerbeintensitaet"
      datentyp: "CodeableConcept"
      wertebereich: "schwach | mittel | stark"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit DCIS und/oder invasivem Mammakarzinom, mit Biopsie
    und/oder Tumorresektion und Bestimmung des Oestrogen- und
    Progesteronrezeptorstatus (ER/PR).
  datenobjekte:
    - name: "Diagnose MaCa/DCIS"
      beschreibung: "Diagnose DCIS und/oder invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Biopsie/Tumorresektion"
      beschreibung: "Ob Biopsie oder Tumorresektion durchgefuehrt"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "ER/PR-Bestimmung durchgefuehrt"
      beschreibung: "Ob ER/PR-Status bestimmt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "4.72"
qualitaetsziel: "Moeglichst bei allen Bestimmungen des Oestrogen- und Progesteronrezeptorstatus (ER/PR) soll der Prozentsatz an positiven Tumorzellkernen und der durchschnittlichen Faerbeintensitaet angegeben sein"
referenzbereich: "-"
evidenzgrundlage: "EK, starker Konsens. ER/PR-positiv erfordert mindestens 1% positive Tumorzellkerne. Tumoren mit 1-10% positiven Tumorzellkernen sind als gering positiv einzuordnen."

fhir_datenobjekte:
  - "Observation (ER-Status: Score, Prozentsatz, Intensitaet)"
  - "Observation (PR-Status: Score, Prozentsatz, Intensitaet)"
  - "DiagnosticReport (Pathologie-Befund)"
  - "Specimen (Biopsat / Resektat)"

fhir_mapping:
  status: "partial"
  anmerkung: "ER/PR-Observations in Senologie_Pathologie_Befund teilweise vorhanden. Prozentsatz und Faerbeintensitaet als Detail-Komponenten ergaenzen (vgl. Kap. 4.5 Annotation)."
```

---

## QI 13: Immunhistochemischer Score des HER2-Status

```yaml
id: QI-13
qi_name: "Immunhistochemischer Score des HER2-Status"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners mit Angabe des immunhistochemischen Scores und
    der den Score-definierenden Prozentsatzes positiver Tumorzellen
    (entsprechend ASCO/CAP-Empfehlungen).
  datenobjekte:
    - name: "IHC-Score angegeben"
      beschreibung: "Ob der immunhistochemische HER2-Score dokumentiert ist"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "IHC-Score"
      beschreibung: "Immunhistochemischer HER2-Score"
      datentyp: "CodeableConcept"
      wertebereich: "Score 0 | Score 1+ | Score 2+ | Score 3+"
      verpflichtung: "obligat"
    - name: "Prozentsatz positiver Tumorzellen"
      beschreibung: "Score-definierender Prozentsatz positiver Tumorzellen nach ASCO/CAP"
      datentyp: "Quantity (%)"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit invasivem Mammakarzinom und Biopsie und/oder
    Tumorresektion und immunhistochemischer Bestimmung des HER2-Status.
  datenobjekte:
    - name: "Invasives Mammakarzinom"
      beschreibung: "Diagnose invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Immunhistochemische HER2-Bestimmung"
      beschreibung: "Ob eine IHC-basierte HER2-Bestimmung durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "4.73"
qualitaetsziel: "Bei moeglichst vielen Bestimmungen des HER2-Status soll der immunhistochemische Score und der Score-definierende Prozentsatz positiver Tumorzellen entsprechend den ASCO/CAP-Empfehlungen angegeben werden: Score 0, Score 1+, Score 2+ oder Score 3+"
referenzbereich: "-"
evidenzgrundlage: "EG A, LoE 1. Bei Score 2+ soll ISH-Hybridisierung zur Festlegung ergaenzt werden."

fhir_datenobjekte:
  - "Observation (HER2-IHC-Score mit Prozentsatz)"
  - "Observation (HER2-ISH bei Score 2+)"
  - "DiagnosticReport (Pathologie-Befund)"

fhir_mapping:
  status: "partial"
  anmerkung: "HER2-Observation in Senologie_Pathologie_Befund teilweise vorhanden. Prozentsatz positiver Tumorzellen als Komponente ergaenzen. ISH bei Score 2+ als separate Observation."
```

---

## QI 14: Bestrahlung der regionalen Lymphabflussgebiete bei >= 4 befallenen axillären Lymphknoten

```yaml
id: QI-14
qi_name: "Bestrahlung regionale Lymphabflussgebiete bei >= 4 befallenen axillären LK"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners mit Bestrahlung der regionalen Lymphabflussgebiete.
  datenobjekte:
    - name: "Bestrahlung regionale Lymphabflussgebiete"
      beschreibung: "Ob eine Bestrahlung der regionalen Lymphabflussgebiete durchgefuehrt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit invasivem Mammakarzinom und Tumorresektion und
    Nachweis von >= 4 befallenen axillären Lymphknoten.
  datenobjekte:
    - name: "Invasives Mammakarzinom"
      beschreibung: "Diagnose invasives Mammakarzinom"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Tumorresektion"
      beschreibung: "Tumorresektion durchgefuehrt"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Anzahl befallener axillaerer Lymphknoten"
      beschreibung: "Anzahl der befallenen axillären Lymphknoten (>= 4)"
      datentyp: "integer"
      terminologie:
        system: "LOINC"
        version: "2.77"
        code: "21893-3"
        display: "Regional lymph nodes positive [#] Specimen"
        mapping_quelle: "standard"
      wertebereich: ">= 4"
      verpflichtung: "obligat"

referenz_empfehlung: "4.113"
qualitaetsziel: "Bei moeglichst vielen Pat. mit Nachweis von 4 und mehr befallenen axillären Lymphknoten soll eine Bestrahlung der regionalen Lymphabflussgebiete durchgefuehrt werden"
referenzbereich: "-"
evidenzgrundlage: "EG A, LoE 1"

fhir_datenobjekte:
  - "Condition (invasives MaCa)"
  - "Procedure (Tumorresektion)"
  - "Observation (Anzahl befallener LK >= 4)"
  - "Procedure (Bestrahlung regionale Lymphabflussgebiete)"

fhir_mapping:
  status: "partial"
  anmerkung: "Observation fuer LK-Anzahl vorhanden (LOINC). Procedure fuer Bestrahlung."
```

---

## QI 15: Trastuzumab-Emtansin bei nicht erreichter Komplettremission

```yaml
id: QI-15
qi_name: "Trastuzumab-Emtansin bei nicht erreichter Komplettremission"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners mit 14 Zyklen Trastuzumab-Emtansin als postneoadjuvante Therapie.
  datenobjekte:
    - name: "T-DM1 postneoadjuvant"
      beschreibung: "Ob 14 Zyklen Trastuzumab-Emtansin (T-DM1) als postneoadjuvante Therapie verabreicht wurden"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Anzahl T-DM1 Zyklen"
      beschreibung: "Anzahl der verabreichten T-DM1-Zyklen"
      datentyp: "integer"
      wertebereich: "14"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit HER2-positiven Mammakarzinomen (immunhistochemisch
    Score 3+ oder 2+ und ISH-positiv) nach einem Anthrazyklin- oder Taxan-basierten
    Chemotherapieschema in Kombination mit anti-HER2 gerichteter Therapie und
    nicht erreichter histologischer Komplettremission (non-pCR).
  datenobjekte:
    - name: "HER2-positiv"
      beschreibung: "HER2-positiver Status (IHC 3+ oder IHC 2+ und ISH+)"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Neoadjuvante Chemotherapie + anti-HER2"
      beschreibung: "Anthrazyklin-/Taxan-basiertes Schema mit anti-HER2-Therapie"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Histologische Komplettremission (pCR)"
      beschreibung: "Ob eine histologische Komplettremission erreicht wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "non-pCR"
      beschreibung: "Nicht-Erreichen der pathologischen Komplettremission"
      datentyp: "boolean"
      wertebereich: "true (= keine pCR)"
      verpflichtung: "obligat"

referenz_empfehlung: "4.165"
qualitaetsziel: "Moeglichst viele Pat. mit HER2-positiven Mammakarzinomen (IHC 3+ oder 2+ und ISH-positiv) und nicht erreichter histologischer Komplettremission (non-pCR) nach Anthrazyklin-/Taxan-basierter Chemotherapie in Kombination mit anti-HER2 gerichteter Therapie sollen als postneoadjuvante Therapie 14 Zyklen Trastuzumab-Emtansin erhalten"
referenzbereich: "-"
evidenzgrundlage: "EG A, LoE 2"

fhir_datenobjekte:
  - "Observation (HER2-Status: IHC + ISH)"
  - "MedicationRequest (neoadjuvante Chemotherapie + anti-HER2)"
  - "Observation (pCR-Status: non-pCR)"
  - "MedicationAdministration (T-DM1, 14 Zyklen)"

fhir_mapping:
  status: "gap"
  anmerkung: "pCR-Status als Observation fehlt. MedicationAdministration fuer T-DM1 Zyklen-Tracking. Komplexe Abfrage ueber mehrere Ressourcen."
```

---

## QI 16: Erfassung der moeglichen erblichen Belastung mittels Checkliste

```yaml
id: QI-16
qi_name: "Erfassung der moeglichen erblichen Belastung mittels Checkliste"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners mit Erfassung der moeglichen erblichen Belastung
    fuer Brust- und/oder Eierstockkrebs mittels der Checkliste*.
  datenobjekte:
    - name: "Checkliste erbliche Belastung ausgefuellt"
      beschreibung: "Ob die Checkliste zur Erfassung einer moeglichen erblichen Belastung angewendet wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Ergebnis Checkliste"
      beschreibung: "Ergebnis der Checkliste (auffaellig/unauffaellig)"
      datentyp: "CodeableConcept"
      wertebereich: "auffaellig | unauffaellig"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit Erstdiagnose eines DCIS und/oder invasiven Mammakarzinoms
    und alle Patientinnen mit einem neu aufgetretenen Rezidiv und/oder neu
    aufgetretenen Fernmetastase(n).
  datenobjekte:
    - name: "Erstdiagnose DCIS/invasives MaCa"
      beschreibung: "Erstdiagnose eines DCIS und/oder invasiven Mammakarzinoms"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Neu aufgetretenes Rezidiv/Fernmetastase"
      beschreibung: "Ob ein neues Rezidiv oder neue Fernmetastasen aufgetreten sind"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "3.42"
qualitaetsziel: "Bei moeglichst vielen Patientinnen und Patienten mit DCIS u./o. einem invasiven Mammakarzinom soll zur Erfassung einer moeglichen erblichen Belastung fuer Brust- und/oder Eierstockkrebs die Checkliste* angewendet werden"
referenzbereich: "-"
evidenzgrundlage: "EG B, LoE 2, starker Konsens. *Checkliste: https://www.krebsgesellschaft.de/unsere-themen/zertifizierung/erhebungsboegen-und-dokumente"

fhir_datenobjekte:
  - "Condition (DCIS / invasives MaCa / Rezidiv / Fernmetastase)"
  - "QuestionnaireResponse (Checkliste erbliche Belastung)"
  - "FamilyMemberHistory (erbliche Belastung)"
  - "RiskAssessment (Risikoeinschaetzung)"

fhir_mapping:
  status: "gap"
  anmerkung: "QuestionnaireResponse fuer Checkliste. FamilyMemberHistory fuer Familienanamnese. Standardisierte Checkliste der DKG als Questionnaire modellieren."
```

---

## QI 17: Praetherapeutische Tumorkonferenz

```yaml
id: QI-17
qi_name: "Praetherapeutische Tumorkonferenz"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners, die praetherapeutisch in einer interdisziplinaeren
    Tumorkonferenz vorgestellt wurden.
  datenobjekte:
    - name: "Praetherapeutische Tumorkonferenz"
      beschreibung: "Ob die Patientin praetherapeutisch in einer interdisziplinaeren Tumorkonferenz vorgestellt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Datum Tumorkonferenz"
      beschreibung: "Datum der praetherapeutischen Tumorkonferenz"
      datentyp: "dateTime"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit Erstdiagnose eines DCIS und/oder invasiven Mammakarzinoms
    und alle Patientinnen mit einem neu aufgetretenen Rezidiv und/oder neu
    aufgetretenen Fernmetastasen.
  datenobjekte:
    - name: "Erstdiagnose DCIS/invasives MaCa"
      beschreibung: "Erstdiagnose eines DCIS und/oder invasiven Mammakarzinoms"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Neu aufgetretenes Rezidiv/Fernmetastase"
      beschreibung: "Ob ein neues Rezidiv oder neue Fernmetastasen aufgetreten sind"
      datentyp: "boolean"
      verpflichtung: "obligat"

referenz_empfehlung: "3.43"
qualitaetsziel: "Moeglichst alle Pat. mit DCIS u/o invasivem Mammakarzinom sollen praetherapeutisch in einer interdisziplinaeren Tumorkonferenz vorgestellt werden"
referenzbereich: "-"
evidenzgrundlage: "EK, starker Konsens"

fhir_datenobjekte:
  - "Condition (DCIS / invasives MaCa / Rezidiv / Fernmetastase)"
  - "Encounter (Tumorkonferenz)"
  - "CarePlan (Therapieempfehlung aus Tumorkonferenz)"
  - "ClinicalImpression (Tumorboard-Beschluss)"

fhir_mapping:
  status: "gap"
  anmerkung: "Encounter fuer Tumorkonferenz. CarePlan/ClinicalImpression fuer Beschluss. Zeitliche Abfolge (vor Therapiebeginn) muss abbildbar sein."
```

---

## QI 18: Postoperative Tumorkonferenz

```yaml
id: QI-18
qi_name: "Postoperative Tumorkonferenz"
seit: "2025"
vormals: "-"
status: "neu 2025"

zaehler:
  definition: >
    Patientinnen des Nenners, die postoperativ in einer interdisziplinaeren
    Tumorkonferenz vorgestellt wurden.
  datenobjekte:
    - name: "Postoperative Tumorkonferenz"
      beschreibung: "Ob die Patientin postoperativ in einer interdisziplinaeren Tumorkonferenz vorgestellt wurde"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "Datum postoperative Tumorkonferenz"
      beschreibung: "Datum der postoperativen Tumorkonferenz"
      datentyp: "dateTime"
      verpflichtung: "obligat"

nenner:
  definition: >
    Alle Patientinnen mit Erstdiagnose eines DCIS und/oder invasiven Mammakarzinoms
    und Operation (BET und/oder Mastektomie).
  datenobjekte:
    - name: "Erstdiagnose DCIS/invasives MaCa"
      beschreibung: "Erstdiagnose eines DCIS und/oder invasiven Mammakarzinoms"
      datentyp: "CodeableConcept"
      verpflichtung: "obligat"
    - name: "Operation durchgefuehrt"
      beschreibung: "BET und/oder Mastektomie durchgefuehrt"
      datentyp: "boolean"
      verpflichtung: "obligat"
    - name: "OP-Art"
      beschreibung: "Art der durchgefuehrten Operation"
      datentyp: "CodeableConcept"
      wertebereich: "BET | Mastektomie"
      verpflichtung: "obligat"

referenz_empfehlung: "3.43"
qualitaetsziel: "Moeglichst alle operativ versorgten (BET u/o Mastektomie) Pat. mit DCIS u/o invasivem Mammakarzinom sollen postoperativ in einer interdisziplinaeren Tumorkonferenz vorgestellt werden"
referenzbereich: "-"
evidenzgrundlage: "EK, starker Konsens"

fhir_datenobjekte:
  - "Condition (DCIS / invasives MaCa)"
  - "Procedure (BET / Mastektomie)"
  - "Encounter (postoperative Tumorkonferenz)"
  - "CarePlan (Therapieempfehlung)"

fhir_mapping:
  status: "gap"
  anmerkung: "Encounter fuer Tumorkonferenz. Zeitliche Abfolge (nach Operation) muss abbildbar sein. Gleiches Modell wie QI 17."
```

---

## Zusammenfassung: Gap-Analyse Kapitel 8 - Qualitaetsindikatoren

| QI | Name | FHIR-Status | Zentrale FHIR-Datenobjekte | Handlungsbedarf |
|----|------|-------------|---------------------------|-----------------|
| QI 1 | Weiterbehandlung im zert. Zentrum | **gap** | Organization, Encounter | Organization.qualification fuer Zertifizierung |
| QI 2 | Praetherapeutische histologische Sicherung | partial | Procedure, DiagnosticReport | Zeitlicher Bezug Biopsie -> Ersteingriff |
| QI 3 | Intraoperative Praeparatebildgebung | **gap** | Procedure (2x) | Procedure fuer Markierung + intraoperative Bildgebung |
| QI 4 | Axillaere LK-Entfernung bei DCIS | partial | Condition, Procedure | Inverser QI (<5%) beachten |
| QI 5 | Endokrine First-Line metastasiert HR+/HER2- | partial | Condition, Observation, MedicationRequest | Therapielinie (First-Line) abbilden |
| QI 6 | SNB-Indikation | partial | Procedure, Observation (pN) | Geschlechtsspezifische Auswertung |
| QI 7 | pN1mi Therapie | - | - | Unbesetzt |
| QI 8 | Strahlentherapie nach BET | partial | Procedure (2x) | Zeitliche Abfolge BET -> Radiatio |
| QI 9 | Endokrine Therapie HR+ | partial | Observation (ER/PR), MedicationRequest | Biomarker vorhanden, Medication ergaenzen |
| QI 10 | Trastuzumab >= 1 Jahr HER2+ | partial | Observation (HER2), MedicationRequest | Therapiedauer-Tracking |
| QI 11 | R0-Resektion | partial | Procedure, Observation (R-Status) | R-Klassifikation in Pathologie |
| QI 12 | IHC ER/PR mit Prozentsatz + Intensitaet | partial | Observation (ER/PR Details) | **PRIORITAER**: Prozentsatz + Faerbeintensitaet ergaenzen |
| QI 13 | IHC HER2-Score + Prozentsatz | partial | Observation (HER2 Details) | **PRIORITAER**: Prozentsatz positiver Tumorzellen ergaenzen |
| QI 14 | Bestrahlung bei >= 4 befallenen LK | partial | Observation (LK-Anzahl), Procedure | LK-Anzahl vorhanden (LOINC) |
| QI 15 | T-DM1 bei non-pCR HER2+ | **gap** | Observation (pCR-Status), MedicationAdmin | **NEU**: pCR-Status als Observation; Zyklen-Tracking |
| QI 16 | Checkliste erbliche Belastung | **gap** | QuestionnaireResponse, FamilyMemberHistory | **NEU**: Questionnaire fuer Checkliste modellieren |
| QI 17 | Praetherapeutische Tumorkonferenz | **gap** | Encounter, CarePlan | **NEU**: Tumorkonferenz-Encounter + zeitliche Abfolge |
| QI 18 | Postoperative Tumorkonferenz | **gap** | Encounter, Procedure, CarePlan | **NEU**: Analog QI 17, nach OP |

### Priorisierung fuer FHIR-Profil-Entwicklung

1. **Hoechste Prioritaet** (direkt messbare Datenqualitaet):
   - QI 12 + QI 13: IHC-Details fuer ER/PR und HER2 - Ergaenzung bestehender Pathologie-Profile um Prozentsatz und Intensitaet
   - QI 11: R0-Resektion - R-Klassifikation in Pathologie-Befund
2. **Hoch** (neue QI mit Luecken):
   - QI 15: pCR-Status als neue Observation
   - QI 16: Checkliste erbliche Belastung als Questionnaire
   - QI 17 + QI 18: Tumorkonferenz-Encounter (prae-/postoperativ)
3. **Mittel** (bestehende QI mit partieller Abdeckung):
   - QI 2, 4, 6, 8, 9, 10, 14: Ergaenzung zeitlicher Bezuege und Therapielinie

### Uebergreifende Datenobjekte fuer QI-Berechnung

Die folgenden Datenobjekte werden von MEHREREN QI benoetigt und sollten priorisiert modelliert werden:

| Datenobjekt | Genutzt von QI | FHIR-Ressource |
|---|---|---|
| Diagnose invasives MaCa / DCIS | 1, 2, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 | Condition |
| ER/PR-Status | 5, 9, 12 | Observation |
| HER2-Status | 5, 10, 13, 15 | Observation |
| pN-Staging / LK-Anzahl | 6, 14 | Observation |
| Procedure BET/Mastektomie | 4, 8, 11, 18 | Procedure |
| Strahlentherapie | 8, 14 | Procedure |
| MedicationRequest endokrine/anti-HER2 Therapie | 5, 9, 10, 15 | MedicationRequest |
| Tumorkonferenz | 17, 18 | Encounter |
