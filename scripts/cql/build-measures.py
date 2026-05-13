#!/usr/bin/env python3
"""
Generiert FSH Measure-Instances aus einer einfachen Konfigliste.

Output: input/fsh/measures/measure-s3-qi-<NN>.fsh
"""
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT_DIR = REPO / "input/fsh/measures"

# (QI-Nummer, Bezeichnung, Has-Define-Numerator, Has-Define-Denominator)
S3_QIs = [
    ("02", "Prätherapeutische histologische Sicherung",  "HasQI02Zaehler",  "HasQI02Nenner"),
    ("04", "BET bei DCIS",                                "HasQI04Zaehler",  "HasQI04Nenner"),
    ("06", "BET bei invasivem Mammakarzinom",             "HasQI06Zaehler",  "HasQI06Nenner"),
    ("08", "BET bei pT1",                                 "HasQI08Zaehler",  "HasQI08Nenner"),
    ("09", "Adjuvante endokrine Therapie bei HR+",        "HasQI09Zaehler",  "HasQI09Nenner"),
    ("11", "Trastuzumab bei HER2-positiven Patientinnen", "HasQI11Zaehler",  "HasQI11Nenner"),
    ("12", "Adjuvante Strahlentherapie",                  "HasQI12Zaehler",  "HasQI12Nenner"),
    ("13", "Adjuvante Chemotherapie",                     "HasQI13Zaehler",  "HasQI13Nenner"),
]

TEMPLATE = """// FHIR Measure: S3-QI-{nr}  {desc}
// Auto-generiert von scripts/cql/build-measures.py — bitte dort editieren.

Instance: senologie-measure-s3-qi-{nr}
InstanceOf: Measure
Title: "Senologie Measure S3-QI-{nr}: {desc}"
Description: "{desc} (S3-Leitlinie Mammakarzinom Kapitel 8, QI-{nr})"
Usage: #definition

* url = "https://www.senologie.org/fhir/Measure/senologie-measure-s3-qi-{nr}"
* version = "0.1.0"
* name = "SenologieMeasureS3QI{nr}"
* status = #active
* experimental = false
* date = "2026-05-13"
* publisher = "BIH at Charité — Universitätsmedizin Berlin"
* description = "{desc} — S3 Mammakarzinom QI-{nr}"

* library = "https://www.senologie.org/fhir/Library/QualitaetsindikatorenLeitlinie"
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion
* type = http://terminology.hl7.org/CodeSystem/measure-type#process

* group[+].id = "qi-{nr}-group"
* group[=].population[+].id = "qi-{nr}-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "HasInvasiveOrDCIS"

* group[=].population[+].id = "qi-{nr}-denominator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#denominator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "{denom}"

* group[=].population[+].id = "qi-{nr}-numerator"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#numerator
* group[=].population[=].criteria.language = #text/cql-identifier
* group[=].population[=].criteria.expression = "{num}"
"""


def main():
    for nr, desc, num, denom in S3_QIs:
        fsh = TEMPLATE.format(nr=nr, desc=desc, num=num, denom=denom)
        out = OUT_DIR / f"measure-s3-qi-{nr}.fsh"
        out.write_text(fsh)
        print(f"  → {out.relative_to(REPO)}")


if __name__ == "__main__":
    main()
