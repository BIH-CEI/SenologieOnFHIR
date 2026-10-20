# Artifacts Summary - Kerndatensatz Senologie v0.10.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

 There is no translation page available for the current page, so it has been rendered in the default language 

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Knowledge Artifacts: Measure 

These define measures as part of content in this implementation guide.

| | |
| :--- | :--- |
| [ Senologie Measure Minimal (Debug)  ](Measure-senologie-measure-minimal.md) | Trivialste Measure — ip/denominator/numerator immer true. Erwartetes Ergebnis bei N Patienten: N/N (100 %). Nutzt MinimalMeasureLib. |
| [ Senologie Measure OncoBox KB-12: Präoperative histologische Sicherung  ](Measure-senologie-measure-oncobox-kb-12.md) | Anteil mit präoperativer histologischer Sicherung (Stanze/Vakuum) vor Ersteingriff. OncoBox Brust 2.0 KB-12 (DKG-Audit-Kennzahl). |
| [ Senologie Measure S3-QI-02: Prätherapeutische histologische Sicherung  ](Measure-senologie-measure-s3-qi-02.md) | Prätherapeutische histologische Sicherung (S3-Leitlinie Mammakarzinom Kapitel 8, QI-02) |
| [ Senologie Measure S3-QI-04: Axilläre LK-Entfernung bei DCIS (invers, niedrig=gut)  ](Measure-senologie-measure-s3-qi-04.md) | Axilläre LK-Entfernung bei DCIS (invers, niedrig=gut) (S3-Leitlinie Mammakarzinom Kapitel 8, QI-04) |
| [ Senologie Measure S3-QI-06: Sentinel-Lymphknoten-Biopsie bei pN0 ohne Neoadjuvanz  ](Measure-senologie-measure-s3-qi-06.md) | Sentinel-Lymphknoten-Biopsie bei pN0 ohne Neoadjuvanz (S3-Leitlinie Mammakarzinom Kapitel 8, QI-06) |
| [ Senologie Measure S3-QI-08: Strahlentherapie nach BET  ](Measure-senologie-measure-s3-qi-08.md) | Strahlentherapie nach BET (S3-Leitlinie Mammakarzinom Kapitel 8, QI-08) |
| [ Senologie Measure S3-QI-09: Endokrine Therapie bei rezeptorpositivem Befund  ](Measure-senologie-measure-s3-qi-09.md) | Endokrine Therapie bei rezeptorpositivem Befund (S3-Leitlinie Mammakarzinom Kapitel 8, QI-09) |
| [ Senologie Measure S3-QI-11: R0-Resektion bei invasivem Mammakarzinom  ](Measure-senologie-measure-s3-qi-11.md) | R0-Resektion bei invasivem Mammakarzinom (S3-Leitlinie Mammakarzinom Kapitel 8, QI-11) |
| [ Senologie Measure S3-QI-12: ER/PR-Bestimmung mit % und Intensität  ](Measure-senologie-measure-s3-qi-12.md) | ER/PR-Bestimmung mit % und Intensität (S3-Leitlinie Mammakarzinom Kapitel 8, QI-12) |
| [ Senologie Measure S3-QI-13: HER2 Score nach ASCO/CAP  ](Measure-senologie-measure-s3-qi-13.md) | HER2 Score nach ASCO/CAP (S3-Leitlinie Mammakarzinom Kapitel 8, QI-13) |

### Knowledge Artifacts: Libraries 

These define logic, asset collections and other libraries as part of content in this implementation guide.

| | |
| :--- | :--- |
| [ Library: MinimalMeasureLib  ](Library-MinimalMeasureLib.md) | Minimale Debug-Library mit drei konstanten true-Defines |
| [ Library: OncoBoxBrustKennzahlen  ](Library-OncoBoxBrustKennzahlen.md) | OncoBox Brust 2.0 Kennzahlen (KB-1 bis KB-20, DKG-Zertifizierung) |
| [ Library: QualitaetsindikatorenLeitlinie  ](Library-QualitaetsindikatorenLeitlinie.md) | S3-Leitlinien-Qualitätsindikatoren (17 QIs aus S3 Mammakarzinom v5.0, Kapitel 8) |

### Structures: Logical Models 

These define data models that represent the domain covered by this implementation guide in more business-friendly terms than the underlying FHIR resources.

| | |
| :--- | :--- |
| [ BIH LM Senologie LogicalModel  ](StructureDefinition-LogicalModelSenologie.md) | Vollständiges LogicalModel der BIH-Spezifikation des Moduls Senologie. Bildet alle klinischen Datenpunkte des Kerndatensatzes Senologie ab. |
| [ IQTIG QS 18.1 Mammachirurgie (Logical Model)  ](StructureDefinition-iqtig-mammachirurgie-181.md) | Logisches Modell des IQTIG-Datensatzes fuer das QS-Verfahren 18.1 Mammachirurgie (Spezifikation 2024 V05).Der Datensatz besteht aus drei Teildatensaetzen:* Teildatensatz Basis (B): Patienten- und Falldaten
* Teildatensatz Brust (BRUST): Brustspezifische Diagnose- und Befunddaten
* Teildatensatz Operation (O): Operation, Histologie, Pathologie, Resektionsstatus
Dieses Modell dient als Zielstruktur der FHIR StructureMaps fuer die Ableitung einer IQTIG-konformen QS-Meldung aus einem Senologie-FHIR-Bundle. Die Serialisierung (CSV / XML) ist nicht Bestandteil dieses Modells. |
| [ IRegG Brustimplantat Meldung (Logical Model)  ](StructureDefinition-ireg-brustimplantat-meldung.md) | Logisches Modell der GEMeldung fuer Brustimplantate gemaess IRegD XML-Spezifikation V4.1.1.Dieses Modell bildet die Hierarchie der XML-Nachricht ab, beschraenkt auf den Brustimplantat-Anteil (ohne Endoprothese und Aortenklappe). Es dient als StructureMap-Target fuer die Erzeugung von IRegG-XML-Meldungen aus FHIR-Ressourcen.Mapping-Uebersicht:* Meldung (MEL_*) -> MessageHeader + Organization
* Fall (FAL_*) -> Encounter
* PatientenaufnahmeBrustimplantat (PAT_* + PAB_*) -> Patient + Observations
* Operation (OPE_* + OBI_*) -> Procedure
* Artikelidentifikation (ARI_* + ARB_* + ABI_*) -> Device
* Zubehoer (ZUB_* + ZBI_*) -> Device
* Entlassung (ENT_* + DBI_*) -> Encounter.hospitalization + Condition
 |
| [ OncoBox Brust 2.0 Meldung (Logical Model)  ](StructureDefinition-oncobox-brust-meldung.md) | OncoBox Brust 2.0 (Auditjahr 2026 v2.1.1) Meldungsstruktur — generiert aus dem offiziellen XSD. |
| [ oBDS Meldung  ](StructureDefinition-obds-meldung.md) | Logisches Modell einer oBDS-Meldung (Onkologischer Basisdatensatz v3.0.5). Bildet die XML-Struktur einer einzelnen Meldung ab, wie sie von Meldestellen an die Krebsregister übermittelt wird. |

### Structures: Questionnaires 

These define forms used by systems conforming to this implementation guide to capture or expose data to end users.

| | |
| :--- | :--- |
| [ Fragebogen: Bildgebung Mamma  ](Questionnaire-senologie-bildgebung.md) | Fragebogen zur strukturierten Dokumentation der Bildgebung Mamma (Mammographie, Sonographie, MRT, Tomosynthese). Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Observation und BodyStructure. |
| [ Fragebogen: Diagnose Mamma  ](Questionnaire-senologie-diagnose.md) | Klinische Anker-Diagnose der Senologie (Mammakarzinom, in-situ, B3-Läsion, benigne Befunde, kosmetische/funktionelle Anomalien). Bewusst schlank: TNM, Grading und detailliertes Staging werden in den Folge-Formularen Bildgebung, Pathologie und Verlauf erhoben. |
| [ Fragebogen: Erstanamnese  ](Questionnaire-senologie-erstanamnese.md) | Fragebogen zur Erstanamnese mit Allgemeiner Anamnese, Gynäkologischer Anamnese, Raucherstatus und Familienanamnese. Nutzt SDC Template-based Extraction. |
| [ Fragebogen: Klinische Untersuchung Mamma  ](Questionnaire-senologie-klinische-untersuchung.md) | Klinische Inspektion, Palpation und klinisches TNM-Staging der Senologie. Bewusst ohne Sonographie/Bildgebung (→ Bildgebung-Form) und Biopsie-Doku (→ Pathologie-Form). |
| [ Fragebogen: OP Planung  ](Questionnaire-senologie-op-planung.md) | Fragebogen zur ärztlichen OP-Planung in der Senologie. Nutzt SDC Template-based Extraction mit dem Senologie_OP_Planung-Profil (ServiceRequest) als Ziel. |
| [ Fragebogen: Pathologie Befund  ](Questionnaire-senologie-pathologie.md) | Fragebogen zur strukturierten Dokumentation des pathologischen Befunds. Nutzt SDC Template-based Extraction mit contained Templates für DiagnosticReport, Specimen, Histologie-Observation und IHC-Observation. |
| [ Fragebogen: Postoperative Dokumentation  ](Questionnaire-senologie-postop.md) | Fragebogen zur postoperativen Dokumentation (Operative Therapie, Komplikationen, Postoperative Anordnungen/Follow-up). Nutzt SDC Template-based Extraction mit zwei contained Templates: Procedure (Senologie_Operation) und Observation (Senologie_Operative_Komplikation). |
| [ Fragebogen: Senologie Diagnose  ](Questionnaire-senologie-diagnose-maligne.md) |  |
| [ Fragebogen: Strahlentherapie  ](Questionnaire-senologie-strahlentherapie-quest.md) | Fragebogen zur strukturierten Dokumentation der Strahlentherapie. Nutzt SDC Template-based Extraction mit contained Procedure-Template. |
| [ Fragebogen: Systemische Therapie  ](Questionnaire-senologie-systemtherapie.md) | Fragebogen zur Dokumentation der systemischen Therapie (Chemotherapie, Endokrine Therapie, Zielgerichtete Therapie, Immuntherapie). Nutzt SDC Template-based Extraction mit contained Templates für Procedure und MedicationStatement. |
| [ Fragebogen: Tumorboard Empfehlung  ](Questionnaire-senologie-tumorboard.md) | Fragebogen zur strukturierten Dokumentation der Empfehlung einer interdisziplinaeren Tumorkonferenz. Pro Therapie-Empfehlung mit Beschluss-Status (empfohlen/bedingt/nicht/nicht diskutiert) und Begruendung. SDC Template-based Extraction zu CarePlan. |
| [ Fragebogen: Verlaufsdokumentation / Nachsorge  ](Questionnaire-senologie-verlauf.md) | Fragebogen zur strukturierten Dokumentation der Verlaufskontrolle und Nachsorge. Nutzt SDC Template-based Extraction mit contained Templates für Klinischen Status und Tumorstatus. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ BIH LM Senologie Brustimplantat  ](StructureDefinition-senologie-implantat.md) | Brustimplantate im Rahmen der BIH-Spezifikation des Moduls Senologie |
| [ BIH LM Senologie Brustwand-Operation  ](StructureDefinition-senologie-operation.md) | Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie. Erbt Intention, PräoperativeMarkierung und IntraoperativesImaging von MII Onko Mamma Operation. |
| [ BIH PR Seno Diagnose Benigne  ](StructureDefinition-senologie-diagnose-benigne.md) | Benigne Mamma-Diagnosen (D24, N60-N64) und entzündliche Erkrankungen. ISiK-kompatibel für Krankenhaus-Interoperabilität ohne Krebsregister-Anforderungen. |
| [ BIH PR Seno Diagnose Maligne  ](StructureDefinition-senologie-diagnose-maligne.md) | Maligne Mamma-Diagnosen (C50, D05) für Krebsregister-Meldung. Basiert auf MII PR Onko Diagnose Primärtumor mit oBDS-konformer Diagnosesicherung und Staging. |
| [ BIH PR Seno Genexpressions-Score  ](StructureDefinition-senologie-genexpressions-score.md) | Observation für den numerischen Score-Wert eines Genexpressionstests (Oncotype DX Recurrence Score, MammaPrint Index, Prosigna ROR Score, EndoPredict EPclin Score) |
| [ BIH PR Seno Genexpressionstest  ](StructureDefinition-senologie-genexpressionstest.md) | RiskAssessment für genomische Risikoscores bei Mammakarzinom (Oncotype DX, MammaPrint, Prosigna, EndoPredict). Bildet die Risikoklassifikation ab und referenziert die Score-Observation. |
| [ BIH Senologie Begleitmedikation  ](StructureDefinition-senologie-begleitmedikation.md) | Begleitmedikation der Patientin – aktuelle Dauermedikation und sonstige Medikamente, die nicht Teil der onkologischen Systemtherapie sind (z. B. Antihypertensiva, Schilddrüsenhormone, Antikoagulantien). |
| [ BIH Senologie Bildgebung Befund  ](StructureDefinition-senologie-bildgebung-befund.md) | DiagnosticReport für Befunde bildgebender Verfahren (Mammographie, Sonographie, MRT, Tomosynthese, etc.) |
| [ BIH Senologie Bildgebung Observation  ](StructureDefinition-senologie-bildgebung-observation.md) | Observation für einzelne Bildgebungs-Befunde (BI-RADS, ACR, Herdbefund, Mikrokalk, LK-Status) |
| [ BIH Senologie Bildgebung Sonstige  ](StructureDefinition-senologie-bildgebung-sonstige.md) | DiagnosticReport für nicht-mammaspezifische Bildgebung im Rahmen des Stagings oder der Verlaufskontrolle (z.B. Skelettszintigraphie, CT, PET-CT, Röntgen Thorax, Lebersonographie). |
| [ BIH Senologie Checkliste Erbliche Belastung  ](StructureDefinition-senologie-checkliste-erbliche-belastung.md) | Observation für die DKG-Checkliste zur Identifikation erblicher Tumorbelastung (D24/D25). Erfasst ob die Checkliste durchgeführt wurde und ggf. den Score. |
| [ BIH Senologie ER-Status  ](StructureDefinition-senologie-er-status.md) | Östrogenrezeptor-Status — erbt MII Onko Mamma Rezeptorstatus Estrogen (oBDS + Leitlinien-Slicing, AnteilPositiveZellen + Färbeintensität) und ergänzt IRS (Remmele-Stegner) und Allred-Score als Senologie-Erweiterung. Erlaubt ER-low-Analysen. |
| [ BIH Senologie Familienanamnese  ](StructureDefinition-senologie-familienanamnese.md) | FamilyMemberHistory für familiäre Belastung mit Mamma- und Ovarialkarzinom |
| [ BIH Senologie Follow-Up (Verlaufsmeldung)  ](StructureDefinition-senologie-follow-up.md) | Verlaufsmeldung mit Meldedatum (M01), Melder (M02), Nachsorge-Art als method (M03), Tumorstatus lokal/LK/FM (M05-M07, geerbt von MII Verlauf), und Zweittumor-Flag (M08). Vitalstatus (M04) wird ueber Patient.deceased abgebildet. Zweittumor-Details (M09-M10) werden als eigene Condition dokumentiert. |
| [ BIH Senologie Geplante Systemtherapie  ](StructureDefinition-senologie-geplante-systemtherapie.md) | MedicationRequest für geplante Systemtherapie |
| [ BIH Senologie Gynäkologische Anamnese  ](StructureDefinition-senologie-gynaekologische-anamnese.md) | Observation für gynäkologische Anamnese (Menarche, Menopause, Schwangerschaften, HRT) |
| [ BIH Senologie HER2-Status (IHC)  ](StructureDefinition-senologie-her2-status.md) | HER2-Status aus Immunhistochemie — erbt MII Onko Mamma Her2neu Status (oBDS + Leitlinien-Slicing inkl. HER2-low/HER2-ultralow, IHC-Score + ISH-Ergebnis). Quantitative ISH-Details (Ratio/Kopienzahl) werden über MII MTB INSITUHYBRIDIZATION_HER2 abgebildet. |
| [ BIH Senologie Ki-67 Proliferationsindex  ](StructureDefinition-senologie-ki67-proliferationsindex.md) | Ki-67-Proliferationsindex (%) aus immunhistochemischer Untersuchung. Kein MII-Onko-Profil vorhanden — senologiespezifisch, orientiert am MII ER/PR-Muster (LOINC-Code + valueQuantity %). |
| [ BIH Senologie Klinische Untersuchung  ](StructureDefinition-senologie-klinische-untersuchung.md) | Observation für klinische Brustuntersuchung (Mammabefund pro Seite) |
| [ BIH Senologie Nebenwirkung  ](StructureDefinition-senologie-nebenwirkung.md) | AdverseEvent für CTCAE-Nebenwirkungsgrading unter Systemtherapie. Erbt MedDRA-Kodierung und CTCAE-Grad von MII Onko Nebenwirkung. |
| [ BIH Senologie OP Planung  ](StructureDefinition-senologie-op-planung.md) | ServiceRequest für OP Planung |
| [ BIH Senologie Operative Komplikation  ](StructureDefinition-senologie-operative-komplikation.md) | Observation für postoperative Komplikationen mit Clavien-Dindo-Klassifikation. Folgt dem MII Prostata Clavien-Dindo Muster (Observation statt AdverseEvent). |
| [ BIH Senologie PD-L1 Status  ](StructureDefinition-senologie-pdl1-status.md) | PD-L1 Immunhistochemie-Befund für Mamma-Karzinom. Erbt TPS, CPS, ICS und TC-Score Slices vom MII MTB PD-L1 Profil. Klinisch relevant bei TNBC (Pembrolizumab-Indikation bei CPS >= 10, KEYNOTE-522). |
| [ BIH Senologie PR-Status  ](StructureDefinition-senologie-pr-status.md) | Progesteronrezeptor-Status — erbt MII Onko Mamma Rezeptorstatus Progesteron (oBDS + Leitlinien-Slicing, AnteilPositiveZellen + Färbeintensität) und ergänzt IRS und Allred-Score als Senologie-Erweiterung. |
| [ BIH Senologie Pathologie Befund  ](StructureDefinition-senologie-pathologie-befund.md) | DiagnosticReport für pathologische Befunde. Basiert auf MII Patho Report — Specimen- und Lokalisationsdetails sind in Senologie_Pathologie_Praeparat und Senologie_Tumorlokalisation ausgelagert. |
| [ BIH Senologie Pathologisches Präparat  ](StructureDefinition-senologie-pathologie-praeparat.md) | Specimen für pathologische Präparate (Biopsie, Resektat, etc.) mit Lokalisations- und Entnahme-Details |
| [ BIH Senologie Psychoonkologische Mitbetreuung  ](StructureDefinition-senologie-psychoonkologie.md) | Procedure fuer psychoonkologische Mitbetreuung (OncoBox KB-9). status=completed + performedDateTime zeigt 'erfolgt=ja' an, status=not-done zeigt 'erfolgt=nein' an. |
| [ BIH Senologie Somatische Mutation  ](StructureDefinition-senologie-somatische-mutation.md) | Somatischer Mutationsstatus für BRCA1, BRCA2 und PALB2 im Tumorgewebe. Erbt Gen-Kodierung und Ausprägung von MII Onko Genetische Variante. |
| [ BIH Senologie Sozialdienst-Kontakt  ](StructureDefinition-senologie-sozialdienst.md) | Procedure für Sozialdienst-Kontakt (OncoBox 2.0 L02, DKG OF-14). Erfasst ob eine Sozialdienst-Beratung stattgefunden hat und wann. |
| [ BIH Senologie Strahlentherapie  ](StructureDefinition-senologie-strahlentherapie.md) | Procedure für Strahlentherapie. Erbt Gesamtdosis, Boost und Seitenlokalisation von MII Onko Bestrahlung. |
| [ BIH Senologie Studienteilnahme  ](StructureDefinition-senologie-studienteilnahme.md) | ResearchSubject für klinische Studienteilnahme in der Senologie. Bildet Studienname, Screeningstatus, Studienscreening, Studienarm, Aufklärungsdatum, Teilnahmestatus und Kontaktperson ab. |
| [ BIH Senologie Systemtherapie (übergeordnet)  ](StructureDefinition-senologie-systemtherapie-procedure.md) | Procedure für übergeordnete Systemtherapie-Dokumentation. Erbt Intention, outcome und usedCode von MII Onko Systemtherapie. |
| [ BIH Senologie Systemtherapie Medikation (einzelne Gabe)  ](StructureDefinition-senologie-systemtherapie-medikation.md) | MedicationStatement für einzelne Medikamentengaben. Erbt ATC/UNII-Codierung und partOf:systemischeTherapie von MII Onko. |
| [ BIH Senologie Tumorboard Empfehlung  ](StructureDefinition-senologie-tumorboard-empfehlung.md) | CarePlan für Empfehlungen der interdisziplinären Tumorkonferenz (Tumorboard) |
| [ BIH Senologie Tumorlokalisation  ](StructureDefinition-senologie-tumorlokalisation.md) | BodyStructure für die Tumorlokalisation in der Brust (Seite, Quadrant, Uhrzeitposition, Mamillenabstand) |
| [ Senologie Meldungs-Bundle  ](StructureDefinition-senologie-meldungs-bundle.md) | Kanonischer Bundle für einen vollständigen SenologieOnFHIR-Datensatz einer Brustkrebspatientin. Enthält Pflicht- und optionale Ressourcen gemäß den SenologieOnFHIR-Profilen. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ Anzahl Bestrahlungssitzungen  ](StructureDefinition-ex-senologie-session-count.md) | Anzahl der Bestrahlungssitzungen — MII Onko hat kein Fraktionszahl-Element |
| [ Aufklärungsdatum  ](StructureDefinition-ex-senologie-aufklaerungsdatum.md) | Datum der Aufklärung der Patientin über die Studie |
| [ CA-Behandlung/Tumorkonferenz-Zustimmung  ](StructureDefinition-ex-senologie-tumor-conference-consent.md) | CA-Behandlung / Tumorkonferenz-Zustimmung (Ja/Nein) — kein natives FHIR-Äquivalent |
| [ Einzeldosis pro Fraktion  ](StructureDefinition-ex-senologie-einzeldosis.md) | Einzeldosis pro Bestrahlungsfraktion in Gy — OncoBox 2.0 H10, oBDS Einzeldosis |
| [ First-Line-Therapie bei Metastasierung  ](StructureDefinition-ex-senologie-first-line-therapy.md) | Flag ob es sich um die First-Line-Therapie bei metastasierter Situation handelt (OncoBox I02 / KB-8) |
| [ Geplante OP-Dauer  ](StructureDefinition-ex-senologie-operations-duration.md) | Geplante OP-Dauer in Minuten — ServiceRequest hat kein duration-Element |
| [ Kontaktperson Studie  ](StructureDefinition-ex-senologie-studienkontakt.md) | Kontaktperson für die klinische Studie — kein natives FHIR-Äquivalent in ResearchSubject |
| [ OP-Lagerung/Tischanordnung  ](StructureDefinition-ex-senologie-operating-table-setup.md) | OP-Lagerung und Tischanordnung — kein natives FHIR-Äquivalent |
| [ Primaerfallart  ](StructureDefinition-ex-senologie-primaerfallart.md) | OnkoZert-Primaerfallart als expliziter Override (OncoBox 2.0 D01). Ergänzt die ICD-basierte Ableitung im SM für Fälle wie Rezidiv (Code 3), die nicht aus dem ICD-Prefix ableitbar sind. |
| [ Präoperative Antibiotikatherapie  ](StructureDefinition-ex-senologie-pre-op-antibiotikatherapie.md) | Präoperative Antibiotikatherapie — kein natives FHIR-Äquivalent |
| [ Präoperative Blutabnahme  ](StructureDefinition-ex-senologie-pre-op-blutabnahme.md) | Präoperative Blutabnahme geplant — kein natives FHIR-Äquivalent |
| [ Präoperative Markierung  ](StructureDefinition-ex-senologie-pre-op-markierung.md) | Präoperative Markierung geplant — ServiceRequest hat kein usedCode |
| [ Screening zur Studienteilnahme  ](StructureDefinition-ex-senologie-studienscreening.md) | OncoBox 2.0 K03: Wurde ein Screening zur Studienteilnahme durchgeführt? Erfasst, ob die Patientin aktiv auf eine mögliche Studienteilnahme geprüft wurde — unabhängig vom Ergebnis (Screeningstatus). |
| [ Screeningstatus  ](StructureDefinition-ex-senologie-screeningstatus.md) | Screeningstatus der Studienteilnahme — kein natives FHIR-Äquivalent in ResearchSubject |
| [ Simultane Radiochemotherapie  ](StructureDefinition-ex-senologie-simultane-radiochemotherapie.md) | Flag ob die Strahlentherapie simultan mit Chemotherapie durchgeführt wurde (OncoBox 2.0 H03) |
| [ Standort der Untersuchung  ](StructureDefinition-ex-senologie-examination-location.md) | Standort/Einrichtung der bildgebenden Untersuchung — DiagnosticReport hat kein location-Element |
| [ Tag im Zyklus  ](StructureDefinition-ex-senologie-day-in-cycle.md) | Tag innerhalb eines Therapie-Zyklus — MII Onko hat kein day-in-cycle |
| [ Therapie-Zyklus  ](StructureDefinition-ex-senologie-therapy-cycle.md) | Nummer des Therapie-Zyklus (1, 2, 3, etc.) — MII Onko hat kein cycle tracking |
| [ Therapielinie  ](StructureDefinition-ex-senologie-therapy-line.md) | Therapielinie (1. Linie, 2. Linie, etc.) — kein natives FHIR-Äquivalent |
| [ Zentrumsfall  ](StructureDefinition-ex-senologie-zentrumsfall.md) | DKG-Zertifizierungsstatus: true = Zentrumsfall/Primärfall, false = kein Primärfall (OncoBox 2.0 D01) |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ BIH LM Senologie Operation  ](ValueSet-vs-senologie-operation-art.md) | Operationen im Rahmen der BIH-Spezifikation des Moduls Senologie |
| [ VS OncoBox Primaerfallart  ](ValueSet-vs-oncobox-primaerfallart.md) | Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01) |
| [ VS Senologie ACR Brustdichte  ](ValueSet-vs-senologie-acr-brustdichte.md) | ACR Brustdichte-Kategorien A-D als SNOMED-Codes. |
| [ VS Senologie Allgemeinzustand  ](ValueSet-vs-senologie-allgemeinzustand.md) | Vereinfachte Allgemeinzustands-Skala (gut/eingeschraenkt/schlecht). Fuer detaillierte Erfassung ECOG verwenden. |
| [ VS Senologie Applikationsart  ](ValueSet-vs-senologie-applikationsart.md) | Applikationsroute der Medikation (intravenoes / subkutan / oral / intramuskulaer). |
| [ VS Senologie Auffällig/Unauffällig  ](ValueSet-vs-senologie-auffaellig-unauffaellig.md) | Klinischer Befundstatus 'auffällig' / 'unauffällig' für Inspektion und Palpation. |
| [ VS Senologie B-Klassifikation (NHSBSP)  ](ValueSet-vs-senologie-b-klassifikation.md) | Histopathologische B-Klassifikation der Mamma-Biopsie nach NHSBSP (B0-B5b) als SNOMED-Codes. |
| [ VS Senologie B3 Läsionen  ](ValueSet-vs-senologie-diagnose-b3.md) | B3 Läsionen der Mamma nach S3-Leitlinie |
| [ VS Senologie B3-Subtypen  ](ValueSet-vs-senologie-b3-subtypen.md) | Sub-Klassifikation der B3-Läsion (ADH, FEA, Papillom, Radiäre Narbe, LIN-ALH, LCIS klassisch/pleomorph). |
| [ VS Senologie BI-RADS Kategorie  ](ValueSet-vs-senologie-birads.md) | BI-RADS Mammographie-Assessment-Kategorien 0-6 als SNOMED-Codes. |
| [ VS Senologie Beurteilbarkeit  ](ValueSet-vs-senologie-beurteilbarkeit.md) | Beurteilbarkeit einer Bildgebung (gut / eingeschränkt). |
| [ VS Senologie Bildgebungs-Modalität  ](ValueSet-vs-senologie-bildgebung-modalitaet.md) | Bildgebende Verfahren (Mammographie/Sonographie/Tomosynthese/MRT) mit Seitenlokalisation. |
| [ VS Senologie Clavien-Dindo Grade  ](ValueSet-vs-senologie-clavien-dindo.md) | Clavien-Dindo Klassifikation operativer Komplikationen (Grad I-V). |
| [ VS Senologie Clock-Face Position (Uhrzeitposition)  ](ValueSet-vs-senologie-clockface-position.md) | 12 Uhrzeitpositionen (1-12 Uhr) als SNOMED CT Codes für die Mamma-Lokalisation im Uhrzeitschema. |
| [ VS Senologie Diagnose  ](ValueSet-vs-senologie-diagnose.md) | Diagnosen für Mamma-Erkrankungen basierend auf Dotbase Codebook - SNOMED CT und lokale Codes |
| [ VS Senologie Diagnose Lokal  ](ValueSet-vs-senologie-diagnose-lokal.md) | Lokale Senologie-Codes ohne SNOMED CT Mapping (Binding für senologie-Slice) |
| [ VS Senologie Diagnose Mamma (24 Choices)  ](ValueSet-vs-senologie-diagnose-mamma-24.md) | 24 Mamma-Diagnose-Choices entsprechend dem konsentierten Senologie-Datensatz (Mischung SNOMED + bz-* Custom-Codes), klinisch sortiert nach Häufigkeit. |
| [ VS Senologie Diagnose SNOMED CT  ](ValueSet-vs-senologie-diagnose-sct.md) | SNOMED CT Diagnosen für maligne Mamma-Erkrankungen (Binding für sct-Slice) |
| [ VS Senologie Diagnostische Sicherheit  ](ValueSet-vs-senologie-diagnose-sicherheit.md) | Diagnostische Sicherheits-Stati: Verdacht auf / Gesichert / Ausschluss / Z.n. (FHIR condition-ver-status). |
| [ VS Senologie Dosis-Einheit  ](ValueSet-vs-senologie-dosis-einheit.md) | Standard-Dosis-Einheiten fuer Onkologie-Medikation (UCUM). |
| [ VS Senologie ECOG-Performance-Status  ](ValueSet-vs-senologie-ecog.md) | ECOG-Performance-Status 0-4. |
| [ VS Senologie Familienanamnese-Erkrankung  ](ValueSet-vs-senologie-familien-erkrankung.md) | Erkrankungen, die in der Familienanamnese erfasst werden (Mamma- und Ovarialkarzinom-Fokus). |
| [ VS Senologie Fernmetastasen-Lokalisation  ](ValueSet-vs-senologie-fernmetastasen-lokalisation.md) | Häufige Fernmetastasen-Lokalisationen beim Mammakarzinom (Lunge/Leber/Knochen/Hirn). |
| [ VS Senologie Genexpressionstest  ](ValueSet-vs-senologie-genexpressionstest.md) | Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom |
| [ VS Senologie Grading Mamma (Elston-Ellis)  ](ValueSet-vs-senologie-grading-mamma.md) | Histologic Grading nach Elston-Ellis (G1/G2/G3) als SNOMED-Codes. |
| [ VS Senologie HER2 FISH-Ergebnis  ](ValueSet-vs-senologie-her2-fish.md) | FISH-Ergebnis bei HER2-Amplifikationstestung. |
| [ VS Senologie HER2 Gesamtbewertung (Leitlinie)  ](ValueSet-vs-senologie-her2-gesamt.md) | HER2-Gesamtbewertung nach Leitlinie 2024 (positiv/low/ultralow/negativ/equivocal). |
| [ VS Senologie HER2 IHC-Score  ](ValueSet-vs-senologie-her2-ihc-score.md) | IHC-Score-Werte für HER2 (0/1+/2+/3+) nach Standardpathologie. Codes aus MII MTB INSITUHYBRIDIZATION. |
| [ VS Senologie Histologie-Typ Mamma  ](ValueSet-vs-senologie-histologie-typ.md) | Histologische Subtypen des Mamma-Befunds (NST, lobulär, DCIS). |
| [ VS Senologie IHC-Färbeintensität  ](ValueSet-vs-senologie-ihc-intensitaet.md) | IHC-Färbeintensität für ER/PR-Beurteilung (negative/weak/moderate/strong). |
| [ VS Senologie ISH-Methode  ](ValueSet-vs-senologie-ish-methode.md) | In-situ-Hybridisierungs-Methode für HER2. FISH/CISH/SISH als SNOMED-CT kodiert; DISH ohne SNOMED-Konzept als lokaler Code. |
| [ VS Senologie Ja/Nein  ](ValueSet-vs-senologie-ja-nein.md) | Generisches Ja/Nein als SNOMED-Codes (Hormonersatztherapie, andere Boolean-Fragen). |
| [ VS Senologie Komplikations-Zeitpunkt  ](ValueSet-vs-senologie-komplikation-zeitpunkt.md) | Phase der OP-Komplikation (intraoperativ / postoperativ direkt / stationaerer Aufenthalt). |
| [ VS Senologie Kontrazeption Status  ](ValueSet-vs-senologie-kontrazeption-status.md) | Nutzungs-Status hormoneller Kontrazeption (nie / früher / aktuell). |
| [ VS Senologie Kontrolltermin-Art  ](ValueSet-vs-senologie-kontrolltermin-art.md) | Art einer Verlaufs-/Nachsorge-Kontrolle. |
| [ VS Senologie L-Kategorie (Lymphangiosis)  ](ValueSet-vs-senologie-l-kategorie.md) | L-Kategorie (Lymphangiosis carcinomatosa) nach UICC TNM (L0/L1/LX). |
| [ VS Senologie LK-Status (Bildgebung)  ](ValueSet-vs-senologie-lk-status-bildgebung.md) | Axillärer Lymphknoten-Status: unauffällig/unklar/suspekt/kein LK abgebildet. |
| [ VS Senologie Lymphoedem Grad  ](ValueSet-vs-senologie-lymphoedem-grad.md) | Schweregrad eines Lymphoedems (kein / Grad I / II / III) nach ISL-Kriterien. |
| [ VS Senologie Menopausenstatus  ](ValueSet-vs-senologie-menopausenstatus.md) | Menopausenstatus für Anamnese. |
| [ VS Senologie Menopausenstatus (mit ext. Codes)  ](ValueSet-vs-senologie-menopausenstatus-erweitert.md) | Menopausenstatus mit den im Form genutzten Codes (inkl. 309606002 und 161541000119104). |
| [ VS Senologie Metastasierung  ](ValueSet-vs-senologie-metastasierung.md) | Metastasierungsstatus - lokale Codes basierend auf Dotbase |
| [ VS Senologie Mikrokalk-Triage  ](ValueSet-vs-senologie-mikrokalk-triage.md) | Mikrokalk-Auswahl: Ja-suspekt / Ja-nicht-suspekt / Nein. |
| [ VS Senologie Nachsorge Art  ](ValueSet-vs-senologie-nachsorge-art.md) | Art der Nachsorge: aktiv (persönliche Untersuchung) oder passiv (Akten/Register) — OncoBox M03 |
| [ VS Senologie Nachsorge-Modus  ](ValueSet-vs-senologie-nachsorge-modus.md) | Nachsorge-Erhebung aktiv (persoenlich) vs passiv (Aktenlage/Register). |
| [ VS Senologie Pn-Kategorie (Perineural)  ](ValueSet-vs-senologie-pn-kategorie.md) | Pn-Kategorie (Perineuralinvasion) nach UICC TNM (Pn0/Pn1/PnX). |
| [ VS Senologie Pre-OP-Markierung  ](ValueSet-vs-senologie-preop-markierung.md) | Methode der präoperativen Markierung der Mamma-Läsion. |
| [ VS Senologie Präparat-Art  ](ValueSet-vs-senologie-praeparat-art.md) | Material-Art für Patho-Specimen (Stanze/Vakuum/Punch/Resektat/Zytologie/FNA). Treibt den oBDS-Diagnosesicherungs-Code. |
| [ VS Senologie Ptosis-Grad (Regnault)  ](ValueSet-vs-senologie-ptosis-grad.md) | Ptosis-Grad nach Regnault (0/I/II/III) für die Inspektion. |
| [ VS Senologie Quadrant Mamma  ](ValueSet-vs-senologie-quadrant-mamma.md) | Quadranten-Lokalisation der Brust (oben-aussen/innen, unten-aussen/innen, Mamille, Zentral). |
| [ VS Senologie R-Status (Resektionsstatus)  ](ValueSet-vs-senologie-r-status.md) | Resektionsstatus R0/R1/R2/RX nach UICC, kodiert mit SNOMED CT (SCT#135252x00x). |
| [ VS Senologie RECIST-Response  ](ValueSet-vs-senologie-recist-response.md) | Reine Response-Assessment-Werte (SD/PR/CR/PD/Mixed) für die Verlaufs-Dokumentation, ohne Erst-Diagnose-Stati. |
| [ VS Senologie Raucherstatus  ](ValueSet-vs-senologie-raucherstatus.md) | Tobacco smoking status (LOINC LA codes für Antworten zur Frage 72166-2). |
| [ VS Senologie Risikoklasse  ](ValueSet-vs-senologie-risikoklasse.md) | Risikokategorien für Genexpressionstests (low, intermediate, high) |
| [ VS Senologie Screening-Status  ](ValueSet-vs-senologie-detektion-modus.md) | Art der Detektion (Screening-detektiert / Intervallkarzinom / Selbstuntersuchung / Zufallsbefund). |
| [ VS Senologie Screeningstatus  ](ValueSet-vs-senologie-screeningstatus.md) | Screeningstatus einer klinischen Studienteilnahme |
| [ VS Senologie Seite  ](ValueSet-vs-senologie-seite.md) | Lateralität der Mamma-Erkrankung |
| [ VS Senologie Seitenlokalisation Mamma  ](ValueSet-vs-senologie-seite-mamma.md) | Brust-Seitenlokalisation (Rechts/Links/Beidseits) als SNOMED-CT-Codes für alle Formulare der Senologie-IG. |
| [ VS Senologie Standort (intern / extern)  ](ValueSet-vs-senologie-standort.md) | Standort einer Untersuchung: intern (eigene Klinik) / extern (externe Praxis/Klinik). |
| [ VS Senologie Strahlentherapie-Applikationsart  ](ValueSet-vs-senologie-rt-applikationsart.md) | Applikationsmodus der Strahlentherapie (3D-konformal/IMRT/Brachytherapie). |
| [ VS Senologie Strahlentherapie-Zielvolumen  ](ValueSet-vs-senologie-rt-zielvolumen.md) | Zielvolumen der Mamma-Strahlentherapie. |
| [ VS Senologie Symmetrie der Brüste  ](ValueSet-vs-senologie-symmetrie.md) | Symmetrie-Bewertung: Symmetrisch / Asymmetrisch. |
| [ VS Senologie Systemtherapie Medikation  ](ValueSet-vs-senologie-systemtherapie-medikation.md) | Medikamente der Mamma-Systemtherapie — SNOMED CT Codes, validiert über Terminologieserver (International Edition 2025-12-01) |
| [ VS Senologie Systemtherapie-Art  ](ValueSet-vs-senologie-systemtherapie-art.md) | Art der Systemtherapie (Chemo/Endokrin/Zielgerichtet/Immuntherapie). |
| [ VS Senologie TNM M-Kategorie (Mamma)  ](ValueSet-vs-senologie-tnm-m-kategorie-mamma.md) | M-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). MX wurde mit TNM 8 abgeschafft, M1a/b/c/d sind keine Mamma-Differenzierung. |
| [ VS Senologie TNM N-Kategorie (Mamma)  ](ValueSet-vs-senologie-tnm-n-kategorie-mamma.md) | N-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). N2c ist beim Mamma-Ca nicht vorgesehen und wurde ausgeschlossen. |
| [ VS Senologie TNM T-Kategorie (Mamma)  ](ValueSet-vs-senologie-tnm-t-kategorie-mamma.md) | T-Kategorien nach TNM 8 für Mammakarzinom (S3-Leitlinie). Schließt T1c1-T1c3, T1d, Tis(LAMN/LCIS/pu/pd) und andere nicht-mammarelevante Codes der MII-Onko-Liste aus. Tis(LCIS) wird in TNM 8 für Mamma nicht mehr als Tis kodiert. |
| [ VS Senologie Therapie-Intention  ](ValueSet-vs-senologie-therapie-intention.md) | Therapeutische Intention (Adjuvant/Neoadjuvant/Palliativ/Kurativ/Revision/Diagnostisch). Verwendet für OP-Planung, Postop, Strahlen- und Systemtherapie. |
| [ VS Senologie Therapie-Status  ](ValueSet-vs-senologie-therapie-status.md) | Status einer Therapieeinheit (Strahlen- oder Systemtherapie). |
| [ VS Senologie Tumorboard Empfehlung Status  ](ValueSet-vs-senologie-tumorboard-empfehlung-status.md) | Beschlusszustand pro Therapie-Empfehlung im Tumorboard (empfohlen / bedingt empfohlen / nicht empfohlen / nicht diskutiert). |
| [ VS Senologie Tumormanifestation  ](ValueSet-vs-senologie-tumormanifestation.md) | Tumormanifestation bei Diagnosestellung (Mehrfachauswahl möglich) |
| [ VS Senologie Tumornachweis-Status  ](ValueSet-vs-senologie-tumornachweis-status.md) | Diagnostische Stati + RECIST-Response-Assessment für die klinische Untersuchung. Mischung aus Diagnose-Stage (Abklärungsbedürftig, Erstdiagnose) und Verlaufs-Response-Werten (SD/PR/CR/PD/Mixed). |
| [ VS Senologie UICC-Stadium (Mamma)  ](ValueSet-vs-senologie-uicc-stadium-mamma.md) | UICC-Stadien für Mammakarzinom nach TNM 8 / AJCC 8. Primärkodierung über https://www.uicc.org/resources/tnm (MII_CS_Onko_TNM_UICC, auf MII-OntoServer verfügbar); alternativ SCT-Qualifier-Values (HDB-866). Binding: extensible. |
| [ VS Senologie US-DEGUM Klassifikation  ](ValueSet-vs-senologie-us-degum.md) | DEGUM-Sonographie-Klassifikation 0-6 für Mamma-Sono. |
| [ VS Senologie V-Kategorie (Vasoinvasion)  ](ValueSet-vs-senologie-v-kategorie.md) | V-Kategorie (Venöse Invasion) nach UICC TNM (V0/V1/V2/VX). |
| [ VS Senologie Verlauf Tumorstatus Gesamtbeurteilung  ](ValueSet-vs-senologie-verlauf-tumorstatus-gesamt.md) | Gesamtbeurteilung des Tumorstatus im Verlauf (CR/PR/SD/Progression). Unterscheidet sich von RECIST-Response durch Disease-State-Sicht (langfristig). |
| [ VS Senologie Verwandtschaftsgrad  ](ValueSet-vs-senologie-verwandtschaftsgrad.md) | Verwandtschaftsgrad (mütterlicher-/väterlicher-Stamm) für Familienanamnese. |
| [ VS Senologie Vorstellungsgrund  ](ValueSet-vs-senologie-vorstellungsgrund.md) | Grund der Erst- oder Folge-Vorstellung in der Senologie. |
| [ VS Senologie Zweittumor  ](ValueSet-vs-senologie-zweittumor.md) | Zweittumor diagnostiziert: ja/nein/unbekannt — OncoBox M08 |
| [ ValueSet Diagnosesicherung  ](ValueSet-vs-senologie-diagnosesicherung.md) | Art der Diagnosesicherung gemäß oBDS für onkologische Diagnosen |
| [ ValueSet Senologie ICD-10-GM  ](ValueSet-vs-senologie-icd10.md) | ICD-10-GM Codes für Mamma-Erkrankungen (maligne und benigne) basierend auf Dotbase Codebook |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ CS OncoBox Primaerfallart  ](CodeSystem-cs-oncobox-primaerfallart.md) | Primaerfallart nach OnkoZert-Systematik (OncoBox 2.0 D01) |
| [ CS Senologie Bildgebung Custom  ](CodeSystem-cs-senologie-bildgebung-custom.md) | Custom Codes für radiologische Befunde der Senologie (LK-Status, Standort, Beurteilbarkeit, US-DEGUM) ohne passendes SNOMED-Mapping. |
| [ CS Senologie Biomarker Erweiterungen  ](CodeSystem-cs-senologie-biomarker.md) | Codes für zusätzliche IHC-Components am MII Onko Mamma Rezeptorstatus (ER/PR): IRS (Remmele-Stegner) und Allred Score. Backport-Kandidaten für MII Onko. |
| [ CS Senologie Clinical Findings Custom  ](CodeSystem-cs-senologie-clinical-findings-custom.md) | Custom Codes für klinische Senologie-Befunde ohne direktes SNOMED-Mapping (Ptosis-Grad, Tumornachweis-Erstdiagnose-Mammakarzinom). |
| [ CS Senologie Diagnose Custom  ](CodeSystem-cs-senologie-diagnose-custom.md) | Senologie-spezifische Diagnose-Codes fuer Mamma-Konzepte ohne eindeutiges SNOMED-CT-Mapping (Rezidiv, Mamillensekretion, kosmetische/funktionelle Anomalien, Befund unklarer Dignitaet, Sonstiges). |
| [ CS Senologie Follow-Up  ](CodeSystem-cs-senologie-follow-up.md) | Lokale Codes für Senologie-Verlaufsmeldungen (OncoBox M01-M10). Enthält Codes für Observation.method (Nachsorge-Art), Zweittumor-Komponentencode und Wertcodes. |
| [ CS Senologie Form-Helper-Codes  ](CodeSystem-cs-senologie-form-helper.md) | Lokale Codes für Form-Antworten ohne eindeutige SCT-Entsprechung (Kontrazeption-Status, Nachsorge-Modus, Allgemeinzustand-vereinfacht, Lymphödem-Grad nach ISL). |
| [ CS Senologie Genexpressionstest  ](CodeSystem-cs-senologie-genexpressionstest.md) | Genexpressionstests zur Abschätzung des Rezidivrisikos bei Mammakarzinom |
| [ CS Senologie Metastasierung  ](CodeSystem-cs-senologie-metastasierung.md) | Metastasierungsstatus fuer Senologie (M0 / primaer / sekundaer metastasiert). |
| [ CS Senologie SDC LaunchContext  ](CodeSystem-cs-senologie-launchcontext.md) | Senologie-spezifische SDC launchContext-Variablennamen. Ergänzt den SDC-Default-CS um 'diagnosis' (Condition als Anker für nachgelagerte Questionnaires). |
| [ CS Senologie Tumorboard Empfehlung  ](CodeSystem-cs-senologie-tumorboard-empfehlung.md) | Beschlusszustand pro Therapie-Empfehlung im Tumorboard. |
| [ CS Senologie Tumormanifestation  ](CodeSystem-cs-senologie-tumormanifestation.md) | Klassifikation der Tumormanifestation bei Diagnosestellung |
| [ CodeSystem Diagnosesicherung  ](CodeSystem-cs-senologie-diagnosesicherung.md) | Diagnosesicherung gemäß oBDS (Onkologischer Basisdatensatz) |

### Terminology: Structure Maps 

These define transformations to convert between data structures used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ Extract Senologie Diagnose from QuestionnaireResponse  ](StructureMap-extract-diagnose.md) |  |
| [ SenologieToIRegEntlassung  ](StructureMap-SenologieToIRegEntlassung.md) | title: Senologie Encounter + Condition to IRegG Entlassung + DiagnoseBrustimplantat status: draft |
| [ SenologieToIRegMeldung  ](StructureMap-SenologieToIRegMeldung.md) | title: Senologie FHIR Bundle to IRegG Brustimplantat-Meldung (Orchestrator) targetSpec: IRegG XML-Spezifikation V4.1.1 XSD-Quelle: implantateregister-deutschland.de / IRD_XML_Spezifikation_V4.1.1.zip Master-Schema: IRD_XML_Spezifikation.xsd, Meldungen: GEMeldung.xsd senologieVersion: 0.9.0 status: draft |
| [ SenologieToIRegOperation  ](StructureMap-SenologieToIRegOperation.md) | title: Senologie Procedure + Device to IRegG Operation + Artikelidentifikation status: draft |
| [ SenologieToIRegPatient  ](StructureMap-SenologieToIRegPatient.md) | title: Senologie Patient + Observations to IRegG Patientenaufnahme status: draft |
| [ SenologieToIqtigBasis  ](StructureMap-SenologieToIqtigBasis.md) | title: Senologie Patient + Encounter to IQTIG 18.1 Teildatensatz Basis status: draft |
| [ SenologieToIqtigBrust  ](StructureMap-SenologieToIqtigBrust.md) | title: Senologie Condition + Pathologie to IQTIG 18.1 Teildatensatz Brust status: draft |
| [ SenologieToIqtigMammachirurgie181  ](StructureMap-SenologieToIqtigMammachirurgie181.md) | title: Senologie FHIR Bundle to IQTIG QS 18.1 Mammachirurgie (Orchestrator) targetSpec: IQTIG QS-Basisspezifikation Spez 2026 V06 (Modul 18n1) XSD-Quelle: https://iqtig.org/downloads/spezifikation/fdok/sj2026/v06/2026_XML_Schema_V06.zip Beispiele: 2026_XML_Schema_V06/XML-Beispiele/interface_LE/indirekt/LQS_DeQS_18n1.xml senologieVersion: 0.9.0 status: draft |
| [ SenologieToIqtigOperation  ](StructureMap-SenologieToIqtigOperation.md) | title: Senologie Procedure + Specimen to IQTIG 18.1 Teildatensatz Operation status: draft |
| [ SenologieToObdsDiagnose  ](StructureMap-SenologieToObdsDiagnose.md) | title: Senologie Diagnose Bundle to oBDS Diagnosemeldung status: draft |
| [ SenologieToObdsFernmetastasen  ](StructureMap-SenologieToObdsFernmetastasen.md) | title: Senologie Fernmetastasen Observations to oBDS Fernmetastasen BackboneElement status: draft |
| [ SenologieToObdsHistologie  ](StructureMap-SenologieToObdsHistologie.md) | title: Senologie Histologie Observations to oBDS Histologie BackboneElement status: draft |
| [ SenologieToObdsLeistungszustand  ](StructureMap-SenologieToObdsLeistungszustand.md) | title: Senologie ECOG Observation to oBDS Allgemeiner Leistungszustand status: draft |
| [ SenologieToObdsMeldung  ](StructureMap-SenologieToObdsMeldung.md) | title: Senologie FHIR Bundle to oBDS Meldung (Master Orchestrator) targetSpec: oBDS XML-Datensatz v3.0.5 (22.09.2025) XSD-Quelle: https://www.basisdatensatz.de/xml/oBDS_v3.0.5.xsd abwaertskompatibel zu v3.0.1 (Testpatient_Mamma.xml) senologieVersion: 0.9.0 status: draft |
| [ SenologieToObdsModulMamma  ](StructureMap-SenologieToObdsModulMamma.md) | title: Senologie Mamma-Observations to oBDS Modul_Mamma BackboneElement status: draft |
| [ SenologieToObdsNebenwirkung  ](StructureMap-SenologieToObdsNebenwirkung.md) | title: Senologie Nebenwirkung Observations to oBDS Nebenwirkungen BackboneElement status: draft |
| [ SenologieToObdsOP  ](StructureMap-SenologieToObdsOP.md) | title: Senologie Operation Bundle to oBDS OP-Meldung status: draft |
| [ SenologieToObdsResidualstatus  ](StructureMap-SenologieToObdsResidualstatus.md) | title: Senologie Residualstatus Observation to oBDS Residualstatus BackboneElement status: draft |
| [ SenologieToObdsST  ](StructureMap-SenologieToObdsST.md) | title: Senologie FHIR to oBDS Strahlentherapie (ST) status: draft |
| [ SenologieToObdsSYST  ](StructureMap-SenologieToObdsSYST.md) | title: Senologie FHIR to oBDS Systemische Therapie (SYST) status: draft |
| [ SenologieToObdsTNM  ](StructureMap-SenologieToObdsTNM.md) | title: Senologie TNM Observations to oBDS TNM BackboneElement status: draft |
| [ SenologieToObdsTod  ](StructureMap-SenologieToObdsTod.md) | title: Senologie Patient + Conditions to oBDS Todesmeldung status: draft |
| [ SenologieToObdsTumorkonferenz  ](StructureMap-SenologieToObdsTumorkonferenz.md) | title: Senologie FHIR to oBDS Tumorkonferenz status: draft |
| [ SenologieToObdsTumorzuordnung  ](StructureMap-SenologieToObdsTumorzuordnung.md) | title: Senologie Diagnose to oBDS Tumorzuordnung status: draft |
| [ SenologieToObdsVerlauf  ](StructureMap-SenologieToObdsVerlauf.md) | title: Senologie Verlauf Bundle to oBDS Verlaufsmeldung status: draft |
| [ SenologieToOncoBoxBrust  ](StructureMap-SenologieToOncoBoxBrust.md) | title: Senologie FHIR Bundle to OncoBox Brust 2.0 (Master Orchestrator) targetSpec: OncoBox Brust 2.0 — Auditjahr 2026, Spezifikation v2.1.1 XSD-Quelle: https://xml-oncobox.de/de/Home/FuerHersteller (Brust2/26_1_oncobox-brust xsd-schema dkgzert (251110).xsd) ersetzt Vorgaengerversion 1.0 / N1.1.1 senologieVersion: 0.9.0 status: draft |
| [ SenologieToOncoBoxBrustKennzahlen  ](StructureMap-SenologieToOncoBoxBrustKennzahlen.md) | title: Senologie Bundle to OncoBox Brust DKG-Kennzahlen (KB-1 bis KB-20) status: draft |
| [ SenologieToOncoBoxBrustOperation  ](StructureMap-SenologieToOncoBoxBrustOperation.md) | title: Senologie Procedure + Specimen to OncoBox Brust Operation status: draft |
| [ SenologieToOncoBoxBrustPrimaerfall  ](StructureMap-SenologieToOncoBoxBrustPrimaerfall.md) | title: Senologie Condition + Patient + Encounter to OncoBox Brust Primaerfall status: draft |
| [ SenologieToOncoBoxBrustTherapie  ](StructureMap-SenologieToOncoBoxBrustTherapie.md) | title: Senologie Procedure (Syst / RT) to OncoBox Brust Therapie status: draft |
| [ SenologieToOncoBoxBrustVerlauf  ](StructureMap-SenologieToOncoBoxBrustVerlauf.md) | title: Senologie Bundle to OncoBox Brust Verlauf (inkl. OncoBox 2.0 FM-Felder J03-J05) status: draft |
| [ SenologieToOncoBoxBrustZentrum  ](StructureMap-SenologieToOncoBoxBrustZentrum.md) | title: Senologie Organization to OncoBox Brust Zentrum status: draft |

### Terminology: Concept Maps 

These define transformations to convert between codes by systems conforming with this implementation guide.

| | |
| :--- | :--- |
| [ CM SNOMED CT Brustquadrant zu ICD-O-3 Topographie  ](ConceptMap-cm-sct-to-icdo3-mamma-topographie.md) | Übersetzung der SNOMED-CT-kodierten Brustquadranten in ICD-O-3 Topographie-Codes (C50.0–C50.9) für die oBDS-Krebsregistermeldung. Quelle: BodyStructure.locationQualifier[quadrant]. |
| [ CM Senologie Diagnose SCT → ICD-10-GM  ](ConceptMap-cm-senologie-diagnose-sct-to-icd10.md) | Mapping der Mamma-Diagnose-Choices (SNOMED CT + Senologie-Custom) zu ICD-10-GM-Codes. Eingesetzt im Diagnose-Questionnaire-Extract zur automatischen Befüllung der ICD-10-Slice. |
| [ ConceptMap: SNOMED CT → ASK (Senologie Systemtherapie)  ](ConceptMap-CM-Senologie-Medikation-SCT-ASK.md) | Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf Arzneistoffkatalog (ASK, BfArM 2026). Validiert über fhir-terminology MCP Server. |
| [ ConceptMap: SNOMED CT → ATC (Senologie Systemtherapie)  ](ConceptMap-CM-Senologie-Medikation-SCT-ATC.md) | Mapping der Senologie-Systemtherapie-Wirkstoffe von SNOMED CT auf ATC (BfArM 2026). Validiert über fhir-terminology MCP Server gegen lokale Snowstorm- und ATC-Instanz. |
| [ LOINC Rezeptorstatus zu oBDS/OncoBox/IQTIG P/N/U  ](ConceptMap-cm-loinc-rezeptorstatus-to-obds.md) | Mapping: LOINC Answer-Codes LA6576-8/LA6577-6/LA4489-6 (Positive/Negative/Unknown) → P/N/U Single-Code (oBDS, OncoBox, IQTIG). |
| [ MII HER2 Leitlinien-Klassifikation zu oBDS/OncoBox/IQTIG P/N/U  ](ConceptMap-cm-her2-leitlinie-to-obds.md) | Mapping: MII Her2neu-Leitlinien-Codes (positiv/low/ultralow/negativ/equivocal) → P/N/U. HER2-low und HER2-ultralow werden zu 'N' subsumiert (oBDS-Spec-Limitation). |
| [ MII Verlauf Gesamtbeurteilung zu OncoBox Verlauf-Ereignis  ](ConceptMap-cm-oncobox-verlauf-gesamtbeurteilung-ereignis.md) | Mapping der MII Onko Verlauf-Gesamtbeurteilung auf OncoBox Verlauf_Ereignis. Stabile Zustaende (V, T, K, B, R) erzeugen kein Verlaufsereignis. P (Progression) wird auf 6 (Progress) gemappt, Y (Rezidiv) auf 1 (Lokalrezidiv als Default). D (divergent) und U/X (unbekannt/fehlend) werden nicht gemappt. |
| [ OncoBox Endokrine Substanzklasse zu ATC  ](ConceptMap-cm-oncobox-endokrine-substanz-atc.md) | Mapping von ATC-Codes endokriner Substanzen zu OncoBox-Substanzklassen (1=Tamoxifen, 2=Aromatasehemmer, 3=GnRH-Analogon, 4=Fulvestrant, 5=CDK4/6-Inhibitor) |
| [ SNOMED CT Diagnostik-Procedure zu oBDS Diagnosesicherung  ](ConceptMap-cm-sct-to-obds-diagnosesicherung.md) | Mapping: SNOMED CT Biopsie-Codes → oBDS-Diagnosesicherungscode (5.7). Stützt CQL-QI-2 mit Datenquellen-Agnostik. |
| [ SNOMED CT to oBDS Fernmetastasen-Lokalisation  ](ConceptMap-cm-sct-to-obds-fm-lokalisation.md) | Mapping von SNOMED CT Koerperstruktur-Codes zu oBDS Fernmetastasen-Lokalisation (PUL, OSS, HEP, BRA, etc.) |
| [ SNOMED CT to oBDS Grading  ](ConceptMap-cm-sct-to-obds-grading.md) | Mapping von SNOMED CT Gradingcodes zu oBDS Grading (1, 2, 3, 4, X, L, M, H, B) |
| [ SNOMED CT to oBDS Intention  ](ConceptMap-cm-sct-to-obds-intention.md) | Mapping von SNOMED CT Intentionscodes zu oBDS Intention (K, P, D, R, S, X) |
| [ SNOMED CT to oBDS Residualstatus  ](ConceptMap-cm-sct-to-obds-residualstatus.md) | Mapping von SNOMED CT UICC R-Klassifikation zu oBDS Residualstatus (R0, R1, R2, RX) |
| [ SNOMED CT to oBDS Seitenlokalisation  ](ConceptMap-cm-sct-to-obds-seitenlokalisation.md) | Mapping von SNOMED CT Lateralitaetscodes zu oBDS Seitenlokalisation (R, L, B, M, T, U) |
| [ SNOMED CT to oBDS Therapie-Stellung zur OP  ](ConceptMap-cm-sct-to-obds-therapiestellung.md) | Mapping von SNOMED CT Codes zu oBDS Stellung zur OP (O, A, N, I, Z, S) |
| [ SNOMED CT to oBDS Therapieart  ](ConceptMap-cm-sct-to-obds-therapieart.md) | Mapping von SNOMED CT Therapieart-Codes zu oBDS Therapieart (CH, HO, IM, ZS, SO, ST) |
| [ SNOMED CT to oBDS Verlauf Gesamtbeurteilung  ](ConceptMap-cm-sct-to-obds-verlauf-gesamtbeurteilung.md) | Mapping von SNOMED CT Tumorstatusbewertungen zu oBDS Gesamtbeurteilung Tumorstatus (V, T, K, P, U, X) |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [ Beispiel Skelettszintigraphie (Staging)  ](DiagnosticReport-Example-Bildgebung-Skelettszintigraphie.md) | Skelettszintigraphie im Rahmen des Stagings bei Mammakarzinom — kein Hinweis auf ossäre Metastasen. |
| [ Beispiel: ADAPT-HER2 Studie  ](ResearchStudy-Example-ResearchStudy-ADAPT-HER2.md) | Fiktive klinische Studie ADAPT-HER2 für Mammakarzinom |
| [ Beispiel: Adjuvante Bestrahlung 50 Gy / 25 Fraktionen  ](Procedure-Example-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links mit 50 Gy in 25 Fraktionen nach BET |
| [ Beispiel: BET links mit Sentinel-LK-Biopsie  ](Procedure-Example-Operation-BET.md) | Brusterhaltende Therapie (BET) links mit intraoperativer Sentinel-Lymphknoten-Biopsie |
| [ Beispiel: BI-RADS 1 rechts  ](Observation-Example-Bildgebung-BiRADS-Rechts.md) | BI-RADS 1 Befund der rechten Brust bei Mammographie |
| [ Beispiel: BI-RADS 5 links  ](Observation-Example-Bildgebung-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust bei Mammographie |
| [ Beispiel: Begleitmedikation Metoprolol 47,5 mg  ](MedicationStatement-Example-Begleitmedikation-Metoprolol.md) | Patientin nimmt Metoprolol 47,5 mg 1x täglich wegen arterieller Hypertonie. |
| [ Beispiel: DCIS rechts  ](Condition-Example-Diagnose-DCIS.md) | Duktales Carcinoma in situ der rechten Brust, mammographisch entdeckt |
| [ Beispiel: Epirubicin 90 mg/m², Zyklus 1, Tag 1  ](MedicationStatement-Example-Medikation-Epirubicin.md) | Einzelgabe Epirubicin im Rahmen des EC-T Schemas, Zyklus 1, Tag 1 |
| [ Beispiel: Invasiv-duktales Karzinom G2, ER+/PR+/HER2-  ](DiagnosticReport-Example-Pathologie-Befund.md) | Pathologischer Befund nach Stanzbiopsie: invasiv-duktales Karzinom, G2, Hormonrezeptor-positiv, HER2-negativ |
| [ Beispiel: Mammakarzinom links  ](Condition-Example-Diagnose-Mammakarzinom.md) | Primäres Mammakarzinom der linken Brust, Stadium II, histologisch gesichert |
| [ Beispiel: Mammakarzinom-Rezidiv  ](Condition-Example-Diagnose-Rezidiv.md) | Lokalrezidiv eines Mammakarzinoms nach brusterhaltender Therapie |
| [ Beispiel: Mammographie bilateral, BI-RADS 5 links  ](DiagnosticReport-Example-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund links (BI-RADS 5) und unauffälligem Befund rechts (BI-RADS 1) |
| [ Beispiel: Neoadjuvante Chemotherapie EC-T  ](Procedure-Example-Systemtherapie-ECT.md) | Neoadjuvante Chemotherapie mit Epirubicin/Cyclophosphamid gefolgt von Docetaxel (EC-T Schema) |
| [ Beispiel: Pathologische Diagnose/Conclusion  ](Observation-Example-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Beispiel: Patientin  ](Patient-example-patient.md) | Beispiel-Patientin für Senologie-Instanzen |
| [ Beispiel: Sentinel-Lymphknoten-Biopsie links  ](Procedure-Example-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [ Beispiel: Stanzbiopsie-Präparat links OAQ  ](Specimen-Example-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [ Beispiel: Studienteilnahme ADAPT-HER2  ](ResearchSubject-Example-Studienteilnahme.md) | Beispiel einer Patientin, die in der ADAPT-HER2-Studie im Interventionsarm teilnimmt |
| [ Brustzentrum Charité — Universitätsmedizin Berlin  ](Organization-Brustzentrum-Charite.md) | Zertifiziertes Brustzentrum der Charité |
| [ Checkliste erbliche Belastung — durchgeführt (Score 3)  ](Observation-Example-Checkliste-Erbliche-Belastung-Ja.md) | Beispiel: Checkliste wurde durchgeführt mit Score 3 |
| [ Checkliste erbliche Belastung — nicht durchgeführt  ](Observation-Example-Checkliste-Erbliche-Belastung-Nein.md) | Beispiel: Checkliste wurde nicht durchgeführt |
| [ Fall 1 — QR Bildgebung  ](QuestionnaireResponse-QR-Bildgebung-Fall1.md) | Mammographie bilateral 2025-01-15, BI-RADS 5 links OAQ, ACR C, kein Mikrokalk, LK unauffaellig. |
| [ Fall 1 — QR Diagnose  ](QuestionnaireResponse-QR-Diagnose-Fall1.md) | Antworten auf senologie-diagnose fuer Fall 1 (C50.4 links OAQ, gesichert). |
| [ Fall 1 — QR Erstanamnese  ](QuestionnaireResponse-QR-Erstanamnese-Fall1.md) | Allgemeine + Gyn + Familienanamnese fuer Fall 1 (Erstvorstellung, postmenopausal, Mutter Mammakarzinom 52J). |
| [ Fall 1 — QR Klinische Untersuchung  ](QuestionnaireResponse-QR-KlinUntersuchung-Fall1.md) | Klinische Untersuchung Fall 1: tastbarer Knoten OAQ links, Inspektion unauffaellig, cT1c cN0 cM0 IA. |
| [ Fall 1 — QR OP-Planung  ](QuestionnaireResponse-QR-OPPlanung-Fall1.md) | OP-Planung Fall 1: BET links + Sentinel-LK-Biopsie, kurativ, 90 min, Drahtmarkierung. |
| [ Fall 1 — QR Pathologie  ](QuestionnaireResponse-QR-Pathologie-Fall1.md) | Stanzbiopsie 2025-01-20: NST G2, ER+ IRS 12, PR+ IRS 8, HER2- 1+, Ki67 15%, pT1c pN0(sn) (postoperative pTNM). |
| [ Fall 1 — QR PostOP  ](QuestionnaireResponse-QR-PostOP-Fall1.md) | PostOP Fall 1: BET + SLNB links 2025-02-05, R0, Sentinel 0/2, keine Komplikation. |
| [ Fall 1 — QR Strahlentherapie  ](QuestionnaireResponse-QR-Strahlentherapie-Fall1.md) | Adjuvante Strahlentherapie 2025-03-10 bis 2025-04-18: Ganzbrust 50 Gy (25 Fraktionen) + Boost 10 Gy (5 Fraktionen). |
| [ Fall 1 — QR Systemtherapie  ](QuestionnaireResponse-QR-Systemtherapie-Fall1.md) | Endokrine adjuvante Therapie ab 2025-04-25: Letrozol 2,5 mg oral, laufend. |
| [ Fall 1 — QR Tumorboard  ](QuestionnaireResponse-QR-Tumorboard-Fall1.md) | Tumorboard 2025-01-28: BET + SLNB empfohlen, adjuvante RT empfohlen, endokrine Therapie empfohlen, Chemotherapie nicht empfohlen (Oncotype DX RS 18). |
| [ Fall 1 — QR Verlauf 6-Monats-Kontrolle  ](QuestionnaireResponse-QR-Verlauf-Fall1.md) | 6-Monats-Kontrolle 2025-07-15: aktive Nachsorge, AZ gut, Lokalbefund unauffaellig, kein Lymphoedem, kein Rezidiv, keine Fernmetastasen. |
| [ Fall 1 — Raucherstatus: Nie geraucht  ](Observation-Fall1-Raucherstatus.md) | OncoBox 2.0 C03: Raucherstatus der Patientin (ISiK-kompatibel) |
| [ Fall 1 — Sozialdienst-Kontakt durchgeführt  ](Procedure-Fall1-Sozialdienst.md) | OncoBox 2.0 L02: Sozialdienst-Beratung stattgefunden |
| [ Fall 10 — QR Diagnose (Verdacht)  ](QuestionnaireResponse-QR-Diagnose-Fall10-Verdacht.md) | Antworten auf senologie-diagnose am Tag der Bildgebung: Verdacht auf Mammakarzinom rechts (BI-RADS 4c), vor der histologischen Sicherung. |
| [ Fall 10 — QR Diagnose (gesichert)  ](QuestionnaireResponse-QR-Diagnose-Fall10.md) | Antworten auf senologie-diagnose nach dem Pathologiebefund: Mammakarzinom rechts gesichert (C50.4, triple-negativ, G3). |
| [ Fall 10 — QR Systemtherapie  ](QuestionnaireResponse-QR-Systemtherapie-Fall10.md) | Adjuvante Chemotherapie ab 2025-07-21: Carboplatin + Paclitaxel, 6 Zyklen, abgeschlossen 2025-11-10. |
| [ Fall 10 — QR Tumorboard  ](QuestionnaireResponse-QR-Tumorboard-Fall10.md) | Tumorboard 2025-06-03: Mastektomie mit Sofortrekonstruktion und adjuvante Chemotherapie empfohlen, Strahlentherapie und endokrine Therapie nicht empfohlen (hormonrezeptor-negativ). |
| [ Fall 10: Adjuvante Chemotherapie Carboplatin + Paclitaxel  ](Procedure-Fall10-Systemtherapie-Adjuvant.md) | Adjuvante Chemotherapie mit Carboplatin + Paclitaxel bei TNBC + PALB2 |
| [ Fall 10: BI-RADS 4c rechts  ](Observation-Fall10-BiRADS-Rechts.md) | BI-RADS 4c Befund der rechten Brust |
| [ Fall 10: Brustimplantat links (Sofortrekonstruktion)  ](Device-Fall10-Implantat-Links.md) | Brustimplantat links nach prophylaktischer Mastektomie, Sofortrekonstruktion |
| [ Fall 10: Brustimplantat rechts (Sofortrekonstruktion)  ](Device-Fall10-Implantat-Rechts.md) | Brustimplantat rechts nach therapeutischer Mastektomie, Sofortrekonstruktion |
| [ Fall 10: Carboplatin AUC5, Zyklus 1, Tag 1  ](MedicationStatement-Fall10-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der adjuvanten Therapie |
| [ Fall 10: ECOG-Leistungszustand nach Abschluss der Therapie  ](Observation-Fall10-ECOG-PostTherapie.md) | ECOG 0 — vollständig aktiv, keine Einschränkung |
| [ Fall 10: ER-Status — negativ, IRS 0  ](Observation-Fall10-ER-Status.md) | Östrogenrezeptor negativ (0 % positive Zellen). |
| [ Fall 10: Familienanamnese — Mutter Mammakarzinom 41 J.  ](FamilyMemberHistory-Fall10-Familienanamnese-Mutter.md) | Mutter mit Mammakarzinom im Alter von 41 Jahren |
| [ Fall 10: Familienanamnese — Schwester Ovarialkarzinom 39 J.  ](FamilyMemberHistory-Fall10-Familienanamnese-Schwester.md) | Schwester mit Ovarialkarzinom im Alter von 39 Jahren |
| [ Fall 10: HER2-Status — HER2-low (IHC 1+)  ](Observation-Fall10-HER2-Status.md) | HER2 IHC 1+. Im oBDS-Slice 'negativ' (damit triple-negativ im Register), im Leitlinien-Slice 'HER2-low'. |
| [ Fall 10: Ki-67 55 %  ](Observation-Fall10-Ki67.md) |  |
| [ Fall 10: Mammographie bilateral  ](DiagnosticReport-Fall10-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund rechts BI-RADS 4c |
| [ Fall 10: Nausea CTCAE Grad 2 unter Carboplatin + Paclitaxel  ](AdverseEvent-Fall10-Nebenwirkung-Nausea.md) | Nausea Grad 2 (moderat) im zweiten Zyklus der adjuvanten Chemotherapie |
| [ Fall 10: PALB2-Keimbahnmutation — pathogen  ](Observation-Fall10-PALB2-Keimbahn-Mutation.md) | Nachweis einer pathogenen PALB2-Keimbahnvariante bei Christina Becker (c.509_510del, Paneldiagnostik) |
| [ Fall 10: PD-L1 Status — CPS 25, positiv (SP142)  ](Observation-Fall10-PDL1-Status.md) | PD-L1 IHC bei TNBC + BRCA1: CPS 25, IC 5% (Atezolizumab-Indikation per IMpassion130) |
| [ Fall 10: PR-Status — negativ, IRS 0  ](Observation-Fall10-PR-Status.md) | Progesteronrezeptor negativ (0 % positive Zellen). |
| [ Fall 10: Paclitaxel 175 mg/m2, Zyklus 1, Tag 1  ](MedicationStatement-Fall10-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der adjuvanten Therapie |
| [ Fall 10: Pathologie — Invasives Karzinom NST, G3, TNBC, Ki-67 55%  ](DiagnosticReport-Fall10-Pathologie-Befund.md) | Pathologischer Befund: Invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 55%, PALB2-Keimbahnmutation |
| [ Fall 10: Pathologische Diagnose/Conclusion  ](Observation-Fall10-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 10: Patientin Christina Becker  ](Patient-Fall10-Patient-Christina-Becker.md) | Synthetische Testpatientin — PALB2-Mutationsträgerin, TNBC rechts, bilaterale Mastektomie mit Implantatrekonstruktion |
| [ Fall 10: Prophylaktische Mastektomie links (risikoreduktiv)  ](Procedure-Fall10-Operation-Mastektomie-Links.md) | Prophylaktische kontralaterale Mastektomie links bei PALB2-Keimbahnmutation |
| [ Fall 10: Sentinel-Lymphknoten-Biopsie rechts  ](Procedure-Fall10-Operation-SLNB.md) | SLNB als Subprozedur der therapeutischen Mastektomie rechts |
| [ Fall 10: Sofortrekonstruktion links mit Implantat  ](Procedure-Fall10-Rekonstruktion-Links.md) | Implantatrekonstruktion links als Subprozedur der prophylaktischen Mastektomie |
| [ Fall 10: Sofortrekonstruktion rechts mit Implantat  ](Procedure-Fall10-Rekonstruktion-Rechts.md) | Implantatrekonstruktion rechts als Subprozedur der therapeutischen Mastektomie |
| [ Fall 10: Stanzbiopsie-Präparat rechts OAQ  ](Specimen-Fall10-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der rechten Brust |
| [ Fall 10: Stationärer Aufenthalt (Mastektomie mit Implantatrekonstruktion)  ](Encounter-Fall10-Encounter-Stationaer.md) | Stationärer Aufenthalt für Mastektomie beidseits mit Sofortrekonstruktion durch Implantate |
| [ Fall 10: TNBC rechts, cT1c cN0 cM0  ](Condition-Fall10-Diagnose-Mammakarzinom.md) | Triple-negatives invasives Mammakarzinom NST rechts, G3, UICC IA, PALB2-Mutationsträgerin |
| [ Fall 10: TNM-Klassifikation cT1c cN0 cM0  ](Observation-Fall10-TNM-Klassifikation.md) | TNM-Klassifikation cT1c cN0 cM0, UICC IA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 10: Therapeutische Mastektomie rechts + SLNB  ](Procedure-Fall10-Operation-Mastektomie-Rechts.md) | Therapeutische Mastektomie rechts mit SLNB, R0, pN0(sn)(0/2) |
| [ Fall 10: Tumorboard-Empfehlung  ](CarePlan-Fall10-Tumorboard.md) | Empfehlung: Mastektomie rechts mit SLNB, risikoreduzierende Mastektomie links, Sofortrekonstruktion mit Implantaten, adjuvante Chemotherapie, keine endokrine Therapie |
| [ Fall 10: Verlaufskontrolle nach Abschluss der Therapie  ](Observation-Fall10-Verlauf-PostTherapie.md) | Nachsorge-Untersuchung nach Mastektomie und Chemotherapie, kein Rezidivhinweis. Aktive Nachsorge, kein Zweittumor. |
| [ Fall 10: Vitalstatus — lebend  ](Observation-Fall10-Vitalstatus-Lebend.md) | Vitalstatus-Observation gemäß MII Person-Modul: Patientin Christina Becker lebt zum Zeitpunkt der Nachsorge. |
| [ Fall 11: BI-RADS 3 links  ](Observation-Fall11-BiRADS-Links.md) | BI-RADS 3 Befund der linken Brust — wahrscheinlich gutartig |
| [ Fall 11: Fibroadenom links oben außen  ](Condition-Fall11-Diagnose-Fibroadenom.md) | Fibroadenom der linken Brust — benigne Diagnose, histologisch bestätigt |
| [ Fall 11: Klinische Brustuntersuchung  ](Observation-Fall11-Klinische-Untersuchung.md) | Klinische Untersuchung mit tastbarem Knoten links oben außen, 15 mm, glatt begrenzt |
| [ Fall 11: Mammographie bilateral  ](DiagnosticReport-Fall11-Bildgebung-Mammographie.md) | Mammographie bilateral mit BI-RADS 3 links |
| [ Fall 11: Pathologie — Fibroadenom, keine Atypie  ](DiagnosticReport-Fall11-Pathologie-Befund.md) | Pathologischer Befund der Stanzbiopsie: Fibroadenom, keine Atypie, B2 |
| [ Fall 11: Pathologische Diagnose/Conclusion  ](Observation-Fall11-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen — benigne |
| [ Fall 11: Patientin Hannah Klein  ](Patient-Fall11-Patient-Hannah-Klein.md) | Synthetische Testpatientin — Fibroadenom der Brust (benigne), keine Therapie |
| [ Fall 11: Sonographie links  ](DiagnosticReport-Fall11-Bildgebung-Sonographie.md) | Sonographie links mit glatt begrenztem, ovalem, echoarmem Knoten |
| [ Fall 11: Stanzbiopsie-Präparat links oben außen  ](Specimen-Fall11-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [ Fall 12: ADH (B3-Läsion), D48.6  ](Condition-Fall12-Diagnose-ADH.md) | Atypische duktale Hyperplasie (ADH), B3-Läsion, ICD-10 D48.6 (meldepflichtig) |
| [ Fall 12: BI-RADS 4a links  ](Observation-Fall12-BiRADS-Links.md) | BI-RADS 4a Befund der linken Brust — geringe Malignitätswahrscheinlichkeit |
| [ Fall 12: Exzisionspräparat Nachresektion links OIQ  ](Specimen-Fall12-Pathologie-Praeparat-Nachresektion.md) | Exzisionspräparat aus dem oberen inneren Quadranten der linken Brust |
| [ Fall 12: Nachresektion / offene Biopsie links  ](Procedure-Fall12-Operation-Nachresektion.md) | Offene Biopsie / Nachresektion links OIQ bei B3-Läsion (ADH), R0, kein Upgrade |
| [ Fall 12: Pathologie Nachresektion — ADH, kein Upgrade, R0  ](DiagnosticReport-Fall12-Pathologie-Befund-Nachresektion.md) | Pathologischer Befund der Nachresektion: ADH bestätigt, kein DCIS, kein invasives Karzinom, R0 |
| [ Fall 12: Pathologie Vakuumbiopsie — ADH, B3  ](DiagnosticReport-Fall12-Pathologie-Befund-Vakuumbiopsie.md) | Pathologischer Befund der Vakuumbiopsie: Atypische duktale Hyperplasie, B3-Kategorie |
| [ Fall 12: Pathologische Diagnose Nachresektion  ](Observation-Fall12-Patho-Conclusion-Nachresektion.md) | Diagnostische Schlussfolgerung: ADH bestätigt, kein Upgrade, R0 |
| [ Fall 12: Pathologische Diagnose Vakuumbiopsie  ](Observation-Fall12-Patho-Conclusion-Vakuumbiopsie.md) | Diagnostische Schlussfolgerung: ADH, B3 |
| [ Fall 12: Patientin Renate Vogel  ](Patient-Fall12-Patient-Renate-Vogel.md) | Synthetische Testpatientin — B3-Läsion (ADH), Nachresektion ohne Upgrade |
| [ Fall 12: Screening-Mammographie bilateral  ](DiagnosticReport-Fall12-Bildgebung-Mammographie.md) | Screening-Mammographie mit Mikrokalzifikationen links BI-RADS 4a |
| [ Fall 12: Tumorboard-Empfehlung — Nachresektion empfohlen  ](CarePlan-Fall12-Tumorboard.md) | Empfehlung: offene Biopsie / Nachresektion zum Ausschluss eines Upgrades bei B3-Läsion |
| [ Fall 12: Vakuumbiopsie-Präparat links OIQ  ](Specimen-Fall12-Pathologie-Praeparat-Vakuumbiopsie.md) | Vakuumbiopsie aus dem oberen inneren Quadranten der linken Brust |
| [ Fall 13: Adjuvante Chemotherapie EC-Pac-H (rechts, HER2+)  ](Procedure-Fall13-Systemtherapie-EC-Pac-H.md) | Adjuvante Chemotherapie EC gefolgt von Paclitaxel + Trastuzumab für HER2-positives Karzinom rechts |
| [ Fall 13: BET links + SLNB  ](Procedure-Fall13-Operation-BET-Links.md) | Brusterhaltende Therapie der linken Brust mit Sentinel-LK-Biopsie, R0 |
| [ Fall 13: Mammakarzinom LINKS — pT1c pN0 cM0, ER+/PR+/HER2-, G2  ](Condition-Fall13-Diagnose-Links.md) | Invasives Karzinom NST der linken Brust, oberer äußerer Quadrant. Frühes Stadium, triple-positiv (HR+/HER2-) |
| [ Fall 13: Mammakarzinom RECHTS — pT2 pN1a cM0, ER+/PR-/HER2+, G3  ](Condition-Fall13-Diagnose-Rechts.md) | Invasives Karzinom NST der rechten Brust, oberer innerer Quadrant. Lokal fortgeschritten, HER2-positiv |
| [ Fall 13: Mastektomie rechts + ALND  ](Procedure-Fall13-Operation-Mastektomie-Rechts.md) | Hautschonende Mastektomie der rechten Brust mit axillärer Lymphknotendissektion, R0 |
| [ Fall 13: Patientin Margarete Schreiber  ](Patient-Fall13-Patient-Margarete-Schreiber.md) | Synthetische Testpatientin — synchrones bilaterales Mammakarzinom |
| [ Fall 13: QR — Bezugsdiagnose-Auswahl (SDC Choice Selection)  ](QuestionnaireResponse-Fall13-QR-Bezugsdiagnose-Selection.md) | Demonstriert das SDC Choice Selection Pattern: Bei bilateralem Karzinom wählt der Arzt die Bezugsdiagnose (Seite) für eine Procedure aus einer candidateExpression-basierten Liste aktiver Mamma-Conditions. |
| [ Fall 13: Stationärer Aufenthalt (bilaterale OP)  ](Encounter-Fall13-Encounter-Stationaer.md) | Stationärer Aufenthalt für simultane bilaterale Operation |
| [ Fall 13: TNM-Klassifikation pT1c pN0 cM0  ](Observation-Fall13-TNM-Klassifikation-Links.md) | TNM-Klassifikation pT1c pN0 cM0, UICC IA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 13: TNM-Klassifikation pT2 pN1a cM0  ](Observation-Fall13-TNM-Klassifikation-Rechts.md) | TNM-Klassifikation pT2 pN1a cM0, UICC IIB. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 14: Adjuvante Bestrahlung Brust links 40 Gy  ](Procedure-Fall14-Strahlentherapie.md) |  |
| [ Fall 14: Adjuvante endokrine Therapie  ](Procedure-Fall14-Systemtherapie.md) |  |
| [ Fall 14: BET + Sentinel-LK-Biopsie links  ](Procedure-Fall14-Operation-BET.md) |  |
| [ Fall 14: ER positiv, IRS 12, 90 %  ](Observation-Fall14-ER-Status.md) |  |
| [ Fall 14: Follow-Up nach Therapie — PR  ](Observation-Fall14-FollowUp.md) |  |
| [ Fall 14: Grading G2  ](Observation-Fall14-Grading.md) |  |
| [ Fall 14: HER2 IHC 2+ (equivocal)  ](Observation-Fall14-HER2-Status.md) |  |
| [ Fall 14: Ki-67 10 %  ](Observation-Fall14-Ki67.md) |  |
| [ Fall 14: Mammakarzinom links C50.3, cT2 cN0 cM0 → pT4b pN1a  ](Condition-Fall14-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST der linken Brust |
| [ Fall 14: Nie-Raucher  ](Observation-Fall14-Raucherstatus.md) |  |
| [ Fall 14: OncoBox-Beispielpatient (re-engineered)  ](Patient-Fall14-Patient-OncoBox-Beispiel.md) | Synthetischer Testpatient aus dem offiziellen OncoBox-Brust-2.0-Beispieldatensatz, re-engineered nach FHIR. Mann, 79J, Mamma-Ca links. |
| [ Fall 14: PR positiv, IRS 9, 73 %  ](Observation-Fall14-PR-Status.md) |  |
| [ Fall 14: Postoperatives Tumorboard 2025-02-23  ](CarePlan-Fall14-Tumorboard-Postop.md) |  |
| [ Fall 14: Prätherapeutisches Tumorboard 2025-02-12  ](CarePlan-Fall14-Tumorboard-Praetherapeutisch.md) |  |
| [ Fall 15: Fernmetastase Leber  ](Observation-Fall15-Fernmetastase-Leber.md) | Lebermetastase (HEP) detektiert 2021-09-14 im Verlauf-Restaging. |
| [ Fall 15: Fernmetastase Lunge  ](Observation-Fall15-Fernmetastase-Lunge.md) | Lungenmetastase (PUL) detektiert 2021-09-14 im Verlauf-Restaging. |
| [ Fall 15: Histologie 2021-09-14 (Re-Biopsie)  ](Observation-Fall15-Histologie-Rebiopsie.md) | Invasives duktales Karzinom NOS (ICD-O 8500/3), Grading G3. Histologie-Einsendung H23201/2021. |
| [ Fall 15: Mammakarzinom rechts C50.4 cT1c  ](Condition-Fall15-Diagnose-Mammakarzinom.md) | Invasives duktales Karzinom NOS (ICD-O 8500/3), rechts, Grading 3, TNM 8 cT1c. Erstdiagnose 2020-02-16. |
| [ Fall 15: Patientin Michaela van Musterfrau (oBDS-Testpatient)  ](Patient-Fall15-Patient-Michaela-Musterfrau.md) | Re-engineered aus oBDS XML v3.0.1 Testpatient_Mamma.xml. Verstorben 2021 nach Verlauf mit Fernmetastasen. |
| [ Fall 15: Todesursache — Mammakarzinom (C50.4)  ](Observation-Fall15-Todesursache.md) | Patientin verstorben 2021-11-27, tumorbedingt durch Mammakarzinom (C50.4). |
| [ Fall 15: Verlauf 2021-09-14 — Progression mit Fernmetastasen  ](Observation-Fall15-Verlauf-Progression.md) | Statusänderung 2021-09-14: lokaler/regionärer/distanter Rezidiv-Status, Leber- und Lungenmetastasen. r-Symbol. |
| [ Fall 1: Adjuvante Bestrahlung 50 Gy + 10 Gy Boost  ](Procedure-Fall1-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links 50 Gy in 25 Fraktionen + 10 Gy Boost |
| [ Fall 1: BET links + SLNB  ](Procedure-Fall1-Operation-BET.md) | Brusterhaltende Therapie links mit Sentinel-LK-Biopsie, R0 |
| [ Fall 1: BI-RADS 5 links  ](Observation-Fall1-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust |
| [ Fall 1: BRCA1 somatisch — Wildtyp  ](Observation-Fall1-Somatische-Mutation-BRCA1.md) | BRCA1 somatische Mutation nicht nachgewiesen (Wildtyp) |
| [ Fall 1: BRCA2 somatisch — Wildtyp  ](Observation-Fall1-Somatische-Mutation-BRCA2.md) | BRCA2 somatische Mutation nicht nachgewiesen (Wildtyp) |
| [ Fall 1: Begleitmedikation L-Thyroxin 75 µg  ](MedicationStatement-Fall1-Begleitmedikation-LThyroxin.md) | L-Thyroxin 75 µg 1x täglich wegen Hypothyreose |
| [ Fall 1: Begleitmedikation Metoprolol 47,5 mg  ](MedicationStatement-Fall1-Begleitmedikation-Metoprolol.md) | Metoprolol 47,5 mg 1x täglich wegen arterieller Hypertonie |
| [ Fall 1: ECOG-Leistungszustand 6 Monate postoperativ  ](Observation-Fall1-ECOG-6Monate.md) | ECOG 0 — vollständig aktiv, keine Einschränkung |
| [ Fall 1: ER-Status — positiv, IRS 12, 95 % / Strong  ](Observation-Fall1-ER-Status.md) | Östrogenrezeptor positiv, hochpositive Expression. Demonstriert die Senologie-Erweiterung mit IRS und Allred zusätzlich zum MII-Onko-Standard (% + Intensität). |
| [ Fall 1: Familienanamnese — Mutter Mammakarzinom  ](FamilyMemberHistory-Fall1-Familienanamnese.md) | Mutter mit Mammakarzinom im Alter von 52 Jahren |
| [ Fall 1: Gesamtbeurteilung nach definitiver Therapie (D27)  ](Observation-Fall1-Verlauf-PostTherapie.md) | Gesamtbeurteilung Tumorstatus nach BET + Strahlentherapie: Vollremission (CR). Kein Residualtumor. D27-Kontext (post-definitive Therapie). |
| [ Fall 1: Gynäkologische Anamnese  ](Observation-Fall1-Gynaekologische-Anamnese.md) | Postmenopausale Patientin, Menarche mit 13, Menopause mit 54 |
| [ Fall 1: HER2-Status — HER2-low (IHC 1+, KEINE ISH nötig)  ](Observation-Fall1-HER2-Status.md) | HER2 IHC 1+. Im oBDS-Slice 'negativ', aber im Leitlinien-Slice korrekt als 'HER2-low' klassifiziert — damit potenzielle T-DXd-Kandidatin bei späterer Metastasierung (DESTINY-Breast04). Demonstriert den Mehrwert der granularen Erfassung gegenüber binärem oBDS. |
| [ Fall 1: Klinische Brustuntersuchung  ](Observation-Fall1-Klinische-Untersuchung.md) | Klinische Untersuchung mit tastbarem Knoten links OAQ |
| [ Fall 1: Komorbidität — Arterielle Hypertonie  ](Condition-Fall1-Komorbiditaet-Hypertonie.md) | Vorbestehende arterielle Hypertonie unter Metoprolol-Therapie |
| [ Fall 1: Komorbidität — Hypothyreose  ](Condition-Fall1-Komorbiditaet-Hypothyreose.md) | Vorbestehende Hypothyreose unter L-Thyroxin-Substitution |
| [ Fall 1: Mammakarzinom links OAQ, cT1c cN0 cM0  ](Condition-Fall1-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST der linken Brust, oberer äußerer Quadrant, UICC IA |
| [ Fall 1: Mammographie bilateral  ](DiagnosticReport-Fall1-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund links BI-RADS 5 |
| [ Fall 1: OP-Planung BET + SLNB  ](ServiceRequest-Fall1-OP-Planung.md) | Geplante brusterhaltende Therapie links mit Sentinel-LK-Biopsie |
| [ Fall 1: Oncotype DX Recurrence Score 18  ](Observation-Fall1-Genexpressions-Score.md) | Oncotype DX Recurrence Score von 18 (niedrig) |
| [ Fall 1: Oncotype DX Risikobewertung  ](RiskAssessment-Fall1-Genexpressionstest.md) | Oncotype DX: niedriges Risiko, 10-Jahres-Fernrezidivrisiko 12% |
| [ Fall 1: PALB2 somatisch — Wildtyp  ](Observation-Fall1-Somatische-Mutation-PALB2.md) | PALB2 somatische Mutation nicht nachgewiesen (Wildtyp) |
| [ Fall 1: PALB2-Keimbahnmutation — Wildtyp  ](Observation-Fall1-PALB2-Keimbahn-Wildtyp.md) | Kein Nachweis einer pathogenen PALB2-Keimbahnvariante bei Erika Neumann (Familienanamnese positiv, Mutter Mammakarzinom 52 J.) |
| [ Fall 1: PR-Status — positiv, IRS 8, 60 % / Moderate  ](Observation-Fall1-PR-Status.md) | Progesteronrezeptor positiv, mittelgradige Expression. |
| [ Fall 1: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-  ](DiagnosticReport-Fall1-Pathologie-Befund.md) | Pathologischer Befund der Stanzbiopsie: invasives Karzinom NST, G2, hormonrezeptor-positiv, HER2-negativ |
| [ Fall 1: Pathologische Diagnose/Conclusion  ](Observation-Fall1-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 1: Patientin Erika Neumann  ](Patient-Fall1-Patient-Erika-Neumann.md) | Synthetische Testpatientin — frühes Mammakarzinom, kurative Behandlung |
| [ Fall 1: Sentinel-Lymphknoten-Biopsie links  ](Procedure-Fall1-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [ Fall 1: Skelettszintigraphie (Staging)  ](DiagnosticReport-Fall1-Bildgebung-Skelettszintigraphie.md) | Skelettszintigraphie im Rahmen des Stagings — kein Hinweis auf ossäre Metastasen |
| [ Fall 1: Stanzbiopsie-Präparat links OAQ  ](Specimen-Fall1-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [ Fall 1: TNM-Klassifikation cT1c cN0 cM0  ](Observation-Fall1-TNM-Klassifikation.md) | TNM-Klassifikation cT1c cN0 cM0, UICC IA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 1: Tumorboard-Empfehlung  ](CarePlan-Fall1-Tumorboard.md) | Empfehlung: BET + SLNB, adjuvante RT, endokrine Therapie, keine Chemotherapie |
| [ Fall 1: Verlaufskontrolle 6 Monate postoperativ  ](Observation-Fall1-Verlauf-6Monate.md) | Nachsorge-Untersuchung nach BET und Strahlentherapie, kein Rezidivhinweis. Aktive Nachsorge, kein Zweittumor. |
| [ Fall 1: Vitalstatus — lebend  ](Observation-Fall1-Vitalstatus-Lebend.md) | Vitalstatus-Observation gemäß MII Person-Modul: Patientin Erika Neumann lebt zum Zeitpunkt der 6-Monats-Nachsorge. |
| [ Fall 2: Adjuvante Bestrahlung Thoraxwand + supraklavikulär 50 Gy  ](Procedure-Fall2-Strahlentherapie.md) | Adjuvante Bestrahlung der Thoraxwand und supraklavikulärer Lymphabflusswege |
| [ Fall 2: Adjuvante Pembrolizumab Maintenance  ](Procedure-Fall2-Systemtherapie-Adjuvant.md) | Adjuvante Pembrolizumab Maintenance nach Operation |
| [ Fall 2: Axilladissektion rechts Level I-III  ](Procedure-Fall2-Operation-Axilladissektion.md) | Axilladissektion als Subprozedur der Mastektomie |
| [ Fall 2: BI-RADS 5 rechts  ](Observation-Fall2-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [ Fall 2: Begleitmedikation Ondansetron 8 mg  ](MedicationStatement-Fall2-Begleitmedikation-Ondansetron.md) | Ondansetron 8 mg als Antiemetikum supportiv bei Chemotherapie |
| [ Fall 2: Begleitmedikation Zoledronat 4 mg  ](MedicationStatement-Fall2-Begleitmedikation-Zoledronat.md) | Zoledronat 4 mg i.v. alle 4 Wochen wegen ossärer Metastase |
| [ Fall 2: CT Thorax/Abdomen (Staging)  ](DiagnosticReport-Fall2-Bildgebung-CT.md) | CT Thorax und Abdomen im Rahmen des Stagings |
| [ Fall 2: Carboplatin AUC5, Zyklus 1, Tag 1  ](MedicationStatement-Fall2-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der neoadjuvanten Therapie |
| [ Fall 2: ECOG-Leistungszustand bei Progression  ](Observation-Fall2-ECOG-Progression.md) | ECOG 2 — deutliche Einschränkung bei Progression mit Lebermetastasen |
| [ Fall 2: Fatigue CTCAE Grad 2 unter Chemotherapie  ](AdverseEvent-Fall2-Nebenwirkung-Fatigue.md) | Fatigue Grad 2 (moderat) unter neoadjuvanter EC-Chemotherapie |
| [ Fall 2: Initiales Tumorboard  ](CarePlan-Fall2-Tumorboard-Initial.md) | Empfehlung: neoadjuvante Chemotherapie + Immuntherapie, dann Mastektomie + Axilladissektion, adjuvante RT, MTB-Überweisung |
| [ Fall 2: KEYNOTE-522 Studie  ](ResearchStudy-Fall2-ResearchStudy-KEYNOTE522.md) | Fiktive klinische Studie KEYNOTE-522 für triple-negatives Mammakarzinom |
| [ Fall 2: MRT Mamma  ](DiagnosticReport-Fall2-Bildgebung-MRT.md) | MRT der Brust zur Ausdehnungsbeurteilung |
| [ Fall 2: Mammographie bilateral  ](DiagnosticReport-Fall2-Bildgebung-Mammographie.md) | Mammographie bilateral mit großem Herdbefund rechts BI-RADS 5 |
| [ Fall 2: Mastektomie rechts + Axilladissektion  ](Procedure-Fall2-Operation-Mastektomie.md) | Modifiziert radikale Mastektomie rechts mit Axilladissektion Level I-III, ypT1a ypN0(0/14) R0 |
| [ Fall 2: Neoadjuvante Chemotherapie + Immuntherapie  ](Procedure-Fall2-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie mit Carboplatin/Paclitaxel + Pembrolizumab |
| [ Fall 2: PD-L1 Status — CPS 15, positiv (22C3)  ](Observation-Fall2-PDL1-Status.md) | PD-L1 IHC bei TNBC: CPS 15 (≥10 → Pembrolizumab-Indikation per KEYNOTE-522) |
| [ Fall 2: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1  ](MedicationStatement-Fall2-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der neoadjuvanten Therapie |
| [ Fall 2: Pathologie — Invasiv-duktales Karzinom G3, triple-negativ  ](DiagnosticReport-Fall2-Pathologie-Befund.md) | Pathologischer Befund der Stanzbiopsie: invasiv-duktales Karzinom G3, triple-negativ, Ki-67 70% |
| [ Fall 2: Pathologische Diagnose/Conclusion  ](Observation-Fall2-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 2: Patientin Lena Hoffmann  ](Patient-Fall2-Patient-Lena-Hoffmann.md) | Synthetische Testpatientin — lokal fortgeschrittenes triple-negatives Mammakarzinom, palliativ |
| [ Fall 2: Patientin Lena Hoffmann (verstorben)  ](Patient-Fall2-Patient-Lena-Hoffmann-Verstorben.md) | Variante der Testpatientin Lena Hoffmann mit deceasedDateTime — Tod durch hepatische Metastasen bei triple-negativem Mammakarzinom. |
| [ Fall 2: Pembrolizumab 200 mg, Zyklus 1, Tag 1  ](MedicationStatement-Fall2-Medikation-Pembrolizumab.md) | Einzelgabe Pembrolizumab im Rahmen der neoadjuvanten Immuntherapie |
| [ Fall 2: Postoperative Komplikation — Serom, Clavien-Dindo I  ](Observation-Fall2-Komplikation-Serom.md) | Postoperatives Serom nach Mastektomie, Clavien-Dindo Grad I |
| [ Fall 2: Progression — hepatische Metastasen  ](Condition-Fall2-Diagnose-Progression.md) | Hepatische Metastasierung nach 18 Monaten, klinischer Status Rezidiv |
| [ Fall 2: Skelettszintigraphie — ossäre Metastase BWK 12  ](DiagnosticReport-Fall2-Bildgebung-Skelettszintigraphie.md) | Skelettszintigraphie mit Nachweis einer ossären Metastase BWK 12 |
| [ Fall 2: Sonographie bilateral  ](DiagnosticReport-Fall2-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund rechts und suspekten axillären Lymphknoten |
| [ Fall 2: Stanzbiopsie-Präparat rechts zentral  ](Specimen-Fall2-Pathologie-Praeparat.md) | Stanzbiopsie aus dem zentralen Drüsenkörper der rechten Brust |
| [ Fall 2: Studienteilnahme KEYNOTE-522  ](ResearchSubject-Fall2-Studienteilnahme.md) | Teilnahme an KEYNOTE-522, Interventionsarm (Pembrolizumab) |
| [ Fall 2: TNM-Klassifikation cT3 cN2a cM1  ](Observation-Fall2-TNM-Klassifikation.md) | TNM-Klassifikation cT3 cN2a cM1, UICC IV. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 2: Tod tumorbedingt  ](Observation-Fall2-Tod-Tumorbedingt.md) | Onko-Tod-Observation gemäß MII Onko-Modul: Patientin ist an Tumorerkrankung (Mammakarzinom mit Lebermetastasen) verstorben. Todesursache C78.7. |
| [ Fall 2: Todesursache — sekundäre Leberkarzinose  ](Condition-Fall2-Todesursache.md) | Todesursache gemäß MII Person-Modul: sekundäre bösartige Neubildung der Leber (ICD-10-GM C78.7) bei metastasiertem triple-negativen Mammakarzinom. |
| [ Fall 2: Triple-negatives Mammakarzinom rechts, cT3 cN2a cM1(OSS)  ](Condition-Fall2-Diagnose-Mammakarzinom.md) | Triple-negatives invasiv-duktales Mammakarzinom rechts, zentraler Drüsenkörper, G3, UICC IV |
| [ Fall 2: Tumorboard bei Progression  ](CarePlan-Fall2-Tumorboard-Progression.md) | Empfehlung: Palliativkonzept bei hepatischer Metastasierung |
| [ Fall 2: Verlaufskontrolle bei Progression  ](Observation-Fall2-Verlauf-Progression.md) | Progression mit neuen hepatischen Metastasen nach 18 Monaten adjuvanter Therapie. Aktive Nachsorge, kein Zweittumor. |
| [ Fall 2: Verlaufsmeldung bei Tod  ](Observation-Fall2-Verlauf-Tod.md) | Abschließende Verlaufsmeldung für Lena Hoffmann: Patientin verstorben an hepatischen Metastasen. Passive Nachsorge (Totenschein/Register). |
| [ Fall 2: Vitalstatus — verstorben  ](Observation-Fall2-Vitalstatus-Verstorben.md) | Vitalstatus-Observation gemäß MII Person-Modul: Patientin Lena Hoffmann ist am Tumorleiden verstorben. |
| [ Fall 3: Adjuvante Bestrahlung Thoraxwand 50 Gy  ](Procedure-Fall3-Strahlentherapie.md) | Adjuvante Bestrahlung der Thoraxwand rechts nach Mastektomie |
| [ Fall 3: Axilladissektion rechts Level I-II  ](Procedure-Fall3-Operation-Axilladissektion.md) | Axilladissektion als Subprozedur der Mastektomie |
| [ Fall 3: BI-RADS 4 rechts  ](Observation-Fall3-BiRADS-Rechts.md) | BI-RADS 4 Befund der rechten Brust |
| [ Fall 3: Endokrine Therapie Anastrozol 1 mg  ](MedicationStatement-Fall3-Begleitmedikation-Anastrozol.md) | Anastrozol 1 mg/d als adjuvante endokrine Therapie |
| [ Fall 3: Mammakarzinom rechts, cT2 pN1a cM0  ](Condition-Fall3-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST der rechten Brust, UICC IIA, HR+/HER2- |
| [ Fall 3: Mammographie bilateral  ](DiagnosticReport-Fall3-Bildgebung-Mammographie.md) | Mammographie bilateral mit suspektem Herdbefund rechts BI-RADS 4 |
| [ Fall 3: Mastektomie rechts + Axilladissektion  ](Procedure-Fall3-Operation-Mastektomie.md) | Mastektomie rechts mit Axilladissektion Level I-II, R0, pN1a(2/12) |
| [ Fall 3: Mastektomie-Präparat rechts  ](Specimen-Fall3-Pathologie-Praeparat-OP.md) | Mastektomie-Resektat rechte Brust mit Axilla-Lymphknoten |
| [ Fall 3: Pathologie OP-Präparat — pT2 pN1a(2/12)  ](DiagnosticReport-Fall3-Pathologie-Befund-OP.md) | Pathologischer Befund des Mastektomie-Präparats mit Axilladissektion |
| [ Fall 3: Pathologie — Invasives Karzinom NST, G2, ER+/PR+/HER2-  ](DiagnosticReport-Fall3-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G2, ER+ IRS 10, PR+ IRS 6, HER2- Score 0, Ki-67 12% |
| [ Fall 3: Pathologische Diagnose OP-Präparat  ](Observation-Fall3-Patho-Conclusion-OP.md) | Diagnostische Schlussfolgerung OP-Präparat |
| [ Fall 3: Pathologische Diagnose/Conclusion  ](Observation-Fall3-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 3: Patientin Sabine Weber  ](Patient-Fall3-Patient-Sabine-Weber.md) | Synthetische Testpatientin — HR+/HER2- Mammakarzinom, Stadium IIA, N1 |
| [ Fall 3: Stanzbiopsie-Präparat rechts  ](Specimen-Fall3-Pathologie-Praeparat-Stanze.md) | Stanzbiopsie aus der rechten Brust |
| [ Fall 3: TNM-Klassifikation cT2 pN1a cM0  ](Observation-Fall3-TNM-Klassifikation.md) | TNM-Klassifikation cT2 pN1a cM0, UICC IIA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 4: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost  ](Procedure-Fall4-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links nach BET |
| [ Fall 4: BET links + SLNB nach neoadjuvanter Therapie  ](Procedure-Fall4-Operation-BET.md) | Brusterhaltende Therapie links mit Sentinel-LK-Biopsie, ypT0 ypN0 (pCR), R0 |
| [ Fall 4: BI-RADS 5 links  ](Observation-Fall4-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust |
| [ Fall 4: Carboplatin AUC6, Zyklus 1, Tag 1  ](MedicationStatement-Fall4-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der neoadjuvanten TCHP |
| [ Fall 4: Docetaxel 75 mg/m2, Zyklus 1, Tag 1  ](MedicationStatement-Fall4-Medikation-Docetaxel.md) | Einzelgabe Docetaxel im Rahmen der neoadjuvanten TCHP |
| [ Fall 4: ECOG-Leistungszustand nach neoadjuvanter Therapie  ](Observation-Fall4-ECOG-PostTherapie.md) | ECOG 1 — leichte Einschränkung nach Chemotherapie |
| [ Fall 4: Gesamtbeurteilung nach neoadjuvanter Chemotherapie (D27)  ](Observation-Fall4-Verlauf-PostTherapie.md) | Gesamtbeurteilung Tumorstatus nach Abschluss der neoadjuvanten Systemtherapie: Teilremission (PR). Lokaler Tumorrückgang, LK und FM stabil. D27-Kontext (post-definitive Therapie). |
| [ Fall 4: HER2+ Mammakarzinom links, cT2 cN1 cM0  ](Condition-Fall4-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST links, HER2+, UICC IIB |
| [ Fall 4: Mammographie bilateral  ](DiagnosticReport-Fall4-Bildgebung-Mammographie.md) | Mammographie bilateral mit Herdbefund links BI-RADS 5 |
| [ Fall 4: Neoadjuvante TCHP  ](Procedure-Fall4-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie mit Docetaxel, Carboplatin, Trastuzumab, Pertuzumab |
| [ Fall 4: Pathologie — Invasives Karzinom NST, G3, HER2+  ](DiagnosticReport-Fall4-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G3, ER- PR- HER2+ (FISH amplifiziert), Ki-67 45% |
| [ Fall 4: Pathologische Diagnose/Conclusion  ](Observation-Fall4-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 4: Patientin Julia Fischer  ](Patient-Fall4-Patient-Julia-Fischer.md) | Synthetische Testpatientin — HER2+ Mammakarzinom, neoadjuvant TCHP, pCR |
| [ Fall 4: Pertuzumab, Zyklus 1, Tag 1  ](MedicationStatement-Fall4-Medikation-Pertuzumab.md) | Einzelgabe Pertuzumab im Rahmen der neoadjuvanten TCHP |
| [ Fall 4: Sentinel-Lymphknoten-Biopsie links  ](Procedure-Fall4-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [ Fall 4: Sonographie bilateral  ](DiagnosticReport-Fall4-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund links und suspekten axillären LK |
| [ Fall 4: Stanzbiopsie-Präparat links  ](Specimen-Fall4-Pathologie-Praeparat.md) | Stanzbiopsie aus der linken Brust |
| [ Fall 4: TNM-Klassifikation cT2 cN1 cM0  ](Observation-Fall4-TNM-Klassifikation.md) | TNM-Klassifikation cT2 cN1 cM0, UICC IIB. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 4: Trastuzumab, Zyklus 1, Tag 1  ](MedicationStatement-Fall4-Medikation-Trastuzumab.md) | Einzelgabe Trastuzumab im Rahmen der neoadjuvanten TCHP |
| [ Fall 4: Tumorboard — Neoadjuvante Therapie empfohlen  ](CarePlan-Fall4-Tumorboard.md) | Empfehlung: neoadjuvante TCHP, dann BET + SLNB, adjuvant Trastuzumab/Pertuzumab + RT |
| [ Fall 5: Adjuvante Ganzbrustbestrahlung 50 Gy + Boost 16 Gy  ](Procedure-Fall5-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung rechts nach BET |
| [ Fall 5: BET rechts + SLNB  ](Procedure-Fall5-Operation-BET.md) | Brusterhaltende Therapie rechts mit SLNB, ypT1a ypN0(sn)(0/3), R0 |
| [ Fall 5: BI-RADS 5 rechts  ](Observation-Fall5-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [ Fall 5: BRCA1 somatisch — Mutation nachgewiesen  ](Observation-Fall5-Somatische-Mutation-BRCA1.md) | BRCA1 somatische Mutation nachgewiesen im Tumorgewebe |
| [ Fall 5: Endokrine Therapie Letrozol 2,5 mg  ](MedicationStatement-Fall5-Begleitmedikation-Letrozol.md) | Letrozol 2,5 mg/d als adjuvante endokrine Therapie |
| [ Fall 5: HR+/HER2+ Mammakarzinom rechts, cT3 cN1 cM0  ](Condition-Fall5-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST rechts, HR+/HER2+, UICC IIIA |
| [ Fall 5: Komorbidität — Diabetes mellitus Typ 2  ](Condition-Fall5-Komorbiditaet-Diabetes.md) | Vorbestehender Diabetes mellitus Typ 2, diätetisch eingestellt |
| [ Fall 5: MRT Mamma  ](DiagnosticReport-Fall5-Bildgebung-MRT.md) | MRT der Brust zur Ausdehnungsbeurteilung bei cT3 |
| [ Fall 5: Mammographie bilateral  ](DiagnosticReport-Fall5-Bildgebung-Mammographie.md) | Mammographie bilateral mit großem Herdbefund rechts BI-RADS 5 |
| [ Fall 5: Nausea CTCAE Grad 1 unter Docetaxel  ](AdverseEvent-Fall5-Nebenwirkung-Nausea.md) | Nausea Grad 1 (mild) unter neoadjuvantem Docetaxel + Trastuzumab |
| [ Fall 5: Neoadjuvante EC → Docetaxel + Trastuzumab  ](Procedure-Fall5-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie: EC x4 gefolgt von Docetaxel + Trastuzumab x4 |
| [ Fall 5: Pathologie — Invasives Karzinom NST, G2, HR+/HER2+  ](DiagnosticReport-Fall5-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G2, ER+ IRS 8, PR+ IRS 4, HER2+ Score 3+, Ki-67 30% |
| [ Fall 5: Pathologische Diagnose/Conclusion  ](Observation-Fall5-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 5: Patientin Monika Braun  ](Patient-Fall5-Patient-Monika-Braun.md) | Synthetische Testpatientin — HR+/HER2+ Mammakarzinom, Stadium IIIA, neoadjuvant |
| [ Fall 5: Sentinel-Lymphknoten-Biopsie rechts  ](Procedure-Fall5-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [ Fall 5: Sonographie bilateral  ](DiagnosticReport-Fall5-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund rechts und suspekten axillären LK |
| [ Fall 5: Stanzbiopsie-Präparat rechts  ](Specimen-Fall5-Pathologie-Praeparat.md) | Stanzbiopsie aus der rechten Brust |
| [ Fall 5: TNM-Klassifikation cT3 cN1 cM0  ](Observation-Fall5-TNM-Klassifikation.md) | TNM-Klassifikation cT3 cN1 cM0, UICC IIIA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 5: Tumorboard — Neoadjuvante Therapie  ](CarePlan-Fall5-Tumorboard-Neoadjuvant.md) | Empfehlung: EC → Docetaxel + Trastuzumab neoadjuvant, dann OP, adjuvant Trastuzumab + RT + Letrozol |
| [ Fall 5: Tumorboard — Postoperativ  ](CarePlan-Fall5-Tumorboard-Postoperativ.md) | Postoperative Tumorboard-Empfehlung: Bestätigung adjuvante Therapie |
| [ Fall 6: Adjuvante Bestrahlung 50 Gy (kein Boost)  ](Procedure-Fall6-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung links nach BET bei DCIS |
| [ Fall 6: BET links  ](Procedure-Fall6-Operation-BET.md) | Brusterhaltende Therapie links bei DCIS, R0 knapp |
| [ Fall 6: BI-RADS 4 links  ](Observation-Fall6-BiRADS-Links.md) | BI-RADS 4 Befund links — Mikrokalzifikationen |
| [ Fall 6: DCIS links  ](Condition-Fall6-Diagnose-DCIS.md) | Duktales Carcinoma in situ (DCIS) links, G2, ER+ |
| [ Fall 6: Pathologie Vakuumbiopsie — DCIS G2, ER+  ](DiagnosticReport-Fall6-Pathologie-Befund.md) | Pathologischer Befund der Vakuumbiopsie: DCIS G2, ER+, kein invasiver Anteil |
| [ Fall 6: Pathologische Diagnose/Conclusion  ](Observation-Fall6-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 6: Patientin Petra Schneider  ](Patient-Fall6-Patient-Petra-Schneider.md) | Synthetische Testpatientin — DCIS, Screening-Detektion, Stadium 0 |
| [ Fall 6: Screening-Mammographie bilateral  ](DiagnosticReport-Fall6-Bildgebung-Mammographie.md) | Screening-Mammographie mit Mikrokalzifikationen links BI-RADS 4 |
| [ Fall 6: Vakuumbiopsie-Präparat links  ](Specimen-Fall6-Pathologie-Praeparat.md) | Stereotaktische Vakuumbiopsie aus der linken Brust |
| [ Fall 7: Adjuvante Bestrahlung 50 Gy + Boost 16 Gy  ](Procedure-Fall7-Strahlentherapie.md) | Adjuvante Ganzbrustbestrahlung rechts mit Boost auf Tumorbett |
| [ Fall 7: BET rechts + SLNB  ](Procedure-Fall7-Operation-BET.md) | Brusterhaltende Therapie rechts mit SLNB, ypT0 ypN0(sn)(0/2) = pCR, R0 |
| [ Fall 7: BI-RADS 5 rechts  ](Observation-Fall7-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [ Fall 7: Carboplatin, Zyklus 1, Tag 1  ](MedicationStatement-Fall7-Medikation-Carboplatin.md) | Einzelgabe Carboplatin im Rahmen der neoadjuvanten Therapie |
| [ Fall 7: Epirubicin 90 mg/m2, Zyklus 1 (EC), Tag 1  ](MedicationStatement-Fall7-Medikation-Epirubicin.md) | Einzelgabe Epirubicin im Rahmen der neoadjuvanten EC-Phase |
| [ Fall 7: Mammographie bilateral  ](DiagnosticReport-Fall7-Bildgebung-Mammographie.md) | Mammographie bilateral mit Herdbefund rechts BI-RADS 5 |
| [ Fall 7: Neoadjuvante Carboplatin/Paclitaxel → EC  ](Procedure-Fall7-Systemtherapie-Neoadjuvant.md) | Neoadjuvante Therapie: Carboplatin/Paclitaxel weekly x12, dann EC q3w x4 |
| [ Fall 7: PD-L1 Status — CPS 2, negativ (22C3)  ](Observation-Fall7-PDL1-Status.md) | PD-L1 IHC bei TNBC: CPS 2 (<10 → kein Pembrolizumab) |
| [ Fall 7: Paclitaxel 80 mg/m2, Zyklus 1, Tag 1  ](MedicationStatement-Fall7-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der neoadjuvanten Therapie |
| [ Fall 7: Pathologie — Invasives Karzinom NST, G3, TNBC  ](DiagnosticReport-Fall7-Pathologie-Befund.md) | Pathologischer Befund: invasives Karzinom NST, G3, ER- PR- HER2-, Ki-67 65% |
| [ Fall 7: Pathologische Diagnose/Conclusion  ](Observation-Fall7-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 7: Patientin Kathrin Mueller  ](Patient-Fall7-Patient-Kathrin-Mueller.md) | Synthetische Testpatientin — TNBC, neoadjuvant, pCR |
| [ Fall 7: Sentinel-Lymphknoten-Biopsie rechts  ](Procedure-Fall7-Operation-SLNB.md) | SLNB als Subprozedur der BET |
| [ Fall 7: Sonographie bilateral  ](DiagnosticReport-Fall7-Bildgebung-Sonographie.md) | Sonographie bilateral mit Herdbefund rechts, keine suspekten LK |
| [ Fall 7: Stanzbiopsie-Präparat rechts  ](Specimen-Fall7-Pathologie-Praeparat.md) | Stanzbiopsie aus der rechten Brust |
| [ Fall 7: TNBC rechts, cT2 cN0 cM0  ](Condition-Fall7-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST rechts, triple-negativ, UICC IIA |
| [ Fall 7: TNM-Klassifikation cT2 cN0 cM0  ](Observation-Fall7-TNM-Klassifikation.md) | TNM-Klassifikation cT2 cN0 cM0, UICC IIA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 7: Tumorboard — Neoadjuvante Therapie empfohlen  ](CarePlan-Fall7-Tumorboard.md) | Empfehlung: neoadjuvante Carboplatin/Paclitaxel → EC, dann BET + SLNB, adjuvante RT |
| [ Fall 8: Adjuvante Bestrahlung Thoraxwand rechts 50 Gy  ](Procedure-Fall8-Strahlentherapie.md) | Adjuvante Thoraxwandbestrahlung rechts nach Mastektomie |
| [ Fall 8: BI-RADS 5 rechts  ](Observation-Fall8-BiRADS-Rechts.md) | BI-RADS 5 Befund der rechten Brust |
| [ Fall 8: Endokrine Therapie Tamoxifen 20 mg  ](MedicationStatement-Fall8-Begleitmedikation-Tamoxifen.md) | Tamoxifen 20 mg/d — Standard bei männlichem Mammakarzinom (NICHT Aromataseinhibitor) |
| [ Fall 8: Mammakarzinom rechts, cT2 pN0(sn) cM0  ](Condition-Fall8-Diagnose-Mammakarzinom.md) | Invasives Mammakarzinom NST rechts, zentraler Drüsenkörper, männlich, UICC IIA |
| [ Fall 8: Mammographie rechts  ](DiagnosticReport-Fall8-Bildgebung-Mammographie.md) | Mammographie mit suspektem Herdbefund rechts BI-RADS 5 |
| [ Fall 8: Mastektomie rechts + SLNB  ](Procedure-Fall8-Operation-Mastektomie.md) | Mastektomie rechts (Standard bei männlichem Mammakarzinom) + Sentinel-LK-Biopsie, R0, pN0(sn)(0/3) |
| [ Fall 8: Pathologie — Invasives Karzinom NST, G2, HR+/HER2-  ](DiagnosticReport-Fall8-Pathologie-Befund.md) | Pathologischer Befund: Invasives Karzinom NST, G2, ER+ IRS 12, PR+ IRS 6, HER2- Score 1+, Ki-67 18% |
| [ Fall 8: Pathologische Diagnose/Conclusion  ](Observation-Fall8-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 8: Patient Klaus Hartmann  ](Patient-Fall8-Patient-Klaus-Hartmann.md) | Synthetischer Testpatient — männliches Mammakarzinom rechts, HR+/HER2-, UICC IIA |
| [ Fall 8: Sentinel-Lymphknoten-Biopsie rechts  ](Procedure-Fall8-Operation-SLNB.md) | SLNB als Subprozedur der Mastektomie |
| [ Fall 8: Sonographie rechts  ](DiagnosticReport-Fall8-Bildgebung-Sonographie.md) | Sonographie mit hypoechogenem Herdbefund rechts retromamillär |
| [ Fall 8: Stanzbiopsie-Präparat rechts retromamillär  ](Specimen-Fall8-Pathologie-Praeparat.md) | Stanzbiopsie aus dem retromamillären Bereich der rechten Brust |
| [ Fall 8: TNM-Klassifikation cT2 pN0 cM0  ](Observation-Fall8-TNM-Klassifikation.md) | TNM-Klassifikation cT2 pN0 cM0, UICC IIA. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 9: Adjuvante Bestrahlung 50 Gy + Boost + Lymphabfluss  ](Procedure-Fall9-Strahlentherapie.md) | Adjuvante Bestrahlung Restbrust links 50 Gy + Boost 10 Gy + Lymphabflusswege |
| [ Fall 9: Adjuvante Chemotherapie EC → Paclitaxel  ](Procedure-Fall9-Systemtherapie-Adjuvant.md) | Adjuvante Chemotherapie EC q3w x4 → Paclitaxel wöchentlich x12 |
| [ Fall 9: Axilladissektion links Level I-III  ](Procedure-Fall9-Operation-Axilladissektion.md) | Axilladissektion als Subprozedur der BET |
| [ Fall 9: BET links + Axilladissektion Level I-III  ](Procedure-Fall9-Operation-BET.md) | Brusterhaltende Therapie links + Axilladissektion Level I-III, R0, pN3a(12/18) |
| [ Fall 9: BI-RADS 5 links  ](Observation-Fall9-BiRADS-Links.md) | BI-RADS 5 Befund der linken Brust |
| [ Fall 9: ECOG-Leistungszustand 12 Monate postoperativ  ](Observation-Fall9-ECOG-12Monate.md) | ECOG 1 — leicht eingeschränkt (Residual-Lymphödem nach Axilladissektion) |
| [ Fall 9: Endokrine Therapie Tamoxifen 20 mg (initial, prämenopausal)  ](MedicationStatement-Fall9-Begleitmedikation-Tamoxifen.md) | Tamoxifen 20 mg/d, prämenopausal, nach 2 Jahren Umstellung auf AI + GnRH geplant |
| [ Fall 9: Epirubicin, Zyklus 1, Tag 1  ](MedicationStatement-Fall9-Medikation-Epirubicin.md) | Einzelgabe Epirubicin im Rahmen der adjuvanten EC-Therapie |
| [ Fall 9: Komorbidität — Adipositas  ](Condition-Fall9-Komorbiditaet-Adipositas.md) | Adipositas Grad I (BMI 32) |
| [ Fall 9: Komorbidität — COPD  ](Condition-Fall9-Komorbiditaet-COPD.md) | Chronisch obstruktive Lungenerkrankung GOLD II |
| [ Fall 9: Lobuläres Mammakarzinom links, cT2 pN3a cM0  ](Condition-Fall9-Diagnose-Mammakarzinom.md) | Invasives lobuläres Mammakarzinom links, G2, UICC IIIC, pN3a(12/18) |
| [ Fall 9: Mammographie bilateral  ](DiagnosticReport-Fall9-Bildgebung-Mammographie.md) | Mammographie bilateral mit Herdbefund links OAQ |
| [ Fall 9: Paclitaxel 80 mg/m2 wöchentlich, Woche 1  ](MedicationStatement-Fall9-Medikation-Paclitaxel.md) | Einzelgabe Paclitaxel im Rahmen der adjuvanten wöchentlichen Therapie |
| [ Fall 9: Pathologie — Invasives lobuläres Karzinom, G2, HR+/HER2-  ](DiagnosticReport-Fall9-Pathologie-Befund.md) | Pathologischer Befund: Invasives lobuläres Karzinom, G2, ER+ IRS 12, PR+ IRS 10, HER2-, Ki-67 20% |
| [ Fall 9: Pathologische Diagnose/Conclusion  ](Observation-Fall9-Patho-Conclusion.md) | Diagnostische Schlussfolgerung des Pathologen |
| [ Fall 9: Patientin Andrea Wolf  ](Patient-Fall9-Patient-Andrea-Wolf.md) | Synthetische Testpatientin — lobuläres Mammakarzinom links, UICC IIIC, LK-positiv, Komplikation |
| [ Fall 9: Postoperative Komplikation — Lymphödem Arm links, Clavien-Dindo II  ](Observation-Fall9-Komplikation-Lymphoedem.md) | Lymphödem Arm links nach Axilladissektion, Clavien-Dindo Grad II |
| [ Fall 9: Stanzbiopsie-Präparat links OAQ  ](Specimen-Fall9-Pathologie-Praeparat.md) | Stanzbiopsie aus dem oberen äußeren Quadranten der linken Brust |
| [ Fall 9: TNM-Klassifikation cT2 pN3a cM0  ](Observation-Fall9-TNM-Klassifikation.md) | TNM-Klassifikation cT2 pN3a cM0, UICC IIIC. Jede Kategorie trägt den UICC-Code und das SNOMED-CT-Äquivalent. |
| [ Fall 9: Tumorboard-Empfehlung  ](CarePlan-Fall9-Tumorboard.md) | Empfehlung: adjuvante Chemotherapie EC→Paclitaxel, BET + Axilladissektion, RT, endokrine Therapie |
| [ Fall 9: Verlaufskontrolle 12 Monate postoperativ  ](Observation-Fall9-Verlauf-12Monate.md) | Nachsorge nach BET + Axilladissektion + Chemo + RT, unter Tamoxifen-Therapie. Aktive Nachsorge, kein Zweittumor. |

