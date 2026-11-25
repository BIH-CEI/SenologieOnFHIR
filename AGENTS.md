<!-- agents-md: schema 1 | updated 2026-11-16 | checker: ~/.claude/skills/agent-instructions-check -->
# AGENTS.md — SenologieOnFHIR

FHIR R4 Implementation Guide "Kerndatensatz Senologie" (package `kds-senologie`, canonical
https://www.senologie.org/fhir) for breast cancer documentation at certified German breast centres,
built with SUSHI and the HL7 IG Publisher and published bilingually (German source, English
translation). Content belongs to the Deutsche Gesellschaft für Senologie, implemented by BIH; the
profiles derive from the MII modules Onkologie, Patho, Bildgebung and MTB (2027 ballot packages).

## Build, test, validate

```bash
sushi .                                                   # FSH -> fsh-generated/ (checked in)
./_updatePublisher.sh && ./_genonce.sh                    # IG into output/ (CI pins publisher 3.0.0)
docker compose -f docker-compose.matchbox.yaml up -d
./scripts/extractions/test-extraction-snapshot.sh obds    # or oncobox | iqtig | iregg
docker compose -f docker-compose.hapi.yaml up -d hapi
python3 scripts/cql/load-hapi.py http://localhost:8095/fhir && ./scripts/extractions/test-measure-snapshot.sh
ln -sf ../../scripts/pre-commit .git/hooks/pre-commit     # renders .puml and fixes FML syntax on commit
```

## Conventions

- German is the source language in `input/pagecontent/`; English pages live in `input/translations/en/`; the menu is a file (`input/includes/menu.xml`) so it can be translated.
- A release bump touches `sushi-config.yaml` (`version`, `date`), `package.json` and `input/fsh/rulesets/version.fsh` (CRMIDate) together; the IG claims the CRMI profiles.
- Exports are FML maps in `input/maps/` (oBDS, OncoBox, IQTIG 18/1, IRegG); quality indicators are CQL in `input/cql/`; snapshot tests compare against reviewed outputs in `validation/`.

## Guardrails

- Examples in `input/fsh/examples/` are synthetic; never add real patient data.
- Do not edit `fsh-generated/` by hand; SUSHI regenerates it and it is committed.

## Issue tracking

Issue tracking: **beads** (`.beads/` present; the session hook runs `bd prime`; follow the `beads-workflow` skill).

## Where to look

- Repository map, build and test matrix: `README.md`; CI: `.github/workflows/`; profiles `input/fsh/profiles/`, questionnaires `input/fsh/questionnaires/`, value sets `input/fsh/valuesets/`
- Talks, commenting-phase material, design notes: `docs/`; licence and terminology notices: `NOTICE.md`
