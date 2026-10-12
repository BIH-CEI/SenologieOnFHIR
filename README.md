# Kerndatensatz Senologie (Senology Core Dataset)

A FHIR R4 Implementation Guide for the structured documentation of breast cancer
care at certified breast centres in Germany. The idea is to document once, coded
at the point of care, and to derive every report from that one record: cancer
registry, certification, quality assurance and implant registry.

- **Implementation Guide, English:** <https://bih-cei.github.io/SenologieOnFHIR/ci-build/en/index.html>
- **Implementation Guide, German:** <https://bih-cei.github.io/SenologieOnFHIR/ci-build/de/index.html>
- **Released versions:** <https://bih-cei.github.io/SenologieOnFHIR/> (redirects to the latest release)
- **Canonical:** `https://www.senologie.org/fhir`
- **Package:** `kds-senologie`, version 0.10.0
- **Status:** draft. Public commenting ran in May 2026; version 1.0 is in preparation.

The guide is written in German, because its first audience are German breast
centres and their reporting duties, and it is published in German and English
side by side; a language switch sits in the top right corner of every page. The
English pages are a translation (`input/translations/en`); where a page or an
artefact description has no translation yet, the German text is shown. For a
quick start, the English site has a one-page
[summary](https://bih-cei.github.io/SenologieOnFHIR/ci-build/en/english-summary.html)
that also explains the German reporting context.

Deutsch: Der Leitfaden ist zweisprachig veröffentlicht; die deutsche Fassung
beginnt [hier](https://bih-cei.github.io/SenologieOnFHIR/ci-build/de/index.html).

## Who is behind it

The dataset belongs to the German Society for Senology (Deutsche Gesellschaft
für Senologie, DGS), which holds the rights. Its content was curated with the
professional societies: DGS, the German Society for Gynaecology and Obstetrics
(DGGG) and the Working Group for Gynaecological Oncology (AGO).

The Berlin Institute of Health at Charité (BIH), Digital Medicine and
Interoperability, did the terminology mapping and the technical implementation
and provides the guide and this repository on behalf of the DGS.

## What is in the repository

| Part | Where | What it does |
|---|---|---|
| Profiles, extensions, value sets | `input/fsh/` | The data model, written in FHIR Shorthand. 15 of the 36 profiles derive from the German national core dataset (MII Oncology, Pathology, Molecular Tumour Board, Imaging). |
| Forms | `input/fsh/questionnaires/` | 11 SDC questionnaires for the care pathway. Each form carries templates that create and update FHIR resources on extraction. |
| Export maps | `input/maps/` | 31 FHIR Mapping Language maps that turn the record into four reports: oBDS (cancer registry), OncoBox Brust (DKG certification), IQTIG 18/1 (quality assurance) and IRegG (implant registry). |
| Quality indicators | `input/cql/` | Indicators from the German S3 guideline and certification, written in CQL and run on the same record. |
| Example patients | `input/fsh/examples/` | 17 synthetic patients covering different pathways. No real patient data. |
| Pages | `input/pagecontent/` | The narrative of the guide in German, with the English translation in `input/translations/en/`. The menu is kept as files (`input/includes/menu.xml` and its English counterpart) so that it can be translated. |
| Tests | `validation/`, `scripts/` | Snapshot tests for the exports and the quality indicators. |

Terminology: SNOMED CT and LOINC for clinical meaning, next to the code systems
the registries require (ICD-10-GM, OPS, ICD-O-3, UICC TNM).

## Build

Requirements: Node.js with [SUSHI](https://fshschool.org/docs/sushi/) 3.x, Java 17
or newer, and the HL7 IG Publisher (CI pins version 3.0.0).

```bash
npm install -g fsh-sushi
sushi .                    # FSH -> FHIR resources in fsh-generated/
./_updatePublisher.sh      # downloads publisher.jar
./_genonce.sh              # builds the guide into output/
```

`fsh-generated/` is checked in, so the resources can be used without building.

## Tests

Three GitHub Actions workflows run when the relevant files change:

| Workflow | What it checks | Engine |
|---|---|---|
| Test Extractions | The four exports for the example patients against reviewed snapshots | Matchbox |
| Test CQL Measures | The quality indicators against reviewed snapshots | HAPI FHIR with Clinical Reasoning |
| Audit ValueSet Codes | The codes in the value sets against a terminology server | Ontoserver |

To run them locally:

```bash
docker compose -f docker-compose.matchbox.yaml up -d
./scripts/extractions/test-extraction-snapshot.sh obds      # or oncobox, iqtig, iregg

docker compose -f docker-compose.hapi.yaml up -d hapi
python3 scripts/cql/load-hapi.py http://localhost:8095/fhir
./scripts/extractions/test-measure-snapshot.sh
```

Form extraction (SDC `$extract` with templates) is tested against Aidbox, which
is the only engine we found that implements template-based extraction.

## Feedback

Comments, questions and corrections are welcome as
[GitHub issues](https://github.com/BIH-CEI/SenologieOnFHIR/issues). Known
limitations are listed in the guide under "Bekannte Fehler" and "Offene Fragen".

Contact: Thomas Debertshäuser, BIH at Charité,
<thomas.debertshaeuser@charite.de>

## Licence

© Deutsche Gesellschaft für Senologie (DGS). Provided by the Berlin Institute
of Health at Charité (BIH).

The content of this repository is licensed under
[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
See [LICENSE](LICENSE). Suggested attribution: "Kerndatensatz Senologie,
Deutsche Gesellschaft für Senologie (DGS), provided by BIH at Charité, CC BY 4.0".

### Third-party standards and terminologies

The licence above does not cover the standards and terminologies the guide
builds on. The full notices are in [NOTICE.md](NOTICE.md); in short:

- **HL7 FHIR:** HL7® and FHIR® are registered trademarks of Health Level Seven
  International. The FHIR specification is published under CC0.
- **SNOMED CT:** includes SNOMED Clinical Terms® (SNOMED CT®), used by
  permission of SNOMED International. Implementers need a SNOMED CT Affiliate
  Licence; in Germany it is issued free of charge through the BfArM.
- **LOINC:** contains content from LOINC® (<https://loinc.org>), copyright ©
  Regenstrief Institute, Inc. and the LOINC Committee, available at no cost
  under the licence at <https://loinc.org/license>.
- **Others:** ICD-10-GM and OPS (BfArM), ICD-O-3 (WHO), UICC TNM, BI-RADS® (ACR),
  and the reporting specifications oBDS, OncoBox, IQTIG and IRegG remain under
  the terms of their owners.
