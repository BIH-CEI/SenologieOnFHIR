# Beispielfall - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* **Beispielfall**

## Beispielfall

# Beispielfall: Erika Neumann

## Auf einen Blick

| | |
| :--- | :--- |
| **Patientin** | Erika Neumann, geb. 1966, weiblich |
| **Diagnose** | Invasives Mammakarzinom NST, links OAQ |
| **Stadium** | cT1c cN0 cM0, UICC IA |
| **Molekularer Subtyp** | HR+/HER2- (Luminal A-like) |
| **Rezeptorstatus** | ER+ IRS 12, PR+ IRS 8, HER2- Score 1+, Ki-67 15% |
| **Genexpression** | Oncotype DX Recurrence Score 18 (niedrig) |
| **Therapie** | BET + SLNB → adjuvante RT → endokrine Therapie |
| **Outcome** | R0, pN0(sn), kein Rezidiv bei 6-Monats-Follow-Up |

## Klinischer Verlauf

### Vorstellung und Diagnostik

Frau Neumann stellt sich im Januar 2025 mit einem selbst getasteten Knoten in der linken Brust vor. Die klinische Untersuchung bestätigt einen derben, verschieblichen Knoten im oberen äußeren Quadranten.

**Bildgebung:**

* Mammographie bilateral: BI-RADS 5 links OAQ (18 mm, unscharf begrenzt), BI-RADS 1 rechts
* Skelettszintigraphie: kein Hinweis auf ossäre Metastasen

**Pathologie (Stanzbiopsie):**

* Invasives Karzinom NST, G2
* ER+ IRS 12, PR+ IRS 8, HER2- (IHC 1+), Ki-67 15%

**Staging:** cT1c cN0 cM0, UICC IA

### Genetische Risikobewertung

Oncotype DX Recurrence Score: 18 (niedriges Risiko). 10-Jahres-Fernrezidivrisiko: 12%. Auf dieser Basis wird keine adjuvante Chemotherapie empfohlen.

### Tumorboard

Die interdisziplinäre Tumorkonferenz empfiehlt:

* Brusterhaltende Therapie (BET) mit Sentinel-LK-Biopsie
* Adjuvante Ganzbrustbestrahlung mit Boost
* Endokrine Therapie (Aromatasehemmer) für 5–10 Jahre
* Keine Chemotherapie

### Operative Therapie

Im Februar 2025 erfolgt die BET links mit Sentinel-LK-Biopsie:

* R0-Resektion
* Sentinel-LK negativ: pN0(sn) (0/2)
* Definitives pTNM: pT1c pN0(sn) cM0

### Strahlentherapie

Adjuvante Ganzbrustbestrahlung links (März–April 2025):

* 50 Gy in 25 Fraktionen
* Boost 10 Gy in 5 Fraktionen auf das Tumorbett
* Gesamtdosis: 60 Gy, 30 Sitzungen

### Endokrine Therapie

Beginn Aromatasehemmer (Letrozol 2,5 mg täglich) im Anschluss an die Strahlentherapie, geplant für mindestens 5 Jahre.

### Begleitmedikation

* Metoprolol 47,5 mg (arterielle Hypertonie, seit 2020)
* L-Thyroxin 75 µg (Hypothyreose, seit 2018)

### Nachsorge (6 Monate)

* Klinisch unauffällig, kein Anhalt für Rezidiv
* ECOG 0 (voll leistungsfähig)
* Compliance endokrine Therapie gut

## Daten in diesem IG

Alle FHIR-Ressourcen für diesen Fall sind als Beispiele im IG enthalten. Sie demonstrieren das Zusammenspiel der Profile über den gesamten Versorgungspfad:

* Patient, Condition (Diagnose), DiagnosticReports (Bildgebung, Pathologie)
* Observations (BI-RADS, Klinische Untersuchung, Gynäkologische Anamnese, Genexpressions-Score, ECOG, Verlauf)
* RiskAssessment (Genexpressionstest), FamilyMemberHistory
* CarePlan (Tumorboard-Empfehlung), ServiceRequest (OP-Planung)
* Procedures (BET, SLNB, Strahlentherapie)
* Specimen (Stanzbiopsie-Präparat)
* MedicationStatements (Begleitmedikation)

