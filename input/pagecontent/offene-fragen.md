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

## OF-3: Medikationsdokumentation — Profilarchitektur und Abgrenzung

{:.stu-note}
Wie sollen antineoplastische Medikation und Begleitmedikation profiliert werden, und von welchen Basisprofilen soll geerbt werden?

### Fachliche Abgrenzung

Die korrekte Unterscheidung ist nicht "Systemtherapie vs. Begleitmedikation", sondern:

- **Antineoplastische Medikation** — alles, was gegen den Tumor gerichtet ist: Chemotherapie, endokrine Therapie (Tamoxifen, Aromataseinhibitoren), zielgerichtete Therapie (Trastuzumab), Immuntherapie, antiresorptive Therapie. Diese Medikation ist **oBDS-meldepflichtig**, unabhängig davon, ob sie über Monate oder Jahre verabreicht wird.
- **Sonstige Medikation** — Vorerkrankungen (Antihypertensiva, Schilddrüsenhormone), supportive Therapie (Antiemetika, G-CSF) und sonstige Dauermedikation. Nicht meldepflichtig.

### Vererbungsfrage

Für antineoplastische Medikation erbt das aktuelle Profil von `MII_PR_Onko_Systemische_Therapie_Medikation` — das stellt oBDS-Konformität sicher.

Für sonstige Medikation ist die Vererbungskette unklar:

- **Option A)** Base FHIR MedicationStatement
- **Option B)** DE Basisprofil Medikation
- **Option C)** ISiK MedicationStatement
- **Option D)** Kein eigenes Profil — Begleitmedikation liegt außerhalb des Scope dieses Moduls

**Offene Teilfragen:**
- Soll das aktuelle Profil `Systemtherapie_Medikation` in `Antineoplastische_Medikation` umbenannt werden?
- Gehört supportive Therapie (Antiemetika, G-CSF) zur antineoplastischen oder sonstigen Medikation?
- Von welchem Basisprofil soll die sonstige Medikation erben?

---

## OF-4: Genexpressionstests — Kodierung als DeviceDefinition?

{:.stu-note}
Sollen Genexpressionstests (Oncotype DX, MammaPrint, Prosigna, EndoPredict) als DeviceDefinition modelliert werden statt als lokales CodeSystem?

Diese Tests sind **kommerziell regulierte IVD-Medizinprodukte** mit Hersteller, Modellbezeichnung und ggf. UDI-DI. Aktuell werden die Tests über ein lokales CodeSystem kodiert.

**Argumente für DeviceDefinition:**
- Fachlich korrekt — IVD-Tests sind Medizinprodukte
- Hersteller- und Produktinformationen strukturiert abbildbar

**Argumente für den Status quo (CodeSystem):**
- DeviceDefinition ist in R4 maturity level 0
- Für den klinischen Use Case (Score + Risikoklasse) reicht ein Code

---

## OF-5: Arzneimittel-Terminologie und ASK-Integration

{:.stu-note}
Wird die ConceptMap SNOMED CT → ASK (Arzneistoffkatalog) benötigt?

Das Modul enthält ConceptMaps für SNOMED CT → ATC und SNOMED CT → ASK. Die ASK-Integration wurde als Proof of Concept erstellt.

**Offene Teilfragen:**
- Wird ASK als Zielterminologie benötigt, oder reicht ATC?
- Sollen die ConceptMaps normativ oder informativ sein?

---

## OF-6: PRO-CTCAE und CTCAE — Abgrenzung

{:.stu-note}
Wie verhält sich die patientenberichtete Nebenwirkungserfassung (PRO-CTCAE) zur ärztlichen CTCAE-Dokumentation?

Es gibt **kein offizielles Mapping** PRO-CTCAE → CTCAE Grad. Die ärztliche CTCAE-Dokumentation wird als Senologie-Profil abgebildet (oBDS-meldbar), PRO-CTCAE über das MII PRO-Modul. Ein Mapping liegt außerhalb des Scope dieses IGs.

---

## OF-7: Frühere Tumorerkrankungen — Scope und Profilwahl

{:.stu-note}
Sollen frühere Tumorerkrankungen im Senologie-Scope explizit abgebildet werden?

Anamnestisch erfasste Vorerkrankungen stammen üblicherweise aus der allgemeinen Patientenhistorie (KIS) und nicht aus der senologiespezifischen Dokumentation.

**Offene Teilfragen:**
- Soll der IG das MII Onko Profil `mii-pr-onko-fruehere-tumorerkrankung` referenzieren oder liegt das außerhalb des Scope?
- Erfassung über Formularfeld in der Erstanamnese oder nur als ETL-Übernahme aus dem KIS?

---

## OF-8: Neoadjuvante Therapie — strukturierte ycTNM und ypTNM

{:.stu-note}
Wie wird im neoadjuvanten Setting die Verlaufs-TNM-Klassifikation strukturiert erfasst?

Bei neoadjuvanter Systemtherapie ist die TNM-Klassifikation mit `y`-Symbol meldepflichtig:

- **ycTNM**: klinisches Staging NACH neoadjuvanter Therapie, VOR Operation
- **ypTNM**: pathologisches Staging NACH Operation (z.B. ypT0 ypN0 bei pCR)

**Offene Teilfragen:**
- Sollen die Testdaten um strukturierte cTNM- und ypTNM-Observations ergänzt werden?
- Wie wird die Reihenfolge (cTNM → ycTNM → ypTNM) zeitlich abgebildet, wenn eine Condition mehrere Stagings durchläuft?

---

## OF-9: Strukturierung der Strahlentherapie-Dokumentation

{:.stu-note}
Gibt es Vorarbeiten zur strukturierten Abbildung der Strahlentherapie im deutschen Kontext?

Die aktuelle Strahlentherapie-Dokumentation im Senologie-IG beschränkt sich auf ein einfaches Procedure-Profil mit Gesamtdosis, Einzeldosis, Fraktionen und Zielvolumen. Die Strahlentherapie wird typischerweise extern durchgeführt und die Daten liegen am Brustzentrum nicht primär strukturiert vor.

Für eine tiefere Strukturierung könnte der [HL7 CodeX Radiation Therapy IG](https://build.fhir.org/ig/HL7/codex-radiation-therapy/branches/master/en/overview.html) als Orientierung dienen. Dieser US-amerikanische IG bildet Bestrahlungspläne, Phasen, Fraktionierungsschemata und Dosisverteilungen detailliert ab.

**Offene Teilfragen:**
- Gibt es deutsche Vorarbeiten zur FHIR-basierten Strahlentherapie-Dokumentation (z.B. im MII-Kontext)?
- Welcher Detailgrad ist für die Senologie-Meldungen erforderlich vs. was ist "nice to have"?
- Kann der CodeX RT IG als internationale Referenz adaptiert werden oder sind die Anforderungen zu unterschiedlich?
