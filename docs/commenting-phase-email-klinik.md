# Anschreiben Klinikerinnen und Kliniker (Weiterleitung über DGS/DGGG/AGO)

Alternative, narrativere Fassung der Kommentierungs-Einladung für die Weiterleitung über die Kanäle der Fachgesellschaften. Zielgruppe: klinisch tätige Kolleginnen und Kollegen, weniger technikaffin.

---

## Betreff

Ihr Blick auf den Kerndatensatz Senologie — Kommentierungsphase 4.–31. Mai 2026

---

## E-Mail-Text

Sehr geehrte Damen und Herren,
liebe Kolleginnen und Kollegen,

die Versorgung von Patientinnen mit Mammakarzinom erzeugt an jedem Schritt Daten: in der Klinik, im Brustzentrum, im Pathologielabor, im Krebsregister, im Qualitätsbericht, im Implantatregister, in der Studienakte. Diese Daten existieren — aber sie sind fragmentiert, in unterschiedlichen Formaten gespeichert und kaum miteinander verknüpft. Das Ergebnis: Ärztinnen und Ärzte, Pflegefachpersonen, Dokumentationskräfte, Registerverantwortliche und Forschende dokumentieren dieselben Informationen immer wieder neu — in jeweils eigene Systeme, für jeweils eigene Zwecke. Diese Mehrfachdokumentation kostet täglich wertvolle Zeit, die der Versorgung fehlt. Und die Daten, die dabei entstehen, können ihr volles Potenzial nicht entfalten: für die Qualitätssicherung und die Weiterentwicklung der Versorgung.

Wir sind überzeugt: Das können wir ändern.

Die Deutsche Gesellschaft für Senologie (DGS), die Deutsche Gesellschaft für Gynäkologie und Geburtshilfe (DGGG), die Arbeitsgemeinschaft Gynäkologische Onkologie (AGO), das Brustzentrum der Charité – Universitätsmedizin Berlin und das Berlin Institute of Health at Charité (BIH) laden Sie ein, gemeinsam mit uns diesen Wandel zu gestalten.

### Der Kerndatensatz Senologie — einmal strukturiert erfassen, vielfach nutzen

Wir haben einen gemeinsamen Standard entwickelt, der einem einfachen Prinzip folgt: Die Dokumentation, die ohnehin in der klinischen Versorgung entsteht, wird bereits in der klinischen Routine einmalig strukturiert erfasst — und kann dann ohne weiteren Aufwand automatisch für alle nachgelagerten Zwecke genutzt werden.

Technisch basiert der Kerndatensatz auf HL7 FHIR, dem international führenden Standard für den Datenaustausch im Gesundheitswesen. Er ist kompatibel mit den Vorgaben der Medizininformatik-Initiative (MII), dem deutschen ISiK-Standard und dem entstehenden europäischen Gesundheitsdatenraum (EHDS). Für alle, die nicht im Datenaustausch zu Hause sind: Das bedeutet, dass der Datensatz mit den Systemen spricht, die in deutschen Kliniken bereits vorhanden sind — und sich auch auf europäischer Ebene einbetten lässt.

Aus einer einzigen, strukturierten klinischen Dokumentation können dadurch unterstützt werden:

- Krebsregistermeldung (oBDS v3.0.5)
- Implantateregistermeldung (IRegG V4.1.1)
- IQTIG-Qualitätssicherung (QS-Verfahren 18.1 Mammachirurgie)
- DKG-Zertifizierung Brustzentren (OncoBox Brust)
- Versorgungsforschung und klinische Studien
- Perspektivisch: elektronische Patientenakte (ePA)

Alle Datenpunkte sind mit internationalen Terminologien hinterlegt — SNOMED CT als medizinische Hauptsprache, ergänzt durch LOINC, ICD-10-GM, ICD-O-3 und OPS. Vereinfacht gesagt: Jeder Begriff hat eine eindeutige, maschinenlesbare Bedeutung, sodass verschiedene Systeme dieselben Daten verstehen und nutzen können, ohne manuelle Übersetzung. Wo diese internationalen Systeme noch Lücken haben, werden konkrete Verbesserungsvorschläge an das zuständige nationale Zentrum (BfArM) eingereicht.

Für die klinische Praxis bedeutet das: Strukturierte Erfassungsbögen – sogenannte SDC-Fragebögen – führen durch die Dokumentation und erzeugen dabei automatisch alle Datenpunkte im richtigen Format. Eine Eingabe, konsistente Weiterverwendung in allen Systemen.

Für IT und Datenverantwortliche stehen fertige Übersetzungsregeln (FHIR StructureMaps und ConceptMaps) und Anleitungen für die Anbindung an bestehende Systeme bereit — damit der Kerndatensatz keine Insellösung bleibt.

### Wer steckt dahinter?

Dies ist ein gemeinsames Projekt von

- Deutsche Gesellschaft für Senologie (DGS)
- Deutsche Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)
- Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)
- Brustzentrum Charité – Universitätsmedizin Berlin
- Berlin Institute of Health at Charité (BIH), Center for Digital Health

— entwickelt in enger Zusammenarbeit mit der deutschen Interoperabilitätscommunity aus Klinik, Industrie und Forschung. Der Kerndatensatz hat keinen normativen Charakter, er ist ein gemeinsames Angebot, das kontinuierlich weiterentwickelt wird.

### Jetzt: öffentliche Kommentierungsphase, 4. bis 31. Mai 2026

Version 0.9.0 ist fertig — und bereit für Ihre Rückmeldung. Wir suchen Perspektiven aus allen Bereichen, die mit Daten rund um die Brustversorgung zu tun haben:

- **Klinisch Tätige:** Bildet der Datensatz Ihre Versorgungsrealität vollständig ab? Fehlen Angaben, die bei Ihnen routinemäßig erhoben werden?
- **Registerverantwortliche und Qualitätssicherer:** Sind die vorgesehenen Ableitungen für Krebsregister, IQTIG und DKG-Zertifizierung für Ihre Prozesse anschlussfähig?
- **IT und Informatik:** Passt die technische Umsetzung zu Ihrer Infrastruktur, zu ISiK und den MII-Kerndatensätzen?
- **Forschende:** Sind die Datenstrukturen für Ihre Auswertungs- und Studienbedarfe geeignet?
- **Alle:** Wir haben eine Reihe von Grundsatzentscheidungen bewusst offen gelassen und als „Offene Fragen" dokumentiert — gerade dazu freuen wir uns auf Ihre Einschätzung.

### Zugang

- Implementation Guide: **https://bih-cei.github.io/SenologieOnFHIR/**
- Feedback über GitHub: **https://github.com/BIH-CEI/SenologieOnFHIR/issues**
- Alternativ per E-Mail — wir überführen Rückmeldungen in das öffentliche Tracking

Bitte vermerken Sie bei Kommentaren zu offenen Fragen die jeweilige Kennung (z.B. „OF-3").

Während der Kommentierungsphase finden zwei offene Online-Begleittermine statt, zu denen wir gesondert einladen werden. Im Anschluss werden alle Rückmeldungen in einem Review-Workshop konsolidiert und in die nächste Version eingearbeitet.

### Kontakt

- Für inhaltliche Fragen (klinisch):
  **Dr. med. Therese Pross** — Charité Brustzentrum
  therese.pross@charite.de
- Für technische Fragen (Datenmodell, Terminologie, Schnittstellen):
  **Thomas Debertshäuser** — BIH Center for Digital Health
  thomas.debertshaeuser@charite.de

Ihre Expertise ist der entscheidende Baustein, damit aus diesem Entwurf ein Standard wird, der in der Praxis wirklich trägt. Wir freuen uns auf Ihre Rückmeldung.

Mit freundlichen Grüßen

- Deutsche Gesellschaft für Senologie (DGS)
- Deutsche Gesellschaft für Gynäkologie und Geburtshilfe (DGGG)
- Arbeitsgemeinschaft Gynäkologische Onkologie (AGO)
- Dr. med. Therese Pross — Charité Brustzentrum
- Thomas Debertshäuser — Berlin Institute of Health at Charité (BIH)

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
