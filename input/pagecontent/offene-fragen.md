# Offene Fragen

Diese Seite dokumentiert offene Design- und Modellierungsfragen, zu denen im Rahmen der Ballotierung Feedback erbeten wird.

### Wie kann ich Feedback geben?

Feedback zu den offenen Fragen kann über [GitHub Issues](https://github.com/BIH-CEI/SenologieOnFHIR/issues) eingereicht werden. Bitte referenzieren Sie die jeweilige Fragennummer.

---

## OF-1: Encounter-Modell und EpisodeOfCare

{:.stu-note}
Soll das Senologie-Modul ein eigenes Encounter-Profil definieren oder auf ISiK (ISiKKontaktGesundheitseinrichtung) verweisen?

Die Behandlung am Brustzentrum umfasst typischerweise **mehrere Kontakte** unterschiedlicher Art:

- Ambulante Erstvorstellung (Brustambulanz)
- Bildgebungstermine
- Biopsie
- Tumorkonferenz
- Stationärer Aufenthalt (Operation)
- Tagesklinik (Chemotherapie)
- Ambulante Bestrahlung
- Nachsorgetermine

Diese Kontakte haben unterschiedliche `Encounter.class` (ambulant, stationär, teilstationär) und könnten durch eine **EpisodeOfCare** ("Behandlungsfall Mammakarzinom") als übergreifende Klammer verbunden werden.

**Offene Teilfragen:**
- Braucht der IG ein EpisodeOfCare-Profil oder reicht die Diagnose (Condition) als implizite Klammer?
- Genügt ISiKKontaktGesundheitseinrichtung als Encounter-Profil, ergänzt um eine Extension für Erst-/Verlaufsvorstellung?
- ISiK definiert kein EpisodeOfCare-Profil — ist das eine Lücke oder bewusste Entscheidung?

---

## OF-2: Ambulanztyp und Abrechnungskontext

{:.stu-note}
Welcher Abrechnungskontext gilt für Brustambulanzen und wie beeinflusst das die Encounter-Modellierung?

Brustzentren betreiben häufig eine Brustambulanz, die je nach Einrichtung unterschiedlich organisiert sein kann:

- **Hochschulambulanz** (§117 SGB V)
- **Ermächtigungsambulanz**
- **Ambulante Spezialfachärztliche Versorgung (ASV)**
- **Institutambulanz**

Jeder Typ hat eigene Abrechnungsregeln und beeinflusst, welcher `Encounter.class` und welche Account-Strukturen verwendet werden. Diese Frage muss mit den beteiligten Brustzentren geklärt werden.

---

## OF-3: Versorgungspfade (Pathways)

{:.stu-note}
Soll der IG verschiedene Einstiegspunkte und Versorgungspfade explizit modellieren?

Es gibt keinen einheitlichen Versorgungspfad. Typische Einstiegspunkte sind:

1. **Screening-Auffälligkeit** — externe Mammographie mit BI-RADS 4/5, Überweisung
2. **Symptom-basiert** — Selbsttastbefund, direkte Vorstellung
3. **Zufallsbefund** — Auffälligkeit in anderer Bildgebung
4. **Rezidiv** — bekannte Patientin, neue Behandlungsepisode
5. **Prophylaktisch** — BRCA-Mutation, Risikokonsultation
6. **Neue/Zugezogene/Internationale Patientinnen** — Vordiagnosen und Befunde aus anderem Gesundheitssystem, ggf. fremdsprachige Dokumentation, ungeklärter Versicherungsstatus

Patientinnen können bereits mit externer Diagnostik (Mammographie, Biopsie, Pathologiebefund) ans Brustzentrum kommen. Der IG muss flexibel genug sein, um Daten aus verschiedenen Quellen und in unterschiedlicher Reihenfolge abzubilden.

Besondere Herausforderungen bei internationalen Patientinnen:
- Externe Kodierung (ICD-10-WHO statt ICD-10-GM, kein oBDS-Staging)
- Sprachbarriere bei Informed Consent, PRO-Fragebögen (z.B. EQ-5D-5L)
- Fehlende Versicherungszuordnung (Encounter.class, Account)

**Offene Teilfragen:**
- Sollen die Pathways als narrative Beschreibung oder als formale ActivityDefinition/PlanDefinition modelliert werden?
- Wie werden externe Vorbefunde abgebildet — als eigene Ressourcen mit externer Provenance?
- Wie wird mit Kodierungen aus anderen Gesundheitssystemen umgegangen (Mapping, manuelle Nachkodierung)?

---

## OF-4: Bildgebung Sonstige

{:.stu-note}
Soll für nicht-mammaspezifische Bildgebung ein eigenes Profil erstellt oder das bestehende Bildgebungs-Profil erweitert werden?

Das aktuelle Bildgebungs-Profil (Senologie_Bildgebung_Befund / _Observation) ist auf **Mamma-Bildgebung** spezialisiert (Mammographie, Sonographie, MRT, Tomosynthese) mit BI-RADS und ACR-Klassifikation.

Das logische Modell definiert zusätzlich `BildgebungSonstige` für weitere Modalitäten (z.B. Skelettszintigraphie, CT-Thorax/Abdomen, PET-CT zum Staging).

**Optionen:**
- **A)** Eigenes Profil `Senologie_Bildgebung_Sonstige` mit generischer Modalitätskodierung
- **B)** Bestehendes Profil erweitern und BI-RADS/ACR optional machen
- **C)** Auf MII Bildgebungs-Modul verweisen (generisch, nicht senologiespezifisch)

---

## OF-5: EQ-5D-5L und PRO-Modul

{:.stu-note}
Soll das Senologie-Modul das MII PRO-Modul als Dependency aufnehmen und dessen EQ-5D-5L-Profil referenzieren?

Das MII PRO-Modul (Patient-Reported Outcomes, `de.medizininformatikinitiative.kerndatensatz.pros`) definiert bereits ein EQ-5D-5L-Profil. Das Senologie-Modul könnte:

- **A)** PRO als Dependency aufnehmen und das dortige Profil direkt nutzen
- **B)** Ein eigenes, vereinfachtes Observation-Profil für den senologischen Kontext definieren
- **C)** EQ-5D-5L aus dem Scope des Senologie-Moduls ausschließen und auf PRO verweisen

**Empfehlung:** Option A — Dependency aufnehmen, kein eigenes Profil.

---

## OF-6: Medikationsdokumentation — Profilarchitektur und Abgrenzung

{:.stu-note}
Wie sollen antineoplastische Medikation und Begleitmedikation profiliert werden, und von welchen Basisprofilen soll geerbt werden?

### Fachliche Abgrenzung

Die korrekte Unterscheidung ist nicht "Systemtherapie vs. Begleitmedikation", sondern:

- **Antineoplastische Medikation** — alles, was gegen den Tumor gerichtet ist: Chemotherapie, endokrine Therapie (Tamoxifen, Aromataseinhibitoren), zielgerichtete Therapie (Trastuzumab), Immuntherapie, antiresorptive Therapie. Diese Medikation ist **oBDS-meldepflichtig**, unabhängig davon, ob sie über Monate oder Jahre verabreicht wird.
- **Sonstige Medikation** — Vorerkrankungen (Antihypertensiva, Schilddrüsenhormone), supportive Therapie (Antiemetika, G-CSF) und sonstige Dauermedikation. Nicht meldepflichtig.

### Zweck der Begleitmedikation im senologischen Kontext

Die Dokumentation der Begleitmedikation dient **nicht** dem Medikationsmanagement (kein Anschluss an AMTS, kein Dispensing, keine Verordnung). Sie dient ausschließlich der:

- **Therapieplanung** — Wechselwirkungen mit geplanter Chemotherapie erkennen
- **Tumorkonferenz** — relevante Vormedikation als Entscheidungsgrundlage
- **Narkoseplanung** — anästhesierelevante Medikation vor OP

Es handelt sich um einen **Snapshot** der aktuellen Medikation zum Zeitpunkt der Anamnese, nicht um einen vollständigen Medikationsplan. Dies stellt die Frage, ob ein eigenes FHIR-Profil überhaupt nötig ist oder ob ein einfaches Formularfeld ausreicht.

### Profil vs. Formular

Die konkreten **Medikamentenlisten** (ValueSets) werden durch die Formulare gesteuert, nicht durch die Profile. Ein OP-Dokumentationsformular bietet andere Medikamente an als ein Systemtherapie-Formular. Die Profile definieren nur die Struktur und das Binding-Level (extensible).

### Vererbungsfrage

Für antineoplastische Medikation erbt das aktuelle Profil von `MII_PR_Onko_Systemische_Therapie_Medikation` — das stellt oBDS-Konformität sicher.

Für sonstige Medikation ist die Vererbungskette unklar:

- **Option A)** Base FHIR MedicationStatement
- **Option B)** DE Basisprofil Medikation
- **Option C)** ISiK MedicationStatement
- **Option D)** Kein eigenes Profil — Begleitmedikation liegt außerhalb des Scope dieses Moduls

Die Wahl beeinflusst, welche Pflichtfelder und Terminologiebindungen gelten und wie gut die Daten in bestehende KIS-Strukturen integrierbar sind.

**Offene Teilfragen:**
- Soll das aktuelle Profil `Systemtherapie_Medikation` in `Antineoplastische_Medikation` umbenannt werden, um die fachliche Semantik korrekt abzubilden?
- Gehört supportive Therapie (Antiemetika, G-CSF) zur antineoplastischen oder sonstigen Medikation?
- Von welchem Basisprofil soll die sonstige Medikation erben (Base FHIR, DE Basisprofil, ISiK)?
- Oder gehört die sonstige Medikation gar nicht in den Scope dieses Moduls?

---

## OF-7: ISiK-Kompatibilität

{:.stu-note}
Wie tief soll die ISiK-Integration gehen?

Das Modul listet ISiK 5.0 als Dependency. Aktuell wird ISiK jedoch nur als Kompatibilitätsanforderung erwähnt, ohne konkrete Profilierung.

**Offene Teilfragen:**
- Sollen die Senologie-Profile explizit von ISiK-Profilen erben, wo möglich?
- Soll der IG ISiK-Conformance-Anforderungen (CapabilityStatement) definieren?
- Wie verhält sich das Modul zu ISiK-Modulen wie Terminplanung (Appointment) und Dokumentenaustausch?

---

## OF-8: Formularbasierte strukturierte Erhebung

{:.stu-note}
Welche Vorteile und Probleme ergeben sich aus dem Formular-First-Ansatz (SDC Questionnaires) für die klinische Datenerfassung?

Das Senologie-Modul setzt auf SDC-Questionnaires als primäres Erfassungsinstrument. Dieser Ansatz hat Konsequenzen, die bei der Ballotierung berücksichtigt werden sollten.

**Vorteile:**

- **Klinische Akzeptanz** — Formulare entsprechen dem gewohnten Dokumentationsworkflow, keine FHIR-Kenntnisse nötig
- **Datenqualität** — Pflichtfelder, Validierung, kontextabhängige Logik (enableWhen) direkt im Formular
- **Konsistenz** — Definition-based Extraction stellt sicher, dass Formulardaten deterministisch in FHIR-Ressourcen überführt werden
- **Vorbelegung** — bestehende Patientendaten werden über initialExpression in neue Formulare übernommen
- **Versionierung** — Formularänderungen sind unabhängig von Profiländerungen möglich

**Probleme und Risiken:**

- **Doppelte Modellierung** — Questionnaire und Profile müssen synchron gehalten werden; Änderungen an Profilen erfordern Anpassungen der Formulare und umgekehrt
- **Extraction-Komplexität** — Definition-based Extraction hat Grenzen bei komplexen Ressourcenstrukturen (z.B. verschachtelte Referenzen, Subprozeduren mit partOf-Beziehungen)
- **Tooling-Abhängigkeit** — nicht alle FHIR-Server und Clients unterstützen SDC-Extraction vollständig; der Ansatz setzt einen SDC-fähigen FormManager/FormFiller voraus
- **Vendor Lock-in** — aktuell werden die Formulare in dotbase gepflegt; die SDC-Questionnaires sind der interoperable Vertrag, aber die Rendering-Qualität variiert zwischen Clients
- **Datenimport** — strukturierte Daten aus Fremdsystemen (z.B. Pathologiebefunde aus dem LIS, Bildgebung aus dem PACS/RIS) umgehen das Formular und müssen direkt als FHIR-Ressourcen integriert werden
- **Retrospektive Daten** — historische Daten können nicht nachträglich über Formulare erfasst werden, sondern müssen als ETL-Prozess direkt in die Zielprofile transformiert werden

**Offene Teilfragen:**
- Soll der IG die Questionnaires normativ spezifizieren oder nur als Beispiele mitliefern?
- Wie wird sichergestellt, dass Daten, die nicht über Formulare erfasst werden (Import, ETL), dieselbe Qualität haben?
- Welcher Reifegrad der SDC-Unterstützung wird von implementierenden Systemen erwartet?

---

## OF-9: Genexpressionstests — Kodierung als DeviceDefinition?

{:.stu-note}
Sollen Genexpressionstests (Oncotype DX, MammaPrint, Prosigna, EndoPredict) als DeviceDefinition modelliert werden statt als lokales CodeSystem?

Diese Tests sind **kommerziell regulierte IVD-Medizinprodukte** mit Hersteller, Modellbezeichnung und ggf. UDI-DI. In FHIR könnte die Modellierung über DeviceDefinition erfolgen:

- `DeviceDefinition` als Katalog-Eintrag (Hersteller, Modell, IVD-Klassifikation)
- `Observation.device` referenziert die DeviceDefinition
- `Observation.value` enthält den numerischen Score
- `RiskAssessment.basis` referenziert die Observation

Aktuell werden die Tests über ein lokales CodeSystem (`CS_Senologie_Genexpressionstest`) kodiert und als `Observation.method` bzw. `RiskAssessment.method` referenziert.

**Argumente für DeviceDefinition:**
- Fachlich korrekt — IVD-Tests sind Medizinprodukte
- Hersteller- und Produktinformationen strukturiert abbildbar
- Zukunftssicher für UDI-Integration und Implantateregister-ähnliche Meldepflichten

**Argumente für den Status quo (CodeSystem):**
- DeviceDefinition ist in R4 maturity level 0
- Kaum Implementierungserfahrung in der Community
- Der HL7 IVD IG ist noch nicht ausgereift
- Für den klinischen Use Case (Score + Risikoklasse) reicht ein Code

---

## OF-10: Arzneimittel-Terminologie und ASK-Integration

{:.stu-note}
Wird die ConceptMap SNOMED CT → ASK (Arzneistoffkatalog) benötigt, und wie soll die Medikamenten-Integration technisch erfolgen?

Das Modul enthält ConceptMaps für SNOMED CT → ATC und SNOMED CT → ASK. Die ASK-Integration wurde als Proof of Concept erstellt, es ist jedoch unklar, ob sie in der Praxis benötigt wird.

**Offene Teilfragen:**
- Wird ASK als Zielterminologie für die Medikamentendokumentation benötigt, oder reicht ATC?
- Wie erfolgt die konkrete Anbindung an Arzneimitteldatenbanken (AMTS, KIS-Hausliste)?
- Sollen die ConceptMaps normativ oder informativ sein?

---

## OF-11: PRO-CTCAE und CTCAE — Abgrenzung und Mapping

{:.stu-note}
Wie verhält sich die patientenberichtete Nebenwirkungserfassung (PRO-CTCAE) zur ärztlichen CTCAE-Dokumentation?

Das Brustzentrum erhebt Nebenwirkungen auf zwei Wegen:

- **CTCAE (ärztlich)**: Grad 0–5 pro Nebenwirkung, dokumentiert in der Systemtherapie-Dokumentation. Meldepflichtig an das Krebsregister (oBDS: bei Grad ≥3 einzeln, sonst nur Maximalgrad).
- **PRO-CTCAE (Patient-reported)**: Schwere/Häufigkeit/Beeinträchtigung (jeweils 0–4) pro Symptom, erhoben per Fragebogen (z.B. bei fortgeschrittener Erkrankung in dotbase).

Es gibt **kein offizielles Mapping** PRO-CTCAE → CTCAE Grad. Die NCI definiert PRO-CTCAE als Ergänzung, nicht als Ersatz der ärztlichen Dokumentation. Die Frage, ob und wie PRO-CTCAE-Daten in die CTCAE-basierte Meldung einfließen können, ist eine offene Forschungsfrage.

**Für diesen IG:**
- Die ärztliche CTCAE-Dokumentation wird als Senologie-Profil (Observation) abgebildet → oBDS-meldbar
- PRO-CTCAE wird über das MII PRO-Modul abgebildet → nicht direkt meldbar
- Ein Mapping PRO-CTCAE → CTCAE liegt außerhalb des Scope dieses IGs
