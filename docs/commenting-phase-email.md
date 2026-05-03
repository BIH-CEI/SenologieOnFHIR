# Einladung zur Kommentierungsphase Kerndatensatz Senologie

## Betreff

Einladung zur Kommentierungsphase: Kerndatensatz Senologie (FHIR Implementation Guide v0.9.0) — 4. bis 31. Mai 2026

---

## E-Mail-Text

Sehr geehrte Damen und Herren,
liebe Kolleginnen und Kollegen,

in der Versorgung von Patientinnen mit Mammakarzinom entstehen an vielen Stellen Daten — im Brustzentrum, in der Pathologie, bei Bildgebung und Systemtherapie, im Krebsregister, im Qualitätsbericht, im Implantatregister, in der Studienakte. In der Praxis werden dieselben Informationen dabei mehrfach erfasst: in unterschiedlichen Systemen, in unterschiedlichen Formaten, mit unterschiedlichen Terminologien. Das kostet Zeit in der Versorgung und erschwert die Sekundärnutzung dieser Daten.

Der **Kerndatensatz Senologie** adressiert dieses Problem. Ziel ist eine einheitliche, interoperable Grundlage für die Dokumentation der Brustkrebsversorgung, aus der die verschiedenen Meldungen und Auswertungen abgeleitet werden können — ohne parallele Erfassungen.

Die Deutsche Gesellschaft für Senologie (DGS) und das Berlin Institute of Health at Charité (BIH) laden Sie herzlich zur öffentlichen Kommentierung der Version 0.9.0 ein.

### Was der Kerndatensatz leistet

Der Kerndatensatz wird erstmalig in der deutschen Spezifikationslandschaft eine tiefe inhaltliche Ausspezifikation eines spezialisierten klinischen Use Cases vornehmen und zu aktuellen Spezifikationen auf nationaler und europäischer Ebene in Beziehung setzen. Die Kommentierungsversion 0.9.0 umfasst:

1. **Semantische Annotation in SNOMED CT**, ergänzt um LOINC, ICD-10-GM, ICD-O-3 und OPS. Wo internationale Terminologien Lücken aufweisen, werden Vorschläge für Einreichungen an das BfArM dokumentiert.

2. **Kuratierte Wertelisten** für die klinische Praxis (häufig verwendete antineoplastische Wirkstoffe, Diagnosen, operative Verfahren, Befundkategorien).

3. **Einheitliches Datenmodell auf FHIR-Basis** — abgeleitet von und kompatibel zu den Spezifikationen der Medizininformatik-Initiative (MII), ISiK und mit Blick auf den europäischen Gesundheitsdatenraum (EHDS). Die inhaltliche Ausrichtung folgt der S3-Leitlinie Mammakarzinom (AWMF 032-045OL).

4. **Dokumentationsunterstützung durch SDC-Fragebögen**, die direkt die Datenelemente des FHIR-Datenmodells erzeugen — eine Erfassung, konsistente Weiterverwendung.

5. **Unterstützung der etablierten Meldewege.** Der Kerndatensatz bildet die gemeinsame Datenbasis, aus der die Meldedatensätze für die relevanten Verfahren abgeleitet werden können:
   - **oBDS / Krebsregistermeldung** (Schema v3.0.5)
   - **Implantateregister** (IRegG V4.1.1, Brustimplantate)
   - **IQTIG-Qualitätssicherung** ([QS-Verfahren 18.1 Mammachirurgie](https://iqtig.org/downloads/erfassung/2024/v05/181/Ausfuellhinweise_18_1.html))
   - **DKG-Zertifizierung Brustzentren** ([OncoBox Brust](https://xml-oncobox.de/de/Zentren/BrustZentren), OnkoZert)

6. **Werkzeuge für die Ausleitung** — FHIR StructureMaps, ConceptMaps und Hinweise zur lokalen ETL-Integration (z.B. über Matchbox). Dort, wo die Meldesysteme noch XML-basiert sind, liefert der Kerndatensatz zugleich die Vorarbeit für eine mittelfristige Umstellung auf FHIR.

7. **Auswertung über CQL und SQL on FHIR.** Die strukturierte Datenbasis erlaubt die unmittelbare Berechnung der S3- und DKG-Qualitätsindikatoren sowie tabellarische Analysen für Versorgungsforschung.

### Einordnung

Der Kerndatensatz hat **keinen normativen Charakter**. Er ist ein gemeinsames Angebot der beteiligten Fachgesellschaften und Entwicklungspartner — in enger Zusammenarbeit mit der deutschen Interoperabilitätscommunity aus Industrie, Forschung und den datenannehmenden Stellen (Krebsregister, IQTIG, Implantateregister, DKG). Der Datensatz soll inhaltlich von der DGS kontinuierlich weiterentwickelt und technisch mit dem wachsenden FHIR-Ökosystem in Versorgung, Forschung und europäischem Gesundheitsdatenraum (EHDS) aktuell gehalten werden.

### Was wir uns von Ihrer Rückmeldung erhoffen

Der Kerndatensatz kann nur funktionieren, wenn er aus der klinischen Realität kommt und dorthin zurückfließt. Wir bitten Sie um Ihre Einschätzung zu:

- **Klinische Abdeckung** — Bildet der Datensatz Ihre Versorgung ab? Fehlen Datenpunkte, die in Ihrem Brustzentrum routinemäßig erhoben werden?
- **Terminologie** — Sind die Wertelisten in Ihrem Versorgungskontext tragfähig? Welche Konzepte sollten dem BfArM vorgeschlagen werden?
- **Technische Umsetzung** — Passt die Profilierung zu Ihrer bestehenden Infrastruktur (ISiK, MII)?
- **Meldewege** — Sind die vorgesehenen Ausleitungen (oBDS, IRegG, IQTIG, DKG-Zertifizierung) für Ihre Arbeitsprozesse anschlussfähig?
- **Offene Fragen** — Eine Reihe von Grundsatzentscheidungen haben wir bewusst offen gelassen und als „Offene Fragen" dokumentiert. Gerade dazu freuen wir uns über Ihre Sicht.

### Zugang

Implementation Guide: **https://bih-cei.github.io/SenologieOnFHIR/**
Quellen und Feedback: **https://github.com/BIH-CEI/SenologieOnFHIR**

### Wie Sie Feedback geben können

Wir bitten um strukturierte Rückmeldung über **GitHub Issues**:
https://github.com/BIH-CEI/SenologieOnFHIR/issues

Bei Kommentaren zu einer offenen Frage vermerken Sie bitte die entsprechende Kennung (z.B. „OF-3"). Alternativ nehmen wir Rückmeldungen auch per E-Mail entgegen; wir überführen diese in das öffentliche Tracking.

### Frist und Begleittermine

Die Kommentierungsphase läuft vom **4. Mai bis 31. Mai 2026**. Während dieser Zeit finden zwei offene Online-Begleittermine statt, zu denen gesondert eingeladen wird. Im Anschluss werden die Rückmeldungen in einem Review-Workshop konsolidiert und in die nächste Version überführt.

### Kontakt

Für inhaltliche Rückfragen (klinisch, leitlinienbezogen):
**Dr. med. Therese Pross** (therese.pross@charite.de) — Charité Brustzentrum / Deutsche Gesellschaft für Senologie (DGS)

Für technische Rückfragen (FHIR-Profile, Terminologie, StructureMaps):
**Thomas Debertshäuser** (thomas.debertshaeuser@charite.de) — Berlin Institute of Health at Charité (BIH), Center for Digital Health

Wir danken Ihnen herzlich im Voraus für Ihre Zeit und Ihre Expertise. Ihre Rückmeldungen sind ein zentraler Baustein, um aus diesem Entwurf einen Standard zu machen, der in der Praxis trägt.

Mit freundlichen Grüßen

**Deutsche Gesellschaft für Senologie (DGS)**
**Brustzentrum Charité – Universitätsmedizin Berlin**
**Berlin Institute of Health at Charité (BIH)**

In Zusammenarbeit mit:

- **Prof. Dr. med. Andreas Schneeweiss** — Vorsitzender, Deutsche Gesellschaft für Senologie (DGS)
- **Prof. Dr. med. Wolfgang Janni** — Vertreter Arbeitsgemeinschaft Gynäkologische Onkologie, Deutsche Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)
- **Prof. Dr. med. Markus Wallwiener** — Sprecher Kommission Digitale Medizin, DGGG / Stellvertretender Vorsitzender AGO
- **Prof. Dr. med. Volkmar Müller** — Sprecher Kommission Mamma, Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)
- **Prof. Dr. med. Achim Wöckel** — Leitlinienkoordination S3-Leitlinie Mammakarzinom
- **PD Dr. rer. nat. Christoph Kowalski** — Versorgungsforschung, Deutsche Krebsgesellschaft (DKG)
- **Prof. Dr. med. Dipl.-Ing. Sylvia Thun** — Berlin Institute of Health at Charité (BIH)

---

*Kerndatensatz Senologie – FHIR Implementation Guide v0.9.0 (Draft)*
*Basierend auf der S3-Leitlinie Mammakarzinom v5.0 (AWMF 032-045OL)*
