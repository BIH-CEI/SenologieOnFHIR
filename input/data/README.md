# External Specifications & Test Data

Externe Schemas und Testdaten für die Ausleitungs-Validierung. **XSDs und XML-Beispiele** sind committed, **Excel-Specs und PDFs gitignored** (proprietär bzw. zu groß).

## Was im Repo ist

```
input/data/
├── 20260110_dotbase_codebook.xlsx     ← intern (Charité)
├── obds-testdaten/
│   ├── oBDS_v3.0.1.xsd                ← XSD (passend zum Testpatient)
│   ├── oBDS_v3.0.5.xsd                ← XSD (aktuelle Spec)
│   ├── Testpatient_Mamma.xml          ← offizielles Beispiel
│   └── Folgepaket_Testpatient_Mamma.xml
├── iregg-schema-v4.1.1/               ← komplett (Master-XSD + Bausteine + Beispiele)
├── iqtig-schema/                      ← IQTIG 2026 V06 (alle XSDs + 18.1-Beispiele)
└── oncobox-brust-2.0/
    ├── oncobox-brust-2.0.xsd          ← XSD
    └── examples/                      ← offizielle XML-Beispiele
```

## Was du lokal nachladen kannst (gitignored, Quellen)

| File | Quelle |
|---|---|
| `oncobox-brust-2.0/oncobox-brust-2.0-spec.xlsx` | https://xml-oncobox.de/de/Home/FuerHersteller → Brust 2.0 → Spezifikation |
| `oncobox-brust-2.0/beispieldatensaetze.xlsx` | https://xml-oncobox.de/de/Home/FuerHersteller → Brust 2.0 → Sample Patient Data |
| `obds-testdaten/Testpatient_Mamma.pdf` | https://basisdatensatz.de/ (Beispiel-Doku) |
| `obds-testdaten/Folgepaket_Testpatient_Mamma.pdf` | dito |
| `iregg-schema-v4.1.1/Dokumentation/*.pdf` | https://implantateregister-deutschland.de/ → Spezifikation V4.1.1 |
| `oncobox-brust/OncoBoxBrust_N1.1.1_Spec.xlsx` | (alt, durch 2.0 ersetzt) |

## Schemas-Update-Skript (TODO)

Bei Spec-Updates: XSDs nachladen, XML-Beispiele aktualisieren. Validierung via:

```bash
./scripts/extractions/validate-external-schemas.sh
```
