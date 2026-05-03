# Anwendungsfälle - Kerndatensatz Senologie v0.1.0

* [**Table of Contents**](toc.md)
* **Anwendungsfälle**

## Anwendungsfälle

# Anwendungsfälle

Das Senologie-Modul adressiert vier zentrale Anwendungsszenarien entlang der Wertschöpfungskette klinischer Daten:

### Erfassung

Formularbasierte Dokumentation am Point of Care über SDC-Questionnaires mit automatischer Extraktion in FHIR-Ressourcen.

[Mehr →](anwendungsfaelle-erfassung.md)

### Austausch

Interoperabler Datentransfer zwischen Klinischen Systemen, Forschungsdatenbanken und übergreifenden Infrastrukturen.

[Mehr →](anwendungsfaelle-austausch.md)

### Auswertung

Sekundärnutzung für Versorgungsforschung, Qualitätssicherung und klinische Studien.

[Mehr →](anwendungsfaelle-auswertung.md)

### Meldedatensätze

Automatisierte Ableitung von Krebsregistermeldungen, Implantatregisterdaten und weiteren regulatorischen Berichten.

[Mehr →](anwendungsfaelle-meldedatensaetze.md)

### Klinischer Kontext

Die Anwendungsfälle orientieren sich am Versorgungspfad eines zertifizierten Brustzentrums:

1. **Erstvorstellung**— Anamnese, klinische Untersuchung, Bildgebung
1. **Diagnostik**— Biopsie, Pathologie, Genexpressionstest
1. **Tumorkonferenz**— Interdisziplinäre Therapieempfehlung
1. **Therapie**— Operation, Systemtherapie, Strahlentherapie
1. **Nachsorge**— Verlaufskontrollen, Komplikationserfassung
1. **Meldung**— Krebsregister, Implantateregister, Qualitätsindikatoren

In jedem Schritt entstehen strukturierte FHIR-Ressourcen, die über die verschiedenen Anwendungsfälle hinweg genutzt werden.

### Akteure

| | |
| :--- | :--- |
| Brustzentrum | Primäre Datenerfassung und klinische Versorgung |
| Klinisches Informationssystem (KIS) | Datenhaltung und Bereitstellung |
| Datenintegrationszentrum (DIZ) | Datenaufbereitung und Forschungsdatenbereitstellung |
| Klinisches Krebsregister | Empfänger strukturierter Meldungen |
| Implantateregister (DIMDI) | Empfänger von Implantatdaten |
| Forschungsverbund (MII) | Standortübergreifende Sekundärnutzung |

