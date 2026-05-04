# Alle Profile (Referenz) - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* [**Datenmodell**](datenmodell.md)
* **Alle Profile (Referenz)**

## Alle Profile (Referenz)

# Profile

Dieses Modul definiert FHIR-Profile für die senologische Versorgungsdokumentation. Jedes Profil spezialisiert entweder ein bestehendes MII-Profil oder eine FHIR-Basisressource.

## Diagnose

### Maligne Diagnose

**[Senologie_Diagnose_Maligne](StructureDefinition-senologie-diagnose-maligne.md)** (Condition)

Meldepflichtige Brusterkrankungen (ICD-10-GM C50, D05) einschließlich invasiver Karzinome und DCIS. Erbt vom MII-Onkologie-Profil `MII_PR_Onko_Diagnose_Primaertumor` und ergänzt senologiespezifische Anforderungen:

* Duale Kodierung: SNOMED CT (24 Diagnosecodes) und ICD-10-GM
* Diagnosesicherung nach oBDS (histologisch, zytologisch, bildgebend etc.)
* Metastasierungsstadium (nicht-/primär-/sekundär-metastasiert)
* TNM-Staging über MII-Onkologie-Referenzen

### Benigne Diagnose

**[Senologie_Diagnose_Benigne](StructureDefinition-senologie-diagnose-benigne.md)** (Condition)

Nicht-meldepflichtige Brusterkrankungen (D24, N60–N64) wie Mastopathien, Zysten, Fibroadenome und entzündliche Erkrankungen. Nutzt das FHIR-Basis-Condition-Profil, da keine Krebsregisteranforderungen bestehen.

-------

## Bildgebung

### Bildgebungsbefund

**[Senologie_Bildgebung_Befund](StructureDefinition-senologie-bildgebung-befund.md)** (DiagnosticReport)

Gesamtbefund einer Brustbildgebung (Mammographie, Sonographie, MRT, Tomosynthese) mit Modalitätskodierung über LOINC und RadLex. Referenziert einzelne Beobachtungen.

### Bildgebungs-Observation

**[Senologie_Bildgebung_Observation](StructureDefinition-senologie-bildgebung-observation.md)** (Observation)

Einzelbefunde der Bildgebung: BI-RADS-Kategorie (0–6), ACR-Dichte (A–D), Herdbefunde, Mikrokalzifikationen, Lymphknotenstatus. Kodierung über LOINC, SNOMED CT und RadLex.

### Bildgebung Sonstige

**[Senologie_Bildgebung_Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md)** (DiagnosticReport)

Nicht-mammaspezifische Bildgebung im Rahmen des Stagings oder der Verlaufskontrolle (Skelettszintigraphie, CT Thorax/Abdomen, PET-CT, Röntgen Thorax, Lebersonographie). Offene Modalitätskodierung über LOINC und SNOMED CT — die konkreten Modalitäten werden durch das Formular gesteuert.

-------

## Pathologie

### Pathologiebefund

**[Senologie_Pathologie_Befund](StructureDefinition-senologie-pathologie-befund.md)** (DiagnosticReport)

Histopathologischer Befund mit Rezeptorstatus (ER, PR, HER2, Ki-67), Grading und B3-Läsionen. Erbt von `MII_PR_Patho_Report`.

### Pathologisches Präparat

**[Senologie_Pathologie_Praeparat](StructureDefinition-senologie-pathologie-praeparat.md)** (Specimen)

Gewebeprobe mit Entnahmemethode, Zeitpunkt (intra-/präoperativ), Körperstelle und Seitenlokalisation. Erbt von `MII_PR_Patho_Specimen`.

-------

## Tumorlokalisation

**[Senologie_Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.md)** (BodyStructure)

Präzise anatomische Tumorlokalisation in der Brust: Quadrant, Uhrzeigerposition, Mamillenabstand. Erbt von `MII_PR_Bildgebung_Koerperstruktur`.

-------

## Klinische Untersuchung und Anamnese

### Klinische Untersuchung

**[Senologie_Klinische_Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md)** (Observation)

Körperliche Untersuchung der Brust mit Palpationsbefund, Hautveränderungen, Mamillenbefund und Lymphknotenstatus je Seite.

### Gynäkologische Anamnese

**[Senologie_Gynaekologische_Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.md)** (Observation)

Risikofaktoren: Menarchealter, Menopausenstatus, Schwangerschaften, Hormonersatztherapie.

### Familienanamnese

**[Senologie_Familienanamnese](StructureDefinition-senologie-familienanamnese.md)** (FamilyMemberHistory)

Familiäre Belastung für Brust- und Eierstockkrebs mit Verwandtschaftsgrad und Erkrankungsalter.

-------

## Genexpressionstest

### Risikoeinschätzung

**[Senologie_Genexpressionstest](StructureDefinition-senologie-genexpressionstest.md)** (RiskAssessment)

Genomische Rezidivrisikostratifizierung (Oncotype DX, MammaPrint, Prosigna, EndoPredict) mit qualitativem Risiko (niedrig/mittel/hoch) und Fernrezidivwahrscheinlichkeit.

### Genexpressions-Score

**[Senologie_Genexpressions_Score](StructureDefinition-senologie-genexpressions-score.md)** (Observation)

Numerischer Score des Genexpressionstests als Laborergebnis.

-------

## Operative Therapie

### Brustoperation

**[Senologie_Operation](StructureDefinition-senologie-operation.md)** (Procedure)

Brustchirurgische Eingriffe (Mastektomie, brusterhaltende OP, Axilladissektion, Rekonstruktion) mit Intention, präoperativer Markierung und intraoperativer Bildgebung. Erbt von `MII_PR_Onko_Mamma_Operation`.

### Operationsplanung

**[Senologie_OP_Planung](StructureDefinition-senologie-op-planung.md)** (ServiceRequest)

Präoperative Planung mit geplanter Dauer, Tumorkonferenzbeschluss, Markierung, Blutabnahme, Antibiotikatherapie und OP-Tisch-Lagerung. Nutzt modulspezifische Extensions.

### Operative Komplikation

**[Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.md)** (Observation)

Postoperative Komplikationen nach Clavien-Dindo-Klassifikation (Grad I–V) mit Zeitpunkt und Bezug zur ursächlichen Operation.

### Brustimplantat

**[Senologie_Implantat](StructureDefinition-senologie-implantat.md)** (Device)

Implantatdokumentation mit Typ, Hersteller, REF-Nummer und Seriennummer.

-------

## Systemische Therapie

### Therapieverfahren

**[Senologie_Systemtherapie_Procedure](StructureDefinition-senologie-systemtherapie-procedure.md)** (Procedure)

Übergeordneter Therapieverlauf (Chemotherapie, Hormontherapie, zielgerichtete Therapie, Immuntherapie) mit Intention, Zeitraum und Ergebnis. Erbt von `MII_PR_Onko_Systemische_Therapie`.

### Medikamentengabe

**[Senologie_Systemtherapie_Medikation](StructureDefinition-senologie-systemtherapie-medikation.md)** (MedicationStatement)

Einzelne Medikamentengabe mit SNOMED-CT-kodiertem Wirkstoff, Zyklus- und Tages-Tracking über Extensions. Erbt von `MII_PR_Onko_Systemische_Therapie_Medikation`.

### Geplante Systemtherapie

**[Senologie_Geplante_Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.md)** (MedicationRequest)

Therapieplanung mit Substanz, Intention (neoadjuvant, adjuvant, palliativ), Protokoll/Schema und Therapielinie.

### Therapie-Nebenwirkungen (CTCAE)

Für die Dokumentation von Nebenwirkungen der Systemtherapie und Strahlentherapie wird das MII Onko Profil **MII_PR_Onko_Nebenwirkung_Adverse_Event** (AdverseEvent) genutzt — kein eigenes Senologie-Profil. Es enthält:

* `event.coding` — Art der Nebenwirkung (CTCAE-kodiert mit Version)
* `seriousness` — CTCAE-Grad (1–5)
* `suspectEntity.instance` — Referenz auf die verursachende Therapie

Für **operative Komplikationen** wird dagegen das senologiespezifische Profil [Senologie_Operative_Komplikation](StructureDefinition-senologie-operative-komplikation.md) mit Clavien-Dindo-Klassifikation verwendet.

-------

## Strahlentherapie

**[Senologie_Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md)** (Procedure)

Bestrahlung mit Gesamtdosis, Boost, Applikationsmethode, Intention und Fraktionierung (Anzahl Sitzungen über Extension). Erbt von `MII_PR_Onko_Strahlentherapie`.

-------

## Tumorkonferenz

**[Senologie_Tumorboard_Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md)** (CarePlan)

Interdisziplinäre Therapieempfehlung mit Slices für: operative Therapie, Chemotherapie, Strahlentherapie, endokrine Therapie, zielgerichtete Therapie, Immuntherapie, antiresorptive Therapie, weitere Diagnostik, Genetik, Studienteilnahme, Nachsorge.

-------

## Extensions

Das Modul definiert Extensions für klinische Datenpunkte, die in den FHIR-Basisressourcen nicht vorgesehen sind:

| | | |
| :--- | :--- | :--- |
| [OperationsDuration](StructureDefinition-ex-senologie-operations-duration.md) | ServiceRequest | Geplante OP-Dauer |
| [TumorConferenceConsent](StructureDefinition-ex-senologie-tumor-conference-consent.md) | ServiceRequest | Tumorkonferenzbeschluss |
| [PreOpMarkierung](StructureDefinition-ex-senologie-pre-op-markierung.md) | ServiceRequest | Präoperative Markierung |
| [PreOpBlutabnahme](StructureDefinition-ex-senologie-pre-op-blutabnahme.md) | ServiceRequest | Präoperative Blutabnahme |
| [PreOpAntibiotikatherapie](StructureDefinition-ex-senologie-pre-op-antibiotikatherapie.md) | ServiceRequest | Antibiotikaprophylaxe |
| [OperatingTableSetup](StructureDefinition-ex-senologie-operating-table-setup.md) | ServiceRequest | OP-Tisch-Lagerung |
| [SessionCount](StructureDefinition-ex-senologie-session-count.md) | Procedure | Anzahl Bestrahlungssitzungen |
| [TherapyCycle](StructureDefinition-ex-senologie-therapy-cycle.md) | MedicationStatement | Therapiezyklus-Nummer |
| [DayInCycle](StructureDefinition-ex-senologie-day-in-cycle.md) | MedicationStatement | Tag im Therapiezyklus |
| [ExaminationLocation](StructureDefinition-ex-senologie-examination-location.md) | DiagnosticReport | Untersuchungsort |
| [TherapyLine](StructureDefinition-ex-senologie-therapy-line.md) | MedicationRequest | Therapielinie |

