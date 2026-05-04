# Artifacts Summary - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [BIH LM Senologie LogicalModel](StructureDefinition-LogicalModelSenologie.md) | LogicalModel der BIH-Spezifikation des Moduls Senologie |
| [IQTIG QS 18.1 Mammachirurgie (Logical Model)](StructureDefinition-iqtig-mammachirurgie-181.md) | Logisches Modell des IQTIG-Datensatzes fuer das QS-Verfahren 18.1 Mammachirurgie (Spezifikation 2024 V05).Der Datensatz besteht aus drei Teildatensaetzen:* Teildatensatz Basis (B): Patienten- und Falldaten
* Teildatensatz Brust (BRUST): Brustspezifische Diagnose- und Befunddaten
* Teildatensatz Operation (O): Operation, Histologie, Pathologie, Resektionsstatus
Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung einer IQTIG-konformen QS-Meldung aus einem Senologie-FHIR-Bundle. Die Serialisierung (CSV / XML) ist nicht Bestandteil dieses Modells. |
| [IRegG Brustimplantat Meldung (Logical Model)](StructureDefinition-ireg-brustimplantat-meldung.md) | Logisches Modell der GEMeldung fuer Brustimplantate gemaess IRegD XML-Spezifikation V4.1.1.Dieses Modell bildet die Hierarchie der XML-Nachricht ab, beschraenkt auf den Brustimplantat-Anteil (ohne Endoprothese und Aortenklappe). Es dient als StructureMap-Target fuer die Erzeugung von IRegG-XML-Meldungen aus FHIR-Ressourcen.Mapping-Uebersicht:* Meldung (MEL_*) -> MessageHeader + Organization
* Fall (FAL_*) -> Encounter
* PatientenaufnahmeBrustimplantat (PAT_* + PAB_*) -> Patient + Observations
* Operation (OPE_* + OBI_*) -> Procedure
* Artikelidentifikation (ARI_* + ARB_* + ABI_*) -> Device
* Zubehoer (ZUB_* + ZBI_*) -> Device
* Entlassung (ENT_* + DBI_*) -> Encounter.hospitalization + Condition
 |
| [OncoBox Brust N1.1.1 Meldung (Logical Model)](StructureDefinition-oncobox-brust-meldung.md) | Logisches Modell einer OncoBox-Brust-Meldung gemaess OnkoZert-Spezifikation N1.1.1.Die OncoBox Brust ist das XML-basierte Exportformat fuer die jaehrliche Uebermittlung von Fall- und Qualitaetsindikatordaten zertifizierter Brustzentren an OnkoZert (DKG-Zertifizierung). Der Datensatz besteht aus folgenden Hauptkomponenten:* **Zentrum** – Kennung und Berichtszeitraum
* **Primaerfall** – Patienten- und Falldaten (Primaerfallarten nach OnkoZert-Systematik)
* **Diagnose** – Diagnoseinformationen (ICD-10-GM, TNM, Bildgebung, Histologie)
* **Therapie** – Operationen, Systemtherapie, Strahlentherapie, Hormontherapie, Trastuzumab
* **Tumorkonferenz** – Praetherapeutische und postoperative Fallbesprechung
* **Versorgungskette** – Psychoonkologie, Sozialdienst, Studienteilnahme
* **Nachsorge / Outcome** – Rezidiv, Metastasierung, Tod
* **Kennzahlen (KB-1 bis KB-20)** – DKG-Qualitaetsindikatoren
Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung einer OncoBox-Brust-konformen Meldung aus einem Senologie-FHIR-Bundle. Die Serialisierung (XML) ist nicht Bestandteil dieses Modells. |
| [oBDS Meldung](StructureDefinition-obds-meldung.md) | Logisches Modell einer oBDS-Meldung (Onkologischer Basisdatensatz v3.0.5). Bildet die XML-Struktur einer einzelnen Meldung ab, wie sie von Meldestellen an die Krebsregister übermittelt wird. |

### Structures: Questionnaires 

These define forms used by systems conforming to this implementation guide to capture or expose data to end users.

| | |
| :--- | :--- |
| [Fragebogen: Bildgebung Mamma](Questionnaire-senologie-bildgebung.md) | Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure. |
| [Fragebogen: Diagnose Mamma](Questionnaire-senologie-diagnose.md) | Fragebogen zur Erfassung der senologischen Diagnose. Unterstützt das gesamte Spektrum von invasivem Karzinom über DCIS und B3-Läsionen bis hin zu benignen Befunden. Nutzt SDC Template-based Extraction zur Erzeugung einer Condition-Ressource. |
| [Fragebogen: Erstanamnese](Questionnaire-senologie-erstanamnese.md) | Fragebogen zur Erstanamnese (Allgemeine Anamnese, Gynäkologische Anamnese, Familienanamnese). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Observation, FamilyMemberHistory). |
| [Fragebogen: Klinische Untersuchung Mamma](Questionnaire-senologie-klinische-untersuchung.md) | Fragebogen zur strukturierten Dokumentation der klinischen Brustuntersuchung. Nutzt SDC Template-based Extraction mit dem Senologie_Klinische_Untersuchung-Profil (Observation) als Ziel. Das Extraction-Template liegt unter input/resources/Questionnaire-senologie-klinische-untersuchung-template.json. |
| [Fragebogen: OP Planung](Questionnaire-senologie-op-planung.md) | Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel. |
| [Fragebogen: Pathologie Befund](Questionnaire-senologie-pathologie.md) | Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation. |
| [Fragebogen: Postoperative Dokumentation](Questionnaire-senologie-postop.md) | Fragebogen zur postoperativen Dokumentation (Operative Therapie, Komplikationen, Postoperative Anordnungen/Follow-up). Nutzt SDC Template-based Extraction mit zwei contained Templates: Procedure (Senologie_Operation) und Observation (Senologie_Operative_Komplikation). |
| [Fragebogen: Senologie Diagnose](Questionnaire-senologie-diagnose-maligne.md) |  |
| [Fragebogen: Strahlentherapie](Questionnaire-senologie-strahlentherapie-quest.md) | Fragebogen zur strukturierten Dokumentation der Strahlentherapie in der Senologie. Nutzt SDC Definition-based Extraction mit Procedure als Ziel. |
| [Fragebogen: Systemische Therapie](Questionnaire-senologie-systemtherapie.md) | Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Definition-based Extraction mit mehreren Gruppen (Procedure, MedicationStatement, Observation). |
| [Fragebogen: Tumorboard Empfehlung](Questionnaire-senologie-tumorboard.md) | Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinären Tumorkonferenz. Nutzt SDC Template-based Extraction mit contained CarePlan und templateExtractValue-Annotationen. |
| [Fragebogen: Verlaufsdokumentation / Nachsorge](Questionnaire-senologie-verlauf.md) | Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Template-based Extraction mit contained Templates für Klinischen Status und Tumorstatus. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [BIH LM Senologie Brustimplantat](StructureDefinition-senologie-implantat.md) | Brustimplantate im Rahmen der BIH-Spezifikation des Moduls Senologie |
| [BIH LM Senologie Brustwand-Operation](StructureDefinition-senologie-operation.md) | Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation. |
| [BIH PR Seno Diagnose Benigne](StructureDefinition-senologie-diagnose-benigne.md) | Benigne Mamma-Diagnosen (D24, N60-N64) und entzündliche Erkrankungen. ISiK-kompatibel für Krankenhaus-Interoperabilität ohne Krebsregister-Anforderungen. |
| [BIH PR Seno Diagnose Maligne](StructureDefinition-senologie-diagnose-maligne.md) | Maligne Mamma-Diagnosen (C50, D05) für Krebsregister-Meldung. Basiert auf MII PR Onko Diagnose Primärtumor mit oBDS-konformer Diagnosesicherung und Staging. |
| [BIH PR Seno Genexpressions-Score](StructureDefinition-senologie-genexpressions-score.md) | Observation für den numerischen Score-Wert eines Genexpressionstests (Oncotype DX Recurrence Score, MammaPrint Index, Prosigna ROR Score, EndoPredict EPclin Score) |
| [BIH PR Seno Genexpressionstest](StructureDefinition-senologie-genexpressionstest.md) | RiskAssessment für genomische Risikoscores bei Mammakarzinom (Oncotype DX, MammaPrint, Prosigna, EndoPredict). Bildet die Risikoklassifikation ab und referenziert die Score-Observation. |
| [BIH Senologie Begleitmedikation](StructureDefinition-senologie-begleitmedikation.md) | Begleitmedikation der Patientin – aktuelle Dauermedikation und sonstige Medikamente, die nicht Teil der onkologischen Systemtherapie sind (z. B. Antihypertensiva, Schilddrüsenhormone, Antikoagulantien). |
| [BIH Senologie Bildgebung Befund](StructureDefinition-senologie-bildgebung-befund.md) | DiagnosticReport für Befunde bildgebender Verfahren (Mammographie, Sonographie, MRT, Tomosynthese, etc.) aus dotbase Questionnaire 'Bildgebung Mamma V1.0' |
| [BIH Senologie Bildgebung Observation](StructureDefinition-senologie-bildgebung-observation.md) | Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status) aus dotbase Questionnaire 'Bildgebung Mamma V1.0' |
| [BIH Senologie Bildgebung Sonstige](StructureDefinition-senologie-bildgebung-sonstige.md) | DiagnosticReport für nicht-mammaspezifische Bildgebung im Rahmen des Stagings oder der Verlaufskontrolle (z.B. Skelettszintigraphie, CT, PET-CT, Röntgen Thorax, Lebersonographie). |
| [BIH Senologie Checkliste Erbliche Belastung](StructureDefinition-senologie-checkliste-erbliche-belastung.md) | Observation für die DKG-Checkliste zur Identifikation erblicher Tumorbelastung (D24/D25). Erfasst ob die Checkliste durchgeführt wurde und ggf. den Score. |
| [BIH Senologie Familienanamnese](StructureDefinition-senologie-familienanamnese.md) | FamilyMemberHistory für familiäre Belastung mit Mamma- und Ovarialkarzinom aus dotbase Questionnaire 'Familienanamnese' |
| [BIH Senologie Follow-Up (Verlaufsmeldung)](StructureDefinition-senologie-follow-up.md) | Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art als method (M03), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor-Flag (M08). Vitalstatus (M04) wird ueber Patient.deceased abgebildet. Zweittumor-Details (M09-M10) werden als eigene Condition dokumentiert. |
| [BIH Senologie Geplante Systemtherapie](StructureDefinition-senologie-geplante-systemtherapie.md) | MedicationRequest für geplante Systemtherapie aus dotbase Questionnaire 'Geplante Systemtherapie' |
| [BIH Senologie Gynäkologische Anamnese](StructureDefinition-senologie-gynaekologische-anamnese.md) | Observation für gynäkologische Anamnese (Menarche, Menopause, Schwangerschaften, HRT) aus dotbase Questionnaire 'Gynäkologische Anamnese' |
| [BIH Senologie Ki-67 Proliferationsindex](StructureDefinition-senologie-ki67-proliferationsindex.md) | Ki-67-Proliferationsindex (%) aus immunhistochemischer Untersuchung. Kein MII-Onko-Profil vorhanden — senologiespezifisch, orientiert am MII ER/PR-Muster (LOINC-Code + valueQuantity %). |
| [BIH Senologie Klinische Untersuchung](StructureDefinition-senologie-klinische-untersuchung.md) | Observation für klinische Brustuntersuchung (Mammabefund pro Seite) aus dotbase Questionnaire 'Klinische Untersuchung' |
| [BIH Senologie Nebenwirkung](StructureDefinition-senologie-nebenwirkung.md) | AdverseEvent für CTCAE-Nebenwirkungsgrading unter Systemtherapie. Erbt MedDRA-Kodierung und CTCAE-Grad von MII Onko Nebenwirkung. |
| [BIH Senologie OP Planung](StructureDefinition-senologie-op-planung.md) | ServiceRequest für OP Planung aus dotbase Questionnaire 'OP Planung ärztlich V1.0' |
| [BIH Senologie Operative Komplikation](StructureDefinition-senologie-operative-komplikation.md) | Observation für postoperative Komplikationen mit Clavien-Dindo-Klassifikation aus dotbase Questionnaire 'Operative Komplikation(en) V2.0'. Folgt dem MII Prostata Clavien-Dindo Muster (Observation statt AdverseEvent). |
| [BIH Senologie PD-L1 Status](StructureDefinition-senologie-pdl1-status.md) | PD-L1 Immunhistochemie-Befund für Mamma-Karzinom. Erbt TPS, CPS, ICS und TC-Score Slices vom MII MTB PD-L1 Profil. Klinisch relevant bei TNBC (Pembrolizumab-Indikation bei CPS >= 10, KEYNOTE-522). |
| [BIH Senologie Pathologie Befund](StructureDefinition-senologie-pathologie-befund.md) | DiagnosticReport für pathologische Befunde aus dotbase Questionnaire 'Pathologie'. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert. |
| [BIH Senologie Pathologisches Präparat](StructureDefinition-senologie-pathologie-praeparat.md) | Specimen für pathologische Präparate aus dotbase (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details |
| [BIH Senologie Psychoonkologische Mitbetreuung](StructureDefinition-senologie-psychoonkologie.md) | Procedure fuer psychoonkologische Mitbetreuung (OncoBox KB-9). status=completed + performedDateTime zeigt 'erfolgt=ja' an, status=not-done zeigt 'erfolgt=nein' an. |
| [BIH Senologie Somatische Mutation](StructureDefinition-senologie-somatische-mutation.md) | Somatischer Mutationsstatus für BRCA1, BRCA2 und PALB2 im Tumorgewebe. Erbt Gen-Kodierung und Ausprägung von MII Onko Genetische Variante. |
| [BIH Senologie Sozialdienst-Kontakt](StructureDefinition-senologie-sozialdienst.md) | Procedure für Sozialdienst-Kontakt (OncoBox 2.0 L02, DKG OF-14). Erfasst ob eine Sozialdienst-Beratung stattgefunden hat und wann. |
| [BIH Senologie Strahlentherapie](StructureDefinition-senologie-strahlentherapie.md) | Procedure für Strahlentherapie aus dotbase Questionnaire 'Strahlentherapie ESP-PECS'. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung. |
| [BIH Senologie Studienteilnahme](StructureDefinition-senologie-studienteilnahme.md) | ResearchSubject für klinische Studienteilnahme in der Senologie aus dotbase Questionnaire 'Studien'. Bildet Studienname, Screeningstatus, Studienscreening, Studienarm, Aufklärungsdatum, Teilnahmestatus und Kontaktperson ab. |
| [BIH Senologie Systemtherapie (übergeordnet)](StructureDefinition-senologie-systemtherapie-procedure.md) | Procedure für übergeordnete Systemtherapie-Dokumentation. Erbt Intention, outcome und usedCode von MII Onko Systemtherapie. |
| [BIH Senologie Systemtherapie Medikation (einzelne Gabe)](StructureDefinition-senologie-systemtherapie-medikation.md) | MedicationStatement für einzelne Medikamentengaben aus dotbase. Erbt ATC/UNII-Codierung und partOf:systemischeTherapie von MII Onko. |
| [BIH Senologie Tumorboard Empfehlung](StructureDefinition-senologie-tumorboard-empfehlung.md) | CarePlan für Empfehlungen der interdisziplinären Tumorkonferenz (Tumorboard) aus dotbase Questionnaire 'Empfehlung der interdisziplinären Tumorkonferenz V2.0' |
| [BIH Senologie Tumorlokalisation](StructureDefinition-senologie-tumorlokalisation.md) | BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand) |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Anzahl Bestrahlungssitzungen](StructureDefinition-ex-senologie-session-count.md) | Anzahl der Bestrahlungssitzungen — MII Onko hat kein Fraktionszahl-Element |
| [Aufklärungsdatum](StructureDefinition-ex-senologie-aufklaerungsdatum.md) | Datum der Aufklärung der Patientin über die Studie |
| [CA-Behandlung/Tumorkonferenz-Zustimmung](StructureDefinition-ex-senologie-tumor-conference-consent.md) | CA-Behandlung / Tumorkonferenz-Zustimmung (Ja/Nein) — kein natives FHIR-Äquivalent |
| [Einzeldosis pro Fraktion](StructureDefinition-ex-senologie-einzeldosis.md) | Einzeldosis pro Bestrahlungsfraktion in Gy — OncoBox 2.0 H10, oBDS Einzeldosis |
| [First-Line-Therapie bei Metastasierung](StructureDefinition-ex-senologie-first-line-therapy.md) | Flag ob es sich um die First-Line-Therapie bei metastasierter Situation handelt (OncoBox I02 / KB-8) |
| [Geplante OP-Dauer](StructureDefinition-ex-senologie-operations-duration.md) | Geplante OP-Dauer in Minuten — ServiceRequest hat kein duration-Element |
| [Kontaktperson Studie](StructureDefinition-ex-senologie-studienkontakt.md) | Kontaktperson für die klinische Studie — kein natives FHIR-Äquivalent in ResearchSubject |
| [OP-Lagerung/Tischanordnung](StructureDefinition-ex-senologie-operating-table-setup.md) | OP-Lagerung und Tischanordnung — kein natives FHIR-Äquivalent |
| [Primaerfallart](StructureDefinition-ex-senologie-primaerfallart.md) | OnkoZert-Primaerfallart als expliziter Override (OncoBox 2.0 D01). Ergänzt die ICD-basierte Ableitung im SM für Fälle wie Rezidiv (Code 3), die nicht aus dem ICD-Prefix ableitbar sind. |
| [Präoperative Antibiotikatherapie](StructureDefinition-ex-senologie-pre-op-antibiotikatherapie.md) | Präoperative Antibiotikatherapie — kein natives FHIR-Äquivalent |
| [Präoperative Blutabnahme](StructureDefinition-ex-senologie-pre-op-blutabnahme.md) | Präoperative Blutabnahme geplant — kein natives FHIR-Äquivalent |
| [Präoperative Markierung](StructureDefinition-ex-senologie-pre-op-markierung.md) | Präoperative Markierung geplant — ServiceRequest hat kein usedCode |
| [Screening zur Studienteilnahme](StructureDefinition-ex-senologie-studienscreening.md) | OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Erfasst, ob die Patientin aktiv auf eine mögliche Studienteilnahme geprüft wurde — unabhängig vom Ergebnis (Screeningstatus). |
| [Screeningstatus](StructureDefinition-ex-senologie-screeningstatus.md) | Screeningstatus der Studienteilnahme — kein natives FHIR-Äquivalent in ResearchSubject |
| [Simultane Radiochemotherapie](StructureDefinition-ex-senologie-simultane-radiochemotherapie.md) | Flag ob die Strahlentherapie simultan mit Chemotherapie durchgeführt wurde (OncoBox 2.0 H03) |
| [Standort der Untersuchung](StructureDefinition-ex-senologie-examination-location.md) | Standort/Einrichtung der bildgebenden Untersuchung — DiagnosticReport hat kein location-Element |
| [Studienname (kodiert)](StructureDefinition-ex-senologie-studienname-code.md) | OncoBox 2.0 K02: Kodierter Studienname aus Auswahlliste. Ergänzt die study-Referenz um einen strukturierten Code für die OncoBox-Meldung. |
| [Tag im Zyklus](StructureDefinition-ex-senologie-day-in-cycle.md) | Tag innerhalb eines Therapie-Zyklus — MII Onko hat kein day-in-cycle |
| [Therapie-Zyklus](StructureDefinition-ex-senologie-therapy-cycle.md) | Nummer des Therapie-Zyklus (1, 2, 3, etc.) — MII Onko hat kein cycle tracking |
| [Therapielinie](StructureDefinition-ex-senologie-therapy-line.md) | Therapielinie (1. Linie, 2. Linie, etc.) — kein natives FHIR-Äquivalent |
| [Zentrumsfall](StructureDefinition-ex-senologie-zentrumsfall.md) | DKG-Zertifizierungsstatus: true = Zentrumsfall/Primärfall, false = kein Primärfall (OncoBox 2.0 D01) |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [BIH LM Senologie Operation](ValueSet-vs-senologie-operation-art.md) | Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie |
| [VS OncoBox Primaerfallart](ValueSet-vs-oncobox-primaerfallart.md) | Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01) |
| [VS Senologie B3 Läsionen](ValueSet-vs-senologie-diagnose-b3.md) | B3 Läsionen der Mamma nach S3-Leitlinie |
| [VS Senologie Diagnose](ValueSet-vs-senologie-diagnose.md) | Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes |
| [VS Senologie Diagnose Lokal](ValueSet-vs-senologie-diagnose-lokal.md) | Lokale Senologie-Codes ohne SNOMED CT Mapping (Binding für senologie-Slice) |
| [VS Senologie Diagnose SNOMED CT](ValueSet-vs-senologie-diagnose-sct.md) | SNOMED CT Diagnosen für maligne Mamma-Erkrankungen (Binding für sct-Slice) |
| [VS Senologie Genexpressionstest](ValueSet-vs-senologie-genexpressionstest.md) | Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom |
| [VS Senologie Metastasierung](ValueSet-vs-senologie-metastasierung.md) | Metastasierungsstatus - lokale Codes basierend auf Dotbase |
| [VS Senologie Nachsorge Art](ValueSet-vs-senologie-nachsorge-art.md) | Art der Nachsorge: aktiv (persönliche Untersuchung) oder passiv (Akten/Register) — OncoBox M03 |
| [VS Senologie Risikoklasse](ValueSet-vs-senologie-risikoklasse.md) | Risikokategorien für Genexpressionstests (low, intermediate, high) |
| [VS Senologie Screeningstatus](ValueSet-vs-senologie-screeningstatus.md) | Screeningstatus einer klinischen Studienteilnahme |
| [VS Senologie Seite](ValueSet-vs-senologie-seite.md) | Lateralität der Mamma-Erkrankung |
| [VS Senologie Studienname](ValueSet-vs-senologie-studienname.md) | Auswahlliste klinischer Studien am Brustzentrum (OncoBox 2.0 K02). Enthält häufige Mammakarzinom-Studien. Die Liste ist erweiterbar (extensible Binding). |
| [VS Senologie Systemtherapie Medikation](ValueSet-vs-senologie-systemtherapie-medikation.md) | Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01) |
| [VS Senologie Tumormanifestation](ValueSet-vs-senologie-tumormanifestation.md) | Tumormanifestation bei Diagnosestellung (Mehrfachauswahl möglich) |
| [VS Senologie Zweittumor](ValueSet-vs-senologie-zweittumor.md) | Zweittumor diagnostiziert: ja/nein/unbekannt — OncoBox M08 |
| [ValueSet Diagnosesicherung](ValueSet-vs-senologie-diagnosesicherung.md) | Art der Diagnosesicherung gemäß oBDS für onkologische Diagnosen |
| [ValueSet Senologie ICD-10-GM](ValueSet-vs-senologie-icd10.md) | ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [CS OncoBox Primaerfallart](CodeSystem-cs-oncobox-primaerfallart.md) | Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01) |
| [CS Senologie Diagnose Lokal](CodeSystem-cs-senologie-diagnose-lokal.md) | Lokale Codes für Mamma-Diagnosen ohne SNOMED CT Mapping (basierend auf Dotbase) |
| [CS Senologie Follow-Up](CodeSystem-cs-senologie-follow-up.md) | Lokale Codes für Senologie-Verlaufsmeldungen (OncoBox M01-M10). Enthält Codes für Observation.method (Nachsorge-Art), Zweittumor-Komponentencode und Wertcodes. |
| [CS Senologie Genexpressionstest](CodeSystem-cs-senologie-genexpressionstest.md) | Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom |
| [CS Senologie Metastasierung](CodeSystem-cs-senologie-metastasierung.md) | Metastasierungsstatus für Senologie |
| [CS Senologie Studienname](CodeSystem-cs-senologie-studienname.md) | Auswahlliste klinischer Studien am Brustzentrum für die OncoBox 2.0 Meldung (K02). Enthält häufige interventionelle und nicht-interventionelle Mammakarzinom-Studien. |
| [CS Senologie Tumormanifestation](CodeSystem-cs-senologie-tumormanifestation.md) | Klassifikation der Tumormanifestation bei Diagnosestellung |
| [CodeSystem Diagnosesicherung](CodeSystem-cs-senologie-diagnosesicherung.md) | Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz) |

### Terminology: Structure Maps 

These define transformations to convert between data structures used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Extract Senologie Diagnose from QuestionnaireResponse](StructureMap-extract-diagnose.md) |  |
| [SenologieToIRegEntlassung](StructureMap-SenologieToIRegEntlassung.md) | title: Senologie Encounter + Condition to IRegG Entlassung + DiagnoseBrustimplantat status: draft |
| [SenologieToIRegMeldung](StructureMap-SenologieToIRegMeldung.md) | title: Senologie FHIR Bundle to IRegG Brustimplantat-Meldung (Orchestrator) status: draft |
| [SenologieToIRegOperation](StructureMap-SenologieToIRegOperation.md) | title: Senologie Procedure + Device to IRegG Operation + Artikelidentifikation status: draft |
| [SenologieToIqtigBasis](StructureMap-SenologieToIqtigBasis.md) | title: Senologie Patient + Encounter to IQTIG 18.1 Teildatensatz Basis status: draft |
| [SenologieToIqtigBrust](StructureMap-SenologieToIqtigBrust.md) | title: Senologie Condition + Pathologie to IQTIG 18.1 Teildatensatz Brust status: draft |
| [SenologieToIqtigMammachirurgie181](StructureMap-SenologieToIqtigMammachirurgie181.md) | title: Senologie FHIR Bundle to IQTIG QS 18.1 Mammachirurgie (Orchestrator) status: draft |
| [SenologieToIqtigOperation](StructureMap-SenologieToIqtigOperation.md) | title: Senologie Procedure + Specimen to IQTIG 18.1 Teildatensatz Operation status: draft |
| [SenologieToObdsDiagnose](StructureMap-SenologieToObdsDiagnose.md) | title: Senologie Diagnose Bundle to oBDS Diagnosemeldung status: draft |
| [SenologieToObdsFernmetastasen](StructureMap-SenologieToObdsFernmetastasen.md) | title: Senologie Fernmetastasen Observations to oBDS Fernmetastasen BackboneElement status: draft |
| [SenologieToObdsHistologie](StructureMap-SenologieToObdsHistologie.md) | title: Senologie Histologie Observations to oBDS Histologie BackboneElement status: draft |
| [SenologieToObdsLeistungszustand](StructureMap-SenologieToObdsLeistungszustand.md) | title: Senologie ECOG Observation to oBDS Allgemeiner Leistungszustand status: draft |
| [SenologieToObdsMeldung](StructureMap-SenologieToObdsMeldung.md) | title: Senologie FHIR Bundle to oBDS Meldung (Master Orchestrator) status: draft |
| [SenologieToObdsModulMamma](StructureMap-SenologieToObdsModulMamma.md) | title: Senologie Mamma-Observations to oBDS Modul_Mamma BackboneElement status: draft |
| [SenologieToObdsNebenwirkung](StructureMap-SenologieToObdsNebenwirkung.md) | title: Senologie Nebenwirkung Observations to oBDS Nebenwirkungen BackboneElement status: draft |
| [SenologieToObdsOP](StructureMap-SenologieToObdsOP.md) | title: Senologie Operation Bundle to oBDS OP-Meldung status: draft |
| [SenologieToObdsResidualstatus](StructureMap-SenologieToObdsResidualstatus.md) | title: Senologie Residualstatus Observation to oBDS Residualstatus BackboneElement status: draft |
| [SenologieToObdsST](StructureMap-SenologieToObdsST.md) | title: Senologie FHIR to oBDS Strahlentherapie (ST) status: draft |
| [SenologieToObdsSYST](StructureMap-SenologieToObdsSYST.md) | title: Senologie FHIR to oBDS Systemische Therapie (SYST) status: draft |
| [SenologieToObdsTNM](StructureMap-SenologieToObdsTNM.md) | title: Senologie TNM Observations to oBDS TNM BackboneElement status: draft |
| [SenologieToObdsTod](StructureMap-SenologieToObdsTod.md) | title: Senologie Patient + Conditions to oBDS Todesmeldung status: draft |
| [SenologieToObdsTumorkonferenz](StructureMap-SenologieToObdsTumorkonferenz.md) | title: Senologie FHIR to oBDS Tumorkonferenz status: draft |
| [SenologieToObdsTumorzuordnung](StructureMap-SenologieToObdsTumorzuordnung.md) | title: Senologie Diagnose to oBDS Tumorzuordnung status: draft |
| [SenologieToObdsVerlauf](StructureMap-SenologieToObdsVerlauf.md) | title: Senologie Verlauf Bundle to oBDS Verlaufsmeldung status: draft |
| [SenologieToOncoBoxBrust](StructureMap-SenologieToOncoBoxBrust.md) | title: Senologie FHIR Bundle to OncoBox Brust N1.1.1 (Orchestrator) status: draft |
| [SenologieToOncoBoxBrustKennzahlen](StructureMap-SenologieToOncoBoxBrustKennzahlen.md) | title: Senologie Bundle to OncoBox Brust DKG-Kennzahlen (KB-1 bis KB-20) status: draft |
| [SenologieToOncoBoxBrustOperation](StructureMap-SenologieToOncoBoxBrustOperation.md) | title: Senologie Procedure + Specimen to OncoBox Brust Operation status: draft |
| [SenologieToOncoBoxBrustPrimaerfall](StructureMap-SenologieToOncoBoxBrustPrimaerfall.md) | title: Senologie Condition + Patient + Encounter to OncoBox Brust Primaerfall status: draft |
| [SenologieToOncoBoxBrustTherapie](StructureMap-SenologieToOncoBoxBrustTherapie.md) | title: Senologie Procedure (Syst / RT) to OncoBox Brust Therapie status: draft |
| [SenologieToOncoBoxBrustVerlauf](StructureMap-SenologieToOncoBoxBrustVerlauf.md) | title: Senologie Bundle to OncoBox Brust Verlauf (inkl. OncoBox 2.0 FM-Felder J03-J05) status: draft |
| [SenologieToOncoBoxBrustZentrum](StructureMap-SenologieToOncoBoxBrustZentrum.md) | title: Senologie Organization to OncoBox Brust Zentrum status: draft |

### Terminology: Concept Maps 

These define transformations to convert between codes by systems conforming with this implementation guide.

| | |
| :--- | :--- |
| [CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie](ConceptMap-cm-sct-to-icdo3-mamma-topographie.md) | Übersetzung der SNOMED-CT-kodierten Brustquadranten in ICD-O-3 Topographie-Codes (C50.0–C50.9) für die oBDS-Krebsregistermeldung. Quelle: BodyStructure.locationQualifier[quadrant]. |
| [ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie)](ConceptMap-CM-Senologie-Medikation-SCT-ASK.md) | Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf Arzneistoffkatalog (ASK, BfArM 2026). Validiert über fhir-terminology MCP Server. |
| [ConceptMap: SNOMED CT → ATC (Senologie Systemtherapie)](ConceptMap-CM-Senologie-Medikation-SCT-ATC.md) | Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf ATC (BfArM 2026). Validiert über fhir-terminology MCP Server gegen lokale Snowstorm- und ATC-Instanz. |
| [MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis](ConceptMap-cm-oncobox-verlauf-gesamtbeurteilung-ereignis.md) | Mapping der MII Onko Verlauf-Gesamtbeurteilung auf OncoBox Verlauf_Ereignis. Stabile Zustaende (V, T, K, B, R) erzeugen kein Verlaufsereignis. P (Progression) wird auf 6 (Progress) gemappt, Y (Rezidiv) auf 1 (Lokalrezidiv als Default). D (divergent) und U/X (unbekannt/fehlend) werden nicht gemappt. |
| [OncoBox Endokrine Substanzklasse zu ATC](ConceptMap-cm-oncobox-endokrine-substanz-atc.md) | Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor) |
| [SNOMED CT to oBDS Fernmetastasen-Lokalisation](ConceptMap-cm-sct-to-obds-fm-lokalisation.md) | Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.) |
| [SNOMED CT to oBDS Grading](ConceptMap-cm-sct-to-obds-grading.md) | Mapping von SNOMED CT Gradingcodes zu oBDS Grading (1, 2, 3, 4, X, L, M, H, B) |
| [SNOMED CT to oBDS Intention](ConceptMap-cm-sct-to-obds-intention.md) | Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X) |
| [SNOMED CT to oBDS Residualstatus](ConceptMap-cm-sct-to-obds-residualstatus.md) | Mapping von SNOMED CT UICC R-Klassifikation zu oBDS Residualstatus (R0, R1, R2, RX) |
| [SNOMED CT to oBDS Seitenlokalisation](ConceptMap-cm-sct-to-obds-seitenlokalisation.md) | Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U) |
| [SNOMED CT to oBDS Therapie-Stellung zur OP](ConceptMap-cm-sct-to-obds-therapiestellung.md) | Mapping von SNOMED CT Codes zu oBDS Stellung zur OP (O, A, N, I, Z, S) |
| [SNOMED CT to oBDS Therapieart](ConceptMap-cm-sct-to-obds-therapieart.md) | Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST) |
| [SNOMED CT to oBDS Verlauf Gesamtbeurteilung](ConceptMap-cm-sct-to-obds-verlauf-gesamtbeurteilung.md) | Mapping von SNOMED CT Tumorstatusbewertungen zu oBDS Gesamtbeurteilung Tumorstatus (V, T, K, P, U, X) |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Beispiel Skelettszintigraphie (Staging)](DiagnosticReport-Example-Bildgebung-Skelettszintigraphie.md) | Skelettszintigraphie im Rahmen des Stagings bei Mammakarzinom — kein Hinweis auf ossäre Metastasen. |
| [Beispiel: ADAPT-HER2 Studie](ResearchStudy-Example-ResearchStudy-ADAPT-HER2.md) | Fiktive klinische Studie ADAPT-HER2 für Mammakarzinom |
| [Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen](Procedure-Example-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links mit 50 Gy in 25 Fraktionen nach BET |
| [Beispiel: BET links mit Sentinel-LK-Biopsie](Procedure-Example-Operation-BET.md) | Brusterhaltende Therapie (BET) links mit intraoperativer Sentinel-Lymphknoten-Biopsie |
| [Beispiel: BI-RADS 1 rechts](Observation-Example-Bildgebung-BiRADS-Rechts.md) | BI-RADS 1 Befund der rechten Brust bei Mammographie |
| [Beispiel: BI-RADS 5 links](Observation-Example-Bildgebung-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust bei Mammographie |
| [Beispiel: Begleitmedikation Metoprolol 47,5 mg](MedicationStatement-Example-Begleitmedikation-Metoprolol.md) | Patientin nimmt Metoprolol 47,5 mg 1x täglich wegen arterieller Hypertonie. |
| [Beispiel: DCIS rechts](Condition-Example-Diagnose-DCIS.md) | Duktales Carcinoma in situ der rechten Brust, mammographisch entdeckt |
| [Beispiel: Epirubicin 90 mg/m², Zyklus 1, Tag 1](MedicationStatement-Example-Medikation-Epirubicin.md) | Einzelgabe Epirubicin im Rahmen des EC-T Schemas, Zyklus 1, Tag 1 |
| [Beispiel: Invasiv-duktales Karzinom G2, ER+/PR+/HER2-](DiagnosticReport-Example-Pathologie-Befund.md) | Pathologischer Befund nach Stanzbiopsie: invasiv-duktales Karzinom, G2, Hormonrezeptor-positiv, HER2-negativ |
| [Beispiel: Mammakarzinom links](Condition-Example-Diagnose-Mammakarzinom.md) | Primäres Mammakarzinom der linken Brust, Stadium II, histologisch gesichert |
| [Beispiel: Mammakarzinom-Rezidiv](Condition-Example-Diagnose-Rezidiv.md) | Lokalrezidiv eines Mammakarzinoms nach brusterhaltender Therapie |
| [Beispiel: Mammographie bilateral, BI-RADS 5 links](DiagnosticReport-Example-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund links (BI-RADS 5) und unauffälligem Befund rechts (BI-RADS 1) |
| [Beispiel: Neoadjuvante Chemotherapie EC-T](Procedure-Example-Systemtherapie-ECT.md) | Neoadjuvante Chemotherapie mit Epirubicin/Cyclophosphamid gefolgt von Docetaxel (EC-T Schema) |
| [Beispiel: Pathologische Diagnose/Conclusion](Observation-Example-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Beispiel: Patientin](Patient-example-patient.md) | Beispiel-Patientin für Senologie-Instanzen |
| [Beispiel: Sentinel-Lymphknoten-Biopsie links](Procedure-Example-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [Beispiel: Stanzbiopsie-Präparat links OAQ](Specimen-Example-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [Beispiel: Studienteilnahme ADAPT-HER2](ResearchSubject-Example-Studienteilnahme.md) | Beispiel einer Patientin, die in der ADAPT-HER2-Studie im Interventionsarm teilnimmt |
| [Brustzentrum Charité — Universitätsmedizin Berlin](Organization-Brustzentrum-Charite.md) | Zertifiziertes Brustzentrum der Charité |
| [Checkliste erbliche Belastung — durchgeführt (Score 3)](Observation-Example-Checkliste-Erbliche-Belastung-Ja.md) | Beispiel: Checkliste wurde durchgeführt mit Score 3 |
| [Checkliste erbliche Belastung — nicht durchgeführt](Observation-Example-Checkliste-Erbliche-Belastung-Nein.md) | Beispiel: Checkliste wurde nicht durchgeführt |
| [Fall 1 — QR Bildgebung Mamma](QuestionnaireResponse-QR-Bildgebung-Fall1.md) | Antworten auf QuestBildgebung für Fall 1 Erika Neumann. Extraktion erzeugt DiagnosticReport/Fall1-Bildgebung-Mammographie (Mammographie bilateral) und Observation/Fall1-BiRADS-Links (BI-RADS 5 links). |
| [Fall 1 — QR Diagnose Maligne](QuestionnaireResponse-QR-Diagnose-Fall1.md) | Antworten auf QuestDiagnoseMaligne für Fall 1 Erika Neumann. Extraktion erzeugt Condition/Fall1-Diagnose-Mammakarzinom (C50.4 links, UICC IA). |
| [Fall 1 — QR Erstanamnese](QuestionnaireResponse-QR-Erstanamnese-Fall1.md) | Antworten auf QuestErstanamnese fuer Fall 1 Erika Neumann. Extraktion erzeugt Condition (C50.4 links), Observation (Gyn-Anamnese: Menarche 13, Menopause 54, Gravida 2), FamilyMemberHistory (Mutter Mammakarzinom 52J). |
| [Fall 1 — QR Klinische Untersuchung](QuestionnaireResponse-QR-KlinUntersuchung-Fall1.md) | Antworten auf QuestKlinischeUntersuchung für Fall 1 Erika Neumann. Extraktion erzeugt Observation/Fall1-Klinische-Untersuchung (links OAQ, tastbarer Knoten). |
| [Fall 1 — QR OP Planung](QuestionnaireResponse-QR-OPPlanung-Fall1.md) | Antworten auf QuestOPPlanung für Fall 1 Erika Neumann. Extraktion erzeugt ServiceRequest/Fall1-OP-Planung (BET links + SLNB, 90 min, Drahtmarkierung). |
| [Fall 1 — QR Pathologie Befund](QuestionnaireResponse-QR-Pathologie-Fall1.md) | Antworten auf QuestPathologieBefund für Fall 1 Erika Neumann. Extraktion erzeugt DiagnosticReport/Fall1-Pathologie-Befund, Specimen/Fall1-Pathologie-Praeparat, Observations für Histologie und IHC (NST G2, ER+ IRS 12, PR+ IRS 8, HER2- 1+, Ki-67 15%). |
| [Fall 1 — QR Postoperative Dokumentation](QuestionnaireResponse-QR-PostOP-Fall1.md) | Antworten auf QuestPostOPDokumentation für Fall 1 Erika Neumann. Extraktion erzeugt Procedure/Fall1-Operation-BET (BET + SLNB links, R0, 2025-02-05). |
| [Fall 1 — QR Strahlentherapie](QuestionnaireResponse-QR-Strahlentherapie-Fall1.md) | Antworten auf QuestStrahlentherapie für Fall 1 Erika Neumann. Extraktion erzeugt Procedure/Fall1-Strahlentherapie (adjuvant, Ganzbrust 50 Gy/25 Fraktionen + Boost 10 Gy/5 Fraktionen). |
| [Fall 1 — QR Systemtherapie](QuestionnaireResponse-QR-Systemtherapie-Fall1.md) | Antworten auf QuestSystemtherapie für Fall 1 Erika Neumann. Extraktion erzeugt Procedure (endokrine Therapie, adjuvant, Letrozol 2,5 mg, kurativ, laufend). |
| [Fall 1 — QR Tumorboard Empfehlung](QuestionnaireResponse-QR-Tumorboard-Fall1.md) | Antworten auf QuestTumorboard für Fall 1 Erika Neumann. Extraktion erzeugt CarePlan/Fall1-Tumorboard (BET + SLNB, adjuvante RT, endokrine Therapie, keine Chemotherapie). |
| [Fall 1 — QR Verlauf 6-Monats-Kontrolle](QuestionnaireResponse-QR-Verlauf-Fall1.md) | Antworten auf QuestVerlauf für Fall 1 Erika Neumann. Extraktion erzeugt Observation (klinischer Status: gut, unauffaellig) und Observation/FollowUp (Tumorstatus: kein Anhalt fuer Tumor, kein Rezidiv). |
| [Fall 1 — Raucherstatus: Nie geraucht](Observation-Fall1-Raucherstatus.md) | OncoBox 2.0 C03: Raucherstatus der Patientin (ISiK-kompatibel) |
| [Fall 1 — Sozialdienst-Kontakt durchgeführt](Procedure-Fall1-Sozialdienst.md) | OncoBox 2.0 L02: Sozialdienst-Beratung stattgefunden |
| [Fall 10: Adjuvante Bestrahlung Thoraxwand rechts 50 Gy](Procedure-Fall10-Strahlentherapie.md) | Adjuvante Thoraxwandbestrahlung rechts nach therapeutischer Mastektomie |
| [Fall 10: Adjuvante Chemotherapie Carboplatin + Paclitaxel](Procedure-Fall10-Systemtherapie-Adjuvant.md) | Adjuvante Chemotherapie mit Carboplatin + Paclitaxel bei TNBC + BRCA1 |
| [Fall 10: BI-RADS 4c rechts](Observation-Fall10-BiRADS-Rechts.md) | BI-RADS 4c Befund der rechten Brust |
| [Fall 10: Brustimplantat links (Sofortrekonstruktion)](Device-Fall10-Implantat-Links.md) | Brustimplantat links nach prophylaktischer Mastektomie, Sofortrekonstruktion |
| [Fall 10: Brustimplantat rechts (Sofortrekonstruktion)](Device-Fall10-Implantat-Rechts.md) | Brustimplantat rechts nach therapeutischer Mastektomie, Sofortrekonstruktion |
| [Fall 10: Carboplatin AUC5, Zyklus 1, Tag 1](MedicationStatement-Fall10-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der adjuvanten Therapie |
| [Fall 10: Familienanamnese — Mutter Mammakarzinom 41 J.](FamilyMemberHistory-Fall10-Familienanamnese-Mutter.md) | Mutter mit Mammakarzinom im Alter von 41 Jahren |
| [Fall 10: Familienanamnese — Schwester Ovarialkarzinom 39 J.](FamilyMemberHistory-Fall10-Familienanamnese-Schwester.md) | Schwester mit Ovarialkarzinom im Alter von 39 Jahren |
| [Fall 10: Mammographie bilateral](DiagnosticReport-Fall10-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund rechts BI-RADS 4c |
| [Fall 10: PALB2-Keimbahnmutation — pathogen](Observation-Fall10-PALB2-Keimbahn-Mutation.md) | Nachweis einer pathogenen PALB2-Keimbahnvariante bei Christina Becker (c.509_510del, Paneldiagnostik) |
| [Fall 10: PD-L1 Status — CPS 25, positiv (SP142)](Observation-Fall10-PDL1-Status.md) | PD-L1 IHC bei TNBC + BRCA1: CPS 25, IC 5% (Atezolizumab-Indikation per IMpassion130) |
| [Fall 10: Paclitaxel 175 mg/m2, Zyklus 1, Tag 1](MedicationStatement-Fall10-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der adjuvanten Therapie |
| [Fall 10: Pathologie — Invasives Karzinom NST, G3, TNBC, Ki-67 55%](DiagnosticReport-Fall10-Pathologie-Befund.md) | Pathologischer Befund: Invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 55%, BRCA1-positiv |
| [Fall 10: Pathologische Diagnose/Conclusion](Observation-Fall10-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 10: Patientin Christina Becker](Patient-Fall10-Patient-Christina-Becker.md) | Synthetische Testpatientin — BRCA1-Trägerin, TNBC rechts, bilaterale Mastektomie mit Implantatrekonstruktion |
| [Fall 10: Prophylaktische Mastektomie links (risikoreduktiv)](Procedure-Fall10-Operation-Mastektomie-Links.md) | Prophylaktische kontralaterale Mastektomie links bei BRCA1-Mutation |
| [Fall 10: Sentinel-Lymphknoten-Biopsie rechts](Procedure-Fall10-Operation-SLNB.md) | SLNB als Subprozedur der therapeutischen Mastektomie rechts |
| [Fall 10: Sofortrekonstruktion links mit Implantat](Procedure-Fall10-Rekonstruktion-Links.md) | Implantatrekonstruktion links als Subprozedur der prophylaktischen Mastektomie |
| [Fall 10: Sofortrekonstruktion rechts mit Implantat](Procedure-Fall10-Rekonstruktion-Rechts.md) | Implantatrekonstruktion rechts als Subprozedur der therapeutischen Mastektomie |
| [Fall 10: Stanzbiopsie-Präparat rechts OAQ](Specimen-Fall10-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der rechten Brust |
| [Fall 10: TNBC rechts, cT1c cN0 cM0](Condition-Fall10-Diagnose-Mammakarzinom.md) | Triple-negatives invasives Mammakarzinom NST rechts, G3, UICC IA, BRCA1-Trägerin |
| [Fall 10: Therapeutische Mastektomie rechts + SLNB](Procedure-Fall10-Operation-Mastektomie-Rechts.md) | Therapeutische Mastektomie rechts mit SLNB, R0, pN0(sn)(0/2) |
| [Fall 11: BI-RADS 3 links](Observation-Fall11-BiRADS-Links.md) | BI-RADS 3 Befund der linken Brust — wahrscheinlich gutartig |
| [Fall 11: Fibroadenom links oben außen](Condition-Fall11-Diagnose-Fibroadenom.md) | Fibroadenom der linken Brust — benigne Diagnose, histologisch bestätigt |
| [Fall 11: Klinische Brustuntersuchung](Observation-Fall11-Klinische-Untersuchung.md) | Klinische Untersuchung mit tastbarem Knoten links oben außen, 15 mm, glatt begrenzt |
| [Fall 11: Mammographie bilateral](DiagnosticReport-Fall11-Bildgebung-Mammographie.md) | Mammographie bilateral mit BI-RADS 3 links |
| [Fall 11: Pathologie — Fibroadenom, keine Atypie](DiagnosticReport-Fall11-Pathologie-Befund.md) | Pathologischer Befund der Stanzbiopsie: Fibroadenom, keine Atypie, B2 |
| [Fall 11: Pathologische Diagnose/Conclusion](Observation-Fall11-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen — benigne |
| [Fall 11: Patientin Hannah Klein](Patient-Fall11-Patient-Hannah-Klein.md) | Synthetische Testpatientin — Fibroadenom der Brust (benigne), keine Therapie |
| [Fall 11: Sonographie links](DiagnosticReport-Fall11-Bildgebung-Sonographie.md) | Sonographie links mit glatt begrenztem, ovalem, echoarmem Knoten |
| [Fall 11: Stanzbiopsie-Präparat links oben außen](Specimen-Fall11-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [Fall 12: ADH (B3-Läsion), D48.6](Condition-Fall12-Diagnose-ADH.md) | Atypische duktale Hyperplasie (ADH), B3-Läsion, ICD-10 D48.6 (meldepflichtig) |
| [Fall 12: BI-RADS 4a links](Observation-Fall12-BiRADS-Links.md) | BI-RADS 4a Befund der linken Brust — geringe Malignitätswahrscheinlichkeit |
| [Fall 12: Exzisionspräparat Nachresektion links OIQ](Specimen-Fall12-Pathologie-Praeparat-Nachresektion.md) | Exzisionspräparat aus dem oberen inneren Quadranten der linken Brust |
| [Fall 12: Nachresektion / offene Biopsie links](Procedure-Fall12-Operation-Nachresektion.md) | Offene Biopsie / Nachresektion links OIQ bei B3-Läsion (ADH), R0, kein Upgrade |
| [Fall 12: Pathologie Nachresektion — ADH, kein Upgrade, R0](DiagnosticReport-Fall12-Pathologie-Befund-Nachresektion.md) | Pathologischer Befund der Nachresektion: ADH bestätigt, kein DCIS, kein invasives Karzinom, R0 |
| [Fall 12: Pathologie Vakuumbiopsie — ADH, B3](DiagnosticReport-Fall12-Pathologie-Befund-Vakuumbiopsie.md) | Pathologischer Befund der Vakuumbiopsie: Atypische duktale Hyperplasie, B3-Kategorie |
| [Fall 12: Pathologische Diagnose Nachresektion](Observation-Fall12-Patho-Conclusion-Nachresektion.md) | Diagnostische Schlussfolgerung: ADH bestätigt, kein Upgrade, R0 |
| [Fall 12: Pathologische Diagnose Vakuumbiopsie](Observation-Fall12-Patho-Conclusion-Vakuumbiopsie.md) | Diagnostische Schlussfolgerung: ADH, B3 |
| [Fall 12: Patientin Renate Vogel](Patient-Fall12-Patient-Renate-Vogel.md) | Synthetische Testpatientin — B3-Läsion (ADH), Nachresektion ohne Upgrade |
| [Fall 12: Screening-Mammographie bilateral](DiagnosticReport-Fall12-Bildgebung-Mammographie.md) | Screening-Mammographie mit Mikrokalzifikationen links BI-RADS 4a |
| [Fall 12: Tumorboard-Empfehlung — Nachresektion empfohlen](CarePlan-Fall12-Tumorboard.md) | Empfehlung: offene Biopsie / Nachresektion zum Ausschluss eines Upgrades bei B3-Läsion |
| [Fall 12: Vakuumbiopsie-Präparat links OIQ](Specimen-Fall12-Pathologie-Praeparat-Vakuumbiopsie.md) | Vakuumbiopsie aus dem oberen inneren Quadranten der linken Brust |
| [Fall 13: Adjuvante Chemotherapie EC-Pac-H (rechts, HER2+)](Procedure-Fall13-Systemtherapie-EC-Pac-H.md) | Adjuvante Chemotherapie EC gefolgt von Paclitaxel + Trastuzumab für HER2-positives Karzinom rechts |
| [Fall 13: BET links + SLNB](Procedure-Fall13-Operation-BET-Links.md) | Brusterhaltende Therapie der linken Brust mit Sentinel-LK-Biopsie, R0 |
| [Fall 13: Mammakarzinom LINKS — pT1c pN0 cM0, ER+/PR+/HER2-, G2](Condition-Fall13-Diagnose-Links.md) | Invasives Karzinom NST der linken Brust, oberer äußerer Quadrant. Frühes Stadium, triple-positiv (HR+/HER2-) |
| [Fall 13: Mammakarzinom RECHTS — pT2 pN1a cM0, ER+/PR-/HER2+, G3](Condition-Fall13-Diagnose-Rechts.md) | Invasives Karzinom NST der rechten Brust, oberer innerer Quadrant. Lokal fortgeschritten, HER2-positiv |
| [Fall 13: Mastektomie rechts + ALND](Procedure-Fall13-Operation-Mastektomie-Rechts.md) | Hautschonende Mastektomie der rechten Brust mit axillärer Lymphknotendissektion, R0 |
| [Fall 13: Patientin Margarete Schreiber](Patient-Fall13-Patient-Margarete-Schreiber.md) | Synthetische Testpatientin — synchrones bilaterales Mammakarzinom |
| [Fall 13: QR — Bezugsdiagnose-Auswahl (SDC Choice Selection)](QuestionnaireResponse-Fall13-QR-Bezugsdiagnose-Selection.md) | Demonstriert das SDC Choice Selection Pattern: Bei bilateralem Karzinom wählt der Arzt die Bezugsdiagnose (Seite) für eine Procedure aus einer candidateExpression-basierten Liste aktiver Mamma-Conditions. |
| [Fall 13: Stationärer Aufenthalt (bilaterale OP)](Encounter-Fall13-Encounter-Stationaer.md) | Stationärer Aufenthalt für simultane bilaterale Operation |
| [Fall 1: Adjuvante Bestrahlung 50 Gy + 10 Gy Boost](Procedure-Fall1-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links 50 Gy in 25 Fraktionen + 10 Gy Boost |
| [Fall 1: BET links + SLNB](Procedure-Fall1-Operation-BET.md) | Brusterhaltende Therapie links mit Sentinel-LK-Biopsie, R0 |
| [Fall 1: BI-RADS 5 links](Observation-Fall1-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust |
| [Fall 1: BRCA1 somatisch — Wildtyp](Observation-Fall1-Somatische-Mutation-BRCA1.md) | BRCA1 somatische Mutation nicht nachgewiesen (Wildtyp) |
| [Fall 1: BRCA2 somatisch — Wildtyp](Observation-Fall1-Somatische-Mutation-BRCA2.md) | BRCA2 somatische Mutation nicht nachgewiesen (Wildtyp) |
| [Fall 1: Begleitmedikation L-Thyroxin 75 µg](MedicationStatement-Fall1-Begleitmedikation-LThyroxin.md) | L-Thyroxin 75 µg 1x täglich wegen Hypothyreose |
| [Fall 1: Begleitmedikation Metoprolol 47,5 mg](MedicationStatement-Fall1-Begleitmedikation-Metoprolol.md) | Metoprolol 47,5 mg 1x täglich wegen arterieller Hypertonie |
| [Fall 1: ECOG-Leistungszustand 6 Monate postoperativ](Observation-Fall1-ECOG-6Monate.md) | ECOG 0 — vollständig aktiv, keine Einschränkung |
| [Fall 1: Familienanamnese — Mutter Mammakarzinom](FamilyMemberHistory-Fall1-Familienanamnese.md) | Mutter mit Mammakarzinom im Alter von 52 Jahren |
| [Fall 1: Gesamtbeurteilung nach definitiver Therapie (D27)](Observation-Fall1-Verlauf-PostTherapie.md) | Gesamtbeurteilung Tumorstatus nach BET + Strahlentherapie: Vollremission (CR). Kein Residualtumor. D27-Kontext (post-definitive Therapie). |
| [Fall 1: Gynäkologische Anamnese](Observation-Fall1-Gynaekologische-Anamnese.md) | Postmenopausale Patientin, Menarche mit 13, Menopause mit 54 |
| [Fall 1: Klinische Brustuntersuchung](Observation-Fall1-Klinische-Untersuchung.md) | Klinische Untersuchung mit tastbarem Knoten links OAQ |
| [Fall 1: Komorbidität — Arterielle Hypertonie](Condition-Fall1-Komorbiditaet-Hypertonie.md) | Vorbestehende arterielle Hypertonie unter Metoprolol-Therapie |
| [Fall 1: Komorbidität — Hypothyreose](Condition-Fall1-Komorbiditaet-Hypothyreose.md) | Vorbestehende Hypothyreose unter L-Thyroxin-Substitution |
| [Fall 1: Mammakarzinom links OAQ, cT1c cN0 cM0](Condition-Fall1-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST der linken Brust, oberer äußerer Quadrant, UICC IA |
| [Fall 1: Mammographie bilateral](DiagnosticReport-Fall1-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund links BI-RADS 5 |
| [Fall 1: OP-Planung BET + SLNB](ServiceRequest-Fall1-OP-Planung.md) | Geplante brusterhaltende Therapie links mit Sentinel-LK-Biopsie |
| [Fall 1: Oncotype DX Recurrence Score 18](Observation-Fall1-Genexpressions-Score.md) | Oncotype DX Recurrence Score von 18 (niedrig) |
| [Fall 1: Oncotype DX Risikobewertung](RiskAssessment-Fall1-Genexpressionstest.md) | Oncotype DX: niedriges Risiko, 10-Jahres-Fernrezidivrisiko 12% |
| [Fall 1: PALB2 somatisch — Wildtyp](Observation-Fall1-Somatische-Mutation-PALB2.md) | PALB2 somatische Mutation nicht nachgewiesen (Wildtyp) |
| [Fall 1: PALB2-Keimbahnmutation — Wildtyp](Observation-Fall1-PALB2-Keimbahn-Wildtyp.md) | Kein Nachweis einer pathogenen PALB2-Keimbahnvariante bei Erika Neumann (Familienanamnese positiv, Mutter Mammakarzinom 52 J.) |
| [Fall 1: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-](DiagnosticReport-Fall1-Pathologie-Befund.md) | Pathologischer Befund der Stanzbiopsie: invasives Karzinom NST, G2, hormonrezeptor-positiv, HER2-negativ |
| [Fall 1: Pathologische Diagnose/Conclusion](Observation-Fall1-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 1: Patientin Erika Neumann](Patient-Fall1-Patient-Erika-Neumann.md) | Synthetische Testpatientin — frühes Mammakarzinom, kurative Behandlung |
| [Fall 1: Sentinel-Lymphknoten-Biopsie links](Procedure-Fall1-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [Fall 1: Skelettszintigraphie (Staging)](DiagnosticReport-Fall1-Bildgebung-Skelettszintigraphie.md) | Skelettszintigraphie im Rahmen des Stagings — kein Hinweis auf ossäre Metastasen |
| [Fall 1: Stanzbiopsie-Präparat links OAQ](Specimen-Fall1-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [Fall 1: Tumorboard-Empfehlung](CarePlan-Fall1-Tumorboard.md) | Empfehlung: BET + SLNB, adjuvante RT, endokrine Therapie, keine Chemotherapie |
| [Fall 1: Verlaufskontrolle 6 Monate postoperativ](Observation-Fall1-Verlauf-6Monate.md) | Nachsorge-Untersuchung nach BET und Strahlentherapie, kein Rezidivhinweis. Aktive Nachsorge, kein Zweittumor. |
| [Fall 1: Vitalstatus — lebend](Observation-Fall1-Vitalstatus-Lebend.md) | Vitalstatus-Observation gemäß MII Person-Modul: Patientin Erika Neumann lebt zum Zeitpunkt der 6-Monats-Nachsorge. |
| [Fall 2: Adjuvante Bestrahlung Thoraxwand + supraklavikulär 50 Gy](Procedure-Fall2-Strahlentherapie.md) | Adjuvante Bestrahlung der Thoraxwand und supraklavikulärer Lymphabflusswege |
| [Fall 2: Adjuvante Pembrolizumab Maintenance](Procedure-Fall2-Systemtherapie-Adjuvant.md) | Adjuvante Pembrolizumab Maintenance nach Operation |
| [Fall 2: Axilladissektion rechts Level I-III](Procedure-Fall2-Operation-Axilladissektion.md) | Axilladissektion als Subprozedur der Mastektomie |
| [Fall 2: BI-RADS 5 rechts](Observation-Fall2-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [Fall 2: Begleitmedikation Ondansetron 8 mg](MedicationStatement-Fall2-Begleitmedikation-Ondansetron.md) | Ondansetron 8 mg als Antiemetikum supportiv bei Chemotherapie |
| [Fall 2: Begleitmedikation Zoledronat 4 mg](MedicationStatement-Fall2-Begleitmedikation-Zoledronat.md) | Zoledronat 4 mg i.v. alle 4 Wochen wegen ossärer Metastase |
| [Fall 2: CT Thorax/Abdomen (Staging)](DiagnosticReport-Fall2-Bildgebung-CT.md) | CT Thorax und Abdomen im Rahmen des Stagings |
| [Fall 2: Carboplatin AUC5, Zyklus 1, Tag 1](MedicationStatement-Fall2-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der neoadjuvanten Therapie |
| [Fall 2: ECOG-Leistungszustand bei Progression](Observation-Fall2-ECOG-Progression.md) | ECOG 2 — deutliche Einschränkung bei Progression mit Lebermetastasen |
| [Fall 2: Fatigue CTCAE Grad 2 unter Chemotherapie](AdverseEvent-Fall2-Nebenwirkung-Fatigue.md) | Fatigue Grad 2 (moderat) unter neoadjuvanter EC-Chemotherapie |
| [Fall 2: Initiales Tumorboard](CarePlan-Fall2-Tumorboard-Initial.md) | Empfehlung: neoadjuvante Chemotherapie + Immuntherapie, dann Mastektomie + Axilladissektion, adjuvante RT, MTB-Überweisung |
| [Fall 2: KEYNOTE-522 Studie](ResearchStudy-Fall2-ResearchStudy-KEYNOTE522.md) | Fiktive klinische Studie KEYNOTE-522 für triple-negatives Mammakarzinom |
| [Fall 2: MRT Mamma](DiagnosticReport-Fall2-Bildgebung-MRT.md) | MRT der Brust zur Ausdehnungsbeurteilung |
| [Fall 2: Mammographie bilateral](DiagnosticReport-Fall2-Bildgebung-Mammographie.md) | Mammographie bilateral mit großem Herdbefund rechts BI-RADS 5 |
| [Fall 2: Mastektomie rechts + Axilladissektion](Procedure-Fall2-Operation-Mastektomie.md) | Modifiziert radikale Mastektomie rechts mit Axilladissektion Level I-III, ypT1a ypN0(0/14) R0 |
| [Fall 2: Neoadjuvante Chemotherapie + Immuntherapie](Procedure-Fall2-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie mit Carboplatin/Paclitaxel + Pembrolizumab |
| [Fall 2: PD-L1 Status — CPS 15, positiv (22C3)](Observation-Fall2-PDL1-Status.md) | PD-L1 IHC bei TNBC: CPS 15 (≥10 → Pembrolizumab-Indikation per KEYNOTE-522) |
| [Fall 2: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1](MedicationStatement-Fall2-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der neoadjuvanten Therapie |
| [Fall 2: Pathologie — Invasiv-duktales Karzinom G3, triple-negativ](DiagnosticReport-Fall2-Pathologie-Befund.md) | Pathologischer Befund der Stanzbiopsie: invasiv-duktales Karzinom G3, triple-negativ, Ki-67 70% |
| [Fall 2: Pathologische Diagnose/Conclusion](Observation-Fall2-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 2: Patientin Lena Hoffmann](Patient-Fall2-Patient-Lena-Hoffmann.md) | Synthetische Testpatientin — lokal fortgeschrittenes triple-negatives Mammakarzinom, palliativ |
| [Fall 2: Patientin Lena Hoffmann (verstorben)](Patient-Fall2-Patient-Lena-Hoffmann-Verstorben.md) | Variante der Testpatientin Lena Hoffmann mit deceasedDateTime — Tod durch hepatische Metastasen bei triple-negativem Mammakarzinom. |
| [Fall 2: Pembrolizumab 200 mg, Zyklus 1, Tag 1](MedicationStatement-Fall2-Medikation-Pembrolizumab.md) | Einzelgabe Pembrolizumab im Rahmen der neoadjuvanten Immuntherapie |
| [Fall 2: Postoperative Komplikation — Serom, Clavien-Dindo I](Observation-Fall2-Komplikation-Serom.md) | Postoperatives Serom nach Mastektomie, Clavien-Dindo Grad I |
| [Fall 2: Progression — hepatische Metastasen](Condition-Fall2-Diagnose-Progression.md) | Hepatische Metastasierung nach 18 Monaten, klinischer Status Rezidiv |
| [Fall 2: Skelettszintigraphie — ossäre Metastase BWK 12](DiagnosticReport-Fall2-Bildgebung-Skelettszintigraphie.md) | Skelettszintigraphie mit Nachweis einer ossären Metastase BWK 12 |
| [Fall 2: Sonographie bilateral](DiagnosticReport-Fall2-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund rechts und suspekten axillären Lymphknoten |
| [Fall 2: Stanzbiopsie-Präparat rechts zentral](Specimen-Fall2-Pathologie-Praeparat.md) | Stanzbiopsie aus dem zentralen Drüsenkörper der rechten Brust |
| [Fall 2: Studienteilnahme KEYNOTE-522](ResearchSubject-Fall2-Studienteilnahme.md) | Teilnahme an KEYNOTE-522, Interventionsarm (Pembrolizumab) |
| [Fall 2: Tod tumorbedingt](Observation-Fall2-Tod-Tumorbedingt.md) | Onko-Tod-Observation gemäß MII Onko-Modul: Patientin ist an Tumorerkrankung (Mammakarzinom mit Lebermetastasen) verstorben. Todesursache C78.7. |
| [Fall 2: Todesursache — sekundäre Leberkarzinose](Condition-Fall2-Todesursache.md) | Todesursache gemäß MII Person-Modul: sekundäre bösartige Neubildung der Leber (ICD-10-GM C78.7) bei metastasiertem triple-negativen Mammakarzinom. |
| [Fall 2: Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS)](Condition-Fall2-Diagnose-Mammakarzinom.md) | Triple-negatives invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, G3, UICC IV |
| [Fall 2: Tumorboard bei Progression](CarePlan-Fall2-Tumorboard-Progression.md) | Empfehlung: Palliativkonzept bei hepatischer Metastasierung |
| [Fall 2: Verlaufskontrolle bei Progression](Observation-Fall2-Verlauf-Progression.md) | Progression mit neuen hepatischen Metastasen nach 18 Monaten adjuvanter Therapie. Aktive Nachsorge, kein Zweittumor. |
| [Fall 2: Verlaufsmeldung bei Tod](Observation-Fall2-Verlauf-Tod.md) | Abschließende Verlaufsmeldung für Lena Hoffmann: Patientin verstorben an hepatischen Metastasen. Passive Nachsorge (Totenschein/Register). |
| [Fall 2: Vitalstatus — verstorben](Observation-Fall2-Vitalstatus-Verstorben.md) | Vitalstatus-Observation gemäß MII Person-Modul: Patientin Lena Hoffmann ist am Tumorleiden verstorben. |
| [Fall 3: Adjuvante Bestrahlung Thoraxwand 50 Gy](Procedure-Fall3-Strahlentherapie.md) | Adjuvante Bestrahlung der Thoraxwand rechts nach Mastektomie |
| [Fall 3: Axilladissektion rechts Level I-II](Procedure-Fall3-Operation-Axilladissektion.md) | Axilladissektion als Subprozedur der Mastektomie |
| [Fall 3: BI-RADS 4 rechts](Observation-Fall3-BiRADS-Rechts.md) | BI-RADS 4 Befund der rechten Brust |
| [Fall 3: Endokrine Therapie Anastrozol 1 mg](MedicationStatement-Fall3-Begleitmedikation-Anastrozol.md) | Anastrozol 1 mg/d als adjuvante endokrine Therapie |
| [Fall 3: Mammakarzinom rechts, cT2 pN1a cM0](Condition-Fall3-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST der rechten Brust, UICC IIA, HR+/HER2- |
| [Fall 3: Mammographie bilateral](DiagnosticReport-Fall3-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund rechts BI-RADS 4 |
| [Fall 3: Mastektomie rechts + Axilladissektion](Procedure-Fall3-Operation-Mastektomie.md) | Mastektomie rechts mit Axilladissektion Level I-II, R0, pN1a(2/12) |
| [Fall 3: Mastektomie-Präparat rechts](Specimen-Fall3-Pathologie-Praeparat-OP.md) | Mastektomie-Resektat rechte Brust mit Axilla-Lymphknoten |
| [Fall 3: Pathologie OP-Präparat — pT2 pN1a(2/12)](DiagnosticReport-Fall3-Pathologie-Befund-OP.md) | Pathologischer Befund des Mastektomie-Präparats mit Axilladissektion |
| [Fall 3: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-](DiagnosticReport-Fall3-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12% |
| [Fall 3: Pathologische Diagnose OP-Präparat](Observation-Fall3-Patho-Conclusion-OP.md) | Diagnostische Schlussfolgerung OP-Präparat |
| [Fall 3: Pathologische Diagnose/Conclusion](Observation-Fall3-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 3: Patientin Sabine Weber](Patient-Fall3-Patient-Sabine-Weber.md) | Synthetische Testpatientin — HR+/HER2- Mammakarzinom, Stadium IIA, N1 |
| [Fall 3: Stanzbiopsie-Präparat rechts](Specimen-Fall3-Pathologie-Praeparat-Stanze.md) | Stanzbiopsie aus der rechten Brust |
| [Fall 4: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost](Procedure-Fall4-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links nach BET |
| [Fall 4: BET links + SLNB nach neoadjuvanter Therapie](Procedure-Fall4-Operation-BET.md) | Brusterhaltende Therapie links mit Sentinel-LK-Biopsie, ypT0 ypN0 (pCR), R0 |
| [Fall 4: BI-RADS 5 links](Observation-Fall4-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust |
| [Fall 4: Carboplatin AUC6, Zyklus 1, Tag 1](MedicationStatement-Fall4-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der neoadjuvanten TCHP |
| [Fall 4: Docetaxel 75 mg/m2, Zyklus 1, Tag 1](MedicationStatement-Fall4-Medikation-Docetaxel.md) | Einzelgabe Docetaxel im Rahmen der neoadjuvanten TCHP |
| [Fall 4: ECOG-Leistungszustand nach neoadjuvanter Therapie](Observation-Fall4-ECOG-PostTherapie.md) | ECOG 1 — leichte Einschränkung nach Chemotherapie |
| [Fall 4: Gesamtbeurteilung nach neoadjuvanter Chemotherapie (D27)](Observation-Fall4-Verlauf-PostTherapie.md) | Gesamtbeurteilung Tumorstatus nach Abschluss der neoadjuvanten Systemtherapie: Teilremission (PR). Lokaler Tumorrückgang, LK und FM stabil. D27-Kontext (post-definitive Therapie). |
| [Fall 4: HER2+ Mammakarzinom links, cT2 cN1 cM0](Condition-Fall4-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST links, HER2+, UICC IIB |
| [Fall 4: Mammographie bilateral](DiagnosticReport-Fall4-Bildgebung-Mammographie.md) | Mammographie bilateral mit Herdbefund links BI-RADS 5 |
| [Fall 4: Neoadjuvante TCHP](Procedure-Fall4-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie mit Docetaxel, Carboplatin, Trastuzumab, Pertuzumab |
| [Fall 4: Pathologie — Invasives Karzinom NST, G3, HER2+](DiagnosticReport-Fall4-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G3, ER- PR- HER2+ (FISH amplifiziert), Ki-67 45% |
| [Fall 4: Pathologische Diagnose/Conclusion](Observation-Fall4-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 4: Patientin Julia Fischer](Patient-Fall4-Patient-Julia-Fischer.md) | Synthetische Testpatientin — HER2+ Mammakarzinom, neoadjuvant TCHP, pCR |
| [Fall 4: Pertuzumab, Zyklus 1, Tag 1](MedicationStatement-Fall4-Medikation-Pertuzumab.md) | Einzelgabe Pertuzumab im Rahmen der neoadjuvanten TCHP |
| [Fall 4: Sentinel-Lymphknoten-Biopsie links](Procedure-Fall4-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [Fall 4: Sonographie bilateral](DiagnosticReport-Fall4-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund links und suspekten axillären LK |
| [Fall 4: Stanzbiopsie-Präparat links](Specimen-Fall4-Pathologie-Praeparat.md) | Stanzbiopsie aus der linken Brust |
| [Fall 4: Trastuzumab, Zyklus 1, Tag 1](MedicationStatement-Fall4-Medikation-Trastuzumab.md) | Einzelgabe Trastuzumab im Rahmen der neoadjuvanten TCHP |
| [Fall 4: Tumorboard — Neoadjuvante Therapie empfohlen](CarePlan-Fall4-Tumorboard.md) | Empfehlung: neoadjuvante TCHP, dann BET + SLNB, adjuvant Trastuzumab/Pertuzumab + RT |
| [Fall 5: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy](Procedure-Fall5-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung rechts nach BET |
| [Fall 5: BET rechts + SLNB](Procedure-Fall5-Operation-BET.md) | Brusterhaltende Therapie rechts mit SLNB, ypT1a ypN0(sn)(0/3), R0 |
| [Fall 5: BI-RADS 5 rechts](Observation-Fall5-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [Fall 5: BRCA1 somatisch — Mutation nachgewiesen](Observation-Fall5-Somatische-Mutation-BRCA1.md) | BRCA1 somatische Mutation nachgewiesen im Tumorgewebe |
| [Fall 5: Endokrine Therapie Letrozol 2,5 mg](MedicationStatement-Fall5-Begleitmedikation-Letrozol.md) | Letrozol 2,5 mg/d als adjuvante endokrine Therapie |
| [Fall 5: HR+/HER2+ Mammakarzinom rechts, cT3 cN1 cM0](Condition-Fall5-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST rechts, HR+/HER2+, UICC IIIA |
| [Fall 5: Komorbidität — Diabetes mellitus Typ 2](Condition-Fall5-Komorbiditaet-Diabetes.md) | Vorbestehender Diabetes mellitus Typ 2, diätetisch eingestellt |
| [Fall 5: MRT Mamma](DiagnosticReport-Fall5-Bildgebung-MRT.md) | MRT der Brust zur Ausdehnungsbeurteilung bei cT3 |
| [Fall 5: Mammographie bilateral](DiagnosticReport-Fall5-Bildgebung-Mammographie.md) | Mammographie bilateral mit großem Herdbefund rechts BI-RADS 5 |
| [Fall 5: Nausea CTCAE Grad 1 unter Docetaxel](AdverseEvent-Fall5-Nebenwirkung-Nausea.md) | Nausea Grad 1 (mild) unter neoadjuvantem Docetaxel + Trastuzumab |
| [Fall 5: Neoadjuvante EC → Docetaxel + Trastuzumab](Procedure-Fall5-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie: EC x4 gefolgt von Docetaxel + Trastuzumab x4 |
| [Fall 5: Pathologie — Invasives Karzinom NST, G2, HR+/HER2+](DiagnosticReport-Fall5-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30% |
| [Fall 5: Pathologische Diagnose/Conclusion](Observation-Fall5-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 5: Patientin Monika Braun](Patient-Fall5-Patient-Monika-Braun.md) | Synthetische Testpatientin — HR+/HER2+ Mammakarzinom, Stadium IIIA, neoadjuvant |
| [Fall 5: Sentinel-Lymphknoten-Biopsie rechts](Procedure-Fall5-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [Fall 5: Sonographie bilateral](DiagnosticReport-Fall5-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund rechts und suspekten axillären LK |
| [Fall 5: Stanzbiopsie-Präparat rechts](Specimen-Fall5-Pathologie-Praeparat.md) | Stanzbiopsie aus der rechten Brust |
| [Fall 5: Tumorboard — Neoadjuvante Therapie](CarePlan-Fall5-Tumorboard-Neoadjuvant.md) | Empfehlung: EC → Docetaxel + Trastuzumab neoadjuvant, dann OP, adjuvant Trastuzumab + RT + Letrozol |
| [Fall 5: Tumorboard — Postoperativ](CarePlan-Fall5-Tumorboard-Postoperativ.md) | Postoperative Tumorboard-Empfehlung: Bestätigung adjuvante Therapie |
| [Fall 6: Adjuvante Bestrahlung 50 Gy (kein Boost)](Procedure-Fall6-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links nach BET bei DCIS |
| [Fall 6: BET links](Procedure-Fall6-Operation-BET.md) | Brusterhaltende Therapie links bei DCIS, R0 knapp |
| [Fall 6: BI-RADS 4 links](Observation-Fall6-BiRADS-Links.md) | BI-RADS 4 Befund links — Mikrokalzifikationen |
| [Fall 6: DCIS links](Condition-Fall6-Diagnose-DCIS.md) | Duktales Carcinoma in situ (DCIS) links, G2, ER+ |
| [Fall 6: Pathologie Vakuumbiopsie — DCIS G2, ER+](DiagnosticReport-Fall6-Pathologie-Befund.md) | Pathologischer Befund der Vakuumbiopsie: DCIS G2, ER+, kein invasiver Anteil |
| [Fall 6: Pathologische Diagnose/Conclusion](Observation-Fall6-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 6: Patientin Petra Schneider](Patient-Fall6-Patient-Petra-Schneider.md) | Synthetische Testpatientin — DCIS, Screening-Detektion, Stadium 0 |
| [Fall 6: Screening-Mammographie bilateral](DiagnosticReport-Fall6-Bildgebung-Mammographie.md) | Screening-Mammographie mit Mikrokalzifikationen links BI-RADS 4 |
| [Fall 6: Vakuumbiopsie-Präparat links](Specimen-Fall6-Pathologie-Praeparat.md) | Stereotaktische Vakuumbiopsie aus der linken Brust |
| [Fall 7: Adjuvante Bestrahlung 50 Gy + Boost 16 Gy](Procedure-Fall7-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung rechts mit Boost auf Tumorbett |
| [Fall 7: BET rechts + SLNB](Procedure-Fall7-Operation-BET.md) | Brusterhaltende Therapie rechts mit SLNB, ypT0 ypN0(sn)(0/2) = pCR, R0 |
| [Fall 7: BI-RADS 5 rechts](Observation-Fall7-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [Fall 7: Carboplatin, Zyklus 1, Tag 1](MedicationStatement-Fall7-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der neoadjuvanten Therapie |
| [Fall 7: Epirubicin 90 mg/m2, Zyklus 1 (EC), Tag 1](MedicationStatement-Fall7-Medikation-Epirubicin.md) | Einzelgabe Epirubicin im Rahmen der neoadjuvanten EC-Phase |
| [Fall 7: Mammographie bilateral](DiagnosticReport-Fall7-Bildgebung-Mammographie.md) | Mammographie bilateral mit Herdbefund rechts BI-RADS 5 |
| [Fall 7: Neoadjuvante Carboplatin/Paclitaxel → EC](Procedure-Fall7-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie: Carboplatin/Paclitaxel weekly x12, dann EC q3w x4 |
| [Fall 7: PD-L1 Status — CPS 2, negativ (22C3)](Observation-Fall7-PDL1-Status.md) | PD-L1 IHC bei TNBC: CPS 2 (<10 → kein Pembrolizumab) |
| [Fall 7: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1](MedicationStatement-Fall7-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der neoadjuvanten Therapie |
| [Fall 7: Pathologie — Invasives Karzinom NST, G3, TNBC](DiagnosticReport-Fall7-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 65% |
| [Fall 7: Pathologische Diagnose/Conclusion](Observation-Fall7-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 7: Patientin Kathrin Mueller](Patient-Fall7-Patient-Kathrin-Mueller.md) | Synthetische Testpatientin — TNBC, neoadjuvant, pCR |
| [Fall 7: Sentinel-Lymphknoten-Biopsie rechts](Procedure-Fall7-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [Fall 7: Sonographie bilateral](DiagnosticReport-Fall7-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund rechts, keine suspekten LK |
| [Fall 7: Stanzbiopsie-Präparat rechts](Specimen-Fall7-Pathologie-Praeparat.md) | Stanzbiopsie aus der rechten Brust |
| [Fall 7: TNBC rechts, cT2 cN0 cM0](Condition-Fall7-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST rechts, triple-negativ, UICC IIA |
| [Fall 7: Tumorboard — Neoadjuvante Therapie empfohlen](CarePlan-Fall7-Tumorboard.md) | Empfehlung: neoadjuvante Carboplatin/Paclitaxel → EC, dann BET + SLNB, adjuvante RT |
| [Fall 8: Adjuvante Bestrahlung Thoraxwand rechts 50 Gy](Procedure-Fall8-Strahlentherapie.md) | Adjuvante Thoraxwandbestrahlung rechts nach Mastektomie |
| [Fall 8: BI-RADS 5 rechts](Observation-Fall8-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [Fall 8: Endokrine Therapie Tamoxifen 20 mg](MedicationStatement-Fall8-Begleitmedikation-Tamoxifen.md) | Tamoxifen 20 mg/d — Standard bei männlichem Mammakarzinom (NICHT Aromataseinhibitor) |
| [Fall 8: Mammakarzinom rechts, cT2 pN0(sn) cM0](Condition-Fall8-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST rechts, zentraler Drüsenkörper, männlich, UICC IIA |
| [Fall 8: Mammographie rechts](DiagnosticReport-Fall8-Bildgebung-Mammographie.md) | Mammographie mit suspektem Herdbefund rechts BI-RADS 5 |
| [Fall 8: Mastektomie rechts + SLNB](Procedure-Fall8-Operation-Mastektomie.md) | Mastektomie rechts (Standard bei männlichem Mammakarzinom) + Sentinel-LK-Biopsie, R0, pN0(sn)(0/3) |
| [Fall 8: Pathologie — Invasives Karzinom NST, G2, HR+/HER2-](DiagnosticReport-Fall8-Pathologie-Befund.md) | Pathologischer Befund: Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18% |
| [Fall 8: Pathologische Diagnose/Conclusion](Observation-Fall8-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 8: Patient Klaus Hartmann](Patient-Fall8-Patient-Klaus-Hartmann.md) | Synthetischer Testpatient — männliches Mammakarzinom rechts, HR+/HER2-, UICC IIA |
| [Fall 8: Sentinel-Lymphknoten-Biopsie rechts](Procedure-Fall8-Operation-SLNB.md) | SLNB als Subprozedur der Mastektomie |
| [Fall 8: Sonographie rechts](DiagnosticReport-Fall8-Bildgebung-Sonographie.md) | Sonographie mit hypoechogenem Herdbefund rechts retromamillär |
| [Fall 8: Stanzbiopsie-Präparat rechts retromamillär](Specimen-Fall8-Pathologie-Praeparat.md) | Stanzbiopsie aus dem retromamillären Bereich der rechten Brust |
| [Fall 9: Adjuvante Bestrahlung 50 Gy + Boost + Lymphabfluss](Procedure-Fall9-Strahlentherapie.md) | Adjuvante Bestrahlung Restbrust links 50 Gy + Boost 10 Gy + Lymphabflusswege |
| [Fall 9: Adjuvante Chemotherapie EC → Paclitaxel](Procedure-Fall9-Systemtherapie-Adjuvant.md) | Adjuvante Chemotherapie EC q3w x4 → Paclitaxel wöchentlich x12 |
| [Fall 9: Axilladissektion links Level I-III](Procedure-Fall9-Operation-Axilladissektion.md) | Axilladissektion als Subprozedur der BET |
| [Fall 9: BET links + Axilladissektion Level I-III](Procedure-Fall9-Operation-BET.md) | Brusterhaltende Therapie links + Axilladissektion Level I-III, R0, pN3a(12/18) |
| [Fall 9: BI-RADS 5 links](Observation-Fall9-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust |
| [Fall 9: ECOG-Leistungszustand 12 Monate postoperativ](Observation-Fall9-ECOG-12Monate.md) | ECOG 1 — leicht eingeschränkt (Residual-Lymphödem nach Axilladissektion) |
| [Fall 9: Endokrine Therapie Tamoxifen 20 mg (initial, prämenopausal)](MedicationStatement-Fall9-Begleitmedikation-Tamoxifen.md) | Tamoxifen 20 mg/d, prämenopausal, nach 2 Jahren Umstellung auf AI + GnRH geplant |
| [Fall 9: Epirubicin, Zyklus 1, Tag 1](MedicationStatement-Fall9-Medikation-Epirubicin.md) | Einzelgabe Epirubicin im Rahmen der adjuvanten EC-Therapie |
| [Fall 9: Komorbidität — Adipositas](Condition-Fall9-Komorbiditaet-Adipositas.md) | Adipositas Grad I (BMI 32) |
| [Fall 9: Komorbidität — COPD](Condition-Fall9-Komorbiditaet-COPD.md) | Chronisch obstruktive Lungenerkrankung GOLD II |
| [Fall 9: Lobuläres Mammakarzinom links, cT2 pN3a cM0](Condition-Fall9-Diagnose-Mammakarzinom.md) | Invasives lobuläres Mammakarzinom links, G2, UICC IIIC, pN3a(12/18) |
| [Fall 9: Mammographie bilateral](DiagnosticReport-Fall9-Bildgebung-Mammographie.md) | Mammographie bilateral mit Herdbefund links OAQ |
| [Fall 9: Paclitaxel 80 mg/m2 wöchentlich, Woche 1](MedicationStatement-Fall9-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der adjuvanten wöchentlichen Therapie |
| [Fall 9: Pathologie — Invasives lobuläres Karzinom, G2, HR+/HER2-](DiagnosticReport-Fall9-Pathologie-Befund.md) | Pathologischer Befund: Invasives lobuläres Karzinom, G2, ER+ IRS 12, PR+ IRS 10, HER2-, Ki-67 20% |
| [Fall 9: Pathologische Diagnose/Conclusion](Observation-Fall9-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [Fall 9: Patientin Andrea Wolf](Patient-Fall9-Patient-Andrea-Wolf.md) | Synthetische Testpatientin — lobuläres Mammakarzinom links, UICC IIIC, LK-positiv, Komplikation |
| [Fall 9: Postoperative Komplikation — Lymphödem Arm links, Clavien-Dindo II](Observation-Fall9-Komplikation-Lymphoedem.md) | Lymphödem Arm links nach Axilladissektion, Clavien-Dindo Grad II |
| [Fall 9: Stanzbiopsie-Präparat links OAQ](Specimen-Fall9-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [Fall 9: Tumorboard-Empfehlung](CarePlan-Fall9-Tumorboard.md) | Empfehlung: adjuvante Chemotherapie EC→Paclitaxel, BET + Axilladissektion, RT, endokrine Therapie |
| [Fall 9: Verlaufskontrolle 12 Monate postoperativ](Observation-Fall9-Verlauf-12Monate.md) | Nachsorge nach BET + Axilladissektion + Chemo + RT, unter Tamoxifen-Therapie. Aktive Nachsorge, kein Zweittumor. |

