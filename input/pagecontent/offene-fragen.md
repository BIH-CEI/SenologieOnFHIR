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

## OF-6: Begleitmedikation — Abgrenzung zur Systemtherapie

{:.stu-note}
Wie wird die Grenze zwischen Begleitmedikation und Systemtherapie-Medikation gezogen?

Das Senologie-Modul unterscheidet:
- **Systemtherapie-Medikation** (Senologie_Systemtherapie_Medikation) — Krebstherapeutika mit Zyklus-Tracking
- **Begleitmedikation** (Senologie_Begleitmedikation) — alle anderen Medikamente

**Offene Teilfragen:**
- Gehört supportive Therapie (Antiemetika, G-CSF, Bisphosphonate) zur Systemtherapie oder Begleitmedikation?
- Wie wird endokrine Therapie (Tamoxifen, Aromataseinhibitoren) eingeordnet, die oft über Jahre als "Dauermedikation" läuft?
- Soll die Abgrenzung über das Profil (verschiedene MedicationStatement-Profile) oder über eine Kategorie-Kodierung (MedicationStatement.category) erfolgen?

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
