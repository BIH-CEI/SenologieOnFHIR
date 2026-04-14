# Anwendungsfälle

Das Senologie-Modul adressiert vier zentrale Anwendungsszenarien entlang der Wertschöpfungskette klinischer Daten:

<div style="display: flex; gap: 1em; flex-wrap: wrap; margin: 1.5em 0;">
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Erfassung</h3>
<p>Formularbasierte Dokumentation am Point of Care über SDC-Questionnaires mit automatischer Extraktion in FHIR-Ressourcen.</p>
<p><a href="anwendungsfaelle-erfassung.html">Mehr &rarr;</a></p>
</div>
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Austausch</h3>
<p>Interoperabler Datentransfer zwischen Klinischen Systemen, Forschungsdatenbanken und übergreifenden Infrastrukturen.</p>
<p><a href="anwendungsfaelle-austausch.html">Mehr &rarr;</a></p>
</div>
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Auswertung</h3>
<p>Sekundärnutzung für Versorgungsforschung, Qualitätssicherung und klinische Studien.</p>
<p><a href="anwendungsfaelle-auswertung.html">Mehr &rarr;</a></p>
</div>
<div style="flex: 1; min-width: 200px; border: 1px solid #ccc; border-radius: 8px; padding: 1em;">
<h3>Meldedatensätze</h3>
<p>Automatisierte Ableitung von Krebsregistermeldungen, Implantatregisterdaten und weiteren regulatorischen Berichten.</p>
<p><a href="anwendungsfaelle-meldedatensaetze.html">Mehr &rarr;</a></p>
</div>
</div>

### Klinischer Kontext

Die Anwendungsfälle orientieren sich am Versorgungspfad eines zertifizierten Brustzentrums:

1. **Erstvorstellung** — Anamnese, klinische Untersuchung, Bildgebung
2. **Diagnostik** — Biopsie, Pathologie, Genexpressionstest
3. **Tumorkonferenz** — Interdisziplinäre Therapieempfehlung
4. **Therapie** — Operation, Systemtherapie, Strahlentherapie
5. **Nachsorge** — Verlaufskontrollen, Komplikationserfassung
6. **Meldung** — Krebsregister, Implantateregister, Qualitätsindikatoren

In jedem Schritt entstehen strukturierte FHIR-Ressourcen, die über die verschiedenen Anwendungsfälle hinweg genutzt werden.

### Akteure

| Akteur | Rolle |
|---|---|
| Brustzentrum | Primäre Datenerfassung und klinische Versorgung |
| Klinisches Informationssystem (KIS) | Datenhaltung und Bereitstellung |
| Datenintegrationszentrum (DIZ) | Datenaufbereitung und Forschungsdatenbereitstellung |
| Klinisches Krebsregister | Empfänger strukturierter Meldungen |
| Implantateregister (DIMDI) | Empfänger von Implantatdaten |
| Forschungsverbund (MII) | Standortübergreifende Sekundärnutzung |
